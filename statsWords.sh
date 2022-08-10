#! /bin/bash
#1. statsWords.sh Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).

#Se lee el texto con cat y se almacena en la variable TEXTO
TEXTO=$(cat ./texto/texto.txt)


#Convertimos el texto en una lista de palabras 
palabras=(${TEXTO})

#Inicio las variables necesarias para calcular valores estadisticos, a las variables de comparacion (MIN Y MAX) les asigno el primer valor de la lista de palabras
SUMA=0
CONT=0
MIN=$(echo ${#palabras[0]})
MAX=$(echo ${#palabras[0]})

#Recorro la lista con la sentencia FOR:
for i in "${palabras[@]}"
do
        #Eliminamos los caracteres que no pertenecen palabras
	REC=$(echo -n "$i" | sed -e 's/\.//g' -e's/,//g' -e's/\!//g' -e's/;//g' -e's/\¡//g' -e 's/^[[:space:]]//g' -e 's/\?//g' -e 's/\¿//g')
        
	#Calculamos la longitud de la palabra
	LON=$(echo ${#REC})
        
	#Actualizamos el valor de las variables
	SUMA=$((LON+SUMA))
        CONT=$((CONT+1))

        if [[ $LON -lt $MIN ]]; then MIN=$LON; fi
        if [[ $LON -gt $MAX ]]; then MAX=$LON; fi


done
#Calculamos el promedio:
PROM=$((SUMA/CONT))

#Imprimimos los resultados:
echo "A continuación, se muestran los indicadores de longitud de cada palabra encontrada en el archivo:"

echo "Longitud Mínima: $MIN"
echo "Longitud Máxima: $MAX"
echo "Longitud Promedio: $PROM"
