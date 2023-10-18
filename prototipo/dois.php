<?php
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

// Obtenha os dados do formulário
$localizacao = $_POST["localizacao"];
$descricao = $_POST["descricao"];

// SQL para inserir os dados na tabela denuncia
$sql = "INSERT INTO denuncia (localizacao, descricao) VALUES ('$localizacao', '$descricao')";

if ($conn->query($sql) === TRUE) {
    echo "Denúncia inserida com sucesso.";
} else {
    echo "Erro ao inserir denúncia: " . $conn->error;
}

// Feche a conexão
$conn->close();

header("Location: tres.html");
?>