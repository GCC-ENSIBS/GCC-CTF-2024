#!/usr/bin/python3
# -*- coding: utf-8 -*-
# Python Version    : 3.11
# Author           : Mika - @bWlrYQ
# Created          : 2024-02-03

from requests import get
from time import sleep

def visit_endpoint(url):
    try:
        get(url, timeout=5, headers={"User-Agent": "GCC - Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0"})
        print(f"[+] Visited the endpoint: {url} with reset token.")
    except:
        print(f"[-] Error while visiting the endpoint. {url}")