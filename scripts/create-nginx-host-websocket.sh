#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Falta el parámetro del host."
    echo "Uso: $0 <nombre_del_host>"
    return 1
fi
PROJECT="$1"
create-certificate $1.iskarion
sed "s/\$1/$PROJECT/g" /src/proxy/templates/nginx.conf.websocket.template > /src/proxy/proxy.conf.disabled/$1.conf
echo "Archivo $PROJECT.conf generado en /src/proxy/proxy.conf.disabled/"
