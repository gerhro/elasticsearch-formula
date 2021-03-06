# Configure repo file for RHEL based systems

/etc/yum.repos.d/Elasticsearch.repo:
  file.managed:
    - source: salt://elasticsearch/files/Elasticsearch.repo
    - template: jinja
    - user: root
    - group: root
    - mode: '0644'

command-import-es-signing-key:
  cmd.run:
    - name: rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
    - onchanges:
      - file: /etc/yum.repos.d/Elasticsearch.repo
