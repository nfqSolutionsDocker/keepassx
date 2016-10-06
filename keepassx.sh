#!/bin/bash

/solutions/install_packages.sh

yum -y update

echo Instalando keepassx ...
if [ ! -f /usr/bin/keepassx ]; then
	yum -y install keepassx
fi

echo Instalando servidor ssh ...
if [ ! -f /usr/sbin/sshd ]; then
	yum -y install openssh-server
	mkdir /var/run/sshd
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
	sed -i "s/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g" /etc/ssh/sshd_config
	sed -i "s/HostKey \/etc\/ssh\/ssh_host_ed25519_key/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/g" /etc/ssh/sshd_config
fi

yum -y install xorg-x11-xauth
yum -y install xorg-x11-utils
yum -y install xorg-x11-fonts-*
yum -y install xorg-x11-server-utils
yum clean all

echo Ejecutando sshd ...
/usr/sbin/sshd -D
