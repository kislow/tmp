#!/bin/bash

# Cleanup Script
# Removes temporary directories and stale log files.

TMP_DIR="/tmp/myapp"
LOG_DIR="/var/tmp/myapp-logs"

# ================================================================
# WORK AREA – ALL PARTICIPANTS EDIT THIS BLOCK
#
# P1: Add a timestamp echo + comment update
# P2: Add a log() function + update the header section
# P3: Improve safety: add checks, modify same echo lines
#
# All edits overlap intentionally.
# ================================================================

echo "Cleaning up..."
echo "Removing $TMP_DIR and $LOG_DIR ..."

rm -rf "$TMP_DIR"
rm -f "$LOG_DIR"/*.log 2>/dev/null

echo "Cleanup done."
