#!/usr/bin/env bash
set -euo pipefail

# Hits a few key endpoints (e.g. /healthz, /api/status, /metrics) every few seconds.
# Measures response time and status code.
# Counts failures or slow responses.
# Fails the job if it exceeds tolerance.

SERVICE_URL="http://monitoring-stack.monitoring.svc.cluster.local:9090/-/healthy"
MAX_LATENCY_MS=500
DURATION_MINUTES=5
END_TIME=$((SECONDS + DURATION_MINUTES * 60))
FAIL_COUNT=0

echo "🔍 Running SLA verification for $SERVICE_URL ..."

while [ $SECONDS -lt $END_TIME ]; do
  RESPONSE_TIME=$(curl -o /dev/null -s -w "%{time_total}" "$SERVICE_URL" | awk '{print $1 * 1000}')
  STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$SERVICE_URL")

  if [[ "$STATUS_CODE" -ne 200 || "${RESPONSE_TIME%.*}" -gt $MAX_LATENCY_MS ]]; then
    echo "❌ SLA breach detected (code: $STATUS_CODE, latency: ${RESPONSE_TIME}ms)"
    ((FAIL_COUNT++))
  fi

  sleep 10
done

if [[ $FAIL_COUNT -gt 0 ]]; then
  echo "🚨 Service failed SLA during chaos test ($FAIL_COUNT breaches)"
  exit 1
fi

echo "✅ SLA maintained successfully during chaos window"
