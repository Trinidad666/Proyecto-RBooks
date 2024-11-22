<?php
// olvidar_password.php

// Incluir archivo de conexión
require_once('conexion_be.php');

// Procesar el formulario solo si es un POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $email = trim($_POST['email']);
    $nueva_password = trim($_POST['nueva_contraseña']);
    $nueva_password_confirmar = trim($_POST['nueva_contraseña_confirmar']);

    // Validar que las contraseñas coincidan
    if ($nueva_password !== $nueva_password_confirmar) {
        echo "Las contraseñas no coinciden.";
        exit;
    }

    // Validar formato de correo electrónico
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "El correo electrónico no es válido.";
        exit;
    }

    // Encriptar la nueva contraseña
    $nueva_password_hashed = password_hash($nueva_password, PASSWORD_DEFAULT);

    // Buscar usuario por correo electrónico
    $query = $conn->prepare("SELECT * FROM Cliente WHERE email = ?");
    $query->bind_param("s", $email);
    $query->execute();
    $resultado = $query->get_result();

    // Verificar si el correo está registrado
    if ($resultado->num_rows > 0) {
        // Actualizar la contraseña
        $query_actualizar = $conn->prepare("UPDATE Cliente SET password = ? WHERE email = ?");
        $query_actualizar->bind_param("ss", $nueva_password_hashed, $email);

        if ($query_actualizar->execute()) {
            echo "Contraseña actualizada con éxito.";
        } else {
            echo "Error al actualizar la contraseña.";
        }
    } else {
        echo "El correo no está registrado.";
    }

    // Cerrar conexiones
    $query->close();
    $conn->close();
}
?>





<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        body {
            background-image: radial-gradient(circle, #FF5722, #E64A19, #D84315, #BF360C, #B71C1C);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        .contenedor {
            max-width: 400px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            padding: 10px;
            background-color: #FF5722;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #E64A19;
        }
    </style>
</head>
<body>

<div class="contenedor">
    <h2>Recuperar Contraseña</h2>
    <form action="olvidar_password.php" method="POST">
        <input type="email" placeholder="Email" name="email" required>
        <input type="password" placeholder="Nueva Contraseña" name="nueva_contraseña" required>
        <input type="password" placeholder="Confirmar Contraseña" name="nueva_contraseña_confirmar" required>
        <button type="submit">Actualizar Contraseña</button>
    </form>
</div>

</body>
</html>
