#!/bin/bash
# Enable Certbot AutoRenewal
sed -i "s_#entrypoint: _entrypoint: _" /src/proxy/docker-compose.yml
proxy-restart
