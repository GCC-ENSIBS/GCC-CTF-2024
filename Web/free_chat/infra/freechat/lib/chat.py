#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-20

from app import app 
from flask import request, render_template
from flask_login import login_required, current_user
from lib.database import db, Chats

@app.route('/chat', methods=['GET', 'POST'])
@login_required
def chat():
    if request.method == 'POST':
        message = request.form['message']
        chat = Chats(author=current_user.username, message=message)
        db.session.add(chat)
        db.session.commit()
        return render_template('chat.html', chats=Chats.query.all())
    else:
        return render_template('chat.html', chats=Chats.query.all())




