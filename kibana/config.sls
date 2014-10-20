{% from "kibana/map.jinja" import kibana with context %}

kibana_config:
    file.managed:
        - name: {{ kibana.directory }}/kibana-{{ kibana.version }}/config.js
        - source: salt://kibana/files/kibana.config.js
        - template: jinja
        - mode: 655
