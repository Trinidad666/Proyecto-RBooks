<?php
// cerrar_sesion.php

// Iniciar sesión de PHP
session_start();

// Destruir la sesión
session_destroy();

// Redirigir al inicio de sesión
header("Location: index.php");
exit;
?>
