from time import sleep

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from utils.config import Config


BASE_URL = "http://127.0.0.1:5000"

def visit_url(path):
    driver = webdriver.Firefox()

    driver.get(BASE_URL + "/login")
    sleep(0.5)

    username_field = driver.find_element(By.NAME, "username")
    username_field.send_keys("admin")
    password_field = driver.find_element(By.NAME, "password")
    password_field.send_keys(Config.ADMIN_PASSWORD)
    login_button = driver.find_element(By.ID, "loginBtn")
    login_button.click()
    
    sleep(0.5)
    driver.get(BASE_URL + path)

    sleep(3)
    driver.quit()
