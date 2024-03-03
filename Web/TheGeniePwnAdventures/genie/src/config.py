#/usr/bin/env python3
# encoding : utf-8


import os
import secrets

from werkzeug.security import generate_password_hash


class Config(object):
    SQLALCHEMY_DATABASE_URI = "sqlite:////app/app.db"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.getenv('SECRET_KEY', secrets.token_hex(16))
    ADMIN_PASSWORD = secrets.token_hex(16)
    ADMIN_PASSWORD_HASH = generate_password_hash(ADMIN_PASSWORD)
    FLAG = os.getenv("FLAG", "GCC{FakeFlag}")
