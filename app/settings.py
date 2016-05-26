from os.path import abspath, dirname
from common.constants import INSTANCE_FOLDER_PATH

class BaseConfig(object):
    PROJECT         = "stingdata"
    PROJECT_ROOT    = abspath(dirname(__file__))
    DEBUG           = False
    TESTING         = False
    ADMINS          = ["paul@latreach.com"]
    SECRET_KEY      = "NuncaAdivinaras"


class DefaultConfig(BaseConfig):
    DEBUG       = True
    SECRET_KEY  = "LatReachIT&DSTeam"

    # Flask SQLAlchemy configuration
    MYSQL_USER              = "paul"
    MYSQL_PASS              = "latreach"
    SQLALCHEMY_DATABASE_URI = "mysql://" + ":".join([MYSQL_USER, MYSQL_PASS]) + "@localhost/stingdata"

class LocalConfig(DefaultConfig):
    pass

class StagigConfig(DefaultConfig):
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
