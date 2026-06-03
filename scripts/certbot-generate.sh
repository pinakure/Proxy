#!/bin/bash
return
certify() {
    # Verificar si se pasaron dominios como argumento
    if [ $# -eq 0 ]; then
        echo "Error: Debes especificar al menos un dominio."
        echo "Uso: certify dominio.com"
        return 1
    fi

    # Ejecutar certbot expandiendo todos los dominios pasados
    certbot certonly \
        --webroot \
        --webroot-path=/var/www/certbot \
        --email pinakure@gmail.com \
        --agree-tos \
        --no-eff-email \
        $(printf " -d %s" "$@")
}

QDN="ddns.net"
FQDN="iskarion.ddns.net"
certify \
    m4gtracker.$QDN \
    melodify.$QDN \
    smiker.$QDN \
    auth.$FQDN \
    cutremux.$FQDN \
    db.$FQDN \
    erebus.$FQDN \
    flysim.$FQDN \
    hq.$FQDN \
    livingworlds.$FQDN \
    minesweeper.$FQDN \
    pacman.$FQDN \
    pinball.$FQDN \
    scenia.$FQDN \
    tetris.$FQDN \
    thingcodex.$FQDN \
    ticketshare.$FQDN \
    trickynoid.$FQDN \
    warhammer.$FQDN
