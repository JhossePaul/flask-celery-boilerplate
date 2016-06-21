"""
Users API for authentication
"""

from flask import Blueprint, render_template, current_app, request, flash, url_for, redirect, session, abort, jsonify
from flask_login import login_required, login_user, current_user, logout_user, confirm_login, login_fresh  

from ..common import Response
from ..extensions import db
from ..users import User, SignupForm, LoginForm

auth = Blueprint("auth", __name__, url_prefix="/api/auth")

@auth.route("/verify_auth", methods = ["GET"])
@login_required
def verify_auth():
    return Response.make_data_resp(data = current_user.to_json())

@auth.route("/login", methods = ["POST"])
def login():
    """ POST only operation. Check login form then log user in """
    if current_user.is_authenticate():
        return Response.make_success_resp(msg = "You are already logged in")

    form = LoginForm()
    if form.validate_on_submit():
        user, authenticated = User.authenticate(form.login.data, form.password.data)

        if user:
            if authenticated:
                login_user(user, remember = form.remember_me.data)
                return Respone.make_data_resp(data = current_user.to_json(), msg = "You have successfully logged in")
            else:
                return Response.make_error_resp(msg = "Invalid username or password", type = "Wrong Authentication", code = 402)

        else: 
            return Response.make_error_resp(msg = "Username does not exist", type = "Wrong Authentication", code = 402)
    return Response.make_form_error_resp(form = form)

@auth.route("/signup", methods = ["POST"])
def signup():
    if current_user.is_authenticated():
        return Response.make_success_resp(msg = "You're already signed up")

    form = SignupForm()

    if form.validate_on_submit():
        # check if username or email is taken
        if User.is_username_taken(form.username.data):
            return Response.make_error_resp(msg = "This username is already taken!", code = 409)
        if User.is_email_taken(form.email.data):
            return Response.make_error_resp(msg = "This email is already taken!", code = 409)

        try:
            # Create new user
            user = User()
            form.populate_obj(user)

            db.session.add(user)
            db.session.commit()

        except Exception as e:
            return Response.make_exception_resp(exception = e)

        # Log the user in
        login_user(user)
        return Response.make_success_resp(msg = "You successfully signed up! Please check your email for further verification.")    

    return Response.make_form_error_resp(form = form)

