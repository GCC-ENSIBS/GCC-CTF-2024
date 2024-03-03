#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-20

from app import app 
from flask import request, redirect, url_for
from lib.database import db, User
from flask_login import login_user, login_required, current_user, logout_user

@app.route('/login', methods=['POST'])
def login():
    try:
        username = request.json['username']
        password = request.json['password']
    except:
        return {'message': 'Invalid request'}, 400
    user = User.query.filter_by(username=username).first()
    if user is None:
        return {'message': 'Invalid username'}, 401
    if user.check_password(password):
        login_user(user)
        return {'message': 'Logged in successful'}, 200
    else:
        return {'message': 'Invalid password'}, 401

@app.route('/register', methods=['POST'])
def register():
    try:
        username = request.json['username']
        password = request.json['password']
        passwordRepeat = request.json['repeatPassword']
    except:
        return {'message': 'Invalid request'}, 400
    user = User.query.filter_by(username=username).first()
    if user is not None:
        return {'message': 'Username already exists'}, 404
    if password != passwordRepeat:
        return {'message': 'Passwords do not match'}, 401
    user = User(username=username, password=password)
    user.set_password(password)
    db.session.add(user)
    db.session.commit()
    return {'message': 'User created'}, 200

@app.route('/logout', methods=['GET'])
@login_required
def logout():
    logout_user()
    return redirect(url_for('index'))