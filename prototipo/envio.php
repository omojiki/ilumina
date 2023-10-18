<?php
session_start();

// Verifique se o usuário está autenticado (por exemplo, verifique se há um ID de usuário na sessão)
if (!isset($_SESSION['user_id'])) {
    // Se o usuário não estiver autenticado, redirecione para a página de login
    header("Location: login.html");
    exit; // Certifique-se de sair para interromper a execução do código
}
?>