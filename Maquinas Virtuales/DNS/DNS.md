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


Es necesario habilitar DHCP en el archivo /etc/netplan/00-installer-config.yaml para que el sistema obtenga una dirección IP automáticamente.

Este código configura la red en un sistema Linux utilizando Netplan. Activa DHCP para la interfaz ens18, lo que permite que el sistema reciba una dirección IP automáticamente. Además, se pueden definir servidores DNS específicos y configurar una ruta predeterminada, estableciendo la puerta de enlace como 10.20.40.1.
