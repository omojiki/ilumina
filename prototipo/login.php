<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $senha = $_POST['password'];

    $conexao = new mysqli("localhost:3307", "daniel", "daniel", "ilumina");

    if ($conexao->connect_error) {
        die("Erro na conexão: " . $conexao->connect_error);
    }

    $sql = "SELECT id, email, senha FROM usuarios WHERE email = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        $stmt->bind_result($id, $dbEmail, $dbSenha);
        $stmt->fetch();

        if (password_verify($senha, $dbSenha)) {
            $_SESSION['id'] = $id;
            $_SESSION['email'] = $email;
            header("Location: painel.html");
        } else {
            // Senha incorreta, redirecione com uma mensagem de erro
            header("Location: login.html?erro=Senha incorreta");
        }
    } else {
        // Usuário não encontrado, redirecione com uma mensagem de erro
        header("Location: login.html?erro=Usuário não encontrado");
    }

    $stmt->close();
    $conexao->close();
}
?>