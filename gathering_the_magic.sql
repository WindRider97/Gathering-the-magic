-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `collection` (`id`) VALUES
(1),
(2),
(4),
(7);

DROP TABLE IF EXISTS `decks`;
CREATE TABLE `decks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `test_card`;
CREATE TABLE `test_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `color` enum('W','U','B','R','G','S','C','P','X','T') COLLATE utf8_unicode_ci NOT NULL,
  `cost` int(11) NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `test_card` (`id`, `name`, `color`, `cost`, `type`, `description`, `extension`) VALUES
(1,	'Chandra, Torch of defiance',	'R',	4,	'Legendary Planeswalker - Chandra',	'+1 - deal 2 damages to any target',	'Magic Origins'),
(2,	'Yuriko, Tiger\'s shadow',	'B',	3,	'Legendary Creature - Ninja',	'{B}{U} Ninjutsu',	'Commander 2018'),
(3,	'Hamza, Guardian of Arashin',	'W',	6,	'Legendary Creature - Elephant',	'This spell cost 1 less to cast for each creature with +1/+1 counter on it.',	'Commander Legends'),
(4,	'Sol Ring',	'C',	1,	'Artifact',	'{tap} add {C}{C}',	'Commander Collection Green'),
(5,	'Soul of the Harvest',	'G',	6,	'Creature - Elemental',	'Tample',	'Jumpstart'),
(6,	'Victory\'s Envoy',	'W',	5,	'Creature - Human Cleric',	'At the beginning of your upkeep put a +1/+1 counter on each creature you control.',	'Theros beyond Death'),
(7,	'Beast Whisperer',	'G',	4,	'Creature - Elf Druid',	'Whenever you cast a creature spell draw a card',	'Time Spiral'),
(8,	'Cathars\' Crusage',	'W',	5,	'Enchantment',	'Whenever a creature enter the battlefield under your control, put a +1/+1 counter on each creature you control.',	'Jumpstart'),
(9,	'Asmoranomardicadaistinaculdacar',	'R',	0,	'Legendary Creature - Human',	'As long as you\'ve discarded a card this turn you may pay {B}{R} to cast this card.',	'Modern Horizon 2'),
(10,	'Feasting Troll King',	'G',	6,	'Creature - Troll Noble',	'Vigilance, trample',	'Throne of Eldraine'),
(11,	'Cauldron Familiar',	'B',	1,	'Creature - Cat',	'Whenever it enter the battlefield deal 1 damage to target opponent and gain 1 life.',	'Throne of Eldraine'),
(12,	'Counterspell',	'U',	2,	'Instant',	'Counter target spell',	'M20');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `password`, `username`) VALUES
(1,	'pass',	'toto');

DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection` (
  `user_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  `owned` enum('true','false') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`card_id`,`owned`),
  KEY `user_id` (`user_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `user_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_collection_ibfk_3` FOREIGN KEY (`card_id`) REFERENCES `test_card` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_collection` (`user_id`, `card_id`, `quantity`, `owned`) VALUES
(1,	4,	4,	'true');

DROP TABLE IF EXISTS `user_deck`;
CREATE TABLE `user_deck` (
  `user_id` int(11) NOT NULL,
  `deck_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `deck_id` (`deck_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `user_deck_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_deck_ibfk_2` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_deck_ibfk_3` FOREIGN KEY (`card_id`) REFERENCES `test_card` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 2022-04-24 15:53:53
