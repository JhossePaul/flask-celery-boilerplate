from os.path import abspath, dirname
from common.constants import INSTANCE_FOLDER_PATH

class BaseConfig(object):
    PROJECT         = "Social Network Miner"
    PROJECT_ROOT    = abspath(dirname(__file__))
    DEBUG           = False
    TESTING         = False
    ADMINS          = ["mcromanceva@hotmail.com"]
    SECRET_KEY      = "NuncaAdivinaras"

class DefaultConfig(BaseConfig):
    DEBUG       = True
    SECRET_KEY  = "JamasAdivinaras"

    # Flask SQLAlchemy configuration
    MYSQL_USER                      = "paul"
    MYSQL_PASS                      = "latreach"
    SQLALCHEMY_DATABASE_URI         = "mysql://" + ":".join([MYSQL_USER, MYSQL_PASS]) + "@localhost/stingdata"
    SQLALCHEMY_TRACK_MODIFICATIONS  = True

class LocalConfig(DefaultConfig):
    pass

class StagingConfig(DefaultConfig):
    pass

class ProductionConfig(DefaultConfig):
    pass

def get_config(MODE):
    SWITCH = {
        "LOCAL"         : LocalConfig,
        "STAGING"       : StagingConfig,
        "PRODUCTION"    : ProductionConfig,
    }
    return SWITCH[MODE]
