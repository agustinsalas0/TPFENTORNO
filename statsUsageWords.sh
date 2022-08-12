
#!/bin/bash

# Primero leo el archivo de texto con el comando cat, luego proceso el texto a traves de pipe lines, primero elimino los
# caracteres que no son propios de la palabra, luego convierto todo el texto a minuscula, con tr intercambio los espacios
# por saltos de lines, asi me queda una palabra por linea, con awk filtro las palabras que solo tengan una long mayor a 3
# con sort ordeno las palabras de manera alfabetica, luego con uniq filtro las palabras que se rrepiten y con la npocion -c de 
# este comando me indica la cantidad de ocurrencias de dicha palabra, vuelvo a ordenar la lista de manera descendente y por 
# ultimo con el comando head selecciono las primeras 10 palabras de la lista


cat /home/agustinsalas/TPFENTORNO/texto/texto.txt | tr -d '.,?¡!¿;'| tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | awk 'length > 3' | sort | uniq -c | sort -r | head -n 10 > listadof.txt

echo "A continuaciòn se muestra el listado ordenado de manera ascendete por frecuencia de las palabras en el texto ingresado"
echo " Frecuencia Palabra"

# Imprimo en pantalla el listado de palabras con su cantidad de ocurrencias correspondientes.

cat listadof.txt


exit 1
