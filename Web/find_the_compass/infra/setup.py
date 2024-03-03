from setuptools import setup

setup(
    name='find_the_compass',
    version='1.0.0',
    description='Python app for the compass thiefs',
    author='Mika - @bWlrYQ',
    homepage='https://bwlryq.net',
    licence='CC BY-NC',
    packages=['find_the_compass'],
    include_package_data=True,
    install_requires=[
        'flask==3.0.0',
        'Flask-SQLAlchemy==3.1.1'
    ],
)