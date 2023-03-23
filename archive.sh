#!/bin/bash
#Par LE BOULANGER Erwin
#Le 22/03/2023

#bash archive.sh([a])
#[a] = string

#Ce script vérifie qu il se lance avec des droits d administrateur 
#Puis si c est le cas, il vérifie que l argument donné correspond à un nom d utilisateur
#Puis si c'est le cas, il effectue une sauvegarde du dossier personnel de l utilisateur specifie en parametre
#Sur un serveur distant via un canal securise.

#!!IMPORTANT!!
#En l etat, ce script part de l idee que le serveur de backup est connu et parametre, avec un
#repertoire /backup, et un compte proprietaire de ce dernier nomme servicebackup
#Une grosse faille de securite est presente, avec la presence du mot de passe dudit compte dans le script
#Il serait preferable de mettre en place une connexion par cle ssh.

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




dossier1="/home/${1}" #Variable du dossier a copier
dossier2="/backup/${1}-$(date --iso-8601).tgz" #Variable de la copie archivee du dossier


if [ ! -d "/backup" ] #Vérifie si le dossier /backup n existe pas deja
	then
	mkdir /backup
fi

if [ -d $dossier2 ] #Vérifie si le dossier de /backup/<utilisateur>-<Date du jour> existe déja
	then
	rm -R $dossier2 #Supprime le dossier anterieur de backup
fi


tar -czf $dossier2 $dossier1 # effectue l archivage du dossier

#La ligne suivante est la plus sujette a debats. Le mot de passe du compte servicebackup est passe
#en clair dans la commande scp. Privilegier plutot une connexion ssh par cle
sshpass -p "Azerty123" scp -p /backup/test-2023-03-23.tgz servicebackup@192.168.1.34:/backup 
#Si identification par cle possible, commenter la ligne precedente et decommenter la suivante.
#scp -p /backup/test-2023-03-23.tgz servicebackup@192.168.1.34:/backup
