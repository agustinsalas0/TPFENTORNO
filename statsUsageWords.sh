
#!/bin/bash


# Por medio de PIPES (|):
#  tr -d '.,?¡!¿;': con esta opcion elimino los caracteres indicados
#  2. tr '[:upper:]' '[:lower:]': convierto el texto a minúsculas
#  3. tr ' ' '\n': agrego un salto de línea en cada espacio para dejar una palabra por línea
#  4. awk 'length > 3': Filtro las palabras que posean una longitud mayor a 3
#  5. sort: Ordeno las palabras de manera alfabetica
#  6. uniq -c: Filtro las que se repiten, la opción -c nos muestra el numero de ocurrencias de la palabra en el archivo.
#  7. sort -r: Ordeno nuevamente el listado de manera descendente
#  8. head -n 10: Nos quedamos con las primeras 10, por defecto head -n muestras las primeras 10

cat ./texto/texto.txt | tr -d '.,?¡!¿;'| tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | awk 'length > 3' | sort | uniq -c | sort -r | head -n 10 > listadof.txt

echo "A continuaciòn se muestra el listado ordenado de manera ascendete por frecuencia de las palabras en el texto ingresado"
echo " Frecuencia Palabra"

cat listadof.txt


exit 1
