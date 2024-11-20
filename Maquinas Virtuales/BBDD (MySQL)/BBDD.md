
# MySQL

## ¿Qué es MySQL?
MySQL es un sistema de gestión de bases de datos relacional de código abierto que emplea el lenguaje SQL para almacenar, gestionar y consultar datos de manera eficiente. Es ampliamente utilizado debido a su fiabilidad, facilidad de uso y rendimiento, especialmente en aplicaciones web.

El comando *sudo mysql_secure_installation* ejecuta un asistente que ayuda a configurar MySQL de forma segura. Este proceso permite establecer una contraseña robusta para el usuario root, eliminar usuarios anónimos, deshabilitar accesos remotos para el usuario root y eliminar bases de datos de prueba. Estos pasos son fundamentales para fortalecer la seguridad del servidor MySQL y protegerlo contra accesos no autorizados o vulnerabilidades.

![image](https://github.com/user-attachments/assets/7db67c76-4181-400c-892c-dddf3567f627)


Al ejecutar el comando *sudo mysql_secure_installation*, se inicia un asistente interactivo diseñado para mejorar la seguridad del servidor MySQL mediante una serie de pasos clave:
   1. *Configurar la contraseña de root:* Permite establecer o actualizar la contraseña para el usuario root de MySQL, asegurando el acceso restringido al sistema.
   2. *Eliminar usuarios anónimos:* Elimina las cuentas predeterminadas sin nombre, que podrían ser utilizadas para acceder al servidor sin autenticación.
   3. *Deshabilitar el acceso remoto del root:* Refuerza la seguridad al limitar el acceso del usuario root solo al servidor local, evitando conexiones remotas no autorizadas.
   4. *Borrar bases de datos de prueba:* Elimina la base de datos *test*, que por defecto está accesible a cualquier usuario, lo que podría representar un riesgo de seguridad.
   5. *Recargar las tablas de privilegios:* Aplica inmediatamente todos los cambios realizados, asegurando que las nuevas configuraciones entren en efecto de forma inmediata.

Este conjunto de medidas asegura que el servidor MySQL esté protegido contra configuraciones predeterminadas inseguras y reduce posibles vectores de ataque.

![image](https://github.com/user-attachments/assets/4bc7c712-87f7-42b2-aed1-e4c1084df38e)

Le das a todo *y* (sí / yes).

![image](https://github.com/user-attachments/assets/22b69f20-b3b3-4dca-b6bc-4819e3e39ae7)

![image](https://github.com/user-attachments/assets/43230f24-af43-4a88-9a7e-0bff7f6c1716)


El comando *sudo mysql* se utiliza para acceder a la consola interactiva de MySQL como el usuario root del sistema.

![image](https://github.com/user-attachments/assets/a3947380-5674-47c9-a630-201914fcd916)

El comando *SHOW DATABASES*; lista todas las bases de datos disponibles en el servidor MySQL.

![image](https://github.com/user-attachments/assets/d70cdfa1-0450-4282-95f8-fdc9aa6da2a1)


El comando cambia el método de autenticación del usuario root en localhost a mysql_native_password y establece la contraseña como Kirby @2024.
**<ins>alter user 'root'@'localhost' identified with mysql_native_password by 'Kirby @2024';</ins>**







