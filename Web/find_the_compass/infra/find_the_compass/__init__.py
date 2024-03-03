#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ

from flask import Flask
from find_the_compass.lib.utils import generate_key
from find_the_compass.lib.database import db, fill_database

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.db'
app.config['SECRET_KEY'] = generate_key()
app.config['SESSION_COOKIE_HTTPONLY'] = True
app.config['SESSION_COOKIE_SAMESITE'] = 'Lax'

db.init_app(app)
with app.app_context():
    db.create_all()
    fill_database()

from find_the_compass.lib.glob import *
from find_the_compass.lib.routes import *