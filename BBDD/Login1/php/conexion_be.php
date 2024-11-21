<?php
$servername = "localhost"; // o el servidor que estés utilizando
$username = "root"; // el nombre de usuario de tu base de datos
$password = ""; // la contraseña de tu base de datos
$dbname = "rbooks"; // el nombre de la base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Comprobar la conexión
if ($conn->connect_error) {
    die("La conexión falló: " . $conn->connect_error);
}
?>
