from datetime import datetime

from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

class UserModel(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(32), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    last_login = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    register_date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

class OptimizedModel(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    file_path = db.Column(db.String(100))
    upload_date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('user_model.id'))
