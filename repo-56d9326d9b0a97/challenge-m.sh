#!/bin/bash

# challenge-f.sh
# Purpose: Create a simple backup file for the application

BACKUP_DIR="/var/tmp/m-backups"
BACKUP_FILE="backup.txt"
SOURCE_FILE="data/users.txt"

echo "Starting male challenge backup..."

# Copy users file into backup directory
cp $SOURCE_FILE $BACKUP_DIR/$BACKUP_FILE

echo "Backup completed"
