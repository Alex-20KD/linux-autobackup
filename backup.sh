#!/bin/bash

# --- CONFIGURACIÓN ---
# Directorio que quieres respaldar (tus proyectos)
SOURCE="/home/$USER/Documentos"
# Donde se guardarán los backups
DEST="/home/$USER/Backups"
# Nombre del archivo con fecha y hora
DATE=$(date +%Y-%m-%d_%H-%M)
FILENAME="respaldo_proyectos_$DATE.tar.gz"

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# --- EJECUCIÓN ---
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   SISTEMA DE RESPALDO AUTOMATIZADO${NC}"
echo -e "${BLUE}========================================${NC}"

# Crear carpeta de destino si no existe
if [ ! -d "$DEST" ]; then
    mkdir -p "$DEST"
    echo -e "${YELLOW}[!] Carpeta de destino creada en $DEST${NC}"
fi

echo -e "${GREEN}[+] Comprimiendo archivos de: $SOURCE...${NC}"

# Crear el comprimido (.tar.gz)
# -c: crear, -z: comprimir con gzip, -f: nombre del archivo
tar -czf "$DEST/$FILENAME" "$SOURCE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[OK] Respaldo guardado exitosamente como: $FILENAME${NC}"
    notify-send "Backup Completo" "Tus proyectos están seguros en ~/Backups" --icon=drive-harddisk
else
    echo -e "${RED}[ERROR] Hubo un problema al crear el respaldo.${NC}"
    notify-send "ERROR en Backup" "No se pudo realizar el respaldo semanal" --icon=dialog-error
fi

# --- LIMPIEZA ---
# Borrar archivos antiguos (más de 7 días) para que no se llene tu SSD de Fedora
echo -e "${YELLOW}[*] Buscando respaldos antiguos para limpieza...${NC}"
find "$DEST" -type f -mtime +7 -name "*.tar.gz" -exec rm {} \;
echo -e "${GREEN}[+] Limpieza finalizada.${NC}"
echo -e "${BLUE}========================================${NC}"
