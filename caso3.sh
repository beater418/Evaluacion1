#!/bin/bash

#Definicion de variables
ORIGEN="/var/nombreAlumno/log"
DESTINO="/var/www/backup"

#Validacion del origen
validar_origen() {
  if [ ! -d "$ORIGEN" ]; then
    echo "Error: Directorio origen no existe"
    exit 1
  fi
}

#Preparamos el destino
preparar_destino() {
  if [ ! -d "$DESTINO" ]; then
    sudo mkdir -p "$DESTINO"
  fi
}

#Generacion del nombre del archivo
generar_nombre() {
  FECHA=$(date +%Y%m%d_%H%M%S)
  ARCHIVO="backup_$FECHA"
}

#Compresion de los bks
crear_backups() {
  tar -cvf "$DESTINO/$ARCHIVO.tar" "$ORIGEN"
  zip -r "$DESTINO/$ARCHIVO.zip" "$ORIGEN"

}
#Llamamo a las funciones creadas
validar_origen
preparar_destino
generar_nombre
crear_backups
