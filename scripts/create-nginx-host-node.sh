#!/bin/bash

# 1. Validar que el parámetro $1 exista
if [ -z "$1" ]; then
    echo "Error: Falta el parámetro del host."
    echo "Uso: $0 <nombre_del_host>"
    return 1
fi

PROJECT="$1"

# Crear certificados
create-certificate $1.iskarion

# 3. Ejecutar el reemplazo con sed
sed "s/\$1/$PROJECT/g" /src/proxy/templates/nginx.conf.node.template > /src/proxy/proxy.conf.disabled/$1.conf

echo "Archivo $PROJECT.conf generado en /src/proxy/proxy.conf.disabled/"
