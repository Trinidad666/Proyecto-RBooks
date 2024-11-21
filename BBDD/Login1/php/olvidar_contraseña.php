s<?php
// Conectar a la base de datos
require_once('conexion_be.php'); // Verifica que la ruta sea correcta

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del formulario
    $email = $_POST['email'];
    $nueva_contraseña = $_POST['nueva_contraseña'];
    $nueva_contraseña_confirmar = $_POST['nueva_contraseña_confirmar'];

    // Verificar que las contraseñas coinciden
    if ($nueva_contraseña != $nueva_contraseña_confirmar) {
        echo "Las contraseñas no coinciden.";
    } else {
        // Encriptar la nueva contraseña
        $nueva_contraseña = hash('sha512', $nueva_contraseña);

        // Verificar si el email existe en la base de datos
        $query = "SELECT * FROM usuarios WHERE email = '$email'";
        $resultado = mysqli_query($conexion, $query);

        if (mysqli_num_rows($resultado) > 0) {
            // Actualizar la contraseña en la base de datos
            $query_actualizar = "UPDATE usuarios SET password = '$nueva_contraseña' WHERE email = '$email'";
            if (mysqli_query($conexion, $query_actualizar)) {
                echo "Contraseña actualizada con éxito.";
            } else {
                echo "Error al actualizar la contraseña.";
            }
        } else {
            echo "El correo no está registrado.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assents/css/estilos.css?v=1.0">
</head>
<body>

<main>
    <div class="contendor__todo">
        <div class="caja__trasera">
            <div class="caja__trasera-login">
                <h3>¿Ya tienes una cuenta?</h3>
                <p>Inicia sesión para acceder</p>
                <button id="btn__iniciar-sesion">Iniciar Sesión</button>
            </div>
            <div class="caja__trasera-register">
                <h3>¿Aún No Tienes una Cuenta?</h3>
                <p>Registrarme para Acceder</p>
                <button id="btn__registrarse">Registrarme</button>
            </div>
        </div>

        <!--Formulario para cambiar la contraseña olvidada-->
        <div class="contenedor__login-register">
            <form action="olvidar_contraseña.php" method="POST" class="formulario__login">
                <h2>Recuperar Contraseña</h2>
                <input type="email" placeholder="Email" name="email" required>
                <input type="password" placeholder="Nueva Contraseña" name="nueva_contraseña" required>
                <input type="password" placeholder="Confirmar Contraseña" name="nueva_contraseña_confirmar" required>
                <button type="submit">Actualizar Contraseña</button>
            </form>
        </div>
    </div>
</main>

<script src="assents/js/script.js"></script>

</body>
</html>
