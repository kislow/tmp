#!/bin/bash

# challenge-m.sh
# Purpose: Process application logs and user data

set -euo pipefail
LOG_FILE="logs/app.log"
OUTPUT_FILE="logs/processed.log"
USERS_FILE="data/users.txt"

echo "Processing users..."

cat $USERS_FILE >> $OUTPUT_FILE

echo "Processing logs..."

cat $LOG_FILE >> $OUTPUT_FILE

echo "Done"
