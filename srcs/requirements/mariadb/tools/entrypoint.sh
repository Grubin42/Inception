# controle si la bd est deja cree
cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	# & pour effectuer une "modification sur le serveur MySQL" - mysql driver avec des options
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	# attendre que la base de donnee soit bien accessible, mysql lance
	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi
# Lancement du serveur mysql de facon la plus securisee sur Uinix
usr/bin/mysqld_safe --datadir=/var/lib/mysql