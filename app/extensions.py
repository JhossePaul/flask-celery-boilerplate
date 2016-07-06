from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_wtf.csrf import CsrfProtect
from flask_webpack import Webpack

# Flask SQLAlchemy extension instance
db = SQLAlchemy()

# Flask Login
login_manager = LoginManager()

# Flask WTF protection
csrf = CsrfProtect()

# Flask Webpack router
webpack = Webpack()
