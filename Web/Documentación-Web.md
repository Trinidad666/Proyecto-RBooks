# **Documento de RBooks**

## Archivos Raíz
### audio_libros.php
El archivo audio_libros.php presenta una lista de audiolibros disponibles en el sitio web. Incluye un menú de navegación que permite acceder a otras secciones del sitio, una sección destacada con el título "Audiolibros", y una serie de tarjetas que exhiben detalles de cada audiolibro, como la portada y la sinopsis. Al hacer clic en cualquiera de las tarjetas, el usuario es redirigido a la página de detalles del audiolibro correspondiente. Además, el archivo contiene un pie de página con enlaces a redes sociales y el logo del sitio.

### bbdd-rbooks.sql
El archivo bbdd-rbooks.sql incluye un script SQL que permite crear y poblar una base de datos denominada rbooks. Esta base de datos está diseñada para gestionar una tienda o sistema de administración de libros, cómics y productos literarios en diversos formatos, tales como libros impresos, cómics y audiolibros. Aquí están los puntos clave del script:

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

4. Consultas y configuraciones adicionales:
    * Se desactivan y restauran temporalmente las comprobaciones de claves foráneas (FOREIGN_KEY_CHECKS) y las verificaciones de unicidad (UNIQUE_CHECKS), lo que puede resultar útil para evitar problemas al insertar datos que dependen de otras tablas.


### biblioteca.php
El archivo biblioteca.php genera una página web titulada "Biblioteca del Usuario", donde se consultan y presentan en tarjetas los productos (libros, cómics, etc.) del usuario autenticado. Si el usuario no tiene productos en su biblioteca, se muestra un mensaje de error indicando que la biblioteca está vacía.

### comics.php
El archivo comics.php genera una página dedicada a los cómics, donde se consultan los productos de tipo cómic almacenados en una base de datos y se presentan en tarjetas interactivas. Al hacer clic en una de las tarjetas, el usuario es redirigido a una página con más detalles sobre el cómic seleccionado.

### estanteria.php
El archivo estanteria.php genera una página web que incluye una barra lateral con enlaces a diversos géneros literarios y un botón para abrir o cerrar esta barra. En el área principal se muestran los productos (libros, cómics, etc.) correspondientes al género seleccionado. Además, cuenta con un encabezado que incluye el menú de navegación y un pie de página. Utiliza JavaScript para cargar dinámicamente los productos según el género elegido, realizando solicitudes a un archivo productos.php mediante fetch para obtener los datos.

### in-sign.php
El archivo in-sign.php gestiona el inicio de sesión y el registro de usuarios, permitiendo que los usuarios ingresen con su correo y contraseña o creen una nueva cuenta. El código incluye validaciones para verificar si el usuario ya está registrado y muestra mensajes de error o éxito según el resultado de las acciones.

### index.php
El archivo index.php es la página principal del sitio web RBooks, que presenta un carrusel de imágenes, un menú de navegación, y una selección de libros y cómics extraídos de una base de datos, los cuales se muestran en tarjetas interactivas. Al hacer clic en una tarjeta, el usuario es redirigido a la página de detalles correspondiente. Además, gestiona las sesiones de usuario, permitiendo tanto el inicio como el cierre de sesión.

### libros.php
El archivo libros.php es una página dentro del sitio web RBooks que muestra una lista de libros extraídos de una base de datos, presentados en tarjetas interactivas, cada una con una imagen y una breve sinopsis. Al hacer clic en una tarjeta, el usuario es redirigido a la página de detalles del libro. También incluye el encabezado y el pie de página comunes al sitio.

### producto.php
El archivo producto.php muestra los detalles de un producto (en este caso, un libro) específico en una página, incluyendo información como el título, género, sinopsis y precio. Los usuarios autenticados con una suscripción activa pueden agregar el producto a su biblioteca. Si el producto no se encuentra o si hay algún error en el proceso, se muestra un mensaje de error. Al igual que otras páginas, incluye el encabezado y el pie de página comunes al sitio.

