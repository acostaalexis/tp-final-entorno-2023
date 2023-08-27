#!/bin/bash
url_list_name="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
# Función para generar un nombre aleatorio de la lista de nombres de personas
list_name=$(wget -qO- "$url_list_name" | awk  -F ' ' '{print $1}')
# echo "$list_name"

IFS=$'\n' read -d '' -ra lista_nombres <<< "$list_name"



random_index=$((RANDOM % ${#lista_nombres[@]}))
echo "${lista_nombres[random_index]}"

names=("Paz" "Marcos" "Federico" "Juan" "Eve" "Laura" "Joaquin" "Ailen" "Bruno" "Roman" "Gonzalo" "Valeria")
echo "$names"




generate_random_name() {
  random_index=$((RANDOM % ${#lista_nombres[@]}))
  echo "${lista_nombres[random_index]}"
}

# Declaro el numero de imagenes que se van a generar por parametro
num_img=$1
if [[ -z $num_img ]]; then
  # Si no se pasa argumento establezco un numero fijo de imagenes a generar en este caso 3
  num_img=3
fi

echo "generando $num_img imagenes... "

# Creo el directorio donde voy a guardar las imagenes
mkdir "img_generadas"

# Descargo las imágenes y le asigno nombres aleatorios
for ((i=1; i<=$num_img; i++)); 
do
  name=$(generate_random_name)
  filename="${name}.jpg"
  wget -qO "img_generadas/$filename" "https://thispersondoesnotexist.com"
  sleep 1  # Espero 1 segundo entre descargas para no saturar el servicio
done

echo "Comprimiendo archivo de imagenes..."
# Una vez descargadas las imagenes creo un archivo comprimido utilizando tar
archivo_comprimido="img_generadas.tar"
tar -cf "$archivo_comprimido" -C "img_generadas" .
echo "Se ha completado con exito la tarea, imagenes comprimidas en $zipfile"

# Por ultimo creo la suma de verificacion y la guardo junto a las imagenes comprimidas
echo "Generando suma_verificacion.txt"
suma_verificacion=$(md5sum "$archivo_comprimido" | awk '{print $1}')
archivo_suma_verificacion="suma_verificacion.txt"
echo "$suma_verificacion" > "$archivo_suma_verificacion"

#Por ultimo borro las imagenes descargas
rm -r "img_generadas"

exit 0