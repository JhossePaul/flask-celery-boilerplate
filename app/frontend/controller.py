"""
Serves Flask static pages
"""
import requests
import nltk
import re
import operator

from flask import Flask, Blueprint, render_template, current_app, request, flash, url_for, redirect, session, abort, jsonify, send_from_directory
from flask.views import MethodView

from bs4 import BeautifulSoup
from collections import Counter

from ..users.UserForms import *

frontend = Blueprint("frontend", __name__)

class Index(MethodView):
    def get(self):
        return render_template("index.html", loginform = LoginForm())
    def post(self):
        errors  = []
        results = {}
        try:
            url = request.form["url"]
            r   = requests.get(url)
        except:
            errors.append("Unable to get URL")
        if r:
            raw    = BeautifulSoup(r.text, "html.parser").get_text()

            tokens = nltk.word_tokenize(raw)
            text   = nltk.Text(tokens)

            nonPunct  = re.compile('.*[A-Za-z].*')
            raw_words = [w for w in text if nonPunct.match(w)]
            raw_word_count = Counter(raw_words)

            no_stop_words = [w for w in raw_words if w.lower() not in nltk.corpus.stopwords.words("english")]
            no_stop_words_count = Counter(no_stop_words)

            results = sorted(
                no_stop_words_count.items(),
                key = operator.itemgetter(1),
                reverse = True
            )

        return render_template("index.html", loginform = LoginForm(), errors = errors, results = results)

frontend.add_url_rule("/", view_func = Index.as_view("index"))
