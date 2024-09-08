/*
Navicat MySQL Data Transfer

Source Server         : users
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : gin-mall

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2024-09-08 18:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_address_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '2023-04-02 15:34:17.654', '2023-04-02 15:34:17.654', null, '1', 'codeanl', '11111111111', '广西壮族自治区柳州市');
INSERT INTO `address` VALUES ('2', '2023-04-02 15:36:23.354', '2023-04-02 15:38:43.062', null, '1', '安', '13400000000', '广西壮族自治区南宁市');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `password_digest` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_admin_deleted_at` (`deleted_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `img_path` varchar(256) DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_carousel_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1', '2023-04-02 15:47:20.000', null, null, 'https://an23.co/upload/2022/07/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220722020131.jpg', '1');
INSERT INTO `carousel` VALUES ('2', '2023-04-02 15:47:16.000', null, null, 'https://an23.co/upload/2022/07/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220722020131.jpg', '2');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `boss_id` bigint(20) unsigned NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `max_num` bigint(20) unsigned NOT NULL,
  `check` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cart_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '2023-04-02 15:41:02.570', '2023-04-02 15:42:33.813', null, '1', '1', '1', '2', '10', '0');
INSERT INTO `cart` VALUES ('2', '2023-04-02 15:42:38.986', '2023-04-02 15:43:33.068', null, '1', '2', '1', '2', '10', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `category_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '2023-04-02 15:04:42.000', null, null, '数码产品');
INSERT INTO `category` VALUES ('2', '2023-04-02 15:04:45.000', null, null, '生鲜食品');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `boss_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorite_user` (`user_id`),
  KEY `fk_favorite_product` (`product_id`),
  KEY `fk_favorite_boss` (`boss_id`),
  KEY `idx_favorite_deleted_at` (`deleted_at`),
  CONSTRAINT `fk_favorite_boss` FOREIGN KEY (`boss_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_favorite_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_favorite_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('1', '2023-04-02 15:19:21.466', '2023-04-02 15:19:21.466', null, '1', '1', '1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`),
  KEY `idx_notice_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '2023-04-02 14:51:18.000', null, null, '您正在绑定邮箱Email');
INSERT INTO `notice` VALUES ('2', '2023-04-02 14:51:22.000', null, null, '您正在解绑邮箱Email');
INSERT INTO `notice` VALUES ('3', '2023-04-02 14:51:25.000', null, null, '您正在修改密码Email');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `boss_id` bigint(20) unsigned NOT NULL,
  `address_id` bigint(20) unsigned NOT NULL,
  `num` bigint(20) DEFAULT NULL,
  `order_num` bigint(20) unsigned DEFAULT NULL,
  `type` bigint(20) unsigned DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `info` varchar(256) DEFAULT NULL,
  `img_path` varchar(256) DEFAULT NULL,
  `price` varchar(256) DEFAULT NULL,
  `discount_price` varchar(256) DEFAULT NULL,
  `on_sale` tinyint(1) DEFAULT '0',
  `num` bigint(20) DEFAULT NULL,
  `boss_id` bigint(20) DEFAULT NULL,
  `boss_name` varchar(256) DEFAULT NULL,
  `boss_avatar` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_name` (`name`),
  KEY `idx_product_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '2023-04-02 15:06:30.947', '2023-04-02 15:06:30.947', null, 'iphone13', '1', 'iphone13重磅来袭！！！', 'iphone13重磅来袭！！！iphone13重磅来袭！！！iphone13重磅来袭！！！', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C', '4399', '3999', '1', '100', '1', 'admin', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');
INSERT INTO `product` VALUES ('2', '2023-04-02 15:10:22.841', '2023-04-02 15:10:22.841', null, 'iphone13', '1', 'iphone13重磅来袭！！！', 'iphone13重磅来袭！！！iphone13重磅来袭！！！iphone13重磅来袭！！！', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C', '4399', '3999', '1', '100', '1', 'admin', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `img_path` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_img_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('1', '2023-04-02 15:06:31.011', '2023-04-02 15:06:31.011', null, '1', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');
INSERT INTO `product_img` VALUES ('2', '2023-04-02 15:06:31.077', '2023-04-02 15:06:31.077', null, '1', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');
INSERT INTO `product_img` VALUES ('3', '2023-04-02 15:06:31.140', '2023-04-02 15:06:31.140', null, '1', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');
INSERT INTO `product_img` VALUES ('4', '2023-04-02 15:10:22.912', '2023-04-02 15:10:22.912', null, '2', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');
INSERT INTO `product_img` VALUES ('5', '2023-04-02 15:10:22.986', '2023-04-02 15:10:22.986', null, '2', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');
INSERT INTO `product_img` VALUES ('6', '2023-04-02 15:10:23.061', '2023-04-02 15:10:23.061', null, '2', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `password_digest` varchar(256) DEFAULT NULL,
  `nick_name` longtext,
  `status` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `money` varchar(256) DEFAULT NULL,
  `nice_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`),
  KEY `idx_user_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2023-04-02 14:40:00.333', '2023-04-02 14:58:39.481', null, 'admin', '2633262862@qq.com', '$2a$12$z2/SVzFCiK9W22uYjwJ.WO5ZNOlj23DmMjya74ZiZ0.2WeXnhe.qC', '超级管理员', 'active', 'rsfa3hh3e.hn-bkt.clouddn.comFhQBR-cRCelSfZgM-3r5P_M37y-C', '0', null);
INSERT INTO `user` VALUES ('2', '2023-04-02 15:46:43.489', '2023-04-02 15:46:43.489', null, 'codeanl1', '', '$2a$12$RX8L7.2cG6AB9YrHN6q8H.PL.tMfbwnhJ6gXdgy1kMQBfMg2aylla', 'codeanl', 'active', 'https://an23.co/upload/2022/07/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220722020131.jpg', '0', null);
