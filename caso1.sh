#!/bin/bash

#Definimos las Variables del script
ORIGEN="/var/www/log/"
DESTINO="/var/nombreAlumno/log/"

#Validar origen
validar_origen() {
  if [ ! -d "$ORIGEN" ]; then
    echo "Error: Directorio origen no existe"
    exit 1
  fi

}
#Preparar destino
preparar_destino() {
  if [ ! -d "$DESTINO" ]; then
    mkdir -p "$DESTINO"
  fi

}
#Copiamos los archivos de origen a destino
copiar_archivos() {
cp -r $ORIGEN* $DESTINO
}

#Limpiar el origen
limpiar_origen() {
rm -rf $ORIGEN*
}

#Llamamos a las funciones para su ejecucion.

validar_origen
preparar_destino
copiar_archivos
limpiar_origen
