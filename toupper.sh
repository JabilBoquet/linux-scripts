#...
#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash toupper.sh([a],[b]...)
#[a] = string
#[b] = string
#...

#Ce script passe en majuscule tous ses arguments.

read a
echo ${a^^}

for i in $@ #Boucle pour chaque argument
do
	echo -n ${i^^} " " #Affiche le paramètre dont c est l itération en majuscule
done
echo ""

