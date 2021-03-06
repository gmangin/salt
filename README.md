```
################################## 
##                              ## 
##    ____    _    _   _____    ##
##   / ___|  / \  | | |_   _|   ##
##   \___ \ / _ \ | |   | |     ##
##    ___) / ___ \| |___| |     ##
##   |____/_/   \_\_____|_|     ##
##                              ##
##                              ##
################################## 
```

# SALT DESCRIPTION
- salt is a Configuration Management, like:
- Chef
- Fabric
- Pallet
- Puppet
- Slaughter
- Ansible
- CFEngine
...

- sale is written in python

# INSTALLAtiON BASIC SALT-MASTER / SALT-MINION 

* on the master server

> apt-get update

>apt-get install salt-master

- on the minion (slave) server

> apt-get install salt-minion

> /etc/salt/minion → master:ip privee du salt-master

> make a ssh key and restart (ssh-keygen and service salt-minion restart)

- on the master server

> salt-key -L List the accepted and unaccepted salt keys

> salt-key -a <minion id> Accept a minion key

> salt-key -A accept all unaccepted minion keys

- to see if it is working : go in the salt-master

> salt '*' test.ping

[source docs.saltstack.com](http://docs.saltstack.com/en/latest/topics/installation/ubuntu.html)

[source salt.readthedocs.org](http://salt.readthedocs.org/en/v0.9.2/topics/tutorial.html)

# CMD BASIC

> salt <target> <command> <options>

> salt '*' sys.doc

- Show all currently available minions:

> salt '*' test.ping

- Run an arbitrary shell command:

> salt '*' cmd.run 'uname -a'

- show ip adress and others :

> salt <minion id> network.ip_addrs /network.interfaces /disk.percent

- check config

> salt 'sample-1' state.highstate test=True

- install

> salt 'sample-1' state.highstate

> sudo salt '*' pkg.refresh_db = apt-get update

> salt '*' cmd.run 'apt-get autoremove'

# GENERAL INSTALLATION
In order to automate the minions'config in one unique file (often /srv/salt)

[source docs.logilab.org](http://docs.logilab.org/solutionslinux_2014_salt/#/)

[source docs.saltstack.com](http://docs.saltstack.com/en/latest/ref/states/top.html)

* Example :
* go to /etc/salt/master and decomment

```
  file_roots:
    base:
      - /srv/salt/
```

* go to /srv/salt (mkdir salt if needs), make a file top.sls.
example of file top.sls:

```
 base:
    '*':
      - packages
    'minion1':
      - coucou
```

* packages and coucou are directories that have go an init.sls in each
example init.sls of packages:

```
  packages:
    pkg.latest:
      - name: screen
      - name: emacs23
```

# Have fun !
