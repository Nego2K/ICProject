USE `essentialmode`;

CREATE TABLE `users_garages` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `position` varchar(60) DEFAULT NULL,
  `vehicle` longtext,

  PRIMARY KEY (`id`)
);
