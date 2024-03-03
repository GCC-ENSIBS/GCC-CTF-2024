#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ

from time import time 
from random import randint 
from string import digits
from flask import session

COMPASS = {
    # Here are the coordinates of the compass.
    'COORDINATES': open('flag.txt', 'r').read()
}

def generate_key() -> str:
    """Generate a random key for the Flask secret (I love Python!)"""
    return (''.join([str(x) for x in [(int(x) ^ (int(time()) % 2 ^ randint(0, 2))) for x in [int(char) for char in str(digits[randint(0, 9)]) * 4]]])).rjust(8, '0')
        
def authorized() -> bool:
    """Check if the user is authorized"""
    return True if session.get('logged_in') == True and session.get('status') == 'admin' else False