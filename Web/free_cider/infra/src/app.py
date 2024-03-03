#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-03

from flask import Flask, render_template, request, redirect, url_for, session
from secrets import token_hex
from lib.database import fill_database, db, User
from faker import Faker

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.db'
app.config['SECRET_KEY'] = token_hex(32)

db.init_app(app)
with app.app_context():
    db.create_all()
    fill_database()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/reset', methods=['GET'])
def change_password():
    if request.args.get('token'):
        token = request.args.get('token')
        user_to_reset = User.query.filter_by(reset_pw_token=token).first()
        if user_to_reset is not None:
            new_password = Faker().password(length=25, special_chars=True, digits=True, upper_case=True, lower_case=True)
            user_to_reset.set_reset_pw_token()
            user_to_reset.set_password(new_password)
            db.session.commit()
            return render_template('change_password.html', new_password=new_password, user=user_to_reset.username)
        else:
            return render_template('change_password.html', invalid_token=True)
    else:
        return redirect(url_for('index'))

@app.route('/panel', methods=['GET'])
def panel():
    if not 'authenticated' in session:
        session['authenticated'] = False
    if session['authenticated']:
        if session['status'] == 'admin':
            return render_template('panel.html', flag=open('./flag.txt').read(), showFlag=True)
        else:
            return render_template('panel.html', flag=open('./flag.txt').read(), showFlag=False)
    return redirect(url_for('index'))

@app.route('/logout', methods=['GET'])
def logout():
    session['authenticated'] = False
    session['status'] = None
    return redirect(url_for('index'))

from lib.api import *
from lib.swagger import *
from lib.glob import *

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, threaded=True, debug=False)