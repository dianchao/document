SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE  IF EXISTS `ms_storage`;
CREATE DATABASE  `ms_storage`
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE ms_storage;

DROP TABLE IF EXISTS `t_storage`;
CREATE TABLE `t_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_code` varchar(50) DEFAULT NULL comment '商品编号',
  `commodity_name` varchar(200) DEFAULT NULL  comment '商品名称',
  `count` int(11) DEFAULT 0   comment '商品数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`commodity_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP DATABASE  IF EXISTS `ms_order`;
CREATE DATABASE  `ms_order`
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE ms_order;

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `commodity_code` varchar(50) DEFAULT NULL  comment '商品编号',
  `count` int(11) DEFAULT 0,
  `amount` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP DATABASE  IF EXISTS `ms_account`;
CREATE DATABASE  `ms_account`
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE ms_account;

DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `balance` int(11) DEFAULT 0  comment '账户余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP DATABASE  IF EXISTS `ms_user`;
CREATE DATABASE  `ms_user`
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE ms_user;

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





