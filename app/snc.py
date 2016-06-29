from __future__ import absolute_import

import requests
import nltk
import re

from bs4 import BeautifulSoup
from collections import Counter

from .app import make_celery
from .extensions import db
from .models import Words


celery = make_celery()


@celery.task
def count_words(url):
    errors = []

    try:
        r = requests.get(url)
    except:
        errors.append("Unable to get URL")
        return {"error": errors}

    raw = BeautifulSoup(r.text, "html.parser").get_text()
    tokens = nltk.word_tokenize(raw)
    text = nltk.Text(tokens)

    nonPunct = re.compile('.*[A-Za-z].*')
    raw_words = [w for w in text if nonPunct.match(w)]
    raw_word_count = Counter(raw_words)

    no_stop_words = [
        w
        for w
        in raw_words
        if w.lower() not in nltk.corpus.stopwords.words("english")
    ]
    no_stop_words_count = Counter(no_stop_words)

    try:
        result = Words(
            url=url,
            result_all=raw_word_count,
            result_no_stop_words=no_stop_words_count
        )
        db.session.add(result)
        db.session.commit()
        return result.id
    except:
        errors.append("Unable to add item to database")
        return {"error": errors}
