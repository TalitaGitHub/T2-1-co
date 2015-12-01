-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Out 29, 2014 as 09:34 PM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `cadastro_cliente`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(30) default NULL,
  `estado_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_estado_idx` (`estado_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `estado_id`) VALUES
(2, 'SAO JOAO DA BOA VISTA', 2),
(3, 'AGUAI', 1),
(4, 'VARGEM GRANDE', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(45) default NULL,
  `sobrenome` varchar(45) default NULL,
  `dataNascimento` datetime default NULL,
  `cpf` varchar(14) default NULL,
  `email` varchar(60) default NULL,
  `logradouro` varchar(50) default NULL,
  `numero` varchar(6) default NULL,
  `bairro` varchar(30) default NULL,
  `cep` varchar(9) default NULL,
  `cidade_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  KEY `fk_cidade_idx` (`cidade_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `sobrenome`, `dataNascimento`, `cpf`, `email`, `logradouro`, `numero`, `bairro`, `cep`, `cidade_id`) VALUES
(1, 'talita', 'schiavo', NULL, '41493951874', 'talitacuriasjbv@gmail.com', 'av', '201', 'ped', '13780000', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(30) default NULL,
  `sigla` varchar(2) NOT NULL,
  PRIMARY KEY  (`id`,`sigla`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`, `sigla`) VALUES
(1, 'SAO PAULO', 'SP'),
(2, 'MINAS GERAIS', 'MG'),
(3, 'rio', 'RJ'),
(4, 'Santa Catarina', 'SC');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cidade` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
