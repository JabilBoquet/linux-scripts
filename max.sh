#!/bin/bash
#Par LE BOULANGER Erwin
#Le 20/03/2023

#bash max.sh([a];[b])
#[a]=integer
#[b]=integer

#Compare les deux entiers entrés en arguments pour renvoyer le plus grand des deux.

if [[ $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ ]];
then
	if (( $1 >= $2 ));
	then
		echo "Le plus grand des deux est $1"
	else
		echo "Le plus grand des deux est $2"
	fi
else
	echo "Les deux arguments attendus sont de type [integer]"
fi

