<?php
session_start();

if (!isset($_POST['user_email'])) {
    die("E-mail do usuário não fornecido.");
}

$user_email = $_POST['user_email'];

$servername = "localhost:3307";
$username = "daniel";
$password = "daniel";
$dbname = "ilumina";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conn->connect_error);
}

// Consulta para buscar o user_id do usuário usando o e-mail
$usuario_query = "SELECT id, nome FROM usuarios WHERE email = ?";
$usuario_statement = $conn->prepare($usuario_query);
$usuario_statement->bind_param("s", $user_email);
$usuario_statement->execute();
$usuario_result = $usuario_statement->get_result();
$usuario = $usuario_result->fetch_assoc();

if (!$usuario) {
    echo "Usuário não encontrado.";
    exit;
}

$user_id = $usuario['id'];

// Consulta para buscar as denúncias do usuário com base no user_id
$denuncias_query = "SELECT localizacao, descricao, status FROM denuncia WHERE user_id = ?";
$denuncias_statement = $conn->prepare($denuncias_query);
$denuncias_statement->bind_param("i", $user_id);
$denuncias_statement->execute();
$denuncias_result = $denuncias_statement->get_result();

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Histórico de Denúncias</title>
    <!-- Adicione os arquivos CSS do Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css">
    <!-- Adicione seu arquivo de CSS personalizado -->
    <link rel="stylesheet" href="andamento.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-4">
        Olá <?php echo $usuario['nome']; ?>! <br> Aqui está seu histórico de denúncias</h1>
        <ul>
            <?php while ($row = $denuncias_result->fetch_assoc()): ?>
                <li>
                    <div class="content-box">
                        <strong>Localização:</strong> <?php echo $row["localizacao"]; ?><br>
                        <strong>Descrição:</strong> <?php echo $row["descricao"]; ?> <br>
                        <strong>Status:</strong> <?php echo $row["status"]; ?>
                    </div>
                </li>
            <?php endwhile; ?>
        </ul>
        <a class="btn btn-primary" href="painel.html">Voltar ao Painel Principal</a>
    </div>

    <!-- Adicione os arquivos JavaScript do Bootstrap no final do arquivo para um melhor desempenho -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>