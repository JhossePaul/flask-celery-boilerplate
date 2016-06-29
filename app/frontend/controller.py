"""
Serves Flask static pages
"""
from flask import Blueprint, render_template, request
from flask.views import MethodView
from ..snc import count_words

frontend = Blueprint("frontend", __name__)


class Index(MethodView):
    def get(self):
        return render_template("index.html")

    def post(self):
        url = request.form["url"]
        if 'http://' not in url[:7]:
            url = 'http://' + url

        task = count_words.delay(url)
        if task.ready():
            result = task.get()
        else:
            result = "Task not completed"

        return render_template("index.html", result=result)

frontend.add_url_rule("/", view_func=Index.as_view("index"))
