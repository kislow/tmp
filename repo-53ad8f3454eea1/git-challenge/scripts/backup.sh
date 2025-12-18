#!/bin/bash

# Backup Script
# Creates a timestamped backup directory and copies sample files.

# ================================================================
# WORK AREA – ALL PARTICIPANTS WILL EDIT THIS BLOCK DIFFERENTLY
#
# P1: Update the header comment + change BACKUP_DIR value
# P2: Add 'set -e' and change BACKUP_DIR (different value)
# P3: Add a logging line and also change BACKUP_DIR (different value)
# P4: Add a line verifying that BACKUP_DIR exists (simple echo check)
# P5: Add a final summary echo (e.g., "Backup finished at ...")
#
# Everyone edits the SAME AREA → merge conflicts guaranteed.
# Keep the changes small and simple.
# ================================================================


set -u
BACKUP_DIR="/var/tmp/myapp-backup"

if [ ! -d "$BACKUP_DIR" ]; then
echo "Back up dir not found. Create: $BACKUP_DIR"
else 
echo "Directory already exists"

fi

echo "Directory is created: $BACKUP_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE="BACKUP_DIR/backup.log"

mkdir -p "$(dirname "$LOG_FILE")"

echo "$(date +%Y-%m-%d_%H-%M-%S) - Starting backup to $BACKUP_DIR..." | tee -a "$LOG_FILE"

mkdir -p "$BACKUP_DIR"
touch "example.txt"
cp example.txt "$BACKUP_DIR/backup-$TIMESTAMP.txt"

echo "$(date +%Y-%m-%d_%H:%M:%S) - Backup completed successfully to $BACKUP_DIR/backup-$TIMESTAMP.txt" | tee -a "$LOG_FILE"
