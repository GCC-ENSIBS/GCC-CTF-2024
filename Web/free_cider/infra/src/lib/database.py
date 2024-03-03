#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-03

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from uuid import uuid4
from faker import Faker
from random import randint

db = SQLAlchemy()

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    mail = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(), nullable=False)
    reset_pw_token = db.Column(db.String(), nullable=False)
    status = db.Column(db.Boolean, nullable=False, default=False)

    def __init__(self, username, mail, password, status):
        self.username = username
        self.mail = mail
        self.password = generate_password_hash(password)
        self.reset_pw_token = str(uuid4())
        self.status = status

    def check_password(self, password):
        return check_password_hash(self.password, password)
    
    def set_password(self, password):
        self.password = generate_password_hash(password)

    def set_reset_pw_token(self):
        self.reset_pw_token = str(uuid4())

def fill_database():
    statement = text(f'DELETE FROM {User.__tablename__}')
    db.session.execute(statement)
    fake = Faker()
    for i in range(0, randint(34, 50)):
        name = fake.name().lower().replace(' ', '_')+str(randint(10, 200))
        mail = fake.email()
        password = fake.password(length=25, special_chars=True, digits=True, upper_case=True, lower_case=True)
        status = True if i == 8 or i == 23 or i == 30 else False
        user = User(name, mail, password, status)
        db.session.add(user)
    db.session.commit()

