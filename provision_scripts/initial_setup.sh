#!/bin/bash
# put your public ssh key here.
public_key="yourpublickey"

if [[ $public_key == "yourpublickey"  ]]; then
    echo "No key was provided from the vagrant provisioner. Vagrant will place a key at ./vagrant/boxname/public_key for you to connect."
    echo "You can also connect using vagrant ssh boxname"
else
    echo "$public_key" >/home/vagrant/.ssh/authorized_keys
    echo "$public_key" >/root/.ssh/authorized_keys
fi
