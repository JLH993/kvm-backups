#!/bin/bash

# Created and maintained by https://github.com/JLH993
# Use at your own risk and check the integrity of your backups often. 

# Define variables
PWROFF="$(virsh list --all | grep "shut off" | awk '{print$2}')"
BLKLIST=`for i in $PWROFF; do virsh domblklist $i | grep "qcow2" | awk '{print$2}'; done`
BLSHORT=`echo "$BLKLIST" | awk -F'/' '{print$5}'`

# Back up powered off images... 
for i in $BLKLIST; do tar czvf /backups/Linux/kvm/$(echo $i | awk -F'/' '{print$5}').tgz $i; done
