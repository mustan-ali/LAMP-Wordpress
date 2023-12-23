#!/bin/bash

read -p "Enter directory name for WordPress installation: " directory_name

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql -y

sudo ufw enable
sudo ufw allow 22
sudo ufw allow 'Apache Full'
sudo ufw status

sudo service mysql start
sudo mysql <<EOF
CREATE USER 'username_here'@'localhost' IDENTIFIED BY 'password_here';
CREATE DATABASE IF NOT EXISTS database_name_here;
GRANT ALL PRIVILEGES ON database_name_here.* TO 'username_here'@'localhost';
ALTER DATABASE database_name_here CHARACTER SET utf8 COLLATE utf8_general_ci;
FLUSH PRIVILEGES;
exit
EOF

cd /var/www/html/
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xf latest.tar.gz
sudo mv wordpress "$directory_name"

cd "$directory_name"
sudo cp wp-config-sample.php wp-config.php

cd /etc/apache2/sites-available/
sudo sed -i "s|DocumentRoot /var/www/html|DocumentRoot /var/www/html/$directory_name|" 000-default.conf

sudo service apache2 restart

echo "------------------------------------------------"
echo "WordPress installation complete!"
echo "------------------------------------------------"