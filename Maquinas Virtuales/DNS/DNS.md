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

![image](https://github.com/user-attachments/assets/7c8705d9-33cb-4e6c-b9c5-ef70d16c339c)


Nos dirigimos al archivo *db.10.20.40* que se utiliza para realizar consultas inversas de las direcciones IP *10.20.40.16* y *10.20.40.17*, devolviendo el nombre de dominio rbooks.com. Esta configuración es útil en redes donde es necesario asociar direcciones IP con nombres de dominio para tareas de administración y autenticación.

En este archivo, debemos cambiar *haven.local.* y *hostmaster.haven.local.* por *ns.rbooks.com.* y *hostmaster.rbooks.com.*, respectivamente.
Lo que tenemos que hacer es poner estos códigos en el archivo:


1. @ IN NS ns.rbooks.com.
     * Declara que el servidor de nombres principal para esta zona inversa es *ns.rbooks.com*.
     * El símbolo *@* representa el dominio o zona actual (en este caso, la subred configurada en el archivo de zona inversa).

2. Registros PTR
     * *17 IN PTR rbooks.com*: Indica que la dirección IP que termina en .17 en la subred configurada (por ejemplo, *10.20.40.17*) se resuelve inversamente al dominio *rbooks.com*.
     * *16 IN PTR rbooks.com*: Indica que la dirección IP que termina en *.16* en la subred configurada (por ejemplo, *10.20.40.16*) también se resuelve inversamente al dominio *rbooks.com*.

![image](https://github.com/user-attachments/assets/c13de924-9d39-4ecc-b661-35aeac28b21e)


Cuando hayamos guardado y cerrado el archivo tendremos que comprobar si los dos archivos que hemos modificado funcionan a la perfección usando este comando:
````
named-checkzone 40.20.10.in-addr-arpa /etc/bind/zones/db.40.20.10
````

El resultado que te tiene que dar al ejecutar el comando en el CMD es el siguiente:
````
zone 10.20.10.in-addr-arpa/IN: loaded serial 1
OK
````
![image](https://github.com/user-attachments/assets/2d190cb5-5a15-4c06-80b7-1854c14fd361)
````
named-checkzone rbooks.com /etc/bind/zones/db.rbooks.com
````
El resultado que te tiene que dar al ejecutar el comando en el CMD es este:
````
zone rbooks.com /IN: loaded serial 2
OK
````
![image](https://github.com/user-attachments/assets/59847fa6-a7e9-4f47-b333-2c601974ffdf)

Si el resultado no te pone un *OK* eso significa que hay algún problema en el código que hemos puesto en el archivo.


Luego, debemos editar el archivo *named.conf.options*, que se encuentra en la siguiente dirección: */etc/bind/named.conf.options*. Dentro de este archivo, realizamos las siguientes configuraciones:

Lo que hacemos es crear una lista de acceso para restringir el acceso a quienes pueden realizar las consultas a nuestro servidor DNS. También indicaremos un par de servidores forwarders donde pueda delegar nuestro servidor DNS local cuando no pueda resolver alguna consulta.
````
acl "safeclients"{
       localhost;
       10.20.40.17;
       1.20.40.16;
       localnets;
};
options {
        directory "/var/cache/bind";
        
        recursion yes;
        allow-recursion {safeclients; };
        listen-on {10.20.40.17; };
        allow-transfer {none; };

        forwarders {
                9.9.9.9;
                8.8.8.8;
        };
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys. See https://000.
        #dnssec-validation auto;
};
````
![image](https://github.com/user-attachments/assets/f076ff29-191c-4d42-a2a3-84018029d29d)

Una vez que hayas guardado y salido del archivo, lo siguiente que haremos es reiniciar y verificar el estado del servicio BIND9 que hemos instalado en la MV con los siguientes comandos:
* sudo systemctl restart bind9
* sudo systemctl status bind9

![image](https://github.com/user-attachments/assets/1c2649c2-f45e-443f-be19-66d7ee893d1c)
![image](https://github.com/user-attachments/assets/d913cf58-62d3-44fd-b56f-04e1d64a8a6e)

Por último, utilizamos el comando nslookup, que permite realizar consultas a servidores DNS para resolver nombres de dominio a direcciones IP, o viceversa. 

* ns.rbooks.com
* rbooks.com

![image](https://github.com/user-attachments/assets/51ad045f-7140-4088-893b-ed53e2f52a62)


