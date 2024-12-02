# **Documento de RBooks**

Aquí os hablaremos sobre la estructura de archivos de RBooks. Hemos utilizado archivos PHP, CSS y SQL. RBooks ofrece una experiencia interactiva y accesible, permitiendo a los usuarios explorar distintas categorías de productos, administrar su biblioteca personal y realizar compras de manera sencilla. A continuación, se detallan los archivos más importantes del sistema y su función dentro del funcionamiento general del sitio.

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
El código muestra una página web titulada "Biblioteca del Usuario", donde se consultan y presentan en tarjetas los productos (libros, cómics, etc.) del usuario autenticado. Si el usuario no tiene productos en su biblioteca, se muestra un mensaje de error indicando que la biblioteca está vacía.
(No hemos logrado que los productos se guarden en la biblioteca del usuario.)

### comics.php
El código de comics.php genera una página dedicada a los cómics, donde se consultan los productos de tipo cómic almacenados en una base de datos y se presentan en tarjetas interactivas. Al hacer clic en una de las tarjetas, el usuario es redirigido a una página con más detalles sobre el cómic seleccionado.

### estanteria.php
El archivo estanteria.php genera una página web que incluye una barra lateral con enlaces a diversos géneros literarios y un botón para abrir o cerrar esta barra. En el área principal se muestran los productos (libros, cómics, etc.) correspondientes al género seleccionado. Además, cuenta con un encabezado que incluye el menú de navegación y un pie de página. Utiliza JavaScript para cargar dinámicamente los productos según el género elegido, realizando solicitudes a un archivo productos.php mediante fetch para obtener los datos.
(En la lista de la estantería, al seleccionar de un género no está funcionando correctamente.)

### in-sign.php
El archivo in-sign.php gestiona el inicio de sesión y el registro de usuarios, permitiendo que los usuarios ingresen con su correo y contraseña o creen una nueva cuenta. El código incluye validaciones para verificar si el usuario ya está registrado y muestra mensajes de error o éxito según el resultado de las acciones.

### index.php
El archivo index.php es la página principal del sitio web RBooks, que presenta un carrusel de imágenes, un menú de navegación, y una selección de libros y cómics extraídos de una base de datos, los cuales se muestran en tarjetas interactivas. Al hacer clic en una tarjeta, el usuario es redirigido a la página de detalles correspondiente. Además, gestiona las sesiones de usuario, permitiendo tanto el inicio como el cierre de sesión.

### libros.php
El archivo libros.php es una página dentro del sitio web RBooks que muestra una lista de libros extraídos de una base de datos, presentados en tarjetas interactivas, cada una con una imagen y una breve sinopsis. Al hacer clic en una tarjeta, el usuario es redirigido a la página de detalles del libro. También incluye el encabezado y el pie de página comunes al sitio.

### producto.php
El archivo producto.php muestra los detalles de un producto (en este caso, un libro) específico en una página, incluyendo información como el título, género, sinopsis y precio. Los usuarios autenticados con una suscripción activa pueden agregar el producto a su biblioteca. Si el producto no se encuentra o si hay algún error en el proceso, se muestra un mensaje de error. Al igual que otras páginas, incluye el encabezado y el pie de página comunes al sitio.


## php_in-sing.md
### cambiar_password.php
El archivo cambiar_password.php es una página PHP que permite a un usuario cambiar su contraseña. El script valida el correo electrónico y las contraseñas ingresadas, verifica si el correo está registrado en la base de datos, encripta la nueva contraseña y la actualiza en la base de datos. Además, muestra mensajes dinámicos informando sobre el estado de la operación, ya sea éxito, error o advertencia.

### cerrar_sesion.php
El archivo cerrar_sesion.php destruye la sesión activa de PHP, cerrando la sesión del usuario. Después de finalizar la sesión, redirige al usuario a la página de inicio de sesión (index.php).

### composer.json
El archivo composer.json configura el proyecto PHP, especificando la dependencia phpmailer para el envío de correos electrónicos. También establece el autoloading de clases siguiendo el estándar PSR-4, incluye información sobre el autor del proyecto y asegura que solo se acepten dependencias estables.

### composer.lock
El archivo composer.lock garantiza que las dependencias del proyecto se instalen en versiones específicas, como la versión v6.9.3 de phpmailer/phpmailer. Contiene detalles sobre la fuente, requisitos y otros metadatos relacionados con las dependencias, asegurando la consistencia de las instalaciones en diferentes entornos.

### conexion_be.php
El archivo conexion_be.php establece una conexión con una base de datos MySQL utilizando mysqli. Define las credenciales de conexión (servidor, usuario, contraseña y nombre de la base de datos) y verifica si la conexión es exitosa, mostrando un mensaje de error en caso contrario.

