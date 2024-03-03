from flask import Blueprint, session, redirect, url_for, flash
from hummingbird.ml import load

from utils.auth import admin_required
from utils.models import OptimizedModel


bp_admin = Blueprint('admin', __name__)


@bp_admin.route('/model/load/<int:model_id>', methods=['GET'])
@admin_required
def load_model(model_id):
    model = OptimizedModel.query.filter_by(id=model_id, user_id=session['user_id']).first()
    if not model:
        flash("Model not found", "danger")
        return redirect(url_for('bp_user.list_models'))

    try:
        load(model.file_path)
        flash("Model successfully loaded", "success")
    except Exception as e:
        flash("Error loading model: {}".format(e), "danger")

    return redirect(url_for('bp_user.list_models'))