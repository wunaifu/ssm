/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.51 : Database - movie
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movie` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movie`;

/*Table structure for table `collect_tab` */

DROP TABLE IF EXISTS `collect_tab`;

CREATE TABLE `collect_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号，自增',
  `postId` int(11) NOT NULL COMMENT '帖子id',
  `collecterId` int(11) NOT NULL COMMENT '收藏人id',
  `collectTime` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `collect_tab` */

insert  into `collect_tab`(`id`,`postId`,`collecterId`,`collectTime`) values (1,1,5,'2017-08-16 12:53:53');

/*Table structure for table `friend_tab` */

DROP TABLE IF EXISTS `friend_tab`;

CREATE TABLE `friend_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号，自增',
  `myId` int(11) NOT NULL COMMENT '我的ID',
  `friendId` int(11) NOT NULL COMMENT '好友id',
  `addTime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `friend_tab` */

/*Table structure for table `person_tab` */

DROP TABLE IF EXISTS `person_tab`;

CREATE TABLE `person_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长',
  `postId` int(11) NOT NULL COMMENT '帖子id',
  `startPersonId` int(11) NOT NULL COMMENT '发起约影人id',
  `byPersonId` int(11) NOT NULL COMMENT '被约人id',
  `personTime` datetime NOT NULL COMMENT '时间（建立该条记录时的时间，后台处理就行）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person_tab` */

/*Table structure for table `post_tab` */

DROP TABLE IF EXISTS `post_tab`;

CREATE TABLE `post_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长',
  `postPersonId` int(11) NOT NULL COMMENT '发帖人的id',
  `postTime` datetime NOT NULL COMMENT '发帖时间',
  `site` varchar(64) NOT NULL DEFAULT '未填写' COMMENT '地点',
  `movieName` varchar(64) NOT NULL DEFAULT '未填写' COMMENT '约影的影片名字',
  `movieTime` datetime NOT NULL COMMENT '约影时间',
  `sex` int(11) NOT NULL DEFAULT '2' COMMENT '约影对象性别（0表示男，1表示女，2表示不限制）',
  `endTime` datetime DEFAULT NULL COMMENT '完成约影时间（不显示，在约影完成按键直接获取存储）',
  `movieType` int(11) NOT NULL DEFAULT '0' COMMENT '约影类型（0为2人单独约影。1为多人或团体约影，PP端获取约影类型时，获取约影人表，设置好报名人数，如果超过报名人数，约影人可挑选）',
  `details` text COMMENT '发帖内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `post_tab` */

insert  into `post_tab`(`id`,`postPersonId`,`postTime`,`site`,`movieName`,`movieTime`,`sex`,`endTime`,`movieType`,`details`) values (1,5,'2017-08-16 12:16:53','蓬江','战狼2','2017-08-29 12:17:19',2,NULL,0,'找一个人一起看电影'),(2,8,'2017-08-27 15:53:02','新会','小黄人3','2017-08-27 15:53:28',2,NULL,0,'找一个人一起看电影');

/*Table structure for table `review_tab` */

DROP TABLE IF EXISTS `review_tab`;

CREATE TABLE `review_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号，自增',
  `postId` int(11) NOT NULL COMMENT '帖子id',
  `postPersonId` int(11) NOT NULL COMMENT '发表人id',
  `reviewDetails` text NOT NULL COMMENT '评论内容',
  `reviewTime` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `review_tab` */

/*Table structure for table `user_tab` */

DROP TABLE IF EXISTS `user_tab`;

CREATE TABLE `user_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号,自增长(用户ID)',
  `phone` varchar(32) NOT NULL COMMENT '手机号码（作为登录名）',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT '未填写' COMMENT '用户昵称',
  `name` varchar(32) DEFAULT '未填写' COMMENT '姓名',
  `gender` tinyint(4) DEFAULT '0' COMMENT '性别：0表示男，1表示女',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `habit` varchar(64) DEFAULT NULL COMMENT '爱好',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `job` varchar(32) DEFAULT NULL COMMENT '职业',
  `address` varchar(64) DEFAULT '未填写' COMMENT '住址',
  `weight` varchar(32) DEFAULT NULL COMMENT '体重',
  `height` varchar(32) DEFAULT NULL COMMENT '身高',
  `xingZuo` varchar(32) DEFAULT NULL COMMENT '星座',
  `signature` text COMMENT '个性签名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user_tab` */

insert  into `user_tab`(`id`,`phone`,`password`,`nickname`,`name`,`gender`,`age`,`habit`,`birthday`,`job`,`address`,`weight`,`height`,`xingZuo`,`signature`) values (5,'18219111600','1234561','未填写','未填写',0,0,NULL,'2017-08-20 21:07:37',NULL,'未填写','120','160',NULL,NULL),(8,'18219111601','123456test','未填写','未填写',0,0,NULL,NULL,NULL,'未填写',NULL,NULL,NULL,NULL),(9,'18219111626','123456','未填写','未填写',0,0,NULL,NULL,NULL,'未填写',NULL,NULL,NULL,NULL),(10,'15089828319','123456','未填写','未填写',0,0,NULL,'2017-08-03 21:13:17',NULL,'未填写',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
