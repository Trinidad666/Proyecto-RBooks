<?php
include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST['email']) || empty($_POST['usuario']) || empty($_POST['password'])) {
        echo "Todos los campos son obligatorios.";
        exit();
    }

    $email = trim($_POST['email']);
    $usuario = trim($_POST['usuario']);
    $password = $_POST['password'];

    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    $sql = "SELECT * FROM Cliente WHERE email = ? OR usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "El correo o el usuario ya están registrados.";
    } else {
        $sql_insert = "INSERT INTO Cliente (usuario, password, email) VALUES (?, ?, ?)";
        $stmt_insert = $conn->prepare($sql_insert);
        $stmt_insert->bind_param("sss", $usuario, $password_hash, $email);

        if ($stmt_insert->execute()) {
            echo "Usuario registrado correctamente.";
            header("Location: index.php");
            exit();
        } else {
            echo "Error al registrar el usuario. Inténtalo más tarde.";
        }
        $stmt_insert->close();
    }

    $stmt->close();
    $conn->close();
}
?>
