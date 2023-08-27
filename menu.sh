#!/bin/bash

echo "Aplicativo para procesar un lote de imagenes"

while true
do
 echo "Por favor ingrese un numero (0-4): "
 echo "1- Generar imagenes utilizando un servicio web."
 echo "2- Descomprimir un archivo de comprimido con imagenes."
 echo "3- Recortar imagenes"
 echo "4- Generar lista de todas personas"
 echo "0- Salir"
 read entrada
 
  if [ "$entrada" == "0" ]; then
	 echo "Saliendo..." 
	 break
  elif [ "$entrada" == "1" ]; then 
	 echo "Ingrese la cantidad de imagenes que desea generar: "
	 read num_img
	 ./generar.sh "$num_img"
  elif [ "$entrada" == "2" ]; then
	 echo "Ingrese la ruta del archivo comprimido de imágenes: "
	 read ruta_imagenes
		 echo "Ingrese la ruta del archivo de suma de verificación: "
	 read ruta_suma_verificacion
	 ./descomprimir.sh "$ruta_imagenes" "$ruta_suma_verificacion" 
  elif [ "$entrada" == "3" ]; then 
	 echo "Ingrese la ruta del archivo de las imagenes: "
	 read ruta_imagenes
	 ./procesar.sh "$ruta_imagenes"
  elif [ "$entrada" ==  "4" ]; then 
	 
	./comprimir.sh
  else 
	 echo "El numero ingresado es incorrecto, por favor ingrese otro numero: "
  fi
 done