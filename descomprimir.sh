#!/bin/bash

#Verifica que el numero de argumentos pasados por el script sea igual a 2 
if [ $# -ne 2 ]; then
    echo "Datos erroneos, por favor intente otra vez"
    exit 1
fi

#Define las variables con los argumentos pasados
archivo_imagenes=$1
archivo_suma_verificacion=$2

#Verifica que el archivo de imagenes comprimidas se encuentre en la ruta declarada
if [ ! -f "$archivo_imagenes" ]; then
    echo "El archivo de imágenes no existe en la ubicación especificada."
    exit 1
fi

#Verifica que el archiva de suma de verificacion se encuentre en la ruta declarada
if [ ! -f "$archivo_suma_verificacion" ]; then
    echo "El archivo de la suma de verificación no existe en la ubicación especificada."
    exit 1
fi


#Realiza la suma de verificacion del archivo de imagenes y compara que sea igual al archivo pasado por el argumento
echo "Verificando la suma de verificación..."
suma_verificacion_calculada=$(md5sum "$archivo_imagenes" | awk '{print $1}')
suma_verificacion_archivo=$(cat "$archivo_suma_verificacion" | awk '{print $1}')


#Si llegan a ser diferentes devuelve el error y vuelve al menu
if [ "$suma_verificacion_calculada" != "$suma_verificacion_archivo" ]; then
    echo "La suma de verificación no coincide. El archivo podría estar corrupto."
    exit 1
fi

#Si la suma de verificacion es correcta descoprime las imagenes y las fuarda en un directorio llamado imagenes_extraidas
echo "Descomprimiendo archivo de imágenes..."
mkdir "imagenes_extraidas"
tar xf "$archivo_imagenes" -C "imagenes_extraidas"

# Por ultimo avisa que la descompresion fue realizada exitosamente y vuelve al menu
echo "La descompresión se completó ha exitosamente."
exit 0