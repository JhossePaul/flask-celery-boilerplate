from __future__ import absolute_import

from .app import create_celery_app
from celery.signals import task_prerun
from flask import g

celery = create_celery_app()

@task_prerun.connect
def celery_prerun(*args, **kwargs):
    with celery.app.app_context():
        print g


@celery.task()
def do_some_stuff():
    with celery.app.app_context():
        g.user = "test"
        print g.user
        return g.user
