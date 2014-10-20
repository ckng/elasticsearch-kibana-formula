{% from "kibana/map.jinja" import kibana with context %}

kibana:
    archive.extracted:
        - name: {{ kibana.directory }}
        - source: https://download.elasticsearch.org/kibana/kibana/kibana-{{ kibana.version }}.tar.gz
        - archive_format: tar
        - tar_options: z
        - if_missing: {{ kibana.directory }}/kibana-{{ kibana.version }}/
        - source_hash: {{ kibana.hash }}

kibana_ownership:
    file.directory:
        - name: {{ kibana.directory }}
        - user: www-data
        - group: www-data
        - recurse:
            - user
            - group
