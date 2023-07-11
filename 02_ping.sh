#!/bin/bash

# hosts 
echo " !!! [ inventory hosts set ] !!! "
cp inventory/hosts.sample inventory/hosts

# set.conf
echo " !!! [ set.conf ] !!! "
source set.conf

# ping
echo " ___ "
echo " !!! [ ping ] !!! "
ansible $TARGET -m ping

