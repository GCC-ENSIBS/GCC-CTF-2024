import os
from datetime import datetime, timedelta

from flask import Blueprint, session, redirect, url_for, flash, request, render_template, jsonify, current_app
from werkzeug.utils import secure_filename

from utils.auth import login_required
from utils.utils import check_allowed_extensions
from utils.models import db, UserModel, OptimizedModel
from utils.bot import visit_url


bp_user = Blueprint('bp_user', __name__)

@bp_user.route('/')
@login_required
def home():
    return render_template('home.html')

@bp_user.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@bp_user.route('/files')
@login_required
def list_models():    
    models = OptimizedModel.query.filter_by(user_id=session['user_id']).all()
    return render_template('files.html', models=models)

@bp_user.route('/upload', methods=['GET', 'POST'])
@login_required
def upload_model():
    if request.method == 'POST':
        if 'file' not in request.files:
            flash("Please select a file to upload", "danger")
            return redirect(url_for('bp_user.upload_model'))

        file = request.files['file']
        if file.filename == '' or not check_allowed_extensions(file.filename):
            flash("Please use a valid file and filename", "danger")
            return redirect(url_for('bp_user.upload_model'))

        filename = secure_filename(file.filename)
        file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)

        model = OptimizedModel(name=file.filename, file_path=file_path, user_id=session['user_id'])
        db.session.add(model)
        db.session.commit()
        flash("File successfully uploaded", "success")
        return redirect(url_for('bp_user.upload_model'))

    return render_template('upload.html')

@bp_user.route('/profile')
@login_required
def my_profile():
    user = UserModel.query.filter_by(id=session['user_id']).first()
    return render_template('profile.html', user=user)

@bp_user.route('/profile/<int:user_id>')
@login_required
def view_profile(user_id):
    user = UserModel.query.filter_by(id=user_id).first()
    if not user:
        flash("User not found.", "danger")
        return redirect(url_for('bp_user.home'))

    return render_template('view_profile.html', user=user)

@bp_user.route('/profile/visit')
@login_required
def visit_profile():
    user_id = int(request.args.get('user_id', session['user_id']))
    visit_url(f"/profile/{user_id}")

    flash("Bot successfully reported", "success")
    return redirect(url_for('bp_user.view_profile', user_id=user_id))

@bp_user.route('/profile/<string:username>/is_logged', methods=['GET'])
def is_logged(username):
    user = UserModel.query.filter_by(username=username).first()
    if not user:
        return jsonify({'is_logged': False})

    is_logged = user.last_login > datetime.utcnow() - timedelta(minutes=3)
    return jsonify({'is_logged': is_logged})

@bp_user.route('/model/edit/<int:model_id>', methods=['GET', 'POST'])
@login_required
def edit_model(model_id):
    model = OptimizedModel.query.filter_by(id=model_id, user_id=session['user_id']).first()

    if not model:
        flash("You don't have permission to edit this model.", "danger")
        return redirect(url_for('bp_user.home'))

    if request.method == 'POST':
        name = request.form.get('name')

        if not name or not check_allowed_extensions(name):
            flash("Name can't be empty and must be valid", "danger")
            return redirect(url_for('bp_user.edit_model', model_id=model_id))

        model.name = name
        db.session.commit()
        return redirect(url_for('bp_user.list_models'))

    return render_template('edit_model.html', model=model)

@bp_user.route('/model/delete/<int:model_id>', methods=['GET'])
@login_required
def delete_model(model_id):
    model = OptimizedModel.query.filter_by(id=model_id, user_id=session['user_id']).first()
    if not model:
        flash("You don't have permission to delete this model", "danger")
        return redirect(url_for('bp_user.list_models'))

    os.remove(model.file_path)
    db.session.delete(model)
    db.session.commit()
    flash("Model successfully deleted", "success")
    return redirect(url_for('bp_user.list_models'))