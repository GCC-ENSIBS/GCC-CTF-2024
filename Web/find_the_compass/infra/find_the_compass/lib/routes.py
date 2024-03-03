#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ

from find_the_compass import app
from flask import render_template, session, request, url_for, redirect, send_from_directory
from find_the_compass.lib.database import User, Reminder, db
from find_the_compass.lib.utils import authorized
from find_the_compass.lib.remindersRenderer import Renderer
from find_the_compass.lib.utils import COMPASS

@app.route('/', methods=['GET'])
def index():
    if authorized():
        return redirect(url_for('panel'))
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    try:
        username = request.json.get('username')
        password = request.json.get('password')
    except:
        return {"message": "Invalid request."}, 400
    user = User.query.filter_by(username=username).first()
    if user is None:
        return {"message": "User not found."}, 404
    if user.check_password(password):
        session['logged_in'] = True
        session['status'] = user.status
        session['username'] = user.username
        return {"message": "Login successful."}, 200
    else:
        return {"message": "Invalid credentials."}, 401

@app.route('/logout', methods=['GET'])
def logout():
    session['logged_in'] = False
    session['status'] = 'guest'
    session.pop('username', None)
    return redirect(url_for('index'))

@app.route('/panel', methods=['GET'])
def panel():
    if not authorized():
        return redirect(url_for('index'))
    reminders = Reminder.query.all()
    reminders_list = []
    # If a wise admin needs the coordinates of the compass, he can retrieve them.
    renderer = Renderer(COMPASS['COORDINATES'])
    for reminder in reminders:
        reminders_list.append([reminder.id, renderer.render(reminder.author.username , reminder.content)])
    return render_template('panel.html', reminders=reminders_list)

@app.route('/reminder', methods=['POST', 'GET'])
def reminder():
    if not authorized():
        return redirect(url_for('index'))
    if request.method == 'POST':
        try:
            reminder_content = request.json.get('reminder_content')
        except:
            return {"message": "Invalid request."}, 400
        if not authorized():
            return {"message": "Unauthorized."}, 401
        user = User.query.filter_by(username=session['username']).first()
        if user:
            try:
                reminder = Reminder(reminder_content, user)
                db.session.add(reminder)
                db.session.commit()
                return {"message": "Reminder added."}, 200
            except Exception as e:
                print(e)
                return {"message": "Error adding reminder."}, 500
        else:
            return {"message": "User not found."}, 404
    elif request.method == 'GET':
        if not authorized():
            return redirect(url_for('index'))
        if request.args.get('delete'):
            reminder_id = request.args.get('delete')
            reminder = Reminder.query.filter_by(id=reminder_id).first()
            if reminder:
                db.session.delete(reminder)
                db.session.commit()
                return redirect(url_for('panel'))
            else:
                return redirect(url_for('panel'))
    
@app.route('/sources')
def sources():
    return send_from_directory('static', 'ftc.zip')