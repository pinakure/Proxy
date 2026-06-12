#!/bin/bash
# Enable Certbot AutoRenewal
sed -i "s_#entrypoint: \"/bin/sh -c 'source /src/certbot-entrypoint.sh'\"_entrypoint: \"/bin/sh -c 'source /src/certbot-entrypoint.sh'\"_" /src/proxy/docker-compose.yml
proxy-restart
