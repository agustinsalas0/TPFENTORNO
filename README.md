INSTRUCCIONES PARA EL PROCESADOR DE TEXTO


1) Abrir una terminal en su ordenador
	Debe tener instalado DOcker y configurado su usuario git

2) En la terminal ingresar el siguiente comando:
	
	git clone https://github.com/agustinsalas0/TPFENTORNO.git
	
3) A continuación debe construir su docker, introduzca el siguiente comando:	

	docker build --tag imagentexto

4) Vamos a ejecutar el docker para crear el contenedor, para esto va a necesitar saber el path absoluto del texto que desea procesar. 
  
   Debe ir a las propiedades de archivo del texto que quiere analizar, de aqui va a poder copiar el directorio y pegarloen el comando, 
   reemplazar en /ejemplo/generico/directorio, luego para que el path quede completo debe poner el nombre su archivo en lugar de ejemplo-texto.txt

   El comando a ejecutar es el siguiente:
		
	docker run -it -v /ejemplo/generico/directorio/ejemplo-texto.txt:/home/agustin/TPFENTORNO/texto/texto.txt

5) EL programa ya esta corriendo y listo para usar.
