from os.path import abspath, dirname
# from common.constants import INSTANCE_FOLDER_PATH


class BaseConfig(object):
    PROJECT = "app"
    PROJECT_ROOT = abspath(dirname(__file__))
    DEBUG = False
    TESTING = False
    ADMINS = ["mcromanceva@hotmail.com"]
    SECRET_KEY = "NuncaAdivinaras"


class DefaultConfig(BaseConfig):
    DEBUG = True

    # Flask SQLAlchemy configuration
    MYSQL_USER = "paul"
    MYSQL_PASS = "latreach"
    SQLALCHEMY_DATABASE_URI = "mysql://" + \
        ":".join([MYSQL_USER, MYSQL_PASS]) + \
        "@localhost/snm"
    SQLALCHEMY_TRACK_MODIFICATIONS = True

    SECRET_KEY = "JamasAdivinaras"


class LocalConfig(DefaultConfig):
    pass


class StagingConfig(DefaultConfig):
    pass


class ProductionConfig(DefaultConfig):
    pass


def get_config(MODE):
    SWITCH = {
        "LOCAL":      LocalConfig,
        "STAGING":    StagingConfig,
        "PRODUCTION": ProductionConfig,
    }
    return SWITCH[MODE]


class CeleryConfig(object):
    BROKER_URL = "amqp://guest:guest@localhost//"
    CELERY_RESULT_BACKEND = "rpc://"

    CELERY_ACCEPT_CONTENT = ['json']
    CELERY_ENABLE_UTC = True
    CELERY_RESULT_SERIALIZER = 'json'
    CELERY_TASK_SERIALIZER = 'json'
    CELERY_TASK_RESULT_EXPIRES = 3600
    CELERY_TIMEZONE = 'America/Mexico_City'
    CELERY_RESULT_PERSISTENT = True
