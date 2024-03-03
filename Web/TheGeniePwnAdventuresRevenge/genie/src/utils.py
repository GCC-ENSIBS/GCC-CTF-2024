#/usr/bin/env python3
# encoding : utf-8


from secrets import token_hex

from db import Users


def create_cookie():
    cookie = token_hex(16)
    return cookie


def is_admin(cookie):
    user = Users.query.filter_by(authorization_cookie=cookie).first()
    if user.is_admin:
        return True
    return False
