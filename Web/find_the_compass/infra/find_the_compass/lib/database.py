#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from werkzeug.security import generate_password_hash, check_password_hash
from secrets import token_hex
from sqlalchemy.orm import relationship

db = SQLAlchemy()

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(), unique=True, nullable=False)
    mail = db.Column(db.String(), unique=True, nullable=False)
    password = db.Column(db.String(), nullable=False)
    status = db.Column(db.String(), nullable=False, default='guest')
    reminders = relationship("Reminder", back_populates="author")

    def __init__(self, username, mail, password, status):
        self.username = username
        self.mail = mail
        self.password = generate_password_hash(password)
        self.status = status

    def check_password(self, password):
        return check_password_hash(self.password, password)
    
    def set_password(self, password):
        self.password = generate_password_hash(password)

class Reminder(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    content = db.Column(db.String(), nullable=False)
    author_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    author = relationship("User", back_populates="reminders")

    def __init__(self, content, author):
        self.content = content
        self.author = author

def fill_database():
    statement = text(f'DELETE FROM {User.__tablename__}')
    db.session.execute(statement)
    password = token_hex(64)
    print("[+] Admin password: ", password)
    db.session.add(User('admin', 'admin@compass.local', password, 'admin'))
    db.session.commit()