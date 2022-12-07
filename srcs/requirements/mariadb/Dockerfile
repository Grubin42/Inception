FROM	alpine:3.14

RUN		apk update && apk upgrade --no-cache

# Installation de mariadb et mariadb client
RUN		apk add --no-cache --quiet --update mariadb mysql-client

# Execution du script de creation de la base de donnees
COPY	./conf/create_db.sql /tmp/create_db.sql

# Copie du script entrypoint sur le container
COPY	./tools/entrypoint.sh ./

COPY 	./conf/mariadb-server.cnf /etc/my.cnf.d/

RUN 	chmod +x ./entrypoint.sh

# Installation de la base de donnee effective et authentification
RUN		mariadb-install-db --datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal

# Le user mysql doit etre le owner des dossiers relatifs a mysql
RUN		chown -R mysql:mysql /var/lib/mysql 

# Run entry point script
ENTRYPOINT [ "sh", "entrypoint.sh" ]
