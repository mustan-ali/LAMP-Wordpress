<details><summary>Installation using Script</summary>

```
wget -O setup.sh https://raw.githubusercontent.com/mustan-ali/LAMP-Wordpress/main/setup.sh
```
```
chmod +x setup.sh
```
```
./setup.sh
```
</details>

<details><summary>Manual Installation</summary>

### Update package lists & upgrade packages
```
sudo apt-get update -y
```
```
sudo apt-get upgrade -y
```

### Install Apache, MySQL, PHP, & dependencies
```
sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql -y
```

### Enable firewall & configure Apache to allow HTTP & HTTPS traffic
```
sudo ufw enable
```
```
sudo ufw allow 22
```
```
sudo ufw allow 'Apache Full'
```
```
sudo ufw status
```

### Start MySQL & create database.
```
sudo service mysql start
```
```
sudo mysql
```
```
CREATE USER 'username_here'@'localhost' IDENTIFIED BY 'password_here';
```
```
CREATE DATABASE IF NOT EXISTS database_name_here;
```
```
GRANT ALL PRIVILEGES ON database_name_here.* TO 'username_here'@'localhost';
```
```
ALTER DATABASE database_name_here CHARACTER SET utf8 COLLATE utf8_general_ci;
```
```
FLUSH PRIVILEGES;
```
```
exit
```

### Download & install WordPress (replace ```2112121``` with your desired directory name)
```
cd /var/www/html/
```
```
sudo wget https://wordpress.org/latest.tar.gz
```
```
sudo tar -xf latest.tar.gz
```
```
sudo mv wordpress 2112121
```

### Copy WordPress config file & update it with database credentials
```
cd /var/www/html/2112121
```
```
sudo cp wp-config-sample.php wp-config.php
```

### Navigate to Apache site configurations & update path to WordPress directory (```DocumentRoot /var/www/html/2112121```)
```
cd /etc/apache2/sites-available/
```
```
sudo nano 000-default.conf
```

### Restart Apache to apply changes
```
sudo service apache2 restart
```
</details>