### enviar_correo.php
El archivo enviar_correo.php utiliza la librería PHPMailer para enviar correos electrónicos. Configura un servidor SMTP (en este caso, Gmail) para enviar el correo, incluyendo un asunto y cuerpo en formato HTML, y maneja excepciones en caso de errores durante el proceso de envío.

### login_usuario_be.php
El archivo login_usuario_be.php gestiona el proceso de inicio de sesión de un usuario en el sistema. Recibe el correo y la contraseña del formulario, valida si el correo existe en la base de datos y verifica que la contraseña coincida. Si la autenticación es exitosa, establece una sesión con el nombre de usuario y el ID del cliente.

### olvide-password.php
El archivo olvide-password.php permite a los usuarios recuperar su contraseña. El formulario recibe uno o varios correos electrónicos, valida si están registrados en la base de datos y, en caso afirmativo, envía un correo de recuperación utilizando PHPMailer. Si no están registrados, muestra un mensaje de advertencia con los correos no encontrados.

### registro_usuario_be.php
El archivo registro_usuario_be.php maneja el registro de usuarios. Valida que los campos no estén vacíos, verifica si el correo o el nombre de usuario ya están registrados en la base de datos, y si no es así, encripta la contraseña y guarda los datos del nuevo usuario. Luego, redirige a la página de inicio de sesión si el registro es exitoso.

### style.css
El archivo style.css define los estilos de la página web, con un enfoque en una estética moderna y atractiva. Utiliza un fondo con gradiente radial en tonos cálidos, además de una estructura de contenedores centrados, formularios con bordes redondeados y botones que cambian de color al pasar el cursor. El diseño es completamente responsivo, adaptándose a pantallas más pequeñas para una mejor visualización en dispositivos móviles.

### verificar_correo.php
El archivo verificar_correo.php toma una lista de correos electrónicos y los verifica contra la base de datos para comprobar si están registrados en la tabla Cliente. Muestra los correos encontrados y los no encontrados. Los correos no registrados se agregan a una lista, que luego se muestra al final.


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
El archivo libros-style.css está diseñado para estilizar una página de libros, combinando efectos visuales y un diseño responsivo. Incluye una sección hero con un carrusel de imágenes de fondo, donde el texto se superpone con un color destacado y sombra para mejorar su visibilidad. Las tarjetas de los productos tienen un efecto 3D: al pasar el cursor sobre ellas, giran para mostrar más información en el reverso. El diseño utiliza Flexbox para organizar fluidamente el contenido y es responsivo, adaptándose a pantallas más pequeñas ajustando el tamaño de los textos y la disposición de los elementos.

### producto_libros-style.css
El archivo producto_libros-style.css está diseñado para una página de detalles de un producto, probablemente un libro. La sección de detalles utiliza Flexbox para alinear la imagen del producto a la izquierda y la descripción a la derecha en pantallas grandes, mientras que en dispositivos más pequeños se reorganiza en una columna vertical. Los detalles incluyen el título, la descripción y el precio, con énfasis en el precio, que se destaca en color naranja (#FF5722). Además, el archivo incluye un botón de "guardar" con efectos de hover y un estilo específico para mostrar mensajes de error. El diseño es responsivo y se adapta bien a dispositivos móviles ajustando el tamaño de los textos y las imágenes.

### sign-style.css
El archivo sign-style.css crea una interfaz interactiva para el inicio de sesión y el registro de usuarios, con un fondo de imagen fija, efectos de deslizamiento entre los formularios y un diseño moderno con transiciones suaves. Utiliza variables CSS para personalizar colores y tamaños, mejorando la experiencia visual, especialmente en dispositivos con pantallas más pequeñas.


## JS
### header.js# El archivo header.js gestiona la interactividad del encabezado de la página, incluyendo la apertura y cierre de un menú móvil, la activación de un formulario de búsqueda, y la gestión de transiciones durante el redimensionamiento de la ventana. Utiliza eventos como click y resize para agregar o eliminar clases que controlan la visibilidad de elementos, mejorando así la experiencia del usuario en diferentes dispositivos.

### sign-script.js# El archivo sign-script.js se encarga de la interactividad de los formularios de inicio de sesión y registro. Permite alternar entre los formularios de inicio de sesión y registro al hacer clic en los botones correspondientes. Además, previene el envío de los formularios mediante un evento submit que detiene el comportamiento predeterminado, garantizando que las interacciones con los formularios sean controladas adecuadamente.


## RSC
En esta carpeta es donde almacenamos todas las imágenes para la página Web de RBooks. Estas imágenes incluyen las portadas de libros, cómics y audiolibros, así como iconos, logotipos y otros elementos gráficos que contribuyen al diseño y la estética del sitio. La organización de las imágenes en esta carpeta sigue una estructura lógica para facilitar su acceso y gestión.
