import WordsConstants
from ..extensions import db
from sqlalchemy.dialects.mysql import JSON


class Words(db.Model):
    __tablename__ = "words"

    def __repr__(self):
        return "<%r word count>" % self.url

    def __init__(self, url, result_all, result_no_stop_words):
        self.url = url
        self.result_all = result_all
        self.result_no_stop_words = result_no_stop_words

    id = db.Column(db.Integer, primary_key=True)
    url = db.Column(db.String(WordsConstants.URL_STRING_LEN))
    result_all = db.Column(JSON)
    result_no_stop_words = db.Column(JSON)
