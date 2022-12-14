#! /bin/bash

echo "          --------  PROCESADOR DE TEXTO 1.0  --------"
echo "A continuación va a poder obtener información procesada del texto que desee"
echo " "

# Le doy un valor inicial a la variable auxiliar de condicion
CON='SI'
while CON='SI'
do
	#Verifico si el archivo es un archivo regular y si no lo es cambio el estado de la variable condicion
	if [ -f "/home/agustinsalas/TPFENTORNO/texto/texto.txt" ]
	then
		if [[ ! -s "/home/agustinsalas/TPFENTORNO/texto/texto.txt" ]]
		then
			#Verifico si el archivo esta vacio y en ese caso cambio el estado de la variable condicion
			echo "El archivo ingresado está vacío"
                        CON='NO'
		else
			break
		fi
	else
		echo "El archivo ingresado no existe, verifique el path ingresado"
	        CON='NO'
	fi
# si la variable condicion cambio su estado a NO entonces la aplicacion se cierra
CON=$(echo "${CON^^}")
[[ "$CON" == "NO" ]] && echo "Muchas gracias por utilizar el procesador de texto. Hasta luego!" && exit 1 
done 

# inicializo las variables auxiliares para la seleccion de opciones y la opcion de seguir procesando para otras opciones
RTA='S'
while RTA='S' && SEL='SI'
do
	#Imprimo las opciones disponibles para el usuario	 
        echo "1) Indicadores estadísticos de longitud de palabras del archivo "    
        echo "2) Indicadores estadísticos de uso de palabras del archivo "
        echo "3) Identifique los nombres propios del archivo "
        echo "4) Indicadores estadísticos de longitud de oraciones del archivo "
        echo "5) Número de líneas en blanco del archivo "
        echo -e "6) Finalizar \n"
	
	# Leo la opcion ingresada por el usuario y luego ejecuto el script correspondiente a dicha opcion
        read -p "Seleccione una opción de 1 a 6: " op
        case $op in
                [1]* )
                        echo -e "Opción Seleccionada 1: Indicadores de longitud de palabras. \n"
			bash statsWords.sh 
                        ;;
                [2]* )
                        echo "Opción Seleccionada 2: Indicadores de uso de palabras."
                        bash statsUsageWords.sh 
                        ;;
                [3]* )
                        echo "Opción Seleccionada 3: Nombres propios."
                        bash findNames.sh 
                        ;;
                [4]* )
                        echo "Opción Seleccionada 4: Indicadores de longitud de oraciones."
                        bash statsSentences.sh 
                        ;;
                [5]* )
                        echo "Opción Seleccionada 5: Contador de líneas en blanco."
                        bash blankLinesCounter.sh 
                        #break
                        ;;
              
                 [6]* )
                         echo -e "\n Opción Seleccionada 6: \n Gracias por elegirnos. Hasta luego!"
                         exit 1;;
                 * ) echo -e "\n Seleccione una Opción de 1 a 6";;
         esac
        #Leo la repuesta para saber si el usuario quiere seguir usando opciones y convierto la respuesta a uppercase
	 read -p  "Desea seleccionar otra opcion? S/N: " RTA
	 RTA=$(echo "${RTA^^}")
[[ $RTA == 'N' ]] && echo -e "\nMuchas gracias por utilizar el procesador de texto. Hasta luego! \n" && exit 1
done
