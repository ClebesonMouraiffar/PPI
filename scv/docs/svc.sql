-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Nov-2018 às 05:07
-- Versão do servidor: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `svc`
--
CREATE DATABASE IF NOT EXISTS `svc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `svc`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uso`
--

CREATE TABLE `uso` (
  `iduso` int(11) NOT NULL,
  `saida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `retorno` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `idusuario` int(11) NOT NULL,
  `idveiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uso`
--

INSERT INTO `uso` (`iduso`, `saida`, `retorno`, `idusuario`, `idveiculo`) VALUES
(1, '2018-11-22 01:14:25', '2018-11-22 01:14:25', 1, 3),
(3, '2018-11-22 04:03:12', '2018-11-22 04:03:12', 4, 7),
(4, '2018-11-22 04:03:12', NULL, 5, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `login`, `senha`, `permissao`) VALUES
(1, 'Administrador', 'admin', 'admin', 1),
(4, 'Jessica', 'jessica', 'jessica', 2),
(5, 'Clebeson', 'cleber', 'cleber', 1),
(6, 'Ana', 'ana', 'ana', 2),
(7, 'João', 'joao', 'senha', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `idveiculo` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `disponibilidade` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`idveiculo`, `placa`, `descricao`, `disponibilidade`) VALUES
(2, 'ILN-2412', 'Corsa', NULL),
(3, 'IVE-8745', 'Brasília', NULL),
(4, 'JIR-7845', 'Uno', NULL),
(7, 'hfg-7654', 'Palio', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uso`
--
ALTER TABLE `uso`
  ADD PRIMARY KEY (`iduso`),
  ADD KEY `fk_uso_usuario_idx` (`idusuario`),
  ADD KEY `fk_uso_veiculo1_idx` (`idveiculo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indexes for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`idveiculo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uso`
--
ALTER TABLE `uso`
  MODIFY `iduso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `idveiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `uso`
--
ALTER TABLE `uso`
  ADD CONSTRAINT `fk_uso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_uso_veiculo1` FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
