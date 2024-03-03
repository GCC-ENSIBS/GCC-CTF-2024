#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-21

from flask import Flask, render_template, request

app = Flask(__name__)

FLAG = open('flag.txt', 'r').read()
ACCESS_TOKEN = open('access_token.txt', 'r').read()

@app.route('/')
def index():
    if request.args.get('token'):
        if request.args.get('token') == ACCESS_TOKEN:
            return render_template('index.html', token=True, flag=FLAG)
        else:
            return render_template('index.html')
        
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)