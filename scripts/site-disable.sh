
#!/bin/bash
echo "Intentando deshabilitar site '$1'..."
# 1. Configuración de máxima seguridad (Modo estricto)
IFS=$'\n\t'

# 2. Configuración de rutas (Centralizada y protegida)
CONFIG_DIR="/src/proxy/proxy.conf"

# 3. Validación de argumentos de entrada
if [[ -z "${1:-}" ]]; then
    echo " Error: Debes especificar el nombre del sitio web." >&2
    echo " Uso: $0 <nombre_del_sitio>" >&2
    return 1
fi

# Saneamiento: Filtrar caracteres peligrosos para evitar inyección de rutas
# Solo permite letras, números, puntos, guiones y guiones bajos
SITE_NAME=$(echo "$1" | sed 's/[^a-zA-Z0-9._-]//g')

if [[ -z "$SITE_NAME" ]]; then
    echo " Error: El nombre del sitio contiene caracteres no válidos." >&2
    return 1
fi

# Construcción de la ruta absoluta final
CONF_FILE="${CONFIG_DIR}/${SITE_NAME}.conf"

# 4. Verificación de existencia antes de borrar
if [[ ! -f "$CONF_FILE" ]]; then
    echo " Advertencia: El archivo de configuración '${CONF_FILE}' no existe." >&2
    return 0
fi

# 5. Ejecución segura de operaciones
echo " Deshabilitando sitio: ${SITE_NAME}..."
rm -f "$CONF_FILE"

# 6. Reinicio seguro del proxy
if command -v proxy-restart &> /dev/null; then
    echo " Reiniciando el servicio proxy..."
    proxy-restart
else
    echo " Error: El comando 'proxy-restart' no está disponible en este sistema." >&2
    return 1
fi

echo " Proceso completado con éxito."
