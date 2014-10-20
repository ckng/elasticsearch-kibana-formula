{% from "elasticsearch/map.jinja" import elasticsearch with context %}

# Elasticsearch repository

{% if grains.os_family == 'Debian' %}
elasticsearch_pkgrepo:
    pkgrepo.managed:
        - name: "deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main"
        - key_url: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
        - file: /etc/apt/sources.list.d/elasticsearch.list
        - require_in:
            - pkg: elasticsearch
{% endif %}


elasticsearch:
    pkg.installed:
        - name: {{ elasticsearch.package_name }}
    service.running:
        - name: {{ elasticsearch.daemon }}
        - enable: True
        - require:
            - pkg: elasticsearch
