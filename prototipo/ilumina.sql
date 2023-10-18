-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Tempo de geração: 18/10/2023 às 04:25
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ilumina`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `denuncia`
--

CREATE TABLE `denuncia` (
  `id` int(11) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Solicitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `denuncia`
--

INSERT INTO `denuncia` (`id`, `localizacao`, `descricao`, `user_id`, `status`) VALUES
(1, 'Travessa Linha de Tiro - CEP: 97504-130, Lat: -29.781960, Long: -57.089424', '234', NULL, 'Solicitado'),
(2, 'Travessa Linha de Tiro - CEP: 97504-130, Lat: -29.781960, Long: -57.089424', 'o poste ta piscando rsrs\r\n', NULL, 'Solicitado'),
(3, 'Rua Padre Anchieta - CEP: 97502-680, Lat: -29.773625, Long: -57.081463', '21892982918108', NULL, 'Solicitado'),
(6, 'Rua Domingos de Almeida - CEP: 97502-854, Lat: -29.766901, Long: -57.084746', 'O poste de eletricidade aqui da esquina de casa tá com fio baixo, por favor, solicito manutenção.', NULL, 'Solicitado'),
(7, 'Travessa Cinquenta e Um - CEP: 97504-130, Lat: -29.778281, Long: -57.096301', 'o fio da rua aqui da esquina tá baixo, por favor solicito manutenção.', NULL, 'Solicitado'),
(8, '', '', NULL, 'Solicitado'),
(9, 'Avenida General Flores da Cunha - CEP: 97501-618, Lat: -29.750127, Long: -57.080181', 'ola', NULL, 'Solicitado'),
(10, 'Rua Padre Anchieta - CEP: 97502-680, Lat: -29.773411, Long: -57.073535', 'fio baixo', NULL, 'Solicitado'),
(11, 'Rua Quinze de Novembro - CEP: 97502-784, Lat: -29.770189, Long: -57.087879', '123123', NULL, 'Solicitado'),
(13, 'Rua Coronel Rodrigues Portugal - CEP: 97502-830, Lat: -29.771679, Long: -57.088737', 'OLÁ.', NULL, 'Solicitado'),
(14, 'Rua Coronel Rodrigues Portugal - CEP: 97502-830, Lat: -29.771679, Long: -57.088737', 'OLÁ.', 7, 'Solicitado'),
(15, 'Rua Padre Anchieta - CEP: 97502-680, Lat: -29.773616, Long: -57.081045', '1231232', 7, 'Solicitado'),
(16, 'Avenida Presidente Getulio Vargas - CEP: 97500-300, Lat: -29.759013, Long: -57.082214', '123123123', NULL, 'Solicitado'),
(17, 'Avenida Presidente Getulio Vargas - CEP: 97500-300, Lat: -29.759013, Long: -57.082214', '123123123', NULL, 'Solicitado'),
(18, 'Avenida Presidente Getulio Vargas - CEP: 97500-300, Lat: -29.759013, Long: -57.082214', '123123', NULL, 'Solicitado'),
(19, 'Rua Oito - CEP: 97503-748, Lat: -29.783598, Long: -57.105517', 'eu me remexo muito', 9, 'Solicitado'),
(20, ' - CEP: , Lat: , Long: ', '23423', NULL, 'Solicitado'),
(21, 'Rua Domingos de Almeida - CEP: 97502-854, Lat: -29.768997, Long: -57.084103', '12312312312312dsadqswefd', 7, 'Solicitado'),
(22, ' - CEP: , Lat: , Long: ', '123123', 7, 'Solicitado'),
(23, ' - CEP: , Lat: , Long: ', '123', 7, 'Solicitado'),
(24, ' - CEP: , Lat: , Long: ', '123', 7, 'Solicitado'),
(25, 'Rua 3 - CEP: 97504-130, Lat: -29.780321, Long: -57.089939', '123123', 7, 'Em andamento'),
(26, 'Rua Sete de Setembro - CEP: 97510-250, Lat: -29.758715, Long: -57.081699', 'ola', 10, 'Solicitado'),
(27, 'Rua General Hipólito - CEP: 97502-784, Lat: -29.763781, Long: -57.084446', '123123', 10, 'Solicitado'),
(28, 'Rua Doutor Gregôrio Behregaray Filho - CEP: 97502-784, Lat: -29.766883, Long: -57.084816', 'poste queimou', 11, 'Solicitado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'daniel', 'danieldornelesfac@gmail.com', '$2y$10$FHyQQhlipu4oMOnZ3HmBieyv37tW0fB/13EP7v12DveP9JuCxtyXa'),
(2, 'alice', 'alicewpadao@gmail.com', '$2y$10$YAsvvaCQtWSXeLEQglDcaew0XnlkCBZm3K2qcFBkokGDXEqSzj5P2'),
(3, 'daniel dorneles', 'daniel@gmail.com', '$2y$10$sjwBvz.ZlZxYOOXLG5MXJOFXMFCk5UazFy8vmJxbzekooy92T/bym'),
(4, 'danielzinho', 'manoccara248@gmail.com', '$2y$10$vsEkJn4hgy0I2t/qKfG7leSjZ8rigAmOEGKbp3XUQKzI5CJc2MN0O'),
(7, 'DANIEL', 'opolardosul@gmail.com', '$2y$10$W0p5lQcFUCmkfZO1hsF2kO3QOCILstA/ead4bv6ZLc.r8SZKW5Fly'),
(8, 'paulinho', 'pcfsf@gmail.com', '$2y$10$N3ZuaZKRRVSpZ4ZV7McMl.13fUYqIcQ6vYZqkDlAOgSogb3ezElye'),
(9, 'Daniel Dorneles Façanha', 'danielfacanha@gmail.com', '$2y$10$h1FkTdHiC2uSNs2/r4uSvexJkuEmpwT50lX3DnmBxv3IxzZcb.iQy'),
(10, 'lino', 'linomc@gmail.com', '$2y$10$yIYb.VGnWWJTnAksvG.djumZf8iQJUmUf3f2BhLTool69nMbi.OCS'),
(11, 'Marilei', 'mari@gmail.com', '$2y$10$cTWvxaOtc..JkSiQayRiuuxsDJsE/hIE.5/s2yKMvYUyKSR1vBUZG');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `denuncia_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
