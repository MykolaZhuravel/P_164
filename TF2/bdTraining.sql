--
-- Base de données :  `training_calendar`
--
-- suppression de la base si elle est existante ATTENTION ON PERD TOUT !!!
DROP DATABASE IF EXISTS bd_training;
CREATE DATABASE IF NOT EXISTS `bd_training` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bd_training`;

-- --------------------------------------------------------

--
-- Structure de la table `planification`
--

DROP TABLE IF EXISTS `t_planning`;
CREATE TABLE IF NOT EXISTS `t_planning` (
  `IDplanning` smallint(5) unsigned NOT NULL,
  `plaName` varchar(200) NOT NULL,
  `plaDatebegin` date NOT NULL,
  `plaPartNbr` tinyint(1) unsigned NOT NULL,
  `plaStudentNbr` tinyint(3) unsigned NOT NULL,
  `plaHourStart` time NOT NULL,
  `plaDuration` tinyint(3) unsigned NOT NULL,
  `fkteacher` varchar(50) NOT NULL,
  `plaPriceMember` tinyint(3) unsigned DEFAULT NULL,
  `plaPriceOther` tinyint(3) unsigned DEFAULT NULL,
   KEY `IDplanning` (`IDplanning`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
