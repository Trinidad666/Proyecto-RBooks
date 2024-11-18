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

// Búsquedas directas
zone "rbooks.com" in {
      type master;
      file "/etc/bind/zones/db.rbooks.com";
};


