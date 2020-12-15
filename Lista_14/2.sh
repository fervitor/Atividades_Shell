#!/bin/bash
read user
total=$( ls /home/${user}/tmp | wc -l )
if [ $total -gt 0 ]; then
	echo "Esvaziando o diretório..."
	rm -r /home/${user}/tmp/*
else
	echo "O diretorio esta vazio, saindo ..." && exit 1 &>> /dev/null
fi

sudo cp ex2.sh /etc/init.d/remove_tmp.sh
