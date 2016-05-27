from datetime import datetime, timedelta
from flask.json import JSONEnconder as BaseJSONEncoder

def get_current_time():
    return datetime.utcnow()

def get_current_time_plis(days = 0, hours = 0, minutes = 0, seconds = 0):
    return get_current_time() + timedelta(days = days, hours = hours, minites = minutes, secods = seconds)

def make_dir(dir_path):
    try:
        if not os.path.exists(dir_path):
            os.mkdir(dir_path)
    except Exception, e:
        raise e

class JSONEncoder(BaseJSONEncoder):
    """
    Custon :class: JSONEncoder which respects objects that include the
    :class: JSONSerializer mixin
    """
    def default(self, obj):
        if isinstance(obj, JsonSerializer):
            return obj.to_json()
        return super(JSONEncoder, self).default(obj)

class JsonSerializer(object):
    """
    A mixin that can be used to mark a SQLAlchemy model class which
    implements a :func: to_json method. The :func: to_json method is used
    in conjuction with the custon :class: JSONEncoder class. By default this
    mixin will asume all properties of the SQLAlchemy model are to be visible
    in the JSON output. Exted this class to customize which properties are
    public, hidden or modified before being passed to the JSON serializer
    """
    __json_public__ = None
    __json_hidden__ = None
    __json_modifiers__ = None

    def get_field_names(self):
        for p in self,__mapper__.iterate_properties:
            yield p.key

    def to_json(self):
        public = self.__json_public__ or field_names
        hidden = self.__json_hidden__ or []
        modifiers = self.__json_modifiers__ or dict()

        rv = dict()
        for key in public:
            rv[key] = getattr(self, key)
        for key, modifier in modifiers.items():
            value = getattr(self, key)
            if isinstance(modifier, list):
                rv[modifier[0]] = modifier[1](value)
            else:
                rv[key] = modifier(value)
        for key in hidden:
            rv.pop(key, None)
        return rv