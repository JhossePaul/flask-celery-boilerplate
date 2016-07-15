"""
Flask Scripts Manager. Run

python manager.py _script_

to run taks
"""
import app.models as Models

from flask import current_app
from flask_script import Manager, Server
from flask_migrate import MigrateCommand

from app import create_app
from app.extensions import db
from app.settings import DefaultConfig


def create_my_app(config=DefaultConfig):
    " Return app instance "
    return create_app(config)

MANAGER = Manager(create_my_app)

# runs Flask development server locally at port 5000
MANAGER.add_command("runserver", Server())

# Migrate database with Flask Migrate
MANAGER.add_command("db", MigrateCommand)


# start a Python shell with contexts of the Flask application
@MANAGER.shell
def make_shell_context():
    " Run a command line of Python with app context "
    return dict(app=current_app, db=db, models=Models)


# Init/Reset database
@MANAGER.command
def restartdb():
    " Drop every entry on DB and create new tables "
    db.drop_all(bind=None)
    db.create_all(bind=None)

if __name__ == "__main__":
    MANAGER.run()
