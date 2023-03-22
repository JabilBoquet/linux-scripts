#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash guess.sh()
#Ne prend aucun paramètre

#Un nombre aléatoire entre 1 et 1000 est choisi. Le joueur a 10 tentatives pour le deviner.

# !! A ce jour, ne teste si les valeurs entrées sont bien des nombres !!

a=$(($(($RANDOM% 999)) + 1)) #Nombre aléatoire à deviner
b=10 #Nombre de tentatives pour deviner

for ((i=1 ; i<=$b ; i++))
	do
	echo "Entrez un nombre entre 1 et 1000 :"
	read number #Demande à l utilisateur d entrer une valeur
	if (($number < $a)) #Test inférieur
		then
		echo "Le nombre à deviner est plus grand"
	elif (($number > $a)) #Test supérieur
		then
		echo "Le nombre à deviner est plus petit"
	else  #Test égalité
		echo "Vous avez gagné"
		exit #Victoire ! Quitte de force le script
	fi
done 
