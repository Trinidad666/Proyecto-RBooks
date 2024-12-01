# **Archivos Raiz**

## **audio_libros.php**

El archivo **audio_libros.php** presenta una lista de audiolibros disponibles en el sitio web. Incluye un menú de navegación que permite acceder a otras secciones del sitio, una sección destacada con el título "Audiolibros", y una serie de tarjetas que exhiben detalles de cada audiolibro, como la portada y la sinopsis. Al hacer clic en cualquiera de las tarjetas, el usuario es redirigido a la página de detalles del audiolibro correspondiente. Además, el archivo contiene un pie de página con enlaces a redes sociales y el logo del sitio.


## **bbdd-rbooks.sql**

El archivo **bbdd-rbooks.sql** incluye un script SQL que permite crear y poblar una base de datos denominada **rbooks**. Esta base de datos está diseñada para gestionar una tienda o sistema de administración de libros, cómics y productos literarios en diversos formatos, tales como libros impresos, cómics y audiolibros.
Aquí están los puntos clave del script:

1. Estructura de la base de datos:

  * Clientes: Almacena información sobre los usuarios que compran productos.
  * Productos: Representa los productos (libros, cómics, audiolibros), con campos como título, género, precio, portada, sinopsis, fecha de publicación, entre otros.
  * Ventas: Registra las ventas realizadas, asociando cada venta con un cliente.
  * Pago: Almacena los pagos realizados para las ventas.
  * Garantías: Contiene información sobre las garantías disponibles para los productos vendidos.
  * Autores: Almacena datos de los autores de los productos.
  * Editoriales: Información sobre las editoriales que publican los productos.
  * Mi Biblioteca: Asocia a los clientes con los productos que han adquirido y almacenado.
  * Producto_Cliente: Relaciona los productos con los clientes.

2. Relaciones entre las tablas:
  * Las tablas están normalizadas y utilizan claves foráneas (FOREIGN KEY) para establecer relaciones entre ellas, como las ventas que se vinculan con los clientes y los productos vendidos, así como las garantías asociadas a los productos.

3. Población de las tablas:
  * El script incluye instrucciones de inserción de datos (INSERT INTO) para tablas como Cliente, Autor, Producto, Ventas, Pago, Garantía, etc., permitiendo poblar la base de datos con datos de ejemplo.

5. Consultas y configuraciones adicionales:
  * Se desactivan y restauran temporalmente las comprobaciones de claves foráneas (FOREIGN_KEY_CHECKS) y las verificaciones de unicidad (UNIQUE_CHECKS), lo que puede resultar útil para evitar problemas al insertar datos que dependen de otras tablas.


## **biblioteca.php**
El código muestra una página web titulada "Biblioteca del Usuario", donde se consultan y presentan en tarjetas los productos (libros, cómics, etc.) del usuario autenticado. Si el usuario no tiene productos en su biblioteca, se muestra un mensaje de error indicando que la biblioteca está vacía.


## **comics.php**
El código de comics.php genera una página dedicada a los cómics, donde se consultan los productos de tipo cómic almacenados en una base de datos y se presentan en tarjetas interactivas. Al hacer clic en una de las tarjetas, el usuario es redirigido a una página con más detalles sobre el cómic seleccionado.


## **estanteria.php**



_____________________________________________





## **in-sign.php**
El archivo in-sign.php gestiona el inicio de sesión y el registro de usuarios, permitiendo que los usuarios ingresen con su correo y contraseña o creen una nueva cuenta. El código incluye validaciones para verificar si el usuario ya está registrado y muestra mensajes de error o éxito según el resultado de las acciones.


## **index.php**
El archivo index.php es la página principal del sitio web RBooks, que presenta un carrusel de imágenes, un menú de navegación, y una selección de libros y cómics extraídos de una base de datos, los cuales se muestran en tarjetas interactivas. Al hacer clic en una tarjeta, el usuario es redirigido a la página de detalles correspondiente. Además, gestiona las sesiones de usuario, permitiendo tanto el inicio como el cierre de sesión.


## **libros.php**
El archivo libros.php es una página dentro del sitio web RBooks que muestra una lista de libros extraídos de una base de datos, presentados en tarjetas interactivas, cada una con una imagen y una breve sinopsis. Al hacer clic en una tarjeta, el usuario es redirigido a la página de detalles del libro. También incluye el encabezado y el pie de página comunes al sitio.


## **producto.php**
El archivo producto.php muestra los detalles de un producto (en este caso, un libro) específico en una página, incluyendo información como el título, género, sinopsis y precio. Los usuarios autenticados con una suscripción activa pueden agregar el producto a su biblioteca. Si el producto no se encuentra o si hay algún error en el proceso, se muestra un mensaje de error. Al igual que otras páginas, incluye el encabezado y el pie de página comunes al sitio.
