#!/bin/bash

# 1. Validar que el parámetro $1 exista
if [ -z "$1" ]; then
    echo "Error: Falta el parámetro del proyecto."
    echo "Uso: $0 <nombre_del_proyecto>"
    return 1
fi

PROJECT="$1"

# 2. Validar que el directorio de ejecución NO sea /src/proxy
if [ "$(pwd)" = "/src/proxy" ]; then
    echo "Error: No se puede ejecutar este script dentro de /src/proxy."
    return 1
fi

# 3. Ejecutar el reemplazo con sed
mkdir web  2>/dev/null
sed "s/\$1/$PROJECT/g" /src/proxy/templates/docker-compose.php.template > docker-compose.yml
sed "s/\$1/$PROJECT/g" /src/proxy/templates/www.conf.php.template > www.conf

echo "Archivo docker-compose.yml generado con éxito para el proyecto: $PROJECT"
