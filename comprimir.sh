#!/bin/bash


echo "Generando archivo comprimido..."

# Directorio donde se encuentran las imágenes procesadas
directorio_imagenes="imagenes_extraidas"

# Generar archivo con la lista de nombres de todas las imágenes
find "$directorio_imagenes" -type f -name "*.jpg" -exec basename {} \; > lista_imagenes.txt #>/dev/null 2>&1

# Generar archivo con la lista de nombres válidos (nombres de personas)
grep -E '^[A-Z][a-z]+' lista_imagenes.txt > lista_nombres_validos.txt #>/dev/null 2>&1

# Generar archivo con el total de personas cuyo nombre finaliza con la letra "a"
grep -E '^[A-Z][a-z]+a\.jpg' lista_imagenes.txt | wc -l > total_nombres_con_a.txt #>/dev/null 2>&1

# Crear archivo comprimido con los archivos generados y todas las imágenes
tar -czvf /output/imagenes.tar.gz lista_imagenes.txt lista_nombres_validos.txt total_nombres_con_a.txt imagenes_procesadas/*.jpg imagenes_extraidas/*.jpg #>/dev/null

# Eliminar archivos de texto generados
rm lista_imagenes.txt lista_nombres_validos.txt total_nombres_con_a.txt


echo "Operacion exitosa :D"
# Permitir acceso al archivo comprimido desde fuera del contenedor