from app import celery, create_app, configure_celery
app = create_app()
configure_celery(app, celery)