## CSS
### audio_libros-style.css
Este archivo CSS define los estilos para una página web que incluye un carrusel de imágenes, tarjetas interactivas con un efecto 3D, y un diseño responsivo. Los estilos incluyen efectos de transición suaves, un esquema de colores predominante en tonos oscuros y naranjas, y un diseño flexible usando Flexbox para organizar las tarjetas de productos de manera eficiente en diferentes tamaños de pantalla.

### comics-style.css
El archivo comics-style.css contiene los estilos para una página web con un carrusel de imágenes en la sección hero, donde las imágenes se deslizan dinámicamente. Además, las tarjetas interactivas tienen un efecto 3D, de modo que, al pasar el cursor sobre ellas, la tarjeta gira mostrando su reverso. El diseño sigue un esquema de colores oscuros con toques de naranja (#FF5722) y es totalmente adaptable a dispositivos móviles gracias al uso de consultas de medios (media queries).

### footer-producto.css
El archivo footer-producto.css está diseñado para estilizar el pie de página (footer) de una página web. Utiliza un fondo negro y texto blanco, con una disposición flexible que permite a los elementos (como el logo y los logotipos) distribuirse horizontalmente en pantallas grandes y ajustarse verticalmente en dispositivos pequeños. Además, el diseño asegura que el pie de página se mantenga al fondo de la página y se adapte a distintos tamaños de pantalla mediante consultas de medios (media queries).

### footer.css
El archivo footer.css define los estilos para el pie de página (footer) de una página web, con fondo negro y texto blanco. Utiliza Flexbox para alinear los elementos (como el logo y los logotipos) de manera horizontal en pantallas grandes y verticalmente en dispositivos móviles. Además, los logotipos tienen un espaciado uniforme para un diseño equilibrado. El archivo garantiza que el pie de página se vea bien tanto en pantallas grandes como en dispositivos más pequeños.

### header.css
El archivo header.css define los estilos para el encabezado y la barra de navegación de la página web. Utiliza Flexbox para organizar los elementos, como el logo y los enlaces del menú. El menú incluye un diseño desplegable, donde los subelementos se muestran al pasar el cursor sobre los elementos principales. Además, incluye un botón de inicio con efectos interactivos que cambian de color al pasar el ratón. El diseño es responsivo, adaptándose a pantallas más pequeñas reorganizando los elementos de manera vertical.

### index-style.css
El archivo index-style.css define los estilos generales y componentes clave de la página de inicio. Incluye una sección hero con un carrusel de imágenes, donde el texto se superpone a la imagen con un efecto de sombra. Los textos del carrusel se ajustan para ser más pequeños en pantallas de menos de 768px. También estiliza las tarjetas interactivas con un efecto 3D, en el que giran al pasar el cursor para revelar más información. Se utiliza Flexbox para organizar el contenido de forma responsiva.

### libros-style.css
El archivo libros-style.css está diseñado para estilizar una página de libros, combinando efectos visuales y un diseño responsivo. Incluye una sección hero con un carrusel de imágenes de fondo, donde el texto se superpone con un color destacado y sombra para mejorar su visibilidad. Las tarjetas de los productos tienen un efecto 3D: al pasar el cursor sobre ellas, giran para mostrar más información en el reverso. El diseño utiliza Flexbox para organizar fluidamente el contenido y es responsivo, adaptándose bien a dispositivos móviles.

### producto-style.css
Este archivo CSS se encarga de dar estilo a las páginas de productos específicos dentro del sitio web, como un libro. Incluye un diseño responsivo que adapta los elementos de la página a diferentes tamaños de pantalla. El archivo también gestiona los colores, tipografía y espaciado de los textos y botones, y proporciona interactividad a través de transiciones y efectos al pasar el cursor sobre los elementos. Los productos se presentan en una disposición limpia y organizada, con un enfoque en la usabilidad en dispositivos móviles.
