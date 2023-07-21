#!/bin/bash

start_time=$(date +%s)

# set.conf
echo -e "\e[36m\n[ set.conf ] >>>>>>>>>>>>>>>> !!! \e[0m"
source set.conf

# ping
#ansible all -m ping
echo -e "\e[36m\n[ ping ] >>>>>>>>>>>>>>>> !!! \e[0m"
ansible $TARGET -m ping

# install clustering
echo -e "\e[36m\n[ ansible-playbook:Clustering ] >>>>>>>>>>>>>>>> !!! \e[0m"

if [ "$TARGET" = "all" ]; then
  echo "All SET..."
  ansible-playbook masters/kuber_clustering.yml
  sleep 90
  ansible-playbook workers/kuber_clustering.yml

elif [ "$TARGET" = "masters" ]; then
  echo "Master SET..."
  ansible-playbook masters/kuber_clustering.yml

elif [ "$TARGET" = "workers" ]; then
  echo "Workers SET..."
  ansible-playbook workers/kuber_clustering.yml
fi



end_time=$(date +%s)  # 종료 시간 측정
execution_time=$((end_time - start_time))  # 실행 시간 계산 (초 단위)

echo "스크립트 실행 시간: $execution_time 초"