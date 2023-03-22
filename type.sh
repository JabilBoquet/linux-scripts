#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash type.sh([a])
#[a] = string

#Ce script indique si la chaine de caractères donnée en entrée contient des consonnes, voyelles et/ou chiffres

if [[ $1 =~ [AEIOUYaeiouy] ]] #Vérifie si l'argument contient une voyelle
then
	echo "Voyelle"
fi

if [[ $1 =~ [B-DF-HJ-NP-TV-XZb-df-hj-np-tv-xz] ]] #Vérifie si l'argument contient une consonne
then
        echo "Consonne"
fi

if [[ $1 =~ [0-9] ]] #Vérifie si l'argument contient un chiffre
then
        echo "Chiffre"
fi

