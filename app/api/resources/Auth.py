"""
Users API for authentication
"""
from flask import request, jsonify
from flask_restful import Resource, abort
from flask_login import login_required, current_user, logout_user, login_user
from ...users import User, SignupForm, LoginForm

class Login(Resource):
    def post(self):
        if current_user.is_authenticated():
            return {"msg": "You are already logged in"} 

        form = LoginForm()
        
        if form.validate_on_submit():
            user, authenticated = User.authenticate(form.login.data, form.password.data)

            if user:
                if authenticated:
                    login_user(user, remember = form.remember_me.data)
                    return jsonify(flag = "success")
                else:
                    abort(402, message = "Invalid username or password")
            else:
                abort(405, message = "Username does not exist")
        abort(422, message = "Form validation error")

class Signup(Resource):
    def post(self):
        if current_user.is_authenticated():
            return {message: "You are already signed up"}

        form = SignupForm()

        if form.validate_on_submit():
            if User.is_username_taken(form.username.data):
                abort(409, message = "This username is already taken!")
            if User.is_email_taken(form.email.data):
                abort(409, message = "This email is already taken")

            try:
                user = User()
                form.populate_obj(obj)

                db.session.add(user)
                db.session.commit()
            except Exception as e:
                abort(422, message = "Internal Server Error. Report this problem")
        login_user(user)
        return { message: "You successfullt signed up! Please check your email for further verification" }

class VerifyAuth(Resource):
    decorators = [login_required]
    def get(self):
        return current_user.to_json()

