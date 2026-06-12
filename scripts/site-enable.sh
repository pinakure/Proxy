#!/bin/bash

# 1. Configuración de máxima seguridad (Modo estricto)
IFS=$'\n\t'

# 2. Configuración de rutas estáticas
DISABLED_DIR="/src/proxy/proxy.conf.disabled"
ENABLED_DIR="/src/proxy/proxy.conf"
SRC_BASE_DIR="/src"

# 3. Validación y saneamiento del argumento de entrada
if [[ -z "${1:-}" ]]; then
    echo " Error: Debes especificar el nombre del sitio web." >&2
    echo "Uso: $0 <nombre_del_sitio>" >&2
    return 1
fi

# Saneamiento estricto: Solo permite letras, números, puntos, guiones y guiones bajos
SITE_NAME=$(echo "$1" | sed 's/[^a-zA-Z0-9._-]//g')

if [[ -z "$SITE_NAME" ]]; then
    echo " Error: El nombre del sitio contiene caracteres no válidos." >&2
    return 1
fi

echo " Intentando activar el sitio '${SITE_NAME}'..."

# Definición de rutas absolutas para este sitio
SOURCE_CONF="${DISABLED_DIR}/${SITE_NAME}.conf"
TARGET_CONF="${ENABLED_DIR}/${SITE_NAME}.conf"
SITE_DIR="${SRC_BASE_DIR}/${SITE_NAME}"

# 4. Verificaciones de existencia previas
if [[ ! -f "$SOURCE_CONF" ]]; then
    echo " Error: No se encontró el archivo de configuración en '${SOURCE_CONF}'." >&2
    return 1
fi

# 5. Copia segura de la configuración del proxy
cp "$SOURCE_CONF" "$TARGET_CONF"

if [[ ! -d "$SITE_DIR" ]]; then
    echo " Error: El directorio del proyecto '${SITE_DIR}' no existe." >&2
    return 1
fi

# 6. Cambio de directorio seguro (falla de inmediato si no puede acceder)
cd "$SITE_DIR"

# 7. Ejecución de comandos del contenedor
echo " Levantando contenedor '${SITE_NAME}'..."
if command -v docoup &> /dev/null; then
    docoup
else
    # Si 'docoup' es un alias y no un comando/función global, docker-compose suele ser el estándar:
    if command -v docker-compose &> /dev/null; then
        docker-compose up -d
    elif command -v docker &> /dev/null; then
        docker compose up -d
    else
        echo " Error: No se encontró 'docoup' ni comandos de Docker disponibles." >&2
        return 1
    fi
fi

# 8. Reinicio seguro del proxy
echo " Reiniciando el servicio proxy..."
if command -v proxy-restart &> /dev/null; then
    proxy-restart
else
    echo " Error: El comando 'proxy-restart' no está disponible." >&2
    return 1
fi

echo " Sitio '${SITE_NAME}' activado con éxito."
