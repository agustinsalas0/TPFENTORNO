
#! /bin/bash

#con el comando grep -c puedo obtener la cantidad de lineas que comienzan y terminan sin caracteres (en blanco)
echo "En el archivo de texto hay $(grep -c '^$' /home/agustinsalas/TPFENTORNO/texto/texto.txt) lineas en blanco."

exit 1
