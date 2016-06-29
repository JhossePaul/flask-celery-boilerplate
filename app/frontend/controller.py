"""
Serves Flask static pages
"""
from __future__ import absolute_import

import operator
from flask import Blueprint, render_template, request
from flask.views import MethodView

from ..models import Words
from ..tasks.count_words import count_words

frontend = Blueprint("frontend", __name__)


class Index(MethodView):
    def get(self):
        return render_template("index.html")

    def post(self):
        url = request.form["url"]

        task = count_words.delay(url)
        return render_template("index.html", task=task)


@frontend.route("/results/<job_key>", methods=["GET"])
def get_results(job_key):
    task = count_words.AsyncResult(job_key)
    if task.ready():
        id = task.get()
        result = Words.query.filter_by(id=id).first()
        results = sorted(
             result.result_no_stop_words.items(),
             key=operator.itemgetter(1),
             reverse=True
        )[:10]
        # return jsonify(results)
        return render_template('results.html', results=results)
    else:
        return "Your task status is {}".format(task.status)

frontend.add_url_rule("/", view_func=Index.as_view("index"))
