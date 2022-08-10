#! /bin/bash

echo "          --------  PROCESADOR DE TEXTO 1.0  --------"
echo "A continuación va a poder obtener información procesada del texto que desee"
echo " "


CON='SI'
while CON='SI'
do
	if [ -f "/home/agustinsalas/TPFENTORNO/texto/texto.txt" ]
	then
		if [[ ! -s "/home/agustinsalas/TPFENTORNO/texto/texto.txt" ]]
		then
			echo "El archivo ingredado está vacío"
                        CON='NO'
		else
			break
		fi
	else
		echo "El archivo ingresado no existe, verifique el path ingresado"
	        CON='NO'
	fi
CON=$(echo "${CON^^}")
[[ "$CON" == "NO" ]] && echo "Muchas gracias por utilizar el procesador de texto. Hasta luego!" && exit 1 
done 


RTA='S'
while RTA='S' && SEL='SI'
do

        echo "1) Obtenga los indicadores estadísticos de longitud de palabras del archivo "    
        echo "2) Obtenga los indicadores estadísticos de uso de palabras del archivo "
        echo "3) Identifique los nombres propios del archivo "
        echo "4) Obtenga los indicadores estadísticos de longitud de oraciones del archivo "
        echo "5) Obtenga el número de líneas en blanco del archivo "
        echo -e "6) Finalizar \n"

        read -p "Seleccione una opción de 1 a 6: " op
        case $op in
                [1]* )
                        echo -e "Opción Seleccionada 1: Indicadores de longitud de palabras. \n"
			bash statsWords.sh 
                        #break
                        ;;
                [2]* )
                        echo "Opción Seleccionada 2: Indicadores de uso de palabras."
                        bash statsUsageWords.sh 
                       #break
                        ;;
                [3]* )
                        echo "Opción Seleccionada 3: Nombres propios."
                        bash findNames.sh 
                        #break
                        ;;
                [4]* )
                        echo "Opción Seleccionada 4: Indicadores de longitud de oraciones."
                        bash statsSentences.sh 
                        #break
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
         read -p  "Desea seleccionar otra opcion? S/N: " RTA
	 RTA=$(echo "${RTA^^}")
[[ $RTA == 'N' ]] && echo -e "\nMuchas gracias por utilizar el procesador de texto. Hasta luego! \n" && exit 1
done
