-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 08, 2018 at 06:53 PM
-- Server version: 5.6.38
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `joelbnrt_nutribem`
--
CREATE DATABASE IF NOT EXISTS `joelbnrt_nutribem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `joelbnrt_nutribem`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `zipNumber` varchar(20) NOT NULL,
  `zipSnumber` varchar(3) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipName` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Portugal',
  `type` varchar(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`id`,`id_user`),
  KEY `address_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `age`
--

DROP TABLE IF EXISTS `age`;
CREATE TABLE IF NOT EXISTS `age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `age`
--

INSERT INTO `age` (`id`, `name`) VALUES
(1, '18 anos - 40 anos'),
(2, '41 anos - 65 anos'),
(3, '> 65 anos');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(350) CHARACTER SET utf16 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(5, 'A. Vogel'),
(6, 'Amaizin'),
(7, 'Bio-Hera'),
(8, 'Bio Top');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card`
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
-- Table structure for table `casos_sucesso`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `casos_sucesso`
--

INSERT INTO `casos_sucesso` (`id_caso`, `nome`, `localidade`, `foto_antes`, `foto_depois`, `idade`, `altura`, `peso_anterior`, `peso_actual`, `tempo_decorrido`, `tamanho_anterior`, `tamanho_actual`) VALUES
(1, 'Cecília Maria Henriques', 'Caxarias', 'imagens/casosSucesso/cecilia_antes.jpg', 'imagens/casosSucesso/cecilia_depois.png', 38, 1.66, 85, 69, '4 meses', 44, 38),
(2, 'Carlos Manuel Pereira', 'Caxarias', 'imagens/casosSucesso/carlospereira_antes.png', 'imagens/casosSucesso/carlosPereira_Depois.jpg', 35, 1.76, 127, 85, '6 meses', 50, 42);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
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
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Feminino'),
(2, 'Masculino');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `sended` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(1000) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `sended`, `error`, `isActive`) VALUES
(15, 'formigasimoes@hotmail.com', 0, NULL, 1),
(14, 'formigasimoes@hotmail.com', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
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
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
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
-- Table structure for table `orders_address`
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
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_address`
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
-- Table structure for table `orders_products`
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
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_products`
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
-- Table structure for table `pathologies`
--

DROP TABLE IF EXISTS `pathologies`;
CREATE TABLE IF NOT EXISTS `pathologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(350) CHARACTER SET utf16 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pathologies`
--

INSERT INTO `pathologies` (`id`, `name`) VALUES
(1, 'Hipertensão'),
(2, 'Colesterol'),
(3, 'Diabetes'),
(4, 'Problemas de Tiroide');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(1500) NOT NULL DEFAULT '',
  `summary` varchar(500) NOT NULL DEFAULT '',
  `price` float NOT NULL,
  `idBrand` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `fgn_key_brands` (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_age`
--

