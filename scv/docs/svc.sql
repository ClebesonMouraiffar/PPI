-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14-Nov-2018 às 00:34
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `svc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `uso`
--

CREATE TABLE IF NOT EXISTS `uso` (
`iduso` int(11) NOT NULL,
  `saida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `retorno` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `idusuario` int(11) NOT NULL,
  `idveiculo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uso`
--

INSERT INTO `uso` (`iduso`, `saida`, `retorno`, `idusuario`, `idveiculo`) VALUES
(1, '2018-11-09 23:53:52', NULL, 1, 3),
(2, '2018-11-09 23:54:18', NULL, 2, 3),
(3, '2018-11-13 02:25:43', NULL, 1, 2),
(4, '2018-11-13 22:53:17', NULL, 1, 3),
(5, '2018-11-13 23:12:10', NULL, 1, 4),
(6, '2018-11-13 23:15:41', NULL, 1, 4),
(7, '2018-11-13 23:15:41', NULL, 1, 4),
(8, '2018-11-13 23:27:13', NULL, 1, 2),
(9, '2018-11-13 23:30:58', NULL, 1, 5),
(10, '2018-11-13 23:31:42', NULL, 3, 5),
(11, '2018-11-13 23:32:05', NULL, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`idusuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `login`, `senha`) VALUES
(1, 'Administrador', 'admin', 'admin'),
(2, 'João', 'joao', 'joao'),
(3, 'Marcelo', 'marcelo', 'marcelo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS `veiculo` (
`idveiculo` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `disponibilidade` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`idveiculo`, `placa`, `descricao`, `disponibilidade`) VALUES
(2, 'ILN-2412', 'Corsa', NULL),
(3, 'IVE-8745', 'Brasília', NULL),
(4, 'BAT-0666', 'Batmovel', NULL),
(5, 'IDP-2000', 'Carro dos Flisntones', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uso`
--
ALTER TABLE `uso`
 ADD PRIMARY KEY (`iduso`), ADD KEY `fk_uso_usuario_idx` (`idusuario`), ADD KEY `fk_uso_veiculo1_idx` (`idveiculo`);

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
MODIFY `iduso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `veiculo`
--
ALTER TABLE `veiculo`
MODIFY `idveiculo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `uso`
--
ALTER TABLE `uso`
ADD CONSTRAINT `fk_uso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_uso_veiculo1` FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
