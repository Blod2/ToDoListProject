-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.42 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных listbase
CREATE DATABASE IF NOT EXISTS `listbase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `listbase`;

-- Дамп структуры для таблица listbase.finished_list
CREATE TABLE IF NOT EXISTS `finished_list` (
  `job_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `job_text` text,
  `job_date` datetime DEFAULT NULL,
  PRIMARY KEY (`job_ID`),
  KEY `FK1_finished_users` (`user_id`),
  CONSTRAINT `FK1_finished_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='List of FINISHED jobs';

-- Дамп данных таблицы listbase.finished_list: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `finished_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `finished_list` ENABLE KEYS */;

-- Дамп структуры для таблица listbase.ongoing_list
CREATE TABLE IF NOT EXISTS `ongoing_list` (
  `job_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL DEFAULT '0',
  `job_text` text,
  `job_date` datetime DEFAULT NULL,
  PRIMARY KEY (`job_ID`),
  KEY `FK__users_ongoing` (`user_ID`),
  CONSTRAINT `FK__users_ongoing` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='List of ONGOING jobs';

-- Дамп данных таблицы listbase.ongoing_list: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `ongoing_list` DISABLE KEYS */;
INSERT IGNORE INTO `ongoing_list` (`job_ID`, `user_ID`, `job_text`, `job_date`) VALUES
	(6, 2, 'little more job', '2017-10-06 16:56:06');
/*!40000 ALTER TABLE `ongoing_list` ENABLE KEYS */;

-- Дамп структуры для таблица listbase.todo_list
CREATE TABLE IF NOT EXISTS `todo_list` (
  `job_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL DEFAULT '0',
  `job_text` text,
  `job_date` datetime DEFAULT NULL,
  PRIMARY KEY (`job_ID`),
  KEY `FK__users` (`user_ID`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='List of TODO jobs';

-- Дамп данных таблицы listbase.todo_list: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `todo_list` DISABLE KEYS */;
INSERT IGNORE INTO `todo_list` (`job_ID`, `user_ID`, `job_text`, `job_date`) VALUES
	(7, 2, 'job to do', '2017-10-06 16:55:50');
/*!40000 ALTER TABLE `todo_list` ENABLE KEYS */;

-- Дамп структуры для таблица listbase.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Users for login';

-- Дамп данных таблицы listbase.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`ID`, `username`, `password`) VALUES
	(2, 'tester', '1'),
	(3, 'newbie', '122');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
