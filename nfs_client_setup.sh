#!/bin/sh
yum install -y nfs-utils nfs-utils-lib
chkconfig nfs on
service rpcbind start
service nfs start
mkdir /software
mkdir /scratch
#sleep 600
sleep 300
mount -t nfs 192.168.1.1:/software /software
mount -t nfs 192.168.1.2:/scratch /scratch

#while [ ! -d /software/flagdir ]
#do
#  sleep 30
#done

echo "export PATH='$PATH:/software/bin'" >> /users/jk880380/.bashrc
echo "export LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/software/lib/'" >> /users/BC843101/.bashrc
source /users/BC843101/.bashrc
