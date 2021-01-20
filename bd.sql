CREATE DATABASE  IF NOT EXISTS `livro_corrente` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `livro_corrente`;
-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: livro_corrente
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bibliotecas`
--

DROP TABLE IF EXISTS `bibliotecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibliotecas` (
  `id_biblioteca` int(11) NOT NULL AUTO_INCREMENT,
  `nome_biblioteca` varchar(50) DEFAULT NULL,
  `email_biblioteca` varchar(50) DEFAULT NULL,
  `telefone_biblioteca` varchar(20) DEFAULT NULL,
  `linkRNBC_biblioteca` varchar(100) DEFAULT NULL,
  `estado_biblioteca` char(2) DEFAULT NULL,
  `cidade_biblioteca` varchar(40) DEFAULT NULL,
  `bairro_biblioteca` varchar(40) DEFAULT NULL,
  `logadouro_biblioteca` varchar(40) DEFAULT NULL,
  `numero_biblioteca` varchar(20) DEFAULT NULL,
  `imagem_biblioteca` varchar(50) DEFAULT NULL,
  `latitude_biblioteca` varchar(30) DEFAULT NULL,
  `longitude_biblioteca` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_biblioteca`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecas`
--

LOCK TABLES `bibliotecas` WRITE;
/*!40000 ALTER TABLE `bibliotecas` DISABLE KEYS */;
INSERT INTO `bibliotecas` VALUES (1,'Casa Azul','biblioteca@flip.org.br','(24) 3371-7082','https://rnbc.org.br/biblioteca/casa-azul/','RJ','Paraty','Ilha das Cobras','Rua João Ayres Martins','132','img-bib.png',NULL,NULL),(2,'Ciranda de Tarituba','bccirandadetarituba@gmail.com','','https://rnbc.org.br/biblioteca/ciranda-de-tarituba/','RJ','Paraty','Tarituba','Rua Joaquim Meira dos Santos','9','Ciranda de Tarituba.png',NULL,NULL),(3,'Colibri','contato@colibri.org.br','(24) 3371-4105','https://rnbc.org.br/biblioteca/colibri/','RJ','Paraty','Ponte Branca','Estrada Paraty Cunha','','Colibri.png',NULL,NULL),(4,'Itaxí-Mirim','bibliotecaitaxi@gmail.com','','https://rnbc.org.br/biblioteca/itaxi-mirim/','RJ','Paraty','Paraty-Mirim','Aldeia Itaxî Guarani M\'bya','','Itaxí-Mirim.png',NULL,NULL),(5,'Quilombo Campinho da Independência','quilombodocampinho@gmail.com','','https://rnbc.org.br/biblioteca/quilombo-campinho-da-independencia/','RJ','Paraty','Campinho','Quilombo do Campinho','','Quilombo Campinho da Independência.png',NULL,NULL),(6,'Regina Celia Gama de Miranda','itaeparatyrj@gmail.com','(24) 3371-2601','https://rnbc.org.br/biblioteca/regina-celia-gama-de-miranda-itae/','RJ','Paraty','Parque da Mangueira','Rua José do Patrocínio','975','Regina Celia Gama de Miranda (ITAE).png',NULL,NULL),(7,'Terra e Mar','terraemarparaty@gmail.com','','https://rnbc.org.br/biblioteca/terra-e-mar-itema/','RJ','Paraty','Corumbê','Morro do Ditão','','Terra e Mar (ITEMA).png',NULL,NULL),(8,'Cantinho da Imaginação','bccantinhodaimaginacao@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/cantinho-da-imaginacao/','RJ','Nova Iguaçu','Jardim Iguaçu',' Rua Maria Tereza','166','img-bib.png',NULL,NULL),(9,'Espaço de Leitura Nilo Sérgio','','','https://rnbc.org.br/biblioteca/espaco-de-leitura-nila-sergio/','RJ','Nova Iguaçu','Ouro Preto','Rua Filipe Pereira','341','img-bib.png',NULL,NULL),(10,'Jardim Alvorada','bcjardimalvorada@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/jardim-alvorada/','RJ','Nova Iguaçu','Jardim Alvorada','Av. Abílio Augusto Távora','120','img-bib.png',NULL,NULL),(11,'Jardim Primavera','','','https://rnbc.org.br/biblioteca/jardim-primavera/','RJ','Nova Iguaçu','Comendador Soares','Rua Ministro Lafaiete de Andrade','450','img-bib.png',NULL,NULL),(12,'Jota Rodrigues','bcjotarodrigues@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/jota-rodrigues/','RJ','Nova Iguaçu','Comendador Soares','Rua São Luis','78','img-bib.png',NULL,NULL),(13,'Judith Lacaz','bcjudithlacaz@baixadaliteraria.org','(21) 4104-2632','https://rnbc.org.br/biblioteca/judith-lacaz/','RJ','Nova Iguaçu','Ponto Chic','Rua Pedro Cunha','307','Judith Lacaz.png',NULL,NULL),(14,'Livro Social','bclivrosocial@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/livro-social/','RJ','Nova Iguaçu','Vila de Cava','Estrada do Vilar','284','img-bib.png',NULL,NULL),(15,'Mágica','bcmagica@baixadaliteraria.org','(21) 2698-3205','https://rnbc.org.br/biblioteca/magica/','RJ','Nova Iguaçu','Vila de Cava','Rua Iracema','156','img-bib.png',NULL,NULL),(16,'Dona Corujinha','bcdonacorujinha@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/olhar-cultural/','RJ','Nova Iguaçu','Cerâmica','Rua Manoel Alegrio','55-Bloco 4-aptº101','Dona Corujinha.png',NULL,NULL),(17,'Paulo Freire','bcpaulofreire@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/paulo-freire/','RJ','Nova Iguaçu','Rancho Fundo','Av. Paranapiacaba','129-Fundos','img-bib.png',NULL,NULL),(18,'Paulo Sacramento','bcpaulosacramento@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/paulo-sacramento/','RJ','Nova Iguaçu','Austin','Rua Tufão','170','img-bib.png',NULL,NULL),(19,'Thalita Rebouças','bcthalitareboucas@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/thalita-reboucas/','RJ','Nova Iguaçu','Amaral','Estrada do Amaral','791','img-bib.png',NULL,NULL),(20,'Três Marias','bctresmarias@baixadaliteraria.org','','https://rnbc.org.br/biblioteca/tres-marias/','RJ','Nova Iguaçu','Cabuçu',' Av. Severino Pereira da Silva','','img-bib.png',NULL,NULL),(21,'União do Saber','bcuniaodosaber@baixadaliteraria.org','(21) 3488-0327','https://rnbc.org.br/biblioteca/uniao-do-saber/','RJ','Nova Iguaçu','Posse','Rua Império','465','União do Saber.png',NULL,NULL),(22,'Ziraldo','bcziraldo@baixadaliteraria.org','(21) 2779-2552','https://rnbc.org.br/biblioteca/ziraldo/','RJ','Nova Iguaçu','Vila de Cava','Rua Muniz Barreto','1010','img-bib.png',NULL,NULL),(23,'Coletivo Tapete Literário','tapeteliterario@gmail.com','(21) 99912-1040','https://rnbc.org.br/biblioteca/coletivo-tapete-literario/','RJ','Duque de Caxias','Jardim Primavera','Rua D','15','Coletivo Tapete Literário.png',NULL,NULL),(24,'Espaço Literário Balaio de Leitura','balaiodeleitura@gmail.com','(21) 98111-5540','https://rnbc.org.br/biblioteca/espaco-literario-balaio-de-leitura/','RJ','Duque de Caxias','Jardim Primavera','Rua Onofre Silva','','Espaço Literário Balaio de Leitura.png',NULL,NULL),(25,'Espaço Literário Gigi Guerra','saladeleituraluar@gmail.com','(21) 98363-3956','https://rnbc.org.br/biblioteca/espaco-literario-gigi-guerra/','RJ','Duque de Caxias','Jardim Primavera','Rua La Rouche Foucault','151','Espaço Literário Gigi Guerra.png',NULL,NULL),(26,'Josimar Coelho da Silva','bcjosimarcoelhodasilva2020@gmail.com','(21) 99430-6937','https://rnbc.org.br/biblioteca/josimar-coelho-da-silva/','RJ','Duque de Caxias','Jardim Primavera','Rua Professor Hélio Rangel','911','Josimar Coelho da Silva.png',NULL,NULL),(27,'MANNS','mchocobim@yahoo.com.br','(21) 97627-1091','https://rnbc.org.br/biblioteca/manns/','RJ','Duque de Caxias','Saracuruna','Av. Carlos Maia','8','MANNS.png',NULL,NULL),(28,'Varanda Literária Maria de Lourdes Miranda','bcmlm123@gmail.com','(21) 2677-0454','https://rnbc.org.br/biblioteca/varada-literaria-maria-de-lourdes-miranda/','RJ','Duque de Caxias','Saracuruna','Rua José Fichiman','655','Varanda Literária Maria de Lourdes Miranda.png',NULL,NULL),(29,'Vila Aracy','bibliotecacomunitariavilaaracy@gmail.com','(21) 3656-0702','https://rnbc.org.br/biblioteca/vila-aracy/','RJ','Duque de Caxias','Parada Angélica','Rua Américo Klarc Leite','','Vila Aracy.png',NULL,NULL);
/*!40000 ALTER TABLE `bibliotecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_funcionario` varchar(30) DEFAULT NULL,
  `senha_funcionario` varchar(30) DEFAULT NULL,
  `nome_funcionario` varchar(50) DEFAULT NULL,
  `telefone_funcionario` varchar(20) DEFAULT NULL,
  `email_funcionario` varchar(50) DEFAULT NULL,
  `cpf_funcionario` varchar(11) DEFAULT NULL,
  `atividade_funcionario` text,
  `id_biblioteca_fk` int(11) DEFAULT NULL,
  `valido_funcionario` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id_funcionario`),
  KEY `id_biblioteca_fk` (`id_biblioteca_fk`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Renata','12345','Renata Lima da Silva','219002221000','renata@email.com','12276298172','Bibliotecária',0,_binary '\0'),(2,'Renata','12345','Renata Lima','210000000000','renata@email','00002222111','Estagiária',2,_binary '\0');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiros`
--

DROP TABLE IF EXISTS `parceiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiros` (
  `id_parceiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_parceiro` varchar(50) DEFAULT NULL,
  `cnpj_parceiro` varchar(20) DEFAULT NULL,
  `estado_parceiro` char(2) DEFAULT NULL,
  `cidade_parceiro` varchar(40) DEFAULT NULL,
  `bairro_parceiro` varchar(40) DEFAULT NULL,
  `logadouro_parceiro` varchar(40) DEFAULT NULL,
  `numero_parceiro` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_parceiro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiros`
--

LOCK TABLES `parceiros` WRITE;
/*!40000 ALTER TABLE `parceiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `numeroExemplar_pedido` int(1) DEFAULT NULL,
  `capa_pedido` varchar(1000) DEFAULT 'imagemPadrao.png',
  `titulo_pedido` varchar(50) DEFAULT NULL,
  `genero_pedido` varchar(50) DEFAULT NULL,
  `autor_pedido` varchar(35) DEFAULT NULL,
  `valido_pedido` bit(1) DEFAULT b'1',
  `id_biblioteca_fk` int(11) DEFAULT NULL,
  `id_funcionario_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_biblioteca_fk` (`id_biblioteca_fk`),
  KEY `id_funcionario_fk` (`id_funcionario_fk`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'imagemPadrao.png','Harry Potter','Ficção',NULL,_binary '',16,NULL),(2,2,'imagemPadrao.png','Em Ritmo De Fuga','Ação',NULL,_binary '',9,NULL),(3,3,'imagemPadrao.png','Toy Story','Infantil',NULL,_binary '',25,NULL),(4,1,'imagemPadrao.png','A Fabrica de Chocolate','Ficção',NULL,_binary '',23,NULL),(5,3,'imagemPadrao.png','Malala','Biografia',NULL,_binary '',0,NULL),(6,1,'imagemPadrao.png','O Pequeno Príncipe','Fábula',NULL,_binary '',2,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rede_biblioteca`
--

DROP TABLE IF EXISTS `rede_biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rede_biblioteca` (
  `id_rede_fk` int(11) DEFAULT NULL,
  `id_biblioteca_fk` int(11) DEFAULT NULL,
  KEY `id_rede_fk` (`id_rede_fk`),
  KEY `id_biblioteca_fk` (`id_biblioteca_fk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rede_biblioteca`
--

LOCK TABLES `rede_biblioteca` WRITE;
/*!40000 ALTER TABLE `rede_biblioteca` DISABLE KEYS */;
INSERT INTO `rede_biblioteca` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29);
/*!40000 ALTER TABLE `rede_biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes`
--

DROP TABLE IF EXISTS `redes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redes` (
  `id_rede` int(11) NOT NULL AUTO_INCREMENT,
  `nome_rede` varchar(50) DEFAULT NULL,
  `email_rede` varchar(50) DEFAULT NULL,
  `cidade_rede` varchar(40) DEFAULT NULL,
  `estado_rede` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_rede`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes`
--

LOCK TABLES `redes` WRITE;
/*!40000 ALTER TABLE `redes` DISABLE KEYS */;
INSERT INTO `redes` VALUES (1,'Mar de Leitores','mardeleitores@gmail.com','Paraty','RJ'),(2,'Rede Baixada Literária','baixadaliteraria2010@yahoo.com.br','Nova Iguaçu','RJ'),(3,'Tecendo Uma Rede de Leitura','polotecendoumarededeleitura@gmail.com','Duque de Caxias','RJ');
/*!40000 ALTER TABLE `redes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntarios`
--

DROP TABLE IF EXISTS `voluntarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voluntarios` (
  `id_voluntario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_voluntario` varchar(30) DEFAULT NULL,
  `senha_voluntario` varchar(30) DEFAULT NULL,
  `nome_voluntario` varchar(50) DEFAULT NULL,
  `telefone_voluntario` varchar(20) DEFAULT NULL,
  `email_voluntario` varchar(50) DEFAULT NULL,
  `cpf_voluntario` char(11) DEFAULT NULL,
  `bairro1_voluntario` varchar(40) DEFAULT NULL,
  `bairro2_voluntario` varchar(40) DEFAULT NULL,
  `bairro3_voluntario` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_voluntario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntarios`
--

LOCK TABLES `voluntarios` WRITE;
/*!40000 ALTER TABLE `voluntarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `voluntarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'livro_corrente'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-20 18:22:52
