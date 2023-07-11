# autokuber



## Getting started

### 1. Configure
- set.conf
    ```
    vim set.conf
    >
    # masters/workers/all
    TARGET_="all"
    #--------------------

    # mastser
    MASTER_IP_="192.168.2.11"
    MASTER_HOSTNAME_="master"
    #--------------------

    # worker
    WORKER1_IP_="192.168.2.12"
    WORKER1_HOSTNAME_="worker1"
    WORKER2_IP_="192.168.2.13"
    WORKER2_HOSTNAME_="worker2"
    #--------------------

    # HOME_ACCONT (shhan, ubuntu, vraptor)
    HOME_ACCOUNT_="shhan"
    #--------------------

    # remote server id (vraptor, ubuntu)
    USER_="vraptor"
    #--------------------

    # remote server pw (vraptor, ubuntu)
    PASSWD_="vraptor"
    #--------------------

    # cpu arch (x86_64, aarch64)
    CPU_ARCH_="x86_64"
    #--------------------

    # v4.5.7, v5.0.1
    KUSTOMIZE_VERSION_="v4.5.7"
    #--------------------

    # CNI (Calico = 192.168.0.0/16)
    CNI_IP_="192.168.0.0/16"
    #--------------------
    ```

### 2. Run
- ansible start
    ```
    ./01_ssh.sh
    ./02_ping.sh
    ./03_hostnameset.sh
    ```
- install docker & kubernetes
    ```
    ./11_install_docker_kuber.sh
    ```
- install clustering
    ```
    ./12_clustering_start.sh
    ```