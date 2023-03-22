#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash users.sh()
#users.sh ne prend aucun argument

#Ce script affiche dans l ordre alphabétique la liste des utilisateurs dont des processus sont en cours d execution sur le systeme

if (( $# != 0))
	then
	echo "Cette fonction ne prend aucun argument ; ils seront ignorés"
fi

echo "Les Comptes Utilisateurs dont au moins un processus est en cours d'exécution sont :"
ps -aux | grep -v "USER" | cut -d ' ' -f 1 | sort | uniq
