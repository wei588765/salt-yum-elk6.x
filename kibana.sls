kibana-install:
  pkg.installed:
    - pkgs:
      - java
    - unless: java -version
  file.managed:
    - name: /etc/yum.repos.d/kibana.repo
    - source: salt://files/kibana.repo
    - mode: 644
    - user: root
    - group: root
  cmd.run:
    - name: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && yum install -y kibana
    - require:
      - file: /etc/yum.repos.d/kibana.repo 
    - unless: test -d /usr/share/kibana
/etc/kibana/kibana.yml:
  file.managed:
    - source: salt://files/kibana.yml
    - mode: 644
    - user: root
    - group: root
/etc/profile:
  file.append:
    - text:
      - export "PATH=/usr/share/kibana/bin/:$PATH"

