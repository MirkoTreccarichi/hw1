-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hm1
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assunzione_passata`
--

DROP TABLE IF EXISTS `assunzione_passata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assunzione_passata` (
  `id_operatore` int(11) NOT NULL,
  `id_punto_vendita` int(11) NOT NULL,
  `data_assunzione` date NOT NULL,
  `data_licenziamento` date DEFAULT NULL,
  PRIMARY KEY (`id_operatore`,`id_punto_vendita`,`data_assunzione`),
  KEY `idx_id_operatore` (`id_operatore`),
  KEY `idx_id_punto_vendita` (`id_punto_vendita`),
  CONSTRAINT `assunzione_passata_ibfk_1` FOREIGN KEY (`id_operatore`) REFERENCES `operatore` (`id`),
  CONSTRAINT `assunzione_passata_ibfk_2` FOREIGN KEY (`id_punto_vendita`) REFERENCES `punto_vendita` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunzione_passata`
--

LOCK TABLES `assunzione_passata` WRITE;
/*!40000 ALTER TABLE `assunzione_passata` DISABLE KEYS */;
INSERT INTO `assunzione_passata` VALUES (1,1,'2018-01-20','2018-02-20'),(1,1,'2020-01-20','2020-02-20'),(2,1,'2015-01-20','2015-02-20'),(2,2,'2012-01-20','2020-02-20'),(2,2,'2015-01-20','2015-02-20'),(2,4,'2012-01-20','2020-02-20'),(3,1,'2015-01-20','2015-02-20'),(3,3,'2012-01-20','2020-02-20');
/*!40000 ALTER TABLE `assunzione_passata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Luca','Chisari','1999-11-30','ciao0@gmail.com',''),(2,'Emanuele','Andaloro','1999-05-30','ciao1@gmail.com',''),(3,'Fabio','Castiglione','1999-07-10','ciao2@gmail.com',''),(4,'Giorgia','Arena','1999-12-24','ciao3@gmail.com',''),(5,'Sebastiano','Castiglione','1995-12-24','ciao4@gmail.com',''),(6,'Angelo','Sorbello','1967-05-11','ciao5@gmail.com',''),(7,'Robert','Greco','1980-01-23','ciao6@gmail.com',''),(8,'Marina','Terna','1997-08-31','ciao7@gmail.com',''),(9,'Carmelo','Parisi','2000-06-01','ciao8@gmail.com',''),(10,'Serena','Ventura','1992-03-21','ciao9@gmail.com',''),(11,'Giacomo','Di Maria','1999-11-10','ciao10@gmail.com',''),(12,'admin','','0000-00-00','admin','$2y$10$lr7OSJ30ykBvO0csNkHb5OLQTVYfJdmmpWg4nAbriS5XNMd7d9Lya');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista`
--

DROP TABLE IF EXISTS `lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista` (
  `id_cliente` int(11) NOT NULL,
  `codice_prodotto` int(11) NOT NULL,
  `quantita_prodotto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`codice_prodotto`),
  KEY `codice_prodotto` (`codice_prodotto`),
  CONSTRAINT `lista_ibfk_1` FOREIGN KEY (`codice_prodotto`) REFERENCES `prodotto` (`codice`),
  CONSTRAINT `lista_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista`
--

LOCK TABLES `lista` WRITE;
/*!40000 ALTER TABLE `lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatore`
--

DROP TABLE IF EXISTS `operatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `imposte` float DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `stipendio` float DEFAULT NULL,
  `id_punto_vendita` int(11) DEFAULT NULL,
  `data_Assunzione` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_punto_vendita` (`id_punto_vendita`),
  CONSTRAINT `operatore_ibfk_1` FOREIGN KEY (`id_punto_vendita`) REFERENCES `punto_vendita` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatore`
--

LOCK TABLES `operatore` WRITE;
/*!40000 ALTER TABLE `operatore` DISABLE KEYS */;
INSERT INTO `operatore` VALUES (1,'Mario','Rossi',500,2000,1500,1,'2020-01-20'),(2,'Luca','Chisari',500,2000,1500,5,'2020-02-15'),(3,'Nicola','Ferrari',1000,2500,2000,3,'2020-07-08'),(4,'Enzo','Ferrari',1000,2500,2000,4,'2020-07-08'),(5,'Ezio','Greggio',1000,2500,2000,1,'2020-07-08'),(6,'Gerry','Scotty',1000,2500,2000,1,'2020-07-08');
/*!40000 ALTER TABLE `operatore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger calcolo_costo_operatore
before insert on operatore
for each row
begin

	set new.costo = new.imposte + new.stipendio; 
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotto` (
  `codice` int(11) NOT NULL,
  `produttore` varchar(255) DEFAULT NULL,
  `prezzo_punti` int(11) DEFAULT NULL,
  `prezzo` float DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (0,'Barilla',NULL,1,'prodotto','farfalle','img/prodotti/farfalle_barilla.jpg'),(1,'Divella',NULL,1.5,'prodotto','orecchiette','img/prodotti/orecchiette_divella.jpg'),(2,'Sole',NULL,2,'prodotto','detersivo lavanda','img/prodotti/sole_detersivo_lavatrice_lavanda.jpg'),(3,'Mulino Bianco',NULL,3.7,'prodotto','tarallucci','img/prodotti/tarallucci_mulino_bianco.jpg'),(4,'Dash',NULL,2.8,'prodotto','pods','img/prodotti/pods_PeG_dash.jpg'),(5,'Gillette',NULL,7.8,'prodotto','rasoio','img/prodotti/rasoio_PeG_gillette.png'),(10,'Tupperware',100,15.7,'premio','bottiglie','img/prodotti/tupperware_bottiglie.jpg'),(11,'Tupperware',70,10,'premio','ciotole meraviglia','img/prodotti/tupperware_ciotole_meraviglia.jpg'),(12,'Tupperware',20,1,'premio','contenitori pinguino','img/prodotti/tupperware_contenitori_pinguino.jpg'),(13,'Tupperware',40,3,'premio','multichief','img/prodotti/tupperware_multichef.jpg'),(14,'Tupperware',2000,20,'premio','portavivande','img/prodotti/tupperware_portavivande.jpg');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `punti_clienti`
--

DROP TABLE IF EXISTS `punti_clienti`;
/*!50001 DROP VIEW IF EXISTS `punti_clienti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `punti_clienti` (
  `id_cliente` tinyint NOT NULL,
  `totale_punti` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `punto_vendita`
--

DROP TABLE IF EXISTS `punto_vendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punto_vendita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indirizzo` varchar(255) DEFAULT NULL,
  `citta` varchar(255) DEFAULT NULL,
  `partita_iva` varchar(255) DEFAULT NULL,
  `src_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_vendita`
--

LOCK TABLES `punto_vendita` WRITE;
/*!40000 ALTER TABLE `punto_vendita` DISABLE KEYS */;
INSERT INTO `punto_vendita` VALUES (1,'Via fantasia','Cesar├▓','IT000001','img/Localit├á/1200px-Panorama_di_Cesar├▓_4.jpg'),(2,'Via Roma','Catania','IT000002','img/Localit├á/cta-catania-port-1b.jpg.image.750.563.low.jpg'),(3,'Via Firenze','Taormina','IT000003','img/Localit├á/isola-bella-taormina-panorama-scaled.jpg'),(4,'Via Regina Elena','Randazzo','IT000004','img/Localit├á/Chiesa_di_San_Nicola,_Randazzo_Catania,_Sicily,_Italy_-_panoramio_(1).jpg'),(5,'Via della Vittoria','Giardini','IT000005','img/Localit├á/Giardini.jpg'),(6,'Via Carlo Max','Adrano','IT000006','img/Localit├á/Adrano-e1402324121948.jpg');
/*!40000 ALTER TABLE `punto_vendita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrazione`
--

DROP TABLE IF EXISTS `registrazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazione` (
  `data_registrazione` datetime NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_punto_vendita` int(11) NOT NULL,
  PRIMARY KEY (`data_registrazione`,`id_punto_vendita`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_punto_vendita` (`id_punto_vendita`),
  CONSTRAINT `registrazione_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `registrazione_ibfk_2` FOREIGN KEY (`id_punto_vendita`) REFERENCES `punto_vendita` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrazione`
--

LOCK TABLES `registrazione` WRITE;
/*!40000 ALTER TABLE `registrazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ritiro`
--

DROP TABLE IF EXISTS `ritiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ritiro` (
  `numero_scheda` int(11) NOT NULL,
  `id_punto_vendita` int(11) NOT NULL,
  `codice_prodotto` int(11) NOT NULL,
  `data_ritiro` datetime NOT NULL,
  PRIMARY KEY (`numero_scheda`,`id_punto_vendita`,`codice_prodotto`,`data_ritiro`),
  KEY `idx_id_punto_vendita` (`id_punto_vendita`),
  CONSTRAINT `ritiro_ibfk_1` FOREIGN KEY (`numero_scheda`) REFERENCES `scheda` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ritiro`
--

LOCK TABLES `ritiro` WRITE;
/*!40000 ALTER TABLE `ritiro` DISABLE KEYS */;
INSERT INTO `ritiro` VALUES (1,1,11,'2020-12-23 18:00:00'),(1,2,11,'2020-01-23 12:00:00'),(2,1,11,'2020-09-27 13:00:00'),(3,4,11,'2020-12-23 17:00:00');
/*!40000 ALTER TABLE `ritiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheda`
--

DROP TABLE IF EXISTS `scheda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheda` (
  `Numero` int(11) NOT NULL,
  `id_punto_vendita` int(11) NOT NULL,
  `punteggio` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Numero`,`id_punto_vendita`),
  KEY `idx_id_cliente` (`id_cliente`),
  CONSTRAINT `scheda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheda`
--

LOCK TABLES `scheda` WRITE;
/*!40000 ALTER TABLE `scheda` DISABLE KEYS */;
INSERT INTO `scheda` VALUES (1,1,0,1),(1,2,0,NULL),(1,4,0,2),(1,5,0,NULL),(2,0,0,NULL),(2,1,0,NULL),(2,2,0,NULL),(2,4,0,10),(2,5,0,NULL),(3,0,0,5),(3,1,0,3),(3,2,0,NULL),(3,4,0,8),(3,5,0,4);
/*!40000 ALTER TABLE `scheda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger premio_gratis
after update 
on scheda
for each row 
begin

	if new.punteggio >= 1000
		then
			insert into ritiro values (new.numero, new.id_punto_vendita,11,current_timestamp());
	end if;
            
	if new.punteggio >= 2000
		then
			insert into ritiro values (new.numero, new.id_punto_vendita,10,current_timestamp()+1);
	end if;
                    
	 if new.punteggio >= 5000
		then
			insert into ritiro values (new.numero, new.id_punto_vendita,14,current_timestamp()+2);
	end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transazione`
--

DROP TABLE IF EXISTS `transazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transazione` (
  `id_cliente` int(11) NOT NULL,
  `id_operatore` int(11) NOT NULL,
  `codice_prodotto` int(11) DEFAULT NULL,
  `data_` datetime NOT NULL,
  `quantita_prodotto` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`id_operatore`,`data_`),
  KEY `idx_id_cliente` (`id_cliente`),
  KEY `idx_id_operatore` (`id_operatore`),
  KEY `idx_codice_prodotto` (`codice_prodotto`),
  CONSTRAINT `transazione_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `transazione_ibfk_2` FOREIGN KEY (`id_operatore`) REFERENCES `operatore` (`id`),
  CONSTRAINT `transazione_ibfk_3` FOREIGN KEY (`codice_prodotto`) REFERENCES `prodotto` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transazione`
--

LOCK TABLES `transazione` WRITE;
/*!40000 ALTER TABLE `transazione` DISABLE KEYS */;
INSERT INTO `transazione` VALUES (1,1,0,'2020-12-23 12:00:00',1),(1,1,1,'2020-12-23 12:00:01',2),(1,1,2,'2020-12-23 12:00:05',3),(1,1,5,'2020-12-23 12:00:07',1),(2,1,0,'2020-12-23 13:00:00',5),(2,1,1,'2020-12-23 13:00:01',15),(2,1,2,'2020-12-23 13:00:05',7),(2,1,5,'2020-12-23 13:00:07',8),(3,1,10,'2020-01-23 12:00:00',1),(3,1,1,'2020-03-23 12:00:01',1),(3,1,2,'2020-04-23 12:00:05',1),(3,1,14,'2020-04-23 12:00:07',1),(3,4,10,'2019-01-23 12:00:00',5),(3,4,1,'2019-03-23 12:00:01',5),(3,4,2,'2019-04-23 12:00:05',5),(3,4,14,'2019-04-23 12:00:07',10),(6,3,0,'2020-09-23 13:00:00',7),(6,3,1,'2020-09-23 13:00:01',7),(6,3,2,'2020-09-23 13:00:05',7),(6,3,5,'2020-09-23 13:00:07',7);
/*!40000 ALTER TABLE `transazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger aggiornamento_punti_clienti
after insert on transazione 
for each row
begin

update scheda as s
set s.punteggio = (select totale_punti from punti_clienti where new.id_cliente = id_cliente)
where new.id_cliente = s.id_cliente
;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `punti_clienti`
--

/*!50001 DROP TABLE IF EXISTS `punti_clienti`*/;
/*!50001 DROP VIEW IF EXISTS `punti_clienti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punti_clienti` AS (select `t`.`id_cliente` AS `id_cliente`,round(sum(`t`.`quantita_prodotto` * `p`.`prezzo`),0) AS `totale_punti` from (`prodotto` `p` join `transazione` `t` on(`p`.`codice` = `t`.`codice_prodotto`)) group by `t`.`id_cliente`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-25  0:10:46
