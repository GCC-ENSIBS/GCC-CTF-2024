#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.9
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-20

from app import app 
from flask import request, render_template
from flask_login import login_required, current_user
from lib.database import db, User
from uuid import uuid4
from requests import get
from base64 import b64encode

@app.route('/settings', methods=['GET', 'POST'])
@login_required
def settings():
    if request.method == 'POST':
        try:
            new_username = request.form['username']
        except:
            return render_template('settings.html', current_user=current_user, error="Invalid username")
        if User.query.filter_by(username=new_username).first() is not None:
            return render_template('settings.html', current_user=current_user, error="Username already taken")
        current_user.username = new_username
        db.session.commit()
        return render_template('settings.html', current_user=current_user, success="Username changed")
    else:
        return render_template('settings.html', current_user=current_user)
    
@app.route('/profilePicture', methods=['GET', 'POST'])
@login_required
def profilePicture():
    if request.method == 'POST':
        try:
            if request.files['picture']:
                picture = request.files['picture']
                if picture and allowed_file(picture.filename):
                    uuid = str(uuid4())
                    picture.save(f'pfp/{uuid}.png')
                    current_user.pfp_path = f'{uuid}.png'
                    db.session.commit()
                    return render_template('profilePicture.html', current_user=current_user, success="Profile picture changed")
                else:
                    return render_template('profilePicture.html', current_user=current_user, error="Invalid file")
        except:
            pass
        try:
            if request.form['remote_link']:
                remote_link = request.form['remote_link']
                if remote_link.startswith('http://pbs.twimg.com') or remote_link.startswith('https://pbs.twimg.com'):
                    pass
                else:
                    return render_template('profilePicture.html', current_user=current_user, error="The link must start with Twitter's http(s)://pbs.twimg.com domain (specific partneship with their CDN).") 
                try:
                    picture = get(remote_link, timeout=5)
                    return render_template('profilePicture.html', current_user=current_user, result=b64encode(picture.content).decode('utf-8'), link=remote_link)
                except:
                    return render_template('profilePicture.html', current_user=current_user, error="Couldn't access the link")
        except:
            pass

        try:
            if request.form['link']:
                remote_link = request.form['link']
                if remote_link.startswith('http://pbs.twimg.com') or remote_link.startswith('https://pbs.twimg.com'):
                    pass
                else:
                    return render_template('profilePicture.html', current_user=current_user, error="The link must start with Twitter's http(s)://pbs.twimg.com domain (specific partneship with their CDN).") 
                try:
                    picture = get(remote_link, timeout=5)
                except:
                    return render_template('profilePicture.html', current_user=current_user, error="Couldn't get the picture")
                if picture:
                    uuid = str(uuid4())
                    try:
                        with open(f'pfp/{uuid}.png', 'wb') as f:
                            f.write(picture.content)
                        current_user.pfp_path = f'{uuid}.png'
                        db.session.commit()
                        return render_template('profilePicture.html', current_user=current_user, success="Profile picture changed")
                    except:
                        return render_template('profilePicture.html', current_user=current_user, error="Couldn't save the picture")
        except:
            pass
        return render_template('profilePicture.html', current_user=current_user, error="Invalid request")

    else:
        return render_template('profilePicture.html', current_user=current_user)
    
def allowed_file(filename):
    extensions = ["png"]
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in extensions