DROP TABLE IF EXISTS `product_age`;
CREATE TABLE IF NOT EXISTS `product_age` (
  `idProduct` int(11) NOT NULL,
  `id_age` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`id_age`),
  KEY `fgn_key_age_product` (`id_age`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `idProduct` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`idCategory`),
  KEY `fgn_key_category_product` (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_gender`
--

DROP TABLE IF EXISTS `product_gender`;
CREATE TABLE IF NOT EXISTS `product_gender` (
  `idProduct` int(11) NOT NULL,
  `id_gender` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`id_gender`),
  KEY `fgn_key_gender_product` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_pathologies`
--

DROP TABLE IF EXISTS `product_pathologies`;
CREATE TABLE IF NOT EXISTS `product_pathologies` (
  `idProduct` int(11) NOT NULL,
  `idPathology` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`,`idPathology`) USING BTREE,
  KEY `fgn_key_pathologies` (`idPathology`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rubricas`
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
-- Dumping data for table `rubricas`
--

INSERT INTO `rubricas` (`idRubrica`, `Data`, `Titulo`, `Conteudo`, `Imagem`) VALUES
(1, '2012-09-17', 'Dieta é coisa de mulher? ', 'A maioria dos homens preocupa-se pouco com estética e saúde, nomeadamente com o peso, pois considera que tal preocupação é apenas coisa de mulheres. Esta falta de cuidado leva consequentemente a um aumento de problemas de saúde ligados ao excesso de peso. As mulheres portuguesas estão a ganhar a luta contra a obesidade, mas com o sexo masculino está a acontecer exactamente o contrário.\n\nComparando os dois estudos de prevalência nacional da obesidade, coordenados pela médica Isabel do Carmo, entre 1995/1998 e 2003/2005, constatou-se que o problema do excesso de peso e obesidade estava a aumentar, atingindo já no último trabalho 53,6 por cento do total. Embora a situação esteja a melhorar no que diz respeito ao sexo feminino, que apresentava no primeiro estudo uma prevalência de obesidade de 14,4 por cento a qual desceu para 13,4 por cento, verificou-se o contrário no sexo oposto: 12,9 por cento dos homens apresentavam obesidade no primeiro estudo, mas no segundo a taxa subiu para 15 por cento.\n\nO tipo de obesidade mais comum nos homens é a andróide, que se caracteriza pela acumulação do tecido adiposo (gordura) na parte superior do corpo, sobretudo no abdómen, essa terrível “barriga”. A obesidade visceral está associada a complicações metabólicas (diabetes tipo II e dislipidémia) e doenças cardiovasculares (hipertensão arterial, doença coronária e doença vascular cerebral) bem como a disfunção endotelial (deterioração do revestimento interior dos vasos sanguíneos) entre outras.\n\nSe a preocupação dos homens com o corpo aumentasse, seria mais fácil travar este aumento de obesidade, pois eles perdem peso com maior facilidade do que as mulheres. Segundo um estudo publicado no Journal of Human Nutrition, constatou-se que, em 12 semanas, 91% dos homens que fizeram dieta e foram incluídos na pesquisa perderam 5% do seu peso. No entanto apenas 53% das mulheres conseguiram perder esse valor percentual de peso no mesmo período. Uma das razões para que os homens sejam mais bem sucedidos é que têm, em geral, mais massa muscular do que as mulheres e, por isso, queimam energia mais rapidamente.\n\nA aquisição de hábitos alimentares saudáveis é muito mais do que perda de peso: permite ganhos na saúde, reduzindo significativamente o aparecimento de patologias associadas à obesidade. Seja homem!... e procure ter hábitos alimentares saudáveis. \n', 'imagens/rubrica/2012-09-17.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
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
(42, 'Odete', 'Simões', 914561361, 914561361, 'joel.simoes@doitlean.com', 914561361, '8f30c9234f69537e57e3fe4aa7b7b4fa53fcf1cb', 1, '648653da2ed8c5204c601e401c967a47a66cd83f', '2016-10-05 22:42:24', 2, 'Associação Trevo da Vida'),
(43, 'Odete', 'Simões', 914561361, 0, 'joelcostasimoes@hotmail.com', 123456789, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'cbc3700c3533630a6e8390e4b25ee9525e703dd3', '2018-10-14 23:44:04', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userAdmin`
--

DROP TABLE IF EXISTS `userAdmin`;
CREATE TABLE IF NOT EXISTS `userAdmin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` text NOT NULL,
  `Email` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fgn_key_brands` FOREIGN KEY (`idBrand`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_age`
--
ALTER TABLE `product_age`
  ADD CONSTRAINT `fgn_key_age_product` FOREIGN KEY (`id_age`) REFERENCES `age` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product_age` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fgn_key_category_product` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product_category` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_gender`
--
ALTER TABLE `product_gender`
  ADD CONSTRAINT `fgn_key_gender_product` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product_gender` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_pathologies`
--
ALTER TABLE `product_pathologies`
  ADD CONSTRAINT `fgn_key_pathologies` FOREIGN KEY (`idPathology`) REFERENCES `pathologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgn_key_product` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
