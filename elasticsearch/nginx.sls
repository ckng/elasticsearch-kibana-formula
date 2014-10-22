{% from "elasticsearch/map.jinja" import elasticsearch with context %}

{% if elasticsearch.htpasswd_users %}
elasticsearch_htpasswd:
    file.managed:
        - name: {{ elasticsearch.htpasswd_path }}
        - source: salt://elasticsearch/files/htpasswd
        - template: jinja
        - mode: 644
        - require_in:
            - file: elasticsearch_site
{% endif %}


elasticsearch_site:
    file.managed:
        - name: {{ elasticsearch.nginx_site_path }}
        - source: {{ elasticsearch.nginx_site_template }}
        - template: jinja
        - mode: 644
        - watch_in:
            - service: nginx
