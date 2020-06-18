USE `essentialmode`;

CREATE TABLE `user_garage` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext,

  PRIMARY KEY (`id`)
);
