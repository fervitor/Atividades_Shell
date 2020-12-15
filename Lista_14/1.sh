#!/bin/bash
sudo cp 1.sh /etc/profile.d/random_phrase.sh
echo $(date +%d/%m/%y)
op=$(( ( $RANDOM % 5 ) +1 ))
case $op in
	1)
		echo "TIRA ESSA CARA DE SONO E ACORDA PRA VIDA, VAGABUNDO"
		;;
	2)
		echo "A DATA DE HOJE É: $(date +%d/%m/%y)"
		;;

esac
