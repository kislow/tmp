#!/bin/bash

# challenge-f.sh
# Purpose: Create a simple backup file for the application

BACKUP_DIR="/var/tmp/m-backups"
BACKUP_FILE="backup.txt"
SOURCE_FILE="data/users.txt"

if [[ ! -f "$BACKUP_FILE" ]]; then
  echo "required file '$FILE' does not exist"
  touch "$BACKUP_FILE"
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
  echo " Backup directory '$BACKUP_DIR' does not exist. Creating it."
  mkdir -p "$BACKUP_DIR"
fi

if [[ ! -s $SOURCE_FILE ]]; then
    echo "$SOURCE_FILE is not empty!"
fi

if [[ ! -s $BACKUP_FILE ]]; then
    echo "$BACKUP_FILE is not empty!"
else
    echo "Add text" > $BACKUP_FILE
    echo "$BACKUP_FILE was empty, added text"
fi

echo "Starting male challenge backup..."

# Copy users file into backup directory
cp $SOURCE_FILE $BACKUP_DIR/$BACKUP_FILE

echo "Backup completed"
