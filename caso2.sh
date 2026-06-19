#!/bin/bash
# Definimos la variable

RUTA="/var/www/log/"

#Validamos la ruta

validar_ruta() {
  if [ ! -d "$RUTA" ]; then
    echo "Error: Directorio no existe"
    exit 1
  fi
}

#Generamos el nombre del archivo
generar_nombre() {
  FECHA=$(date +%H%M%S)
  ARCHIVO="archivo_$FECHA.log"
}

# Creamos el archivo y le agregamos el string
crear_archivo() {
  echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit." > "$RUTA$ARCHIVO"
}

#Llamamos a las funciones
validar_ruta
generar_nombre
crear_archivo
