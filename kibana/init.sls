{% from "kibana/map.jinja" import kibana with context %}

kibana_directory:
    file.directory:
        - name: {{ kibana.directory }}
        - user: www-data
        - group: www-data

kibana:
    archive.extracted:
        - name: {{ kibana.directory }}
        - source: https://download.elasticsearch.org/kibana/kibana/kibana-{{ kibana.version }}.tar.gz
        - archive_format: tar
        - tar_options: z
        - if_missing: {{ kibana.directory }}/kibana-{{ kibana.version }}/
        - source_hash: {{ kibana.hash }}
        - require:
            - file: kibana_directory

kibana_ownership:
    file.directory:
        - name: {{ kibana.directory }}
        - user: www-data
        - group: www-data
        - recurse:
            - user
            - group
        - require:
            - archive: kibana
