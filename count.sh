#!/bin/bash
#Par LE BOULANGER Erwin
#Le 20/03/2023

#bash count.sh([a])
#a=[integer]

#Renvoie les entiers de 1 à [a] inclus

if (( $# != 1)) #Vérifie si le nombre d'arguments entré est différent de 1
	then
	echo "Veuillez donner exactement 1 argument"
	exit
fi
 
a=$1
if [[ $a =~ ^[0-9]+$ ]]; #Cette ligne vérifie que tous les caractères du paramètre entré sont parmi [0,1,2,3,4,5,6,7,8,9]
	then for ((i = 1 ; i <= a ; i++)); do
  		echo "$i"
	done
else
	echo "Veuillez entrer un entier en tant que paramètre"
fi
