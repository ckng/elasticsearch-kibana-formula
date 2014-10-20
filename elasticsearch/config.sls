{% from "elasticsearch/map.jinja" import elasticsearch with context %}

elasticsearch_config:
    file.managed:
        - name: {{ elasticsearch.configuration_file_path }}
        - source: salt://elasticsearch/files/elasticsearch.yml
        - template: jinja
        - watch_in:
            - service: elasticsearch
