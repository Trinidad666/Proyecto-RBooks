## Quienes Somos
Somos una empresa de dos personas que hemos decidido crear una aplicación para el entretenimiento y conocimientode los clintes.


## En que consiste nuestra app
La Web consiste en proporcionar a los clientes una forma más comoda de leer libros o comics y poder encontrar los tipos de lectura que quieren los clientes, tambien puedan encontrar libros o comic que no se pueden encontrar en ninguna libreria y puedan publicar sus lecturas. 


## Nuestro logo
Hemos escogido este logo porque son las iniciales de nuestra empresa "RBooks" y escogimos el color naranja porque se asocia con la energía, la creatividad y el entusiasmo.

![logo](https://github.com/user-attachments/assets/f5eef2c6-5696-4f00-be2d-d52c9c57c741)


## Nuestro Mockup
Como podreis ver en nuestro mockup se muestra las pestañas de nuestros productos como libros, comics y audio libros, también tenemos la sección de estantería donde podremos ver todos los generos de libros y comics que hay. También tenemos otra pestaña donde puedes añadir tus libros favoritos y subir libros o comics, pero para poder subir o añadir libros en tu biblioteca tiene que registrarte.
Aquí os mostraremos parte del mockup:

### Libros
![image](https://github.com/user-attachments/assets/5843927e-bd5c-4371-bea1-a17e168c8c1a)

### Estantería
![image](https://github.com/user-attachments/assets/98c872c3-0395-461c-a091-3221a877ee6e)

### Mi Biblioteca
![image](https://github.com/user-attachments/assets/dfec9607-3572-4459-9888-25231dcfbb84)

Para poder ver más del mockup tenemos el archivo subido.

## Nuestra gamma de colores
### Blanco
Hemos usado el color blanco porque es agradable y da paz y tranquilidad al usuario. 

### Naranja
Hemos elegido el color naranja porque se asocia con la energía, la creatividad y el entusiasmo.

### Azul oscuro
Hemos elegido el color azul oscura porque simboliza la seriedad por los productos que vendamos como biografias sobre etapas belicas, dramas, etc.

### Negro
Hemos utilizado el color negro por su elegancia y sobre todo porque simboliza el misterio para nuestros productos como los libros de H. P. Lovecraft.
![RBOOKS_Panel de colores](https://github.com/user-attachments/assets/31e1feab-92b2-4ff0-867c-8120417f4c86)


## Nuestro esquema de nuestra pagina web
Aquí os mostraremos como nuestra pagina web esta conectado con el resto de paginas donde tenemos nuestros productos, la biblioteca, el inicio y registro de sesion.

## Estas son nuestrar maquina virtuales que tenmos de momento

Aquí os explicaremos los pasos que hemos hecho:
Vamos a proxmox y nos dirigimos al nodo de nuestro servidor llamado rbooks. Creamos la interfaz de red y añadimo la ip 100.77.20.253/24 usando un Linux Bridge.


### Router
En netplan creamo la red interna y externa.

![image](https://github.com/user-attachments/assets/2a46b4aa-0c67-4d3b-b303-56060908021c)

netplan apply

Luego añadimos la dirección nano /etc/sysctl.conf y Quitamos el "#" en la linea donde se encuentra "net.ipv4.ip_forward=1".

Despues agregamos sudo apt install iptables.

Cuando termine podemos comprobar que no tenemos ninguna regla habilitada, por supuesto:
iptables -L
iptables -t nat -L

Ahora configuramos una regla de iptables como se muestra a continuación. 
iptables -t nat -A POSTROUTING -o ens18 -j MASQUERADE

Hacemos esta comprobacion:

![image](https://github.com/user-attachments/assets/f4408498-fd52-4f9d-905d-a825dc4a0488)



### Cliente

Añadimos ip cliente:

![1](https://github.com/user-attachments/assets/85b903dd-e965-4ffd-8bc8-55286426e983)

Hacemos ping en cuanlquier dirección ip.

![2](https://github.com/user-attachments/assets/a1bf4d41-f953-45d2-a064-b1b7b0515a1c)






















