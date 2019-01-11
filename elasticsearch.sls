es-install:
  file.managed:
    - name: /etc/yum.repos.d/elasticsearch.repo
    - source: salt://files/elasticsearch.repo
    - mode: 644
    - user: root
    - group: root
  cmd.run:
    - name: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && yum install -y elasticsearch
    - require:
      - file: /etc/yum.repos.d/elasticsearch.repo 
    - unless: test -d /usr/share/elasticsearch
es-init:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml 
    - source: salt://files/elasticsearch.yml
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - NODE_NAME: {{ grains['fqdn_ip4'] }}
    - IP1: 10.0.0.12
    - IP2: 10.0.0.13
    - IP3: 10.0.0.14
    - require:
      - cmd: es-install
  service.running:
    - enable: True
    - name: elasticsearch
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
