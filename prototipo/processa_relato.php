<?php
session_start();

$servername = "localhost:3307";
$username = "daniel";
$password = "daniel";
$dbname = "ilumina";

// Crie a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifique a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Verifique se o usuário está logado (você pode usar a sessão)
if (isset($_SESSION['id'])) {
    $user_id = $_SESSION['id'];
} else {
    // Redirecione para a página de login ou trate a situação de não estar logado
    header("Location: login.html");
    exit;
}

// Obtenha os dados do formulário
$localizacao = $_POST["localizacao"];
$descricao = $_POST["descricao"];

// SQL para inserir os dados na tabela denuncia com o user_id
$sql = "INSERT INTO denuncia (user_id, localizacao, descricao) VALUES ('$user_id', '$localizacao', '$descricao')";

if ($conn->query($sql) === TRUE) {
    echo "Denúncia inserida com sucesso.";
} else {
    echo "Erro ao inserir denúncia: " . $conn->error;
}

// Feche a conexão
$conn->close();

header("Location: enviado.html");
?>