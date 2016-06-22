# _*_ coding: utf-8 -*-
"""
Simple RESTful APi with Flask-RESTful
"""

from flask import Blueprint, request, jsonify
from flask_restful import Api
from resources import TodoItem

api = Blueprint("api", __name__, url_prefix = "/api")
api_wrap = Api(api)

api_wrap.add_resource(TodoItem, "/todos/")
