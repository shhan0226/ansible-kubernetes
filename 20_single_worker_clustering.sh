#!/bin/bash

start_time=$(date +%s)

WORKER_IP="192.168.0.38"
USERS="vraptor"
HOME_DIR=$(pwd)
ssh-keygen -f "/home/$HOME_ACCOUNT/.ssh/known_hosts" -R $WORKER_IP
sshpass -p $PASSWD ssh-copy-id -o StrictHostKeyChecking=no $USERS@$WORKER_IP



cp ./inventory/single_hosts.sample ./inventory/single_hosts
sed -i'' "s/WORKER_IP_SET/$WORKER_IP/" ./inventory/single_hosts
sed -i'' "s/USER_SET/$USERS/" ./inventory/single_hosts
sed -i'' "s@HOME_DIR_SET@$HOME_DIR@" ./inventory/single_hosts

# ping
#ansible all -m ping
echo -e "\e[36m\n[ ping ] >>>>>>>>>>>>>>>> !!! \e[0m"
ansible worker -i ./inventory/single_hosts -m ping


# docker/kuber install
cp workers/update.yml ./update.yml
sed -i'' "s/workers/worker/" ./update.yml
ansible-playbook -i ./inventory/single_hosts ./update.yml
rm ./update.yml

cp workers/docker_installer.yml ./docker_installer.yml
sed -i'' "s/workers/worker/" ./docker_installer.yml
ansible-playbook -i ./inventory/single_hosts ./docker_installer.yml
rm ./docker_installer.yml

cp workers/kuber_installer.yml ./kuber_installer.yml
sed -i'' "s/workers/worker/" ./kuber_installer.yml
ansible-playbook -i ./inventory/single_hosts ./kuber_installer.yml
rm ./kuber_installer.yml

cp workers/kustomize_installer.yml ./kustomize_installer.yml
sed -i'' "s/workers/worker/" ./kustomize_installer.yml
ansible-playbook -i ./inventory/single_hosts ./kustomize_installer.yml
rm ./kustomize_installer.yml

# install clustering
cp workers/kuber_clustering.yml ./single_kuber_clustering.yml
sed -i'' "s/workers/worker/" ./single_kuber_clustering.yml

# install clustering
echo -e "\e[36m\n[ ansible-playbook:Clustering ] >>>>>>>>>>>>>>>> !!! \e[0m"
ansible-playbook -i ./inventory/single_hosts ./single_kuber_clustering.yml
rm ./single_kuber_clustering.yml




end_time=$(date +%s)  # 종료 시간 측정
execution_time=$((end_time - start_time))  # 실행 시간 계산 (초 단위)

echo "스크립트 실행 시간: $execution_time 초"