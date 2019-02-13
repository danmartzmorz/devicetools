#!/usr/bin/env bash
# Preconditions: CentOS host to be used

# Download epel repository 
wget dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

#Install the repo
rpm -Uvh epel-release*rpm

#Install stress-ng
yum install stress-ng -y

#Create a bash script with the stress-ng commands

touch /usr/local/etc/get_stress-ng0.sh
echo "stress-ng --cpu 1 --vm 4 --hdd 1 --fork 8 --switch 4 --timeout 5m --metrics-brief" >> /usr/local/etc/get_stress-ng0.sh
  
#Give permission to the script
chmod u+x /usr/local/etc/get_stress-ng0.sh

#Add to the Crontab
crontab -l | { cat; echo "*/11 * * * * sleep ${RANDOM:0:2}m ; /usr/local/etc/get_stress-ng0.sh"; } | crontab -

# add jobs at please on intervals (you can check examples here https://crontab.guru/examples.html)
