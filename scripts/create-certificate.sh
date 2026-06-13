#!/bin/bash
disable-certbot-autorenewal
echo "docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d $1.ddns.net --email pinakure@gmail.com --agree-tos --no-eff-email"
cd /src/proxy
docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d $1.ddns.net --email pinakure@gmail.com --agree-tos --no-eff-email
enable-certbot-autorenewal
