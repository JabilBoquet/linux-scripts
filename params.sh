#!/bin/bash
#Par LE BOULANGER Erwin
#Le 20/03/2023

#bash params.sh()
#params.sh prend autant d arguments d autant de types que voulus

#Renvoie son propre nom, puis le chemin par lequel il a été appelé et enfin tous ses arguments.

echo "nom : " $(basename "$0") #Récupère le nom du script.
echo "chemin : " $(dirname -- "${BASH_SOURCE[0]}") #Récupère le chemin par lequel le script a été appelé.

j=1

#La boucle suivante récupère le paramètre i et l'affiche.
for i in "$@" 
do
	echo "Argument $j : $i"
	j=$(($j + 1))
done
