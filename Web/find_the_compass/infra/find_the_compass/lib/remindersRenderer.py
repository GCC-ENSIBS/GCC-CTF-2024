#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ

from html import escape

class Renderer(object):
    """
    Proof of Concept to one day get rid of Jinja2. Who needs Jinja2 ?
    """
    def __init__(self, coordinates: str):
        # Only a wise administrator can retrieve the coordinates of the compass.
        self.coordinates = coordinates

    def render(self, author, content):
        author = escape(author)
        content = escape(content)
        htmlTemplate = f"<p><strong>{author}</strong>: {content}</p>"
        try:
            #Use escape for XSS protection
            return (htmlTemplate.format(self=self))
        except Exception as e:
            print(e)
            return "An error occured while rendering the reminder."