#Utilizamos la imagen de la última versión de ubuntu
FROM ubuntu

#Autores del contenedor
MAINTAINER AGUSTIN_SALAS

#Copiamos todos los archivos desde el directorio host al directorio del contenedor
COPY ./ /dirdock

#Indicamos cual es el directorio que vamos a usar dentro del contenedor
WORKDIR /dirdock

#Ejecutamos el menú
ENTRYPOINT ["/dirdock/menu.sh"]
