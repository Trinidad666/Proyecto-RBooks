# **php_in-sing.md**


## **cambiar_password.php**
El archivo cambiar_password.php es una página PHP que permite a un usuario cambiar su contraseña. El script valida el correo electrónico y las contraseñas ingresadas, verifica si el correo está registrado en la base de datos, encripta la nueva contraseña y la actualiza en la base de datos. Además, muestra mensajes dinámicos informando sobre el estado de la operación, ya sea éxito, error o advertencia.


## **cerrar_sesion.php**
El archivo cerrar_sesion.php destruye la sesión activa de PHP, cerrando la sesión del usuario. Después de finalizar la sesión, redirige al usuario a la página de inicio de sesión (index.php).


## **composer.json**
El archivo composer.json configura el proyecto PHP, especificando la dependencia phpmailer para el envío de correos electrónicos. También establece el autoloading de clases siguiendo el estándar PSR-4, incluye información sobre el autor del proyecto y asegura que solo se acepten dependencias estables.


## **composer.lock**
El archivo composer.lock garantiza que las dependencias del proyecto se instalen en versiones específicas, como la versión v6.9.3 de phpmailer/phpmailer. Contiene detalles sobre la fuente, requisitos y otros metadatos relacionados con las dependencias, asegurando la consistencia de las instalaciones en diferentes entornos.


## **conexion_be.php**
El archivo conexion_be.php establece una conexión con una base de datos MySQL utilizando mysqli. Define las credenciales de conexión (servidor, usuario, contraseña y nombre de la base de datos) y verifica si la conexión es exitosa, mostrando un mensaje de error en caso contrario.


## **enviar_correo.php**
El archivo enviar_correo.php utiliza la librería PHPMailer para enviar correos electrónicos. Configura un servidor SMTP (en este caso, Gmail) para enviar el correo, incluyendo un asunto y cuerpo en formato HTML, y maneja excepciones en caso de errores durante el proceso de envío.


## **login_usuario_be.php**
El archivo login_usuario_be.php gestiona el proceso de inicio de sesión de un usuario en el sistema. Recibe el correo y la contraseña del formulario, valida si el correo existe en la base de datos y verifica que la contraseña coincida. Si la autenticación es exitosa, establece una sesión con el nombre de usuario y el ID del cliente.


## **olvide-password.php**
El archivo olvide-password.php permite a los usuarios recuperar su contraseña. El formulario recibe uno o varios correos electrónicos, valida si están registrados en la base de datos y, en caso afirmativo, envía un correo de recuperación utilizando PHPMailer. Si no están registrados, muestra un mensaje de advertencia con los correos no encontrados.


## **registro_usuario_be.php**
El archivo registro_usuario_be.php maneja el registro de usuarios. Valida que los campos no estén vacíos, verifica si el correo o el nombre de usuario ya están registrados en la base de datos, y si no es así, encripta la contraseña y guarda los datos del nuevo usuario. Luego, redirige a la página de inicio de sesión si el registro es exitoso.


## **style.css**
El archivo style.css define los estilos de la página web, con un enfoque en una estética moderna y atractiva. Utiliza un fondo con gradiente radial en tonos cálidos, además de una estructura de contenedores centrados, formularios con bordes redondeados y botones que cambian de color al pasar el cursor. El diseño es completamente responsivo, adaptándose a pantallas más pequeñas para una mejor visualización en dispositivos móviles.


## **verificar_correo.php**
El archivo verificar_correo.php toma una lista de correos electrónicos y los verifica contra la base de datos para comprobar si están registrados en la tabla Cliente. Muestra los correos encontrados y los no encontrados. Los correos no registrados se agregan a una lista, que luego se muestra al final.
