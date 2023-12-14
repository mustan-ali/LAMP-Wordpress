#!/bin/bash

WORDPRESS_DIR="/var/www/html/2112121/wordpress"

BACKUP_DIR="/home/mustan/"

TIMESTAMP=$(date +"%d%m_%H%M")

tar -czf $BACKUP_DIR/wp-backup_$TIMESTAMP.tar.gz -C $WORDPRESS_DIR .

echo "Backup Completed successfully!"