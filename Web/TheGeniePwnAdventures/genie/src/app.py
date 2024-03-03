#/usr/bin/env python3
# encoding : utf-8


from flask import Flask, render_template, make_response, request, redirect, flash, jsonify
from utils import create_cookie, is_admin
from werkzeug.security import generate_password_hash, check_password_hash
from db import db, Users, Messages
from config import Config
from bot import action


# Create Flask app instance
app = Flask(__name__, static_url_path='/app/assets/', static_folder='assets')
app.config.from_object(Config)
db.init_app(app)


# Create database tables if they don't exist
with app.app_context():
    db.create_all()
    if not Users.query.filter_by(username="admin").first():
        admin_user = Users(id=1, username="admin", password=Config.ADMIN_PASSWORD_HASH, is_admin=True)
        db.session.add(admin_user)
        db.session.commit()


# Route for the index page
@app.route('/', methods=["GET"])
def index():
    return redirect("/login", code=302)


# Route for user registration
@app.route('/register', methods=["GET", "POST"])
def register():
    if request.method == "GET":
        return render_template('register.html')
    elif request.method == "POST":
        username = request.form.get('username')
        password = request.form.get('password')

        user = Users.query.filter_by(username=username).first()
        if user:
            flash("Username already taken", "danger")
            return render_template('register.html')

        hashed_password = generate_password_hash(password)
        register_user = Users(
            username=username,
            password=hashed_password,
            is_admin=False
        )
        db.session.add(register_user)
        db.session.commit()
        flash("You have been successfully registered", "success")
        return redirect("/login", code=302)


# Route for user login
@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == "GET":
        response = make_response(render_template('login.html'))
        if request.cookies.get('authorization') is None:
            response.set_cookie('authorization', create_cookie(), httponly=True)
        return response
    elif request.method == "POST":
        username = request.form.get('username')
        password = request.form.get('password')

        user = Users.query.filter_by(username=username).first()
        if not user or not check_password_hash(user.password, password):
            flash("Invalid username or password", "danger")
            return render_template('login.html')

        flash("You have been logged in", "success")
        authentication_cookie = create_cookie()
        response = make_response(redirect("/chat", code=302))
        response.set_cookie('authentication', authentication_cookie, httponly=True)
        user.authentication_cookie = authentication_cookie
        user.authorization_cookie = request.cookies.get("authorization")
        db.session.commit()
        return response


# Route for the chat page
@app.route('/chat', methods=["GET"])
def chat():
    authentication_cookie = request.cookies.get("authentication")
    user = Users.query.filter_by(authentication_cookie=authentication_cookie).first()
    if not user:
        flash("You're not logged in", "danger")
        return redirect("/login", code=302)
    return render_template('chat.html', user=user)


# Route for handling messages
@app.route('/messages', methods=["GET", "POST", "DELETE"])
def messages():
    authentication_cookie = request.cookies.get("authentication")
    user = Users.query.filter_by(authentication_cookie=authentication_cookie).first()
    if not user:
        flash("You're not logged in", "danger")
        return redirect("/login", code=302)

    if request.method == "GET":
        messages = Messages.query.filter((Messages.source_id == user.id) | (Messages.destination_id == user.id)).order_by(Messages.date).all()
        serialized_messages = [{
            'id': message.id,
            'source_id': message.source_id,
            'destination_id': message.destination_id,
            'content': message.content,
            'date': message.date.strftime('%Y-%m-%d %H:%M:%S')
        } for message in messages]
        return jsonify(serialized_messages)

    elif request.method == "POST":
        destination_username = request.form.get('destination_username')
        destination_user = Users.query.filter_by(username=destination_username).first()
        if not destination_user:
            return jsonify({'error': 'Destination user not found'}), 404

        content = request.form.get('content')
        if not content:
            return jsonify({'error': 'Empty message, not sent'}), 400

        new_message = Messages(source_id=user.id, destination_id=destination_user.id, content=content)
        db.session.add(new_message)
        db.session.commit()

        if destination_username == "admin":
            action()

        return jsonify({'message': 'Message sent successfully'})

    elif request.method == "DELETE":
        deleted_count = Messages.query.filter_by(source_id=user.id).delete()
        db.session.commit()
        return jsonify({'message': f'{deleted_count} messages deleted successfully'})


# Route for deleting a specific message
@app.route('/messages/<int:message_id>', methods=["DELETE"])
def delete_message(message_id):
    authentication_cookie = request.cookies.get("authentication")
    user = Users.query.filter_by(authentication_cookie=authentication_cookie).first()
    if not user:
        return jsonify({'error': 'You are not logged in'}), 401

    message = Messages.query.filter_by(id=message_id, source_id=user.id).first()
    if not message:
        return jsonify({'error': 'Message not found or you do not have permission to delete it'}), 404

    db.session.delete(message)
    db.session.commit()
    return jsonify({'message': 'Message successfully deleted'})


# Route for user logout
@app.route('/logout', methods=["GET"])
def logout():
    authentication_cookie = request.cookies.get("authentication")
    user = Users.query.filter_by(authentication_cookie=authentication_cookie).first()
    if not user:
        flash("You're not logged in", "danger")
        return redirect("/login", code=302)

    user.authentication_cookie = None
    user.authorization_cookie = None
    db.session.commit()
    return redirect("/login", code=302)


# Route for retrieving the flag
@app.route('/flag', methods=["GET"])
def flag():
    authentication_cookie = request.cookies.get("authentication")
    user = Users.query.filter_by(authentication_cookie=authentication_cookie).first()
    if not user:
        flash("You're not logged in", "danger")
        return redirect("/login", code=302)

    username = user.username
    perms = is_admin(request.cookies.get("authorization"))
    if username != "admin" and perms:
        return Config.FLAG
    else:
        return "Nope"


# Run the app
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=False)
