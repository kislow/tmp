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



# log rotation setup
LOG_FILE="logs/app.log"
MAX_LOG_SIZE=1000000  # in bytes
if [ -f $LOG_FILE ]; then
    LOG_SIZE=$(stat -c%s "$LOG_FILE")
    if [ $LOG_SIZE -ge $MAX_LOG_SIZE ]; then
        mv $LOG_FILE "${LOG_FILE}.1"
        touch $LOG_FILE
        echo "Log rotated: ${LOG_FILE} -> ${LOG_FILE}.1"
    fi
fi
echo "Log rotation check completed."

# Keeping last 3 logs
if [ -f "${LOG_FILE}.3" ]; then
    rm "${LOG_FILE}.3"
fi
if [ -f "${LOG_FILE}.2" ]; then
    mv "${LOG_FILE}.2" "${LOG_FILE}.3"
fi
if [ -f "${LOG_FILE}.1" ]; then
    mv "${LOG_FILE}.1" "${LOG_FILE}.2"
fi
echo "Log retention management completed."