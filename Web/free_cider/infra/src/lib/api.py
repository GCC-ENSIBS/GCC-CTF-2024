#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-03

from app import app
from flask import request, session
from lib.database import User
from lib.bot import visit_endpoint

@app.route('/api/v1/register', methods=['POST'])
def register():
    return {"message": "Registration is disabled at the moment."}, 403

@app.route('/api/v1/login', methods=['POST'])
def login():
    try:
        username = request.json.get('username')
        password = request.json.get('password')
    except:
        return {"message": "Invalid request."}, 400
    user = User.query.filter_by(username=username).first()
    if user is None:
        return {"message": "User not found."}, 404
    if user.check_password(password):
        session['authenticated'] = True
        session['status'] = 'admin' if user.status else 'user'
        return {"message": "Login successful."}, 200
    else:
        return {"message": "Invalid credentials."}, 401

@app.route('/api/v1/reset-password', methods=['POST'])
def reset_password():
    try:
        username = request.json.get('username')
    except:
        return {"message": "Invalid request."}, 400
    user = User.query.filter_by(username=username).first()
    if user is None:
        return {"message": "User not found."}, 404
    else:
        token = user.reset_pw_token
        host = request.headers.get('Host')
        if host is None or host.startswith("localhost"):
            return {"message": "Couldn't generate reset request for the provided Host."}, 400
        visit_endpoint(f"http://{host}/reset?token={token}")
        return {"success": True, "message": f"Password reset link has been sent to {user.mail}"}, 200

@app.route('/api/v1/user/<int:user_id>', methods=['GET'])
def user(user_id):
    if user_id is None:
        return {"message": "User not found."}, 404
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return {"message": "User not found."}, 404
    return {"username": user.username, "id": user.id, "admin": user.status}, 200