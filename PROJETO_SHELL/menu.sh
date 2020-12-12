#!/bin/bash

mkdir /tmp/auxiliar

while true; do
	echo "PARA REALIZAR UM BACKUP POR HORA, OPÇÂO 1"
	echo "PARA REALIZAR UM BACKUP POR DIA, OPÇÂO 2"
	echo "PARA REALIZAR UM BACKUP POR SEMANA, OPÇÂO 3"
	echo "PARA RESTAURAR UM BACKUP FEITO, OPÇÂO 10"
	echo "PARA VISUALIZAR OS BACKUPS JA FEITOS, OPÇÂO 4"
	echo "PARA SAIR DO SCRIPT DE BACKUP, OPÇÂO 0"
	read -p "DIGITE A OPÇÂO QUE DESEJA REALIZAR:" opcao
	case $opcao in
	1) #POR HORA
		clear
		source backup.sh
		echo "${user} ${dir} ${ip} 1" $1
		(crontab -l && echo "@hourly ~/PROJETO_SHELL/backup.sh") | crontab -
		echo " "
		;;
	2) #POR DIA
		clear
		source backup.sh
		echo "${user} ${dir} ${ip} 2" $1
		(crontab -l && echo "@daily ~/PROJETO_SHELL/backup.sh") | crontab -
		echo " "
		;;
	3) #POR SEMANA
		clear
		source backup.sh
		echo "${user} ${dir} ${ip} 3" $1
		(crontab -l && echo "@weekly ~/PROJETO_SHELL/backup.sh") | crontab -
		echo " "
		;;
	10) #RESTAURAR BACKUP JA FEITO
		source restaurar.sh
		echo "EM RESTAURAMENTO.............."
		sleep 5; clear
		;;
	4) #BACKUPS JA FEITOS
		read -p "INFORME O NOME DO USUARIO PARA VERIFICAR OS BACKUPS JA FEITOS:" user
		echo $(ls ~/backups/${user})
		sleep 5; clear
		;;
	0) #SAINDO DO SCRIPT
		echo -e "SAINDO......"
		rm -r /tmp/auxiliar
		echo "SCRIPT FINALIZADO!!!"
		sleep 3; clear
		exit 0
		;;

	esac
done
