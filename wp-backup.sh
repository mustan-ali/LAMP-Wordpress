#!/bin/bash

REG_NO=2112121
REMOTE_USER="remote_username"
REMOTE_HOST="remote_host_address"

rsync -r $REMOTE_USER@$REMOTE_HOST:/var/www/html/$REG_NO ~/