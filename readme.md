# insception

> ### Descritpion
>
>Inception est un projet qui a pour bute de nous faire aprofondir nos connaissances dans l'outil Docker.

## Etape 1 installation VM

>* Installer une VM via [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
>* Télécharger [Debian](https://www.debian.org/releases/buster/).
>* Configurer la VM.
>   * Dans VirtualBox cliquer sur "nouvelle"
>   * Nommer la VM
>   * Choisir un dossier pour la machine (ex: goinfre || sgoinfre)
>   * Séléctionner le type "Linux"
>   * Choisir la version "Debian (64-bit)".
>   * Cliquer sur continue.
>   * Séléctionner 4096 de MB
>   * Cliquer sur suivant jusqu'a definir la quantite de memoire allouee (min 30gb).
>   * Cliquer sur "Create".
>   * Cliquer sur "Settings".
>   * Aller dans "display" -> Scale Factor -> max (300%)
>   * Aller dans "Stockage" onglet "Unités de stockage" cliquer sur le symbole "rond bleu" en dessous de "Contrôleur: IDE". Dans l'onglet "Attributs" cliquer sur le symbole "rond bleu" et séléctionner l'Os précédement télécharger.
>   * cliquer sur OK.
>   * Pour autoriser le transfert de fichier entre la vm et la machine hote (A FAIRE A CHAQUE FOIS QUE VOUS RE-STARTER LA VM)
>       * settings -> shared folders -> cliquer petit + vert sur dessin dossier
>           Selectionne folder path -> choisir le dossier de la machine hote (ex: document/inception)
>       * Cocher -> auto mount
>       * pour lier le dossier selectionner de la machine hote a sa VM, il faut aller dans celle ci et cree un dossier vide qui acceuillera les fichiers du dossier selection -> sudo mount -t vboxsf nomDossierMachineHote nomDossierVM
>* Démmarer la VM.

## Etape 2 installation Debian

>* Selectionne "Install"
>* Selectionne la langue -> french, le pays -> suisse, le clavier -> depend de votre clavier
>* Nom de la machine -> laisser comme c'est
>* Domaine -> laisser comme c'est
>* MDP root -> au choix
>* new user -> au choix
>* identifiant user -> au choix
>* MDP user -> au choix
>* Mode de partition -> disque entier
>* Schema de partition -> partion /home, /var et /tmp separees
>* Terminer
>* Appliquer les changements sur les disques -> oui
>* Faut il analyser d'autre supports d'installation -> non
>* Pays du miroir de l'archive -> suisse
>* Miroir de l'archive -> deb.debian.org
>* mandataire HTTP -> vide
>* Participation a l'etude -> non
>* Logiciel a installer -> server ssh
>* installer le programme GRUB -> oui
>* Peripherique /dev/sda

## Etape 3 installation environement 

> Une fois dans la VM
>* passer en mode root -> su dans le terminal
>* Installer curl -> sudo apt-get install -y curl 
>* Installer make -> sudo apt-get install -y make 
>* Installer docker -> sudo apt-get install -y docker.io 
>* Installer docker-compose -> sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
>* Accorder l'autorisation d'exécuter docker compose -> sudo chmod +x /usr/local/bin/docker-compose
>* Verifier si bien installé -> sudo docker-compose version
>* Lier le dossier machine hote a la vm 
>   * cree un dossier -> mkdir test
>   * sudo mount -t vboxsf Inception test (A faire dans le dossier Bureau de la VM)

## Etape 4 mise en place connexion SSH

>* Aller dans Settings de VirtualBox -> Network -> Adapter 1 -> Advanced -> Port Forwarding
>* Ajouter une nouvelle règle (icone + vert) ![ssh](/img_readme/Screen%20Shot%202022-11-25%20at%203.51.56%20PM.png)
>* Dans la VM tapper en mode root "sudo systemctl restart ssh"
>* Dans la VM tapper en mode root "sudo service sshd status"
>* Dans la machine hote tapper "ssh your_username@127.0.0.1 -p 2222"
>* (exit to disconnect)

## Etape 5 création des containers

>### CMD dockerfile
>
> [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
>* FROM Image parente
>* MAINTAINER Image parente
>* ARG Variables passées comme paramètres à la construction de l'image
>* ENV Variable d'environnement
>* LABEL Ajout de métadonnées
>* VOLUME Crée un point de montage
>* RUN Commande(s) utilisée(s) pour construire l'image
>* ADD (Ajoute un fichier dans l'image *ADD vs COPY)
>* COPY Ajoute un fichier dans l'image
>* WORKDIR Permet de changer le chemin courant
>* EXPOSE Port(s) écouté(s) par le conteneur
>* USER Nom d'utilisateur ou UID à utiliser
>* ONBUILD Instructions exécutées lors de la construction d'images enfants
>* CMD Exécuter une commande au démarrage du conteneur
>* ENTRYPOINT Exécuter une commande au démarrage du conteneur

>### Création du container nginx
>#### Dockerfile
>#### Script

>### Création du container wordpress-php
>#### Dockerfile
>#### Script

>### Création du container mariaDB
>#### Dockerfile
>#### Script

## Création d'un docker-compose.yml

>![ex .yml](/img_readme/1_TeBgetHlGCePc9Nq0__AtQ.png)
>
>[doc docker-compose.yml](https://docs.docker.com/compose/compose-file/)

## Création d'un script bash

>Ici nous avons besoin d'un script pour......
> 
>[doc script bash ubuntu](https://doc.ubuntu-fr.org/tutoriel/script_shell)
>
>[doc script bash freeCodeCamp](https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/)
>
>[Bash scripting cheatsheet](https://devhints.io/bash)


## CMD utile

>### CMD bash alpine
>
>* "free mem" afficher la mémoire libre
>* "apk update" met à jour apk
>* "apk upgrade" ??
>* "reboot" relance la vm
>* "ps" affiche les process en cour
>* "tree" affiche l'arborésence du dossier courant (à dl via brew)
>* "cat /etc/hosts" affiche le fichier etc/hosts

>### CMD Docker utile
>* "docker ps" liste les containers sur la machine
>   * "-a" liste TOUS les containers
>* "docker pull" dl une image Docker (ex; docker pull alpine)
>* "docker run" lance un container (ex: docker run alpine:latest) :latest = derniere version d'alpine
>   * "-tid" ??
>   * "--name" pour nommer le container
>   * "-p" redirection de port (ex: docker run -tid **-p 8080:80** --name web nginx:latest)
>   * "-v" pour créer un volume (ex: docker run -tid -p 8080:80 **-v /cheminDossierMachine:/cheminDossierDocker** --name web nginx:latest)
>   * "--mount" pour localiser un volume créé par "docker volume" (ex: docker run -tid -p 8080:80 **--mount source="nom du volume",target=/cheminDossierDocker** --name web nginx:latest)
>   * "--volumes-from NomDuContainerAutre" pour indiquer un volume situé dans un autre container
>   * "--rm" supprime le container une fois executé
>   * "--network" ??
>   * "--link" crée un lien entre le container run et un autre container (ex: docker run -tid --name NomContainer **--link NomAutreContainer** NomImage(alpine:latest))
>   * "--add-host" connect au reseau ce qu'on veut (docker run -tid --name NomContainer **--add-host NomHost:122.0.25.3** NomImage)
>* "docker exec" pour ce connecter a un container (ex: docker exec -ti sh)
>   * "-ti" pour titiwhy
>   * "sh" pour utiliser bash dans le container
>* "docker inspect" liste les proprietés du container (ex: docker inspect web)
>* "docker start" pour redémarer un container (ex: docker start web)
>* "docker stop" pour arreter un container (ex: docker stop web)
>* "docker rm -f" supprime un container (ex: docker rm -f web)
>* "docker volume" pour gérer les volumes
>   * "create" créer un volume
>   * "inspect" detail les information du/des volumes
>   * "ls" liste les volumes
>   * "prune" supprime les volumes non utilisé
>   * "rm" détruit un volume
>* "docker image" liste les images Docker sur la machine
>* "docker build -t NomImage:version ." execute l'image **ATTENTION le point final est très important**
>   * "--no-cache" supprime le cache du container
>* "docker history NomImage:version" permet de voir les séquences joués lors de la création de l'image via le dockerfile
>* "docker network"
>   * "ls" pour afficher les reseaux
>   * "create" créer un reseau
>   * "-d" ??
>   * "--subnet" ??

## Sources

>* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
>* [Alpine](https://www.alpinelinux.org/downloads/)
>* [Debian](https://www.debian.org/releases/buster/)
>* [Docker](https://docs.docker.com/get-started/overview/)
>* [Docker-compose tuto](https://linuxiac.com/how-to-set-up-lemp-stack-with-docker-compose/)