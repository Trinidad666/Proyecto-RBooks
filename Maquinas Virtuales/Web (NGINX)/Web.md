# NGINX

## HTML

Nos conectamos a la MV de nuestra web desde una terminal de otro equipo con el comando(ssh -p 22 nombre@IP) y añadimos la contraseña: 
``
ssh -p 22 victorh@100.77.20.38
``
![image](https://github.com/user-attachments/assets/4adc5a9d-944b-4352-b6ca-f84208d12e4d)

Instalaremos el servidor web Nginx junto con su configuración como proxy inverso.

![image](https://github.com/user-attachments/assets/daf09daf-be0c-4365-88eb-b487c4a39d2c)

Si ingresamos la dirección IP de la máquina router, podremos verificar que el servidor NGINX está correctamente conectado a la red y nos muestra la página web predeterminada de NGINX.

![image](https://github.com/user-attachments/assets/a3f37442-cbd1-456a-aa79-3acf89011769)


Para crear nuestra propia página web, debemos acceder a la carpeta **/var/www/**, que es el directorio predeterminado en los sistemas Linux donde se almacenan los archivos de las páginas web servidas por un servidor web, como Nginx o Apache.

![image](https://github.com/user-attachments/assets/1e27e412-b0d5-4fd7-aeba-097a80280ba5)

Creamos una nueva carpeta llamada *rbooks.com* con el siguiente comando:
``
sudo mkdir /var/www/rbooks.com
``
![image](https://github.com/user-attachments/assets/8f6439d1-7726-4f3d-a840-48d5cafd84ed)
![image](https://github.com/user-attachments/assets/67a1ad21-cbf8-496a-98eb-5f8246517646)

Al crear la carpeta *rbooks.com*, generaremos un archivo HTML llamado *index.html* dentro de ella con el siguiente comando:
``
sudo touch /var/www/rbooks.com/index.html
``
![image](https://github.com/user-attachments/assets/68e4d037-79c0-4c9a-8604-bb7198a6ab40)
![image](https://github.com/user-attachments/assets/1fd74f37-a2f3-4cb9-97a6-f9b20a3726d2)

Para editar el archivo *index.html*, ingresamos al archivo utilizando el siguiente comando:
``
sudo nano /var/www/rbooks.com/index.html
``

![image](https://github.com/user-attachments/assets/d33873e3-2374-4aa5-98c6-f14f0b4a27d9)

Dentro del archivo pondremos el código html que mostraremos a continuación:

![image](https://github.com/user-attachments/assets/ee073725-01db-41f0-b498-3dc587f873b4)

Al guardar los cambios nos iremos a la dirección **/etc/nginx/sites-available/**

![image](https://github.com/user-attachments/assets/c80443e4-579c-4531-ab78-4702d3accd92)

Copia el archivo llamado "*default*" (que probablemente sea una configuración predeterminada de Nginx) y crea una copia con el nombre "*rbooks.com.conf*". Este proceso es común al configurar un nuevo servidor virtual en Nginx, ya que permite personalizar la configuración para un dominio o proyecto específico.

  * **sudo:** Ejecuta el comando con privilegios de superusuario, necesarios cuando se trabaja en directorios protegidos, como /etc/nginx/sites-available.
  * **cp:** Es el comando utilizado para copiar archivos o directorios.
  * **default:** Es el archivo de origen que se desea copiar.
  * **rbooks.com.conf:** Es el nombre del archivo de destino, el cual será el nuevo archivo copiado.

![image](https://github.com/user-attachments/assets/facdaa8c-403a-47eb-9e7f-11d51a2ceec6)

Entramos al archivo **rbooks.com.conf** y dentro, colocamos todo como comentario utilizando el "#".

Esto convierte todo el contenido del archivo en comentarios, lo que significa que Nginx no lo interpretará como configuración activa.

![image](https://github.com/user-attachments/assets/dddee151-0123-4273-99aa-7e5320c49356)
![image](https://github.com/user-attachments/assets/4a438956-8639-4b85-bb8c-ad71949b59fa)

Quitamos el “#” donde mostramos en la imagen.

![image](https://github.com/user-attachments/assets/2599da77-d487-4e6d-9ced-a9d9e384c394)

Tendremos que quitar el dominio example.com a *rbooks.com* porque este código configura un servidor virtual en Nginx para servir el dominio **rbooks.com** desde el directorio **/var/www/rbooks.com** y manejar solicitudes con archivos estáticos, devolviendo un **error 404** si no se encuentran.

![image](https://github.com/user-attachments/assets/eb97e3e7-efa6-4003-b062-557cd042b093)

Nos dirigiremos a la carpeta **sites-enabled** con el siguiente comando:
``
cd ../sites-enabled/
``
El directorio **/etc/nginx/sites-enabled** en un servidor Nginx contiene enlaces simbólicos a los archivos de configuración de servidores virtuales ubicados en **/etc/nginx/sites-available**. Este directorio determina qué configuraciones de servidores virtuales están activas y se cargan cuando Nginx se reinicia o recarga.

A continuación, ejecutaremos el siguiente comando para crear un enlace simbólico:
``
sudo ln -s /etc/nginx/sites-available/rbooks.com.conf rbooks.com.conf
``
  * **sudo:** Ejecuta el comando con privilegios de superusuario, necesarios para modificar configuraciones del sistema.
  * **ln -s:** Crea un enlace simbólico (también conocido como "symlink"), que es un archivo que apunta a otro archivo o directorio en el sistema.
  * **/etc/nginx/sites-available/rbooks.com.conf:** Es la ubicación del archivo de configuración de Nginx para el sitio rbooks.com, en el directorio donde generalmente se almacenan las configuraciones disponibles, pero no necesariamente activas.
  * **rbooks.com.conf:** Es el nombre del enlace simbólico que se creará. Este enlace estará ubicado en el directorio sites-enabled, activando la configuración de rbooks.com.conf desde sites-available.

Este comando crea un enlace simbólico en sites-enabled para activar la configuración del sitio **rbooks.com.conf**, que está ubicada en sites-available en Nginx.

![image](https://github.com/user-attachments/assets/c38e2840-6358-4692-a74a-c6c16ea629a8)

Si ejecutamos el comando **ls -l**, podemos observar que el enlace simbólico se ha creado correctamente.

![image](https://github.com/user-attachments/assets/561cbd4d-d6e9-4c06-8053-080601576af5)

Ejecutaremos el comando **sudo nginx -s reload** para recargar la configuración de Nginx sin detener el servicio, aplicando así los cambios realizados en sus archivos de configuración.

![image](https://github.com/user-attachments/assets/8b6a1b77-f362-4545-bd45-3a836a371b46)

Luego, utilizaremos el comando **sudo nginx -t**, que verifica la sintaxis de los archivos de configuración de Nginx para asegurarse de que no haya errores antes de reiniciar o recargar el servicio.

![image](https://github.com/user-attachments/assets/efc147c2-d473-49c1-9c08-f3ba23166dc5)
![image](https://github.com/user-attachments/assets/706d541e-d033-455a-88ad-91de47b7224e)
![image](https://github.com/user-attachments/assets/1a7f0bd7-4441-4115-937d-85882dbf0f0a)

Ejecutaremos el comando **sudo systemctl restart nginx**, que reinicia el servicio de Nginx, deteniéndolo y luego iniciándolo nuevamente. Esto aplica cualquier cambio en la configuración o resuelve posibles problemas.

El comando **sudo systemctl status nginx** muestra el estado actual del servicio Nginx, indicando si está activo (en ejecución), si ha fallado, y proporcionando detalles sobre el proceso, como el tiempo de actividad y los posibles errores registrados.

![image](https://github.com/user-attachments/assets/8e85cca3-d444-4fa1-8111-4e0110838113)

Podemos ver que nuestra página web, que hemos creado en el archivo *index.html*0, funciona a la perfección.

![image](https://github.com/user-attachments/assets/a8986efc-0ffd-49cd-9efc-b70bc53999a1)


Para que el navegador nos redirija a la página web al escribir **rbooks.com** en lugar de la dirección IP **100.77.20.38**, debemos editar el archivo hosts. Este archivo es local y asigna nombres de dominio a direcciones IP, teniendo prioridad sobre los servidores DNS.

En la imagen se muestra cómo y dónde se debe agregar la IP y el nombre de dominio.

![image](https://github.com/user-attachments/assets/0b46bbb2-4c8a-486e-9c4f-51a50ea7e50a)

Al ingresar el dominio **rbooks.com**, podemos ver que la página web se carga perfectamente.

![image](https://github.com/user-attachments/assets/62e822d3-13b1-406f-9dbb-7cdd1d8c2339)



## PHP

![image](https://github.com/user-attachments/assets/3458fd78-5abd-4d31-91f5-01bfc273579b)

![image](https://github.com/user-attachments/assets/4f3c6a4a-54f9-487a-8b26-de8469a0a70a)

Ponemos todo lo que hay en azul

![image](https://github.com/user-attachments/assets/176f656d-d292-4528-af8d-d99db8d41776)

![image](https://github.com/user-attachments/assets/edf43ed2-2d2c-44e2-9fda-b8d6b1079d5a)

![image](https://github.com/user-attachments/assets/5f7a5d4d-7080-4769-9193-419dc0a697bc)

sudo nginx -t

![image](https://github.com/user-attachments/assets/82dab784-c06a-4671-b09c-dacb24d99e4d)

sudo nginx -s reload

![image](https://github.com/user-attachments/assets/dd31d90a-9dd5-41e7-84af-6f89dccd6832)

sudo system status nginx

![image](https://github.com/user-attachments/assets/f2e0f1b4-2934-41be-90c9-c217f0d4033a)

![image](https://github.com/user-attachments/assets/71833b7d-59c5-4008-988f-689a8ba56c59)

cd /var/www/

![image](https://github.com/user-attachments/assets/6c1c274d-ab7b-4c2e-9490-8ef0751143de)

ls -l

![image](https://github.com/user-attachments/assets/64241df8-ad64-492a-a855-0a36a973d6a2)

index.php

![image](https://github.com/user-attachments/assets/9aebc2c6-d874-48c3-95b9-8b0b5e033f72)

![image](https://github.com/user-attachments/assets/e71f7651-fd45-4dfc-bf0b-a15ed7b34eb1)


![image](https://github.com/user-attachments/assets/66830819-04a0-47f8-9e75-192eeb589939)







