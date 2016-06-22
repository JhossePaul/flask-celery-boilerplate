"""
TodoItem api
"""
from flask_restful import Resource

class TodoItem(Resource):
    def get(self):
        return {"hello": "world"}
    
