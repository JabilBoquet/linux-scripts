#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash status.sh([a])
#[a] = string

#Ce script indique la présence et l'état du service dont le nom est entré en paramètre.

if (( $# != 1 )) #Vérifie si le nombre d arguments n est pas exactement 1
	then
	echo "Ce script prend exactement 1 argument : le nom du service à vérifier"
	exit
fi

systemctl cat --quiet $1 > /dev/null 2>&1  #Lance silencieusement un scan du service spécifié en argument. Le résultat de la commande ne s'affiche pas (redirigé dans null)

if (( $? == 0)) #Teste le code de sortie de la dernière commande. Ici, test si le scan du service a bien trouvé ce dernier.
	then
	echo -n "The specified service exist"
	status="$(systemctl is-active $1)" #Récupere dans la variable status l etat du service entre en parametre
	echo " and is "$status
	else #Cas ou le code de sortie n est pas 0 ie il y a eu un probleme : le service n a pas ete trouve
	echo "The specified service does not exist"
fi

