import yaml

from salt.utils.jinja import OrderedDictDumper
from salt.utils.dictupdate import update


def yaml_dump(value, flow_style=True):
    return yaml.dump(value, default_flow_style=flow_style,
                     Dumper=OrderedDictDumper).strip()


def dict_update(dest, upd):
    return update(dest, upd)
