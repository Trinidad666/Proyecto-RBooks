<?php
session_start(); // Iniciar sesión

include 'conexion_be.php'; // Incluir archivo de conexión a la base de datos

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Buscar el usuario en la base de datos
    $sql = "SELECT * FROM Cliente WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Si existe el usuario, verificar la contraseña
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['contraseña'])) {
            // Si la contraseña es correcta, iniciar sesión
            $_SESSION['usuario'] = $row['usuario']; // Guardar el nombre de usuario en la sesión
            header("Location: ../php/bienvenidas.php"); // Redirigir a la página de bienvenida
        } else {
            // Si la contraseña es incorrecta
            echo "Contraseña incorrecta.";
        }
    } else {
        // Si el email no existe
        echo "No se encontró un usuario con ese email.";
    }
    $conn->close();
}
?>
