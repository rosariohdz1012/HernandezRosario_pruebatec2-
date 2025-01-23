# Sistema de Gestion de Citas 
## Prueba tecnica N° 2 

 ###Descripcion del proyecto 
Se creo la aplicación web  gestion 
La cual se integra de 4 paquetes con su correspondiente dominio y ya el nombre de cada uno de ellos que es logica, persistencia y servlets en el paquete de logica ingrese mis cuatro identidades Cita, Ciudadano, Tramite, Usuario y creamos otro paquete con el dominio y el nombre de logicaControladora en cual contiene la controladora de cada una de mis entidades que en realidad es crud de dichas entidades y se pasa a persistencia.  
En el paquete de persistencia estan Jpa que el crud que se genera y pasa a la persistenciaControladora 

Al ingresar a la aplicacion esta el login que es poner tu usuario  < hernandezvillegasm12@gmail.com > y la contraseña < 12345 >, al ingresar los datos correctos se dirige al panel el cual tiene Cita, Tramite y Ciudadano y nosotros podemos escoger cualquiera de esas 3 opciones al ingresar en: 
-Ciudadano los datos que pide es nombre, apellido paterno, apellido materno, genero y el numero de telefono, para despues poder almacenarlos. 
-Tramite los datos son 2 que es nombre del tramite y ya la descripcion que registra esos datos. 
-Cita los datos a pedir es fecha y hora de la cita, ademas de seleccionar que tramite se quiere realizar y el nombre del ciudadano,  estado que es ya atendido o en espera y por ultimo el genero, tambien de las opciones editar y eliminar.   
-La base de datos la ingrese en la carpeta de turnerobd en el mismo proyecto. 
-Tambien el diagrama se encuentra en el mismo proyeco.  

###Cuestiones Tecnicas 
Tuve problema al realizar el filtrado con el de fecha por el usuario ya que al realizar una colección con set no me dejaba visualizar la lista del filtrado seleccionado.  
El filtrado por el momento fue lo mas complicado por que no realizaba la accion y aun guiandome en ejemplos de la sintaxis y como se emplea, no lo pude implementar. Y aun ayudandome de mi amigo no quedo, lo unico que me llevo un error de casi 3 horas y no quedo, aun con sus ejemplos de el no me dejaba realizar la accion.  
Solo me dejo realizar unos filtros pero por id. 

Las tecnologias que se utilizaron fueron: 
-JDK 17 
-JAVA Persistente Api (JPA) 
-NetBeans 17 
-MySql SGBD 
-Navegador 
-Sotfware Modelas Ideas 

###Supuestos 
Se manejo por paquetes ya que es mas legible el codigo para nosotros que nos encontramos realizando el codigo, para la controladora de logica se implemeto un paquete y meter todas las controladoras de las entidades, del paquete de persistencia ademas de tener los Jpa controlers, se agrego el paquete de controladoras y asi aunque exiten muchos paquetes y demasiadas clases es mas facil de corregir los errores en caso de que existan otorgando pequeñas responsabilidades a cada una de las clases obteniendo el codigo mas legible. 
En los Servlets maneje  solo el nombre especifico sin agregar el Serv para que la url se veas mas bonita y descriptiva 
En el readme maneje todo mi documento sin tildes al igual que el codigo en la base de datos ya que en ella generaba errores, no se si este bien implementado o que pasa, hago mencion ya que en la primera prueba tengo esa sugerencia de tildes.  
