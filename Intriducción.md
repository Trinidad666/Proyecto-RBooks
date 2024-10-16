## Introducción
Quienes Somos:
Somos una empresa fundada por Hugo Marín y Víctor Almansa y hemos decidido crear una aplicación web para el entretenimiento de lectura tanto de libros, cómics y audiolibros.

En que consiste nuestra app:
Consiste en proporcionar a los clientes una forma más cómoda de leer libros o cómics y poder encontrar los tipos de lectura que quieren los clientes, también puedan encontrar libros o cómics que ya no se puedan encontrar en ninguna librería o tienda de cómics. Si nuestros clientes registrados son escritores pueden publicar sus libros o biografías y negociar con nosotros un precio para vender dichos productos. Parte de nuestro producto como hemos mencionado antes son los cómisc de marcas conocidas como MARVEL, DC o Astiberri(editoriales de cómics más importantes de España) y otras marcas no tan conocidas con las que hemos hecho negociosa para la venta de sus productos.


## Diseño de nuestra aplicación
Como podreis ver en nuestro mockup se muestra las pestañas de nuestros productos como libros, comics y audio libros, también tenemos la sección de estantería donde podremos ver todos los generos de libros y comics que hay. También tenemos otra pestaña donde puedes añadir tus libros favoritos y subir libros o comics, pero para poder subir o añadir libros en tu biblioteca tiene que registrarte.
Aquí os mostraremos parte del mockup:

### Índice
Como podreis ver en nuestro inicio tendremos el nombre de la empresa en el centro y con imagenes de fondo que se iran cambiando cada cierto tiempo. Y mas abajo expondremos nuestros mejores productos de libros y comics con un pequeño texto de descripción

![Index1](https://github.com/user-attachments/assets/1861e737-962c-4a44-bb10-d3d0f47c675a)

![Index2](https://github.com/user-attachments/assets/86ed3bb3-a397-4ea3-9071-5146eb465084)




### Libros, Cómics y Audiolibros
En los apartados de libros, cómics y audiolibros tendremos una lista de nuestrs productos y un buscado ariba a la derecha para encontrar de forma más rapida el producto deseado. 

![image](https://github.com/user-attachments/assets/5843927e-bd5c-4371-bea1-a17e168c8c1a)

### Estantería
En estanteria tendremos una seccion donde tendremos todos los genero que hay de lectura y a la derecha tendremos imagenes de libros cin un pequeño texto que indique los generos que tenmos de lectura. Una vez que hemos seleccionado una de las imagenes nos llevara a otra pesataña con un listado de libros, comics o audiolibros del mismo genero.
![image](https://github.com/user-attachments/assets/98c872c3-0395-461c-a091-3221a877ee6e)

### Mi Biblioteca
Como dice su nombre Mi Biblioteca es una pagina donde tendremos almacenados los productod de lectura que nos ha gustado más, pero solo sera para aquellos que este registrados en nuestra página web.
![image](https://github.com/user-attachments/assets/dfec9607-3572-4459-9888-25231dcfbb84)


## Nuestra gamma de colores y Logo
### Blanco
Hemos usado el color blanco porque es agradable y da paz y tranquilidad al usuario. 

### Naranja
Hemos elegido el color naranja porque se asocia con la energía, la creatividad y el entusiasmo.

### Azul oscuro
Hemos elegido el color azul oscura porque simboliza la seriedad por los productos que vendamos como biografias sobre etapas belicas, dramas, etc.

### Negro
Hemos utilizado el color negro por su elegancia y sobre todo porque simboliza el misterio para nuestros productos como los libros de H. P. Lovecraft.
![RBOOKS_Panel de colores](https://github.com/user-attachments/assets/31e1feab-92b2-4ff0-867c-8120417f4c86)


### Nuestro logo
Hemos escogido este logo porque son las iniciales de nuestra empresa "RBooks" y escogimos el color naranja porque se asocia con la energía, la creatividad y el entusiasmo.

![logo](https://github.com/user-attachments/assets/f5eef2c6-5696-4f00-be2d-d52c9c57c741)



## Nuestro esquema de nuestra pagina web
Aquí os mostraremos como nuestra pagina web esta conectado con el resto de paginas donde tenemos nuestros productos, la biblioteca, el inicio y registro de sesion.

### Hardware y Sistem Operativo
Utilizamos de hardware 2GB de memoria, 1 procesador, disco duro de 14GB y de nuestro sistema operativo hemos utilizado un Ubuntu live Server 22.04.2.

### Estas son nuestrar maquina virtuales que tenmos de momento

Aquí os explicaremos los pasos que hemos hecho:
Vamos a proxmox y nos dirigimos al nodo de nuestro servidor llamado rbooks. Creamos la interfaz de red y añadimo la ip 10.20.40.253/24 usando un Linux Bridge y el nombre es vmbr1.


### Router
En el HW del Router le ponemos el dispositivo de red que creamos el vmbr1
En netplan creamo la red interna y externa.

![image](https://github.com/user-attachments/assets/2a46b4aa-0c67-4d3b-b303-56060908021c)

Y le hacemos un "netplan apply" para guarda los cambios que hicimos.

Luego añadimos la dirección nano /etc/sysctl.conf y Quitamos el "#" en la linea donde se encuentra "net.ipv4.ip_forward=1".
Y le ponemos los cabios con el "sysctl -p"


Despues agregamos sudo apt install iptables.

Cuando termine podemos comprobar que no tenemos ninguna regla habilitada, por supuesto:
iptables -L
iptables -t nat -L

Ahora configuramos una regla de iptables como se muestra a continuación. 
iptables -t nat -A POSTROUTING -o ens18 -j MASQUERADE

Hacemos esta comprobacion:

![image](https://github.com/user-attachments/assets/f4408498-fd52-4f9d-905d-a825dc4a0488)

Luego le hacemso un "sudo iptables-save" y luego le instalamos "sudo apt install iptables-persistent -y"


### Cliente
Le cambiamos el dispositivo de red del vmbr0 a vmbr1

Añadimos ip cliente:

![1](https://github.com/user-attachments/assets/85b903dd-e965-4ffd-8bc8-55286426e983)

Hacemos ping en cuanlquier dirección ip.

![2](https://github.com/user-attachments/assets/a1bf4d41-f953-45d2-a064-b1b7b0515a1c)






















