#!/bin/bash

# set.conf
echo -e "\e[36m\n[ set.conf ] >>>>>>>>>>>>>>>> !!! \e[0m"
source set.conf

#ping
echo -e "\e[36m\n[ ping ] >>>>>>>>>>>>>>>> !!! \e[0m"
ansible $TARGET -m ping

#
echo -e "\e[36m\n[ ansible-playbook:hostnameset ] >>>>>>>>>>>>>>>> !!! \e[0m"
if [ "$TARGET" = "all" ]; then
  ansible-playbook masters/hostnameset.yml workers/hostnameset.yml
elif [ "$TARGET" = "masters" ]; then
  ansible-playbook masters/hostnameset.yml
elif [ "$TARGET" = "workers" ]; then
  ansible-playbook workers/hostnameset.yml
fi
