FROM    alpine:3.14

RUN        apk update && apk upgrade --no-cache

RUN		apk add --no-cache --quiet --update php7 php-phar \
			php-json php-curl php-fpm php-mysqli php-iconv

RUN     apk add wget bash tar --no-cache

RUN      wget -P /var/www/ https://wordpress.org/latest.tar.gz

RUN 	cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

WORKDIR /var/www/wordpress

RUN		wget -P /usr/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN 	chmod +x /usr/bin/wp-cli.phar

COPY    conf/wp-config /config/wp-config

COPY    ./tools/entrypoint.sh /tmp/entrypoint.sh

RUN        chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]