base:
  "*":
    - rely-pkg
    - java-install
    - elasticsearch
    - logstash
  "12-elk-slave":
    - kibana
  "13-elk-slave":
    - redis
    
