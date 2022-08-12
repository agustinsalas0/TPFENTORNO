#! /bin/bash

# Con cat imprimo el arhivo txt y luego a traves de pipelines voy filtrando la data, primero elimino todos los carateres que no
# son parte de las palabras, reemplazo todos los espaccio con un salto de linea asi me queda una palabra por renglon
# luego con grep solo me quedo con las palabras que comienzan con uppercase, luego con un comando awk
# selecciono las palabras con longitud mayor a 2, ordeno las palabras con sort y con uniq me quedo con palabras sin que se repitan

cat /home/agustinsalas/TPFENTORNO/texto/texto.txt | tr -d '.,?¡!¿;' | tr ' ' '\n' | grep '^[A-Z]' | awk 'length > 2' | sort | uniq > nombres.txt

echo "Lista de nombres encontrados en el archivo de texto"
echo "----------------------------------------------------"

cat nombres.txt


exit 1
