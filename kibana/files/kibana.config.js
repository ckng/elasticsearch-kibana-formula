{% from "kibana/map.jinja" import kibana with context -%}
{% from "elasticsearch/map.jinja" import elasticsearch with context -%}
{% set elasticsearch_url = (elasticsearch.external_url|format(elasticsearch.external_host)) %}
{% set _ = kibana.config.update({'elasticsearch': elasticsearch_url}) %}

define(['settings'],
function (Settings) {
  return new Settings({{ kibana.config | json }});
});
