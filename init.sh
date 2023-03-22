#!/bin/bash
#Par LE BOULANGER Erwin
#Le 21/03/2023

#bash init.sh([a])
#[a] =  string

#Crée dans le répertoir courant un répertoire donc le nom est entré en argument.
#Y crée deux fichiers README.md et change.log
#Affiche le contenu dudit dossier

fichier1=README.md #Nom du fichier1 à créer
fichier2=change.log #Nom du fichier2 à créer
mkdir "$1" #Crée à l'emplacement actuel un dossier dont le nom est donné en paramètre
> "$1""/""$fichier1" #Crée dans ce dossier le fichier1
> "$1""/""$fichier2" #Crée dans ce dossier le fichier2
ls -hal "$1" #Affiche le contenur du dossier créé
