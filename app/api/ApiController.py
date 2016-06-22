"""
Simple RESTful API with Flask-RESTful
"""

from flask import Blueprint, request, jsonify
from flask_restful import Api
from resources import VerifyAuth, Login, Signup

api = Blueprint("api", __name__, url_prefix = "/api")
api_wrap = Api(api)

api_wrap.add_resource(VerifyAuth, "/auth/verify_auth", endpoint = "verify_auth")
api_wrap.add_resource(Login, "/auth/login", endpoint = "login")
api_wrap.add_resource(Signup, "/auth/signup", endpoint = "signup")

