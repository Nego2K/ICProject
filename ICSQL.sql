-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2020 at 09:41 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `essentialmode`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Concessionnaire', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_police', 256815, NULL),
(2, 'society_cardealer', 494500, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Concesionnaire', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`) VALUES
(2, 'alpha', 60000),
(3, 'baller2', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{\"garage\":[{\"modDoorSpeaker\":-1,\"modHorns\":-1,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"plate\":\"XN73LS34\",\"modArchCover\":-1,\"modAPlate\":-1,\"engineHealth\":1000.0,\"fuelLevel\":65.0,\"modGrille\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"modDashboard\":-1,\"modTank\":-1,\"color2\":134,\"modTurbo\":false,\"modArmor\":-1,\"modTransmission\":-1,\"windowTint\":-1,\"color1\":134,\"modSpoilers\":-1,\"modOrnaments\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modHood\":-1,\"modDial\":-1,\"modAerials\":-1,\"wheels\":1,\"modFender\":-1,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"plateIndex\":4,\"modAirFilter\":-1,\"modExhaust\":-1,\"modSideSkirt\":-1,\"modLivery\":0,\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modVanityPlate\":-1,\"model\":2046537925,\"modSeats\":-1,\"modTrunk\":-1,\"wheelColor\":156,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"extras\":{\"2\":true,\"1\":false},\"modRightFender\":-1,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":-1,\"modWindows\":-1,\"modEngineBlock\":-1,\"modFrontBumper\":-1,\"pearlescentColor\":0,\"modBrakes\":-1,\"dirtLevel\":4.0,\"modTrimA\":-1,\"modRoof\":-1},{\"modDoorSpeaker\":-1,\"modHorns\":-1,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"plate\":\"LZ59TL25\",\"modArchCover\":-1,\"modAPlate\":-1,\"modDashboard\":-1,\"fuelLevel\":65.0,\"modGrille\":-1,\"modStruts\":-1,\"modRoof\":-1,\"modHydrolic\":-1,\"extras\":{\"2\":true,\"1\":false},\"plateIndex\":4,\"modXenon\":false,\"color2\":134,\"modOrnaments\":-1,\"modArmor\":-1,\"modTransmission\":-1,\"windowTint\":-1,\"color1\":134,\"modSpoilers\":-1,\"modFender\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modHood\":-1,\"modDial\":-1,\"modAerials\":-1,\"wheels\":1,\"modTurbo\":false,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"engineHealth\":1000.0,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"modLivery\":5,\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modExhaust\":-1,\"model\":2046537925,\"modSeats\":-1,\"modTrunk\":-1,\"wheelColor\":156,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"pearlescentColor\":0,\"modRightFender\":-1,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"dirtLevel\":7.0,\"modFrontWheels\":-1,\"modEngineBlock\":-1,\"modFrontBumper\":-1,\"modWindows\":-1,\"modBrakes\":-1,\"modSpeakers\":-1,\"modTrimA\":-1,\"modTank\":-1}],\"weapons\":[{\"name\":\"WEAPON_ADVANCEDRIFLE\",\"count\":0},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"count\":0}]}');

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('cardealer', 'Concessionnaire', 0),
('desempregado', 'Desempregado', 0),
('police', 'LSPD', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'desempregado', 0, 'desempregado', 'Autônomo', 200, '{}', '{}'),
(2, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(3, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
(4, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(6, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
(7, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(8, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(9, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(10, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
('society:police', '68RUM732', '{\"modDashboard\":-1,\"modOrnaments\":-1,\"modPlateHolder\":-1,\"modTurbo\":false,\"wheels\":1,\"modRoof\":-1,\"modTank\":-1,\"neonColor\":[255,0,255],\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modEngine\":-1,\"modSmokeEnabled\":false,\"modSuspension\":-1,\"modSpeakers\":-1,\"modStruts\":-1,\"modTrimB\":-1,\"modTrunk\":-1,\"tyreSmokeColor\":[255,255,255],\"modTransmission\":-1,\"modBackWheels\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"modFrontBumper\":-1,\"modFrame\":-1,\"bodyHealth\":1000.0,\"modShifterLeavers\":-1,\"modLivery\":5,\"neonEnabled\":[false,false,false,false],\"modGrille\":-1,\"modVanityPlate\":-1,\"modFender\":-1,\"modArmor\":-1,\"plate\":\"68RUM732\",\"windowTint\":-1,\"modFrontWheels\":-1,\"modWindows\":-1,\"wheelColor\":156,\"modArchCover\":-1,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"model\":2046537925,\"modSpoilers\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"plateIndex\":4,\"modTrimA\":-1,\"color2\":134,\"extras\":{\"2\":true,\"1\":false},\"fuelLevel\":65.0,\"pearlescentColor\":0,\"color1\":134,\"modDoorSpeaker\":-1,\"modHorns\":-1,\"modHood\":-1,\"modBrakes\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"modEngineBlock\":-1,\"modXenon\":false,\"dirtLevel\":3.0,\"modAPlate\":-1,\"modAerials\":-1}', 'car', 'police', 1),
('steam:1100001128b7f4b', 'BFK1091', '{\"modDashboard\":-1,\"modFender\":-1,\"modAPlate\":-1,\"modOrnaments\":-1,\"modSpoilers\":-1,\"color1\":6,\"modPlateHolder\":-1,\"modXenon\":false,\"modSuspension\":-1,\"plate\":\"BFK1091\",\"plateIndex\":0,\"modRightFender\":-1,\"neonColor\":[255,0,255],\"extras\":{\"12\":false,\"10\":false},\"modHood\":-1,\"modDial\":-1,\"modBrakes\":-1,\"engineHealth\":1000.0,\"modTurbo\":false,\"windowTint\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"modTrunk\":-1,\"modTransmission\":-1,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"modLivery\":-1,\"modTrimA\":-1,\"pearlescentColor\":111,\"modEngine\":-1,\"modStruts\":-1,\"dirtLevel\":3.0,\"wheelColor\":156,\"model\":-344943009,\"modFrontWheels\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"wheels\":0,\"modBackWheels\":-1,\"modAerials\":-1,\"color2\":0,\"fuelLevel\":65.0,\"neonEnabled\":[false,false,false,false],\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"modSeats\":-1,\"modArmor\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modSmokeEnabled\":false,\"modHorns\":-1,\"bodyHealth\":1000.0,\"modArchCover\":-1,\"modGrille\":-1,\"modAirFilter\":-1,\"modTank\":-1,\"modRoof\":-1,\"modRearBumper\":-1,\"modWindows\":-1}', 'car', NULL, 0),
('society:police', 'BSA 617', '{\"modLivery\":1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"modEngineBlock\":-1,\"modGrille\":-1,\"modRoof\":-1,\"bodyHealth\":1000.0,\"engineHealth\":1000.0,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"neonColor\":[255,0,255],\"extras\":{\"1\":false,\"2\":true},\"modDial\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modDashboard\":-1,\"modTrimB\":-1,\"modStruts\":-1,\"modHydrolic\":-1,\"modHorns\":-1,\"modAerials\":-1,\"pearlescentColor\":0,\"modArchCover\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"plateIndex\":4,\"modWindows\":-1,\"modSmokeEnabled\":false,\"modAPlate\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"wheels\":1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modExhaust\":-1,\"wheelColor\":156,\"modSuspension\":-1,\"modSpoilers\":-1,\"fuelLevel\":65.0,\"modXenon\":false,\"modSeats\":-1,\"plate\":\"BSA 617\",\"model\":2046537925,\"modDoorSpeaker\":-1,\"color1\":134,\"color2\":134,\"modHood\":-1,\"modFrame\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"dirtLevel\":7.0,\"modOrnaments\":-1}', 'car', 'police', 1),
('society:police', 'BU93RI73', '{\"modRearBumper\":-1,\"modSideSkirt\":-1,\"fuelLevel\":65.0,\"modTrunk\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"tyreSmokeColor\":[255,255,255],\"windowTint\":-1,\"modRoof\":-1,\"modAirFilter\":-1,\"modDashboard\":-1,\"extras\":{\"1\":false,\"2\":true},\"modDial\":-1,\"modStruts\":-1,\"modSmokeEnabled\":false,\"modDoorSpeaker\":-1,\"color2\":134,\"modTransmission\":-1,\"modFrontBumper\":-1,\"modFrontWheels\":-1,\"modRightFender\":-1,\"modXenon\":false,\"modSeats\":-1,\"modEngine\":-1,\"modTurbo\":false,\"wheels\":1,\"modOrnaments\":-1,\"modWindows\":-1,\"modSpoilers\":-1,\"modFrame\":-1,\"modGrille\":-1,\"modVanityPlate\":-1,\"modAPlate\":-1,\"modTrimA\":-1,\"modExhaust\":-1,\"modTank\":-1,\"modBrakes\":-1,\"modAerials\":-1,\"modFender\":-1,\"engineHealth\":1000.0,\"modLivery\":3,\"modPlateHolder\":-1,\"modHood\":-1,\"neonEnabled\":[false,false,false,false],\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"modSpeakers\":-1,\"plate\":\"BU93RI73\",\"modHorns\":-1,\"modTrimB\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"neonColor\":[255,0,255],\"bodyHealth\":1000.0,\"color1\":134,\"dirtLevel\":6.0,\"plateIndex\":4,\"pearlescentColor\":0,\"wheelColor\":156,\"model\":2046537925,\"modEngineBlock\":-1}', 'car', 'police', 1),
('steam:1100001128b7f4b', 'GKB 728', '{\"modDial\":-1,\"modRightFender\":-1,\"modOrnaments\":-1,\"modFender\":-1,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"modTrimA\":-1,\"modTank\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modSteeringWheel\":-1,\"modVanityPlate\":-1,\"modAirFilter\":-1,\"modSpoilers\":-1,\"modAerials\":-1,\"modHorns\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modTransmission\":-1,\"extras\":{\"10\":false,\"12\":true},\"modSpeakers\":-1,\"modSeats\":-1,\"dirtLevel\":6.0,\"neonEnabled\":[false,false,false,false],\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modXenon\":false,\"modAPlate\":-1,\"modFrame\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modWindows\":-1,\"wheelColor\":156,\"model\":-344943009,\"modLivery\":-1,\"windowTint\":-1,\"modGrille\":-1,\"modHydrolic\":-1,\"modPlateHolder\":-1,\"fuelLevel\":65.0,\"modHood\":-1,\"modStruts\":-1,\"modTrunk\":-1,\"plateIndex\":0,\"color2\":0,\"modExhaust\":-1,\"color1\":6,\"wheels\":0,\"modFrontWheels\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"pearlescentColor\":111,\"modFrontBumper\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"plate\":\"GKB 728\"}', 'car', NULL, 0),
('society:police', 'GYD 837', '{\"modLivery\":4,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"modEngineBlock\":-1,\"modGrille\":-1,\"modRoof\":-1,\"bodyHealth\":1000.0,\"engineHealth\":1000.0,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"neonColor\":[255,0,255],\"extras\":{\"1\":false,\"2\":true},\"modDial\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modDashboard\":-1,\"modTrimB\":-1,\"modStruts\":-1,\"modHydrolic\":-1,\"modHorns\":-1,\"modAerials\":-1,\"pearlescentColor\":0,\"modArchCover\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"plateIndex\":4,\"modWindows\":-1,\"modSmokeEnabled\":false,\"modAPlate\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"wheels\":1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modExhaust\":-1,\"wheelColor\":156,\"modSuspension\":-1,\"modSpoilers\":-1,\"fuelLevel\":65.0,\"modXenon\":false,\"modSeats\":-1,\"plate\":\"GYD 837\",\"model\":2046537925,\"modDoorSpeaker\":-1,\"color1\":134,\"color2\":134,\"modHood\":-1,\"modFrame\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"dirtLevel\":7.0,\"modOrnaments\":-1}', 'car', 'police', 1),
('steam:1100001128b7f4b', 'LB71KU52', '{\"modSeats\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"fuelLevel\":65.0,\"neonColor\":[255,0,255],\"modSideSkirt\":-1,\"modLivery\":-1,\"plate\":\"LB71KU52\",\"modAPlate\":-1,\"modFender\":-1,\"dirtLevel\":10.0,\"modDial\":-1,\"modStruts\":-1,\"modTank\":-1,\"modBackWheels\":-1,\"plateIndex\":0,\"modRearBumper\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modTransmission\":-1,\"modWindows\":-1,\"modSuspension\":-1,\"color2\":0,\"modHydrolic\":-1,\"modTrimA\":-1,\"extras\":{\"10\":true,\"12\":false},\"modSpoilers\":-1,\"modExhaust\":-1,\"modTrunk\":-1,\"modBrakes\":-1,\"windowTint\":-1,\"modHorns\":-1,\"modRoof\":-1,\"modHood\":-1,\"color1\":6,\"modTurbo\":false,\"modFrame\":-1,\"bodyHealth\":1000.0,\"modXenon\":false,\"modAirFilter\":-1,\"pearlescentColor\":111,\"wheelColor\":156,\"engineHealth\":1000.0,\"modEngine\":-1,\"modRightFender\":-1,\"modSmokeEnabled\":false,\"modDashboard\":-1,\"modArmor\":-1,\"wheels\":0,\"model\":-344943009,\"modSpeakers\":-1,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"modArchCover\":-1,\"modPlateHolder\":-1,\"modFrontWheels\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false]}', 'car', NULL, 0),
('society:police', 'LZ59TL25', '{\"color1\":134,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modAPlate\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"wheels\":1,\"modFrame\":-1,\"modAerials\":-1,\"modShifterLeavers\":-1,\"modAirFilter\":-1,\"windowTint\":-1,\"modRearBumper\":-1,\"dirtLevel\":7.0,\"modSpeakers\":-1,\"modBrakes\":-1,\"modHood\":-1,\"modWindows\":-1,\"modXenon\":false,\"modTransmission\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"modExhaust\":-1,\"modArmor\":-1,\"bodyHealth\":1000.0,\"modGrille\":-1,\"modSpoilers\":-1,\"modRoof\":-1,\"modTrunk\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"extras\":{\"1\":false,\"2\":true},\"modSeats\":-1,\"modSuspension\":-1,\"model\":2046537925,\"pearlescentColor\":0,\"modRightFender\":-1,\"plateIndex\":4,\"wheelColor\":156,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"modTank\":-1,\"modLivery\":5,\"modHydrolic\":-1,\"fuelLevel\":65.0,\"modSteeringWheel\":-1,\"modEngine\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":false,\"modDial\":-1,\"modStruts\":-1,\"modHorns\":-1,\"neonColor\":[255,0,255],\"tyreSmokeColor\":[255,255,255],\"modFrontBumper\":-1,\"modDoorSpeaker\":-1,\"color2\":134,\"neonEnabled\":[false,false,false,false],\"plate\":\"LZ59TL25\",\"modTurbo\":false}', 'car', 'police', 1),
('society:police', 'QE49JX50', '{\"modDashboard\":-1,\"modAerials\":-1,\"modRoof\":-1,\"modTank\":-1,\"modTrimA\":-1,\"modTurbo\":false,\"color1\":134,\"modEngine\":-1,\"plate\":\"QE49JX50\",\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"modSpeakers\":-1,\"color2\":134,\"modStruts\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"modSeats\":-1,\"modSteeringWheel\":-1,\"modXenon\":false,\"modTrimB\":-1,\"modRightFender\":-1,\"modSideSkirt\":-1,\"modFrame\":-1,\"modSpoilers\":-1,\"modGrille\":-1,\"neonColor\":[255,0,255],\"model\":2046537925,\"windowTint\":-1,\"pearlescentColor\":0,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":65.0,\"dirtLevel\":3.0,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"wheels\":1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":4,\"modWindows\":-1,\"engineHealth\":1000.0,\"modShifterLeavers\":-1,\"extras\":{\"1\":true,\"2\":false},\"modArchCover\":-1,\"modTrunk\":-1,\"wheelColor\":156,\"modAirFilter\":-1,\"modExhaust\":-1,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modAPlate\":-1,\"modHorns\":-1,\"modTransmission\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"modLivery\":0,\"modBrakes\":-1,\"modHood\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"modDoorSpeaker\":-1}', 'car', 'police', 1),
('society:police', 'UM59GX30', '{\"color1\":134,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modAPlate\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"wheels\":1,\"modFrame\":-1,\"modAerials\":-1,\"modShifterLeavers\":-1,\"modAirFilter\":-1,\"windowTint\":-1,\"modRearBumper\":-1,\"dirtLevel\":5.0,\"modSpeakers\":-1,\"modBrakes\":-1,\"modHood\":-1,\"modWindows\":-1,\"modXenon\":false,\"modTransmission\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"modExhaust\":-1,\"modArmor\":-1,\"bodyHealth\":1000.0,\"modGrille\":-1,\"modSpoilers\":-1,\"modRoof\":-1,\"modTrunk\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"extras\":{\"1\":true,\"2\":false},\"modSeats\":-1,\"modSuspension\":-1,\"model\":2046537925,\"pearlescentColor\":0,\"modRightFender\":-1,\"plateIndex\":4,\"wheelColor\":156,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"modTank\":-1,\"modLivery\":1,\"modHydrolic\":-1,\"fuelLevel\":65.0,\"modSteeringWheel\":-1,\"modEngine\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":false,\"modDial\":-1,\"modStruts\":-1,\"modHorns\":-1,\"neonColor\":[255,0,255],\"tyreSmokeColor\":[255,255,255],\"modFrontBumper\":-1,\"modDoorSpeaker\":-1,\"color2\":134,\"neonEnabled\":[false,false,false,false],\"plate\":\"UM59GX30\",\"modTurbo\":false}', 'car', 'police', 1),
('society:police', 'WP91RK31', '{\"wheels\":1,\"modFrontBumper\":-1,\"modHorns\":-1,\"modTrunk\":-1,\"pearlescentColor\":0,\"modAirFilter\":-1,\"modVanityPlate\":-1,\"windowTint\":-1,\"extras\":{\"2\":true,\"1\":false},\"modOrnaments\":-1,\"modRoof\":-1,\"bodyHealth\":1000.0,\"color1\":134,\"modRightFender\":-1,\"modDashboard\":-1,\"modGrille\":-1,\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"modWindows\":-1,\"modSmokeEnabled\":false,\"modEngine\":-1,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"modBrakes\":-1,\"color2\":134,\"model\":2046537925,\"modFrame\":-1,\"modFender\":-1,\"modStruts\":-1,\"plateIndex\":4,\"wheelColor\":156,\"modTank\":-1,\"modSeats\":-1,\"modSteeringWheel\":-1,\"modExhaust\":-1,\"modTurbo\":false,\"modEngineBlock\":-1,\"modSideSkirt\":-1,\"modXenon\":false,\"modSuspension\":-1,\"modHood\":-1,\"modShifterLeavers\":-1,\"dirtLevel\":7.0,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":65.0,\"modSpeakers\":-1,\"modTrimB\":-1,\"modArchCover\":-1,\"modArmor\":-1,\"tyreSmokeColor\":[255,255,255],\"modLivery\":1,\"plate\":\"WP91RK31\",\"modPlateHolder\":-1,\"modSpoilers\":-1,\"engineHealth\":1000.0,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"modTrimA\":-1,\"modAerials\":-1}', 'car', 'police', 1),
('society:police', 'XN73LS34', '{\"modLivery\":0,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"modEngineBlock\":-1,\"modGrille\":-1,\"modRoof\":-1,\"bodyHealth\":1000.0,\"engineHealth\":1000.0,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"neonColor\":[255,0,255],\"extras\":{\"1\":false,\"2\":true},\"modDial\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modDashboard\":-1,\"modTrimB\":-1,\"modStruts\":-1,\"modHydrolic\":-1,\"modHorns\":-1,\"modAerials\":-1,\"pearlescentColor\":0,\"modArchCover\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"plateIndex\":4,\"modWindows\":-1,\"modSmokeEnabled\":false,\"modAPlate\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"wheels\":1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modExhaust\":-1,\"wheelColor\":156,\"modSuspension\":-1,\"modSpoilers\":-1,\"fuelLevel\":65.0,\"modXenon\":false,\"modSeats\":-1,\"plate\":\"XN73LS34\",\"model\":2046537925,\"modDoorSpeaker\":-1,\"color1\":134,\"color2\":134,\"modHood\":-1,\"modFrame\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"dirtLevel\":4.0,\"modOrnaments\":-1}', 'car', 'police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'desempregado',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`) VALUES
('steam:11000010939f576', 'license:9b32a73afbaf3bf137415fc10c1e083ef8fe01fb', 0, 'Cueca do Free Fire', '{\"complexion_2\":0,\"bproof_2\":0,\"chest_3\":0,\"blemishes_2\":0,\"blush_3\":0,\"beard_4\":0,\"decals_1\":0,\"mask_1\":0,\"watches_1\":-1,\"blush_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"sun_2\":0,\"hair_1\":0,\"decals_2\":0,\"pants_1\":0,\"lipstick_1\":0,\"chain_1\":0,\"arms\":0,\"sun_1\":0,\"age_2\":0,\"bodyb_1\":0,\"glasses_1\":0,\"glasses_2\":0,\"ears_2\":0,\"helmet_2\":0,\"bags_1\":0,\"shoes_2\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"sex\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"arms_2\":0,\"age_1\":0,\"hair_color_1\":0,\"eyebrows_3\":0,\"moles_2\":0,\"makeup_1\":0,\"eyebrows_1\":0,\"moles_1\":0,\"makeup_3\":0,\"tshirt_1\":0,\"complexion_1\":0,\"beard_3\":0,\"helmet_1\":-1,\"makeup_2\":0,\"bags_2\":0,\"chest_2\":0,\"bproof_1\":0,\"blush_1\":0,\"torso_2\":0,\"skin\":0,\"torso_1\":0,\"hair_2\":0,\"lipstick_2\":0,\"makeup_4\":0,\"beard_1\":0,\"mask_2\":0,\"lipstick_4\":0,\"watches_2\":0,\"eye_color\":0,\"chest_1\":0,\"bracelets_2\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"chain_2\":0,\"bracelets_1\":-1,\"eyebrows_4\":0,\"face\":0,\"shoes_1\":0,\"pants_2\":0}', 'police', 2, '[]', '{\"z\":28.4,\"x\":451.9,\"y\":-1019.7}', 300, 4, 'superadmin'),
('steam:1100001128b7f4b', 'license:e682e5b7ce2515d4108dc0753c29332ce2ab326c', 499351000, 'Nego2KBR', '{\"complexion_2\":0,\"bags_2\":0,\"chest_3\":0,\"blemishes_2\":0,\"blush_3\":0,\"beard_4\":0,\"decals_1\":0,\"mask_1\":0,\"mask_2\":0,\"blush_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"sun_2\":0,\"hair_1\":8,\"decals_2\":0,\"pants_1\":28,\"lipstick_1\":0,\"chain_1\":0,\"lipstick_2\":0,\"sun_1\":0,\"age_2\":0,\"bodyb_1\":0,\"glasses_1\":0,\"ears_1\":-1,\"ears_2\":0,\"helmet_2\":2,\"bags_1\":0,\"shoes_2\":0,\"makeup_2\":0,\"tshirt_2\":0,\"sex\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"arms_2\":0,\"age_1\":0,\"hair_color_1\":0,\"eyebrows_3\":0,\"moles_2\":0,\"makeup_1\":0,\"eyebrows_1\":0,\"moles_1\":0,\"makeup_3\":0,\"tshirt_1\":4,\"complexion_1\":0,\"bracelets_1\":-1,\"helmet_1\":7,\"makeup_4\":0,\"shoes_1\":10,\"chest_2\":0,\"pants_2\":0,\"blush_1\":0,\"skin\":2,\"torso_2\":0,\"bproof_2\":0,\"hair_2\":0,\"bproof_1\":0,\"beard_1\":0,\"eye_color\":0,\"eyebrows_2\":0,\"lipstick_4\":0,\"watches_2\":0,\"hair_color_2\":0,\"chest_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"chain_2\":0,\"glasses_2\":0,\"arms\":0,\"eyebrows_4\":0,\"face\":0,\"torso_1\":115,\"beard_3\":0}', 'police', 4, '[{\"label\":\"Espingarda\",\"name\":\"WEAPON_PUMPSHOTGUN\",\"ammo\":230,\"components\":[]},{\"label\":\"Rifle Avançado\",\"name\":\"WEAPON_ADVANCEDRIFLE\",\"ammo\":250,\"components\":[\"clip_default\",\"flashlight\",\"scope\",\"suppressor\"]},{\"label\":\"Double-Action Revolver\",\"name\":\"WEAPON_DOUBLEACTION\",\"ammo\":7,\"components\":[]}]', '{\"x\":-330.8,\"y\":-701.2,\"z\":32.9}', 2485, 4, 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:1100001128b7f4b', 'black_money', 0),
(2, 'steam:11000010939f576', 'black_money', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Adder', 'adder', 900000, 'super'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `vehicle_sold`
--

INSERT INTO `vehicle_sold` (`client`, `model`, `plate`, `soldby`, `date`) VALUES
('Cueca do Free Fire', 'asea', 'AKD 833', 'Nego2KBR', '2020-06-04 02:00'),
('Cueca do Free Fire', 'asea', 'VXW 019', 'Nego2KBR', '2020-06-04 02:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  ADD KEY `index_datastore_name` (`name`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
