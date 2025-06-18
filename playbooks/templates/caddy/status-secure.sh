#!/bin/bash
if [ -f "/etc/caddy/secure/secure-services.caddy" ]; then
  echo "🟢 Secure services are ENABLED"
elif [ -f "/etc/caddy/secure/secure-services.caddy.disabled" ]; then
  echo "🔴 Secure services are DISABLED"
else
  echo "❓ No secure services configuration found"
fi