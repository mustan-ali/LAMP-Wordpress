#!/bin/bash

WORDPRESS_DIR="/var/www/html/2112121/wordpress"
BACKUP_DIR="/home/mustan/"
REMOTE_USER="remote_username"
REMOTE_HOST="remote_host_address"
REMOTE_BACKUP_DIR="remote_backup_directory"

TIMESTAMP=$(date +"%d%m_%H%M")

tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" -C "$WORDPRESS_DIR" .

scp "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_BACKUP_DIR"

if [ $? -eq 0 ]; then
    echo "Backup transferred successfully!"
else
    echo "Backup transfer failed."
fi

rm -f "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"