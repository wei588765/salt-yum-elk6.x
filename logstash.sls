logstash-install:
  pkg.installed:
    - pkgs:
      - java
    - unless: java -version
  file.managed:
    - name: /etc/yum.repos.d/logstash.repo
    - source: salt://files/logstash.repo
    - mode: 644
    - user: root
    - group: root
  cmd.run:
    - name: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && yum install -y logstash
    - require:
      - file: /etc/yum.repos.d/logstash.repo
    - unless: test -d /usr/share/logstash
logstash-init:
  file.append:
    - name: /etc/profile
    - text:
      - export PATH="/usr/share/logstash/bin/:$PATH"
