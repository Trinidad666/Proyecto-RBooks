# Arquitectura de Nuestras MV
Aquí lo que haremos es poner los Sistemas Operativos y la capacidad de CPU, Ram, Disco Duro que tendrá cada Maquina Virtual.

<br>
<br>
<br>


# Instalación de las MV
Aquí pondremos los pasos que hemos hecho con las maquinas virtuales, que comando hemos utilizado y mostraremos algunas imágenes de la instalación.


<br>


## Router
En el HW del Router le ponemos el dispositivo de red que creamos el vmbr1
En netplan creamo la red interna y externa.

![image](https://github.com/user-attachments/assets/2a46b4aa-0c67-4d3b-b303-56060908021c)

Y le hacemos un "netplan apply" para guarda los cambios que hicimos.

Luego añadimos la dirección nano /etc/sysctl.conf y Quitamos el "#" en la línea donde se encuentra "net.ipv4.ip_forward=1". Y le ponemos los cabios con el "sysctl -p"

Después agregamos sudo apt install iptables.

Cuando termine podemos comprobar que no tenemos ninguna regla habilitada, por supuesto: iptables -L iptables -t nat -L

Ahora configuramos una regla de iptables como se muestra a continuación. iptables -t nat -A POSTROUTING -o ens18 -j MASQUERADE

<br>
Hacemos esta comprobación:

![image](https://github.com/user-attachments/assets/f4408498-fd52-4f9d-905d-a825dc4a0488)

Luego le hacemso un "sudo iptables-save" y luego le instalamos "sudo apt install iptables-persistent -y"

<br>

## Cliente
Le cambiamos el dispositivo de red del vmbr0 a vmbr1

Añadimos ip cliente:

![1](https://github.com/user-attachments/assets/85b903dd-e965-4ffd-8bc8-55286426e983)

Hacemos ping en cuanlquier dirección ip.

![2](https://github.com/user-attachments/assets/a1bf4d41-f953-45d2-a064-b1b7b0515a1c)

