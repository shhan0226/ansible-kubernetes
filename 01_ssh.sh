#!/bin/bash

# hosts 
echo " !!! [ inventory hosts set ] !!! "
cp inventory/hosts.sample inventory/hosts

# set.conf
echo " !!! [ set.conf ] !!! "
source set.conf

# apt
echo " !!! [apt... ] !!! "
sudo apt install ansible -y
sudo apt install sshpass -y

# ssh
echo " !!! [ssh...] !!! "
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USER_@$MASTER_IP
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USER_@$WORKER1_IP
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USER_@$WORKER2_IP
