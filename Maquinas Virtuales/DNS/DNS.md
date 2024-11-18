# DNS

## Pasos para configurar un Servidor DNS Primario

Primero actualizamos el sistema operativo de Ubuntu Server:
* sudo apt upgrade
* sudo apt update

Una vez que el sistema está actualizado instalamos las herramientas para trabajar con la configuración de red:
* sudo apt install net-tools

Esto nos permitirá utilizar las siguientes herramientas:
* ifconfig: Configura las interfaces de red, muestra sus detalles y estadísticas.
* netstat: Muestra las conexiones de red, tablas de enrutamiento y estadísticas.
* route: Puedes ver y manipular tablas de enrutamiento.
* arp: Muestra y modifica la tabla ARP (Address Resolution Protocol).
* hostname: Permite ver o configurar el nombre del host.


Es necesario habilitar DHCP en el archivo _/etc/netplan/00-installer-config.yaml_ para que el sistema obtenga una dirección IP automáticamente.

Este código configura la red en un sistema Linux utilizando Netplan. Activa DHCP para la interfaz *ens18*, lo que permite que el sistema reciba una dirección IP automáticamente. Además, se pueden definir servidores DNS específicos y configurar una ruta predeterminada, estableciendo la puerta de enlace como *10.20.40.1*.

![netplan](https://github.com/user-attachments/assets/571fb651-0805-4386-a73b-52e2cd5b95b3)


Luego, debemos ejecutar los comandos *sudo netplan apply* y *sudo netplan try* para aplicar los cambios de configuración de red en la máquina. Si no se ejecutan estos comandos, el sistema no detectará la dirección IP asignada correctamente:
* sudo netplan apply
* sudo netplan try


A continuación, instalamos *bind 9*, un software de servidor DNS ampliamente utilizado para resolver nombres de dominio y mapearlos a direcciones IP.
* sudo apt install bind9 

![image](https://github.com/user-attachments/assets/4f06ee32-d486-4be9-bd6e-7fbb36d79ab6)

Entraremos a las dos carpetas que son *etc* y *bind*.
* sudo su
* cd /etc/bind

Ahora debemos editar el archivo *named.conf.local* usando el comando *sudo nano* para poder modificar su configuración.

![image](https://github.com/user-attachments/assets/9fe24fe0-9731-423b-8a38-00fdac89f295)


Este código convierte los nombres de dominio en direcciones IPs. Cuando un cliente quiere acceder a Internet, como un sitio web, envía una consulta al servidor DNS solicitando la dirección IP la correspondencia al nombre del dominio (por ejemplo, rbooks.com → 10.20.40.1).
```
// Búsquedas directas
zone "rbooks.com" in {
      type master;
      file "/etc/bind/zones/db.rbooks.com";
};
```
Este código convierte una dirección IP en un nombre de dominio. Es similar al de búsqueda directa, pero en este caso, el cliente envía una consulta DNS con una dirección IP, y el servidor DNS devuelve el nombre de dominio asociado (por ejemplo, 10.20.40.1 → rbooks.com).
````
// Búsquedas inversas
zone "40.20.10.in-addr.arpa" in {
      type master;
      file "/etc/bind/zones/db.40.20.10";
};
````
![image](https://github.com/user-attachments/assets/2f1bddc3-5f49-43ed-b2eb-d60e74a72861)


Guardamos los cambios y salimos del editor. Luego, ejecutamos el comando *named-checkconf* en la terminal para verificar si la configuración del archivo *named.conf.local* es correcta:
* named-checkconf

Este comando revisa la sintaxis y la configuración del archivo que hemos modificado. Si no muestra ningún mensaje, significa que todo está correcto. Sin embargo, si aparece algún texto de error, eso indica que hay un problema en el archivo y debes corregirlo.

![image](https://github.com/user-attachments/assets/7119bd2c-9de0-4b3b-b381-fd0a1cb9c110)

Luego creamos una nueva carpeta llamada zones usando el comando:
````
mkdir zones
````
![image](https://github.com/user-attachments/assets/9787f591-3ada-4cbe-8e2d-9ab12d908e92)

Y luego comprobamos si se ha creado con el comando:
````
ls -l
````
Ahora tenemos que copiar dos archivos que son el db.127 y el db.local y cambiarle el nombre:
* cp db.127 zones/db.40.20.10🡪 es el nombre que le ponemos al archivo que hemos copiado a la carpeta zones

* cp db.local zones/db.rbooks.com🡪 es el nombre que le ponemos al archivo que hemos copiado a la carpeta zones

![image](https://github.com/user-attachments/assets/1d579ce0-ec1c-44d6-a1d6-55b56318dce9)


Una vez que hayamos copiado los dos archivos a la carpeta *zones*, accedemos a esa carpeta y luego abrimos el archivo *db.rbooks.com* para hacer los cambios necesarios.

Este archivo configura una zona DNS en BIND para el dominio *rbooks.com*, definiendo su servidor de nombres (*ns.rbooks.com*), las direcciones IP asociadas (*10.20.40.17* y *10.20.40.16*), así como parámetros de control como los tiempos de actualización y caché.

En este archivo, debemos cambiar los valores de *havem.local.* y *hostmaster.haven.local.* por *ns.rbooks.com.* y *admin.rbooks.com.*, respectivamente.

 Luego ponemos lo siguiente:
* @ IN NS ns.rbooks.com.: 
Define que ns.rbooks.com es el servidor de nombres (NS) para la zona rbooks.com.

* @ IN A 10.20.40.17: 
Define la dirección IP del dominio principal rbooks.com como 10.20.40.17.

* NS IN A 10.20.40.17: 
Asigna la dirección IP 10.20.40.17 al servidor de nombres NS.

* WWW IN A 10.20.40.16: 
Define que www.rbooks.com apunta a la dirección IP 10.20.40.16.


















