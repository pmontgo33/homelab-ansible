#!/bin/bash
cd /etc/caddy/secure

# Rename to enable
if [ -f "secure-services.caddy.disabled" ]; then
  mv secure-services.caddy.disabled secure-services.caddy
  
  # Reload Caddy configuration
  curl -X POST "http://localhost:2019/load" \
    -H "Content-Type: text/caddyfile" \
    --data-binary @/etc/caddy/Caddyfile
  
  echo "✅ Secure services enabled"
else
  echo "❌ Services already enabled or config file missing"
fi