#! /bin/bash

echo "Bienvenidos a la aplicación que les permitirá procesar texto"



SEL='SI'
while SEL='SI'
do
	if [ -f "/home/agustinsalas/TPFENTORNO/texto/texto.txt" ]
	then
		if [[ ! -s "/home/agustinsalas/TPFENTORNO/texto/texto.txt" ]]
		then
			echo "El archivo seleccionado está vacío"
		else
			break
		fi
	else
		echo "El archivo ingresado no existe"
	fi
SEL=$(echo "${SEL^^}")
[[ "$SEL" == "NO" ]] && echo "Muchas gracias por utilizar la aplicación. Los esperamos pronto. Hasta luego!" && exit 1 
done 


RTA='S'
while RTA='S' && SEL='SI'
do

        echo "0) Obtenga los indicadores estadísticos de longitud de palabras del archivo "    
        echo "1) Obtenga los indicadores estadísticos de uso de palabras del archivo "
        echo "2) Identifique los nombres propios (Nnnn) del archivo "
        echo "3) Obtenga los indicadores estadísticos de longitud de oraciones del archivo "
        echo "4) Obtenga el número de líneas en blanco del archivo "
        echo -e "5) Salir \n"

        read -p "Seleccione una opción de 0 a 5: " op
        case $op in
                [0]* )
                        echo -e "Opción Seleccionada 0: Indicadores de longitud de palabras. \n"
			bash statsWords.sh 
                        #break
                        ;;
                [1]* )
                        echo "Opción Seleccionada 1: Indicadores de uso de palabras."
                        bash statsUsageWords.sh 
                       #break
                        ;;
                [2]* )
                        echo "Opción Seleccionada 2: Nombres propios."
                        bash findNames.sh 
                        #break
                        ;;
                [3]* )
                        echo "Opción Seleccionada 3: Indicadores de longitud de oraciones."
                        bash statsSentences.sh 
                        #break
                        ;;
                [4]* )
                        echo "Opción Seleccionada 4: Contador de líneas en blanco."
                        bash blankLinesCounter.sh 
                        #break
                        ;;
              
                 [5]* )
                         echo -e "\n Opción Seleccionada 9: \n Los esperamos pronto. Hasta luego!"
                         exit 1;;
                 * ) echo -e "\n Seleccione una Opción de 0 a 9";;
         esac
         read -p  "Desea seleccionar otra opcion? S/N: " RTA
	 RTA=$(echo "${RTA^^}")
[[ $RTA == 'N' ]] && echo -e "\nMuchas gracias por utilizar la aplicación. Los esperamos pronto. Hasta luego! \n" && exit 1
done
