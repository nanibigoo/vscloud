/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : vs

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-19 23:31:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vs_action`
-- ----------------------------
DROP TABLE IF EXISTS `vs_action`;
CREATE TABLE `vs_action` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='行为';

-- ----------------------------
-- Records of vs_action
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_config`
-- ----------------------------
DROP TABLE IF EXISTS `vs_config`;
CREATE TABLE `vs_config` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` smallint(3) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_config
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_hospital`
-- ----------------------------
DROP TABLE IF EXISTS `vs_hospital`;
CREATE TABLE `vs_hospital` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '医院名称',
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '医院唯一标识，前台登录地址标识',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `标识` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='医院用户';

-- ----------------------------
-- Records of vs_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_hospital_alipay`
-- ----------------------------
DROP TABLE IF EXISTS `vs_hospital_alipay`;
CREATE TABLE `vs_hospital_alipay` (
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_hospital_alipay
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_hospital_detail`
-- ----------------------------
DROP TABLE IF EXISTS `vs_hospital_detail`;
CREATE TABLE `vs_hospital_detail` (
  `hospital_id` int(11) DEFAULT NULL,
  `associated_account` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联账号\r\n1：wechat\r\n2：alipay\r\n3：unionpay\r\n多个时中间用逗号隔开'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='医院详细信息';

-- ----------------------------
-- Records of vs_hospital_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_hospital_node`
-- ----------------------------
DROP TABLE IF EXISTS `vs_hospital_node`;
CREATE TABLE `vs_hospital_node` (
  `hospital_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_hospital_node
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_hospital_unionpay`
-- ----------------------------
DROP TABLE IF EXISTS `vs_hospital_unionpay`;
CREATE TABLE `vs_hospital_unionpay` (
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_hospital_unionpay
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_hospital_wechat`
-- ----------------------------
DROP TABLE IF EXISTS `vs_hospital_wechat`;
CREATE TABLE `vs_hospital_wechat` (
  `hospital_id` int(11) unsigned DEFAULT NULL,
  `openid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='医院微信账号信息';

-- ----------------------------
-- Records of vs_hospital_wechat
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_log`
-- ----------------------------
DROP TABLE IF EXISTS `vs_log`;
CREATE TABLE `vs_log` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_log
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_node`
-- ----------------------------
DROP TABLE IF EXISTS `vs_node`;
CREATE TABLE `vs_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '节点名称',
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '节点标识，小写',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类id',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（1：正常，0：禁用）',
  `type` tinyint(1) DEFAULT NULL COMMENT '节点分类，',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `level` tinyint(1) DEFAULT NULL COMMENT '层级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='节点';

-- ----------------------------
-- Records of vs_node
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_user`
-- ----------------------------
DROP TABLE IF EXISTS `vs_user`;
CREATE TABLE `vs_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码：6-15位字符串',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态：1：正常，0：禁用',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统用户';

-- ----------------------------
-- Records of vs_user
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_user_node`
-- ----------------------------
DROP TABLE IF EXISTS `vs_user_node`;
CREATE TABLE `vs_user_node` (
  `user_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_user_node
-- ----------------------------
