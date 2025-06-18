#!/bin/bash
cd /etc/caddy/secure

# Rename to disable
if [ -f "secure-services.caddy" ]; then
  mv secure-services.caddy secure-services.caddy.disabled
  
  # Reload Caddy configuration
  curl -X POST "http://localhost:2019/load" \
    -H "Content-Type: text/caddyfile" \
    --data-binary @/etc/caddy/Caddyfile
  
  echo "✅ Secure services disabled"
else
  echo "❌ Services already disabled or config file missing"
fi