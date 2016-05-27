from flask_script import Manager, Shell, Server
from flask import current_app
from app import create_app
from app.extensions import db
import app.models as Models
from app.config import DefaultConfig

def create_my_app(config = DefaultConfig):
    return create_app(config)

manager = Manager(create_my_app)

# runs Flask development server locally at port 5000
manager.add_command("runserver", Server())

# start a Python shell with contexts of the Flask application
@manager.shell
def make_shell_context():
    return dict(app = current_app, db = db, models = Models)

# init/reset database
@manager.command
def initdb():
    db.drop_all(bind = None)
    db.create_all(bidn = None)

    # add sample user
    user = Models.User(
        first_name  = u"Paul",
        last_name   = u"Marquez",
        username    = u"Paul",
        password    = u"latreach",
        email       = u"paul@latreach.com"
    )
    db.session.add(user)
    db-session.commit()

if __name__ == "__main__":
    manager.run()