#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author            : Mika - @bWlrYQ
# Created           : 2024-02-20

from flask import Flask, render_template, redirect, url_for, send_file
from flask_login import LoginManager, login_required, current_user
from secrets import token_hex
from lib.database import db, User, fill_chats, Locked
from os import system

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.db'
app.config['SECRET_KEY'] = token_hex(64)
app.config['MAX_CONTENT_LENGTH'] = 16 * 1000 * 1000

db.init_app(app)
login_manager = LoginManager()
login_manager.init_app(app)

with app.app_context():
    db.create_all()
    if Locked.query.first() is None:
        db.session.add(Locked(locked=True))
        fill_chats()

@login_manager.user_loader
def load_user(user_id):
    return db.session.get(User, int(user_id))

@app.route('/', methods=['GET'])
def index():
    if current_user.is_authenticated:
        return redirect(url_for('chat'))
    else:
        return render_template('index.html')

@app.route('/pfp', methods=['GET'])
@login_required
def pfp():
    try:
        name = request.args.get('name')
    except:
        return "Invalid request", 400
    try:
        return send_file(f'pfp/{name.replace("../", "")}')
    except:
        return f"Couldn't find {name.replace('../', '')}, hecker !", 400

from lib.accounts import *
from lib.chat import *
from lib.settings import *

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, threaded=True)