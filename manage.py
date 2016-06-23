import app.models as Models

from flask import current_app
from flask_script import Manager, Shell, Server
from flask_migrate import MigrateCommand

from app import create_app
from app.extensions import db
from app.settings import DefaultConfig

def create_my_app(config = DefaultConfig):
    return create_app(config)

manager = Manager(create_my_app)

# runs Flask development server locally at port 5000
manager.add_command("runserver", Server())

# Migrate database with Flask Migrate
manager.add_command("db", MigrateCommand)

# start a Python shell with contexts of the Flask application
@manager.shell
def make_shell_context():
    return dict(app = current_app, db = db, models = Models)

# Init/Reset database
@manager.command
def restartdb():
    db.drop_all(bind = None)
    db.create_all(bind = None)

if __name__ == "__main__":
    manager.run()
