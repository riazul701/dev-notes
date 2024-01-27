#!/bin/bash

# Tutorial: https://opensourcetechtrn.blogspot.com/search/label/Alpine 
# Add Repository to Alpine
#truncate -s 0 /etc/apk/repositories
#echo 'https://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
#echo 'https://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
#echo 'https://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
#echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

# Alpine LAMP deployment
apk update
apk add apache2
apk add mariadb mariadb-client
service apache2 start

# Check the homepage at the machine's IP, confirm you see 'It works'
# Source files are located in /var/www/localhost/htdocs#
# Ensure repositories are added - /etc/apk/repositories  <- uncomment commmunity and edge
apk add php7 php7-mysqli phpmyadmin php7-apache2
service apache2 restart

# Create php test doc - nano phpinfo.php

# Setup Maria
# Error message appears, need to first run the /etc/init.d/mariadb setup
# Re-run service mariadb start
# Then we change the password for mariadb root user (this gets created on the system by the mariadb-client).
# Run mysql_secure_installation
# Walk through the prompts to set a root user password
/etc/init.d/mariadb setup
service mariadb start

# Setup phpmyadmin
chmod -R 777 /usr/share/webapps/phpmyadmin
chmod 755 /etc/phpmyadmin/config.inc.php
ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
sed -i 's/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\] = false;/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\] = true;/g' /etc/phpmyadmin/config.inc.php

# Setup phpmyadmin user in MariaDB
#mysql -u root -p
# - enter password

# >CREATE USER 'pmauser'@'%' IDENTIFIED BY '<password of choice>';
# >GRANT ALL PRIVILEGES ON *.* TO 'pmauser'@'%' WITH GRANT OPTION;
# >FLUSH PRIVILEGES;

# Open page server IP/phpmyadmin.
# Enter the pmauser and given password.
# Now phpmyadmin can be used to manage the mariadb and create new databases
# To ensure services start on boot need to run
# rc-update add <service name>