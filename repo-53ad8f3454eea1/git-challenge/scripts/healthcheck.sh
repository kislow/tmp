#!/bin/bsh

# Healthcheck Script
# Checks whether an HTTP endpoint is reachable and prints a simple status.

URL="https://example.com/health"

# ================================================================
# WORK AREA – ALL PARTICIPANTS EDIT THIS BLOCK
#
# P1: Change the URL and improve the success message.
# P2: Add handling for non-200 status codes and more detailed output.
# P3: Add timing information (how long the request took).
# P4: Add colored output (OK/FAIL) or emojis.
# P5: Add support for passing the URL as an argument or env var.
#
# All of you will touch this area in different ways, so expect conflicts.
# ================================================================

echo "Checking health for $URL ..."
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS_CODE" -eq 200 ]; then
  echo "Service is healthy (status 200)."
else
  echo "Service is NOT healthy (status $STATUS_CODE)."
fi
