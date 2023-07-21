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
rm ~/.ssh/id_rsa
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-keygen -f "/home/$HOME_ACCOUNT/.ssh/known_hosts" -R $MASTER_IP
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USER@$MASTER_IP
ssh-keygen -f "/home/$HOME_ACCOUNT/.ssh/known_hosts" -R $WORKER1_IP
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USER@$WORKER1_IP
ssh-keygen -f "/home/$HOME_ACCOUNT/.ssh/known_hosts" -R $WORKER2_IP
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USER@$WORKER2_IP
