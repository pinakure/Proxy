#!/bin/bash
# Disable Certbot AutoRenewal
sed -i "s_entrypoint: \"/bin/sh -c 'source /src/certbot-entrypoint.sh'\"_#entrypoint: \"/bin/sh -c 'source /src/certbot-entrypoint.sh'\"_" /src/proxy/docker-compose.yml
proxy-restart
