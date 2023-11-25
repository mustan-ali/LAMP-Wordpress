## WordPress + LAMP Stack Installation
---

#### Update package lists & upgrade packages
```
sudo apt-get update -y
```
```
sudo apt-get upgrade -y
```

#### Install Apache, MySQL, PHP, & dependencies
```
sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql -y
```

#### Enable firewall & configure Apache to allow HTTP & HTTPS traffic
```
sudo ufw enable
```
```
sudo ufw allow 'Apache Full'
```
```
sudo ufw status
```

#### Start MySQL & create database & user (replace ```mydb```, ```db_user```, and ```db_pass123``` with your desired database name, username, and password)
```
sudo service mysql start
```
```
sudo mysql
```
```
CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'db_pass123';
```
```
CREATE DATABASE IF NOT EXISTS mydb;
```
```
GRANT ALL PRIVILEGES ON mydb.* TO 'db_user'@'localhost';
```
```
ALTER DATABASE mydb CHARACTER SET utf8 COLLATE utf8_general_ci;
```
```
FLUSH PRIVILEGES;
```
```
exit
```

#### Download & install WordPress (replace ```2112121``` with your desired directory name)
```
cd /var/www/html/
```
```
sudo mkdir 2112121
```
```
cd 2112121/
```
```
sudo wget https://wordpress.org/latest.tar.gz
```
```
sudo tar -xzvf latest.tar.gz
```

#### Copy WordPress config file & update it with database credentials
```
cd /var/www/html/2112121/wordpress
```
```
sudo cp wp-config-sample.php wp-config.php
```
```
sudo nano wp-config.php
```

#### Navigate to Apache site configurations & update path to WordPress directory (```DocumentRoot /var/www/html/2112121/wordpress/```)
```
cd /etc/apache2/sites-available/
```
```
sudo nano 000-default.conf
```

#### Restart Apache to apply changes
```
sudo service apache2 restart
```
