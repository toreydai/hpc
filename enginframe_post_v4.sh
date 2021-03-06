#!/bin/bash
#touch /home/ubuntu/post_install_ansys.txt
sudo mv /shareEBS/ansys_inc/v193/aisol/lib/linx64/libz.so.1 /shareEBS/ansys_inc/v193/aisol/lib/linx64/libz.so.1.old
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 /shareEBS/ansys_inc/v193/aisol/lib/linx64/libz.so.1
#sudo ln -s /lib/x86_64-linux-gnu/libc.so.6 /lib64/libc.so.6
#sudo ln -sf /bin/bash /bin/sh
#chmod 777 /etc/profile
#sudo echo "export PATH=$PATH:/shareEBS/ansys_inc/v193/fluent/bin:/opt/sge/bin/lx-amd64:/shareEBS/ansys_inc/v193/ansys/bin" >> /etc/profile
#source /etc/profile

#touch /home/ubuntu/post_install_ef.txt
useradd efadmin -g ubuntu
useradd efnobody -g ubuntu
useradd -d /home/test1 -m test1 -g ubuntu -s /bin/bash
useradd -d /home/test2 -m test2 -g ubuntu -s /bin/bash
passwd 'efadmin' <<< "p@ssw0rd"$'\n'"p@ssw0rd"$'\n'
passwd 'ubuntu' <<< "p@ssw0rd"$'\n'"p@ssw0rd"$'\n'
passwd 'test1' <<< "p@ssw0rd"$'\n'"p@ssw0rd"$'\n'
passwd 'test2' <<< "p@ssw0rd"$'\n'"p@ssw0rd"$'\n'

apt-get update -y
wget https://nice-enginframe-cn-north-1.s3.cn-north-1.amazonaws.com.cn/2019.0-r915/jdk-8u221-linux-x64.tar.gz
wget https://nice-enginframe-cn-north-1.s3.cn-north-1.amazonaws.com.cn/2019.0-r915/enginframe-2019.0-r915.jar
wget https://nice-enginframe-cn-north-1.s3.cn-north-1.amazonaws.com.cn/2019.0-r915/license.ef
wget https://nice-enginframe-cn-north-1.s3.cn-north-1.amazonaws.com.cn/2019.0-r915/system-auth
wget https://nice-enginframe-cn-north-1.s3.cn-north-1.amazonaws.com.cn/2019.0-r915/efinstall.config
cp system-auth /etc/pam.d/
tar -zxvf jdk-8u221-linux-x64.tar.gz -C /opt
JAVA_HOME='/opt/jdk1.8.0_221'
PATH=$PATH:$JAVA_HOME/bin
java -jar enginframe-2019.0-r915.jar --text --batch -f efinstall.config

service enginframe start
