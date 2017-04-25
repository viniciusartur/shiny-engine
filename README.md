Instructions
------

1. Build a new Ubuntu Linux instance on a public cloud.

2. Connect to it:
```
$ ssh -i /path/to/key ubuntu@your-instance.compute-1.amazonaws.com
```

3. Install Salt on this machine:
```
$ sudo apt-get -y install salt-master salt-minion
```

4. Copy Salt States to /srv:
```
$ sudo git clone https://github.com/viniciusartur/shiny-engine /srv
```

5. Install users-formula
```
$ sudo git clone https://github.com/saltstack-formulas/users-formula /srv/formulas/users-formula
```

6. Edit /etc/salt/master, appending lines:
```
file_roots:
  base:
    - /srv/salt
    - /srv/formulas/users-formula
pillar_roots:
  base:
    - /srv/pillar
```

7. Edit /etc/salt/minion, appending lines:
```
master: localhost
```

8. Restart Salt Master and Salt Minion:
```
$ sudo systemctl restart salt-master
$ sudo systemctl restart salt-minion
```

9. Accept key from Minion:
```
$ sudo salt-key -A -y
```

10. Apply the states:
```
$ sudo salt '*' state.apply
```
