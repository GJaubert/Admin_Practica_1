#!/bin/bash
if [ "$1" == "" ]; then
	echo "Debe escribir argumentos"
	exit 1
fi
useradd $1
passwd $1
chage -M 90 $1
chage -W 1 $1
chage -I 2 $1
chown root /home/$1
name_=$1
shift
while [ "$1" != "" ]; do
	usermod -aG $1 $name_ 
	shift
done 
