/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : vs

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-24 00:23:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vs_action`
-- ----------------------------
DROP TABLE IF EXISTS `vs_action`;
CREATE TABLE `vs_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行为标题',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '唯一标识，小写',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `type` tinyint(1) DEFAULT NULL COMMENT '行为类型 0:系统1:用户',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行为描述',
  `app` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行为所属类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统行为表';

-- ----------------------------
-- Records of vs_action
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `vs_action_log`;
CREATE TABLE `vs_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT NULL COMMENT '行为ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户IP',
  `app` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模块名称',
  `remark` text COLLATE utf8_unicode_ci COMMENT '日志内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `action_type` tinyint(1) DEFAULT NULL COMMENT '行为；类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_config`
-- ----------------------------
DROP TABLE IF EXISTS `vs_config`;
CREATE TABLE `vs_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置标题',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置标识',
  `type` tinyint(1) DEFAULT NULL COMMENT '配置类型',
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置说明',
  `sort` smallint(3) DEFAULT '0' COMMENT '排序',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置值',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
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
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='节点';

-- ----------------------------
-- Records of vs_node
-- ----------------------------
INSERT INTO `vs_node` VALUES ('1', '1', 'admin/user/add', '1', '1', '1', '1', '1');
INSERT INTO `vs_node` VALUES ('2', '2', 'admin/login/logout', '2', '1', '1', '0', '1');
INSERT INTO `vs_node` VALUES ('3', '3', 'admin/user/index', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for `vs_user`
-- ----------------------------
DROP TABLE IF EXISTS `vs_user`;
CREATE TABLE `vs_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态：1：正常，0：禁用',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_pwd_change` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用于验证初始密码是否被修改',
  `last_login_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统用户';

-- ----------------------------
-- Records of vs_user
-- ----------------------------
INSERT INTO `vs_user` VALUES ('1', 'admin', '超级管理员', '356a192b7913b04c54574d18c28d46e6395428ab', '1', '2017-09-24 00:06:59', '0', '2017-09-24 00:06:59');
INSERT INTO `vs_user` VALUES ('2', 'alex', '蛋蛋嫁到', '356a192b7913b04c54574d18c28d46e6395428ab', '1', '2017-09-24 00:07:52', '0', '2017-09-24 00:07:52');
INSERT INTO `vs_user` VALUES ('3', 'laowang', '老王', '0f2c595baa1fac2457a5970eb17f735ffedd0c40', '1', '2017-09-23 17:45:03', '0', '2017-09-23 17:45:03');

-- ----------------------------
-- Table structure for `vs_user_node`
-- ----------------------------
DROP TABLE IF EXISTS `vs_user_node`;
CREATE TABLE `vs_user_node` (
  `user_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vs_user_node
-- ----------------------------
INSERT INTO `vs_user_node` VALUES ('1', '1');
INSERT INTO `vs_user_node` VALUES ('1', '2');
INSERT INTO `vs_user_node` VALUES ('2', '3');
