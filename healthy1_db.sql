-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Máquina: localhost:3306
-- Data de Criação: 28-Fev-2017 às 00:21
-- Versão do servidor: 10.0.29-MariaDB
-- versão do PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `healthy1_db`
--
CREATE DATABASE IF NOT EXISTS `healthy1_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `healthy1_db`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `address`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `zipFnumber` varchar(4) NOT NULL,
  `zipSnumber` varchar(3) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipName` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Portugal',
  `type` varchar(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`id`,`id_user`),
  KEY `address_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `age`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `age`;
CREATE TABLE IF NOT EXISTS `age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `age`
--

INSERT INTO `age` (`id`, `name`) VALUES
(1, '18 anos - 40 anos'),
(2, '41 anos - 65 anos'),
(3, '> 65 anos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `card`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Extraindo dados da tabela `card`
--

INSERT INTO `card` (`id`, `idProduct`, `quantity`, `id_user`) VALUES
(16, 3, 2, 23),
(19, 2, 1, 21),
(20, 1, 2, 21),
(21, 0, 2, 21),
(22, 1, 2, 35),
(23, 4, 1, 35),
(35, 1, 2, 24),
(128, 1, 1, 42);

-- --------------------------------------------------------

--
-- Estrutura da tabela `casos_sucesso`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `casos_sucesso`;
CREATE TABLE IF NOT EXISTS `casos_sucesso` (
  `id_caso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `localidade` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `foto_antes` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `foto_depois` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `idade` int(3) NOT NULL,
  `altura` float NOT NULL,
  `peso_anterior` int(11) NOT NULL,
  `peso_actual` int(11) NOT NULL,
  `tempo_decorrido` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tamanho_anterior` int(11) NOT NULL,
  `tamanho_actual` int(11) NOT NULL,
  PRIMARY KEY (`id_caso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `casos_sucesso`
--

INSERT INTO `casos_sucesso` (`id_caso`, `nome`, `localidade`, `foto_antes`, `foto_depois`, `idade`, `altura`, `peso_anterior`, `peso_actual`, `tempo_decorrido`, `tamanho_anterior`, `tamanho_actual`) VALUES
(1, 'Cecília Maria Henriques', 'Caxarias', 'imagens/casosSucesso/cecilia_antes.jpg', 'imagens/casosSucesso/cecilia_depois.png', 38, 1.66, 85, 69, '4 meses', 44, 38),
(2, 'Carlos Manuel Pereira', 'Caxarias', 'imagens/casosSucesso/carlospereira_antes.png', 'imagens/casosSucesso/carlosPereira_Depois.jpg', 35, 1.76, 127, 85, '6 meses', 50, 42);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Emagrecimento'),
(2, 'Celulite'),
(3, 'Controlo de Apetite'),
(4, 'Circulação'),
(5, 'Fígado e Vesícula'),
(6, 'Transito Intestinal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gender`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Feminino'),
(2, 'Masculino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter`
--
-- Criação: 18-Ago-2016 às 15:39
-- Última actualização: 25-Ago-2016 às 11:31
-- Última Verificação: 19-Ago-2016 às 16:53
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `sended` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(1000) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `sended`, `error`, `isActive`) VALUES
(15, 'formigasimoes@hotmail.com', 0, NULL, 1),
(14, 'formigasimoes@hotmail.com', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_order` varchar(20) NOT NULL DEFAULT 'abc',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `billing_address` int(11) NOT NULL,
  `delivery_address` int(11) NOT NULL,
  `nif` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `nameCompany` varchar(250) DEFAULT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `more_info` text,
  `type_payment` int(11) NOT NULL DEFAULT '2',
  `exist_pdf` tinyint(1) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `entity` text,
  `reference` int(20) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_address` (`billing_address`),
  KEY `order_address2` (`delivery_address`),
  KEY `order_user` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=299 ;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `cod_order`, `date`, `billing_address`, `delivery_address`, `nif`, `fname`, `nameCompany`, `lname`, `email`, `id_user`, `more_info`, `type_payment`, `exist_pdf`, `status`, `entity`, `reference`, `amount`) VALUES
(222, 'abc', '2016-08-14 10:32:56', 477, 476, 123456789, 'Joel', NULL, 'simoes', 'geral@healthydiet.pt', 23, 'paga o que deves', 1, 1, 1, NULL, NULL, 0),
(223, 'abc', '2016-08-14 10:33:35', 479, 478, 123456789, 'Joel', NULL, 'simoes', 'geral@healthydiet.pt', 23, 'paga o que deves', 1, 1, 1, NULL, NULL, 0),
(226, 'abc', '2016-08-27 08:48:46', 485, 484, 123456789, 'manel', NULL, 'teste', 'formigasimoes@hotmail.com', 24, '', 2, 1, 1, NULL, NULL, 0),
(227, 'abc', '2016-08-27 10:17:48', 487, 486, 123456789, 'manel', NULL, 'teste', 'formigasimoes@hotmail.com', 24, '', 2, 1, 0, NULL, NULL, 0),
(228, 'abc', '2016-09-11 20:40:38', 489, 488, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(229, 'abc', '2016-09-11 20:50:14', 491, 490, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 1, 1, 0, NULL, NULL, 0),
(230, 'abc', '2016-09-11 21:13:36', 493, 492, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 0, 1, NULL, NULL, 0),
(231, 'abc', '2016-09-12 20:07:11', 495, 494, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(232, 'abc', '2016-09-17 17:08:12', 497, 496, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(233, 'abc', '2016-09-17 17:16:39', 499, 498, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(234, 'abc', '2016-09-17 17:18:50', 501, 500, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(235, 'abc', '2016-09-17 17:19:22', 503, 502, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(236, 'abc', '2016-09-17 17:21:23', 505, 504, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(237, 'abc', '2016-09-17 17:23:03', 507, 506, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(238, 'abc', '2016-09-18 10:55:44', 509, 508, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(239, 'abc', '2016-09-18 10:59:34', 511, 510, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(240, 'abc', '2016-09-18 11:00:01', 513, 512, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(241, 'abc', '2016-09-18 11:13:02', 515, 514, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(242, 'abc', '2016-09-18 11:18:19', 517, 516, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(243, 'abc', '2016-09-18 11:19:35', 519, 518, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(244, 'abc', '2016-09-18 11:20:44', 521, 520, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(245, 'abc', '2016-09-18 11:22:32', 523, 522, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(246, 'abc', '2016-09-18 23:10:31', 525, 524, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(247, 'abc', '2016-09-18 23:13:41', 527, 526, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(248, 'abc', '2016-09-18 23:15:17', 529, 528, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 3, 1, 1, NULL, NULL, 0),
(249, 'abc', '2016-09-18 23:16:35', 531, 530, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(250, 'abc', '2016-09-18 23:18:59', 533, 532, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(251, 'abc', '2016-09-18 23:20:06', 535, 534, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(252, 'abc', '2016-09-18 23:20:56', 537, 536, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(253, 'abc', '2016-09-18 23:22:03', 539, 538, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(254, 'abc', '2016-09-18 23:23:16', 541, 540, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(255, 'abc', '2016-09-18 23:24:33', 543, 542, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(256, 'abc', '2016-09-18 23:28:10', 545, 544, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 0),
(257, 'abc', '2016-09-18 23:28:52', 547, 546, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 21),
(258, 'abc', '2016-09-18 23:32:26', 549, 548, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 21),
(259, 'abc', '2016-09-18 23:34:12', 551, 550, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 17),
(260, 'abc', '2016-09-18 23:40:35', 553, 552, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 34),
(261, 'abc', '2016-09-18 23:42:37', 555, 554, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 37),
(262, 'abc', '2016-09-19 22:35:20', 557, 556, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 1, NULL, NULL, 32),
(263, 'abc', '2016-09-19 23:18:16', 559, 558, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 0, NULL, NULL, 32),
(264, 'abc', '2016-09-24 18:34:54', 563, 562, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 0, NULL, NULL, 80),
(265, 'abc', '2016-09-24 18:39:24', 565, 564, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 0, NULL, NULL, 14),
(266, 'abc', '2016-09-24 18:42:04', 567, 566, 123456789, 'odete', NULL, 'simoes', 'formigasimoes@hotmail.com', 37, '', 2, 1, 0, NULL, NULL, 32),
(267, 'abc', '2016-09-24 18:43:47', 569, 568, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 26),
(268, 'abc', '2016-09-26 22:56:27', 571, 570, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(269, 'abc', '2016-09-26 22:58:21', 573, 572, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(270, 'abc', '2016-09-26 22:59:14', 575, 574, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 33),
(271, 'abc', '2016-09-26 23:02:36', 577, 576, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 12),
(272, 'abc', '2016-09-26 23:05:00', 579, 578, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(273, 'abc', '2016-09-26 23:07:39', 581, 580, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 18),
(274, 'abc', '2016-09-26 23:09:44', 583, 582, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 17),
(275, 'abc', '2016-09-26 23:11:56', 585, 584, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 12),
(276, 'abc', '2016-09-26 23:14:21', 587, 586, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 18),
(277, 'abc', '2016-09-26 23:15:38', 589, 588, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(278, 'abc', '2016-09-28 22:01:18', 591, 590, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 33),
(279, 'abc', '2016-09-28 22:02:13', 593, 592, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 33),
(280, 'abc', '2016-09-28 22:04:32', 595, 594, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 12),
(281, 'abc', '2016-09-28 22:04:54', 597, 596, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 38),
(282, 'abc', '2016-09-28 22:08:46', 599, 598, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 18),
(283, 'abc', '2016-09-28 22:10:37', 601, 600, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(284, 'abc', '2016-09-28 22:13:45', 603, 602, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 25),
(285, 'abc', '2016-09-28 22:14:53', 605, 604, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(286, 'abc', '2016-09-28 22:15:50', 607, 606, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(287, 'abc', '2016-09-28 22:16:58', 609, 608, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 12),
(288, 'abc', '2016-09-28 22:19:36', 611, 610, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 18),
(289, 'abc', '2016-09-28 22:20:23', 613, 612, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 12),
(290, 'abc', '2016-09-28 22:20:58', 615, 614, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(291, 'abc', '2016-09-28 22:21:36', 617, 616, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 14),
(292, 'abc', '2016-09-28 22:23:08', 619, 618, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(293, 'abc', '2016-09-28 22:32:34', 621, 620, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 1, NULL, NULL, 12),
(294, 'abc', '2016-10-02 20:57:21', 623, 622, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 1, 1, 0, NULL, NULL, 26),
(295, 'abc', '2016-10-02 21:03:20', 625, 624, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 12),
(296, 'abc', '2016-10-02 21:06:34', 627, 626, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 12),
(297, 'abc', '2016-10-02 21:07:21', 629, 628, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 18),
(298, 'abc', '2016-10-02 21:11:21', 631, 630, 914561361, 'Odete', 'Associação Trevo da Vida', 'Simões', 'joel.simoes@doitlean.com', 42, '', 2, 1, 0, NULL, NULL, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders_address`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `orders_address`;
CREATE TABLE IF NOT EXISTS `orders_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) NOT NULL,
  `zipFnumber` varchar(4) NOT NULL,
  `zipSnumber` varchar(3) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipName` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Portugal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=632 ;

--
-- Extraindo dados da tabela `orders_address`
--

INSERT INTO `orders_address` (`id`, `address`, `zipFnumber`, `zipSnumber`, `city`, `zipName`, `country`) VALUES
(476, 'rua da escola primária nº88a', '2300', '608', 'valdonas', 'Tomar', 'Portugal'),
(477, 'rua da escola primária nº88a', '2300', '608', 'valdonas', 'Tomar', 'Portugal'),
(478, 'rua da escola primária nº88a', '2300', '608', 'valdonas', 'Tomar', 'Portugal'),
(479, 'rua da escola primária nº88a', '2300', '608', 'valdonas', 'Tomar', 'Portugal'),
(484, 'rua da sobreira nº31', '2435', '001', 'cacinheira', 'ourem', 'Portugal'),
(485, 'rua da escola primária nº88a', '2300', '608', 'valdonas', 'Tomar', 'Portugal'),
(486, 'rua da sobreira nº31', '2435', '001', 'cacinheira', 'ourem', 'Portugal'),
(487, 'rua da escola primária nº88a', '2300', '608', 'valdonas', 'Tomar', 'Portugal'),
(488, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(489, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(490, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(491, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(492, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(493, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(494, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(495, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(496, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(497, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(498, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(499, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(500, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(501, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(502, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(503, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(504, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(505, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(506, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(507, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(508, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(509, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(510, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(511, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(512, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(513, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(514, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(515, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(516, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(517, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(518, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(519, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(520, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(521, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(522, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(523, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(524, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(525, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(526, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(527, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(528, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(529, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(530, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(531, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(532, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(533, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(534, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(535, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(536, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(537, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(538, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(539, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(540, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(541, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(542, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(543, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(544, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(545, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(546, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(547, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(548, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(549, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(550, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(551, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(552, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(553, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(554, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(555, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(556, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(557, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(558, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(559, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(560, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(561, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(562, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(563, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(564, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(565, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(566, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(567, 'rua de caxarias', '2300', '608', 'Ourem', 'caxarias', 'Portugal'),
(568, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(569, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(570, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(571, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(572, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(573, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(574, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(575, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(576, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(577, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(578, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(579, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(580, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(581, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(582, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(583, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(584, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(585, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(586, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(587, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(588, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(589, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(590, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(591, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(592, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(593, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(594, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(595, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(596, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(597, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(598, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(599, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(600, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(601, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(602, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(603, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(604, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(605, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(606, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(607, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(608, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(609, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(610, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(611, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(612, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(613, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(614, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(615, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(616, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(617, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(618, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(619, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(620, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(621, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(622, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(623, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(624, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(625, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(626, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(627, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(628, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(629, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(630, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal'),
(631, 'Rua de Santo António nº100', '1111', '111', 'dsadsa', '1sas', 'Portugal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders_products`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `price` float NOT NULL,
  `brand` varchar(200) NOT NULL DEFAULT '66',
  `quantity` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `iva` int(11) NOT NULL DEFAULT '23',
  PRIMARY KEY (`id`,`id_order`),
  KEY `order` (`id_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=468 ;

--
-- Extraindo dados da tabela `orders_products`
--

INSERT INTO `orders_products` (`id`, `name`, `price`, `brand`, `quantity`, `id_order`, `idProduct`, `iva`) VALUES
(373, 'Vitamina D-3 5000 ui\r\n', 9.99, '66', 1, 222, 1, 23),
(374, 'Açai 3000 mg\r\n', 80, '66', 4, 222, 3, 23),
(375, 'Vitamina D-3 5000 ui\r\n', 9.99, '66', 1, 223, 1, 23),
(376, 'Açai 3000 mg\r\n', 80, '66', 4, 223, 3, 23),
(380, 'Jointflex Trio - 60 comprimidos', 2, '66', 1, 226, 2, 23),
(381, 'Vitamina D-3 5000 ui\r\n', 9.99, '66', 1, 226, 1, 23),
(382, 'Vitamina D-3 5000 ui\r\n', 9.99, '66', 1, 227, 1, 23),
(383, 'Vitamina D-3 5000 ui\r\n', 9.99, '66', 1, 228, 1, 23),
(384, 'Jointflex Trio - 60 comprimidos', 2, '66', 1, 229, 2, 23),
(385, 'sdadf', 2, '66', 1, 230, 8, 23),
(386, 'Jointflex Trio - 60 comprimidos', 2, '66', 1, 231, 2, 23),
(387, 'Natusor 13 - Circusil', 9.99, '66', 2, 232, 1, 23),
(388, 'Naturfiber', 18.22, '66', 1, 233, 2, 23),
(389, 'Abdogras', 29.55, '66', 1, 234, 0, 23),
(390, 'Naturfiber', 18.22, '66', 1, 235, 2, 23),
(391, 'Abdogras', 29.55, '66', 1, 236, 0, 23),
(392, 'Mangolip comp', 15.07, '66', 1, 237, 4, 23),
(393, 'Mangolip comp', 15.07, '66', 1, 238, 4, 23),
(394, 'Mangolip comp', 15.07, '66', 1, 239, 4, 23),
(395, 'Quemavit', 12.85, '66', 1, 240, 3, 23),
(396, 'Abdogras', 29.55, '66', 1, 241, 0, 23),
(397, 'Abdogras', 29.55, '66', 1, 242, 0, 23),
(398, 'Quemavit', 12.85, '66', 1, 243, 3, 23),
(399, 'Mangolip comp', 15.07, '66', 1, 244, 4, 23),
(400, 'Natusor 13 - Circusil', 9.99, '66', 1, 245, 1, 23),
(401, 'Abdogras', 26.59, '66', 1, 246, 0, 23),
(402, 'Natusor 13 - Circusil', 8.99, '66', 1, 246, 1, 23),
(403, 'Naturfiber', 16.4, '66', 1, 246, 2, 23),
(404, 'Natusor 13 - Circusil', 8.99, '66', 1, 247, 1, 23),
(405, 'Naturfiber', 16.4, '66', 1, 247, 2, 23),
(406, 'Abdogras', 26.59, '66', 1, 247, 0, 23),
(407, 'Abdogras', 26.59, '66', 1, 248, 0, 23),
(408, 'Natusor 13 - Circusil', 8.99, '66', 1, 248, 1, 23),
(409, 'Abdogras', 26.59, '66', 1, 249, 0, 23),
(410, 'Abdogras', 26.59, '66', 1, 250, 0, 23),
(411, 'Natusor 13 - Circusil', 8.99, '66', 1, 250, 1, 23),
(412, 'Abdogras', 26.59, '66', 1, 251, 0, 23),
(413, 'Naturfiber', 16.4, '66', 1, 252, 2, 23),
(414, 'Natusor 13 - Circusil', 8.99, '66', 1, 253, 1, 23),
(415, 'Naturfiber', 16.4, '66', 1, 254, 2, 23),
(416, 'Naturfiber', 16.4, '66', 1, 255, 2, 23),
(417, 'Natusor 13 - Circusil', 8.99, '66', 1, 256, 1, 23),
(418, 'Naturfiber', 16.4, '66', 1, 257, 2, 23),
(419, 'Naturfiber', 16.4, '66', 1, 258, 2, 23),
(420, 'Quemavit', 11.57, '66', 1, 259, 3, 23),
(421, 'Naturfiber', 16.4, '66', 1, 260, 2, 23),
(422, 'MI LINEA CHOCOLATE', 12.94, '66', 1, 260, 23, 6),
(423, 'Abdogras', 26.59, '66', 1, 261, 0, 23),
(424, 'Natusor 13 - Circusil', 8.99, '66', 1, 261, 1, 23),
(425, 'ROLITOS DE ARROZ COM CACAU', 0.93, '66', 1, 261, 27, 23),
(426, 'Abdogras', 26.59, '66', 1, 262, 0, 23),
(427, 'Abdogras', 26.59, '66', 1, 263, 0, 23),
(428, 'Abdogras', 26.59, '66', 3, 264, 0, 23),
(429, 'Natusor 13 - Circusil', 8.99, '66', 1, 265, 1, 23),
(430, 'Abdogras', 26.59, '66', 1, 266, 0, 23),
(431, 'Abdogras', 20.68, '66', 1, 267, 0, 23),
(432, 'Abdogras', 20.68, '66', 1, 268, 0, 23),
(433, 'Abdogras', 20.68, '66', 1, 269, 0, 23),
(434, 'Abdogras', 20.68, '66', 1, 270, 0, 23),
(435, 'Natusor 13 - Circusil', 6.99, '66', 1, 270, 1, 23),
(436, 'Natusor 13 - Circusil', 6.99, '66', 1, 271, 1, 23),
(437, 'Abdogras', 20.68, '66', 1, 272, 0, 23),
(438, 'Naturfiber', 12.75, '66', 1, 273, 2, 23),
(439, 'HC Block', 11.79, '66', 1, 274, 5, 23),
(440, 'Natusor 13 - Circusil', 6.99, '66', 1, 275, 1, 23),
(441, 'Naturfiber', 12.75, '66', 1, 276, 2, 23),
(442, 'Abdogras', 20.68, '66', 1, 277, 0, 23),
(443, 'Abdogras', 20.68, '66', 1, 278, 0, 23),
(444, 'Natusor 13 - Circusil', 6.99, '66', 1, 278, 1, 23),
(445, 'Natusor 13 - Circusil', 6.99, '66', 1, 279, 1, 23),
(446, 'Abdogras', 20.68, '66', 1, 279, 0, 23),
(447, 'Natusor 13 - Circusil', 6.99, '66', 1, 280, 1, 23),
(448, 'Abdogras', 20.68, '66', 1, 281, 0, 23),
(449, 'Naturfiber', 12.75, '66', 1, 281, 2, 23),
(450, 'Naturfiber', 12.75, '66', 1, 282, 2, 23),
(451, 'Abdogras', 20.68, '66', 1, 283, 0, 23),
(452, 'Natusor 13 - Circusil', 6.99, '66', 1, 284, 1, 23),
(453, 'Naturfiber', 12.75, '66', 1, 284, 2, 23),
(454, 'Abdogras', 20.68, '66', 1, 285, 0, 23),
(455, 'Abdogras', 20.68, '66', 1, 286, 0, 23),
(456, 'Natusor 13 - Circusil', 6.99, '66', 1, 287, 1, 23),
(457, 'Naturfiber', 12.75, '66', 1, 288, 2, 23),
(458, 'Natusor 13 - Circusil', 6.99, '66', 1, 289, 1, 23),
(459, 'Abdogras', 20.68, '66', 1, 290, 0, 23),
(460, 'Quemavit', 9, '66', 1, 291, 3, 23),
(461, 'Abdogras', 20.68, '66', 1, 292, 0, 23),
(462, 'Natusor 13 - Circusil', 6.99, '66', 1, 293, 1, 23),
(463, 'Abdogras', 20.68, '66', 1, 294, 0, 23),
(464, 'Natusor 13 - Circusil', 6.99, '66', 1, 295, 1, 23),
(465, 'Natusor 13 - Circusil', 6.99, '66', 1, 296, 1, 23),
(466, 'Naturfiber', 12.75, '66', 1, 297, 2, 23),
(467, 'Naturfiber', 12.75, '66', 1, 298, 2, 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pathologies`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `pathologies`;
CREATE TABLE IF NOT EXISTS `pathologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(350) CHARACTER SET utf16 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `pathologies`
--

INSERT INTO `pathologies` (`id`, `name`) VALUES
(1, 'Hipertensão'),
(2, 'Colesterol'),
(3, 'Diabetes'),
(4, 'Problemas de Tiroide');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(1500) NOT NULL DEFAULT '',
  `summary` varchar(500) NOT NULL DEFAULT '',
  `price` float NOT NULL,
  `brand` varchar(200) NOT NULL DEFAULT '',
  `stock` int(11) NOT NULL DEFAULT '1',
  `ingredients` varchar(1000) NOT NULL DEFAULT '',
  `others` varchar(1000) NOT NULL DEFAULT '',
  `isActive` tinyint(1) DEFAULT '1',
  `productCod` varchar(1000) DEFAULT ' ',
  `keywords` varchar(1000) DEFAULT '',
  `smallDescription` varchar(1000) DEFAULT '',
  `iva` int(11) NOT NULL DEFAULT '23',
  `salePublic` int(11) NOT NULL DEFAULT '0',
  `saleRetailer` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `summary`, `price`, `brand`, `stock`, `ingredients`, `others`, `isActive`, `productCod`, `keywords`, `smallDescription`, `iva`, `salePublic`, `saleRetailer`) VALUES
(0, 'Abdogras', '28 COMPRIMIDOS', 'Elaborado à base de extractos de plantas medicinais (melissa, amoreira e absinto). Actua sobre o metabolismo e mobilização da gordura abdominal, ajudando a reducir a sua acumulação e localização e exerce um efeito favorável que lhe permite melhorar a silhueta.', 29.55, 'Sória Natural', 7, 'Concentrado de Melissa officinalis L; Morus alba L e Artemisia capillaris Thunb; excipientes celulose microcristaina, acdisol, estearato de magnésio.', '', 1, 'SN06090', ' ', ' ', 23, 10, 30),
(1, 'Natusor 13 - Circusil', 'Lata de 90 gr\n\n', 'As misturas de plantas (dessecadas e trituradas) utilizadas como tisanas são um dos mais antigos procedimentos utilizados pelo homem para a saúde. Toda a gama de Natusores e Infusões foi submetida aos mais rigoroso testes.', 9.99, 'Sória Natural ', 2, 'Cipreste (Cupressus sempervirens L.), cones....... 45 %\n\n*Nogueira (Juglans regia L.), folhas...................... 45 %\n\n*Milefólio (Achillea millefolium L.), sumidade floral....... 10 %\n\n* Planta procedente de Cultivos Limpos nos quais não foram utilizados adubos inorgânicos, herbicidas nem pesticidas.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(2, 'Naturfiber', '20 Saquetas 20gr.', 'Naturfiber deve dissolver-se em líquido abundante e nunca ingerir-se em seco e beber água depois (provocará um grande inchaço em contacto com água). Aconselha-se tomar entre as refeições ou antes das refeições, dispersando o conteúdo da saqueta num copo com água (200 mL) e ingerir rapidamente.', 18.22, 'Sória Natural ', 2, 'Glucomanano, goma guar, edulcorante: acesulfame K, aroma de laranja, excipientes.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(3, 'Quemavit', '24 comp.', 'Comprimidos recobertos que actuam de um modo favorável no metabolismo, mobilização e combustão da gordura.', 12.85, 'sória Natural', 7, 'Edulcorante-xilitol, Levedura de cerveja (rica en vit B12), L-Tirosina, L-Carnitina, Cafeína, Sulfato de zinco, estabilizadores: Celulose microcristalina e Acdisol, sal magnésico de ác gordos: Estearato de magnésio, Tricloreto de crómio, Ioduro potássico.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(4, 'Mangolip comp', 'Mangolip ajuda a controlar o apetite. Com extracto de sementes de Manga Africana. Actua sobre o metabolismo das gorduras.', '28 comprimidos', 15.07, 'Sória Natural', 1, ' Estabilizador; amido de arroz, celulose, acdisol; extracto de sementes de manga africana (IGOB 131) (150 mg/comprimido), sal magnésico de ác gordos: estearato de magnésio, tricloreto de crómio.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(5, 'HC Block', 'Alto conteúdo em Fibra. Com concentrado de feijão branco (Phaseolus vulgaris L), actua sobre os hidratos de carbono, exercendo um efeito favorável no bloqueio da sua absorção.', '24 comprimidos', 16.84, 'Sória Natural', 1, 'Concentrado de Phaseolus vulgaris L, estabilizador: celulose microcristalina, acdisol, sal magnésico de ác gordos: estearato de magnésio.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(6, 'Edulcosor 30ml', 'Edulcorante líquido de reduzido aporte energético, que pela sua fácil e cómoda dosificação, é ideal para juntar directamente a bebidas frias, quentes, sobremesas, etc. Ideal para aquelas pessoas que não podem ou não desejem ingerir açúcares.', 'Gotas 30ml', 1.54, 'Sória Natural', 1, 'Água glicerinada, edulcorantes: cliclamato sódico (E-952), sacarina sódica (E-954), conservante: sorbato de potássio (E-202).', '', 1, ' ', ' ', ' ', 23, 10, 15),
(7, 'CELULIMP COMP.', 'Exerce um efeito favorável sobre o metabolismo e combustão da gordura corporal e melhora a silhueta.  ', '28 COMPRIMIDOS', 11.18, 'SÓRIA NATURAL', 1, ' Suco desidratado da pele e sementes de uvas pretas, cetonas de framboesa (100 mg/comprimido), extracto concentrado de rusco, extracto concentrado de salsaparrilha, extracto concentrado de cavalinha, vitamina B6, tricloreto de crómio, vitamina B12, estabilizador: celulose e acdisol, anti-aglomerante: dióxido de silício e estearato de magnésio, bioperina. ', '', 1, ' ', ' ', ' ', 23, 10, 30),
(8, 'CAPTALIP COMPRIMIDOS', 'Captalip ajuda a interferir na absorção das gorduras, contribuindo para melhorar a silhueta.', '28 COMPRIMIDOS', 9.78, 'SÓRIA NATURAL', 1, 'Aconselha-se tomar 2 comprimidos, 15 ou 20 minutos depois do almoço e do jantar com um copo de água.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(9, 'COFIDREN', 'Favorece a eliminação e drenagem renal. ', '14 ampolas de 15 mL. \r\n\r\n', 19.37, 'SÓRIA NATURAL', 1, 'Cápsula: Extracto seco descafeinado de café verde enriquecido em ácido clorogénico. \r\n\r\nAmpola: Água, edulcorante: sorbitol, concentrado de cerejas, extracto de bagas de zimbro, extracto de urtiga verde, extracto de vara de ouro, extracto de pés de cerejas, extracto de dente de leão, concentrado de ananás, concentrado de groselhas, aroma natural de frutos do bosque, conservante: sorbato potássico. ', '', 1, ' ', ' ', ' ', 23, 10, 30),
(10, 'DURILIMP durilimp', 'Favorece a eliminação e drenagem renal. Com procianidinas oligoméricas (100 mg/100mL) de grande capacidade antioxidante. ', 'FRASCO 500ML', 10.3, 'SÓRIA NATURAL', 1, ' Agua, humectante: glicerina, edulcorante: sorbitol, aroma de mangostán, uva (Vitis vinifera L), alcachofa (Cynara scolymus L), regulador de acidez: ácido cítrico, diente de león (Taraxacum officinale F.H. Wigg), tila (Tilia platyphyllos Scop), abedul (Betula alba L), manzanilla amarga (Anthemis nobilis L), edulcorante: sucralosa, concentrado de arándano (Vaccinium myrtillus L) y grosellero (Ribes nigrum L), conservante: sorbato potásico. \r\n', '', 1, ' ', ' ', ' ', 23, 10, 30),
(11, 'HEMOCIN', 'Unguento produzido à base de cera virgen e espécies vegetais.', 'BISNAGA 40ML', 7.52, 'SÓRIA NATURAL ', 1, ' Óleo de girassol, Cera virgem, Água, Propylene Glycol, Glycerin, BHT, extractos e óleos essenciais de plantas (Llanten maior, Mil-em-rama, Benjuí (Styrax benzoin), Mentha Arvensis) e Própolis, Ascorbyl palmitate, Citric Acid, Glyceryl Distearate, Glyceryl Stearate.', ' Deve aplicar-se várias vezes ao dia. No caso de hemorróidas, recomenda-se fazer banhos de assento com água fria, durante 10 minutos. Secar muito bem a zona e posteriormente aplicar HEMOCIN.', 1, ' ', ' ', ' ', 23, 5, 10),
(12, 'DERMOTEN', 'Unguento elaborado à base de cera virgem e espécies vegetais.', 'BISNAGA 40ML', 7.52, 'SÓRIA NATURAL', 1, 'Helianthus annuus, Cera alba, Styrax benzoin, Aqua, Parfum, Propylene Glycol, Glycerin, Propolis cera, Calendula officinalis, BHT, Plantago major, Achillea millefolium, Ascorbyl palmitate, Glyceryl Distearate, Glyceryl Stearate, Citric acid. ', 'Aplicar várias vezes ao dia, localmente, com uma suave massagem para facilitar a sua penetração. Não tem efeitos secundários salvo casos muito excepcionais de resposta alérgica, que termina ao suspender o tratamento.', 1, ' ', ' ', ' ', 23, 5, 10),
(13, 'OLITAN', 'Unguento natural para massajar zonas doridas.', 'BISNAGA 40ML', 7.52, 'SÓRIA NATURAL', 1, 'Água, Lanolina, Cera virgem, Óleo de girassol, Amido de arroz, Álcool, extractos e óleos essenciais de plantas (Harpago, Arnica, Alecrim, Sabugueiro, Cânfora, Alfa pineno e Mentol), Sesquioleato de sorbitano e Lecitina, Propylene Glycol, BHT, Ascorbyl palmitate, Glyceryl Stearate, Citric Acid, e Glyceryl Distearate. ', ' Aplicar em forma de massagem durante 5 a 8 minutos, 2 ou 3 vezes ao dia. Depois da sua aplicação, pode-se cobrir com um pano grosso de algodão, que se deberá mante durante uma hora, não sendo inconveniente prolongar este tempo.', 1, ' ', ' ', ' ', 23, 5, 10),
(14, 'GUALAVIT', 'Unguento produzido à base de cera virgem e espécies vegetais.', 'BISNAGA 40ML', 7.52, 'SÓRIA NATURAL', 1, 'Glicerina, Água, Cera virgem, Óleo de girassol, Amidon de arroz, Sesquioleato de sorbitano, Propylene Glycol, Parfum, BHT,  Extractos e óleos essenciais de plantas (Llanten maior, Calêdula, Mil-em-rama, Benjui e Visnaga) e Própolis, Ascorbyl palmitate, Citric Acid, Glyceryl Distearate, Glyceryl Stearate', 'Aplicar várias vezes ao dia, localmente, com uma suave massagem para facilitar a sua penetração.', 1, ' ', ' ', ' ', 23, 5, 10),
(15, 'CÁPSULAS DE LIBERTAÇÃO PROLONGADA 13-S', '30 CÁPSULAS ', 'DAMIANA (TURNERA DIFUSA WILLD)', 14.3, 'SÓRIA NATURAL', 1, 'EXTRACTO LIOFILIZADO DE DAMIANA (TURNERA DIFUSA WILD)(300MG); ESTABILIZADOR; CELULOSA MICROCRISTALINA, AGENTE DE COBERTURA: COPOLÍMETRO NEUTRO, CÁPSULA (HIDROXIPROPILMETILCELULOSA).', '', 1, ' ', ' ', ' ', 23, 10, 30),
(16, '34 -S VALERIANA CÁPSULA LIBERTAÇÃO PROLONGADA', 'VALERIANA ', '30 CÁPSULAS 600mg', 9.69, 'SÓRIA NATURAL ', 1, 'EXTRACTO LIOFILIZADO DE VALERIANA, a-CICLODEXTRINAAGENTE DE COBERTURA;COPOLÍMERO NEUTRO.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(17, 'PASSIFLORA COMPRIMIDOS ', 'PASSIFLORA', '60 COMPRIMIDOS', 7.5, 'SÓRIA NATURAL', 1, ' Passiflora incarnata L. estabilizador: celulose microcristalina, sal magnésico de ác gordos: estearato de magnésio.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(18, 'FLATUSOR ', '17-C FLATUSOR PIMPINELA COMPLEX CÁPSULAS', '60 CÁPSULAS', 9.69, 'SÓRIA NATURAL', 1, 'Funcho (Foeniculum vulgare Mill), sementes....... 62,5 mg\r\nAnis verde (Pimpinella anisum L), sementes....... 62,5 mg\r\n*Angélica (Angelica archangelica L), raiz....... 62,5 mg\r\n*Melissa (Melisa officinalis L), parte aérea....... 62,5 mg\r\nÓleo essencial......................................15 mg; (2,5 mg / cápsula)', '', 1, ' ', ' ', ' ', 23, 10, 30),
(19, 'SEDANER CÁPSULAS ', '29-C SEDANER VALERIANA COMPLEX CÁPSULAS', '60 CÁPSULAS', 10.72, 'SÓRIA NATURAL ', 1, 'aleriana (Valeriana officinalis L), raiz.......... 100 mg\r\nPassiflora (Passiflora incarnata L), parte aérea... 100 mg\r\nEspinheiro-alvar (Crataegus oxyacantha L), folhas e flores..... 100 mg\r\n*Lavanda (Lavandula spica D.C), sumidade floral...... 50 mg\r\nFlavonóides (ácido clorogénico, ácido cafeico, vitexina ).................10, 5 mg; (1,75 mg / cápsula).\r\nÓleo essencial.......................................2,1 mg; (0,35 mg / cápsula)\r\nÁcido valerénico...................................0,42 mg; (0,07 mg / cápsula)\r\nHarmano................................................0,24 mg; (0,04 mg / cápsula)', '', 1, ' ', ' ', ' ', 23, 10, 30),
(20, 'BOLACHAS INTEGRAIS DE SÉSAMO', 'Sem colesterol (0%). Crocante. Efeito favorável sobre o colesterol. Com fructose e gordura vegetal (girassol). Alto conteúdo em fibra (7%). Sem conservantes nem corantes. Produzido com farinha integral de trigo procedente de cultivos limpos, inulina e sésamo.', 'PACOTE DE 165g', 2.23, 'SÓRIA NATURAL', 1, ' Farinha integral de trigo, fructose, gordura vegetal (girassol), inulina, sésamo (5,5%), gaseificante (bicarbonato sódico e amónico), sal marinho e aromas naturais.', '', 1, ' ', ' ', ' ', 23, 5, 10),
(21, 'BOLACHAS INTEGRAIS RICAS EM FIBRA ', 'Sem colesterol (0%). Crocante. Efeito favorável sobre o colesterol. Com fructose e gordura vegetal (girassol). Alto conteúdo em fibra (7%). Sem conservantes nem corantes. Produzido com farinha integral de trigo procedente de cultivos limpos e inulina.', 'EMBALAGEM 165g', 2.23, 'SÓRIA NATURAL', 1, ' Farinha integral de trigo, fructose, gordura vegetal (girassol), inulina, farelo de trigo, gaseificante (bicarbonato sódico e amónico), sal marinho e aromas naturais.', '', 1, ' ', ' ', ' ', 23, 5, 10),
(22, 'MI LINEA BAUNILHA', 'Substituto de uma refeição para controlo do peso. Produto recomendado em dietas de baixo valor energético para controlo e redução de peso. Ajuda a diminuir a sensação de fome e a aumentar a sensação de saciedade. Alto conteúdo de proteínas.', '6 SAQUETAS DE 50g', 14.38, 'SÓRIA NATURAL', 1, ' Proteínas de leite, maltodextrina, leite em pó, amido, óleo vegetal, minerais (citrato de potássio, cloruro de sódio, carbonato de magnésio, pirofosfato de ferro, gluconato de zinco, gluconato de cobre, sulfato de manganês, ioduro de potássio, selenito sódico), carragena, aromas, emulgente (lecitina), edulcorantes (ciclamato sódico, sacarina sódica, sucralose), vitaminas (C, E, niacina, A, pantotenato cálcico, D3, B6, B2, B1, ácido fólico, biotina).', ' Dissolver uma saqueta em 200 ml de água fria, agitando vigorosamente até obter uma preparação homogénea. Deixar em repouso 2 minutos, preferencialmente no frigorífico. Aconselha-se manter uma adequada ingestão diária de líquidos.', 1, ' ', ' ', ' ', 23, 10, 30),
(23, 'MI LINEA CHOCOLATE', 'Substituto de uma refeição para controlo do peso. Produto recomendado em dietas de baixo valor energético para controlo e redução de peso. Alto conteúdo de proteínas. Com edulcorante.', '6 SAQUETAS DE 50g', 14.38, 'SÓRIA NATURAL', 1, ' Proteínas de leite, maltodextrina de milho, leite em pó, amido, cacau (10%), óleo vegetal, minerais (citrato de potássio, cloruro de sódio, carbonato de magnésio, pirofosfato de ferro, gluconato de zinco, gluconato de cobre, sulfato de manganês, ioduro de potássio, selenito sódico), espessante (carragena), emulgente (lecitina), aromas, edulcorantes (ciclamato sódico, sacarina sódica, sucralose), vitaminas (C, E, niacina, A, pantotenato cálcico, D3, B6, B2, B1, ácido fólico, biotina).', ' Dissolver uma saqueta em 200 ml de água fria, agitando vigorosamente até obter uma preparação homogénea. Deixar em repouso 2 minutos preferencialmente no frigorífico. Aconselha-se manter uma adequada ingestão diária de líquidos.', 1, ' ', ' ', ' ', 6, 10, 30),
(24, 'MI LINEA MORANGO', 'Substituto de uma refeição para controlo do peso. Produto recomendado em dietas de baixo valor energético para controlo e redução de peso. Alto conteúdo de proteínas. Com edulcorante.', '6 SAQUETAS DE 50g', 14.38, 'SÓRIA NATURAL', 1, ' Proteínas de leite, maltodextrina de milho, leite em pó, amido, óleo vegetal, minerais (citrato de potássio, cloruro de sódio, carbonato de magnésio, pirofosfato de ferro, gluconato de zinco, gluconato de cobre, sulfato de manganês, ioduro de potássio, selenito sódico), aromas, espessante (carragena), corante (vermelho de beterraba), emulgente (lecitina), edulcorantes (ciclamato sódico, sacarina sódica, sucralose), vitaminas (C, E, niacina, A, pantotenato cálcico, D3, B6, B2, B1, ácido fólico, biotina).', ' Dissolver uma saqueta em 200 ml de água fria, agitando vigorosamente até obter uma preparação homogénea. Deixar em repouso 2 minutos, preferencialmente no frigorífico. Aconselha-se manter uma adequada ingestão diária de líquidos.', 1, ' ', ' ', ' ', 6, 10, 30),
(25, 'ESPIRAIS DE ARROZ DE 3 CORES ', 'Produzidas com farinha de arroz integral (Oryza sativa L.), seguindo métodos tradicionais. É BIO, sem glúten, sem ovo. Baixo conteúdo em gordura. Muito baixo conteúdo em sal. Fonte de fibra.', 'PACOTE DE 250g', 2.8, 'SÓRIA NATURAL', 1, 'farinha de arroz* integral (83%), espinafres (15%), espessante: goma xantana.', '', 1, ' ', ' ', ' ', 6, 5, 10),
(26, 'DRENALIMP', 'Favorece a eliminação e drenagem renal.', 'FRASCO 250ML', 12.85, 'SÓRIA NATURAL', 1, 'Infusão concentrada de alcachofra (Cynara scolymus L.), dente de leão (Taraxacum gr. officinale), melissa (Melissa officinalis L.) e camomila amarga (Anthemis nobilis L.); edulcorante: sorbitol, aroma de laranja, regulador de acidez: ácido cítrico, conservante: Sorbato potássico.', '', 1, ' ', ' ', ' ', 23, 10, 30),
(27, 'ROLITOS DE ARROZ COM CACAU', 'Sem Glúten. \r\n\r\nCrocantes snacks de arroz extrudido de muito fácil digestão.\r\n\r\nPerfeitos para tomar a qualquer hora.', 'EMBALAGEM DE 3 ROLITOS COM 24g', 0.98, 'SÓRIA NATURAL', 1, 'Farinha de arroz* integral (56%), creme* de cacau e avelãs (44 %).\r\n\r\n* Procedente de Agricultura Biológica.', '', 1, ' ', ' ', ' ', 23, 5, 10),
(28, 'MASSA ESPIRAL INTEGRAL DE ESPELTA', 'Produzida com farinha integral de espelta primitiva (100%) ou espelta (Triticum monococcum L.). Baixo conteúdo em gordura (0% colesterol). Muito baixo', 'EMBALAGEM DE 250g', 2.08, 'SÓRIA NATURAL', 1, ' Farinha integral de espelta*(primitiva).\r\n\r\n* Procedente de Agricultura Biológica.', '', 1, ' ', ' ', ' ', 23, 5, 10),
(29, 'FLORES INTEGRAIS DE ESPELTA COM ALCACHOFRA', 'Produzidas com farinha integral de espelta primitiva (100%) ou espelta (Triticum monococcum L.). Baixo conteúdo em gordura. 0% colesterol. Muito baixo conteúdo em sódio. Alto conteúdo em fibra. Alimento de Baixo Índice Glicémico. Não contém conservantes, corantes nem aditivos.', 'EMBALAGEM 250g', 2.08, 'SÓRIA NATURAL', 1, ' Farinha integral de espelta* (primitiva), Alcachofra* desidratada (mínimo 2,5 %).\r\n\r\n* Procedente de Agricultura Biológica.', '', 1, ' ', ' ', ' ', 23, 5, 10),
(30, 'ABAFINE CREME', 'SUAVIZA E AMACIA A PELE M EVITANDO O DESCONFORTO PROVOCADO POR FACTORES EXTERNOS PRESENTES EM SITUAÇÕES TAIS COMO: \r\nQUEIMADURAS SOLARES, QUEIMADURAS DOMÉSTICAS E PICADAS DE INSECTOS.\r\n', 'BISNAGA DE CREME DE 100ml', 9.1, 'BIOCEUTICA', 1, 'AQUA, GLYCERIN, PROPYLENE GLYCOL,PRUNUS AMYGDALUS DULCIS OIL, PERSEA GRATISSIMA OIL, PARAFFINUM LIQUIDUM, POLYSORBATE 80, PETROLATUM, CARBOMER, PARFUM, PHENOXYETOL, METHYLPARABEN, BUTYLPARABEN, ETHYLPARABEN, MPROPYLPARABEN, TRIETHANOLAMINE, SORBIC ACID.', 'ESPALHAR SUAVEMENTE O CREME SOB A ZONA DESEJADA, DEIXANDO FICAR UMA CAMADA DE CREME SOB A PELE. APLIQUE SEPRE QUE NECESSÁRIO ATÉ 4 VEZES POR DIA.', 1, ' ', ' ', ' ', 23, 10, 30),
(31, 'VARI-PLEX FUSIONPACK', 'CIRCULAÇÃO. VARI-PLEX FUSIONPACK CONTÉM VITAMINA C QUE CONTRIBUI PARA A NORMAL FORMAÇÃO DE COLAGÉNIO PARA FUNCIONAMENTO NORMAL DOS VASOS SANGUÍNEOS.', '20 AMPOLAS+20 CÁPSULAS ', 27.04, 'BIOCEUTICA', 1, 'VIDEIRA VERMELHA, EXTRATO DE MALTE, VITAMINA C, RUTINA, HESPERIDINA, EXTRATO CONCENTRADO DE CASTANHA DA INDIA, EXTRATO CONCENTRADO DE GINKO BILOBA, QUERCITINA E VITAMINA E.', '', 1, ' ', ' ', ' ', 23, 15, 35),
(32, 'HEPATINE ', 'TISANA DE PLANTAS NATURAIS', 'EMBALAGEM DE 100gr', 4.9, 'BIOCEUTICA', 1, 'MENTA(FOLHAS), AGRIMÓNIA(OLANTA), GRANZA(RAIZ), BOLDO (FOLHAS), LARANJEIRA, SENE (FOLHAS)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(33, 'NERVOTRANQUIL', 'TISANA DE PLANTAS NATURAIS ', 'EMBALAGEM 100gr', 4.9, 'BIOCEUTICA', 1, 'ESPINHEIRO ALVAR (SUMIDADES), OLIVEIRA(FOLHA), PASSIFLORA (PLANTA), LARANJEIRA(FLOR), CHICÓRIA(PLANTA), VALERIANA(RAIZ)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(34, 'RENAVICOL TISANA', 'TISANA DE PLANTAS NATURAIS', 'EMBALAGEM DE 100gr', 4.9, 'BIOCEUTICA', 1, 'CAVALINHA(PLANTA), GRAMA(RAIZ), HIPERICÃO KNEIP(PLANTA), FREIXO(FOLHAS)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(35, 'DIATECOL TISANA', 'TISANA DE PLANTAS NATURAIS', 'EMBALAGEM 100gr', 4.9, 'BIOCEUTICA', 1, 'CARQUEJA (FLOR), FEL DA TERRA (PLANTA), CAJUEIRO (CASCA), ESTRELAS DO EGIPTO (FLOR), FEIJOEIRO(PLANTA), EUCALIPTO(FOLHAS)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(36, 'DIGESTOL', 'DIGESTOL TISANA DE PLANTAS NATURAIS', 'EMBALAGEM DE 100gr', 4.9, 'BIOCEUTICA', 1, 'ERVA PRINCIPE (PLANTA), CHICÓRIA (PLANTA), LÚCIA-LIMA (PLANTA), CIDREIRA (PLANTA) ANIS ESTRELADO(FRUTOS), HORTELÃ-PIMENTA (PLANTA)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(37, 'DEPURCOL', 'DEPURCOL TISANA DE PLANTAS NATURAIS', 'EMBALAGEM DE 100gr', 4.9, 'BIOCEUTICA', 1, 'SARGACINHA(PLANTA) CHICÓRIA (PLANTA) UTRIGA MAIOR (PLANTA) BARDANA (RAIZ) SENE (FOLHAS) SABUGUEIRO (FLOR)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(38, 'UREIOL-REUMOL', 'TISANA DE PLANTAS NATURAIS', 'EMBALAGEM DE 100gr', 4.9, 'BIOCEUTICA', 1, 'FRAGARIA (FOLHAS) FREIXO (FOLHAS) SALGUEIRO (CASCA)URTIGA BRANCA (PLANTA) BÉTULA (FOLHAS) CAVALINHA (PLANTA)CEREJA (PEDÚNCULOS)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(39, 'QUEBRA-PEDRAS', 'TISANA DE PLANTAS NATURAIS', 'EMBALAGEM DE 100gr', 4.9, 'BIOCEUTICA', 1, 'CAVALINHA(PLANTA) ERIGERÃO (PLANTA) GRAMA (RAIZ) QUEBRA-PEDRA (PLANTA) HIPEICÃO KNEIP (PLANTA)', '', 1, ' ', ' ', ' ', 6, 10, 20),
(40, 'EMAGRESS RASPBERRY KETONE', 'Acção queima-gorduras\r\nNatural controlo dos açúcares\r\nSuper-protecção antioxidante\r\nEfeito ultra-adelgaçante\r\nRegulador da glicose no organismo e do catabolismo dos ácidos gordos', 'FRASCO 500ml', 15, 'BIOCEUTICA', 1, 'ÁGUA PURIFICADA; AROMA; EXTRACTO SECO DE RASPBERRY; ILEX PARAGUARIENSIS; MATE (FOLHAS); SOLANUM MELONGENA; BERINGELA (FRUTO); CENTELHA ASIÁTICA (FOLHA) REGULADOR DA ACIDEZ; ÁCIDO CÍTRICO;SORBATO DE POTÁSSIO; BENZOATO DE SÓDIO; GALHATO DE PROPILO; EDUCORANTE, CICLAMATO DE SÓDIO; AGENTE CORANTE; SACARINA SÓDICA.', '', 1, ' ', ' ', ' ', 23, 20, 35),
(41, 'E-MAGRESS GLUCOMANANO+PSILIO', 'Reduz o apetite\r\nRedutor de absorção de gorduras\r\nRegulador do trânsito intestinal\r\nAjuda a reduzir e a controlar o peso corporal\r\n', 'CAIXA COM 30 COMPRIMIDOS', 16.9, 'BIOCEUTICA', 1, 'GLUCOMANANO;FOSFATO DE TRICÁCIO; MALTODEXTRINA DE MILHO; CELULOSE MICROCRISTALINA PLIVINIVLPOLIPIRROLIDONA;PSILIO (SEMENTE); AMIDO DE TRIGO; CROSCARMELOSE SÓDICA; ESTEARATO DE MAGNÉSIO; SILICATO DE MAGNÉSIO; DIOXIDO DE SILÍCIO.', '', 1, ' ', ' ', ' ', 23, 30, 45),
(42, 'E-MAGRESS GREEN COFFEE + CHILLI PEPPER', 'CAIXA 30 COMPRIMIDOS', 'Promove a queima das gorduras acumuladas\r\nReduz a deposição abdominal de gorduras\r\nReduz a absorção de hidratos de carbono\r\nEstabiliza o nível de açúcar no sangue\r\nAjuda a reduzir e a controlar o peso corporal\r\n', 16.9, 'BIOCEUTICA', 1, 'EXTRATO SECO DE CAFÉ VERDE; pimenta de caiena (fruto); fosfato de tricálcio; maltodextrina de milho; ceculose microcristalina; polivinilpolipirrolidona; amido de trigo; croscarmelosesódica; estrearato de magnésio; silicato de magnésio; dioxido de silicio.  ', '', 1, ' ', ' ', ' ', 23, 30, 45),
(43, 'MASCULISSIMO ', 'DRENANTE TÉRMOGÉNICO', 'FRASCO 500ml', 20.5, 'BIOCEUTICA', 1, 'ÁGUA PURIFICADA;MILHO(ESTIGMAS); CHÁ VERDE (FOLHAS); PÉS-DE-CEREJEIRA; ANANÁS (FRUTO); VIDOEIRO (FOLHAS); GROSELHEIRA-NEGRA (FOLHAS)CHÁ-DE-JAVA (FOLHAS); ULMÁRIA (FOLHAS); CAVALINHA (CAULE); DENTE DE LEÃO (FOLHAS) VIDEIRA-VERMELHA (FOLHAS); SORBATO DE POTÁSSIO; BENZOATO DE SÓDIO; ÁCIDO TARTÁRICO; SUCRALOSE; SACARINA SÓDICA.', '', 1, ' ', ' ', ' ', 23, 20, 30),
(44, 'GURIC', '', 'caixa 60 comprimidos', 18.2, 'BIO-HERA', 1, 'Agente de Carga (celulosa microcristalina); Harpago (Harpagophytum procumbens); Salsaparinha (Smilax o cinalis); Agente de Carga (Fosfato de Calcio); Urtiga (Urtica dioica); Barbas de Milho (Zea mays); Zimbro (Juniperus communis); Arenária (Spergularia rubra); Freixo (Fraxubys excelsior); Antiaglomerante (Estearato de Magnesio).', '', 1, ' ', ' ', ' ', 23, 20, 35),
(45, 'TISANA XIX UREIA', '', 'EMBALAGEM DE 100gr', 4.9, 'BIO-HERA', 0, 'Marmeleiro 33%\r\nAlfavaca 33%\r\nFuncho (planta) 24%\r\nAipo 10%', '', 1, ' ', ' ', ' ', 6, 10, 20),
(46, 'MELAN LINE', '', 'FRASCO 500ml', 25.5, 'BIO-HERA', 1, 'Água purificada; Melancia 800 mg; Ortosifon 500 mg; Garcínia Camboja 400 mg; Chá Mate 300mg; Cavalinha 250 mg; Salsa 200 mg; Café verde (sem cafeína) 150 mg; Excipiente q.b.p. 500 ml', '', 1, ' ', ' ', ' ', 23, 30, 15),
(47, 'BETACOOL GOTAS', 'As plantas contidas no betacoól possuem actividades fisiológicas diversas mas convergentes e sinérgicas, quando se trata de querer contrariar o alcoolismo.\r\n\r\n-Actividade drenadora (desintoxicante), que permite uma rápida eliminação do álcool e seus metabolitos.\r\n-Actividade redutora da ansiedade e dos estados depressivos que conduzem a um estado de permanente dependência.', 'EMBALAGEM COM 100ml GOTAS', 18.05, 'BIO-HERA', 1, 'Água Purificada; Passiflora; Angélica (folhas); Carvalho; Ácido L-Ascórbico (Antioxidante); Goma Xantana (estabilizante); Vitamina PP (Nicotinamida); Sorbato de Potássio e Benzoato de Sódio (conservantes); Sacarina Sódica (edulcorante).', '', 1, ' ', ' ', ' ', 23, 15, 30),
(48, 'SPORT INFL-MIX 50gr', '', 'BISNAGA 50gr', 10.75, 'BIO-HERA', 1, 'Aqua/Water; Parafinum Liquidum; Stearic Acid; Prunus Dulcis Oil; Methyl Salicylate; Salix Alba Extract; Ruscus Aculeatus Extract; Cetyl Alcohol; Ceteareth 20; Calendula Officinalis Flower oil; Cera Alba / Beeswax; Polysorbate 80; Carbomer; Triethanolamine; Mentha Piperita Oil; Lavandula Angustifolia Oil; Sálvia Hispanica Herb Oil; Phenoxyethanol, Ethylhexylglycerin; Propylene Glycol, BHT, Ascorbyl Palmitate, Glyceryl Stearate, Citric Acid.', '', 1, ' ', ' ', ' ', 23, 30, 15),
(49, 'ALCACHOFRA 1200 FORTE ', 'Alcachofra Forte 1200 ajuda a diminuir os níveis dos lípidos no sangue e a promover a perda de peso. \r\nAlcachofra Forte 1200 fornece a dose diária recomendada para se produzirem os efeitos benéficos preconizados para a Alcachofra.\r\n\r\nA sua designação em Latim é Cynara scolymus L. Cultivada em solos ricos e argilosos na região mediterrânica, admitindo-se ser derivado do C. cardunculus L. (cardo-do-coalho), por selecção natural. Considerada durante muito tempo uma hortaliça rara, é hoje abundantemente cultivada nas regiões atlânticas. Pertence à família das Asteráceas (Compostas), sendo utilizada as folhas. É constituída por cinaropicrina, cinarina, ácidos aromáticos, flavonóides derivados da luteolina, mucilagem, pectina, inulina, fitosteróis e sais minerais. A cinarina (além dos ácidos aromáticos e dos flavonóides) é a principal responsável pelas propriedades da Alcachofra:', 'CAIXA DE 30 AMPOLAS DE 10ml', 27.95, 'BIO-HERA', 1, 'Água, Alcachofra 1200 mg; Aroma: Limão; Acidulante (AC). (Citrus); Conservante (sorbato potássico); Edulcorante (sucralose).\r\n', '', 1, ' ', ' ', ' ', 23, 15, 20),
(50, 'ASPIDOL ', '', 'EMBALAGEM 30 CAPSULAS ', 10.8, 'BIO-HERA', 1, 'Salgueiro (casca do caule) 30%; Freixo (folhas) 20%; Cafeeiro (sementes) 14%; Harpago 10%; Groselheira negra (folhas) 6%; Lactose; Polivinilpirrolidona; Harpago (raíz secundária) 14%; Ulmária (sumidades floridas); Gelatina.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 25),
(51, 'TROPIC LINE XAROPE', '', 'FRASCO 500ml', 23.9, 'BIO-HERA', 1, 'Água Purificada; Laranja Amarga 1800 mg; Centelha Asiática 1000 mg; Beringela 700 mg; L-Carnitina 500 mg; Epigalhocatequinas 200 mg;  Fibras solúveis 200 mg; Bromelaína 10 mg; Papaína 5 mg. \r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(52, 'DIGESTMAX XAROPE ', '', 'eMBALAGEM DE 250ml', 16.45, 'BIO-HERA', 1, 'Água purificada; Alcachofra (Cynara scolymus) 700 mg; Camomila (Matricaria chamomilla) 600 mg; Boldo (Peumus boldus) 300 mg; Malva (Malva sylvestris) 300 mg; Anis Verde (Pimpinella anisum) 300 mg; Funcho (Foeniculum vulgare) 200 mg; Genciana (Gentiana lutea) 100 mg; Ácido L-ascórbico (Antioxidante); Goma Xantana (Estabilizante); Sorbato de potássio (Conservante); Sacarina (Edulcorante).\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(53, 'BORUTUTU', 'O BORUTUTU (Choclospermum angolense) é constituído pelo córtex da raíz de uma árvore de grande porte, existente no continente africano, particularmente na orla costeira de Angola.\r\n\r\nDe uso tradicional pelas populações angolanas, na resolução de disfunções hepáticas, o BORUTUTU, tem sido sugeito a investigação profunda nos últimos 15 anos, confirmando-se absolutamente aquele efeito fisiológico.', 'FRASCO DE 250ml', 18.75, 'BIO-HERA', 1, '1 colher de sopa em jejum e 1 colher de sopa antes do jantar, simples ou diluído num copo de água.', '', 1, ' ', ' ', ' ', 23, 15, 30),
(54, 'TOSSI HERA', '', 'FRASCO DE 250ml', 16.7, 'BIO-HERA ', 1, 'Água; Pinheiro Silvestre  (Pinus sylvestris) 700 mg; Avenca (Adiantum capillus veneris) 400 mg; Drosera (Drosera rotundifólia) 300 mg; Polígala (Polygala amara) 200 mg ; Eucalipto (Eucalyptus globulus) 50 mg; Ácido L-ascórbico (Antioxidante); Goma xantana (Estabilizante); Sorbato de potássio (Conservante); Sacarina (Edulcorante).\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(55, 'HEPATI HERA XAROPE', 'Hepatihera foi concebido cientificamente para normalizar os processos fisiológicos e bioquímicos ao nível hepato-biliar actuando de forma natural, e não agressiva em virtude de se tratar de um componente de origem natural.', 'FRASCO DE 250ml', 16.7, 'BIO-HERA', 1, 'Alcachofra planta 600 mg; Boldo planta 600 mg; Celidónia raíz 600 mg; Cardo Mariano planta 450 mg; Colina 370 mg; Abacateiro folhas 150 mg; Cálamo planta 60 mg; Inositol 40 mg.', '', 1, ' ', ' ', ' ', 23, 15, 30),
(56, 'DRENA LINE XAROPE', 'Drena Line, é um composto à base de substâncias de origem natural, formulado para actuar como drenador geral do organismo. Em virtude do seu elevado poder drenante, referido anteriormente, Drena Line, pode contribuir para a eliminação de gorduras acumuladas e do excesso de retenção de água no organismo.', 'FRASCO 500ml', 23.9, 'BIO-HERA ', 1, 'Água purificada; Bétula (Bétula alba) 600 mg; Alcachofra (Cynara scolimus) 600 mg; Cardo Mariano (Silybum marianum) 450 mg; Roseira brava (Rosa canina) 350 mg; Agrião (Nasturtium officinale) 300 mg; Aipo (Apium graveolens) 200 mg; Salsa (Petroselium crispum) 150 mg; Amieiro (Alnus glutinosa) 100 mg; Labaça (Rumex crispus) 100 mg; Bardana (Arctium lappa) 100 mg; Beterraba (Beta vulgaris) 100 mg; Inositol 100 mg; Colina 100 mg; Vitamina C 100 mg; Glucoronolactona 50 mg; Clorofila 50 mg; Potássio 50 mg Exc. q.b.p. 500 ml.\r\n', '', 1, ' ', ' ', ' ', 23, 20, 35),
(57, 'ALGAS LINE XAROPE', 'O Algas Line é um suplemento recomendado em dietas de emagrecimento. Tem um cariz diurético, remineralizante e laxante (estimula o peristaltismo). Pode, portanto, ajudar a combater a prisão de ventre e a flatulência. Tem ainda uma contribuição positiva na redução da gordura, contém crómio que baixa os níveis de açúcar, para além de acelerar o metabolismo (queimador de calorias) e favorecer a sensação de saciedade.', 'FRASCO DE 500ML', 23.9, 'BIO-HERA', 1, 'Água Purificada; Fucus vesiculosus, Aloé vera, Glucomanana, Lespedeza capitata, Espirulina, Cinnamomum zeylanicum, Ácido málico, Ácido L-Ascórbico (Antioxidante); Goma Xantana (Estabilizante); PABA, Sorbato de potássio (Conservante); Sacarina (Edulcorante), Boro (Borato), Crómio III (Cloreto de crómio).\r\n', '', 1, ' ', ' ', ' ', 23, 20, 35),
(58, 'LYPROS', 'O Lypros é um produto imprescindível e exclusivo para o homem que tem uma acção na preservação da saúde da próstata e do sistema genito-urinário, conferindo uma óptima performance intima e uma notável qualidade de vida.', 'CAIXA COM 60 CÁPSULAS.', 22.3, 'BIO-HERA', 1, 'Óxido de Magnésio 200 mg; Magnésio 120 mg; Pólen 150 mg; Saw Palmetto (extracto seco) 100 mg; Abóbora (extracto seco 100 mg); Tomate (extracto seco 50 mg); Feijão africano (Pygeum africanum) 20 mg; Selenito de sódio 0,060 mg; Selénio 26,844 ug; Vitamina B12 (Cianocobalamina) 5,00 ug.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(59, 'NORMA TA ', '\r\n', 'CAIXA COM 120 CÁPSULAS ', 16.4, 'BIO-HERA ', 1, 'Bétula planta 600 mg; Crataegus planta 540 mg; Oliveira folha 480 mg; Calêndula 360 mg; Passiflora 300 mg; Camomila 300 mg.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(60, '4 BRAIN AMPOLAS', '4 BRAIN é o suplemento nutricional vital para se sentir pleno de confiança na sua capacidade cerebral, mentalmente equilibrado para alcançar a plena interacção com o mundo interior e exterior e obter a transcendência espiritual e emocional.', 'CAIXA COM 20 AMPOLAS BEBIVEIS DE 10ml', 16.8, 'BIO-HERA', 1, 'Composição por ampola de 10 ml. \r\nPólen 1.000 mg; Glycina Max, Lecitina de soja 600mg; Triticum aestivum, Trigo 700 mg; Geleia Real 371 mg; Paullinia cupana, Guaraná 300 mg; Fósforo Total 270 mg; Cálcio (Glicerofosfato) 250 mg; Magnésio (Glicerofosfato) 150 mg; Panax ginseng, Ginseng Coreano 147,4 mg; Gingko biloba 147,5 mg; Melissa officinalis, Melissa 65 mg; Vitamina B6 (Cloridrato de Piridoxina) 2 mg; Vitamina B2 (Riboflavina 5’ fosfato de sódio) 1,7 mg; Vitamina B1 (Cloridrato de Tiamina) 1,5 mg;\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(61, 'silicio', 'Dia após dia, a vida deixa marcas no nosso corpo. É por isso que é importante contrariar o processo de envelhecimento. O Silício é considerado um agente anti-envelhecimento natural para as paredes das artérias, pele e cabelos, além de contribuir também para reforçar as células do sistema imunitário. \r\n\r\nElemento chave dos tecidos conjuntivos é indispensável à síntese das fibras de colagénio e de elastina, ao desenvolvimento ósseo e à assimilação do cálcio.', 'FRASCO DE 500ml', 20.7, 'BIO-HERA', 1, 'Água; Dióxido de Silício 1,26 g.', '', 1, ' ', ' ', ' ', 23, 15, 30),
(62, 'ALERG COMPLEX', 'ALERG COMPLEX é uma fórmula desenvolvida minuciosamente rica em MSM, plantas, minerais, histidina (aminoácido) com o intuito de mitigar as reações alérgicas  (febre-dos-fenos, bronquite, rinite, conjuntivite…) e os sintomas associados (espirros, coriza, obstrução respiratória, pruridos, olhos lacrimejantes, urticária, enxaquecas, diarreia…) e conjuntamente equilibrar o sistema imunitário,estabilizar a permeabilidade das células epiteliais (mucosa), e controlar os processos inamatórios de forma a tratar e prevenir o organismo contra a evolução patológica das reações de hipersensilidade alérgica, e desta forma, oferecer uma vida descontraída, harmoniosa e de auto-tolerância a todo o tipo de reações que surjam na vida.', 'FRASCO COM 250ml', 20.4, 'BIO-HERA', 1, 'Metilsulfonilmetano (MSM) 1.000 mg; Hyssopus officinalis (Hissopo) 250 mg; Solidago virgaurea (Vara de Ouro) 250 mg; Marrubium vulgare (Marroio) 250 mg; Verbascum densiflorum (Verbasco) 250 mg; Viola tricolor (Amor perfeito selvagem) 200 mg; Ribus nigrum (Groselheira negra) 200 mg; Acorus calamus (Acoro) 200 mg; Hydrastis canadensis (Hidraste) 100 mg; Sambucus nigra (Sabugueiro) 100 mg; Passiflora incarnata (Passiflora) 100 mg; Cálcio 149,5 mg; Potássio 125,87 mg; Magnésio 100 mg; Inula helenium (Helénio) raíz (extracto liquido 1:3) 50 mg; Histidina 50 mg; Zingiber officinale (Gengibre) 5 mg; Cobre 2 mg.\r\n', '', 1, ' ', ' ', ' ', 23, 20, 35),
(63, 'TISANA II FV', '', 'EMBALAGEM DE 100gr', 4.9, 'BIO-HERA', 1, 'Tintória vermelha 25%\r\nBoldo 17%\r\nHipericão de Kneipp 17%\r\nTaraxaco 12%\r\nS. Roberto 8%\r\nGrama 8%\r\nBardana 5%\r\nSempre Noiva 4%\r\nErva Prata 4%', '', 1, ' ', ' ', ' ', 23, 10, 15),
(64, 'TISANA VI MC', 'Com Hamamélis.\r\nA Hamamélis contribui para a saúde das veias e ajuda a diminuir a sensação de pernas dolorosas e pesadas, varizes, hemorróidas.', 'EMBALAGEM DE 100gr', 4.9, 'BIO-HERA', 1, 'Groselheira folha 20%, Malva silvestris 20%, Meliloto planta 20%, Hamamelis folha 15%, Videira folha 15%, Sene folículos 10%.', '', 1, ' ', ' ', ' ', 23, 10, 15),
(65, 'TISANA VIII RVU', '', 'EMBALAGEM DE 100gr', 4.9, 'BIO-HERA', 1, 'Morangueiro 13%\r\nSempre noiva 13%\r\nFuncho (planta) 13%\r\nCavalinha 10%\r\nGrama (raíz) 10%\r\nUva ursina 7%\r\nBarbas de milho 7%\r\nMedronheiro (folha) 7%\r\nVerbena officinalis 5%\r\nCidreira 4%\r\nErva prata 4%\r\nZimbro (bagas) 4%\r\nPés de cereja 3%', '', 1, ' ', ' ', ' ', 23, 10, 15),
(66, 'TISANA  PROSTAMEN', '', 'CAIXA 100gr', 4.9, 'BIO-HERA', 1, 'Sabal serrulata 25%\r\nEquinácia 20%\r\nCipreste 15%\r\nUva ursina 10%\r\nVara de ouro 10%\r\nMedronheiro 10%\r\nCavalinha 10%', '', 1, ' ', ' ', ' ', 23, 10, 15),
(67, 'BIOVENA GEL 200ml', 'O fenómeno das pernas cansadas ou pesadas carateriza-se por uma sensação de peso e fadiga nas pernas, principalmente no final do dia e no verão. Este é um problema que afecta um terço da população portuguesa, maioritariamente mulheres.\r\nUma forte necessidade de agitar e coçar as pernas, sensação de pernas pesadas, formigueiro, comichão nos membros inferiores, dificuldade em permanecer na mesma posição, sensação de que a barriga das pernas pesa uma tonelada ao fim do dia são sintomas que podem indiciar má circulação venosa, mas não só. As condições de trabalho e a gravidez também podem originar esta situação.\r\nBIOVENA Gel tem na sua formula a combinação ideal de substancias que permitem o alivio imediato do cansaço das pernas e que, em combinação com os agentes refrescantes e calmantes estimulam a microcirculação das pernas.', 'EMBALAGEM DE 200ml', 16.4, 'BIO-HERA', 1, 'Aqua; Alcohol; Propylene Glycol; Aesculus Hippocastanum Extract; Hedera Helix Extract; Menthol; Triethanolamine; Carbomer; Camphor; C.I. 42090.', '', 1, ' ', ' ', ' ', 23, 15, 35),
(68, 'CELL COMPLEX', 'A palavra Neoplasia significa “crescimento novo” e designa alterações celulares que conduzem a um crescimento exagerado de células, traduzindo-se numa proliferação celular descontrolada e autónoma, originando a formação de tecido novo de origem patológica.\r\n\r\nAs Neoplasias podem ser provocadas por : Alimentação (aditivos, corantes e outras substância pró-cancerígenas) 35% - Tabaco 30% - Hereditariedade (Genética) 6% - Vírus (HPV, Epstein-Barr, Hepatite B, leucemia de células T humano tipo 1) e micróbios (Helicobacter pylori) 5% - Poluição ambiental 3% - Radiação (ultravioleta, ionizante) 3% - Idade (> 55 anos – alteração dos telómeros) - Toxinas exógenas e endógenas - Metais pesados - Substâncias químicas (drogas medicinais, hidrocarbonetos aromáticos policiclicos – extraídos dos combustíveis fósseis, nitrosamina, insecticidas, fungicidas, pesticidas) .\r\n\r\nCELL COMPLEX é uma fórmula de vanguarda, composta de produtos específicos para o tratamento e profilaxia complementar nos estados pré e pós-neoplásicos, tais como Plantas (Erva-de-São-Roberto, Visco branco, Curcuma), Vitaminas (C, E, D3), Minerais ( Selenio, Molibdénio), Aminoácidos ( taurina), Frutos e vegetais (Romã, Alperce, Aipo), enriquecido com Ficocianinas, Betanina, betacarotenos, óleo de sementes de linho e Squalene , que permite a reparação do ADN celular, a actividade citostática e oncostática, o aporte de oxigénio ideal, evitando, simultaneamente a produção excessiva de radicais livres, o controlo do processo in', 'EMBALAGEM DE 250ml', 22, 'BIO-HERA', 1, 'Vitamina C (Ácido L-ascórbico) 900 mg; Cloreto de potássio 570 mg; Romã (ext. seco 5:1) 500 mg; Alperce (fruto) ext. seco (5:1) 300 mg; Vitamina E Acetato de di-alfa-tocoferol 300 mg; Açafrão (rizoma) ext. seco (5:1) 200,1 mg; Beterraba ext. seco (10 % betanina) 200 mg; Óleo de Linhaça - 50% ALA 0,20 mg; L- Taurina 200,1 mg; Spirulina 300,6 mg; Visco Branco (folha) ext. liquido (1:3) 30,6 mg; Aipo (planta) ext. liquido (1:3) 300,6 mg; Erva S Roberto (planta) ext Liquido (1:3) 100,2 mg; Betacaroteno 10,02 mg; Squalene 99 % 2 mg; Vitamina D3 (Colecalciferol) 5 µg; Selenito de sódio (Selénio) 100 µg; Molibdato de sódio (Molibdénio) 50 µg; Vitamina K2 (Menaquinona) 75 µg.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 35),
(69, 'CROMIO BIO-HERA', 'Desde há séculos que a medicina tradicional angolana recorre ao Borututu, usando-o quer bebível ou em lavagens, tratando inúmeras enfermidades relacionadas com as funções hepáticas e biliares, gástricas, esplénicas que afectam o seu território as quais, por escassez de remédios e medicamentos causam a morte de muitas pessoas.\r\n', 'EMBALAGEM DE 60 CAPSULAS ', 14.2, 'BIO-HERA', 1, 'Burututu (Smilax angolensis) 714 mg ; Fosfato tricálcio; Amido trigo; Lactose; Estearato de Magnésio.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(70, 'CALCIMIX CAPSULAS ', 'CalciMix+ Duo contém cálcio mais glucosamina, condroitina, vitamina E, vitamina D3, boswellia serrata, zinco entre outros ingredientes. A escolha certa.', '30+60 CÁPSULAS', 25.3, 'BIO-HERA', 1, '\r\nCalciMix+ 1	\r\n- Cálcio	153mg\r\n- Vitamina E	15mg\r\n- Vitamina D3	2,1µg\r\nCalciMix+ 2	\r\n- Cúrcuma	400mg\r\n- Unha de Gato - extrato seco	100mg\r\n- Sulfato de Glucosamina	100mg\r\n- Sulfato de condroitina	100mg\r\n- Boswellia Serrata - extrato seco	80mg\r\n- Gluconato de Zinco	74,08mg\r\n- Salgueiro - extrato seco	10mg\r\n- Sabugueiro	40mg\r\n- Hárpago	40mg\r\n- Vitamina C	30mg\r\n- Selenito de sódio	44,70mg\r\nQue fornece Selénio	20µg', '', 1, ' ', ' ', ' ', 23, 15, 30),
(71, 'PLURIVIT', 'PLURIVIT FORTE contém uma mistura de micronutrientes fundamentais para o funcionamento do organismo. É rico em vitaminas ( A, B, C, D, E, etc.) e minerais ( cálcio, magnésio, fosforo, zinco, ferro, iodo, cobre, molibdénio, etc.) contendo, ainda, outros extractos com propriedades fitoterapêuticas.', '30 CAPSULAS', 14, 'BIO-HERA', 1, '\r\n- Geleia Real liofilizada	120mg\r\n- Cálcio	104mg\r\n- Ginseng extrato seco	100mg\r\n- Vitamina C	90mg\r\n- Magnésio	80mg\r\n- Vitamina B3 (Niacina)	40mg\r\n- Fósforo	40mg\r\n- Vitamina E	20mg\r\n- Pólen	20mg\r\n- L-Metionina	20mg\r\n- Lecitina de Soja	20mg\r\n- Vitamina B5 (Ácido pantoténico)	14mg\r\n- Bitartarato de colina	10mg\r\n- Potássio	10mg\r\n- Zinco	8mg\r\n- Vitamina B6	4,4mg\r\n- Ferro	4mg\r\n- Inositol	4mg\r\n- Vitamina B2 (Riboflavina)	3,6mg\r\n- Vitamina B1 (Tiamina)	2,4mg\r\n- Vitamina A	1,492µg\r\n- Molibdénio	600µg\r\n- Ácido fólico	400µg\r\n- Biotina	400µg\r\n- Vitamina K1	340µg\r\n- Iodo	150µg\r\n- Cobre	0,02mg\r\n- Vitamina D3	11µg\r\n- Vitamina B12	4µg', '', 1, ' ', ' ', ' ', 23, 15, 30),
(72, 'DORMY FAST', 'A MELATONINA CONTRIBUI PARA REDUZIR O TEMPO NECESSÁRIO PARA ADORMECER E PARA O ALIVIO DOS SINTOMAS SUBJECTIVOS DA DIFERENÇA HORÁRIA ', '30 CÁPSULAS', 13.1, 'BIO-HERA', 1, 'Agente de volume: Maltodextrina; Ácido gama-aminobutírico (GABA) 22,2%; Cápsula (Gelificante: Gelatina); Passiflora flor e folha, extrato seco (Passiflora incarnata) 11,1%; Papoila-da Califórnia partes aéreas, extrato seco (Eschscholzia californica) 11,1%; Laranja amarga flor, extrato seco (Citrus aurantium) 5,55%; Tília flor, extrato seco (Tilia platyphyllos) 5,55%; Lúpulo flor, extrato seco (Humulus lupulus) 5,55%; Melatonina 0,36%; Antiaglomerante: Estearato de magnésio; Antiaglomerante: Dióxido de silício.', '', 1, ' ', ' ', ' ', 23, 15, 30),
(73, 'CARDO MARIANO ', 'É uma planta herbácea, nativa da região mediterrânea cujos frutos contêm um conjunto de  componentes ativos do cardo-mariano que  são um complexo de bioflavonóides antioxidantes, que são conhecidos como Silimarina. \r\n\r\nEsse complexo antioxidante único exerce o seu poder curativo ao evitar danos às células hepáticas saudáveis e, simultaneamente ao estimular a regeneração daquelas células já prejudicadas, de acordo com amplas pesquisas realizadas. O cardo mariano normaliza  os níveis do colesterol e triglicéridos e estimula a produção da bílis favorecendo a digestão das gorduras.', '100 COMPRIMIDOS', 9.5, 'BIO-HERA', 1, 'Cardo mariano planta (Silybum marianum) 50%; Fructo-oligossacáridos 36%; Celulose microcristalina 14%.', '', 1, ' ', ' ', ' ', 23, 15, 30),
(74, 'CAVALINHA BIO-HERA', 'A Cavalinha é muito apreciada pelo seu elevado conteúdo em silício, oligoelemento mineral que participa nos processos de regeneração dos tecidos e em potássio, ácido oxálico e málico. \r\n\r\nAlém disso, contém uma saponina (equisetonina), flavonoides (a que se deve o seu efeito diurético), diversos ácidos orgânicos e resinas.\r\n', 'EMBALAGEM COM 100 COMPRIMIDOS', 5.6, 'BIO-HERA', 1, 'Cavalinha (Equisetun arvense) extracto (2:1) 50 mg, Cavalinha (Equisetun arvense) planta 400 mg, Celulose microcristalina 50 mg.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(75, 'BORUTUTU COMPRIMIDOS', 'Desde há séculos que a medicina tradicional angolana recorre ao Borututu, usando-o quer bebível ou em lavagens, tratando inúmeras enfermidades relacionadas com as funções hepáticas e biliares, gástricas, esplénicas que afectam o seu território as quais, por escassez de remédios e medicamentos causam a morte de muitas pessoas.\r\n', '100 COMPRIMIDOS', 14.6, 'BIO-HERA', 1, 'Burututu (Smilax angolensis) 714 mg ; Fosfato tricálcio; Amido trigo; Lactose; Estearato de Magnésio.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(76, 'ALCACHOFRA 90 COMP.', 'A Alcachofra contribui para a perda de peso e para a eliminação de toxinas indesejáveis.', '90 CAPSULAS', 8.3, 'BIO-HERA', 1, 'Cynara scolymus, Alcachofra planta 70% - 1050 mg; Extracto de Cynara scolymus (10:1) Alcachofra (0,7% Cinarina) 20 % - 300 mg (equivalente a 3000 mg); Celulose microcristalina 10%.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(77, 'B-FIBRAS ', '', '60 COMPRIMIDOS', 11.5, 'BIO-HERA', 1, '2 comprimidos 30 minutos antes das 2 principais refeições (almoço e jantar) com um bom copo de água. Com o trânsito intestinal regularizado, tomar 1 a 2 comprimidos ao dia.\r\n', '', 1, ' ', ' ', ' ', 23, 15, 30),
(78, '4 DETOX', 'A desintoxicação é um termo que descreve a remoção das substâncias tóxicas do corpo que se vão acumulando no nosso organismo e provocam diversas doenças e perturbações, tais como: problemas gástricos, obesidade, colesterol elevado, diminuição do sistema imunitário , obstipação e cansaço físico.', '20 AMPOLAS BEBÍVEIS DE 10ml', 21.9, 'BIO-HERA', 1, 'Extracto de Alcachofra (Cynara scolymus) 500 mg; Dente de Leão (Taraxacum Officinale) 100 mg; Boldo (Peumus boldus) 100 mg; Rábano Negro (Raphanus sativus) 100 mg; Cardo Mariano (Silybum marianum) 50 mg; Zimbro (Juniperus communis) 50 mg; Inositol 50 mg; Citrato de Colina 243 mg (Colino 85 mg)', '', 1, ' ', ' ', ' ', 23, 15, 30),
(79, 'ALGALIMÃO FIT ', 'Alga Limão Fit contribui de uma forma natural para o aumento do catabolismo lipídico (Queima Gorduras) ajudando a impedir o armazenamento de gorduras no organismo. Tem , ainda, um efeito bloqueador do apetite, dando uma sensação de saciedade durante todo o dia. Redutor dos níveis de gordura e da obsorção de açúcares a sua formula tem igualmente uma acção detox, diurética e de regulação do trânsito intestinal.', '60 CAPSULAS', 26.6, 'BIO-HERA', 1, 'Glucomanano raíz pó 23,12% - 400 mg, Café Verde fruto extrato seco 45% (ácido clorogénico – Coffea arábica) 11,56% - 200 mg, Garcínia cambogia fruto extracto seco (60% HCA) 11,56% - 200 mg, Cascara Sagrada casca extracto seco 25% cascarósidos (Rhamnus purshiana) 11,56% - 200 mg, Cloreto de Potássio 11,09% - 192 mg (Potássio 101,92 mg - 5,1% DDR*), Quitosano pó Chitosan) 5,78% - 100 mg, Alcachofra planta extrato seco 2,5% Cinarina (Cynara scolymus) 5,78% - 100 mg, Bétula folha extracto seco 5:1 (Bétula alba) 5,78% - 100 mg, Maçã fruto extrato seco 5% - 60 mg, Florizidina (Malus domestica) 3,47%, Vitamina B3 (Nicotinamida 0,58% - 10 mg (62,5% DDR*), Sulfato de Cobre 0,29% - 5 mg (Cobre 1,99 mg - 199% DDR*), Vitamina B5 (Pantotenato de Cálcio) 0,249% - 4,32 mg (72% DDR*), Vitamina B1 (Tiamina hcl) 0,073% - 1,27 mg (115,45% DDR*), Vitamina B2 (Riboflavina) 0,046% - 0,80 mg (57,14% DDR*), Picolinato de Crómio 0,02% - 0,36 mg (Crómio 40 μg - 100% DDR*), Iodeto de Potássio 0,007% - 124 μg (Io', '\r\n\r\n\r\n\r\n', 1, ' ', ' ', ' ', 23, 10, 20),
(80, 'CIRCULAN PLUS 30 CAPS', 'A solução natural para a leveza das pernas pesadas, pés inchados, mãos e pés frios, formigueiro e cãibras, fragilidade capilar. Em momentos críticos: calor muito forte, estar de pé ou sentada durante um longo período de tempo, viajar. Como complemento do tratamento de varizes ou hemorróidas.', '30 CAPSULAS ', 12.76, 'BIO-HERA', 1, 'Hamamélis casca extracto seco 5:1 (Hamamelis virginiana) 12,73%; Bétula folhas extracto seco 5:1 (Betula alba) 11,81%; Milefólio planta extracto seco 5:1 (Aquilea millefolium) 10,90;, Gilbardeira rizomas e raízes extracto seco (Ruscus aculeatus) 9,09%; Verbena planta extracto seco (Verbena officinalis) 8,18%; Videira vermelha folhas extracto seco 5% Polifenóis (Vítis vinífera) 7,27%; Diosmina 6,36%; Hesperidina (Laranja Amarga fruto – Citrus aurantium) 5,45%; Antiaglomerante: Estearato de Magnésio; Sulfato de Ferro 3,47%; Vitamina B3 (Nicotinamida) 2,90%; Sulfato de Cobre 0,35%; Vitamina B12 (Cianocobalamina) 0,023%.', '', 1, ' ', ' ', ' ', 23, 10, 20),
(81, 'OH COMPLEX ', 'O potencial Humano assenta no equilíbrio em todos os seus domínios. O pH do corpo afeta toda a nossa saúde. Equilibrar o pH é um passo \r\nimportante para manter a saúde física, mental e emocional.\r\n\r\nOs distúrbios do equilíbrio ácido-base estão associados a enfermidades agudas, crónicas ou degenerativas, pelo que, a base de uma terapia assenta, inevitavelmente, por equilibrar os líquidos e os electrólitos de forma a atingir o pH perfeito.\r\n\r\nA fórmula avançada do PH COMPLEX permite corrigir as alterações dos iões de H no corpo bem como preparar o organismo a reagir adequadamente à desintoxicação de metais pesados, substâncias químicas e, simultaneamente, regular o pH digestivo, tecidual e celular para alcançar a homeostase, toniﬁcante (fadiga, cãibras, dores musculares).', 'EMBALAGEM 250ml', 20.1, 'BIO-HERA', 1, 'Água Purificada; Espirulina; Magnésio (Cloreto e Gluconato); Limão; Aipo; Ácido Cítrico; Ácido Málico.\r\n', '', 1, ' ', ' ', ' ', 23, 20, 35),
(82, 'CARVÃO ACTIVO BIO-HERA', '', 'CAIXA COM 40 COMPRIMIDOS', 7.6, 'BIO-HERA', 1, 'Carvão vegetal activado 71,4%; Pimpinella anisum, Anis verde (fruto) 12,9%; Foeniculum vulgare, Funcho (sementes) 5,7%; Mentha piperita, Hortelã Pimenta (folhas) 4,3%; Lactose; Lactobacillus acidophilus (1x10 CFU/g) 0,9%; goma arábica\r\n', '', 1, ' ', ' ', ' ', 23, 10, 20);
INSERT INTO `products` (`id`, `name`, `description`, `summary`, `price`, `brand`, `stock`, `ingredients`, `others`, `isActive`, `productCod`, `keywords`, `smallDescription`, `iva`, `salePublic`, `saleRetailer`) VALUES
(83, 'GRIPOFIT XAROPE', 'Suplemento Alimentar\r\nSuplemento com Pinheiro, Tomilho, Hortelã, Equinácea, Própolis, Sabugueiro, Hera e Vitamina C.\r\nA vitamina C contribui para o normal funcionamento do sistema imunitário.\r\n\r\n- See more at: http://www.calendula.pt/catalogo/gripofit-xarope/#sthash.Lk35VISQ.dpuf', 'EMBALAGEM DE 200ml', 11, 'CALENDULA', 1, 'Por 30 ml (2 colheres de sopa): Mel; Edulcorante: Sacarose; Agente de Volume: Água purificada; 907,5 mg Extrato Fluido de Pinheiro (Pinus sps.), gomos; Agente de Transporte: Etanol; 241,5 mg Extrato Fluido de Tomilho (Thymus vulgaris), folhas; 196,5 mg Extrato Fluido de Hortelã-pimenta (Mentha piperita), folhas; 181,5 mg Extrato Fluido de Propólis; 181,5 mg Extrato Fluido de Equinácea (Equinacea purpurea), raíz; Agente de Volume: Glicerina; 90 mg Extrato Fluido de Sabugueiro (Sambuscus nigra), 90 mg Extrato Fluido de Hera (Hedera helix), folhas; 45 mg (56%*) Ácido L-Ascórbico; Conservantes: Sorbato de Potássio, Benzoato de Sódio. * Valor de Referência do Nutriente.\r\n\r\nAlergénios\r\nn/a\r\n\r\n- See more at: http://www.calendula.pt/catalogo/gripofit-xarope/#sthash.Lk35VISQ.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(84, 'CARDO MARIANO XAROPE ', 'Suplemento na forma de xarope sem álcool, à base de Espinheiro Marítimo e Cardo Mariano. Não contém álcool. -', 'EMBALAGEM DE 250ml', 18, 'CALENDULA', 1, 'Por 30 ml (2 colheres de sopa): Espinheiro Marítimo; Agentes de Transporte: Frutose, Água; 800 mg Extrato de Cardo Mariano; Espessantes: Goma de Guar, Goma de Alfarroba, pectinas; Conservante: Sorbato de Potássio; Acidificante: Ácido L-Ascórbico. - See more at: http://www.calendula.pt/catalogo/cardo-mariano-xarope/#sthash.UIbLpjay.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(85, 'HEPADETOX XAROPE', 'Suplemento com Alcachofra, Cardo Mariano, Dente de Leão, Boldo, Hortelã-pimenta, Vara-de-ouro, Bétula, Gatunha e Cavalinha. - See more at: http://www.calendula.pt/catalogo/hepadetox-xarope/#sthash.R0nG8G9P.dpuf', 'EMBALAGEM DE 200ml', 27.3, 'CALENDULA', 1, 'Por 10 ml: Agentes de transporte: Água, Álcool; 1206,5 mg Solidago virgaurea; 315,4 mg Bétula pendula, 234,5 mg Cynara scolymus; 163,3 mg Silybum marianum; 121,6 mg Ononis spinosa; 104,5 mg Equisetum arvense; 61,3 mg Taraxacum officinalis; 35,6 mg Peumus boldus; 15 mg Menta piperita. - See more at: http://www.calendula.pt/catalogo/hepadetox-xarope/#sthash.R0nG8G9P.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(86, 'ACIDO FOLICO GOOD''N NATURAL', '', 'EMBALAGEM DE 250 COMPRIMIDOS', 11.35, 'GOOD''N NATURAL', 1, 'Ácido fólico 400 mcg. 250 Comprimidos da marca Good''n Natural é uma ingestão extra de multivitaminas. Ácido fólico 400 mcg. 250 Comprimidos da Good''n Natural é um suplemento de vitamina perfeito, que será de grande ajuda quando há uma falta de vitaminas essenciais para realizar vida diária. As vitaminas do Ácido fólico 400 mcg. 250 Comprimidos são essenciais para a função celular, o crescimento e desenvolvimento normal do nosso corpo. As vitaminas são agrupados em duas categorias, os que são solúveis são armazenados na gordura corporal e vitaminas solúveis em água que o corpo tem de ser utilizado imediatamente, e o excesso do último estão fora do corpo através da urina.', '', 1, ' ', ' ', ' ', 23, 15, 30),
(87, 'ALCACHOFRA BIO', 'Suplemento com Extrato de Alcachofra Biológica.', 'EMBALAGEM COM 20 AMPOLAS DE 10ml', 25.9, 'CALENDULA', 1, 'Por Ampola: 10000 mg Alcachofra biológica extrato (água, Alcachofra biológica (folhas). - See more at: http://www.calendula.pt/catalogo/alcachofra-bio-amp/#sthash.WYfTaXhu.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(88, 'CARVÃO VEGETAL CALENDULA', 'Suplemento de carvão vegetal.', 'EMBALAGEM COM 100 COMPRIMIDOS', 11, 'CALENDULA', 1, 'Por 6 Comprimidos: 966 mg Carvão vegetal ativado; Agentes de volume: Sacarose, Lactose, Polivinilpirrolidona, Amido de milho; Antiaglomerantes: Talco, Sais de magnésio de ácidos gordos; Aroma: Hortelã-Pimenta.\r\n\r\nAlergénios\r\nContém lactose\r\n\r\n- See more at: http://www.calendula.pt/catalogo/carvao-vegetal/#sthash.a5BL7fvW.dpuf', '', 1, ' ', ' ', ' ', 23, 15, 30),
(89, 'DIET LINHA DRENA 500ml', 'Suplemento com Extratos de Cavalinha, Mate, Urtiga e Chá de Java. - See more at: http://www.calendula.pt/catalogo/diet-linha-drena/#sthash.QPaHw0GC.dpuf', 'EMBALAGEM 500ml', 21.1, 'CALENDULA', 1, 'Por 30 ml: Água Purificada, Extratos Glicéricos de: 600 mg Equisetum arvense L. (Cavalinha), 600 mg IIex paraguayensis (Mate), 600 mg Urtica dioica (Urtiga), 600 mg Orthosiphon stamineus Benth (Chá de Java), Aroma, Acidificante: Ácido cítrico, Conservantes: Sorbato de Potássio, Benzoato de Sódio. - See more at: http://www.calendula.pt/catalogo/diet-linha-drena/#sthash.QPaHw0GC.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(90, 'LIPOKAL CAPSULAS', 'Suplemento com Slim Rose, Quitosano, Fibras e Vitaminas. A vitamina B6 contribui para o metabolismo normal das proteínas e do glicogénio. O crómio contribui para o normal metabolismo dos macronutrientes e para a manutenção de níveis normais de glicose no sangue. - See more at: http://www.calendula.pt/catalogo/lipokal/#sthash.WdDyEfMl.dpuf', 'caixa com 40 capsulas', 20.15, 'CALEDULA', 1, 'Por 2 Cápsulas: 41 % Fibra de aveia, 15% Quitosano, Cápsula: Gelatina, 8 % Extrato de Slim rose com Rosavina, 8 % Extrato de Chá verde, 8 % Extrato de gilbarbeira, 0,4% (20%*) Acetato de D-alfa-tocoferol, 0,2 % (8,3%*) D-pantotenato de cálcio, 0,1% (17,9%*) Cloridrato de piridoxina, 0,01 % Crómio. * Valor de Referência do Nutriente.\r\n\r\nAlergénios\r\nContém aveia, produtos à base de crustáceos.\r\n\r\n- See more at: http://www.calendula.pt/catalogo/lipokal/#sthash.WdDyEfMl.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 15),
(91, 'GLUCOMANANO SAQUETAS', 'Suplemento com Glucomanano e fruto-oligossacarídeoS', 'EMBALAGEM COM 30 SAQUETAS DE 120g CADA', 26.1, 'CALENDULA', 1, 'Por 1 Saqueta: 1 g Glucomanano (Amorphophallus konjac), 3 g FOS, Aroma de Pêssego. - See more at: http://www.calendula.pt/catalogo/glucomanano-saq/#sthash.edgg2lb5.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(92, 'CENTELLA GEL', 'Gel com Centella asiatica (Gotu Kola).', 'EMBALAGEM COM 200ml', 20.6, 'CALENDULA', 1, 'Aqua, Centella Asiatica Extract, Alcohol, Aesculus Hippocastanum Extract, Peg-40 Hydrogenated Castor Oil, Camphor, Carbomer, Menthol, Triethanolamine, Arnica Montana CI 42051, CI 15985, Propylene Glycol (and) Diazolidinyl Urea (and) Iodopropynyl Butylcarbamate. - See more at: http://www.calendula.pt/catalogo/centella-asiatica-gel/#sthash.0vlbokvG.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(93, 'TURMERIC CURCUMIN', 'Nutracêutico bioprotetor com extrato de Curcuma longa (Turmeric). - See more at: http://www.calendula.pt/catalogo/turmeric-curcumin/#sthash.8joJJhGy.dpuf', 'EMBALAGEM DE 60 CÁPSULAS', 23.9, 'CALENDULA', 1, 'Por 1 Cápsula: 450 mg Curcuma (Curcuma longa) (raiz); 50 mg Extrato de Curcuma (Curcuma longa) (raiz) (padronizado para conter 95% de curcuminóides); Agente de revestimento: Gelatina; Antiaglomerante: Ácido esteárico vegetal. - See more at: http://www.calendula.pt/catalogo/turmeric-curcumin/#sthash.8joJJhGy.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(94, 'MENOCARE DUO', 'O magnésio contribui para o equilibrio dos eletrólitos, para o normal funcionamento do sistema nervoso, para a síntese normal das proteinas, para uma normal função psicológica e para a manutenção de ossos normais.\r\nA vitamina D contribui para a normal absorção/utilização do cálcio e do fósforo, para níveis normais de cálcio no sangue e para a manutenção de ossos normais.\r\n\r\nMenocare: 21 nutrientes, entre eles, isoflavonas de soja, 12 vitaminas e 8 minerais.\r\n\r\nSálvia: 4 nutrientes, entre os quais Sálvia, Passiflora, Chá Verde e Linhaça,\r\n\r\n- See more at: http://www.calendula.pt/catalogo/menocare-duo/#sthash.2YNzNoRF.dpuf', 'EMBALAGEM DE 30+30 COMPRIMIDOS ', 25.5, 'CALENDULA', 1, 'Por 1 Comprimido Menocare: Agentes de volume: Celulose microcristalina, Fosfato dicálcico; 100 mg (100%*) Óxido de magnésio; 15,77 mg (158%*) Gluconato de zinco; 30 mg (250%*) Acetato de DL-alfa-tocoferol (Vit. E); 6 mg (43%*) Gluconato ferroso; 45 mg (56%*) Ácido L-ascórbico (Vit. C); 30 mg (500%*) D-pantotenato de cálcio (B5); Agentes de revestimento: Hidroxipropil-metilcelulose, Celulose microcristalina, Talco, Glicerol, Dióxido de titânio, Corante vermelho, Corante castanho; 20 mg Isoflavonas de soja; 20 mg (125%*) Nicotinamida (Vit. B3); Antiaglomerante: Sais de magnésio de ácidos gordos; 10 mg (714%*) Cloridrato de piridoxina (Vit. B6); 10 mg (909%*) Cloridrato de tiamina (Vit. B1); 0,009 mg (360%*) Cianocobalamina (Vit. B12); 1 mg (100%*) Gluconato cúprico; 5 mg (357%*) Riboflavina (Vit. B2); 0,75 mg (94%*) Acetato de retinol (Vit. A); 0,5 mg (25%*) Gluconato de manganês; 5 µg (100%*) Colecalciferol (Vit.D); 50 µg (125%*) Picolinato de crómio; 0,4 mg (200%*) Ácido pteroilmonoglu', '', 1, ' ', ' ', ' ', 23, 20, 35),
(95, 'MUTI-ENZYME COMLEX', 'Suplemento de enzimas digestivas (amilase, lactase, celulase, protease e lipase). - See more at: http://www.calendula.pt/catalogo/multi-enzyme-complex/#sthash.95k8SzvW.dpuf', 'EMBALAGEM COM 90 CAPSULAS', 16.2, 'CALENDULA', 1, 'Por 1 Cápsula: Agente de volume: Celulose microcristalina; (6000 USP Units/mg) 100 mg Papaína; Cápsula: Gelatina; Digezyme® EU 9 mg (24000 U/g) Amilase; 4,4 mg (4000 U/g) Lactase; 0,95 mg (200 U/g) Celulase; 0,615 mg (6000 U/g) Protease; 0,1 mg (1000 U/g) Lipase); Antiaglomerante: Sais de magnésio de ácidos gordos. - See more at: http://www.calendula.pt/catalogo/multi-enzyme-complex/#sthash.95k8SzvW.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(96, 'PICOLINATO DE CRÓMIO', 'Suplemento de picolinato de crómio. O crómio contribui para o normal metabolismo dos macronutrientes e para a manutenção de níveis normais de glicose no sangue. - See more at: http://www.calendula.pt/catalogo/picolinato-de-cromio/#sthash.PJukYVuk.dpuf', 'EMBALAGEM DE 60 CAPSULAS', 11, 'CALENDULA', 1, 'Por 1 Cápsula: Agente de volume: Celulose microcristalina; Cápsula: gelatina; Antiaglomerante: Sílica; 250 µg (625% Valor de Referência do Nutriente) Picolinato de crómio; Corantes: Óxido de ferro vermelho, Dióxido de titânio. - See more at: http://www.calendula.pt/catalogo/picolinato-de-cromio/#sthash.PJukYVuk.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(97, 'GLUCOMANANO CÁPSULAS', 'Suplemento com Glucomanano, L-Carnitina, Algas, Crómio e Vitaminas B6 e B5. O crómio contribui para o normal metabolismo dos macronutrientes e para a manutenção de níveis normais de glicose no sangue. A vitamina B6 contribui para o metabolismo normal das proteínas e do glicogénio. - See more at: http://www.calendula.pt/catalogo/glucomanano/#sthash.0UmIfGqO.dpuf', 'EMBALAGEM DE 60 CAPSULAS', 17.7, 'CALENDULA', 1, 'Por 2 Cápsulas: 340 mg Glucomanano; Agente de revestimento: Gelatina; 150 mg L-Carnitina, Extrato de Levedura com crómio 200 µg (500%*); 93,8 mg Algas; Citrato de potássio; Agentes de volume: Talco, Sorbitol, Polivinilpirrolidona: Antiaglomerante: Sais de magnésio de ácidos gordos; Agente de volume: Sílica; 9,8 mg (163%*) Pantotenato de cálcio (Vit. B5); Cápsula: Óxido de titânio, Óxido de ferro amarelo, Eritrosina; 20 mg (1428,6%*) Cloridrato de piridoxina (Vit. B6). * Valor de Referência do Nutriente. - See more at: http://www.calendula.pt/catalogo/glucomanano/#sthash.0UmIfGqO.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(98, 'NUTRICEREBRO-ACTIVE AMPOLAS', 'Suplemento bioenergético ativo na forma de solução oral composto por aminoácidos, vitaminas e minerais. A Vitamina C e o Magnésio que contribuem para o normal funcionamento do sistema nervoso, para a redução do cansaço e da fadiga e para a normal função psicológica. - See more at: http://www.calendula.pt/catalogo/nutricerebro-active/#sthash.E7CfZ37z.dpuf', '30 AMPOLAS ', 29.9, 'CALENDULA', 1, 'Por 1 Ampola: Agentes de volume: Água purificada, Glicerol; 1000 mg L-Arginina; 250 mg L-Aspartato de magnésio, 200 mg Taurina; 100 mg (100%*) Ácido L-Ascórbico; 50 mg L- Carnitina; Conservantes: Sorbato de potássio; Benzoato de sódio; Edulcorante: Sacarina sódica; Aroma; Corante: Amarelo de quinoleína. - See more at: http://www.calendula.pt/catalogo/nutricerebro-active/#sthash.E7CfZ37z.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(99, 'NUTRICEREBRO CÁPSULAS', 'Suplemento com 25 ingredientes bioativos, entre ácidos gordos essenciais, fosfolípidos naturais, aminoácidos, vitaminas e minerais. O DHA contribui para a manutenção de uma normal função cerebral. A Tiamina, Riboflavina, Vitaminas B6, B12 e C contribuem para o funcionamento normal do sistema nervoso. A vitamina E contribui para a proteção das células contra as oxidações indesejáveis. O ácido pantoténico contribui para um desempenho mental normal. - See more at: http://www.calendula.pt/catalogo/nutricerebro-caps/#sthash.c6RU0tcy.dpuf', '30 CAPSULAS', 21.3, 'CALENDULA', 1, 'Por 1 Cápsula: Agentes de revestimento: Gelatina, Glicerol, Corante; 100 mg Óleo de peixe (EPA 18%, DHA 12%); 200 µg (363,6%*) Selenito de sódio; 10 mg Fosfatidilserina; 15 mg (150%*) Sulfato de zinco; 40 mg L-Arginina; 30 mg (37,5%*) Ácido L-Ascórbico (Vit. C); 10 mg Fosfatidilcolina; 50 µg (125%*) Cloreto de crómio; 7 mg (50%*) Fumarato ferroso; 18 mg (112,5%*) Nicotinamida (Vit. B3); 17 mg Lecitina; Espessante: Cera de abelha; 10 mg (83,3%*) D-Alfa-Tocoferol (Vit. E); 4 mg (200%*) Sulfato de manganês; 6 mg (100%*) Pantotenato de cálcio (Vit. B5); 10 mg L-Glutamina; 2 mg Beta-Caroteno (Vit. A); 6 mg Coenzima Q10; 5 mg L-Glutationa; Aroma: Laranja; 1,5 mg (150%*) Sulfato cúprico; Corante: Óxido de ferro; 2 mg (142,9%*) Cloridrato de piridoxina (Vit. B6); 1,4 mg (127,3%*) Mononitrato de tiamina (Vit. B1); 1 µg (40%*) Vitamina B12; 1,6 mg (114,3%*) Riboflavina (Vit. B2); 200 µg (100%*) Ácido fólico (Vit. B9); 5 µg (100%*) Colecalciferol (Vit. D3). * Valor de Referência do Nutriente - Se', '', 1, ' ', ' ', ' ', 23, 20, 35),
(100, 'NUTRICEREBRO 20 MONODOSES', 'Suplemento de monodoses bebíveis, com 14 nutrientes bioativos, entre ácidos gordos essenciais, fosfolípidos naturais, aminoácidos e vitaminas. O DHA contribui para a manutenção de uma normal função cerebral. A Tiamina, Riboflavina, Vitaminas B6, B12 e C contribuem para o funcionamento normal do sistema nervoso. A vitamina E contribui para a proteção das células contra as oxidações indesejáveis. O ácido pantoténico contribui para um desempenho mental normal. - See more at: http://www.calendula.pt/catalogo/nutricerebro-monodoses/#sthash.4asHkdCu.dpuf', '20 MONODOSES 200ml', 32.6, 'CALENDULA', 1, 'Por 1 Monodose: Agentes de volume: Água purificada, Concentrado de ananás, Etanol; 100 mg Lecitina de soja; 100 mg Óleo de peixe (contendo EPA e DHA); 4 mg (285,7%*) Riboflavina (Vitamina B2); 30 mg (37,5%*) Vitamina C; 10 mg (83,3%*) Vitamina E; 10 mg Fosfatidilserina; 10 mg L-Arginina; 10 mg L-Glutamina; 6 mg (428,6%*) Vitamina B6; 5 mg L-Glutationa; 2 mg (33,3%*) Vitamina B5; 1,5 mg (136,4%*) Vitamina B1; 200 µg (100%*) Ácido fólico; 1 µg (40%*) Vitamina B12; Aroma: Ananás; Conservantes: Sorbato de potássio, Benzoato de sódio. * Valor de Referência do Nutriente. - See more at: http://www.calendula.pt/catalogo/nutricerebro-monodoses/#sthash.4asHkdCu.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(101, 'MENOCARE COMPRIMIDOS', 'Suplemento com Isoflavonas de soja, 12 vitaminas e 8 minerais.\r\nO magnésio contribui para o equilibrio dos eletrólitos, para o normal funcionamento do sistema nervoso, para a síntese normal das proteinas, para uma normal função psicológica e para a manutenção de ossos normais.\r\n\r\nA vitamina D contribui para a normal absorção/utilização do cálcio e do fósforo, para níveis normais de cálcio no sangue e para a manutenção de ossos normais.\r\n\r\n- See more at: http://www.calendula.pt/catalogo/menocare/#sthash.vBREsUST.dpuf', '30 COMPRIMIDOS', 17.3, 'CALENDULA', 1, 'Por 1 Comprimido: Agentes de volume: Celulose microcristalina, Fosfato dicálcico; 100 mg (100%*) Óxido de magnésio; 15,77 mg (158%*) Gluconato de zinco; 30 mg (250%*) Acetato de DL-alfa-tocoferol (Vit. E); 6 mg (43%*) Gluconato ferroso; 45 mg (56%*) Ácido L-ascórbico (Vit. C); 30 mg (500%*) D-pantotenato de cálcio (B5); Agentes de revestimento: Hidroxipropil-metilcelulose, Celulose microcristalina, Talco, Glicerol, Dióxido de titânio, Corante vermelho, Corante castanho; 20 mg Isoflavonas de soja; 20 mg (125%*) Nicotinamida (Vit. B3); Antiaglomerante: Sais de magnésio de ácidos gordos; 10 mg (714%*) Cloridrato de piridoxina (Vit. B6); 10 mg (909%*) Cloridrato de tiamina (Vit. B1); 0,009 mg (360%*) Cianocobalamina (Vit. B12); 1 mg (100%*) Gluconato cúprico; 5 mg (357%*) Riboflavina (Vit. B2); 0,75 mg (94%*) Acetato de retinol (Vit. A); 0,5 mg (25%*) Gluconato de manganês; 5 µg (100%*) Colecalciferol (Vit.D); 50 µg (125%*) Picolinato de crómio; 0,4 mg (200%*) Ácido pteroilmonoglutâmico (B', '', 1, ' ', ' ', ' ', 23, 20, 35),
(102, 'HEPADETOX AMPOLAS', 'Suplemento com Alcachofra, Cardo Mariano, Dente de Leão, Boldo, Hortelã-pimenta, Vara-de-ouro, Bétula, Gatunha e Cavalinha. - See more at: http://www.calendula.pt/catalogo/hepadetox-amp/#sthash.EWeXkvIa.dpuf', '20 AMPOLAS - 200ml', 27.3, 'CALENDULA', 1, 'Por 1 Ampola: Agentes de transporte: Água, Álcool; 1206,5 mg Solidago virgaurea; 315,4 mg Betula pendula, 234,5 mg Cynara scolymus; 163,2 mg Silybum marianum; 121,6 mg Ononis spinosa; 104,5 mg Equisetum arvense; 61,3 mg Taraxacum officinalis; 35,6 mg Peumus boldus; 15 mg Menta piperita. - See more at: http://www.calendula.pt/catalogo/hepadetox-amp/#sthash.EWeXkvIa.dpuf', '', 1, ' ', ' ', ' ', 23, 20, 35),
(103, 'DRENA MAIS ORIGINAL', '', 'EMBALAGEM DE 500ml', 21.75, 'CHI', 1, 'Alcachofra (Cynara scolymus) 2 mlCardo Mariano (Silybum marianum) 2 mlVidoeiro (Betula alba) 1 mlBeterraba (Betula vulgaris) 1 mlNogueira (Juglans regia) 1 mlAmieiro (Alnus glutinosa) 1 mlSalsa (Petroselinum sativum) 1 mlLimão (Citrus limonum) 1 mlMagnésio (Cloreto) 150 mgÁcido Málico 100 mgÁcido Citríco 100 mgÁcido Láctico 50 mgClorofila 1 mg', '', 1, ' ', ' ', ' ', 23, 20, 35),
(104, 'DRENA MAIS PERNAS', '', 'EMBALAGEM DE 500ml', 23.35, 'CHI', 1, 'Alcachofra (Cynara scolymus) 4 mlCardo Mariano (Silybum marianum) 4 mlVidoeiro (Betula alba) 2 mlBeterraba (Betula vulgaris) 2 mlNogueira (Juglans regia) 2 mlAmieiro (Alnus glutinosa) 2 mlSalsa (Petroselinum sativum) 2 mlLimão (Citrus limonum) 2 mlVideira Vermelha (Vitis vinifera) 2 mlMirtilo (Vaccinium myrtillus) 2 mlCastanha-da-Índia (Aesculus hippocastanum) 2 mlMagnésio 300 mgÁcido Málico 200 mgÁcido Citríco 200 mgÁcido Láctico 100 mgClorofila 2 mg', '', 1, ' ', ' ', ' ', 23, 20, 35),
(105, 'DRENA MAIS INTENSIV', '', 'EMBALAGEM DE 500ml', 23.8, 'CHI', 1, 'Alcachofra (Cynara scolymus) 5 mlCardo Mariano (Silybum marianum) 5 mlVidoeiro (Betula alba) 3 mlBeterraba (Betula vulgaris) 3 mlNogueira (Juglans regia) 3 mlAmieiro (Alnus glutinosa) 3 mlSalsa (Petroselinum sativum) 3 mlLimão (Citrus limonum) 3 mlMagnésio (Cloreto) 300 mgÁcido Málico 200 mgÁcido Citríco 200 mgÁcido Láctico 100 mgClorofila 2 mg', '', 1, ' ', ' ', ' ', 23, 20, 35),
(106, 'DRENA MAIS SPORT', '', 'EMBALAGEM 500ml', 23.8, 'CHI', 1, 'Alcachofra (Cynara scolymus) 4 mlCardo Mariano (Silybum marianum) 4 mlAmieiro (Alnus glutinosa) 3 mlSalsa (Petroselinum sativum) 3 mlChá de Java (Orthosiphon stamineus) 2 mlCafé Verde (Coffea arabica) 2 mlL-Carnitina 700 mgEpigalhocatequinas 80 mgBoro 2 mg', '', 1, ' ', ' ', ' ', 23, 20, 35),
(107, 'DRENA MAIS SKIN', '', 'EMBALAGEM 500ml', 29.74, 'CHI', 1, 'Alcachofra (Cynara scolymus) 3000 mg *Cardo Mariano (Silybum marianum) 3000 mg *Colagénio Marinho 2000 mg *Vidoeiro (Betula alba) 1500 mg *Beterraba (Betula vulgaris) 1500 mg *Nogueira (Juglans regia) 1500 mg *Amieiro (Alnus glutinosa) 1500 mg *Salsa (Petroselinum sativum) 1500 mg *Limão (Citrus limonum) 1500 mg *Ácido hialurónico 500 mg *Vitamina C 500 mg 625%Magnésio 300 mg 80%Ácido málico 200 mg *Ácido cítrico 200 mg *Ácido láctico 100 mg *Vitamina E 80 mg 667%Clorofila 2 mg *', '', 1, ' ', ' ', ' ', 23, 20, 35),
(108, 'HEPABIL DETOX AMPOLAS', '', '30 AMPOLAS', 38.3, 'CHI', 1, 'Brututu (Cochlospermum angolense) 1 mlAlcachofra (Cynara scolymus) 0,85 mlCardo mariano (Silybum marianum) 0,75 mlBoldo (Peumus Boldus) 0,5 mlTaráxaco (Taraxacum officinale) 0,5 mlRábano Negro (Raphanus sativus) 0,5 mlZimbro (Juniperus communis) 0,25 mlQuina 0,25 mlColina 125 mgInositol 125 mgÁcido Málico 125 mg', '', 1, ' ', ' ', ' ', 23, 20, 35),
(109, 'ALCACHOFRA 1500mg ONE A DAY', '', 'EMBALAGEM DE 30 AMPOLAS BEBIVEIS DE 10ml', 27.15, 'CHI', 1, 'Alcachofra, Cynara scolumus (1) 1000 mgAlcachofra, Cynara scolumus (2) 500 mg\r\n(1) Extrato líquido 1:3\r\n(2) Extrato seco 5:3', '', 1, ' ', ' ', ' ', 23, 20, 35);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_age`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `product_age`;
CREATE TABLE IF NOT EXISTS `product_age` (
  `idProduct` int(11) NOT NULL,
  `id_age` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`id_age`),
  KEY `fgn_key_age_product` (`id_age`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `product_age`
--

INSERT INTO `product_age` (`idProduct`, `id_age`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_category`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `idProduct` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`idCategory`),
  KEY `fgn_key_category_product` (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `product_category`
--

INSERT INTO `product_category` (`idProduct`, `idCategory`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_gender`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `product_gender`;
CREATE TABLE IF NOT EXISTS `product_gender` (
  `idProduct` int(11) NOT NULL,
  `id_gender` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`id_gender`),
  KEY `fgn_key_gender_product` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `product_gender`
--

INSERT INTO `product_gender` (`idProduct`, `id_gender`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_pathologies`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `product_pathologies`;
CREATE TABLE IF NOT EXISTS `product_pathologies` (
  `idProduct` int(11) NOT NULL,
  `idPathology` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`idPathology`) USING BTREE,
  KEY `fgn_key_pathologies` (`idPathology`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `product_pathologies`
--

INSERT INTO `product_pathologies` (`idProduct`, `idPathology`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rubricas`
--
-- Criação: 12-Jul-2015 às 00:46
-- Última actualização: 19-Maio-2016 às 00:44
-- Última Verificação: 19-Ago-2016 às 16:53
--

DROP TABLE IF EXISTS `rubricas`;
CREATE TABLE IF NOT EXISTS `rubricas` (
  `idRubrica` int(11) DEFAULT NULL,
  `Data` varchar(33) DEFAULT NULL,
  `Titulo` varchar(210) DEFAULT NULL,
  `Conteudo` varchar(21000) DEFAULT NULL,
  `Imagem` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rubricas`
--

INSERT INTO `rubricas` (`idRubrica`, `Data`, `Titulo`, `Conteudo`, `Imagem`) VALUES
(1, '2012-09-17', 'Dieta é coisa de mulher? ', 'A maioria dos homens preocupa-se pouco com estética e saúde, nomeadamente com o peso, pois considera que tal preocupação é apenas coisa de mulheres. Esta falta de cuidado leva consequentemente a um aumento de problemas de saúde ligados ao excesso de peso. As mulheres portuguesas estão a ganhar a luta contra a obesidade, mas com o sexo masculino está a acontecer exactamente o contrário.\n\nComparando os dois estudos de prevalência nacional da obesidade, coordenados pela médica Isabel do Carmo, entre 1995/1998 e 2003/2005, constatou-se que o problema do excesso de peso e obesidade estava a aumentar, atingindo já no último trabalho 53,6 por cento do total. Embora a situação esteja a melhorar no que diz respeito ao sexo feminino, que apresentava no primeiro estudo uma prevalência de obesidade de 14,4 por cento a qual desceu para 13,4 por cento, verificou-se o contrário no sexo oposto: 12,9 por cento dos homens apresentavam obesidade no primeiro estudo, mas no segundo a taxa subiu para 15 por cento.\n\nO tipo de obesidade mais comum nos homens é a andróide, que se caracteriza pela acumulação do tecido adiposo (gordura) na parte superior do corpo, sobretudo no abdómen, essa terrível “barriga”. A obesidade visceral está associada a complicações metabólicas (diabetes tipo II e dislipidémia) e doenças cardiovasculares (hipertensão arterial, doença coronária e doença vascular cerebral) bem como a disfunção endotelial (deterioração do revestimento interior dos vasos sanguíneos) entre outras.\n\nSe a preocupação dos homens com o corpo aumentasse, seria mais fácil travar este aumento de obesidade, pois eles perdem peso com maior facilidade do que as mulheres. Segundo um estudo publicado no Journal of Human Nutrition, constatou-se que, em 12 semanas, 91% dos homens que fizeram dieta e foram incluídos na pesquisa perderam 5% do seu peso. No entanto apenas 53% das mulheres conseguiram perder esse valor percentual de peso no mesmo período. Uma das razões para que os homens sejam mais bem sucedidos é que têm, em geral, mais massa muscular do que as mulheres e, por isso, queimam energia mais rapidamente.\n\nA aquisição de hábitos alimentares saudáveis é muito mais do que perda de peso: permite ganhos na saúde, reduzindo significativamente o aparecimento de patologias associadas à obesidade. Seja homem!... e procure ter hábitos alimentares saudáveis. \n', 'imagens/rubrica/2012-09-17.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--
-- Criação: 17-Fev-2017 às 03:07
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `phone` int(11) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `nif` int(11) NOT NULL,
  `password` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(50) NOT NULL,
  `createdIn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL DEFAULT '1',
  `nameCompany` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `phone`, `mobile`, `email`, `nif`, `password`, `status`, `token`, `createdIn`, `type`, `nameCompany`) VALUES
(22, 'Joel', 'Simoes', 0, 0, 'joel@publimaster.com', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 1, '1f53b89a1ea90340cb08b9319a43505d493cac56', '2016-10-05 22:42:24', 1, NULL),
(23, 'Joel', 'simoes', 0, 0, 'geral@healthydiet.pt', 123456789, 'b1bb5c0b143e3185ebbc6731cc3a56551f8775ce', 1, '26922bf293acbe6baf1805e835741dda453de1ce', '2016-10-05 22:42:24', 1, NULL),
(24, 'manel', 'teste', 249321761, 912675810, 'formigasimoes@hotmail.coma', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 1, '3bb220cfc3414112e0a55da4482dc59926dc045f', '2016-10-05 22:42:24', 1, NULL),
(27, 'asd', 'asdf', 0, 0, 'a@a.com', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, '5ea13f75f45de64f7c9a9987ec62c82c2b3df036', '2016-10-05 22:42:24', 1, NULL),
(35, 'Joel', 'Simões', 914561361, 914561361, 'joelcostasimoes@gmail.com', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 1, '256c2238dcba95dc6fc344e57714f789ac8afb66', '2016-10-05 22:42:24', 1, NULL),
(36, 'Eeff', 'Fffg', 111111111, 111111111, 'formigasimoes@hotmail.co', 111111111, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, '9b8ac7b20cb2b25e74deba2db526b04f9fd3637d', '2016-10-05 22:42:24', 1, NULL),
(37, 'odete', 'simoes', 912675810, 912675810, 'formigasimoes@hotmail.com', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 1, 'e3c24f4c79d9728cf588ab766048a601d5124ca6', '2016-10-05 22:42:24', 1, NULL),
(38, 'dfsf', 'afffdsa', 914561361, 914561361, 'formigajoelsim@gmail.d', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, 'c114244a8b670fc3df5abe404b89769854b017c4', '2016-10-05 22:42:24', 1, NULL),
(39, 'dsada', 'dasa', 123456789, 123456789, 'dsa@as.ss', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, '4865560b5850c076cd2fef42f9c79d264337382a', '2016-10-05 22:42:24', 1, NULL),
(40, 'fdsadf', 'fdsa', 123456789, 123456789, 'formigasimes@hotmail.com', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, '933081273799b0d68bb7c5cc2fe7d96f6474b295', '2016-10-05 22:42:24', 1, NULL),
(41, 'Odete', 'Simões', 914561361, 914561361, 'nutritionandwellness34@gmail.com', 123456789, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, '35cb13ea8393dd0f7e39f813ee1f5767e4aea0fd', '2016-10-05 22:42:24', 1, 'Associação Trevo da Vida'),
(42, 'Odete', 'Simões', 914561361, 914561361, 'joel.simoes@doitlean.com', 914561361, '8f30c9234f69537e57e3fe4aa7b7b4fa53fcf1cb', 1, '648653da2ed8c5204c601e401c967a47a66cd83f', '2016-10-05 22:42:24', 2, 'Associação Trevo da Vida');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Limitadores para a tabela `product_age`
--
ALTER TABLE `product_age`
  ADD CONSTRAINT `fgn_key_age_product` FOREIGN KEY (`id_age`) REFERENCES `age` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product_age` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fgn_key_category_product` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product_category` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_gender`
--
ALTER TABLE `product_gender`
  ADD CONSTRAINT `fgn_key_gender_product` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product_gender` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `product_pathologies`
--
ALTER TABLE `product_pathologies`
  ADD CONSTRAINT `fgn_key_pathologies` FOREIGN KEY (`idPathology`) REFERENCES `pathologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
