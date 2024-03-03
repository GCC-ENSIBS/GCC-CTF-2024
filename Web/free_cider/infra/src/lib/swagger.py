#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-03

from flask_swagger_ui import get_swaggerui_blueprint
from flask import redirect, url_for
from app import app

SWAGGER_URL = '/api/v1/swagger.json'
API_URL = '/static/swagger.json'
SWAGGER_BLUEPRINT = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': "GCC API"
    }
)

app.register_blueprint(SWAGGER_BLUEPRINT, url_prefix=SWAGGER_URL)