redis-install:
    file.managed:
        - name: /usr/local/src/redis-4.0.9.tar.gz
        - source: salt://files/redis-4.0.9.tar.gz
        - mode: 755
        - user: root
        - group: root
        - unless: test -d /usr/local/redis-4.0.9.tar.gz
    cmd.run:
        - name: cd /usr/local/src/&&tar -xzf redis-4.0.9.tar.gz&& cd redis-4.0.9&& make 
        - unless: test -d /usr/local/src/redis-4.0.9
redis-init:
    file.managed:
        - name: /usr/local/src/redis-4.0.9/redis.conf
        - source: salt://files/redis.conf
        - mode: 644
        - user: root
        - group: root
