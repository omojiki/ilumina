<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = mysqli_connect("localhost:3307", "daniel", "daniel", "ilumina");
    if (!$conn) {
        die("Falha na conexão: " . mysqli_connect_error());
    }

    $nome = $_POST["name"];
    $email = $_POST["email"];
    $senha = password_hash($_POST["password"], PASSWORD_BCRYPT);

    // SQL para inserir os dados na tabela usuarios
    $sql = "INSERT INTO usuarios (nome, email, senha) VALUES ('$nome', '$email', '$senha')";

    if (mysqli_query($conn, $sql)) {
        echo "Registro bem-sucedido. Bem-vindo, " . $nome . "!";
    } else {
        echo "Erro ao registrar: " . mysqli_error($conn);
    }

    mysqli_close($conn);
}
header("Location: login.html");
?>