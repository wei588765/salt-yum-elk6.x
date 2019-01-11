epel-install:
  file.managed:
    - name: /root/epel-release-latest-7.noarch.rpm
    - source: salt://files/epel-release-latest-7.noarch.rpm
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /root && rpm -ivh epel-release-latest-7.noarch.rpm
    - unless: rpm -q epel-release-7-11.noarch

