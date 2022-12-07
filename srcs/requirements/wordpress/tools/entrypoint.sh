# Modifier le fichier www.conf pour que ca fonctionne en local comme demande
target="/etc/php7/php-fpm.d/www.conf"

# Le fichier www.conf est relatif a php-fpm (necessaire communication avec le serveur)
grep -E "listen = 127.0.0.1" $target > /dev/null 2>&1
#$? contient le code de retour de la dernière opération
#si le retour d erreur et egale a 0 alors
if [ $? -eq 0 ]; then
	#remplacer la premiere partie par la deuxieme
	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $target
	echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> $target
	echo "env[MARIADB_USER] = \$MARIADB_USER" >> $target
	echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> $target
	echo "env[MARIADB_DB] = \$MARIADB_DB" >> $target
fi

# si tu ne trouve pas "fichier" alors
if [ ! -f "wp-config.php" ]; then
	cp /config/wp-config ./wp-config.php

	# laisser un temps d attente sinon les etapes suivantes seront skippees
	# La connexion a la base de donnees se fait dans ce temps
	sleep 5

	# Configuration du site wordpress
	#wp commande wordpress
	wp-cli.phar core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
    	--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email

	#wp plugin install redis-cache --activate
	wp-cli.phar plugin update --all

	# Installation de notre theme et "activation"
	wp-cli.phar theme install twentysixteen --activate

	wp-cli.phar user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD

	# Creation d'un article pour l'example (change number)
	wp-cli.phar post generate --count=2 --post_title="grubin's post"
fi

# faire tourner wordpress mais aussi pour que le container keep running
php-fpm7 --nodaemonize