#!/bin/bash
# Disable Certbot AutoRenewal
sed -i "s_entrypoint: _#entrypoint: _" /src/proxy/docker-compose.yml
proxy-restart
