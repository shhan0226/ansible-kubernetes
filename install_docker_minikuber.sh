#!/bin/bash

# set.conf
echo -e "\e[36m\n[ set.conf ] >>>>>>>>>>>>>>>> !!! \e[0m"
source set.conf

# ping
echo -e "\e[36m\n[ ping ] >>>>>>>>>>>>>>>> !!! \e[0m"
ansible $TARGET -m ping

# reboot
echo -e "\e[36m\n[ ansible-playbook:reboot ] >>>>>>>>>>>>>>>> !!! \e[0m"
if [ "$TARGET" = "all" ]; then
  ansible-playbook masters/reboot.yml workers/reboot.yml
elif [ "$TARGET" = "masters" ]; then
  ansible-playbook masters/reboot.yml
elif [ "$TARGET" = "workers" ]; then
  ansible-playbook workers/reboot.yml
fi

# apt update/upgrade
echo -e "\e[36m\n[ ansible-playbook:update ] >>>>>>>>>>>>>>>> !!! \e[0m"
if [ "$TARGET" = "all" ]; then
  ansible-playbook masters/update.yml workers/update.yml
elif [ "$TARGET" = "masters" ]; then
  ansible-playbook masters/update.yml
elif [ "$TARGET" = "workers" ]; then
  ansible-playbook workers/update.yml
fi


# install docker
echo -e "\e[36m\n[ ansible-playbook:docker ] >>>>>>>>>>>>>>>> !!! \e[0m"

if [ "$TARGET" = "all" ]; then
  ansible-playbook masters/docker_installer.yml workers/docker_installer.yml
elif [ "$TARGET" = "masters" ]; then
  ansible-playbook masters/docker_installer.yml
elif [ "$TARGET" = "workers" ]; then
  ansible-playbook workers/docker_installer.yml
fi


# install minikube
echo -e "\e[36m\n[ ansible-playbook:minikube ] >>>>>>>>>>>>>>>> !!! \e[0m"

if [ "$TARGET" = "all" ]; then
  ansible-playbook masters/minikube_installer.yml workers/minikube_installer.yml
elif [ "$TARGET" = "masters" ]; then
  ansible-playbook masters/minikube_installer.yml
elif [ "$TARGET" = "workers" ]; then
  ansible-playbook workers/minikube_installer.yml
fi
