#!/bin/bash
#Par LE BOULANGER Erwin
#Le 22/03/2023

#bash archive.sh([a])
#[a] = string

#Ce script vérifie qu il se lance avec des droits d administrateur 
#Puis si c est le cas, il vérifie que l argument donné correspond à un nom d utilisateur
#Puis si c'est le cas, il effectue une sauvegarde du dossier personnel de l utilisateur specifie en parametre
#Sur un serveur distant via un canal securise.

if (( $# != 1 )) #Vérifie si le nombre d arguments n est pas exactement 1
        then
        echo "Ce script prend exactement 1 argument : le nom du d'utilisateur dont on veut sauvegarder le dossier"
        exit
fi

if (( $(id -u) != 0 )) #Vérifie si le script a ete lance sans droits administrateurs
	then
	echo "Ce script est fait pour ne s'exécuter qu'en tant qu'administrateur. Veuillez vérifier vos droits et recommencer."
	exit
fi

getent passwd $1  > /dev/null

if (( $? != 0 )) #Vérifie si le nom d utilisateur renseigné n existe pas
	then
	echo "Ce nom d'utilisateur n'existe pas. Veuillez réessayer"
	exit
fi




dossier1="/home/${1}"
dossier2="/backup/${1}-$(date --iso-8601).tgz"


if [ ! -d "/backup" ] #Vérifie si le dossier /backup n existe pas deja
	then
	mkdir /backup
fi

if [ -d $dossier2 ] #Vérifie si le dossier de /backup/<utilisateur>-<Date du jour> existe déja
	then
	rm -R $dossier2 #Supprime le dossier anterieur de backup
fi


tar -czf $dossier2 $dossier1
