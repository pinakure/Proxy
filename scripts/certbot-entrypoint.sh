#!/bin/bash
if [ "$CERTBOT_RENEWAL" = "1" ]; then
    echo "Running Certbot in renewal mode"
    source /src/certbot-renewal.sh
else
    echo "Running Certbot in generation mode"
    source /src/certbot-generate.sh
fi
