#/bin/bash

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
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

echo "Starting backup to $BACKUP_DIR..."

mkdir -p "$BACKUP_DIR"
touch "example.txt"
cp example.txt "$BACKUP_DIR/backup-$TIMESTAMP.txt"

echo "Backup completed successfully!"

echo "Backup finished at $TIMESTAMP"
