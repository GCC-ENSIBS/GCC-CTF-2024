#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-20

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash

db = SQLAlchemy()

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(), nullable=False)
    pfp_path = db.Column(db.String(100), default='default.png')

    def __init__(self, username, password):
        self.username = username
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)
    
    def set_password(self, password):
        self.password = generate_password_hash(password)


class Chats(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    author = db.Column(db.String(100), nullable=False)
    message = db.Column(db.String(1000), nullable=False)

    def __init__(self, author, message):
        self.author = author
        self.message = message

class Locked(db.Model):
    locked = db.Column(db.Boolean, primary_key=True, default=False)

    def __init__(self, locked):
        self.locked = locked
        
def fill_chats():
    db.session.add(Chats(author='superadmin', message='finally; the chat is working!'))
    db.session.add(Chats(author='admin', message='haha, yeah!'))
    db.session.add(Chats(author='testor123', message='test message'))
    db.session.add(Chats(author='testor123', message='let\'s go admins! well done'))
    db.session.add(Chats(author='admin', message='thanks!'))
    db.session.add(Chats(author='superadmin', message='yeah, thanks! for now it\'s not very aesthetic nor practical, but it works!'))
    db.session.commit()