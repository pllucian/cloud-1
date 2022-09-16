#!/bin/sh

service php7.4-fpm start
if [ ! -f /var/www/phpmyadmin/config.inc.php ]; then
	cp /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php
	sed -i "s/\$cfg\['blowfish_secret'\] = '';/\$cfg\['blowfish_secret'\] = '$(pwgen -s 32 1)';/g" \
		/var/www/phpmyadmin/config.inc.php
	sed -i "s/localhost/$DB_HOST/g" /var/www/phpmyadmin/config.inc.php
	chown -R www-data:www-data /var/www/phpmyadmin/
fi
service php7.4-fpm stop

exec php-fpm7.4 --nodaemonize
