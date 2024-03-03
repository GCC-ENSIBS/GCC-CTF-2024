#/usr/bin/env python3
# encoding : utf-8


import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from requests import post
from random import choice

from db import db, Users
from config import Config

BASE_URL = "http://localhost:5000"


def setup_driver():
    """Setup a headless Chrome driver"""
    chrome_executable = Service(executable_path="/usr/bin/chromedriver", log_path="NUL")
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    return webdriver.Chrome(service=chrome_executable, options=options)


def get_admin_credentials():
    """Returns the admin credentials"""
    username, password = "admin", Config.ADMIN_PASSWORD
    return username, password


def login(driver):
    driver.get(BASE_URL + "/login")
    username, password = get_admin_credentials()
    username_input = driver.find_element(By.ID, "username")
    username_input.send_keys(username)

    password_input = driver.find_element(By.ID, "password")
    password_input.send_keys(password)

    login_button = driver.find_element(By.ID, "submit")
    login_button.click()
    print(f"Logged in as {username} with password {password}.")

    time.sleep(3)

    authorization = driver.get_cookie("authorization")
    authentication = driver.get_cookie("authentication")
    print(authorization)
    print(authentication)
    return authorization, authentication


def send_messages(driver,authentication, authorization):
    cookies = {
        "authorization" : authorization,
        "authentication" : authentication
    }

    # List of phrases
    phrases = [
        "He insisted that it's your turn to pay this time.",
        "She hinted that it would be nice if you covered the bill.",
        "They suggested splitting the bill, but conveniently forgot their wallet.",
        "He casually mentioned that you owe him for the last meal.",
        "She jokingly said it's your treat for the evening.",
        "They playfully argued about whose turn it is to foot the bill.",
        "He slyly suggested that you should pick up the tab.",
        "She tactfully reminded you that it's your shout tonight."
    ]

    users = Users.query.filter_by(is_admin=0).all()
    for user in users:
        content = choice(phrases)
        form = {
            "destination_username": user.username,
            "content": content
        }
        post(BASE_URL + "/messages", cookies=cookies, data=form)

    driver.quit()
    return


def action():
    driver = setup_driver()
    authorization_cookie, authentication_cookie = login(driver)
    if authentication_cookie is None or authorization_cookie is None:
        """If there was a bug, retry to login"""
        print("[BOT] Retrying to login")
        authorization_cookie, authentication_cookie = login(driver)
        send_messages(driver, authentication_cookie["value"], authorization_cookie["value"])
        return
    send_messages(driver, authentication_cookie["value"], authorization_cookie["value"])
    return