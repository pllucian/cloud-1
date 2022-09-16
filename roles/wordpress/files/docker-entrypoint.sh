#!/bin/sh

service php7.4-fpm start
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp config create --allow-root --path=/var/www/wordpress \
		--dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --skip-check
	wp core install --allow-root --path=/var/www/wordpress/ \
		--url=$DOMAIN_NAME --title=$WEBSITE_NAME \
		--admin_user=$WP_USER --admin_password=$WP_PASSOWRD --admin_email=$EMAIL_ADDRESS
	chown -R www-data:www-data /var/www/wordpress/
fi
service php7.4-fpm stop

exec php-fpm7.4 --nodaemonize
