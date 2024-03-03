import os
import secrets


class Config(object):
    SECRET_KEY = os.getenv('SECRET_KEY', secrets.token_hex(16))
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'sqlite:////app/app.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    UPLOAD_FOLDER = '/app/uploads/'
    MAX_CONTENT_LENGTH = 4 * 1024 * 1024  # 4 MB limit
    ALLOWED_EXTENSIONS = {'zip'}
    ADMIN_PASSWORD = secrets.token_hex(16)
