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
>* ATTENTION pour le clavier séléctioner ch-fr_mac.

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

## Etape 4 


## CMD utile

>### CMD bash alpine
>
>* free mem 
>* apk update
>* apk upgrade
>* reboot

## Sources

>* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
>* [Alpine](https://www.alpinelinux.org/downloads/)
>* [Debian](https://www.debian.org/releases/buster/)
