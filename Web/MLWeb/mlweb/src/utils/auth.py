from flask import session, redirect, url_for, flash, request
from functools import wraps

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            flash("You need to be logged in to access this page.", "danger")
            return redirect(url_for('bp_auth.login', next=request.url))
        return f(*args, **kwargs)
    return decorated_function

def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            flash("You need to be logged in to access this page.", "danger")
            return redirect(url_for('bp_auth.login', next=request.url))
        if session['user_id'] != 1:
            flash("You need to be an admin to access this page.", "danger")
            return redirect(url_for('bp_user.home'))
        return f(*args, **kwargs)
    return decorated_function
