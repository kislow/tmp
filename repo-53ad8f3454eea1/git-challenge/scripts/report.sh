# System Report Script

# ================================================================
# WORK AREA – ALL PARTICIPANTS EDIT THIS BLOCK
#
# P1: Add new report section (CPU info)
# P2: Add new report section (Memory info)
# P3: Add new report section (Network info)
# P4: Add new report section (Disk I/O or Load Average)
# P5: Add a summary line at the end (e.g., "Report generated at ...")
#
# All participants add THEIR section *ABOVE this comment*.
# Any order is fine → the merge conflict will force you to combine them.
# ================================================================


echo "---- System Report ----"
echo "Hostname: $(hostname)"
echo "Date: $(date)"

echo "Disk Usage:"
df -h | head -5

echo "Uptime:"
uptime
