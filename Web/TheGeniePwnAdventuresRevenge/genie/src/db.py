#/usr/bin/env python3
# encoding : utf-8

from datetime import datetime

from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()


class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(32), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    authorization_cookie = db.Column(db.String(16), nullable=True)
    authentication_cookie = db.Column(db.String(16), nullable=True)
    is_admin = db.Column(db.Boolean, default=False, nullable=False)

class Messages(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    source_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    destination_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    content = db.Column(db.String(512), nullable=False)
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
