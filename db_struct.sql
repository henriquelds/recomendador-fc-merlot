DROP TABLE IF EXISTS `generated_recs`;
CREATE TABLE `generated_recs` (
`ID_Rec` int(10) unsigned NOT NULL AUTO_INCREMENT,
`ID_User` int(11) NOT NULL,
`ID_LO` int(11) NOT NULL,
`predicted_value` int(10) NOT NULL,
`tipo` varchar(30) NOT NULL,
PRIMARY KEY(`ID_Rec`)

)