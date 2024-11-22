<?php
session_start();
include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM Cliente WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            $_SESSION['usuario'] = $row['usuario'];
            header("Location: bienvenida.php");
        } else {
            echo "Password incorrecto.";
        }
    } else {
        echo "No se encontró un usuario con ese email.";
    }
    $conn->close();
}
?>
