#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-03

from app import app
from flask import session
from secrets import token_hex

@app.context_processor
def prepare_context():
    session['nonce'] = token_hex(16)
    return dict(nonce=session['nonce'])

@app.after_request
def add_header(response):
    response.headers['X-Frame-Options'] = 'DENY'
    #response.headers['Content-Security-Policy'] = f"default-src 'self' http://www.w3.org data:; style-src 'self' 'unsafe-inline'; script-src 'strict-dynamic' 'nonce-{session['nonce']}' 'unsafe-inline' http: https:; base-uri 'none'; object-src 'none';"
    response.headers['Referrer-Policy'] = 'no-referrer'
    return response