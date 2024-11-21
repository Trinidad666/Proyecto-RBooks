<?php
include 'conexion_be.php'; // Incluir archivo de conexión a la base de datos

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_completo = $_POST['nombre_completo'];
    $email = $_POST['email'];
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    // Encriptar la contraseña antes de almacenarla
    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    // Verificar si el correo o el usuario ya existen en la base de datos
    $sql = "SELECT * FROM Cliente WHERE email = '$email' OR usuario = '$usuario'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Si ya existe un usuario o correo, mostrar un mensaje de error
        echo "El correo o el usuario ya están registrados.";
    } else {
        // Si no existe, insertar el nuevo usuario
        $sql_insert = "INSERT INTO Cliente (usuario, contraseña, email) VALUES ('$usuario', '$password_hash', '$email')";

        if ($conn->query($sql_insert) === TRUE) {
            echo "Usuario registrado correctamente.";
            // Redirigir a la página de login o inicio
            header("Location: ../index.php");
        } else {
            echo "Error: " . $sql_insert . "<br>" . $conn->error;
        }
    }
    $conn->close();
}
?>
