# Router

## **Interfaz ens18**
**Propósito:** Conexión a redes externas (generalmente hacia Internet o redes fuera de la red local).
1. **dhcp4: false**
   * No utiliza DHCP, por lo que la dirección IP y otros parámetros de red se configuran manualmente.

2. **addresses:**
   * La dirección IP estática configurada es *100.77.20.38/24*, lo que significa que pertenece a la red 100.77.20.0 con una máscara de subred /24 (equivalente a 255.255.255.0).

3. **nameservers:**
   * No se ha configurado ningún servidor DNS en esta sección. Esto puede ser un error o simplemente no está especificado en esta configuración.

4. **routes:**
   * Se define una ruta predeterminada con to: default, lo que indica que todo el tráfico que no coincida con rutas específicas en la tabla de enrutamiento será dirigido al gateway *100.77.20.1*.

**Conclusión:**
  * La interfaz ens18 está configurada para la salida hacia redes externas. Todo el tráfico saliente que no pertenezca a la red local será enviado al gateway *100.77.20.1*.


**Interfaz ens19**
**Propósito:** Conexión hacia una red interna.
1. **dhcp4: false**
    * Configuración manual (sin uso de DHCP).
2. **addresses:**
    * Se le asigna la dirección IP estática *10.20.40.1/24*, lo que indica que pertenece a la red interna *10.20.40.0* con una máscara de subred */24* (equivalente a 255.255.255.0).
3. **nameservers:**
    * Se definen dos servidores DNS:
      * 10.20.40.1: Generalmente se trata de un servidor DNS interno.
      * 8.8.8.8: Servidor DNS público de Google.
4. **routes:**
    * Aunque se menciona el atributo routes, no se han configurado rutas adicionales específicas para esta interfaz.

**Conclusión:**
La interfaz **ens19** está configurada para proporcionar conectividad hacia la red interna, posiblemente para la comunicación con dispositivos o servicios locales en la red *10.20.40.0/24*.

![image](https://github.com/user-attachments/assets/a5adbba5-75f7-4725-9d38-1952dcf2c542)

Este código configura un servidor DHCP para asignar automáticamente direcciones IP dentro del rango *10.20.40.10 - 10.20.40.100* en la subred *10.20.40.0/24*. También especifica parámetros clave, como la máscara de subred, el gateway (*10.20.40.1*), el servidor DNS (*10.20.40.17*), el dominio (*rbooks.com*) y los tiempos de concesión de las direcciones IP.

![image](https://github.com/user-attachments/assets/e79d8006-bf4f-4d52-b38e-8210cbfc8ac3)


Iremos a cada MV y accederemos al archivo */etc/netplan/00-installer-config.yaml* para configurar las interfaces de red en los sistemas que utilizan *Netplan*.

### DNS

![image](https://github.com/user-attachments/assets/845c2b8a-6a73-40d3-8c54-40ad06e59f0c)

### Cliente

![image](https://github.com/user-attachments/assets/5a21b98f-b5da-4140-be8d-6c8b31ac60ed)

### Web

![image](https://github.com/user-attachments/assets/06aa650c-7f47-40e6-8e80-02643f925e5e)

### BBDD

![image](https://github.com/user-attachments/assets/83f52873-594c-4f78-b658-41c962835ec1)



En el hardware del router, asignamos el dispositivo de red que creamos, vmbr1. En Netplan, configuramos tanto la red interna como la externa.

![image](https://github.com/user-attachments/assets/d7937bf5-669a-44a3-a707-d84d61fc830a)


Ejecutamos *netplan apply* para guardar los cambios realizados. Luego, editamos el archivo */etc/sysctl.conf* con **nano /etc/sysctl.conf** y descomentamos la línea que contiene **net.ipv4.ip_forward=1** (eliminando el símbolo # al inicio de la línea). Después, aplicamos los cambios con el comando **sysctl -p**.

Después, agregamos **sudo apt install iptables**. Una vez finalizada la instalación, podemos comprobar que no hay reglas habilitadas con los siguientes comandos:
``
iptables -L
iptables -t nat -L
``
Finalmente, configuramos una regla de *iptables* para habilitar el enmascarado de IP con el siguiente comando:
``
iptables -t nat -A POSTROUTING -o ens18 -j MASQUERADE
``

Hacemos una comprobación:

![image](https://github.com/user-attachments/assets/807852b2-fba3-4593-ae76-22e039c4fcc3)


Luego, ejecutamos **sudo iptables-save** para guardar las reglas de iptables. Después, instalamos el paquete **iptables-persistent** con el comando:
``
sudo apt install iptables-persistent -y
``

A continuación, configuramos la redirección del tráfico entrante en el *puerto 80* (HTTP) al servidor Nginx en la IP interna con el siguiente comando:
``
iptables -t nat -A PREROUTING -p tcp -d 100.77.20.38 --dport 80 -j DNAT --to-destination 10.20.40.16:80
``

De manera similar, redirigimos el tráfico entrante en el puerto 443 (HTTPS) al servidor Nginx en la IP interna con este comando:
``
iptables -t nat -A PREROUTING -p tcp -d 100.77.20.38 --dport 443 -j DNAT --to-destination 10.20.40.16:443
``


