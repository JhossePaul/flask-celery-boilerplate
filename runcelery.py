"""
Celery Runner
"""
from app import celery, create_app, configure_celery

APP = create_app()
configure_celery(APP, celery)
