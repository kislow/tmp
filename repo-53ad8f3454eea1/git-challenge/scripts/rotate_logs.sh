#!/etc/bash

# Log Rotation Script
# Compresses .log files in a given directory.

LOG_DIR="/var/tmp/myapp-logs"

# ================================================================
# WORK AREA – ALL PARTICIPANTS EDIT THIS BLOCK
#
# P1: Update the comment and change LOG_DIR to a different default.
# P2: Add safety checks (directory exists, handle no files).
# P3: Add a timestamp in the compressed filename.
# P4: Add a dry-run mode (e.g. DRY_RUN=true shows what would happen).
# P5: Add a summary at the end (how many files were rotated).
#
# Everyone will touch this section differently → merge conflict heaven.
# ================================================================

echo "Rotating logs in $LOG_DIR ..."

mkdir -p "$LOG_DIR"

for file in "$LOG_DIR"/*.log; do
  [ -e "$file" ] || continue
  gzip -f "$file"
done

echo "Log rotation completed."
