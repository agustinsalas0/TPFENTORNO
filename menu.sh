#! /bin/bash

echo "Bienvenidos a la aplicación que les permitirá procesar texto"
echo -e "\nA continuación posee el listado de archivos de textos disponibles para su procesamiento "
ls -1 ./texto

SEL='SI'
while SEL='SI'
do
	read -p "Ingrese el nombre y extensión del archivo que desea procesar (ejemplo archivo.txt): " AR
	if [ -f "./texto/$AR" ]
	then
		if [[ ! -s "./texto/$AR" ]]
		then
			echo "El archivo seleccionado: $AR está vacío"
			read -p "Desea seleccionar otro archivo de texto (SI/NO): " SEL
		else
			break
		fi
	else
		echo "El archivo ingresado: $AR no existe"
		read -p "Desea seleccionar otro archivo de texto (SI/NO): " SEL
	fi
SEL=$(echo "${SEL^^}")
[[ "$SEL" == "NO" ]] && echo "Muchas gracias por utilizar la aplicación. Los esperamos pronto. Hasta luego!" && exit 1 
done 


RTA='S'
while RTA='S' && SEL='SI'
do
	echo -e "\nArchivo seleccionado para su procesamiento: $AR \n "

        echo "0) Obtenga los indicadores estadísticos de longitud de palabras del archivo $AR"    
        echo "1) Obtenga los indicadores estadísticos de uso de palabras del archivo $AR"
        echo "2) Identifique los nombres propios (Nnnn) del archivo $AR"
        echo "3) Obtenga los indicadores estadísticos de longitud de oraciones del archivo $AR"
        echo "4) Obtenga el número de líneas en blanco del archivo $AR"
        echo -e "5) Salir \n"

        read -p "Seleccione una opción de 0 a 5: " op
        case $op in
                [0]* )
                        echo -e "Opción Seleccionada 0: Indicadores de longitud de palabras. \n"
			bash statsWords.sh $AR
                        #break
                        ;;
                [1]* )
                        echo "Opción Seleccionada 1: Indicadores de uso de palabras."
                        bash statsUsageWords.sh $AR
                       #break
                        ;;
                [2]* )
                        echo "Opción Seleccionada 2: Nombres propios."
                        bash findNames.sh $AR
                        #break
                        ;;
                [3]* )
                        echo "Opción Seleccionada 3: Indicadores de longitud de oraciones."
                        bash statsSentences.sh $AR
                        #break
                        ;;
                [4]* )
                        echo "Opción Seleccionada 4: Contador de líneas en blanco."
                        bash blankLinesCounter.sh $AR
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
