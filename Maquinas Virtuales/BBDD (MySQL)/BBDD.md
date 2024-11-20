
# MySQL

## ¿Qué es MySQL?
MySQL es un sistema de gestión de bases de datos relacional de código abierto que emplea el lenguaje SQL para almacenar, gestionar y consultar datos de manera eficiente. Es ampliamente utilizado debido a su fiabilidad, facilidad de uso y rendimiento, especialmente en aplicaciones web.

El comando **sudo mysql_secure_installation** ejecuta un asistente que ayuda a configurar MySQL de forma segura. Este proceso permite establecer una contraseña robusta para el usuario root, eliminar usuarios anónimos, deshabilitar accesos remotos para el usuario root y eliminar bases de datos de prueba. Estos pasos son fundamentales para fortalecer la seguridad del servidor MySQL y protegerlo contra accesos no autorizados o vulnerabilidades.

![image](https://github.com/user-attachments/assets/7db67c76-4181-400c-892c-dddf3567f627)


Al ejecutar el comando **sudo mysql_secure_installation**, se inicia un asistente interactivo diseñado para mejorar la seguridad del servidor MySQL mediante una serie de pasos clave:
   1. **Configurar la contraseña de root:** Permite establecer o actualizar la contraseña para el usuario root de MySQL, asegurando el acceso restringido al sistema.
   2. **Eliminar usuarios anónimos:** Elimina las cuentas predeterminadas sin nombre, que podrían ser utilizadas para acceder al servidor sin autenticación.
   3. **Deshabilitar el acceso remoto del root:** Refuerza la seguridad al limitar el acceso del usuario root solo al servidor local, evitando conexiones remotas no autorizadas.
   4. **Borrar bases de datos de prueba:** Elimina la base de datos *test*, que por defecto está accesible a cualquier usuario, lo que podría representar un riesgo de seguridad.
   5. **Recargar las tablas de privilegios:** Aplica inmediatamente todos los cambios realizados, asegurando que las nuevas configuraciones entren en efecto de forma inmediata.

Este conjunto de medidas asegura que el servidor MySQL esté protegido contra configuraciones predeterminadas inseguras y reduce posibles vectores de ataque.

![image](https://github.com/user-attachments/assets/4bc7c712-87f7-42b2-aed1-e4c1084df38e)

Le das a todo "**y**" (sí / yes).

![image](https://github.com/user-attachments/assets/22b69f20-b3b3-4dca-b6bc-4819e3e39ae7)

![image](https://github.com/user-attachments/assets/43230f24-af43-4a88-9a7e-0bff7f6c1716)


El comando **sudo mysql** se utiliza para acceder a la consola interactiva de MySQL como el usuario root del sistema.

![image](https://github.com/user-attachments/assets/a3947380-5674-47c9-a630-201914fcd916)

El comando **SHOW DATABASES**; lista todas las bases de datos disponibles en el servidor MySQL.

![image](https://github.com/user-attachments/assets/d70cdfa1-0450-4282-95f8-fdc9aa6da2a1)

El comando cambia el método de autenticación del usuario *root* en *localhost* a ***mysql_native_password** y establece la contraseña como **RBooks @2024***.
**<ins>alter user 'root'@'localhost' identified with mysql_native_password by 'RBooks @2024';</ins>**

![image](https://github.com/user-attachments/assets/de4bfc83-bae5-4aab-a7a9-87aebdc88109)

El comando ***mysql -u root -p*** abre la consola de MySQL utilizando el usuario root y solicita una contraseña para realizar la autenticación antes de permitir el acceso.

![image](https://github.com/user-attachments/assets/24b40d32-25d2-487b-a6ac-3e4b461ddad6)

El comando **SELECT user, authentication_string, plugin, host FROM mysql.user;** muestra una lista de los usuarios de MySQL, junto con el método de autenticación que utilizan, el plugin asociado y el host desde el cual pueden conectarse.
***<ins>select user, authentication_string, plugin, host from mysql.user;</ins>***

![image](https://github.com/user-attachments/assets/3c6eb135-eff1-433d-8392-8a188a0ed79b)

El comando ***CREATE USER 'rbooks'@'localhost' IDENTIFIED BY 'RBooks@2024';*** crea un nuevo usuario llamado *rbooks* en MySQL, con la contraseña RBooks@2024 y limitando el acceso solo desde el host localhost.

![image](https://github.com/user-attachments/assets/0534327d-0d7b-42b2-826c-2cdc4265a331)

![image](https://github.com/user-attachments/assets/4e7a091c-083c-475a-89ba-2720a35ddf95)


El comando ***GRANT ALL PRIVILEGES ON *.* TO 'rbooks'@'localhost' WITH GRANT OPTION;*** concede todos los privilegios sobre todas las bases de datos (`*.*`) al usuario *rbooks* en *localhost*, y le otorga la capacidad de transferir estos privilegios a otros usuarios (*WITH GRANT OPTION*).

![image](https://github.com/user-attachments/assets/e3bba4ed-ba76-478a-9cd8-b40be275e62c)

El comando **sudo systemctl status mysql.service** muestra el estado actual del servicio MySQL en el sistema, indicando si está activo, inactivo o ha fallado, y proporciona información adicional sobre su estado y registros.

![image](https://github.com/user-attachments/assets/5691993c-b52e-4baf-8971-3c6ae936f4bb)

Ahora podemos ver el usuario que le hemos implementado.

![image](https://github.com/user-attachments/assets/0940c9f3-3397-4664-a9d3-793e5635b745)

El comando **CREATE DATABASE users;** crea una nueva base de datos llamada **users** en MySQL.

![image](https://github.com/user-attachments/assets/d56d2462-f9ba-4fff-a503-8580711dd072)

Si le ponemos el comando **show database;** podemos ver que se ha creado la base de datos **users**.

![image](https://github.com/user-attachments/assets/2f66b325-a028-4a0f-b717-71aa37338bad)

Seleccionamos una carpeta **.zip**(la capeta que hemos elegido es una que había en el campus IFP).

![image](https://github.com/user-attachments/assets/c981b0c9-7086-4bf4-8dfd-00a7aad37bcf)


Primero, abrimos el CMD de Windows y navegamos hasta la carpeta indicada en la imagen utilizando el comando **cd**.

![image](https://github.com/user-attachments/assets/860fa62f-3974-46dc-9500-559d5f7612f7)

El comando **scp users.sql rbooks@100.77.20.22:/home/rbooks/** transfiere el archivo **users.sql** desde tu máquina local al directorio */home/rbooks/* en el servidor remoto con la dirección IP *100.77.20.22*, autenticándose con el usuario rbooks en dicho servidor.

Luego añadimos la contraseña de la MV.

![image](https://github.com/user-attachments/assets/0674c5db-19fd-4827-aef3-b5558ece3b07)


Se puede verificar que la exportación ha funcionado correctamente ejecutando el comando *ls -l*.

![image](https://github.com/user-attachments/assets/ed6e8989-d6a1-4ae3-9d6e-2d01e397cbd4)

El comando ***mysql -u rbooks -p users < users.sql*** importa el archivo *users.sql* a la base de datos *users* en MySQL, autenticándose con el usuario *rbooks* y solicitando la contraseña antes de realizar la importación.

![image](https://github.com/user-attachments/assets/950d9dec-a02f-463e-9207-810bbec918b7)

![image](https://github.com/user-attachments/assets/28ab1152-952c-421c-b828-ecb681a1fe4b)


Entramos a nuestro usuario de MySQL.

![image](https://github.com/user-attachments/assets/5ce6398d-fed8-42c0-9e12-aa9fd8885734)

El comando ***use users;*** selecciona la base de datos *users* para que todas las consultas posteriores se ejecuten en esa base de datos en MySQL.

![image](https://github.com/user-attachments/assets/78b95eb0-bcf2-4cf6-a00a-9409d8723812)























