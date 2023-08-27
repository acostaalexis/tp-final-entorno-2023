Este archivo contiene instrucciones y descripciones sobre cómo utilizar y trabajar con este proyecto.

Levantar el proyecto
Para levantar el proyecto, sigue los siguientes pasos:

Clona el proyecto en tu máquina local.

Ejecuta el siguiente comando para construir la imagen de Docker:

docker build -t app .

Luego, ejecuta el siguiente comando para ejecutar el contenedor Docker:

PowerShell o Linux:

docker run -it -v ${PWD}:/output app
Windows CMD:

docker run -it -v %cd%:/output app
Scripts disponibles
generar.sh
El script generar.sh genera imágenes basadas en un número pasado como argumento. Las imágenes generadas se guardan en un archivo llamado img_generadas.tar, y también se genera y guarda la suma de verificación en el archivo suma_verificacion.txt.

Uso del script:

./generar.sh <número>
descomprimir.sh
El script descomprimir.sh recibe dos parámetros: la ruta de un archivo de imágenes a descomprimir y su suma de verificación. El script valida los datos y luego extrae las imágenes descomprimidas en un directorio llamado imagenes_extraidas.

Uso del script:

./descomprimir.sh <ruta_archivo_imágenes> <suma_verificación>
procesar.sh
El script procesar.sh recibe como parámetro un directorio de imágenes y las comprime.

Uso del script:

./procesar.sh <directorio_imágenes>
comprimir.sh
El script comprimir.sh realiza las siguientes acciones:

Genera un archivo con la lista de nombres de todas las imágenes.
Genera un archivo con la lista de nombres válidos.
Genera un archivo con el total de personas cuyo nombre finaliza con la letra "a".
Genera un archivo comprimido que incluye los archivos generados anteriormente y todas las imágenes. El archivo comprimido se puede encontrar en la raíz del proyecto fuera del contenedor.
Uso del script:

./comprimir.sh
