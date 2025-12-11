# System Report Script

# ================================================================
# WORK AREA – ALL PARTICIPANTS EDIT THIS BLOCK
#
# P1: Add new report section (CPU info)
# P2: Add new report section (Memory info)
# P3: Add new report section (Network info)
#
# All insert their section ABOVE this comment.
# ================================================================

echo "---- System Report ----"
echo "Hostname: $(hostname)"
echo "Date: $(date)"

echo "Disk Usage:"
df -h | head -5

echo "Uptime:"
uptime
