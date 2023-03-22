#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash last_arg.sh([a],[b]...)
#Prend autant d arguement que voulus, de n importe quels types

#Ce script renvoie le dernier argument entré. Si aucun n est entré, il renvoie un message d erreur

if [[ $1 == $false ]] #Vérifie l existence d un premier argument
then
	echo "Veuillez entrer au moins un argument"
	exit
fi
echo "${@: -1}" #Récupère l'argument en position -1 de la liste des arguments, ce qui donne le dernier de la liste.

