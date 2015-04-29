{% for group in 'adminsys', 'sudo', 'docker', 'piticha', 'invited' %}
{{ group }}:
  group.present:
    - system: True
    - addusers:
      - gmangin
#{% endfor %}

gmangin:
  user.present:
    - password: xxxxxxxxxxxx
    - fullname: Gaelle MANGIN
    - shell: /bin/bash
    - home: /home/gmangin
    - gid: adminsys
    - groups:
      - adminsys
      - sudo
      - docker
      - piticha
      - invited

git:
  user.present:
    - password: 
    - shell: /bin/bash
    - home: /var/git


#test:
#  user.present:
#    - password: xxxxxxxxxxxx
#    - fullname: test
#    - shell: /bin/bash
#    - home: /home/test
