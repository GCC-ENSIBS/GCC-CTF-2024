#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ

from find_the_compass import app 
from flask import session 
from secrets import token_hex

@app.before_request
def before_request():
    if not session.get('status'):
        session['status'] = 'guest'
    if not session.get('logged_in'):
        session['logged_in'] = False
    session['nonce'] = token_hex(32)

@app.context_processor
def inject_vars():
    return dict(nonce=session['nonce'], status=session['status'])

@app.after_request
def add_header(response):
    response.headers['X-Frame-Options'] = 'DENY'
    response.headers['Content-Security-Policy'] = f"default-src 'self' http://www.w3.org data:; style-src 'self' 'unsafe-inline'; script-src 'strict-dynamic' 'nonce-{session['nonce']}' 'unsafe-inline' http: https:; base-uri 'none'; object-src 'none';"
    response.headers['Referrer-Policy'] = 'no-referrer'
    return response