#!/bin/bash

# Validar que existan ambos parámetros ($1 y $2)
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Faltan parámetros."
    echo "Uso: $0 <usuario> <contraseña>"
    echo "Ejemplo: $0 juan mi_password"
    return 1 2>/dev/null || exit 1
fi

# Ejecutar los comandos docker
docker exec -it mail setup email add "$1@iskarion.ddns.net" "$2"
docker exec -it webmail setup email add "$1@iskarion.ddns.net" "$2"
