from datetime import datetime

from flask import Blueprint, session, redirect, url_for, flash, request, render_template
from werkzeug.security import generate_password_hash, check_password_hash

from utils.models import db, UserModel

bp_auth = Blueprint('bp_auth', __name__)


@bp_auth.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if not username or not password:
            flash("Username or password can't be empty", "danger")
            return redirect(url_for('bp_auth.register'))

        if UserModel.query.filter_by(username=username).first():
            flash("Username already exists", "danger")
            return render_template('register.html')

        hashed_password = generate_password_hash(password)

        new_user = UserModel(username=username, password=hashed_password)
        db.session.add(new_user)
        db.session.commit()

        session['user_id'] = new_user.id
        flash("You have been registered", "success")
        return redirect(url_for('bp_user.home'))

    return render_template('register.html')

@bp_auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        user = UserModel.query.filter_by(username=username).first()
        if not user or not check_password_hash(user.password, password):
            flash("Invalid username or password", "danger")
            return render_template('login.html')

        user.last_login = datetime.utcnow()
        db.session.commit()

        session['user_id'] = user.id
        flash("You have been logged in", "success")
        return redirect(url_for('bp_user.home'))
    return render_template('login.html')

@bp_auth.route('/logout')
def logout():
    session.pop('user_id', None)
    flash("You have been logged out.", "success")
    return redirect(url_for('bp_auth.login'))
