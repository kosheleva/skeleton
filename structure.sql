/*
SQLyog Enterprise v10.11 
MySQL - 5.1.56-log : Database - p_bluz
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `users` */
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` enum('active','pending','disabled') NOT NULL DEFAULT 'disabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_roles` */
DROP TABLE IF EXISTS `acl_roles`;

CREATE TABLE `acl_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Group name for virtual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


/*Table structure for table `acl_privileges` */
DROP TABLE IF EXISTS `acl_privileges`;

CREATE TABLE `acl_privileges` (
  `roleId` bigint(20) NOT NULL,
  `module` varchar(255) NOT NULL,
  `privilege` varchar(255) NOT NULL,
  UNIQUE KEY `role_privilege` (`roleId`,`module`,`privilege`),
  CONSTRAINT `FK_acl_privileges_2_acl_roles` FOREIGN KEY (`roleId`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `acl_usersToRoles` */
DROP TABLE IF EXISTS `acl_usersToRoles`;

CREATE TABLE `acl_usersToRoles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_acl_2_users` (`userId`),
  KEY `FK_acl_2_roles` (`roleId`),
  CONSTRAINT `FK_acl_2_users` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_acl_2_roles` FOREIGN KEY (`roleId`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `rcl_userToResource` */
DROP TABLE IF EXISTS `rcl_userToResource`;

CREATE TABLE `rcl_userToResource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resourceId` bigint(20) DEFAULT NULL,
  `resourceType` varchar(255) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rcl_userToResourceToPrivilege` */
DROP TABLE IF EXISTS `rcl_userToResourceToPrivilege`;

CREATE TABLE `rcl_userToResourceToPrivilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resourceId` bigint(20) DEFAULT NULL,
  `resourceType` varchar(255) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `privilege` varchar(255) NOT NULL,
  `flag` enum('allow','deny') NOT NULL DEFAULT 'deny',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
