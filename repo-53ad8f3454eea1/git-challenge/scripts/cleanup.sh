#!/bin/bash

# Cleanup Script
# Removes temporary directories and stale log files.

TMP_DIR="/tmp/myapp"
LOG_DIR="/var/tmp/myapp-logs"

# ================================================================
# WORK AREA – ALL PARTICIPANTS EDIT THIS BLOCK
#
# P1: Add a timestamp echo + update the header comment
# P2: Add a simple log() function + modify one echo line
# P3: Add safety checks before deleting directories
# P4: Add a line that prints how many files will be deleted
# P5: Add a final summary line (e.g., "Cleanup completed at ...")
#
# Everyone will modify the SAME AREA → merge conflicts guaranteed.
# Keep your changes small and simple.
# ================================================================


echo "Cleaning up..."
echo "Removing $TMP_DIR and $LOG_DIR ..."

rm -rf "$TMP_DIR"
rm -f "$LOG_DIR"/*.log 2>/dev/null

echo "Cleanup done."

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

echo "Cleanup completed at $TIMESTAMP"
