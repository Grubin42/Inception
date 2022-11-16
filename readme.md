# insception

> ### Descritpion
>
>Inception est un projet qui a pour bute de nous faire aprofondir nos connaissances dans l'outil Docker.

## Etape 1 installation VM

>* Installer une VM via [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
>* Télécharger [Alpine](https://www.alpinelinux.org/downloads/) ou [Debian](https://www.debian.org/releases/buster/).
>* Configurer la VM.
>   * Dans VirtualBox cliquer sur "nouvelle"
>   * Nommer la VM
>    * Séléctionner le type "Linux"
>    * Choisir la version "Linux 2.6/3.x/4.x/5.x(64-bit".
>    * Cliquer sur suivant.
>   * Séléctionner 4096 de MB
>    * Cliquer sur suivant jusqu'a finish.
>    * Cliquer sur "Configurer".
>    * Aller dans "Système" et l'onglet "Carte Mère", dans ordre d'amorçage mettez "disque dur" en tête de liste. Dans l'onglet "Processeur" séléctionner 2 coeurs.
>    * Aller dans "Affichage" onglet "écran", mettre "Mémoire Vidéo" a 128 MB et mettre le "Controlleur graphique" sur "VBoxVGA"
>    * Aller dans "Stockage" onglet "Unités de stockage" cliquer sur le symbole "rond bleu" en dessous de "Contrôleur: IDE". Dans l'onglet "Attributs" cliquer sur le symbole "rond bleu" et séléctionner l'Os précédement télécharger.
>    * cliquer sur OK.
>* Démmarer la VM.

## Etape 2 installation Alpine Linux

>* Installation Alpine Linux [Lien EN](https://wiki.alpinelinux.org/wiki/Alpine_newbie_installation#Login_as_root), [Lien FR](https://doc.ataxya.net/books/alpine-linux/page/installation-dalpine-linux).
>* ATTENTION pour le clavier séléctioner ch-fr_mac si mac qwertz, sinon us pour l'école.

## Etape 3 installation environement 

>* apk update
>* apk upgrade
>* reboot
>* Installation de Vim "apk add vim"
>* Installation de Docker [lien video](https://www.youtube.com/watch?v=6CVQ75nGVAY), [lien wiki](https://wiki.alpinelinux.org/wiki/Docker)
>    * cd /etc/apk enter
>    * vim repositoris
>    * décommenter http://mirror.leasweb.com/alpine/v3.16/community.
>    * apk update
>    * apk add docker

## Etape 4 création des containers


## CMD utile

>### CMD bash alpine
>
>* free mem 
>* apk update
>* apk upgrade
>* reboot
>* ps (process)

>### CMD Docker
>* "docker ps" liste les containers sur la machine
>   * "-a" liste TOUS les containers
>* "docker pull" dl une image Docker (ex; docker pull alpine)
>* "docker run" lance un container (ex: docker run alpine:latest) :latest = derniere version d'alpine
>   * "-tid" d pour detach i pour interactiv
>   * "--name" pour nommer le container
>   * "-p" redirection de port (ex: docker run -tid **-p 8080:80** --name web nginx:latest)
>   * "-v" pour créer un volume (ex: docker run -tid -p 8080:80 **-v /cheminDossierMachine:/cheminDossierDocker** --name web nginx:latest)
>   * "--mount" pour localiser un volume créé par "docker volume" (ex: docker run -tid -p 8080:80 **--mount source="nom du volume",target=/cheminDossierDocker** --name web nginx:latest)
>* "docker exec" pour ce connecter a un container (ex: docker exec -ti "name")
>   * "-ti" pour titiwhy
>* "docker inspect" liste les proprietés du container (ex: docker inspect web)
>* "docker start" pour redémarer un container (ex: docker start web)
>* "docker stop" pour arreter un container (ex: docker stop web)
>* "docker rm -f" supprime un container (ex: docker rm -f web)
>* "docker volume" pour gérer les volumes
>   * "create" créer un volume
>   * "inspect" detail les information du/des volumes
>   * "ls" liste les volumes
>   * "prune" supprime les volumes on utilisé
>   * "rm" détruit un volume
>* "docker image" liste les images Docker sur la machine


## Sources

>* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
>* [Alpine](https://www.alpinelinux.org/downloads/)
>* [Debian](https://www.debian.org/releases/buster/)
>* [Docker](https://docs.docker.com/get-started/overview/)
