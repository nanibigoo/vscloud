/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : guahao

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-20 17:34:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ghao_action`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_action`;
CREATE TABLE `ghao_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ghao_action
-- ----------------------------
INSERT INTO `ghao_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `ghao_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `ghao_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `ghao_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `ghao_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `ghao_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `ghao_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `ghao_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `ghao_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `ghao_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `ghao_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');
INSERT INTO `ghao_action` VALUES ('12', 'update_schedule', '更新号表', '新增或编辑号表', '', '', '1', '1', '1499159857');
INSERT INTO `ghao_action` VALUES ('13', 'delete_schedule', '删除号表', '删除号表', '', '', '2', '1', '1499227234');
INSERT INTO `ghao_action` VALUES ('14', 'stop_schedule', '停诊', '停诊', '', '', '2', '1', '1499229670');
INSERT INTO `ghao_action` VALUES ('15', 'back_schedule', '恢复门诊', '恢复门诊', '', '', '2', '1', '1499229688');
INSERT INTO `ghao_action` VALUES ('16', 'update_schedule_today', '更新当日号表', '更新当日号表', '', '', '2', '1', '1499231525');
INSERT INTO `ghao_action` VALUES ('17', 'tempstop_schedule_today', '当天临时停诊', '当天临时停诊', '', '', '1', '1', '1499232022');
INSERT INTO `ghao_action` VALUES ('18', 'stop_schedule_today', '当天停诊', '当天停诊', '', '', '2', '1', '1499232038');
INSERT INTO `ghao_action` VALUES ('19', 'back_schedule_today', '当天复诊', '当天复诊', '', '', '1', '1', '1499232051');

-- ----------------------------
-- Table structure for `ghao_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_action_log`;
CREATE TABLE `ghao_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=782 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of ghao_action_log
-- ----------------------------
INSERT INTO `ghao_action_log` VALUES ('694', '1', '1', '-1408234522', 'member', '1', 'admin在2017-05-29 22:36登录了后台', '1', '1496068569');
INSERT INTO `ghao_action_log` VALUES ('695', '1', '1', '-1408234522', 'member', '1', 'admin在2017-05-29 22:45登录了后台', '1', '1496069112');
INSERT INTO `ghao_action_log` VALUES ('696', '10', '1', '0', 'Menu', '0', '操作url：/guahao0/admin.php?s=/Menu/del/id/165.html', '1', '1496198835');
INSERT INTO `ghao_action_log` VALUES ('697', '10', '1', '0', 'Menu', '0', '操作url：/guahao0/admin.php?s=/Menu/del/id/164.html', '1', '1496198841');
INSERT INTO `ghao_action_log` VALUES ('698', '10', '1', '0', 'Menu', '163', '操作url：/guahao0/admin.php?s=/Menu/edit.html', '1', '1496387594');
INSERT INTO `ghao_action_log` VALUES ('699', '1', '5', '0', 'member', '5', 'ceshi在2017-06-29 09:26登录了后台', '1', '1498699586');
INSERT INTO `ghao_action_log` VALUES ('700', '1', '1', '0', 'member', '1', 'admin在2017-06-29 09:26登录了后台', '1', '1498699606');
INSERT INTO `ghao_action_log` VALUES ('701', '1', '5', '0', 'member', '5', 'ceshi在2017-06-29 09:27登录了后台', '1', '1498699640');
INSERT INTO `ghao_action_log` VALUES ('702', '1', '1', '0', 'member', '1', 'admin在2017-06-29 09:40登录了后台', '1', '1498700439');
INSERT INTO `ghao_action_log` VALUES ('703', '1', '6', '0', 'member', '6', 'ceshi2在2017-06-29 09:43登录了后台', '1', '1498700604');
INSERT INTO `ghao_action_log` VALUES ('704', '1', '1', '0', 'member', '1', 'admin在2017-06-29 09:43登录了后台', '1', '1498700621');
INSERT INTO `ghao_action_log` VALUES ('705', '1', '6', '0', 'member', '6', 'ceshi2在2017-06-29 09:44登录了后台', '1', '1498700647');
INSERT INTO `ghao_action_log` VALUES ('706', '1', '1', '0', 'member', '1', 'admin在2017-06-29 10:21登录了后台', '1', '1498702900');
INSERT INTO `ghao_action_log` VALUES ('707', '1', '6', '0', 'member', '6', 'ceshi2在2017-06-29 10:23登录了后台', '1', '1498703002');
INSERT INTO `ghao_action_log` VALUES ('708', '1', '6', '0', 'member', '6', 'ceshi2在2017-06-29 10:23登录了后台', '1', '1498703019');
INSERT INTO `ghao_action_log` VALUES ('709', '1', '1', '0', 'member', '1', 'admin在2017-06-29 10:39登录了后台', '1', '1498703992');
INSERT INTO `ghao_action_log` VALUES ('710', '1', '6', '0', 'member', '6', 'ceshi2在2017-06-29 10:41登录了后台', '1', '1498704098');
INSERT INTO `ghao_action_log` VALUES ('711', '1', '1', '0', 'member', '1', 'admin在2017-06-29 14:18登录了后台', '1', '1498717115');
INSERT INTO `ghao_action_log` VALUES ('712', '1', '1', '0', 'member', '1', 'admin在2017-07-03 13:15登录了后台', '1', '1499058918');
INSERT INTO `ghao_action_log` VALUES ('713', '1', '1', '0', 'member', '1', 'admin在2017-07-04 09:55登录了后台', '1', '1499133334');
INSERT INTO `ghao_action_log` VALUES ('714', '10', '1', '0', 'Menu', '58', '操作url：/guahao0/admin.php?s=/Menu/edit.html', '1', '1499146215');
INSERT INTO `ghao_action_log` VALUES ('715', '12', '1', '0', 'schedule', '1', '操作url：/guahao0/admin.php?s=/Schedule/add.html', '1', '1499157029');
INSERT INTO `ghao_action_log` VALUES ('716', '12', '1', '0', 'schedule', '0', '操作url：/guahao0/admin.php?s=/Schedule/add.html', '1', '1499159123');
INSERT INTO `ghao_action_log` VALUES ('717', '12', '1', '0', 'schedule', '1', '的号表', '1', '1499159651');
INSERT INTO `ghao_action_log` VALUES ('718', '12', '1', '0', 'schedule', '1', 'admin在2017-07-04 17:14新增或编辑了顾金圣医生2017-07-06上午在十梓街院区生殖医学中心（高诊）的号表', '1', '1499159697');
INSERT INTO `ghao_action_log` VALUES ('719', '12', '1', '0', 'schedule', '2', 'admin在2017-07-04 17:19新增或编辑了孙俊英医生2017-07-06在肾内科（高诊）的号表', '1', '1499159946');
INSERT INTO `ghao_action_log` VALUES ('720', '12', '1', '0', 'schedule', '2', 'admin在2017-07-04 17:20新增或编辑了孙俊英医生2017-07-06上午在肾内科（高诊）的号表', '1', '1499160017');
INSERT INTO `ghao_action_log` VALUES ('721', '13', '1', '0', 'schedule', '3', 'admin在2017-07-05 12:20删除了孙俊英医生2017-07-06上午在十梓街院区肾内科（高诊）的号表', '1', '1499228441');
INSERT INTO `ghao_action_log` VALUES ('722', '14', '1', '0', 'schedule', '4', 'admin在2017-07-05 12:49停诊了陈学仁医生2017-07-06上午在十梓街院区遗传咨询门诊（产前诊断）的号表', '1', '1499230178');
INSERT INTO `ghao_action_log` VALUES ('723', '15', '1', '0', 'schedule', '5', 'admin在2017-07-05 12:49复诊了陈学仁医生2017-07-06上午在十梓街院区遗传咨询门诊（产前诊断）的号表', '1', '1499230182');
INSERT INTO `ghao_action_log` VALUES ('724', '1', '1', '0', 'member', '1', 'admin在2017-07-06 12:34登录了后台', '1', '1499315675');
INSERT INTO `ghao_action_log` VALUES ('725', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:20新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499329201');
INSERT INTO `ghao_action_log` VALUES ('726', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:21新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499329317');
INSERT INTO `ghao_action_log` VALUES ('727', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:22新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499329371');
INSERT INTO `ghao_action_log` VALUES ('728', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:23新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499329387');
INSERT INTO `ghao_action_log` VALUES ('729', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:24新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499329467');
INSERT INTO `ghao_action_log` VALUES ('730', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:24新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499329479');
INSERT INTO `ghao_action_log` VALUES ('731', '12', '1', '0', 'schedule', '2', 'admin在2017-07-06 16:33新增或编辑了苏成海医生2017-07-14上午在肾内科（高诊）的号表', '1', '1499330010');
INSERT INTO `ghao_action_log` VALUES ('732', '1', '13', '0', 'member', '13', 's在2017-07-07 16:27登录了后台', '1', '1499416067');
INSERT INTO `ghao_action_log` VALUES ('733', '1', '13', '0', 'member', '13', 's在2017-07-07 16:30登录了后台', '1', '1499416221');
INSERT INTO `ghao_action_log` VALUES ('734', '10', '13', '0', 'Menu', '167', '操作url：/guahao0/admin.php?s=/Menu/add.html', '1', '1499830325');
INSERT INTO `ghao_action_log` VALUES ('735', '1', '1', '0', 'member', '1', 'admin在2017-07-12 11:32登录了后台', '1', '1499830352');
INSERT INTO `ghao_action_log` VALUES ('736', '1', '1', '0', 'member', '1', 'admin在2017-07-12 11:32登录了后台', '1', '1499830376');
INSERT INTO `ghao_action_log` VALUES ('737', '1', '1', '0', 'member', '1', 'admin在2017-07-12 11:33登录了后台', '1', '1499830402');
INSERT INTO `ghao_action_log` VALUES ('738', '12', '1', '0', 'schedule', '2', 'admin在2017-07-19 11:17新增或编辑了黄坚医生2017-07-20上午在血液内科门诊的号表', '1', '1500434274');
INSERT INTO `ghao_action_log` VALUES ('739', '12', '1', '0', 'schedule', '2', 'admin在2017-07-19 11:22新增或编辑了黄坚医生2017-07-20上午在血液内科门诊的号表', '1', '1500434520');
INSERT INTO `ghao_action_log` VALUES ('740', '12', '1', '0', 'schedule', '2', 'admin在2017-07-19 11:22新增或编辑了黄坚医生2017-07-20上午在血液内科门诊的号表', '1', '1500434537');
INSERT INTO `ghao_action_log` VALUES ('741', '12', '1', '0', 'schedule', '2', 'admin在2017-07-19 11:24新增或编辑了黄坚医生2017-07-20上午在血液内科门诊的号表', '1', '1500434676');
INSERT INTO `ghao_action_log` VALUES ('742', '12', '1', '0', 'schedule', '2', 'admin在2017-07-20 13:07新增或编辑了苏成海医生2017-07-24上午在多学科综合门诊(肥胖与糖尿病)的号表', '1', '1500527257');
INSERT INTO `ghao_action_log` VALUES ('743', '1', '1', '0', 'member', '1', 'admin在2017-07-21 15:21登录了后台', '1', '1500621670');
INSERT INTO `ghao_action_log` VALUES ('744', '12', '1', '0', 'schedule', '2', 'admin在2017-07-21 15:22新增或编辑了孙俊英医生2017-07-25全天在肾内科（高诊）的号表', '1', '1500621773');
INSERT INTO `ghao_action_log` VALUES ('745', '12', '1', '0', 'schedule', '2', 'admin在2017-07-26 17:21新增或编辑了黄坚医生2017-07-28下午在血液内科门诊的号表', '1', '1501060879');
INSERT INTO `ghao_action_log` VALUES ('746', '14', '1', '0', 'schedule', '4', 'admin在2017-07-26 17:25停诊了董万利医生2017-07-28上午在十梓街院区血液内科门诊的号表', '1', '1501061103');
INSERT INTO `ghao_action_log` VALUES ('747', '14', '1', '0', 'schedule', '4', 'admin在2017-07-26 17:25停诊了唐军医生2017-07-28上午在十梓街院区血液内科门诊的号表', '1', '1501061103');
INSERT INTO `ghao_action_log` VALUES ('748', '15', '1', '0', 'schedule', '5', 'admin在2017-07-26 17:26复诊了董万利医生2017-07-28上午在十梓街院区血液内科门诊的号表', '1', '1501061195');
INSERT INTO `ghao_action_log` VALUES ('749', '15', '1', '0', 'schedule', '5', 'admin在2017-07-26 17:26复诊了唐军医生2017-07-28上午在十梓街院区血液内科门诊的号表', '1', '1501061195');
INSERT INTO `ghao_action_log` VALUES ('750', '14', '1', '0', 'schedule', '4', 'admin在2017-07-26 17:26停诊了董万利医生2017-07-28下午在十梓街院区血液内科门诊的号表', '1', '1501061205');
INSERT INTO `ghao_action_log` VALUES ('751', '12', '1', '0', 'schedule', '2', 'admin在2017-08-01 11:17新增或编辑了黄坚医生2017-08-03上午在血液内科门诊的号表', '1', '1501557429');
INSERT INTO `ghao_action_log` VALUES ('752', '12', '1', '0', 'schedule', '2', 'admin在2017-08-01 11:17新增或编辑了黄坚医生2017-08-03上午在血液内科门诊的号表', '1', '1501557442');
INSERT INTO `ghao_action_log` VALUES ('753', '12', '1', '0', 'schedule', '2', 'admin在2017-08-01 11:22新增或编辑了医生2017-08-03上午在多学科综合门诊(脑卒中)的号表', '1', '1501557755');
INSERT INTO `ghao_action_log` VALUES ('754', '12', '1', '0', 'schedule', '2', 'admin在2017-08-01 11:22新增或编辑了医生2017-08-03上午在多学科综合门诊(脑卒中)的号表', '1', '1501557762');
INSERT INTO `ghao_action_log` VALUES ('755', '12', '1', '0', 'schedule', '2', 'admin在2017-08-01 11:22新增或编辑了医生2017-08-03上午在多学科综合门诊(脑卒中)的号表', '1', '1501557768');
INSERT INTO `ghao_action_log` VALUES ('756', '14', '1', '0', 'schedule', '4', 'admin在2017-08-02 15:20停诊了医生2017-08-03上午在总院多学科综合门诊(胰腺疾病)的号表', '1', '1501658407');
INSERT INTO `ghao_action_log` VALUES ('757', '1', '1', '0', 'member', '1', 'admin在2017-08-09 12:41登录了后台', '1', '1502253669');
INSERT INTO `ghao_action_log` VALUES ('758', '12', '1', '0', 'schedule', '2', 'admin在2017-08-09 17:21新增或编辑了[]医生2017-08-11下午在多学科综合门诊(脓毒症)的号表', '1', '1502270500');
INSERT INTO `ghao_action_log` VALUES ('759', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 19:05新增或编辑了[卫正洪]医生2017-08-21上午在骨科门诊的号表', '1', '1503227157');
INSERT INTO `ghao_action_log` VALUES ('760', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 19:12新增或编辑了[卫正洪]医生2017-08-21上午在骨科门诊的号表', '1', '1503227577');
INSERT INTO `ghao_action_log` VALUES ('761', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 19:13新增或编辑了[卫正洪]医生2017-08-21上午在骨科门诊的号表', '1', '1503227587');
INSERT INTO `ghao_action_log` VALUES ('762', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 19:30新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503228635');
INSERT INTO `ghao_action_log` VALUES ('763', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:37新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503232641');
INSERT INTO `ghao_action_log` VALUES ('764', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:37新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503232665');
INSERT INTO `ghao_action_log` VALUES ('765', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:38新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503232698');
INSERT INTO `ghao_action_log` VALUES ('766', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:38新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503232726');
INSERT INTO `ghao_action_log` VALUES ('767', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:40新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503232825');
INSERT INTO `ghao_action_log` VALUES ('768', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:48新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503233285');
INSERT INTO `ghao_action_log` VALUES ('769', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 20:48新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503233300');
INSERT INTO `ghao_action_log` VALUES ('770', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 21:06新增或编辑了[卫正洪]医生2017-08-22上午在骨科门诊的号表', '1', '1503234399');
INSERT INTO `ghao_action_log` VALUES ('771', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 21:07新增或编辑了[卫正洪]医生2017-08-29上午在骨科门诊的号表', '1', '1503234461');
INSERT INTO `ghao_action_log` VALUES ('772', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 21:11新增或编辑了[卫正洪]医生2017-09-05上午在骨科门诊的号表', '1', '1503234713');
INSERT INTO `ghao_action_log` VALUES ('773', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 21:12新增或编辑了[卫正洪]医生2017-09-05上午在骨科门诊的号表', '1', '1503234721');
INSERT INTO `ghao_action_log` VALUES ('774', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 21:12新增或编辑了[卫正洪]医生2017-09-05上午在骨科门诊的号表', '1', '1503234741');
INSERT INTO `ghao_action_log` VALUES ('775', '12', '1', '0', 'schedule', '2', 'admin在2017-08-20 21:25新增或编辑了[卫正洪]医生2017-09-12上午在骨科门诊的号表', '1', '1503235509');
INSERT INTO `ghao_action_log` VALUES ('776', '12', '1', '0', 'schedule', '2', 'admin在2017-08-31 12:21新增或编辑了[董天华]医生2017-09-01上午在心脏大血管外科门诊的号表', '1', '1504153263');
INSERT INTO `ghao_action_log` VALUES ('777', '12', '1', '0', 'schedule', '2', 'admin在2017-08-31 12:22新增或编辑了[董天华]医生2017-09-01上午在心脏大血管外科门诊的号表', '1', '1504153369');
INSERT INTO `ghao_action_log` VALUES ('778', '12', '1', '0', 'schedule', '2', 'admin在2017-08-31 12:23新增或编辑了[董天华]医生2017-09-01上午在心脏大血管外科门诊的号表', '1', '1504153388');
INSERT INTO `ghao_action_log` VALUES ('779', '12', '1', '0', 'schedule', '2', 'admin在2017-09-01 13:57新增或编辑了[卫正洪]医生2017-09-02上午在心脏大血管外科门诊的号表', '1', '1504245456');
INSERT INTO `ghao_action_log` VALUES ('780', '12', '1', '0', 'schedule', '2', 'admin在2017-09-01 13:59新增或编辑了[卫正洪]医生2017-09-02上午在心脏大血管外科门诊的号表', '1', '1504245542');
INSERT INTO `ghao_action_log` VALUES ('781', '1', '1', '0', 'member', '1', 'admin在2017-09-13 10:48登录了后台', '1', '1505270926');

-- ----------------------------
-- Table structure for `ghao_addons`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_addons`;
CREATE TABLE `ghao_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ghao_addons
-- ----------------------------
INSERT INTO `ghao_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `ghao_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `ghao_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `ghao_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `ghao_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `ghao_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `ghao_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for `ghao_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_attachment`;
CREATE TABLE `ghao_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of ghao_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_attribute`;
CREATE TABLE `ghao_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of ghao_attribute
-- ----------------------------
INSERT INTO `ghao_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ghao_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ghao_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ghao_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `ghao_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `ghao_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for `ghao_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_auth_extend`;
CREATE TABLE `ghao_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of ghao_auth_extend
-- ----------------------------
INSERT INTO `ghao_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `ghao_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `ghao_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `ghao_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `ghao_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `ghao_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `ghao_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `ghao_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for `ghao_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_auth_group`;
CREATE TABLE `ghao_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `tid` int(11) DEFAULT NULL COMMENT '诊区ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_auth_group
-- ----------------------------
INSERT INTO `ghao_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,3,4,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,177,195,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,226,227,230,232,233,235,237,238,239,240,241,242,243,244,245,250', null);
INSERT INTO `ghao_auth_group` VALUES ('4', 'admin', '1', '1FB普外神外', '', '1', '', '2');
INSERT INTO `ghao_auth_group` VALUES ('9', 'admin', '1', 'test', '描述', '1', '', null);
INSERT INTO `ghao_auth_group` VALUES ('6', 'admin', '1', '门诊部', '', '1', '', '0');
INSERT INTO `ghao_auth_group` VALUES ('8', 'admin', '1', 'ceshi2', '', '1', '53,100,102,103,107,177,207,213,219,220,221,226,230,233,238,240,242', null);

-- ----------------------------
-- Table structure for `ghao_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_auth_group_access`;
CREATE TABLE `ghao_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_auth_group_access
-- ----------------------------
INSERT INTO `ghao_auth_group_access` VALUES ('3', '4');
INSERT INTO `ghao_auth_group_access` VALUES ('13', '1');

-- ----------------------------
-- Table structure for `ghao_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_auth_rule`;
CREATE TABLE `ghao_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_auth_rule
-- ----------------------------
INSERT INTO `ghao_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '用户组管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '系统日志', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '系统管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('219', 'admin', '2', 'Admin/Book/index', '预约管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Book/index', '预约查询', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Schedule/index', '号表管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Schedule/index2', '号表模版', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Schedule/index3', '时间段管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Schedule/index4', '医生管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Schedule/index5', '科室管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('226', 'admin', '2', 'Admin/Schedule/index', '排班管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('227', 'admin', '1', 'Admin/Statistics/index', '门诊量报表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Statistics/index2', '门诊预约报表', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Statistics/index3', '门诊预约诊疗开展情况', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('230', 'admin', '2', 'Admin/Statistics/index', '数据统计分析', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Schedule/template', '号表模版', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Statistics/book', '门诊预约报表', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Statistics/develop', '门诊预约诊疗开展情况', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Schedule/doctor', '医生管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('235', 'admin', '1', 'Admin/Schedule/recommend', '推荐医生分组管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Schedule/dept', '病区管理', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('237', 'admin', '1', 'Admin/Time/index', '时间段管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('238', 'admin', '1', 'Admin/Doctor/index', '医生管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Dept/index', '病区管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Units/index', '科室管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Out/index', '医生出外诊', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Template/index', '号表模版', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('243', 'admin', '1', 'Admin/Polyclinic/index', '多学科综合门诊', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Triage/index', '诊区分诊管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('245', 'admin', '1', 'Admin/BelongTo/index', '医生归属管理', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('246', 'admin', '2', 'Admin/Questionnaire/Index', '问卷调差', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Questionnaire/Index', '问卷调查', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('248', 'admin', '2', 'Admin/Questionnaire/', '扩展功能', '-1', '');
INSERT INTO `ghao_auth_rule` VALUES ('249', 'admin', '1', 'Admin/Questionnaire/xlsout', '问卷导出', '1', '');
INSERT INTO `ghao_auth_rule` VALUES ('250', 'admin', '1', 'Admin/User/updateHospital', '修改院区', '1', '');

-- ----------------------------
-- Table structure for `ghao_category`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_category`;
CREATE TABLE `ghao_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of ghao_category
-- ----------------------------
INSERT INTO `ghao_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2,3', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0', '');
INSERT INTO `ghao_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2,3', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '0', '');

-- ----------------------------
-- Table structure for `ghao_channel`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_channel`;
CREATE TABLE `ghao_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_channel
-- ----------------------------
INSERT INTO `ghao_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `ghao_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `ghao_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for `ghao_config`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_config`;
CREATE TABLE `ghao_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_config
-- ----------------------------
INSERT INTO `ghao_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1467871828', '1', '苏大附一院预约挂号管理平台', '7');
INSERT INTO `ghao_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '苏大附一院预约挂号管理平台', '11');
INSERT INTO `ghao_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '苏大附一院预约挂号管理平台', '25');
INSERT INTO `ghao_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '12');
INSERT INTO `ghao_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '15');
INSERT INTO `ghao_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '27');
INSERT INTO `ghao_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '17');
INSERT INTO `ghao_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '20');
INSERT INTO `ghao_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '29');
INSERT INTO `ghao_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '21');
INSERT INTO `ghao_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '23');
INSERT INTO `ghao_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '26');
INSERT INTO `ghao_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '13');
INSERT INTO `ghao_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '16');
INSERT INTO `ghao_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '30');
INSERT INTO `ghao_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '18');
INSERT INTO `ghao_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '19');
INSERT INTO `ghao_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '22');
INSERT INTO `ghao_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '24');
INSERT INTO `ghao_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '28');
INSERT INTO `ghao_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '31');
INSERT INTO `ghao_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '32');
INSERT INTO `ghao_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1469068825', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture\r\n11:index/index', '8');
INSERT INTO `ghao_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '9');
INSERT INTO `ghao_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '10');
INSERT INTO `ghao_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '33');
INSERT INTO `ghao_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '14');
INSERT INTO `ghao_config` VALUES ('38', 'CALL_TYPE', '3', '出诊类型', '0', '', '', '1478669438', '1478669438', '1', '0:专家门诊\r\n1:特需门诊\r\n2:高级专家门诊\r\n3:专病门诊', '2');
INSERT INTO `ghao_config` VALUES ('39', 'UNIT_TYPE', '3', '科室类型', '0', '', '', '1479052667', '1479269864', '1', '0:临床科室\r\n1:医技科室\r\n2:科研机构\r\n3:行政部门\r\n4:党务部门\r\n5:教学部门', '3');
INSERT INTO `ghao_config` VALUES ('40', 'MEDICAL_FEATURE', '3', '医疗特色', '0', '', '', '1479107628', '1479269882', '1', '0:国家重点学科（实验室）\r\n1:国家临床重点专科\r\n2:省医学重点学科（实验室）\r\n3:省临床重点专科\r\n4:医院更多专科', '4');
INSERT INTO `ghao_config` VALUES ('41', 'REKEY', '1', '挂号请求确认密码', '0', '', '', '1483408755', '1483408815', '1', '908070', '5');
INSERT INTO `ghao_config` VALUES ('42', 'DOCTOR_REGISTER_DAY', '0', '医生诊间预约挂号天数', '0', '', '', '1483421622', '1483421622', '1', '14', '6');
INSERT INTO `ghao_config` VALUES ('43', 'HOSPITAL_TYPE', '3', '院区', '0', '', '', '1489467816', '1489467816', '1', '1:十梓街院区\r\n2:总院', '1');
INSERT INTO `ghao_config` VALUES ('44', 'WEEK_NO', '0', '模板复制到号表默认周数', '0', '', '', '1492495850', '1492495850', '1', '6', '0');
INSERT INTO `ghao_config` VALUES ('45', 'DOCTOR_OP_DAY', '0', '医生开放预约天数', '0', '', '', '1493089856', '1493089856', '1', '14', '0');
INSERT INTO `ghao_config` VALUES ('46', 'WARD_OP_DAY', '0', '出院预约开放天数', '0', '', '', '1493089905', '1493089905', '1', '14', '0');

-- ----------------------------
-- Table structure for `ghao_config_list`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_config_list`;
CREATE TABLE `ghao_config_list` (
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'config名',
  `value` varchar(40) DEFAULT NULL COMMENT '值',
  `key` varchar(20) NOT NULL DEFAULT '' COMMENT '索引名',
  PRIMARY KEY (`name`,`key`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_config_list
-- ----------------------------
INSERT INTO `ghao_config_list` VALUES ('CALL_TYPE', '专家门诊', '0');
INSERT INTO `ghao_config_list` VALUES ('CALL_TYPE', '特需门诊', '1');
INSERT INTO `ghao_config_list` VALUES ('CALL_TYPE', '高级专家门诊', '2');
INSERT INTO `ghao_config_list` VALUES ('CALL_TYPE', '专病门诊', '3');
INSERT INTO `ghao_config_list` VALUES ('MEDICAL_FEATURE', '国家重点学科（实验室）', '0');
INSERT INTO `ghao_config_list` VALUES ('MEDICAL_FEATURE', '国家临床重点专科', '1');
INSERT INTO `ghao_config_list` VALUES ('MEDICAL_FEATURE', '省医学重点学科（实验室）', '2');
INSERT INTO `ghao_config_list` VALUES ('MEDICAL_FEATURE', '省临床重点专科', '3');
INSERT INTO `ghao_config_list` VALUES ('MEDICAL_FEATURE', '医院更多专科', '4');
INSERT INTO `ghao_config_list` VALUES ('UNIT_TYPE', '临床科室', '0');
INSERT INTO `ghao_config_list` VALUES ('UNIT_TYPE', '医技科室', '1');
INSERT INTO `ghao_config_list` VALUES ('UNIT_TYPE', '科研机构', '2');
INSERT INTO `ghao_config_list` VALUES ('UNIT_TYPE', '行政部门', '3');
INSERT INTO `ghao_config_list` VALUES ('UNIT_TYPE', '党务部门', '4');
INSERT INTO `ghao_config_list` VALUES ('UNIT_TYPE', '教学部门', '5');

-- ----------------------------
-- Table structure for `ghao_document`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_document`;
CREATE TABLE `ghao_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of ghao_document
-- ----------------------------
INSERT INTO `ghao_document` VALUES ('1', '1', '', 'OneThink1.1开发版发布', '2', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '10', '0', '0', '0', '1406001413', '1406001413', '1');

-- ----------------------------
-- Table structure for `ghao_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_document_article`;
CREATE TABLE `ghao_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of ghao_document_article
-- ----------------------------
INSERT INTO `ghao_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');

-- ----------------------------
-- Table structure for `ghao_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_document_download`;
CREATE TABLE `ghao_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of ghao_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_file`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_file`;
CREATE TABLE `ghao_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of ghao_file
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_hooks`;
CREATE TABLE `ghao_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_hooks
-- ----------------------------
INSERT INTO `ghao_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `ghao_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `ghao_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `ghao_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `ghao_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `ghao_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `ghao_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `ghao_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `ghao_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `ghao_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `ghao_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');

-- ----------------------------
-- Table structure for `ghao_member`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_member`;
CREATE TABLE `ghao_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `hospital_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '院区',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ghao_member
-- ----------------------------
INSERT INTO `ghao_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '1030', '524', '0', '1467868340', '0', '1505270926', '1', '2');
INSERT INTO `ghao_member` VALUES ('3', 'nurse', '0', '0000-00-00', '', '50', '21', '0', '0', '2886732565', '1483938474', '1', '1');
INSERT INTO `ghao_member` VALUES ('12', '杨贤', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1', '1');
INSERT INTO `ghao_member` VALUES ('13', '六位', '0', '0000-00-00', '', '10', '2', '0', '0', '0', '1499416221', '1', '1');

-- ----------------------------
-- Table structure for `ghao_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_menu`;
CREATE TABLE `ghao_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `icon` int(10) DEFAULT NULL COMMENT '菜单前小图标',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_menu
-- ----------------------------
INSERT INTO `ghao_menu` VALUES ('2', '内容', '0', '6', 'Article/index', '1', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('16', '用户', '0', '5', 'User/index', '1', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('43', '扩展', '0', '9', 'Addons/index', '1', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('58', '模型管理', '68', '15', 'Model/index', '0', '', '系统设置', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('63', '属性管理', '68', '13', 'Attribute/index', '1', '网站属性配置。', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('68', '系统管理', '0', '4', 'Menu/index', '0', '', '', '0', '1', '10');
INSERT INTO `ghao_menu` VALUES ('69', '网站设置', '68', '10', 'Config/group', '0', '', '系统设置', '0', '1', '17');
INSERT INTO `ghao_menu` VALUES ('70', '配置管理', '68', '12', 'Config/index', '0', '', '系统设置', '0', '1', '29');
INSERT INTO `ghao_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('75', '菜单管理', '68', '9', 'Menu/index', '0', '', '系统设置', '0', '1', '3');
INSERT INTO `ghao_menu` VALUES ('76', '导航管理', '68', '16', 'Channel/index', '1', '', '系统设置', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('80', '分类管理', '68', '14', 'Category/index', '1', '', '系统设置', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('86', '备份数据库', '68', '10', 'Database/index?type=export', '1', '', '数据库操作', '0', '1', '27');
INSERT INTO `ghao_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('90', '还原数据库', '68', '11', 'Database/index?type=import', '1', '', '系统设置', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('93', '其他', '0', '8', 'other', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1', null);
INSERT INTO `ghao_menu` VALUES ('124', '用户管理', '68', '3', 'User/index', '0', '', '系统设置', '0', '1', '4');
INSERT INTO `ghao_menu` VALUES ('125', '用户组管理', '68', '4', 'AuthManager/index', '0', '', '系统设置', '0', '1', '5');
INSERT INTO `ghao_menu` VALUES ('126', '系统日志', '68', '6', 'Action/actionlog', '0', '', '系统设置', '0', '1', '7');
INSERT INTO `ghao_menu` VALUES ('127', '排班管理', '0', '1', 'Schedule/index', '0', '', '', '0', '1', '6');
INSERT INTO `ghao_menu` VALUES ('128', '号表管理', '127', '1', 'Schedule/index', '0', '', '排班管理', '0', '1', '14');
INSERT INTO `ghao_menu` VALUES ('129', '号表模版', '127', '2', 'Template/index', '0', '', '排班管理', '0', '1', '13');
INSERT INTO `ghao_menu` VALUES ('130', '时间段管理', '127', '10', 'Time/index', '0', '', '排班管理', '0', '1', '16');
INSERT INTO `ghao_menu` VALUES ('131', '医生管理', '127', '4', 'Doctor/index', '0', '', '排班管理', '0', '1', '11');
INSERT INTO `ghao_menu` VALUES ('133', '预约管理', '0', '2', 'Book/index', '0', '', '', '0', '1', '9');
INSERT INTO `ghao_menu` VALUES ('134', '预约查询', '133', '0', 'Book/index', '0', '', '预约管理', '0', '1', '15');
INSERT INTO `ghao_menu` VALUES ('135', '数据统计分析', '0', '3', 'Statistics/index', '0', '', '', '0', '1', '8');
INSERT INTO `ghao_menu` VALUES ('136', '门诊量报表', '135', '1', 'Statistics/index', '0', '', '数据统计分析', '0', '1', '20');
INSERT INTO `ghao_menu` VALUES ('137', '门诊预约报表', '135', '2', 'Statistics/book', '0', '', '数据统计分析', '0', '1', '18');
INSERT INTO `ghao_menu` VALUES ('138', '门诊预约诊疗开展情况', '135', '3', 'Statistics/develop', '0', '', '数据统计分析', '0', '1', '19');
INSERT INTO `ghao_menu` VALUES ('139', '首页', '0', '7', 'Index/index', '1', '', '', '0', '1', '5');
INSERT INTO `ghao_menu` VALUES ('140', '病区管理', '127', '5', 'Dept/index', '0', '', '', '0', '1', '12');
INSERT INTO `ghao_menu` VALUES ('141', '推荐医生分组管理', '127', '11', 'Schedule/recommend', '0', '', '', '0', '1', '30');
INSERT INTO `ghao_menu` VALUES ('142', '科室管理', '127', '3', 'Units/index', '0', '', '', '0', '1', '25');
INSERT INTO `ghao_menu` VALUES ('144', '用户行为', '68', '5', 'User/action', '0', '', '行为管理', '0', '1', '26');
INSERT INTO `ghao_menu` VALUES ('148', '新增用户行为', '144', '0', 'User/addaction', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('146', '备份数据库', '68', '7', 'Database/index?type=export', '0', '', '数据库操作', '0', '1', '27');
INSERT INTO `ghao_menu` VALUES ('147', '还原数据库', '68', '8', 'Database/index?type=import', '0', '', '数据库操作', '0', '1', '28');
INSERT INTO `ghao_menu` VALUES ('149', '编辑用户行为', '144', '0', 'User/editaction', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('150', '保存用户行为', '144', '0', 'User/saveAction', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('151', '变更行为状态', '144', '0', 'User/setStatus', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('152', '禁用会员', '144', '0', 'User/changeStatus?method=forbidUser', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('153', '启用会员', '144', '0', 'User/changeStatus?method=resumeUser', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('154', '删除会员', '144', '0', 'User/changeStatus?method=deleteUser', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('155', '备份', '146', '0', 'Database/export', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('156', '优化表', '146', '0', 'Database/optimize', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('157', '修复表', '146', '0', 'Database/repair', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('158', '恢复', '147', '0', 'Database/import', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('159', '删除', '147', '0', 'Database/del', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('160', '医生出外诊', '127', '8', 'Out/index', '0', '', '', '0', '0', '28');
INSERT INTO `ghao_menu` VALUES ('161', '多学科综合门诊', '127', '9', 'Polyclinic/index', '0', '', '', '0', '0', '30');
INSERT INTO `ghao_menu` VALUES ('162', '诊区分诊管理', '127', '6', 'Triage/index', '0', '', '', '0', '0', '30');
INSERT INTO `ghao_menu` VALUES ('163', '医生归属管理', '127', '7', 'BelongTo/index', '0', '', '医生归属', '0', '1', '18');
INSERT INTO `ghao_menu` VALUES ('167', '修改院区', '16', '0', 'User/updateHospital', '0', '', '', '0', '1', '0');
INSERT INTO `ghao_menu` VALUES ('166', '问卷导出', '164', '0', 'Admin/Questionnaire/xlsout', '1', '', '', '0', '1', '0');

-- ----------------------------
-- Table structure for `ghao_model`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_model`;
CREATE TABLE `ghao_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of ghao_model
-- ----------------------------
INSERT INTO `ghao_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `ghao_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `ghao_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for `ghao_picture`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_picture`;
CREATE TABLE `ghao_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=678 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_picture
-- ----------------------------
INSERT INTO `ghao_picture` VALUES ('1', '/Uploads/Picture/2016-07-07/577e0e644b649.png', '', '548e46b064621f0113728bea7f907ef3', '4208143fb3f6c51185e8ebf15de32a2c84c135ad', '1', '1467879011');
INSERT INTO `ghao_picture` VALUES ('2', '/Uploads/Picture/2016-07-07/577e0ed74ca36.png', '', 'fb35e8b8e17f5b70c288b7cc106c612d', '4ab76989942c964e3067ddba8c4a177ac3c4b386', '1', '1467879127');
INSERT INTO `ghao_picture` VALUES ('3', '/Uploads/Picture/2016-07-21/57907ff041690.png', '', '52c594adc8319622df36a629206a160a', '21eeb57adc7b123738211cd0f84926387b536f18', '1', '1469087727');
INSERT INTO `ghao_picture` VALUES ('4', '/Uploads/Picture/2016-07-21/579081b28bb1d.png', '', '74c855ddb4baa2180354a8f6964ea994', '97a5f8b6afb8e10712b58bafcfd462b9917d115a', '1', '1469088178');
INSERT INTO `ghao_picture` VALUES ('5', '/Uploads/Picture/2016-07-21/579081c072be0.png', '', 'b2475f86e7d591cc2ea8519241dbfcfb', 'c43dab724900acae17ad439c3fbbe40b14f07f6e', '1', '1469088192');
INSERT INTO `ghao_picture` VALUES ('6', '/Uploads/Picture/2016-07-22/579179f39a5bf.png', '', 'b6394c76a9f17c880cac093cb3b14966', 'a3e278bbbba841b557908a56565077b60c898371', '1', '1469151729');
INSERT INTO `ghao_picture` VALUES ('7', '/Uploads/Picture/2016-07-22/57917a0be8946.png', '', '4141897938165104547ee20c58b1c846', '916f3b90f7e88faa3749c7cdf32dccfca878070d', '1', '1469151755');
INSERT INTO `ghao_picture` VALUES ('8', '/Uploads/Picture/2016-07-22/57917a473e43e.png', '', 'a33a4add1c197829e2da8973f7577f77', '4aaf99a4d4edbc6ac0d81dd3120e167e3447e836', '1', '1469151815');
INSERT INTO `ghao_picture` VALUES ('9', '/Uploads/Picture/2016-07-22/57917a58ca28b.png', '', 'c2f7c1d152e1d1301fdc16d63704801e', 'f68fc8c704d165f460b00af82054fa656fe5a8af', '1', '1469151832');
INSERT INTO `ghao_picture` VALUES ('10', '/Uploads/Picture/2016-07-22/57917a9cd03c5.png', '', '2c9232961fd58dd70851d143852fdc00', '03a7a0a714b7f18dd8fcacc579ff188f1f0a6b6c', '1', '1469151900');
INSERT INTO `ghao_picture` VALUES ('11', '/Uploads/Picture/2016-07-22/57917ac38e9d5.png', '', '3cb7552640c63a3e40f4c2d060c9e257', '9ce14c72e52a65896f9d1d26b1f93b9c80baf2f9', '1', '1469151939');
INSERT INTO `ghao_picture` VALUES ('12', '/Uploads/Picture/2016-07-22/57917b4acd4b5.png', '', '29d0e1de9ed936b0278376d5015c277a', '15c8d270e7fe494e7691bcf986c2640bb13b0612', '1', '1469152074');
INSERT INTO `ghao_picture` VALUES ('13', '/Uploads/Picture/2016-07-22/57917b612cb7b.png', '', 'e48238066549fcb10f729b8c0b413868', 'dfd3b682aa373cb6f65cc931cb93fc8f9c2dfb31', '1', '1469152097');
INSERT INTO `ghao_picture` VALUES ('14', '/Uploads/Picture/2016-07-22/57917b708e19c.png', '', '873c1080a5083058566ba2ba97fd11cf', '6c64422242be55d85a4eaff63a08ee2d8dc32a81', '1', '1469152112');
INSERT INTO `ghao_picture` VALUES ('15', '/Uploads/Picture/2016-07-22/57917c4e6572b.png', '', 'a93dbca485967cc8d99af5374fffff76', '44840fd6d9b581af1ab3a0895f2e53964fd89a35', '1', '1469152333');
INSERT INTO `ghao_picture` VALUES ('16', '/Uploads/Picture/2016-07-22/57917d05969a0.png', '', '56df185cc9e71c4ab8ce32ee46dbf14e', 'f41457c3c3c284f36da6915444831b476760514c', '1', '1469152517');
INSERT INTO `ghao_picture` VALUES ('17', '/Uploads/Picture/2016-07-22/57917d2bc1589.png', '', '470415d935d3b7d877b43ecffa14fb61', '3525fcc7c25dae99d310a1d410e8fa8d08019c69', '1', '1469152555');
INSERT INTO `ghao_picture` VALUES ('18', '/Uploads/Picture/2016-07-22/57917e7ed80ef.png', '', '44bf5e26c2d416ec51153a9cb17171b1', 'dbc867420363712ed9d370fdf1ad3a951b279a52', '1', '1469152894');
INSERT INTO `ghao_picture` VALUES ('19', '/Uploads/Picture/2016-07-22/57917e892c53b.png', '', '9a97ae662012372a5490bb3b91993492', '59226ea2bf471f9bb898ead44b91d160f077263b', '1', '1469152905');
INSERT INTO `ghao_picture` VALUES ('20', '/Uploads/Picture/2016-07-22/57917fb7840b9.png', '', 'ac00749f6300c4cf6acbe77192986c3a', '28a4f09984945afe2bf9ba8defdadc99581563c8', '1', '1469153207');
INSERT INTO `ghao_picture` VALUES ('21', '/Uploads/Picture/2016-08-01/579ef04febb0f.png', '', '986336d65eb4eb1a3c2918e61f4be5a2', '11fcca18f142d954e7cd6464dd137f38f9912e70', '1', '1470033999');
INSERT INTO `ghao_picture` VALUES ('22', '/Uploads/Picture/2016-08-03/57a1993d69082.jpg', '', 'e13000f425c9f47ad13d5d12853728c5', '220457691ce4c49b27871a3bf16b26d270892400', '1', '1470208315');
INSERT INTO `ghao_picture` VALUES ('23', '/Uploads/Picture/2016-08-03/57a19a958f48f.png', '', 'b3b7659362ffba0f4d67c6cd84467c78', 'edf142a78c7dbe79ef8964476eec3b01421e1f37', '1', '1470208661');
INSERT INTO `ghao_picture` VALUES ('24', '/Uploads/Picture/2016-10-08/57f88e6c6b6e2.png', '', 'c92b12aae35d0f927556746b113c764c', 'a5b35c11167fe36038442a6889d8b5489fd8d555', '1', '1475907179');
INSERT INTO `ghao_picture` VALUES ('25', '/Uploads/Picture/2016-10-12/57fde4fe14c5f.png', '', '1878f3f2fede9144d2ac49a28873f672', 'd627b60ab5e762778c842a899d53328c92e6b953', '1', '1476257021');
INSERT INTO `ghao_picture` VALUES ('26', '/Uploads/Picture/2016-10-12/57fde514738a7.png', '', 'ac4b399b4928b22bf3a5c1e864ec1baf', 'f5c589cfcf89410b7d2ec7f5923913590927bc24', '1', '1476257044');
INSERT INTO `ghao_picture` VALUES ('27', '/Uploads/Picture/2016-10-12/57fde526a3488.png', '', 'cc02a5540e2f126f7e7f40ffa9825c93', '447dffe2503b50bb2e316e9c758f22511c1e8306', '1', '1476257062');
INSERT INTO `ghao_picture` VALUES ('28', '/Uploads/Picture/2016-10-12/57fde53464c93.png', '', '01ec5384f4d994d2ccedd0f9d4571832', 'b44dc9bc3e65e9bb93c1546037af109bf34a2a53', '1', '1476257076');
INSERT INTO `ghao_picture` VALUES ('29', '/Uploads/Picture/2016-10-12/57fde5c540a7a.png', '', '69b3fd45121e4d6a1b1b72aa319c887d', '1392ff0135fc35103925981af4a1bbd5ed875689', '1', '1476257221');
INSERT INTO `ghao_picture` VALUES ('30', '/Uploads/Picture/2016-10-12/57fde6176eb12.png', '', 'bc4e139e4a61faff1507fa5ba9109a8a', '16974c603e7c332bc6b12942c197b5d45d9adcfc', '1', '1476257303');
INSERT INTO `ghao_picture` VALUES ('31', '/Uploads/Picture/2016-10-13/57ff39a4b5d23.jpg', '', '30dec94a194bc47882fdf32c0d850399', '5430457695371abefab2803115f12b9672841c7f', '1', '1476344228');
INSERT INTO `ghao_picture` VALUES ('32', '/Uploads/Picture/2016-11-13/582870e8ed2d5.jpg', '', '7e5e9e4cdd431674c781f84de87e875e', '5ca93a059a6c0f5a894bf35d61628031dd9b6746', '1', '1479045351');
INSERT INTO `ghao_picture` VALUES ('33', '/Uploads/Picture/2016-11-13/5828780e0a484.png', '', 'abded1da9d61ddf404f744a28ad8cb36', 'da9322956f88cdb875e78d0f8da7c6393250d9b3', '1', '1479047181');
INSERT INTO `ghao_picture` VALUES ('34', '/Uploads/Picture/2016-11-13/5828781450c4c.PNG', '', '9be4558e38540fe0b076939d9ce79b91', '91c736f788b04e0e90ab844d8468e7b5200dac11', '1', '1479047188');
INSERT INTO `ghao_picture` VALUES ('35', '/Uploads/Picture/2016-11-13/582879dd62a24.PNG', '', '260e1d27bd647bb8e863979faf35e3b7', 'eeb8f815c2948c47231586bd0eef23c8686b708b', '1', '1479047644');
INSERT INTO `ghao_picture` VALUES ('36', '/Uploads/Picture/2016-11-13/58287ab0749dc.jpg', '', '5b33acfd79b954f390dd4688f4331902', 'f315231f3121fad6beb40b04a7596e4522f73e6d', '1', '1479047856');
INSERT INTO `ghao_picture` VALUES ('37', '/Uploads/Picture/2016-11-13/58287b19ed5d5.jpg', '', '32948a29f5e7169de52bff438879eca6', '132566d4ebe8f48226ab208cca635e2f5d713d6b', '1', '1479047961');
INSERT INTO `ghao_picture` VALUES ('38', '/Uploads/Picture/2016-11-14/582897df5c994.jpg', '', '95f79d1fe31e711832f2473f13fc872a', 'b86dde1835ab8eeee0614d1c6d5c2d03d61cf40a', '1', '1479055327');
INSERT INTO `ghao_picture` VALUES ('39', '/Uploads/Picture/2016-11-14/582954a614ed3.png', '', '0ae3968bbf0c796368f1bae2cf473ff1', '9546cd2b6e869043de0cc1226b76433269b0b82a', '1', '1479103653');
INSERT INTO `ghao_picture` VALUES ('40', '/Uploads/Picture/2016-11-14/582954c9a038f.png', '', '32f9f7d20225bef456adf72639e26f89', 'f7c7395ac26b3668e9cf1fc7c3b7337458a6de5f', '1', '1479103689');
INSERT INTO `ghao_picture` VALUES ('41', '/Uploads/Picture/2016-11-14/582955050bb1e.png', '', 'b1d7bcf8a7dde9ad1cc932fede5fb80d', '927ade7b4f9ea251fe12fe9f42dda28bd1538927', '1', '1479103748');
INSERT INTO `ghao_picture` VALUES ('42', '/Uploads/Picture/2016-11-14/58295507b77f3.png', '', '3ee3435b7f2315c655dc89ccf8ffd914', '0c706e6a31b3d073fc4da3fbcdc83d9ebe3394ed', '1', '1479103751');
INSERT INTO `ghao_picture` VALUES ('43', '/Uploads/Picture/2016-11-14/582958bcb85b2.png', '', '882bfa66bccbd599964da920404f9434', '021d42eb6b7f199d75028975848fc337ae7ae2a8', '1', '1479104700');
INSERT INTO `ghao_picture` VALUES ('44', '/Uploads/Picture/2016-11-14/582958c3e9849.png', '', 'f37e8db8d5ec3fd461dc49de874e3517', 'bda8d379cd816454eeaafea14400f058da1e18f6', '1', '1479104707');
INSERT INTO `ghao_picture` VALUES ('45', '/Uploads/Picture/2016-11-14/58295b36bc608.png', '', 'a5f09d17d90a3c021b3e5caf7569b839', 'a12cd124cc1d8d0f84eeccaee0b6f9c4ccf4ac79', '1', '1479105334');
INSERT INTO `ghao_picture` VALUES ('46', '/Uploads/Picture/2016-11-16/582bfa72a747f.png', '', '311f3b5fee9fa4a0f496c7cda6258da7', '5fb1a7ee0acbe7ee8aa13b024b4aac807e6d1b91', '1', '1479277170');
INSERT INTO `ghao_picture` VALUES ('47', '/Uploads/Picture/2016-11-16/582c10538d6d6.jpg', '', 'fafa5efeaf3cbe3b23b2748d13e629a1', '54c2f1a1eb6f12d681a5c7078421a5500cee02ad', '1', '1479282770');
INSERT INTO `ghao_picture` VALUES ('48', '/Uploads/Picture/2016-11-22/5833e21b4fa1b.png', '', 'abcf2d1550166ffe0c21d43ac2ddb65b', '79fce59e4a862d3f028ed1eb1cf0e0fc08f9e2d6', '1', '1479795226');
INSERT INTO `ghao_picture` VALUES ('49', '/Uploads/Picture/2016-11-22/5833e2951d17e.png', '', 'dca94302fc16a18bc702c7ff1181868f', '81d4011f74032379b5f068930463c70bd7f0576b', '1', '1479795348');
INSERT INTO `ghao_picture` VALUES ('50', '/Uploads/Picture/2016-11-22/5833e2f963c48.png', '', '0e2e85232d8e002d3ed28da25569f974', '002bf4a3c2ce9c244cc8503102a306c4a151d29f', '1', '1479795449');
INSERT INTO `ghao_picture` VALUES ('51', '/Uploads/Picture/2016-11-28/583bcea8d82a6.png', '', '664de78dd48e71c4d0dfa0e32a05392d', '380a9b879d7ae4c55d3a1c0d1cb1d8c3e3ac236b', '1', '1480314536');
INSERT INTO `ghao_picture` VALUES ('52', '/Picture/2016-11-28/583bd27715ad8.png', '', 'd7c2cee282db54370923798982b8351e', '9c9f8b4de94c7397bee75b47413e9afcace0d39a', '1', '1480315511');
INSERT INTO `ghao_picture` VALUES ('53', '/Uploads/Picture/2016-11-28/583bd4160e063.png', '', 'f513355085caa63d47244405f649e639', '52501feb4d508ce18f53c8f8fbc9c45057e54f2f', '1', '1480315925');
INSERT INTO `ghao_picture` VALUES ('54', '/Uploads/Picture/2016-11-28/583bd42015195.png', '', '6d38346e241449eb86120954f05da702', '776a58335f78c8eea415f3626ed28eb789beaa13', '1', '1480315935');
INSERT INTO `ghao_picture` VALUES ('55', '/Picture/2016-11-28/583bda36dd998.png', '', '407768fad8a77c73ccda9ce185aa8f1b', '03df61db9fad15833ef3d2ab8bbe0c31d3dd73b2', '1', '1480317494');
INSERT INTO `ghao_picture` VALUES ('56', '/Uploads/Picture/2016-11-28/583bef67d04ed.png', '', 'e47d2979074747f3890cd737d2bf463b', '635089a8cf1731cebbc4b3599a54a9d10bde6355', '1', '1480322919');
INSERT INTO `ghao_picture` VALUES ('57', '/Docpic2016-11-30/583e31b8bf4b0.png', '', '61493caa0738764653171a0e826c0fe5', 'f65a07048826e391f0bac6edae547f3f7995b015', '1', '1480470968');
INSERT INTO `ghao_picture` VALUES ('58', '/Docpic2016-11-30/583e31c3d330b.png', '', 'ec7ab77b52016d2b0aae2405962f0c90', '002ffff0776e5f82a3ce81674af8a50a601ef4f0', '1', '1480470979');
INSERT INTO `ghao_picture` VALUES ('59', '/Docpic2016-11-30/583e31cbb3f43.png', '', '1b8cb7b2271be0fb9f6c9960d32695b2', 'cceee18cd585efa78c3cacdbcc67d2bedb84813b', '1', '1480470987');
INSERT INTO `ghao_picture` VALUES ('60', '/Docpic/2016-11-30/583e31e81bc21.png', '', 'ce4e95d1ee03259d58a8a42214061c9a', '70cafb760e471523b4c577221534b081f380bb3e', '1', '1480471015');
INSERT INTO `ghao_picture` VALUES ('61', '/Docpic/2016-11-30/583e31f32a45e.png', '', 'cc5d421de15a623ecaa2bf2a03b4fe7d', '2cbc00a6bf18b01d1547af7b609e2c842979f96b', '1', '1480471027');
INSERT INTO `ghao_picture` VALUES ('62', '/Docpic/2016-11-30/583e320550b80.png', '', '94609924771849cd7b965b634bbc08e4', 'b86e718a0f9d3788e96dd44603629353fcf5765b', '1', '1480471045');
INSERT INTO `ghao_picture` VALUES ('63', '/Docpic/2016-11-30/583e3208750d4.png', '', 'c84e21e1e80bc113e61e52ed2e3de77f', '5cb92d7daedb801fbe87249f36242e746fc3b6f9', '1', '1480471048');
INSERT INTO `ghao_picture` VALUES ('64', '/Docpic/2016-11-30/583e320bd9201.png', '', 'a71ecc70c7846fc18301d340c9f4ff4d', '684fa151db607b46f0d87cb4fe0bbf3064b0e057', '1', '1480471051');
INSERT INTO `ghao_picture` VALUES ('65', '/Docpic/2016-11-30/583e320f4be17.png', '', 'e0d4b8924e4e3578392301ca9dca2db2', 'e5ec3cb3fea752e77ae315e37527591010872943', '1', '1480471055');
INSERT INTO `ghao_picture` VALUES ('66', '/Uploads/Docpic/2016-11-30/583e32ea8cc5c.png', '', '596f930e177f712a6f85c36d97e25532', '8b7e17b51d2e142d739f7389d741e22b1f1161bd', '1', '1480471274');
INSERT INTO `ghao_picture` VALUES ('67', '/Uploads/Docpic/2016-11-30/583e32f1a94e7.jpg', '', '6d20adea33775a8700fdc0d5736c9701', '29681f6e12d1e7bc6d9976db8c8299284eeb321e', '1', '1480471281');
INSERT INTO `ghao_picture` VALUES ('481', '/Uploads/Docpic/2016-12-26/5860b18059ca2.jpg', '', '4b973f71fdc47092f2ff0daa61e465a3', 'c6c423fb29f41ce3449ca1d4ac9c72bf421780af', '1', '1482731904');
INSERT INTO `ghao_picture` VALUES ('69', '/Uploads/Picture/2016-12-05/5844ccccd9ebe.png', '', '50bd775ffd6d5489c08da7282941b1c9', '559cae5d1491d632bf69688f8fe1fc30a89b3725', '1', '1480903884');
INSERT INTO `ghao_picture` VALUES ('70', '/Uploads/Picture/2016-12-05/5844cccf8c4e4.png', '', 'a9dc0b97fc16ce52c98af3d9f6a079c1', '30bffaff0873de709c0788e77b888c863d0e74b4', '1', '1480903887');
INSERT INTO `ghao_picture` VALUES ('359', '/Uploads/Docpic/2016-12-23/585cb70845ea1.jpg', '', 'ca9b9392d6b0111ef7155b38d6ba9566', 'ee339ece2daef8abb3345451a78fa1131d1e1d76', '1', '1482471176');
INSERT INTO `ghao_picture` VALUES ('95', '/Uploads/Docpic/2016-12-07/5847b945a6eb1.png', '', 'f8ee3b44bcfea54b5a118da10fd22e4e', '00bbc9e684fa917eca2338a92b0b6ef611399b5e', '1', '1481095493');
INSERT INTO `ghao_picture` VALUES ('92', '/Uploads/Docpic/2016-12-07/5847afe806763.png', '', '97588c4c4cc1fb32ea95567d325ed88c', '13f77617cedcf443ceef9cdfe46c6ebbf4a847cc', '1', '1481093095');
INSERT INTO `ghao_picture` VALUES ('426', '/Uploads/Docpic/2016-12-23/585ccce0f32dd.jpg', '', '1e49d0b5840d93a7782d375aeaa4fc7d', '860e00a7b45c386f9f319520ebb5769e635350bc', '1', '1482476768');
INSERT INTO `ghao_picture` VALUES ('75', '/Uploads/Docpic/2016-12-05/5844d025556d6.png', '', '5dd5088cbdac0e70f9ad7cecc76d3730', '8e23f149e3d15be09b342f71876101e50c18121e', '1', '1480904741');
INSERT INTO `ghao_picture` VALUES ('76', '/Uploads/Docpic/2016-12-05/5844d02d24d74.png', '', 'aeebdc89b7dab0fe6150124a07bebb29', '2d9b8c8217bbc67c1fbe2d4434e3fc697a64ddf7', '1', '1480904749');
INSERT INTO `ghao_picture` VALUES ('272', '/Uploads/Docpic/2016-12-22/585b85306380a.jpg', '', 'c6b4a6655f96a5e838590bcb3dd1ae95', '006557e59514e8fe259f7d61bc9c65d1b3c01c18', '1', '1482392880');
INSERT INTO `ghao_picture` VALUES ('84', '/Uploads/Docpic/2016-12-06/584654a870356.png', '', '34d130ac68e01e7d2de55eacd4260fe6', '3f3af6371f97c140b7bf2f01b6941f49ac9245b1', '1', '1481004200');
INSERT INTO `ghao_picture` VALUES ('215', '/Uploads/Docpic/2016-12-22/585b787161286.jpg', '', '878f2b95a7fb753fd1ac54287a4b5681', '06080ae6d4ff2ef7874e03f5f546eb7f1fa12405', '1', '1482389617');
INSERT INTO `ghao_picture` VALUES ('425', '/Uploads/Docpic/2016-12-23/585cccc8b2220.jpg', '', 'e553a7ae2ab16c7baf592f7778dbb9ca', 'e5496f502d1116efeea5b80c0d7a57625b42234a', '1', '1482476744');
INSERT INTO `ghao_picture` VALUES ('91', '/Uploads/Docpic/2016-12-07/5847afe2d1a9b.png', '', 'b304e8aeabf823e755ab8a091e05c4af', 'e1780432ddfc6c48454e65c35a1d88b58263ba3d', '1', '1481093090');
INSERT INTO `ghao_picture` VALUES ('94', '/Uploads/Docpic/2016-12-07/5847b943ae954.png', '', '7a9e9d638f86490e70b1db693382d959', '9dc11ae974c22bb73139f40efc80384a80fede00', '1', '1481095491');
INSERT INTO `ghao_picture` VALUES ('420', '/Uploads/Docpic/2016-12-23/585ccc30ef696.jpg', '', 'af2c1035980ce9c6f041d189aacd31fd', '39d61ef978982d1541722f1b8a7ce80fa1006b18', '1', '1482476592');
INSERT INTO `ghao_picture` VALUES ('256', '/Uploads/Docpic/2016-12-22/585b826ea39ad.jpg', '', 'fb199ee07609ec3799333c23dac429ea', '28a860f35165633d53156fd2f4a0f349b5f0f6e9', '1', '1482392174');
INSERT INTO `ghao_picture` VALUES ('319', '/Uploads/Docpic/2016-12-23/585c912b0a9d0.jpg', '', 'f455863c12951f46b64ebb10767882d9', 'ff5b4a955a479ebdbc1bdfd0cb3c411cb31aba06', '1', '1482461482');
INSERT INTO `ghao_picture` VALUES ('96', '/Uploads/Docpic/2016-12-09/584a11c0e4b2c.jpg', '', '5a44c7ba5bbe4ec867233d67e4806848', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '1', '1481249216');
INSERT INTO `ghao_picture` VALUES ('97', '/Uploads/Docpic/2016-12-14/5850ea9f93dc7.png', '', '9327882fb90ee0ed758a86acdfe217cf', '5202f115829dde03c1ed38ac14b2181ca02f7c8c', '1', '1481697951');
INSERT INTO `ghao_picture` VALUES ('98', '/Uploads/Docpic/2016-12-15/585203d4ca505.jpg', '', '3a5e233029123b8d42a8dd2e2cc458c3', '66ece7263848c8c9a7684c15224f49264a735fd2', '1', '1481769940');
INSERT INTO `ghao_picture` VALUES ('99', '/Uploads/Docpic/2016-12-15/585203d9e0093.jpg', '', 'ed25da2d4e75f23b15be8515cc523193', 'd9c160f1813a8f2fd20f99148ee35c8635a227b4', '1', '1481769945');
INSERT INTO `ghao_picture` VALUES ('100', '/Uploads/Docpic/2016-12-15/585203dbeec31.jpg', '', '82bb10deea4c3f9edfb8a5d403b301f0', '2028c6112cdaf21122aff56106d1c9708eb720e1', '1', '1481769947');
INSERT INTO `ghao_picture` VALUES ('101', '/Uploads/Docpic/2016-12-15/585203e0297b6.jpg', '', '76027054ebb63d45cc29deab37c9a8ee', '27f4b21f8f97e4b411ec5a0602628763617933ec', '1', '1481769951');
INSERT INTO `ghao_picture` VALUES ('102', '/Uploads/Docpic/2016-12-15/58520471d1588.jpg', '', 'd02b43b0bd36083f6eea39fd2fe5525c', '8dde5db504a3490ae3228e7952c0aa11245a9c91', '1', '1481770097');
INSERT INTO `ghao_picture` VALUES ('103', '/Uploads/Docpic/2016-12-20/5858940e860dc.png', '', '0659c11f4741b44f6b80637ceba9b3e8', 'd0733b44d95cf712d4cc7414c8650a76ab97650b', '1', '1482200078');
INSERT INTO `ghao_picture` VALUES ('104', '/Uploads/Docpic/2016-12-20/585894134dcf2.jpg', '', '5271dd6b2e48c519641c9b55d05b2d6d', '7421a4a148cbe697ec763cb23dc8e6261ab2ee5e', '1', '1482200083');
INSERT INTO `ghao_picture` VALUES ('105', '/Uploads/Docpic/2016-12-20/5858cffe88e71.jpg', '', '419eb144a251e94bffdb66ba86ed92d1', '3e4588d1f695a5a8469cccc63bf2729ce271def6', '1', '1482215422');
INSERT INTO `ghao_picture` VALUES ('106', '/Uploads/Docpic/2016-12-20/5858d0b086b3d.jpg', '', '05ccd493095e31c1bebb53b04a61bed0', '08e200866b8c8e09fed5cbbfc334ed7b6c443534', '1', '1482215600');
INSERT INTO `ghao_picture` VALUES ('107', '/Uploads/Docpic/2016-12-20/5858d16826ac8.jpg', '', 'cb642f64c363532778234d1829fb5958', 'e92fc1ac2b7a90885797bfdc60373d841f7ca4da', '1', '1482215784');
INSERT INTO `ghao_picture` VALUES ('108', '/Uploads/Docpic/2016-12-20/5858d18dbc6a8.jpg', '', '54ccf6e4afcdc77f80383520af76a899', '6d99fe956aba64571fc409fbdb8affef2e0b0d77', '1', '1482215821');
INSERT INTO `ghao_picture` VALUES ('109', '/Uploads/Docpic/2016-12-20/5858d1ae13fe0.jpg', '', 'f70f2e76563f15fd4694e71a263fb445', '590e840c42d39afd81712ad579c69e16a02b45f5', '1', '1482215854');
INSERT INTO `ghao_picture` VALUES ('110', '/Uploads/Docpic/2016-12-20/5858d1cc18ad0.jpg', '', '0a0ca6d4f3de287b75beb760f9dbae92', '6c90000d3b6718f0026a9fa671c68255e6588fe0', '1', '1482215884');
INSERT INTO `ghao_picture` VALUES ('111', '/Uploads/Docpic/2016-12-20/5858d1f66a87c.jpg', '', '6f68e81a9392632f1a54f408fa35c4d1', '23404e99948fa096d37e5dca9f9f484f0c37d265', '1', '1482215926');
INSERT INTO `ghao_picture` VALUES ('112', '/Uploads/Docpic/2016-12-20/5858d21d5dac9.jpg', '', '500476dc3a86f11eccfef02eddaf0a88', '8ef9e96a9fffbc0ae9c1cf9b60be0e8f2d442043', '1', '1482215965');
INSERT INTO `ghao_picture` VALUES ('113', '/Uploads/Docpic/2016-12-20/5858d28db9e72.jpg', '', 'd01d10f97e60815adbbc326b5b240b5e', '79fc192e9dc8c02b83dd17e645110b2188cea1c3', '1', '1482216077');
INSERT INTO `ghao_picture` VALUES ('114', '/Uploads/Docpic/2016-12-20/5858d2b3be107.jpg', '', '96ad013b3e10567303b9be23e8774c42', 'bbde6f7c059c14881b41a5892d3a2ae9a62404a9', '1', '1482216115');
INSERT INTO `ghao_picture` VALUES ('115', '/Uploads/Docpic/2016-12-20/5858d812c45d6.jpg', '', 'a165601c72dae478493e2b86d5c4495a', 'c53316ea584e620350348a4e14dd38fa030533f4', '1', '1482217490');
INSERT INTO `ghao_picture` VALUES ('116', '/Uploads/Docpic/2016-12-20/5858d83a2bdb6.jpg', '', '641d1769c06578dfab1d21b330301209', '005a8b8035e2048d2fc6e4257578e0efde782397', '1', '1482217530');
INSERT INTO `ghao_picture` VALUES ('117', '/Uploads/Docpic/2016-12-20/5858d86781dc4.jpg', '', '7109b6fa8a69486cb2d4248a43317a94', 'fc016e9fc6a6c729848061d0f6d7c6d0fa5a2779', '1', '1482217575');
INSERT INTO `ghao_picture` VALUES ('118', '/Uploads/Docpic/2016-12-20/5858d8a5f32b8.jpg', '', 'd511674bea05d934f40c4800af110ef0', '69794f4278a9444ae5d4c1a6078e670b99938c61', '1', '1482217637');
INSERT INTO `ghao_picture` VALUES ('119', '/Uploads/Docpic/2016-12-20/5858d8cb3f488.jpg', '', '422e6174772d2859303461dd826dcf16', '617899e9dd9d8d62be276d28cc9845a7710fa5dc', '1', '1482217675');
INSERT INTO `ghao_picture` VALUES ('120', '/Uploads/Docpic/2016-12-20/5858d8f18cbb3.jpg', '', 'c1ce47edcdac89ebf23630ca8295bf76', '12d0e204a9c36e5f5ac10ec17403581adefffaa4', '1', '1482217713');
INSERT INTO `ghao_picture` VALUES ('121', '/Uploads/Docpic/2016-12-20/5858d90e3fdb5.jpg', '', 'f7b16f9dd6ae77a5e06180fb9ad1de58', '5a5831078300e1520ccedbb4acab39b047b50bf9', '1', '1482217742');
INSERT INTO `ghao_picture` VALUES ('122', '/Uploads/Docpic/2016-12-20/5858d932e7f5b.jpg', '', 'd9a30d3f5cd5fec5a127c24fcac4f8b3', '4c8707ab45d5b9523b6e31d9311c5f3428b86aad', '1', '1482217778');
INSERT INTO `ghao_picture` VALUES ('123', '/Uploads/Docpic/2016-12-20/5858d94e21332.jpg', '', '6c27935d89b93c53d626ce487696fafd', 'c5f85d75ce16171ea28209bf17d797fbb517ad2f', '1', '1482217806');
INSERT INTO `ghao_picture` VALUES ('124', '/Uploads/Docpic/2016-12-20/5858d97d3c1b9.jpg', '', '6b86b58b1de1e7fedc2704b4b2cbca40', '21ca1bada67b8ccd6854749aa403da1e1b0435c7', '1', '1482217853');
INSERT INTO `ghao_picture` VALUES ('125', '/Uploads/Docpic/2016-12-20/5858d999407a0.jpg', '', '23ddab6a63791cd0ae53845ff3c7f324', '69091d1bcd319026779e457d8e1ecbcfa2bcc291', '1', '1482217881');
INSERT INTO `ghao_picture` VALUES ('126', '/Uploads/Docpic/2016-12-20/5858d9eaea14b.jpg', '', '1bc7a1a5c484563328c9d4472f6f6888', '36a0f65c0531e714e5648b41a78989fa3407437c', '1', '1482217962');
INSERT INTO `ghao_picture` VALUES ('127', '/Uploads/Docpic/2016-12-20/5858da0b8f137.jpg', '', '1558db70cf53170a9fdfcc8edd4a4487', '7780d95be60ee70c6c6a0061a3662ed3806f1630', '1', '1482217995');
INSERT INTO `ghao_picture` VALUES ('128', '/Uploads/Docpic/2016-12-20/5858da4c272f9.jpg', '', '8f8c7ecc9194a8b67ea31e56854e3442', '885aa4256985a823aac5cf92d29d296225166a1a', '1', '1482218060');
INSERT INTO `ghao_picture` VALUES ('129', '/Uploads/Docpic/2016-12-20/5858da917ac26.jpg', '', '93dfc5b37bc050ee3d25abb2e29fddf4', '5626770516f9772296ac7712ab2bf39a82042844', '1', '1482218129');
INSERT INTO `ghao_picture` VALUES ('130', '/Uploads/Docpic/2016-12-20/5858dab8a005e.jpg', '', '5ec0e8006b80578f7ca0a0f6bf26b182', '3cb05b859a3c24a386d6f1e071c9d006a8269c2a', '1', '1482218168');
INSERT INTO `ghao_picture` VALUES ('131', '/Uploads/Docpic/2016-12-20/5858dae810536.jpg', '', 'b10e52c8c1f9b5d6981692c01816dc07', '2222dacdfd266682ab70045a52366685368e535b', '1', '1482218216');
INSERT INTO `ghao_picture` VALUES ('132', '/Uploads/Docpic/2016-12-20/5858de7761e8b.jpg', '', '287cc03cbcc4cf845224c6c71db4235f', '57e7946b62f4375a44bc50eba2937b6b3e7e34da', '1', '1482219127');
INSERT INTO `ghao_picture` VALUES ('133', '/Uploads/Docpic/2016-12-20/5858de9e54844.jpg', '', 'c4b0e15ee059a52b5b143452b681d156', 'd785c9b745972ca95d3b8bedb7563915010656a9', '1', '1482219166');
INSERT INTO `ghao_picture` VALUES ('134', '/Uploads/Docpic/2016-12-20/5858debc70dc1.jpg', '', 'b48f3a73170825b66b42503070bd202f', 'd0558167daecc432577625f18dae3ac6d0334007', '1', '1482219196');
INSERT INTO `ghao_picture` VALUES ('135', '/Uploads/Docpic/2016-12-20/5858dee2ba3f3.jpg', '', '5abf4dd7e1e20c64f8327eb523cd7e6b', '29a91293597686d6229e1702433d5cefbfdc1c89', '1', '1482219234');
INSERT INTO `ghao_picture` VALUES ('136', '/Uploads/Docpic/2016-12-20/5858deff85536.jpg', '', '4b56aa71a6c7760ca08fd8eed0428efe', '89d0c408fe5b87e8536e72b2ff9d420f8f73f1e5', '1', '1482219263');
INSERT INTO `ghao_picture` VALUES ('137', '/Uploads/Docpic/2016-12-20/5858df47e90ed.jpg', '', '6deb71d2a7b1fd2abcb969fcb7f95c75', '3350ff451829081d90bd1b1539a23caecf2f9dbd', '1', '1482219335');
INSERT INTO `ghao_picture` VALUES ('138', '/Uploads/Docpic/2016-12-20/5858df60ac541.jpg', '', 'e4f92c3c0c64795dd898185ddb63058f', '614629f6400abcf860487ddc1e3bb02521fdc93f', '1', '1482219360');
INSERT INTO `ghao_picture` VALUES ('139', '/Uploads/Docpic/2016-12-20/5858df7515dc6.jpg', '', '98b51fb3d04a56806c8adfe85fcbe6ad', '51a4d7d826f913099473d01868bd0ddc0d7b1df6', '1', '1482219380');
INSERT INTO `ghao_picture` VALUES ('140', '/Uploads/Docpic/2016-12-20/5858dfa7c8a6c.jpg', '', '27cab2c51f22e33a0caef8be24409408', '0087dd1d56eb530df0b700f3ae6bec9e7cf5d303', '1', '1482219431');
INSERT INTO `ghao_picture` VALUES ('141', '/Uploads/Docpic/2016-12-22/585b32de92a69.jpg', '', '1580f241d463e0e64ae8ad6b9ad4c685', '19d6867c93fb75501d028c8f34483c26d09e82b7', '1', '1482371806');
INSERT INTO `ghao_picture` VALUES ('142', '/Uploads/Docpic/2016-12-22/585b32fb5b787.jpg', '', 'aaf3b104f00e35a8ecc22e087541b524', '2e506df65b00f6e9821c60db33c8403604425bb8', '1', '1482371835');
INSERT INTO `ghao_picture` VALUES ('143', '/Uploads/Docpic/2016-12-22/585b331cd2a22.jpg', '', '72a3a48f37333f294cec1ba8be3f2351', 'b22ef66515dbce69da4986e8c4cedb9f8d84a049', '1', '1482371868');
INSERT INTO `ghao_picture` VALUES ('144', '/Uploads/Docpic/2016-12-22/585b333ba64d9.jpg', '', '82c476147b146638274ff42960ba85d3', '3ec158dd27f087700115c4dda4a7a03815102411', '1', '1482371899');
INSERT INTO `ghao_picture` VALUES ('145', '/Uploads/Docpic/2016-12-22/585b3d0718503.jpg', '', '2000e2838530378349c05066412d1c5e', '1942644db57a930ff9bc7103bbe8f55d4526abc8', '1', '1482374406');
INSERT INTO `ghao_picture` VALUES ('146', '/Uploads/Docpic/2016-12-22/585b3d31befea.jpg', '', 'a7fc51cc4f8750e1dc431381135c35c9', 'd497a898ffde862df7cf091e3fcc1d0dec92249e', '1', '1482374449');
INSERT INTO `ghao_picture` VALUES ('147', '/Uploads/Docpic/2016-12-22/585b3d59c4678.jpg', '', '0c5645341b1516bce8d3453c7cb38478', '0889b162c75919528d113ee4ff8365d3eeb009ee', '1', '1482374489');
INSERT INTO `ghao_picture` VALUES ('148', '/Uploads/Docpic/2016-12-22/585b3ddcbedbb.jpg', '', '891b25bb299b731bb87cc8fcc835ce40', '3559b51f91516d162b10f9dc9c7ab41dc579ad01', '1', '1482374620');
INSERT INTO `ghao_picture` VALUES ('149', '/Uploads/Docpic/2016-12-22/585b3def26693.jpg', '', '4114b73b5974ccfe8fce6ec2f5b6a4cd', '7b62e56147d01378497913530ca39d7d0d08b87e', '1', '1482374639');
INSERT INTO `ghao_picture` VALUES ('150', '/Uploads/Docpic/2016-12-22/585b3e08b38d7.jpg', '', 'ad07657b22111d4ed2bcf903b0c8f510', '1c1f788d1b6a22b4b16f7c10a0e53190ff312a33', '1', '1482374664');
INSERT INTO `ghao_picture` VALUES ('151', '/Uploads/Docpic/2016-12-22/585b4021a029a.jpg', '', '6276d243cbefb94725628b64245e2635', '5a5ff0c33201289823d344e7ee9d919e8e1421f1', '1', '1482375201');
INSERT INTO `ghao_picture` VALUES ('152', '/Uploads/Docpic/2016-12-22/585b40881b5b7.jpg', '', 'b3983c6400d158273307c110c7c11912', 'a44add0e1ac0056f2368feb65426d2ccfeb74208', '1', '1482375303');
INSERT INTO `ghao_picture` VALUES ('153', '/Uploads/Docpic/2016-12-22/585b409f4b3aa.jpg', '', '25be5e33248822a753143213ba7e6b60', 'f305fa6272d376cc693b15f8c73f8a22595d3bc8', '1', '1482375327');
INSERT INTO `ghao_picture` VALUES ('154', '/Uploads/Docpic/2016-12-22/585b41985a67f.jpg', '', '22a2447da7a171b3033241585f8b986e', '205fad28e3a1717150cde16a82f1bc00c865f678', '1', '1482375576');
INSERT INTO `ghao_picture` VALUES ('155', '/Uploads/Docpic/2016-12-22/585b41b7e64da.jpg', '', '2df48072032312ddbe3b5a6286d342b2', '42734b32e5412d0c46e72c94db45ebc06d898b15', '1', '1482375607');
INSERT INTO `ghao_picture` VALUES ('156', '/Uploads/Docpic/2016-12-22/585b41d8e92d8.jpg', '', '970d14b9ac38c096095237153ada82ae', 'cbe0c8381ac5fa96f4eb12d74185b44cdd3ef1c3', '1', '1482375640');
INSERT INTO `ghao_picture` VALUES ('157', '/Uploads/Docpic/2016-12-22/585b420277838.jpg', '', '17c90e4d882e07cb183163b5bc35156b', '07edd5111a6ebf20b1b9c2e30c09c461b1d34d67', '1', '1482375682');
INSERT INTO `ghao_picture` VALUES ('158', '/Uploads/Docpic/2016-12-22/585b425e7aad7.jpg', '', '00a40df7984791ba4164bf80d8c0376a', 'c1285b0a497d7944b98c95ce2e6258a140d722bd', '1', '1482375774');
INSERT INTO `ghao_picture` VALUES ('159', '/Uploads/Docpic/2016-12-22/585b4286e133d.jpg', '', '1be611eca97eda251d0c261043c80355', '8260c6bf7bcf626684a29b35365773381d66eb58', '1', '1482375814');
INSERT INTO `ghao_picture` VALUES ('160', '/Uploads/Docpic/2016-12-22/585b42a3e2c93.jpg', '', 'c313e33484735a328cd672a9c0002056', '73dda35f86386be0ba57ea519e3a5c145610ab14', '1', '1482375843');
INSERT INTO `ghao_picture` VALUES ('161', '/Uploads/Docpic/2016-12-22/585b42b8ec782.jpg', '', 'e0bb8d5cafca9d18c0db0682236e8d88', '26a2d91f0a8792f368f955faed1a8679b3dc16a0', '1', '1482375864');
INSERT INTO `ghao_picture` VALUES ('162', '/Uploads/Docpic/2016-12-22/585b42d4be0f0.jpg', '', '8a7c8b81a4b518c94a9be7f0412264fc', '23b57b391616848c94f6384cd9ffb19fa9fe2454', '1', '1482375892');
INSERT INTO `ghao_picture` VALUES ('163', '/Uploads/Docpic/2016-12-22/585b42e837221.jpg', '', 'b2b522b7f444db5ba1ce335456217050', '04bb4db2417f32d53aeebb5f930fcad94a8b6eaa', '1', '1482375912');
INSERT INTO `ghao_picture` VALUES ('164', '/Uploads/Docpic/2016-12-22/585b43086b9c2.jpg', '', '7a7d73bc19f50c40e47cd998c77d7adf', '7dabe2fb943674d4c6c718672ed7fd034ad97c83', '1', '1482375944');
INSERT INTO `ghao_picture` VALUES ('165', '/Uploads/Docpic/2016-12-22/585b432f96498.jpg', '', 'd904fd8b2c270e4f8e01cdfde7a144e7', '45e3c08179a1ad2a2ed03b64f45ca5a78c05929e', '1', '1482375983');
INSERT INTO `ghao_picture` VALUES ('166', '/Uploads/Docpic/2016-12-22/585b43654eb02.jpg', '', '17a5ecf1674f17e48477118a5c205851', 'efd6b86d0074b190a7b330906c79116a950cf479', '1', '1482376037');
INSERT INTO `ghao_picture` VALUES ('167', '/Uploads/Docpic/2016-12-22/585b4387d9013.jpg', '', '1c46bbee3b8ecd58858484dfb747669a', '3e17be08e5e576a4b64ff087efd21955eae857f4', '1', '1482376071');
INSERT INTO `ghao_picture` VALUES ('168', '/Uploads/Docpic/2016-12-22/585b4448804d7.jpg', '', '4a36e482ee349b62f09edc398f9777ab', '0b8151c283da435484e9f9ced0e2eff707a2f4d3', '1', '1482376264');
INSERT INTO `ghao_picture` VALUES ('169', '/Uploads/Docpic/2016-12-22/585b4460a08f2.jpg', '', 'c47129b69ef3af4c4ec9257a80b4579d', 'd473b71c632cd69295b38d05ba42c6a8a809e858', '1', '1482376288');
INSERT INTO `ghao_picture` VALUES ('170', '/Uploads/Docpic/2016-12-22/585b447adf1aa.jpg', '', 'd0884aade157d9d8c997b75c4af5cf09', '19cd04ae87b32187cdbb9e04d0bc25d10936de8d', '1', '1482376314');
INSERT INTO `ghao_picture` VALUES ('171', '/Uploads/Docpic/2016-12-22/585b449e1504a.jpg', '', '0faa2cec4a5491d993acfc82c3b91d4f', 'fd6d2f533338d9ae0e353312b22ddfc8a68ad8d8', '1', '1482376349');
INSERT INTO `ghao_picture` VALUES ('172', '/Uploads/Docpic/2016-12-22/585b6530f1392.jpg', '', '943bb44bb061ef919f540614c0d664b4', 'f54eba510f819d94301981173e17a79fc1b401b6', '1', '1482384688');
INSERT INTO `ghao_picture` VALUES ('173', '/Uploads/Docpic/2016-12-22/585b6768570fa.jpg', '', 'd04efc103ff8f6234147816d74bc9311', '62625d43a7ff68117253ff6bcd5c8cfdfeb6e40e', '1', '1482385256');
INSERT INTO `ghao_picture` VALUES ('174', '/Uploads/Docpic/2016-12-22/585b6cb860714.jpg', '', '36330ec7a1a4d0e77f74a0f4f4976898', 'e24aab01d63bab47ab688a778bbd986a9e0bc4e2', '1', '1482386616');
INSERT INTO `ghao_picture` VALUES ('175', '/Uploads/Docpic/2016-12-22/585b6dded1ccf.jpg', '', '8108d28da1147e6e0920d22a4b73ef90', '5b67615aaf3b9080b676e80db6e36fd052c67606', '1', '1482386910');
INSERT INTO `ghao_picture` VALUES ('176', '/Uploads/Docpic/2016-12-22/585b6e5704773.jpg', '', '6f8b125a9a1740b7ac0f754a20237867', '98c00e5ea738a1d1407b28083b17af9c72ef1237', '1', '1482387030');
INSERT INTO `ghao_picture` VALUES ('177', '/Uploads/Docpic/2016-12-22/585b703113f2d.jpg', '', '4412c462749ffb060d03270157894cc3', '3c94cb65f386b95e5b4cf61f5a5d5be69f4fdcb9', '1', '1482387504');
INSERT INTO `ghao_picture` VALUES ('178', '/Uploads/Docpic/2016-12-22/585b7056932bb.jpg', '', '61c6b195ac468791191405e2b37897d8', '6251438fdd303d889f3efb149cd93faf722f857c', '1', '1482387542');
INSERT INTO `ghao_picture` VALUES ('179', '/Uploads/Docpic/2016-12-22/585b70861e1c7.jpg', '', 'a73bc85c012bca1a945568fdfb2f784c', 'f63b12a5f3a6e2cd699569f5e5ed31fc3e83afba', '1', '1482387590');
INSERT INTO `ghao_picture` VALUES ('180', '/Uploads/Docpic/2016-12-22/585b71904b184.jpg', '', '6abea56ca413b267d89918515724f5aa', 'ebcdc96efe54dee26f182231af33e0c49f740204', '1', '1482387856');
INSERT INTO `ghao_picture` VALUES ('181', '/Uploads/Docpic/2016-12-22/585b71afe7bb3.jpg', '', '07ba32645c1489390a8750b58e9fe774', 'ebc5ddf92346204196b7aa70d2cceeecf058ea17', '1', '1482387887');
INSERT INTO `ghao_picture` VALUES ('182', '/Uploads/Docpic/2016-12-22/585b71cb4e157.jpg', '', '5b3def0ca84fcca8671b6d6f5bd26573', '540c0f429f96bea414e2d6b8ba8ad43a55812a94', '1', '1482387915');
INSERT INTO `ghao_picture` VALUES ('183', '/Uploads/Docpic/2016-12-22/585b71e5d9d6b.jpg', '', '6c880492c5879e072c9af82921dc0284', '0ef0f5aec18f670e35d45686f715098cb6e34922', '1', '1482387941');
INSERT INTO `ghao_picture` VALUES ('184', '/Uploads/Docpic/2016-12-22/585b720255b18.jpg', '', '1dc900da289669a35692fdc8516dafa4', '0830c981758094f6d76fce2da5e05fe2cb5cf8fc', '1', '1482387970');
INSERT INTO `ghao_picture` VALUES ('185', '/Uploads/Docpic/2016-12-22/585b7220c3ec0.jpg', '', '600739049f2f5f02d23cabe76a94efee', '319f6b82ec69408c7c9e56f5478343d5932836d5', '1', '1482388000');
INSERT INTO `ghao_picture` VALUES ('186', '/Uploads/Docpic/2016-12-22/585b72329ecad.jpg', '', 'e580d667eb6294ba07e8fb79f23b14cc', 'f089689809fdc96250fcd959cc1f046c53bbac91', '1', '1482388018');
INSERT INTO `ghao_picture` VALUES ('187', '/Uploads/Docpic/2016-12-22/585b72609a7c3.jpg', '', '98c7801bb2c9b731081cf89ec5f08766', '826609a856f58c850f46ae03e99628b4c5dd5d32', '1', '1482388064');
INSERT INTO `ghao_picture` VALUES ('188', '/Uploads/Docpic/2016-12-22/585b727ce5dea.jpg', '', '2da1b98dc5c48fd8ded686e3300b1aa2', '96c462605cbaaf309a12bc02b239936378f82329', '1', '1482388092');
INSERT INTO `ghao_picture` VALUES ('189', '/Uploads/Docpic/2016-12-22/585b729506497.jpg', '', 'ec1e099b3d5275032d849866b292576b', '5c177ee45784ff3f6ddb88365448f0005e616628', '1', '1482388116');
INSERT INTO `ghao_picture` VALUES ('190', '/Uploads/Docpic/2016-12-22/585b72baefd4d.jpg', '', '5c28307eabd5cbfdad1ccc6298cc8816', 'ba019ec9896a9ae0f6987bca05cb0904c0d01cbc', '1', '1482388154');
INSERT INTO `ghao_picture` VALUES ('191', '/Uploads/Docpic/2016-12-22/585b7305857c9.jpg', '', '99bdc84741f1d8a290cddbd7942ce8b9', 'db9d735be183a5d58304f8bc3b4193fb2bd9c298', '1', '1482388229');
INSERT INTO `ghao_picture` VALUES ('192', '/Uploads/Docpic/2016-12-22/585b7329e9b3f.jpg', '', 'dea5591c1992277d5d0484b0c4eb56f6', '91f84de01340f681afec042b7ba286797c7a4e90', '1', '1482388265');
INSERT INTO `ghao_picture` VALUES ('193', '/Uploads/Docpic/2016-12-22/585b734459072.jpg', '', '80b2c241fa80c7560afcbba2792b8a26', '26469787725f38f71b86f4a56748d6e915879681', '1', '1482388292');
INSERT INTO `ghao_picture` VALUES ('194', '/Uploads/Docpic/2016-12-22/585b7361c2a3a.jpg', '', '7deeb8c5b1dada10e9e5f74974e28add', '7168fac9c69ce9cbef78fc38f5dadfc3fe8100dd', '1', '1482388321');
INSERT INTO `ghao_picture` VALUES ('195', '/Uploads/Docpic/2016-12-22/585b737f36019.jpg', '', '0a421cc7fb4aefd5aa96dc2a25c8b43f', 'b87e514a6ee754e75e6c85aa2d4b5559d8b0711b', '1', '1482388351');
INSERT INTO `ghao_picture` VALUES ('196', '/Uploads/Docpic/2016-12-22/585b7395a3a97.jpg', '', '979acfb91438f0568b41e2575bf59443', '0f5d81ddf418f93a9e077bcc409b354ace88c2cd', '1', '1482388373');
INSERT INTO `ghao_picture` VALUES ('197', '/Uploads/Docpic/2016-12-22/585b73aa30b7d.jpg', '', '60f3896b05a70ec6267d91b27c061c35', '54f55e734a511b2b311e99ad047182e6e6a2c6e2', '1', '1482388394');
INSERT INTO `ghao_picture` VALUES ('198', '/Uploads/Docpic/2016-12-22/585b73c4036e9.jpg', '', '4680f8ac111041b31bc5ae9880d3357a', 'd7ea395e80e3100eebfac6753ba704b3fe0dfd56', '1', '1482388419');
INSERT INTO `ghao_picture` VALUES ('199', '/Uploads/Docpic/2016-12-22/585b73d8acfa9.jpg', '', '49a6f8cf46a7137341bbb8625e0e784c', '5043b67e0520fafba5dc8a2d379828629d9e3a5e', '1', '1482388440');
INSERT INTO `ghao_picture` VALUES ('200', '/Uploads/Docpic/2016-12-22/585b73f85726f.jpg', '', '5fed7eaca63c70171095fefa30599a0a', 'e233a5da4c16184a2ca909cf869f0a7c302423f7', '1', '1482388472');
INSERT INTO `ghao_picture` VALUES ('201', '/Uploads/Docpic/2016-12-22/585b74124b71e.jpg', '', '61f65669a77c9a6d3e8d52be2c91b72d', '82da09fdcb98474663b7d8d34b3bb6da62ded6e7', '1', '1482388498');
INSERT INTO `ghao_picture` VALUES ('202', '/Uploads/Docpic/2016-12-22/585b742d25b92.jpg', '', '9eddffeccfb3a15ed268d4ce640ca8e8', '3618048c4aa37bc16b6b02694ee18c37b76cd04a', '1', '1482388525');
INSERT INTO `ghao_picture` VALUES ('203', '/Uploads/Docpic/2016-12-22/585b75e328189.jpg', '', '31ebec0088a4249e7cf5bab4499b7659', '2035ea5c5cbd52a14fd9d8e9312070c6127f3946', '1', '1482388963');
INSERT INTO `ghao_picture` VALUES ('204', '/Uploads/Docpic/2016-12-22/585b760d725f4.jpg', '', '2245135ddfbcc2be04e6aca9b715cba9', '41633648e2a0d29d82d6560e7a4a1c56033cbe94', '1', '1482389005');
INSERT INTO `ghao_picture` VALUES ('205', '/Uploads/Docpic/2016-12-22/585b762579fc3.jpg', '', 'bbbe1c52368a44ffb346b51340a9881a', '0d46a7b4509bc92bee82bf0d05fc36b1ad1a9d7d', '1', '1482389029');
INSERT INTO `ghao_picture` VALUES ('206', '/Uploads/Docpic/2016-12-22/585b7760d85ff.jpg', '', '65da5c0f9c20b84f704c11eebe82037b', 'c6e85909417e52c19208d47eb5795b94269d386e', '1', '1482389344');
INSERT INTO `ghao_picture` VALUES ('207', '/Uploads/Docpic/2016-12-22/585b7782b1659.jpg', '', '6711a394dc1f157eb699010bfa75abb5', '380c56c13411e75a2b1140bf9b1ba49e21cf0c7a', '1', '1482389378');
INSERT INTO `ghao_picture` VALUES ('208', '/Uploads/Docpic/2016-12-22/585b77a0e1185.jpg', '', '3751e9605d2903a5e9133c89ace6c721', 'b239141db0db7b71b284c11dd3a029fe55e1d098', '1', '1482389408');
INSERT INTO `ghao_picture` VALUES ('209', '/Uploads/Docpic/2016-12-22/585b77bdde802.jpg', '', 'a6be5bb353892a6f6e3d4829021d140d', '7db8bc2f7362fa233ad4f46cacf1af8761797e33', '1', '1482389437');
INSERT INTO `ghao_picture` VALUES ('210', '/Uploads/Docpic/2016-12-22/585b77d5d67de.jpg', '', 'f4df916fb3bfddecf1ee0e1ff8f7f64a', '51bca2c94f7646d0ea150725a25571017b44676a', '1', '1482389461');
INSERT INTO `ghao_picture` VALUES ('211', '/Uploads/Docpic/2016-12-22/585b77f3ef36f.jpg', '', '2f56de44063266c9acf417b348cb3028', '0ac9ada5e53aa824d9061871ada98e72083c889a', '1', '1482389491');
INSERT INTO `ghao_picture` VALUES ('212', '/Uploads/Docpic/2016-12-22/585b7815959b7.jpg', '', 'ab056211ed0747e5e6e460b8db8943a8', '765ff0f0b8cef3524f20b2d6a939285dc65dda65', '1', '1482389525');
INSERT INTO `ghao_picture` VALUES ('213', '/Uploads/Docpic/2016-12-22/585b782abed42.jpg', '', 'e366767a50a47600afac3c964a91f985', '6d906e6a62c253a1dfba22ac18cb726ef629f502', '1', '1482389546');
INSERT INTO `ghao_picture` VALUES ('214', '/Uploads/Docpic/2016-12-22/585b784dbf6c0.jpg', '', 'f9dd2e53a5c44ed33cad062b0302e527', '82bc5a8777167a835681d7dc215c5cd436923a9c', '1', '1482389581');
INSERT INTO `ghao_picture` VALUES ('216', '/Uploads/Docpic/2016-12-22/585b788e79df6.jpg', '', '60e126caed64fca1cf7367c33aec2dcd', 'dd612679f6615caeceef71c228c6eb22e1d40214', '1', '1482389646');
INSERT INTO `ghao_picture` VALUES ('217', '/Uploads/Docpic/2016-12-22/585b78b703f11.jpg', '', '7294aa186c3748818a87876867835dfc', 'e157a56c41053930c80dc153a5916afe3c7bb499', '1', '1482389686');
INSERT INTO `ghao_picture` VALUES ('218', '/Uploads/Docpic/2016-12-22/585b78d485217.jpg', '', '41301f7c7a5ed22b9676dbffe4e3a3e9', '90d2ee2f8cb1b69068fb2ec4407a688d0ef70a61', '1', '1482389716');
INSERT INTO `ghao_picture` VALUES ('219', '/Uploads/Docpic/2016-12-22/585b78ee250ea.jpg', '', '3fca9f116e133fc6f1c03e98868460ea', '4cf8503c2784b99804799315da01b0d4c13e897f', '1', '1482389742');
INSERT INTO `ghao_picture` VALUES ('220', '/Uploads/Docpic/2016-12-22/585b7919729ec.jpg', '', 'd0f5010648fad019efda5220078b245f', '9c94ec78da1b1fe51f98e53ca4af5454edaa172f', '1', '1482389785');
INSERT INTO `ghao_picture` VALUES ('221', '/Uploads/Docpic/2016-12-22/585b7941c2322.jpg', '', '296399310a86e7b245cd87877ec48a74', 'f8c4b15fb70ba02aa60edb3b754c1b100d85fca0', '1', '1482389825');
INSERT INTO `ghao_picture` VALUES ('222', '/Uploads/Docpic/2016-12-22/585b79791a7d4.jpg', '', '1539d43b98cbf66c1ba27be3444e473f', 'e2f96730a2d0144f3c0d0bbaec3af9ae059d6e41', '1', '1482389881');
INSERT INTO `ghao_picture` VALUES ('223', '/Uploads/Docpic/2016-12-22/585b79938476e.jpg', '', '2734ceb06dda268d522f1e983dffda3f', '24d01df17f4829e820b163c3903e326b1b864c8b', '1', '1482389907');
INSERT INTO `ghao_picture` VALUES ('224', '/Uploads/Docpic/2016-12-22/585b79b5c3f8e.jpg', '', '4b1eaef6caa8336e376e6cbc086cc172', '4569b0072eef7296e6ca0b58466b8815539a7ab9', '1', '1482389941');
INSERT INTO `ghao_picture` VALUES ('225', '/Uploads/Docpic/2016-12-22/585b7a1d18355.jpg', '', 'b4ecbb2e5e9ac59ce81e5016145e3246', 'e0c3ef1171f4facfad29ab508a481d4c172e25da', '1', '1482390044');
INSERT INTO `ghao_picture` VALUES ('226', '/Uploads/Docpic/2016-12-22/585b7a489e398.jpg', '', '0f156955381284e4fd69e8cbf5561a9f', '7ad2d4ecbb482cd5af189ad37f634b8f2f4ba4fb', '1', '1482390088');
INSERT INTO `ghao_picture` VALUES ('227', '/Uploads/Docpic/2016-12-22/585b7a6c1b30d.jpg', '', 'ab84d1d42758915398b8dea1b1ad5b69', '7e2c9c4ef213d422ea21500692dd090af0e2a2d3', '1', '1482390124');
INSERT INTO `ghao_picture` VALUES ('228', '/Uploads/Docpic/2016-12-22/585b7d7fbb6e9.jpg', '', '86454c819ac52c237204f817ecaf6206', '962454a9ebc984ae58e28b937f4a889fd00ad5fa', '1', '1482390911');
INSERT INTO `ghao_picture` VALUES ('229', '/Uploads/Docpic/2016-12-22/585b7da5e1092.jpg', '', 'b3318b0d70d1ba0ea331990ac756966b', '6e28907712c98ee4b16967f71ab2e122242d68c2', '1', '1482390949');
INSERT INTO `ghao_picture` VALUES ('230', '/Uploads/Docpic/2016-12-22/585b7db7640d4.jpg', '', '17f29ee1f0598939b4767b5abc7b39c0', '465884f261174b54eee0a44961e92f851dc73c7d', '1', '1482390967');
INSERT INTO `ghao_picture` VALUES ('231', '/Uploads/Docpic/2016-12-22/585b7dd5ed999.jpg', '', '06d3256db512a74287087ae6e1711e04', '5d721b2265d73fe98696161ce37ba986f6ca53d8', '1', '1482390997');
INSERT INTO `ghao_picture` VALUES ('232', '/Uploads/Docpic/2016-12-22/585b7e02e385d.jpg', '', '040327b067369c444475d9217c2715bb', '72908e6cbef8fc8cbdf24d847218e94c8b865e0b', '1', '1482391042');
INSERT INTO `ghao_picture` VALUES ('233', '/Uploads/Docpic/2016-12-22/585b7e464649b.jpg', '', '4231ac4b8516a889a7e5fb7097000c4c', '61acdc6600293d56b33be182032eb8b03e2921f8', '1', '1482391110');
INSERT INTO `ghao_picture` VALUES ('234', '/Uploads/Docpic/2016-12-22/585b7e6a05619.jpg', '', '5abddec46074c8c47edbcaadc00eafd6', '556fac68c0af009ee704833e478dadac1a3dd894', '1', '1482391145');
INSERT INTO `ghao_picture` VALUES ('235', '/Uploads/Docpic/2016-12-22/585b7e89188ee.jpg', '', '5ccd34972bfb5e23c8b8de7fe2213232', '1648ec2763268956f8adab34327c0e9cf087ef7b', '1', '1482391177');
INSERT INTO `ghao_picture` VALUES ('236', '/Uploads/Docpic/2016-12-22/585b7e9e48c96.jpg', '', '68f931dceb9fc1ab631e1c9a010620a8', 'f61a1e05e42505ecd238b45a7b16562817304a06', '1', '1482391198');
INSERT INTO `ghao_picture` VALUES ('237', '/Uploads/Docpic/2016-12-22/585b7eb84a68c.jpg', '', 'e94912512a9d30df4c02a7c0e229de1c', '822e9c56518de2b7690f8bb0d594daf201f99cce', '1', '1482391224');
INSERT INTO `ghao_picture` VALUES ('238', '/Uploads/Docpic/2016-12-22/585b7edb61706.jpg', '', 'b134bda1093ec9c017e2e77cff091923', '703babd7d1faf8bdec76559690afffecb7fc69e7', '1', '1482391259');
INSERT INTO `ghao_picture` VALUES ('239', '/Uploads/Docpic/2016-12-22/585b7efde48cf.jpg', '', 'e627247d1fc483951ff5a745778f1f24', '9d0b58c1b8c983e12a921b66ab3062d04ddb536a', '1', '1482391293');
INSERT INTO `ghao_picture` VALUES ('240', '/Uploads/Docpic/2016-12-22/585b7f2a48c78.jpg', '', 'ba431de909c5bc4acbfa221bc8a8a8a7', '17bdd09d8d702d775b64181819d48f06acb3c7f4', '1', '1482391338');
INSERT INTO `ghao_picture` VALUES ('241', '/Uploads/Docpic/2016-12-22/585b7f4adab9f.jpg', '', '0662a252961325bb5a63caec3f914ca3', '9ad3fbb55619fda895a39fa00bf9dedf05a8bc9c', '1', '1482391370');
INSERT INTO `ghao_picture` VALUES ('242', '/Uploads/Docpic/2016-12-22/585b7f6a0453c.jpg', '', 'da4771c6da244edee7925335244a2d9a', '63ab024cd3973b149fa6a02e81fd2828355dd872', '1', '1482391401');
INSERT INTO `ghao_picture` VALUES ('243', '/Uploads/Docpic/2016-12-22/585b7f9a94f9e.jpg', '', '67167ffbaf5a24f28b2713148db4a069', '8bdf7479d1c71a569e41277d2746768caa2a3e58', '1', '1482391450');
INSERT INTO `ghao_picture` VALUES ('244', '/Uploads/Docpic/2016-12-22/585b7fb61056b.jpg', '', 'dfc2f8044b41f2b4921c83b9bee8106a', 'b1b7a218cfff634204f03a652b59c838aaf69e99', '1', '1482391477');
INSERT INTO `ghao_picture` VALUES ('245', '/Uploads/Docpic/2016-12-22/585b7fd30a556.jpg', '', 'b497f503baeafc5bc74a531648124e6a', 'c8b1cfb9f7602e07d2ed47022b7e5a69c3da32f8', '1', '1482391506');
INSERT INTO `ghao_picture` VALUES ('246', '/Uploads/Docpic/2016-12-22/585b801a45043.jpg', '', 'c8203a6a0674cf5d93b6a41beff5acd8', 'f4a204db95af85be890be68d89d2fd5d8fe11ca4', '1', '1482391578');
INSERT INTO `ghao_picture` VALUES ('247', '/Uploads/Docpic/2016-12-22/585b80488b933.jpg', '', '86e94fa5eafc6e74ff6b6786329f7352', '0fe0c0f6536f3f5191b476ba439ee052fbf876d9', '1', '1482391624');
INSERT INTO `ghao_picture` VALUES ('248', '/Uploads/Docpic/2016-12-22/585b806dc6e98.jpg', '', 'dcbb8be695f088edcf85ffa4ccec1a65', '88bee72ba874f47769f09399e68728e6ee82b150', '1', '1482391661');
INSERT INTO `ghao_picture` VALUES ('249', '/Uploads/Docpic/2016-12-22/585b808623ba3.jpg', '', '17976aab6941b57e35f141743936397b', 'e7992aa6e05ae594fb6f7fadf548f17c383cea8f', '1', '1482391686');
INSERT INTO `ghao_picture` VALUES ('250', '/Uploads/Docpic/2016-12-22/585b80a5cb93c.jpg', '', 'e1c7987faa777da62f30f5347d2c9975', '82b7bd954e793ce41ad575788ab52ee08a1de406', '1', '1482391717');
INSERT INTO `ghao_picture` VALUES ('251', '/Uploads/Docpic/2016-12-22/585b80fe16ba1.jpg', '', 'e4566578e2f837933a7b0a1f69080dbd', '40ae1851ff948860539a44aac91e62d492f3f192', '1', '1482391806');
INSERT INTO `ghao_picture` VALUES ('252', '/Uploads/Docpic/2016-12-22/585b81229674a.jpg', '', '1301b2e2497977df99779e7db5dece08', '9d0663bc784b22d9e5808b5b2bab371eef9be3f2', '1', '1482391842');
INSERT INTO `ghao_picture` VALUES ('253', '/Uploads/Docpic/2016-12-22/585b819a36f98.jpg', '', '834c83642053c8efba95b542c33e2bdf', 'fed8880da8b609629eed3c672b4fdbac6400ece1', '1', '1482391962');
INSERT INTO `ghao_picture` VALUES ('254', '/Uploads/Docpic/2016-12-22/585b81cf8b102.jpg', '', '2262f24480be187abf7a731431d0fa9b', '7ddc3eccb976fb198312f32e3482567d9318bfa2', '1', '1482392015');
INSERT INTO `ghao_picture` VALUES ('255', '/Uploads/Docpic/2016-12-22/585b81f1cc2b3.jpg', '', '1ce2af43676698c70d45eedc2f933f34', 'e3d90e76c507bf636cb931140c80855a5cf9aa6f', '1', '1482392049');
INSERT INTO `ghao_picture` VALUES ('257', '/Uploads/Docpic/2016-12-22/585b832d3b3d1.jpg', '', '004bab73c2ae61fccc3ce9c73ff52972', 'f906c8621d202278564937bc185f6447fea0a652', '1', '1482392365');
INSERT INTO `ghao_picture` VALUES ('258', '/Uploads/Docpic/2016-12-22/585b834e9e120.jpg', '', '890881149127a762645fb73339f76a4d', 'a7a059e24791298eaf08c90da1aedd4da77855b8', '1', '1482392398');
INSERT INTO `ghao_picture` VALUES ('259', '/Uploads/Docpic/2016-12-22/585b838f653dd.jpg', '', '143cbf1d3b137942263a9d3b2d4fbc04', '36ef3a89aac125ae3404a156643eb7e57c4832a4', '1', '1482392463');
INSERT INTO `ghao_picture` VALUES ('260', '/Uploads/Docpic/2016-12-22/585b83b151c04.jpg', '', '9c7d9c07748ef21f9d404cbc6f6540f2', '88b636e40ac5643b9e6d03c0fc3e56127d2947e4', '1', '1482392496');
INSERT INTO `ghao_picture` VALUES ('261', '/Uploads/Docpic/2016-12-22/585b83d18bf7d.jpg', '', '0850f06daa9a6be1331989361e9c1aed', 'f134c91ceb06b8be626ba4e351fb66fe342cf2d7', '1', '1482392529');
INSERT INTO `ghao_picture` VALUES ('262', '/Uploads/Docpic/2016-12-22/585b8406dee49.jpg', '', '40aa5386c8408d604293bb6b725a6dd4', '508be9c98fd155226de56fe04212adee9416e64d', '1', '1482392582');
INSERT INTO `ghao_picture` VALUES ('263', '/Uploads/Docpic/2016-12-22/585b8420d53b0.jpg', '', 'b87221d05b8df797e707aee6eb367532', 'ef6ddc2c21e886e2fb33c1371b5b4297c22e26d9', '1', '1482392608');
INSERT INTO `ghao_picture` VALUES ('264', '/Uploads/Docpic/2016-12-22/585b8437cad21.jpg', '', 'fda17a0169d3cca7f31b3624c2c773ed', '7b70941ccb1b728080e87463672ad6420a6f2e8c', '1', '1482392631');
INSERT INTO `ghao_picture` VALUES ('265', '/Uploads/Docpic/2016-12-22/585b8459d4fa8.jpg', '', 'cc5a8f839db3f7151b6309e606c6eced', 'a18b8b2e7d8a75253f10b80333d1dd3016fd054f', '1', '1482392665');
INSERT INTO `ghao_picture` VALUES ('266', '/Uploads/Docpic/2016-12-22/585b8482dd8d3.jpg', '', '0b46a37e7b2f5232b235bdc8450a18e0', 'f363c834ec5ef8706f92f17ee8ff8fc24f92f442', '1', '1482392706');
INSERT INTO `ghao_picture` VALUES ('267', '/Uploads/Docpic/2016-12-22/585b84a76ab9f.jpg', '', 'fb136d41206019044fe6d7e1ce498f3f', '5a43b44e9b3d3a919dad7b638b60cb4fef25cb24', '1', '1482392743');
INSERT INTO `ghao_picture` VALUES ('268', '/Uploads/Docpic/2016-12-22/585b84beb4b90.jpg', '', 'de00ce3e4da57363b49dae32595c3ef6', '9b3fe5c395f50277e73cfe13434dcd37a601e7ee', '1', '1482392766');
INSERT INTO `ghao_picture` VALUES ('269', '/Uploads/Docpic/2016-12-22/585b84d82b44d.jpg', '', 'bbd692e224ca34845fd831bec812da2c', 'f2aa66a5fd9bf7671f4c31a5b3bb14f5d8d4c865', '1', '1482392792');
INSERT INTO `ghao_picture` VALUES ('270', '/Uploads/Docpic/2016-12-22/585b84fa07f9d.jpg', '', 'fab093426e321e7402fb8b1291519150', '4663cb600bfd8e328a855f9660ce45dc0ee15da4', '1', '1482392825');
INSERT INTO `ghao_picture` VALUES ('271', '/Uploads/Docpic/2016-12-22/585b851290f30.jpg', '', '8762c70e1be2aee93cc0d95659c2a590', 'ca2414a8555ca84bff6486172db905a3347275fd', '1', '1482392850');
INSERT INTO `ghao_picture` VALUES ('273', '/Uploads/Docpic/2016-12-22/585b855e4dc73.jpg', '', 'e6baadf343e2509ad9943430e52701b7', '6bbcc87241affcbd3c26af4fb0e9bb3fd9d38e53', '1', '1482392926');
INSERT INTO `ghao_picture` VALUES ('274', '/Uploads/Docpic/2016-12-22/585b861fd4882.jpg', '', '185d6c3b07b85d7eaff2e9d8bbc9046b', 'e2407d332c56c2a0395661bf2c23edfb357746bc', '1', '1482393119');
INSERT INTO `ghao_picture` VALUES ('275', '/Uploads/Docpic/2016-12-22/585b868fd8550.jpg', '', '0ba8f7dcd476e599cbace7ca26d99810', '1c9dc489407d68a3985635c55fbc40c17ef522f7', '1', '1482393231');
INSERT INTO `ghao_picture` VALUES ('276', '/Uploads/Docpic/2016-12-22/585b86addacab.jpg', '', '64009304b07a7409f23187a2e3d83567', 'eb8478ec798235a36e6df6fa9d6121cdd637f804', '1', '1482393261');
INSERT INTO `ghao_picture` VALUES ('277', '/Uploads/Docpic/2016-12-22/585b86c789b1a.jpg', '', 'd77465744957d69a9e89047757bd0f98', '26afc92ba4a4528593369046b4b3faa039b4317d', '1', '1482393287');
INSERT INTO `ghao_picture` VALUES ('278', '/Uploads/Docpic/2016-12-22/585b86e9c4ae0.jpg', '', '35c138b1259cce45ef9ec4efbff63795', '8ae68eae87a31f6d0ece86359f5b743f292f0c11', '1', '1482393321');
INSERT INTO `ghao_picture` VALUES ('279', '/Uploads/Docpic/2016-12-22/585b870097490.jpg', '', '0685fed8abdb38efd69dabcac3b904a8', '5b9850df19c83787345d68964b7eb58c33f70719', '1', '1482393344');
INSERT INTO `ghao_picture` VALUES ('280', '/Uploads/Docpic/2016-12-22/585b8719e121b.jpg', '', '6c154dd08a0c214984a00fcd3486f467', '31255f9afd5700ea45bb8ee88dc41f0446afc2aa', '1', '1482393369');
INSERT INTO `ghao_picture` VALUES ('281', '/Uploads/Docpic/2016-12-22/585b873610cfa.jpg', '', '64746a54df57874365b3fa6141156714', '0dd1b5a0e21c43b6cd13000fb17ea5d52c35b89e', '1', '1482393397');
INSERT INTO `ghao_picture` VALUES ('282', '/Uploads/Docpic/2016-12-22/585b875e52d02.jpg', '', '507f3c4c3edfe250c1521f2d5766810b', '162a91b69dbca292565f3806ecdc76df11f1f63e', '1', '1482393438');
INSERT INTO `ghao_picture` VALUES ('283', '/Uploads/Docpic/2016-12-22/585b87790d71c.jpg', '', '5c0729d20fa569ede8c39521c0a30d7b', '01f562caef91933eca3bb82bc8c198311e26413a', '1', '1482393464');
INSERT INTO `ghao_picture` VALUES ('284', '/Uploads/Docpic/2016-12-22/585b87978ef3c.jpg', '', '0a7f42e30628fcbd5f4611b8773f08ed', '0b8697902cd35710f044a7dd6bbc152dad45aa36', '1', '1482393495');
INSERT INTO `ghao_picture` VALUES ('285', '/Uploads/Docpic/2016-12-22/585b87b4e4717.jpg', '', '8fedc9ae563ae769e9b25f32566ffaa7', 'bd0cfff490cedfd34831e8ac053cce8f297bf862', '1', '1482393524');
INSERT INTO `ghao_picture` VALUES ('286', '/Uploads/Docpic/2016-12-22/585b87cdb0b45.jpg', '', '597ff05b3e9fcb27f6869af59e0703d5', '34b15066a98eb5a51b51bbe08bf97960aa0c09dd', '1', '1482393549');
INSERT INTO `ghao_picture` VALUES ('287', '/Uploads/Docpic/2016-12-22/585b87f284c1f.jpg', '', 'b92749304f7128a95fb910523e2988c2', '55b41f47539f32d78eb1e9f4a5b3c92d22e92fce', '1', '1482393586');
INSERT INTO `ghao_picture` VALUES ('288', '/Uploads/Docpic/2016-12-22/585b881fde664.jpg', '', '695e7bf3f5031bdb402e873b1540ec5a', '39a7d87959070a718d05278faebf7ede51ec7c20', '1', '1482393631');
INSERT INTO `ghao_picture` VALUES ('289', '/Uploads/Docpic/2016-12-22/585b88472c6b4.jpg', '', 'e53cb32370636fe99021f0a2fd7a42d4', '1754f0c64c5fabbd1512505c768df71ed4aa7952', '1', '1482393671');
INSERT INTO `ghao_picture` VALUES ('290', '/Uploads/Docpic/2016-12-22/585b88602f097.jpg', '', '886be6356bc35f12d9472d79b4c59651', 'dd2edc1c8896204b2d5e2fddc0b5af4bca4405b9', '1', '1482393696');
INSERT INTO `ghao_picture` VALUES ('291', '/Uploads/Docpic/2016-12-22/585b88839b461.jpg', '', '16b36e199df1ca9ccf3fbb02a0537bf7', '28fe1763442b0f01d8a14036851971d85d757372', '1', '1482393731');
INSERT INTO `ghao_picture` VALUES ('292', '/Uploads/Docpic/2016-12-22/585b889e09ba6.jpg', '', 'bd9b772addb6d810e2c61b53079393b9', 'dd57adaef5a99e15f84d8b775b6a27b9b67736fe', '1', '1482393757');
INSERT INTO `ghao_picture` VALUES ('293', '/Uploads/Docpic/2016-12-22/585b88b3a0cfc.jpg', '', '46db44813d036236012dcb9e3e95b189', '59f5226716fb2ca6cb8d58de3445f72b92cee61a', '1', '1482393779');
INSERT INTO `ghao_picture` VALUES ('294', '/Uploads/Docpic/2016-12-22/585b88d2631a3.jpg', '', 'a8b984fbfc7ccbe304886db3a27be25a', '9b23c46101d4e281d7b5ecc47b26b7f4528ce5c3', '1', '1482393810');
INSERT INTO `ghao_picture` VALUES ('295', '/Uploads/Docpic/2016-12-22/585b88f371ab3.jpg', '', '9ee73d1b87c2281bdf554655a8a383f9', 'e276d6422243812111f551d6f6f3f68d65ad81a1', '1', '1482393843');
INSERT INTO `ghao_picture` VALUES ('296', '/Uploads/Docpic/2016-12-22/585b892b9b078.jpg', '', '733e1f99745382f9667ef8c433041fcb', 'a3009e0368b5e6be0b5b98252e99ca660c50fa56', '1', '1482393899');
INSERT INTO `ghao_picture` VALUES ('297', '/Uploads/Docpic/2016-12-22/585b8965b1db8.jpg', '', '12ce586ca0f2a90e00d248d007863207', 'f14ca83a88c3665be55248d4013d0dc05d6556af', '1', '1482393957');
INSERT INTO `ghao_picture` VALUES ('298', '/Uploads/Docpic/2016-12-23/585c7e29041d2.jpg', '', '48efbd69f05463f2ce7a2c7d8bb2e7aa', '48edd2ffe94fdb675c7c6ace5c021735b5a11155', '1', '1482456616');
INSERT INTO `ghao_picture` VALUES ('299', '/Uploads/Docpic/2016-12-23/585c7e52a0054.jpg', '', '4e75bc8b0cfcc8ae493447f915e0ec38', '4a8f59436c32272c6e17ad3c56a90da2f34ed43d', '1', '1482456658');
INSERT INTO `ghao_picture` VALUES ('300', '/Uploads/Docpic/2016-12-23/585c7e779a098.jpg', '', 'a33eac61f950a2e60028fed77ae28b20', '6be253f3803574d69016170c36944fc32cb7b969', '1', '1482456695');
INSERT INTO `ghao_picture` VALUES ('301', '/Uploads/Docpic/2016-12-23/585c7eb7142a2.jpg', '', 'b3cfc89d406f64042b10493aec9dc201', 'e0ef3a53527d8b24532e4be08ec4933e9bc7c0d8', '1', '1482456759');
INSERT INTO `ghao_picture` VALUES ('302', '/Uploads/Docpic/2016-12-23/585c7efa4c9df.jpg', '', '904b6ceb05dae882e79f99769bb93bf1', '8a7a2c429c8e6eac6a03eb2175d54b353f97bb1c', '1', '1482456826');
INSERT INTO `ghao_picture` VALUES ('303', '/Uploads/Docpic/2016-12-23/585c7f19997d4.jpg', '', '20a24d0a96f49707a8da06f931390a1c', 'cfc6ed82b35204e85ef8c5c5cfd857005e661058', '1', '1482456857');
INSERT INTO `ghao_picture` VALUES ('304', '/Uploads/Docpic/2016-12-23/585c7f4ab10cb.jpg', '', '0bf84f613108f1064936945ed12f47a7', '426542652fc44ff575b6760a747f8723d2bd2f2b', '1', '1482456906');
INSERT INTO `ghao_picture` VALUES ('305', '/Uploads/Docpic/2016-12-23/585c7f6801a3e.jpg', '', 'c424ed0b367d4109ec8763cd8185b7ed', 'ffebcf912dfa80913d350f169e96d9c522db0418', '1', '1482456935');
INSERT INTO `ghao_picture` VALUES ('306', '/Uploads/Docpic/2016-12-23/585c7f7ac1e27.jpg', '', '8b7f292c0a5c54b425152a566a8d6b99', '18f25fa7daaacac6532de261f50ba10c7a32971b', '1', '1482456954');
INSERT INTO `ghao_picture` VALUES ('307', '/Uploads/Docpic/2016-12-23/585c7fa274a57.jpg', '', '475d191084d481ffa6c0ba5fee2319b0', 'e94072ac5c0d2934b4b4d62b3e634864a0e9bb2c', '1', '1482456994');
INSERT INTO `ghao_picture` VALUES ('308', '/Uploads/Docpic/2016-12-23/585c7fbe0189d.jpg', '', '97681c26283a71d2b8d3325b45d991f8', '50c7ed8787dd40cac739ef25e8c7cb9b5e91dca2', '1', '1482457021');
INSERT INTO `ghao_picture` VALUES ('309', '/Uploads/Docpic/2016-12-23/585c7fd08b897.jpg', '', '8ffa361897da90f3aefbcd767f6b06d3', 'd1fa090c56fc72f8156b5f9b4138038de7b5f1f2', '1', '1482457040');
INSERT INTO `ghao_picture` VALUES ('310', '/Uploads/Docpic/2016-12-23/585c7feb139a8.jpg', '', 'f8e688ae3e91042657bf6c0d326d199e', 'c2bbfb51ea08482327045cc7a28ecdb0760ec876', '1', '1482457067');
INSERT INTO `ghao_picture` VALUES ('311', '/Uploads/Docpic/2016-12-23/585c800ae0d49.jpg', '', '774f6c99c311ee1638b5dda4f1cff276', '29b3e661e757e0036e392a863ccc145356f66426', '1', '1482457098');
INSERT INTO `ghao_picture` VALUES ('312', '/Uploads/Docpic/2016-12-23/585c8026d2ef3.jpg', '', 'd65c602f3a5beecee89b385add84da5c', '7fc7b81984ecab996048459ed8a03d87558bc068', '1', '1482457126');
INSERT INTO `ghao_picture` VALUES ('313', '/Uploads/Docpic/2016-12-23/585c81bc3774b.jpg', '', '9bb8c0d8e7a967518bb12f3bd0e8e0bf', 'a67e137d3d924f56caf9621c84b0b9b502d23d25', '1', '1482457532');
INSERT INTO `ghao_picture` VALUES ('314', '/Uploads/Docpic/2016-12-23/585c823b720a5.jpg', '', '7550498313d42b22faa3751f6d902629', '2240d834f0ab84a212463c46b558d6ea7ce652be', '1', '1482457659');
INSERT INTO `ghao_picture` VALUES ('315', '/Uploads/Docpic/2016-12-23/585c826e74af6.jpg', '', 'a0350d2668cc87e14723ccb186a59882', '19faca7c8f2a018cccfd0d1656f659cc285c51f8', '1', '1482457710');
INSERT INTO `ghao_picture` VALUES ('316', '/Uploads/Docpic/2016-12-23/585c909e75b73.jpg', '', '3d072dae62aaa43d37024e5585857054', 'b3656b65d96cf32901f6fd22fcbe5e75764ef161', '1', '1482461342');
INSERT INTO `ghao_picture` VALUES ('317', '/Uploads/Docpic/2016-12-23/585c90bbc8237.jpg', '', 'f2fc477da4f376b48bb0f62c5563caa3', 'ccf86cc4fd3fe48eb3504b06c568925d9e65931b', '1', '1482461371');
INSERT INTO `ghao_picture` VALUES ('318', '/Uploads/Docpic/2016-12-23/585c90f3074b7.jpg', '', '308a38e4f00c6432b27beddba405ae41', '4f2a05367bd93b127aa387d6fd95e46d7805138b', '1', '1482461426');
INSERT INTO `ghao_picture` VALUES ('320', '/Uploads/Docpic/2016-12-23/585c93768a8a8.jpg', '', '8eff535bdee921dfad9454633424ccab', '53972e2c0053e111b206b8520e711f2ab5c656fb', '1', '1482462070');
INSERT INTO `ghao_picture` VALUES ('321', '/Uploads/Docpic/2016-12-23/585c939eaac75.jpg', '', '8c904e8d8a24736ac3e075cdb8157f6e', '674048338deecef483cdb39219762d8f10dcd3c0', '1', '1482462110');
INSERT INTO `ghao_picture` VALUES ('322', '/Uploads/Docpic/2016-12-23/585c93b6e8bfd.jpg', '', '1f8056de2093d71ee2e902278698c8a3', '8ff4e7f9d279f7b372be3eb0e367f1857bb5c719', '1', '1482462134');
INSERT INTO `ghao_picture` VALUES ('323', '/Uploads/Docpic/2016-12-23/585c93da7410b.jpg', '', 'cd96ee93b9c6ffe770678a5b05e6dab8', 'fd2815ce0eb753f5201aee307b31855f037baf70', '1', '1482462170');
INSERT INTO `ghao_picture` VALUES ('324', '/Uploads/Docpic/2016-12-23/585c93fd08885.jpg', '', 'bdcbc7c89085634282682adbe24ceb77', '96ff138e29ff3aeb29a25c308f1764b8721b2a68', '1', '1482462204');
INSERT INTO `ghao_picture` VALUES ('325', '/Uploads/Docpic/2016-12-23/585c941949331.jpg', '', '5a2c820aedb819f2ca31176d6560e213', '5ebe267419f70507c6fc2d5adf5be7479f2db569', '1', '1482462233');
INSERT INTO `ghao_picture` VALUES ('326', '/Uploads/Docpic/2016-12-23/585c942ee7701.jpg', '', '4dbd23864c4b12a4a8b445d85bf9dac5', '5da4e5c22b20c21c97075bc0257658815b7eafad', '1', '1482462254');
INSERT INTO `ghao_picture` VALUES ('327', '/Uploads/Docpic/2016-12-23/585c944a4868e.jpg', '', '7889b071e860bc4b4f12a676c88bf9f7', '218cc796720ed22d99f6a03f93b85646e761e8fc', '1', '1482462282');
INSERT INTO `ghao_picture` VALUES ('328', '/Uploads/Docpic/2016-12-23/585c9470dec5a.jpg', '', 'dc5b9ff8d57b9d567237e5c345d83c30', '00cdc1507b0a0ac74126c7cf0e64e027a13ce8fb', '1', '1482462320');
INSERT INTO `ghao_picture` VALUES ('329', '/Uploads/Docpic/2016-12-23/585c948ce57fb.jpg', '', 'febde9d578c3ec44e9df658ce8228611', '2a9f65dd48136bc296c3da1f6ddfb80a8778c93d', '1', '1482462348');
INSERT INTO `ghao_picture` VALUES ('330', '/Uploads/Docpic/2016-12-23/585c94a5dc912.jpg', '', 'd973643a8dbbdee35519b53f401730b9', 'a0e7c45f332ed2b126b7be8f904c0f6ca32c6867', '1', '1482462373');
INSERT INTO `ghao_picture` VALUES ('331', '/Uploads/Docpic/2016-12-23/585c94bde6f40.jpg', '', '76c0d81cce16cfc282970bc525749e00', 'e9e3b08476b77fb7f967995bb40bc121d5ad118d', '1', '1482462397');
INSERT INTO `ghao_picture` VALUES ('332', '/Uploads/Docpic/2016-12-23/585c94d6e62b8.jpg', '', '7dea274b06837480c406e21b3fc75f88', 'd643b2c18ab8800a2f676d62677376768499ba35', '1', '1482462422');
INSERT INTO `ghao_picture` VALUES ('333', '/Uploads/Docpic/2016-12-23/585c94f7e68d3.jpg', '', '3473fd711ff2f84edb6e535b8b24677d', '5f8c99b8db5e000a42794fcb46fc57070775ced1', '1', '1482462455');
INSERT INTO `ghao_picture` VALUES ('334', '/Uploads/Docpic/2016-12-23/585c950e1756f.jpg', '', '86b23f85d11f45cf10e9ed690703fae4', 'e70f1ba1af12088f9b61ab433e9ab59a66e9fbad', '1', '1482462478');
INSERT INTO `ghao_picture` VALUES ('335', '/Uploads/Docpic/2016-12-23/585c952261b9f.jpg', '', 'e3983c8422e0cb42e47749c24fadb411', 'ba9499f67adbbb472cb5027c4d9673bb3cec9492', '1', '1482462498');
INSERT INTO `ghao_picture` VALUES ('336', '/Uploads/Docpic/2016-12-23/585c954552618.jpg', '', 'f3cfede6709ed4a02f4ac87aeb163fd1', '8bf699b8b3d6a10fd75988073df997b7ce0c0230', '1', '1482462533');
INSERT INTO `ghao_picture` VALUES ('337', '/Uploads/Docpic/2016-12-23/585c955b4a0c5.jpg', '', '893ae9b61d10bc1a17ec7c35bc4719ea', '4996b7e1c9b0cbd093a5687a7b8069a90d146a2a', '1', '1482462555');
INSERT INTO `ghao_picture` VALUES ('338', '/Uploads/Docpic/2016-12-23/585c956c25f33.jpg', '', 'ed5b22149849311a167a885d066a6383', 'c2a579b1ab114d8dd60c8f4c3395ecc81f4eb84d', '1', '1482462572');
INSERT INTO `ghao_picture` VALUES ('339', '/Uploads/Docpic/2016-12-23/585c95832e3b8.jpg', '', 'fa7cf5675caaa4b3343b58047e4b8102', '5c016e2a84a2a278b0cbcb082bbe3ad4a69f6d06', '1', '1482462595');
INSERT INTO `ghao_picture` VALUES ('340', '/Uploads/Docpic/2016-12-23/585c95c01a508.jpg', '', '01aa1a78fef3788d5d206135878a3e5e', '541e46e95aa2e5b07c490c1e9dd2843da097ea82', '1', '1482462656');
INSERT INTO `ghao_picture` VALUES ('341', '/Uploads/Docpic/2016-12-23/585c95f235bfa.jpg', '', 'd3ac67daf3096d7fe54c39f0fdd1ca84', 'ccf8e131f19ba64b9e9392244e8c8ffdfcbd8f96', '1', '1482462706');
INSERT INTO `ghao_picture` VALUES ('342', '/Uploads/Docpic/2016-12-23/585c960fdd3dc.jpg', '', '51d1c5aad6b74c4c40559ca9216fa2aa', '662e9dc4cd164db9d73b369eb3618e60213464ae', '1', '1482462735');
INSERT INTO `ghao_picture` VALUES ('343', '/Uploads/Docpic/2016-12-23/585c9638bf9b5.jpg', '', '291cf947521fa6d0dfa518688db121c2', '98721fa0a5637f6135627d35f67db1cc7f795f53', '1', '1482462776');
INSERT INTO `ghao_picture` VALUES ('344', '/Uploads/Docpic/2016-12-23/585c967567227.jpg', '', '6a634ae85d30824233d8e02ffdf698e1', '2d7034f1f1be06cd63a33b2d36fd2aa593a80c39', '1', '1482462837');
INSERT INTO `ghao_picture` VALUES ('345', '/Uploads/Docpic/2016-12-23/585c96954926c.jpg', '', '70e775862e4c7e1e691403a3691adee7', '018306321d9983101695b81d888a07aab6b21c7d', '1', '1482462869');
INSERT INTO `ghao_picture` VALUES ('346', '/Uploads/Docpic/2016-12-23/585c96b25b7e7.jpg', '', '694bc6cdd6873ea1a67137bc76e23960', 'eaaa42ead202aa7518ecf559dc9bce1cee0fefce', '1', '1482462898');
INSERT INTO `ghao_picture` VALUES ('347', '/Uploads/Docpic/2016-12-23/585c96ce55650.jpg', '', '3c7152c1fcb1db0c0d9a0eac158fc494', '8bb4f8ffdf17a42a1a37b1f137401a388b353149', '1', '1482462926');
INSERT INTO `ghao_picture` VALUES ('348', '/Uploads/Docpic/2016-12-23/585c96e90a634.jpg', '', 'efd99138dbad9340cbc7cc1db2025bc8', '5a0379f7afb5bbfcf12975acb0d569b862f7bacf', '1', '1482462952');
INSERT INTO `ghao_picture` VALUES ('349', '/Uploads/Docpic/2016-12-23/585c97010846e.jpg', '', '7c5eb5cfd4587f614c10d7da2b87d69a', 'ef08d29eaee771e70aac9e2282a7ed828e887575', '1', '1482462976');
INSERT INTO `ghao_picture` VALUES ('350', '/Uploads/Docpic/2016-12-23/585c97136d8f1.jpg', '', 'e777e99e41affdd8937af1b628ab6ef9', 'dfa6f03e35108d29b257def226dc8899251ba481', '1', '1482462995');
INSERT INTO `ghao_picture` VALUES ('351', '/Uploads/Docpic/2016-12-23/585c9722ca955.jpg', '', 'ea6e6e625530097afa61bbe154fb62f1', 'fd6ef7dc8e35d16a48a39b2e176aa85483412672', '1', '1482463010');
INSERT INTO `ghao_picture` VALUES ('352', '/Uploads/Docpic/2016-12-23/585c97323bb4b.jpg', '', '35c18b70c7e9a7e292ec72eb7c5a02a5', '3288bc1480fc021b2bf5447c052af714f57688de', '1', '1482463026');
INSERT INTO `ghao_picture` VALUES ('353', '/Uploads/Docpic/2016-12-23/585c97560c115.jpg', '', '497c33ed98b6147dce4650f1ddf2df42', 'ee9e8273b093cc0447bb6391f1f966d8d4d852b7', '1', '1482463061');
INSERT INTO `ghao_picture` VALUES ('354', '/Uploads/Docpic/2016-12-23/585c9775db7ff.jpg', '', 'edcc5d69180777db961c9290e9ceb5aa', '257989f5901cbf91ef72992f1df43b2136d35436', '1', '1482463093');
INSERT INTO `ghao_picture` VALUES ('355', '/Uploads/Docpic/2016-12-23/585c9788dfc96.jpg', '', '45f0fe17237b87fea8654f0f11dcf23a', '9d17278fc323dff11b889ea76f223408fbad2ea3', '1', '1482463112');
INSERT INTO `ghao_picture` VALUES ('356', '/Uploads/Docpic/2016-12-23/585c97a006874.jpg', '', '1ac6b4fabbc3e341f1189e9e36ff369a', '389c936e418b862b37d7be35f12976249ed1e2f0', '1', '1482463135');
INSERT INTO `ghao_picture` VALUES ('357', '/Uploads/Docpic/2016-12-23/585cb6a03d033.jpg', '', 'e2825bde4a2b2b6419ec3be31504c785', '2fed3578eedc85caa68b6e055f0b282e86c9455e', '1', '1482471072');
INSERT INTO `ghao_picture` VALUES ('358', '/Uploads/Docpic/2016-12-23/585cb6e00d649.jpg', '', '36113dc455ac18f58dfc9f7efeb151d6', '0283c6cc0ce1b75521890d9a4b8b04c3768a5f84', '1', '1482471135');
INSERT INTO `ghao_picture` VALUES ('360', '/Uploads/Docpic/2016-12-23/585cb7a6ea0b3.jpg', '', '46089a765a044aa63c0b964b970de541', 'dbd95e103baedaf076663b2d883f59b8849dfdcb', '1', '1482471334');
INSERT INTO `ghao_picture` VALUES ('361', '/Uploads/Docpic/2016-12-23/585cb7c8e7bc5.jpg', '', '234d0579bf8a34d78357c12026116380', '2d246d9d526777c4f13b1248b5318bf248115c4c', '1', '1482471368');
INSERT INTO `ghao_picture` VALUES ('362', '/Uploads/Docpic/2016-12-23/585cb7ed746c3.jpg', '', 'b0602f4e20dc06c2597320443d090524', '3cfbd1d6417bf960663833d3a6711268dd0c2840', '1', '1482471405');
INSERT INTO `ghao_picture` VALUES ('363', '/Uploads/Docpic/2016-12-23/585cb870ec9f7.jpg', '', '8e2d820265aff498583812b52af260e4', '091f924ea0929caa0d2958b75d4410da317bfb17', '1', '1482471536');
INSERT INTO `ghao_picture` VALUES ('364', '/Uploads/Docpic/2016-12-23/585cb88fb921a.jpg', '', '6a0966edd112a78e32e319ce095a8ee5', '1b8fe83c1f5f7216e3233a581fb853dd5b25c105', '1', '1482471567');
INSERT INTO `ghao_picture` VALUES ('365', '/Uploads/Docpic/2016-12-23/585cb8aeecc5e.jpg', '', 'eaba006481228c4149e06213df3f06bd', '36fff40f77cffbe40d8da94fad4a36542edee708', '1', '1482471598');
INSERT INTO `ghao_picture` VALUES ('366', '/Uploads/Docpic/2016-12-23/585cb930b3869.jpg', '', '3d9234b49350ed0b431c5e13ff948412', 'c4190f13cdc2070c2c55631057c08e4acb13991d', '1', '1482471728');
INSERT INTO `ghao_picture` VALUES ('367', '/Uploads/Docpic/2016-12-23/585cb964aeca8.jpg', '', '4f83d2dc27835ce64a4b2b07eb452d83', 'b787d3db81f93ac7ad66cac544f172a80f62569a', '1', '1482471780');
INSERT INTO `ghao_picture` VALUES ('368', '/Uploads/Docpic/2016-12-23/585cb9a37ab0c.jpg', '', '534806f44bd21b26792f6a13d8bab0a3', '1e53e633c18041369576a93b2ef89f925d64f452', '1', '1482471843');
INSERT INTO `ghao_picture` VALUES ('369', '/Uploads/Docpic/2016-12-23/585cb9b64bdae.jpg', '', '2c6c4d10dfc1389e20256a5b0b1c9ab6', '18324b6ebbc76fdfa96a30b8c1da9a790a35cba2', '1', '1482471862');
INSERT INTO `ghao_picture` VALUES ('370', '/Uploads/Docpic/2016-12-23/585cb9d1d24bc.jpg', '', 'b8d6d5d4d86bdb6171f29d0631f160ab', '924256fa77ec76aae9d265d89d58e74e003e92e6', '1', '1482471889');
INSERT INTO `ghao_picture` VALUES ('371', '/Uploads/Docpic/2016-12-23/585cb9e506ddc.jpg', '', '1b47aaca310b4d9207dec7cd272712e3', '5b58a8dfc648fd7d987cc69906d5071b0ad81ce0', '1', '1482471908');
INSERT INTO `ghao_picture` VALUES ('372', '/Uploads/Docpic/2016-12-23/585cb9fd7160a.jpg', '', '7c184da1d55e6062148a5ff2ee1aa29c', '489c2dec93b32758fa25dbb82aa24714c7cbe4a1', '1', '1482471933');
INSERT INTO `ghao_picture` VALUES ('373', '/Uploads/Docpic/2016-12-23/585cba15cb9a3.jpg', '', 'a968119a8eb629a94647d1478dc112e8', 'eb59154df26d021112089c70e1aadf4edae847cd', '1', '1482471957');
INSERT INTO `ghao_picture` VALUES ('374', '/Uploads/Docpic/2016-12-23/585cba334fde3.jpg', '', '1f51c65301a97c23e666c49e30e47ff5', 'd1a93c51070bf9b002481bac715366cb30aeb236', '1', '1482471987');
INSERT INTO `ghao_picture` VALUES ('375', '/Uploads/Docpic/2016-12-23/585cba474796d.jpg', '', '839be8f546113df6bfd1c568c7ad3789', 'd106fc2d2df5033d976b0d716902300e24f0cd7c', '1', '1482472007');
INSERT INTO `ghao_picture` VALUES ('376', '/Uploads/Docpic/2016-12-23/585cbac00e6e3.jpg', '', 'e6a7dc9064778c9b4adbb94ff7e95abc', '567f078854adce63eaf2ecda43be03c5cc42829f', '1', '1482472127');
INSERT INTO `ghao_picture` VALUES ('377', '/Uploads/Docpic/2016-12-23/585cbada9a226.jpg', '', '8a736a42088a936ef04c0f00328d846d', '66f170974c88ba57f962a6c368a0ca31bc67ea08', '1', '1482472154');
INSERT INTO `ghao_picture` VALUES ('378', '/Uploads/Docpic/2016-12-23/585cbb2291df1.jpg', '', '5eb896dd89658979a4b2e40f944acd75', '27ac3851b0dfe6492249d28bb6c1fd3fa82d37e2', '1', '1482472226');
INSERT INTO `ghao_picture` VALUES ('379', '/Uploads/Docpic/2016-12-23/585cbb7bd3531.jpg', '', '088679235587a034d5188fd33b6ad809', '10d255900e9e0f45db7acceff60b49aa6eac3dfe', '1', '1482472315');
INSERT INTO `ghao_picture` VALUES ('380', '/Uploads/Docpic/2016-12-23/585cc3c616c93.jpg', '', '25abbf7742e48dadbbea43bc81045ce4', '2931a37ff4f807387b7318becd4484a76fd4fee0', '1', '1482474438');
INSERT INTO `ghao_picture` VALUES ('381', '/Uploads/Docpic/2016-12-23/585cc3df4664e.jpg', '', 'd0859e2bd3b91a1bb3048c28e320877e', '36e68549ad4d4c0a205287c688b489d65719d135', '1', '1482474463');
INSERT INTO `ghao_picture` VALUES ('382', '/Uploads/Docpic/2016-12-23/585cc585b5cc2.jpg', '', '477546fb84af7b982a5f8382c28fb322', 'f3b0f442b7a06bdb7191ebede7b393824d3ba3f3', '1', '1482474885');
INSERT INTO `ghao_picture` VALUES ('383', '/Uploads/Docpic/2016-12-23/585cc5fbb4fb3.jpg', '', '130eced7b668fb451a626674b19c02dc', 'ee2b1fce1e8bf8e0fb6af3c75c5b595d75796c4a', '1', '1482475003');
INSERT INTO `ghao_picture` VALUES ('384', '/Uploads/Docpic/2016-12-23/585cc618de603.jpg', '', '439fc0bb948f62f5ea1d7d6b87a0eaca', '2a668ee4697fe6fd6c924616dd6defa4c3539056', '1', '1482475032');
INSERT INTO `ghao_picture` VALUES ('385', '/Uploads/Docpic/2016-12-23/585cc638daf13.jpg', '', '38f63da910c1aadb132e97004b0df33b', '34e1f8e892bc6ea61f9cdad6dc83f375aca91700', '1', '1482475064');
INSERT INTO `ghao_picture` VALUES ('386', '/Uploads/Docpic/2016-12-23/585cc65a07ca7.jpg', '', '96ea7531e8039c12f785679ab36fe983', '56e2554a503cac1c3c5bdcce79bde9d316c35b87', '1', '1482475097');
INSERT INTO `ghao_picture` VALUES ('387', '/Uploads/Docpic/2016-12-23/585cc67b80282.jpg', '', '2a75439b02bc072b3379f0abb15f4afc', '134afe5b81df59cdf5fde36efea3cb729c19705d', '1', '1482475131');
INSERT INTO `ghao_picture` VALUES ('388', '/Uploads/Docpic/2016-12-23/585cc6adf2362.jpg', '', '0af9821f1acedd012f053a00a57eb674', 'b7e54d0d3808c29c451c1370e7264c16012f78db', '1', '1482475181');
INSERT INTO `ghao_picture` VALUES ('389', '/Uploads/Docpic/2016-12-23/585cc6d77b695.jpg', '', 'c64b79d25488af2bb3f93ed2af54ae56', 'ae2f80a8e3ea8c04b92bc7ff70ec7128f9c22bee', '1', '1482475223');
INSERT INTO `ghao_picture` VALUES ('390', '/Uploads/Docpic/2016-12-23/585cc77166b4d.jpg', '', '90909ab061dcf98523ad995da1605a7e', '5af088908507e72e217cabdeb7a88ba3e31eea69', '1', '1482475377');
INSERT INTO `ghao_picture` VALUES ('391', '/Uploads/Docpic/2016-12-23/585cc79141051.jpg', '', '11452924ffa6059ff268b416f3c4de30', '6ff0181642ffae16f4366d07e4b9727e63fb2a75', '1', '1482475409');
INSERT INTO `ghao_picture` VALUES ('392', '/Uploads/Docpic/2016-12-23/585cc7b784952.jpg', '', '4c004be6ca64463daf2ff25f4aec493f', '1858bf0fd4e7183d65f1cebdc1e66f450d507bc6', '1', '1482475447');
INSERT INTO `ghao_picture` VALUES ('393', '/Uploads/Docpic/2016-12-23/585cc7cf1137b.jpg', '', '7de4b6d43e6c640f538c2017bfcf258f', '16f2983d7a249c7b77fa8e01482463047761586c', '1', '1482475470');
INSERT INTO `ghao_picture` VALUES ('394', '/Uploads/Docpic/2016-12-23/585cc7e8c78a6.jpg', '', '32ebfca3b6d31389cc071de87fc6ea32', 'fe9438e07993e938cd1bb819a4c00fb13fbb47ee', '1', '1482475496');
INSERT INTO `ghao_picture` VALUES ('395', '/Uploads/Docpic/2016-12-23/585cc7fd70aa5.jpg', '', 'e368658d16aad060b6767980da75a576', 'cc0f081cccc40216930fda175d113f9409fedf67', '1', '1482475517');
INSERT INTO `ghao_picture` VALUES ('396', '/Uploads/Docpic/2016-12-23/585cc8219d40d.jpg', '', 'c3dce60e6ab66e8122bd4d066512b4c3', '1890d12af12480f27a7b53120d3cff4ec6bb8bd4', '1', '1482475553');
INSERT INTO `ghao_picture` VALUES ('397', '/Uploads/Docpic/2016-12-23/585cc82b1f51d.jpg', '', '5c701ddc6d28861b2b56160725cf9f09', 'e5bf37a4251f32a28135216a42dd52c675f748ef', '1', '1482475563');
INSERT INTO `ghao_picture` VALUES ('398', '/Uploads/Docpic/2016-12-23/585cc8432248e.jpg', '', '24a3a8758d4fcb3498d38805b45928e6', '38ad6d371556f8b2f333af26a5a3fcd25d70d522', '1', '1482475587');
INSERT INTO `ghao_picture` VALUES ('399', '/Uploads/Docpic/2016-12-23/585cc85faac74.jpg', '', 'f0bf759e10ee3e2b6dd66ecb95bd6f87', 'a0ee05c0da1f5564d5098d933a99921497cf1dfa', '1', '1482475615');
INSERT INTO `ghao_picture` VALUES ('400', '/Uploads/Docpic/2016-12-23/585cc87e530d4.jpg', '', '8b550e7aed31a6205dcd74c09fcae5c7', '45c9d41f242204223b3d64af1b61578fdb3c78b1', '1', '1482475646');
INSERT INTO `ghao_picture` VALUES ('401', '/Uploads/Docpic/2016-12-23/585cc895079f0.jpg', '', 'e155c5d9289292fc8b3ed1d85ff1e3c8', '848678683d02045054de6f42a76e2b9c90cc4242', '1', '1482475668');
INSERT INTO `ghao_picture` VALUES ('402', '/Uploads/Docpic/2016-12-23/585cc8ac44c56.jpg', '', 'e663de99b9ced1a3a5a96f0641ae17df', '1cde20174b54ffe1a6029d33dc824a612c77711d', '1', '1482475692');
INSERT INTO `ghao_picture` VALUES ('403', '/Uploads/Docpic/2016-12-23/585cc8c145af3.jpg', '', 'a405d036b3d57918d7521dd772359545', 'b58d21a4a5b83ced72aed39f30e6abe38e255fae', '1', '1482475713');
INSERT INTO `ghao_picture` VALUES ('404', '/Uploads/Docpic/2016-12-23/585cc8db89719.jpg', '', 'c28b99fd70b3048659d67db92d6159e4', 'fa95627c5bddbded77d0bbd5bd175c0c39f2ef19', '1', '1482475739');
INSERT INTO `ghao_picture` VALUES ('405', '/Uploads/Docpic/2016-12-23/585cc90de9cf0.jpg', '', '2cd86ec06ff10d1f686ca04710eec042', '266ec23be9abfbb0b549b1f61bce17800259f23c', '1', '1482475789');
INSERT INTO `ghao_picture` VALUES ('406', '/Uploads/Docpic/2016-12-23/585cc92df250b.jpg', '', '666598b05de161eba72c2d63d47b8d41', 'c29827cc49d3b4ce83ed1c7dbb9d2dae06fcff70', '1', '1482475821');
INSERT INTO `ghao_picture` VALUES ('407', '/Uploads/Docpic/2016-12-23/585cc9727b71b.jpg', '', 'e1ffaf59671d333b624a34601ab19d16', '34cf149495b2573fed98f3c15d5c8978b69c4bde', '1', '1482475890');
INSERT INTO `ghao_picture` VALUES ('408', '/Uploads/Docpic/2016-12-23/585cc98face73.jpg', '', '5b7db87e49955942e9896a1ece3e0f9d', '7e64f93640838304a380f369a90de7f17cdea06b', '1', '1482475919');
INSERT INTO `ghao_picture` VALUES ('409', '/Uploads/Docpic/2016-12-23/585cc9b089cb5.jpg', '', 'cb5df6316a487512fa682f74fcddef51', '452bf73ae1df29d49b9226b9b97e8bb3a445fb55', '1', '1482475952');
INSERT INTO `ghao_picture` VALUES ('410', '/Uploads/Docpic/2016-12-23/585cc9da3ff75.jpg', '', '72d1fa4fd7e7ee8672bfc4beb5d67443', '65cfffdef22cd527364d4ee4d20baaa5ff024b40', '1', '1482475994');
INSERT INTO `ghao_picture` VALUES ('411', '/Uploads/Docpic/2016-12-23/585cc9f01df97.jpg', '', '0cf90857422b187dc97e1ce1dae77788', '4d89a75d6d45b055abc2130ae3c3d6891119b833', '1', '1482476016');
INSERT INTO `ghao_picture` VALUES ('412', '/Uploads/Docpic/2016-12-23/585cca180a5fd.jpg', '', 'e2764de8addf94c9e6de688b8422ea67', '4807f80ae5e9492add60b9b31b708e538075ac58', '1', '1482476055');
INSERT INTO `ghao_picture` VALUES ('413', '/Uploads/Docpic/2016-12-23/585cca285fde0.jpg', '', 'a952e32761cad35b657f94543fd15ac9', '38747b41663e73711fdb921b39b9a20f6f846f6a', '1', '1482476072');
INSERT INTO `ghao_picture` VALUES ('414', '/Uploads/Docpic/2016-12-23/585cca422c93d.jpg', '', '2e765451623dde3d0f7eb19d1c4b992e', 'b0f01bfa720c9b441673136072d53dea6b31b6f0', '1', '1482476098');
INSERT INTO `ghao_picture` VALUES ('415', '/Uploads/Docpic/2016-12-23/585cca62a1453.jpg', '', '3f74e9c3895f54d8df5ac085c82f759e', 'd718fe1b5450ebc362ff63621e8308efdb8ce415', '1', '1482476130');
INSERT INTO `ghao_picture` VALUES ('416', '/Uploads/Docpic/2016-12-23/585cca874b794.jpg', '', 'dd096bbff6077bd50ac9a69a957e809e', '575cdf36d00adafc2bc60074cd6d91df2086411f', '1', '1482476167');
INSERT INTO `ghao_picture` VALUES ('417', '/Uploads/Docpic/2016-12-23/585ccaa61479b.jpg', '', 'c81fed8e0704a8c67c096be199afc52a', '3640a6bffe174f2002eef7bd4f06e35d8abb2f69', '1', '1482476198');
INSERT INTO `ghao_picture` VALUES ('418', '/Uploads/Docpic/2016-12-23/585ccac64d462.jpg', '', '342aa88f059bc710ec6d0bd68cfa4155', 'd2a52154ff3b2c505791a73a35ce0c5e18ba18de', '1', '1482476230');
INSERT INTO `ghao_picture` VALUES ('419', '/Uploads/Docpic/2016-12-23/585ccb3726653.jpg', '', '4189a9b357765a06c3bd00f7b618402e', '99f563b6474dadc5b4b0ae73ef93c6caaeb1a73d', '1', '1482476343');
INSERT INTO `ghao_picture` VALUES ('421', '/Uploads/Docpic/2016-12-23/585ccc56d91bb.jpg', '', '10bc0d435d9c1d815b905dd514f93564', '04eb41357aef4c438d64727f57962b0c0ba26b89', '1', '1482476630');
INSERT INTO `ghao_picture` VALUES ('422', '/Uploads/Docpic/2016-12-23/585ccc7535c7b.jpg', '', '27a484444d54418b5eb03249a4972172', 'c0020451030aacfdb71a6cf87e08c07c22cd3756', '1', '1482476661');
INSERT INTO `ghao_picture` VALUES ('423', '/Uploads/Docpic/2016-12-23/585ccc8c6d915.jpg', '', 'ba254c7291e95a6e95da17aa1f0a8f48', '963c979220f3f4c7f0effbd036f249042c3af37d', '1', '1482476684');
INSERT INTO `ghao_picture` VALUES ('424', '/Uploads/Docpic/2016-12-23/585cccaf062d8.jpg', '', '5e6b7e538e4d54729008409a12dddecf', '715928b3e33ba0fc7c2e8aa12b12e86a46080dfd', '1', '1482476718');
INSERT INTO `ghao_picture` VALUES ('427', '/Uploads/Docpic/2016-12-26/58607bb153f0d.jpg', '', '90c362bc2465c1fe2266cf3ffa18d688', '782dce68dee3740c2c1ace407bb2e085797daad2', '1', '1482718129');
INSERT INTO `ghao_picture` VALUES ('428', '/Uploads/Docpic/2016-12-26/58607bd64370d.jpg', '', 'ba033d4cade77d12f4ff978e3d9a5e75', 'f704cecad0f85f41aabef60f793f2e878abf8429', '1', '1482718166');
INSERT INTO `ghao_picture` VALUES ('429', '/Uploads/Docpic/2016-12-26/58607bf2f40b6.jpg', '', '3407499bd217b9114bbf1c01f32439e9', 'ad0a70ea145113b4189ed1af53c954d07c6ba43e', '1', '1482718194');
INSERT INTO `ghao_picture` VALUES ('430', '/Uploads/Docpic/2016-12-26/58607c1cdb98d.jpg', '', '3ab26df8977005fc04511f9d3acc7869', 'f25a187217bf5bca0172f0d320127e9453e4f958', '1', '1482718236');
INSERT INTO `ghao_picture` VALUES ('431', '/Uploads/Docpic/2016-12-26/58607c337ee44.jpg', '', 'd79e661c76f53c9572b81910f286788b', 'fe318bf7c63192313fb614368790072eea5d87c8', '1', '1482718259');
INSERT INTO `ghao_picture` VALUES ('432', '/Uploads/Docpic/2016-12-26/58607c6269c0c.jpg', '', '4082c965c5b768c975d1577b862207bf', '0e5b6ef67a7939cca5bef0bcce72e08e118a2317', '1', '1482718306');
INSERT INTO `ghao_picture` VALUES ('433', '/Uploads/Docpic/2016-12-26/58607c8ce33c0.jpg', '', '21b99f4ccd9dbc06994f7c9167edf290', '6953c065bc16682c0897c26d4f73b9ac343052e2', '1', '1482718348');
INSERT INTO `ghao_picture` VALUES ('434', '/Uploads/Docpic/2016-12-26/58607ca5cc52f.jpg', '', '53113500ccffbb5941d476cfbd0b6131', '8fd13e1392d556a101a5e7975ec9a748edeb07bc', '1', '1482718373');
INSERT INTO `ghao_picture` VALUES ('435', '/Uploads/Docpic/2016-12-26/58607cbb239cc.jpg', '', '1876b554f8fa7be21190c376a0362fde', '1d445804790f60cd08382f32cd72f2b7bd574108', '1', '1482718395');
INSERT INTO `ghao_picture` VALUES ('436', '/Uploads/Docpic/2016-12-26/58607cfa9b4e1.jpg', '', '34ee1fe2de29b71dbf614d65e507f3ee', '50c935b893ed066edb64dbcfe72a756741a9e01c', '1', '1482718458');
INSERT INTO `ghao_picture` VALUES ('437', '/Uploads/Docpic/2016-12-26/58607d6d6b908.jpg', '', '79154d1d4c70c6abb4dd03bf2841aae7', 'a219d4709748a799388bacf8ab0d82b155461039', '1', '1482718573');
INSERT INTO `ghao_picture` VALUES ('438', '/Uploads/Docpic/2016-12-26/586080081d276.jpg', '', 'e386968a04d51f6c5d72306e7c505012', '3689468915693ae482b6ad648b36795a8937e06a', '1', '1482719240');
INSERT INTO `ghao_picture` VALUES ('439', '/Uploads/Docpic/2016-12-26/5860808c6c3d1.jpg', '', '249229ef116a5b3a91f6f5981de149f5', 'a6f219cdb6291be019273c8513316a7ec35081ec', '1', '1482719372');
INSERT INTO `ghao_picture` VALUES ('440', '/Uploads/Docpic/2016-12-26/5860810d14b88.jpg', '', 'bc9c19fdb71de9702145d244ed770234', '9f8ee91d752364aedc037a9a1bf5200288c0cf7d', '1', '1482719501');
INSERT INTO `ghao_picture` VALUES ('441', '/Uploads/Docpic/2016-12-26/5860819fb0530.jpg', '', 'dc18b63911e311b002a91a2e7566ccc9', '0342a76d5bf4c3b4528270ed91c6fe67b8ae6d94', '1', '1482719647');
INSERT INTO `ghao_picture` VALUES ('442', '/Uploads/Docpic/2016-12-26/586081c5f32fd.jpg', '', '0facbc18dff58d5991c09ccde4f502fe', '44092d62ea0eff6ca5e5fc20ac80b0592ee83f1b', '1', '1482719685');
INSERT INTO `ghao_picture` VALUES ('443', '/Uploads/Docpic/2016-12-26/586081dc10b31.jpg', '', '201733acb5a7cbfeff51c490a676f7b7', '575f0447abec29dc07a547401d2c1a92c09bfdf0', '1', '1482719707');
INSERT INTO `ghao_picture` VALUES ('444', '/Uploads/Docpic/2016-12-26/586082147bd6e.jpg', '', '678c30c6e9feaa45bd838cb9a1c1d3ea', '9b90e6852f82c578b605d5ebccec5e99f4b1438a', '1', '1482719764');
INSERT INTO `ghao_picture` VALUES ('445', '/Uploads/Docpic/2016-12-26/5860824347a40.jpg', '', '9fbb8130da4396a91278b3e284de80e5', 'e9a2f62b80fbd43d86307874735cb16125fcd937', '1', '1482719811');
INSERT INTO `ghao_picture` VALUES ('446', '/Uploads/Docpic/2016-12-26/58608272a16b2.jpg', '', '4489af59cd26555cdfe82e7b4b8c3059', 'd308db58856a6375adcfbdabce3720e412669882', '1', '1482719858');
INSERT INTO `ghao_picture` VALUES ('447', '/Uploads/Docpic/2016-12-26/5860828ad5891.jpg', '', 'bbb05d2c157948498444616d12d45679', '81893afa1014f228d93f50b2b53d5ccdaf344b88', '1', '1482719882');
INSERT INTO `ghao_picture` VALUES ('448', '/Uploads/Docpic/2016-12-26/5860829ee76bf.jpg', '', '3f833b89e7949b0f36481420f5a61e18', 'b194c3a13680745df73caaa059a22b76efd8e098', '1', '1482719902');
INSERT INTO `ghao_picture` VALUES ('449', '/Uploads/Docpic/2016-12-26/586082b7c86a7.jpg', '', '3fbc04f9d2142dc3bf751a8648b02e23', 'dab137414cd7ffcecdd6ca56d1dcc8e1bbca3e91', '1', '1482719927');
INSERT INTO `ghao_picture` VALUES ('450', '/Uploads/Docpic/2016-12-26/586083201a584.jpg', '', '7ed11946564f39972e1eefdb8fcaad2e', '6590033444302445cae7c3f385c9abb4c097ef15', '1', '1482720032');
INSERT INTO `ghao_picture` VALUES ('451', '/Uploads/Docpic/2016-12-26/58608356c0fab.jpg', '', '9b4abc43eebbdaac97cc7ae482817575', 'd32c448a5d81e6fdd8e32b3905adf5f835f94253', '1', '1482720086');
INSERT INTO `ghao_picture` VALUES ('452', '/Uploads/Docpic/2016-12-26/586087b24a06b.jpg', '', 'ece441d21b8e56a7b553e412206ec5c7', 'a6ee06ec751330e1a4eb0b4142823102362861c7', '1', '1482721202');
INSERT INTO `ghao_picture` VALUES ('453', '/Uploads/Docpic/2016-12-26/586087e69615c.jpg', '', '737705a192be11ff0d22cb1cc9c6504f', '6e7f7871b7c6317292925a52ec61f288640cba51', '1', '1482721254');
INSERT INTO `ghao_picture` VALUES ('454', '/Uploads/Docpic/2016-12-26/58608809bde9b.jpg', '', 'c249a7373e5d2c6a7a9a4d165700302a', '6600630933da416b45a18bf2a3ce4e5f76410268', '1', '1482721289');
INSERT INTO `ghao_picture` VALUES ('455', '/Uploads/Docpic/2016-12-26/58608825117f5.jpg', '', 'e2e19481dbe047e91f49e8f4ceb0f5fc', 'f34892e16fbdbc1108ceda94c639028ac3321732', '1', '1482721317');
INSERT INTO `ghao_picture` VALUES ('456', '/Uploads/Docpic/2016-12-26/5860889d369cc.jpg', '', '411be33b041433c7f8b32a50f2b39186', 'cb06821da843e9a931593dc107981f9cf9aa69c0', '1', '1482721437');
INSERT INTO `ghao_picture` VALUES ('457', '/Uploads/Docpic/2016-12-26/58608b9466d56.jpg', '', 'cacc4d3bac9e8dabe49d1d9822720dc7', '3c7c591cb1b333eff324d5df31bcc8692314d682', '1', '1482722196');
INSERT INTO `ghao_picture` VALUES ('458', '/Uploads/Docpic/2016-12-26/58608bbd1b5df.jpg', '', 'ee23e57d64504a6b2bb3ad43c7109d67', '7996194ee7bec7953a628f56178b587546af727a', '1', '1482722236');
INSERT INTO `ghao_picture` VALUES ('459', '/Uploads/Docpic/2016-12-26/58608bd941b0f.jpg', '', 'b2a893dad200b9b93a75a77fcdfbc895', '895d2f2b3e09d3cfb7e2c13b982234e01e817c17', '1', '1482722265');
INSERT INTO `ghao_picture` VALUES ('460', '/Uploads/Docpic/2016-12-26/58608bfae09f1.jpg', '', '41df7d2020e481797d1861dfb931bc3a', 'd85a6ac7ce6b624391df23bfa918eef5ed6a19aa', '1', '1482722298');
INSERT INTO `ghao_picture` VALUES ('461', '/Uploads/Docpic/2016-12-26/58608c166367f.png', '', 'f6c237f5f549044da386fdeb456623d1', '35d06ce37095eb5c7861a1d3bd60f9e408b02fb8', '1', '1482722326');
INSERT INTO `ghao_picture` VALUES ('462', '/Uploads/Docpic/2016-12-26/58608c3f2ad6d.jpg', '', 'be8043accd300d0f5248b12a4ff2f21c', '58d5a0a8e55d595dd318adf0f25024f75b4d7071', '1', '1482722367');
INSERT INTO `ghao_picture` VALUES ('463', '/Uploads/Docpic/2016-12-26/58608c6546d52.jpg', '', '59d18b678c9f1a5e0456836efeaecbcd', '3f6c3fffee0a114bba501d28e1f76c8168c191ab', '1', '1482722405');
INSERT INTO `ghao_picture` VALUES ('464', '/Uploads/Docpic/2016-12-26/58608cd0bb71c.jpg', '', 'f5c87a926b763cec90f4bc428e9bff62', 'e58c66fee0d83f51f04e994084fb31f017db858e', '1', '1482722512');
INSERT INTO `ghao_picture` VALUES ('465', '/Uploads/Docpic/2016-12-26/58608e1988696.jpg', '', '6af318c602a9b305233fe7af9de03a3c', 'a44c31f59713a07010d8fc39f6d0c91a63e03994', '1', '1482722841');
INSERT INTO `ghao_picture` VALUES ('466', '/Uploads/Docpic/2016-12-26/58608e298f048.jpg', '', '898c0db573dff5ade5d2cceb37a6fe15', '72f326132942ad91eda86dcd53a4d2f97d8a2cff', '1', '1482722857');
INSERT INTO `ghao_picture` VALUES ('467', '/Uploads/Docpic/2016-12-26/58608e3c49162.jpg', '', '9e8ecebe758c2c66292f979d3c540bd1', 'd915e3d0f18520ceb02030297f41a3015a0f954d', '1', '1482722876');
INSERT INTO `ghao_picture` VALUES ('468', '/Uploads/Docpic/2016-12-26/58608e66504fd.jpg', '', 'bd997fb8ed71d91e924e2fb367331029', '1266b32af04449fbd423e7299c741120a623b635', '1', '1482722918');
INSERT INTO `ghao_picture` VALUES ('469', '/Uploads/Docpic/2016-12-26/58608e7cd243b.jpg', '', 'f8225bbdacf72db2ebc0467cae6029ba', '088f2d6bde545738bb5c58d0f407d593db9c017a', '1', '1482722940');
INSERT INTO `ghao_picture` VALUES ('470', '/Uploads/Docpic/2016-12-26/58608e8ccf645.jpg', '', '7c3bb6d61046fe7e4d8d976a7b01bd77', '4b65d29b354631dac216619f3ee9b5ea66ffe3b0', '1', '1482722956');
INSERT INTO `ghao_picture` VALUES ('471', '/Uploads/Docpic/2016-12-26/58608ea786de5.jpg', '', 'ae11e1c42949886b2be3d0f8c864487d', '52e911e3a600a350f2823301c64ad72f2ff24210', '1', '1482722983');
INSERT INTO `ghao_picture` VALUES ('472', '/Uploads/Docpic/2016-12-26/58608ec6257ac.jpg', '', '56bd108166d85ebc8f056ed77dec6683', '203c0866e16d0b5b49e234359ae863c5d90ca969', '1', '1482723014');
INSERT INTO `ghao_picture` VALUES ('473', '/Uploads/Docpic/2016-12-26/58608ed946617.jpg', '', 'f6afab08a7b9651a187681fcd7b1961c', 'aeefcc3730e0836fe2f31f5142a199dceb4df55e', '1', '1482723033');
INSERT INTO `ghao_picture` VALUES ('474', '/Uploads/Docpic/2016-12-26/58608eef76318.jpg', '', '3f69343174086f9744c841475b54e913', '735f55decd424a7a1e06e9b818dfd314b9dacf9d', '1', '1482723055');
INSERT INTO `ghao_picture` VALUES ('475', '/Uploads/Docpic/2016-12-26/58608f8f2cd93.jpg', '', 'fed10683c8fe672047c168ef0a3cdf84', '42175ee9c25f15e2e7e17da2974653f55c68dcac', '1', '1482723215');
INSERT INTO `ghao_picture` VALUES ('476', '/Uploads/Docpic/2016-12-26/5860afe20c263.jpg', '', '3ef702dede0c9a8f1c394b55d823a564', '7b349226bb10331cf54f3ec2d51283c312ef02c5', '1', '1482731489');
INSERT INTO `ghao_picture` VALUES ('477', '/Uploads/Docpic/2016-12-26/5860b05b27e39.jpg', '', 'ceed18e050b59798e4e804683ddfd1d2', 'cbff54a7c7ea819c8f50e178ca31c99de04349c9', '1', '1482731611');
INSERT INTO `ghao_picture` VALUES ('478', '/Uploads/Docpic/2016-12-26/5860b0b220573.jpg', '', '9fe48c253dd7c348a41a44bd827cde2e', '9da87bde0e0012cad75a267aecfa9e9956fc9b1e', '1', '1482731698');
INSERT INTO `ghao_picture` VALUES ('479', '/Uploads/Docpic/2016-12-26/5860b149551d5.jpg', '', '243d39b5c1167655e0f977e313c3a8a9', '10c608f04b4f41af2952d1843cf8fe0542f940ea', '1', '1482731849');
INSERT INTO `ghao_picture` VALUES ('480', '/Uploads/Docpic/2016-12-26/5860b15f77a6f.jpg', '', 'ca758f293fffeb7d3ca7e4c25869d1df', '1101254ba61439ccda014ab9d320ee175db84f93', '1', '1482731871');
INSERT INTO `ghao_picture` VALUES ('482', '/Uploads/Docpic/2016-12-26/5860b19ca8370.jpg', '', '7ecb178a512b97ffb3b0e88b74ff54d1', '0fe7154bd4755079b181d54e2e3051fb81a9df1e', '1', '1482731932');
INSERT INTO `ghao_picture` VALUES ('483', '/Uploads/Docpic/2016-12-26/5860b1af7317d.jpg', '', '86d229fbb2a3594bf7d11bf73b8e6099', '507e84d4883443c0e420726fbdd43a562183def5', '1', '1482731951');
INSERT INTO `ghao_picture` VALUES ('484', '/Uploads/Docpic/2016-12-26/5860b1e46e532.jpg', '', '52222b48122ec1060947522d012ea6d4', 'ddb8bd80cc7acfac4883a3b1de466a6103daff67', '1', '1482732004');
INSERT INTO `ghao_picture` VALUES ('485', '/Uploads/Docpic/2016-12-26/5860b1f4dac6c.jpg', '', '726633673167db4b2eb65c5253aa07f0', 'cdbe1009a649169e08ffe34d779a2246fc1a94d6', '1', '1482732020');
INSERT INTO `ghao_picture` VALUES ('486', '/Uploads/Docpic/2016-12-26/5860b37e63742.jpg', '', '52d1aee4f39a5b1082e92d4de1c8f528', '5f14143998382aa74ecf274d561379b87778e033', '1', '1482732414');
INSERT INTO `ghao_picture` VALUES ('487', '/Uploads/Docpic/2016-12-26/5860b3a89c10b.jpg', '', '4cf72ec88c2e8613776a21ed2aa8b0a2', '8f60c45f6316b0820b6598c0ebe9033603d95457', '1', '1482732456');
INSERT INTO `ghao_picture` VALUES ('488', '/Uploads/Docpic/2016-12-26/5860b3c9720f7.jpg', '', 'abd1c20c6b0e39ace449e9b98ca83cba', 'c620a585248bcb36dbf2ae02dde7be0289cb7259', '1', '1482732489');
INSERT INTO `ghao_picture` VALUES ('489', '/Uploads/Docpic/2016-12-26/5860b3e3ee51d.jpg', '', 'cebd9eb1f3b0a704e481f797759fc0d7', 'd0ef7d315cdc3807133896443f158e9f26118909', '1', '1482732515');
INSERT INTO `ghao_picture` VALUES ('490', '/Uploads/Docpic/2016-12-26/5860b40f7a5e3.jpg', '', '428f20b58aed5c79ae8b1fa975b823cb', 'ddc1ff1a9ab615f5b7920980a6e93f250070cb93', '1', '1482732559');
INSERT INTO `ghao_picture` VALUES ('491', '/Uploads/Docpic/2016-12-26/5860b428e410f.jpg', '', 'd1d118b54ba7fd75c1dc8a2658a180f1', '2fe8c21341886590b954e503d32f2388e9c9b944', '1', '1482732584');
INSERT INTO `ghao_picture` VALUES ('492', '/Uploads/Docpic/2016-12-26/5860b4420014c.jpg', '', '92469834f0ebf1bf1891c9a82a696a94', 'b4de2c10b9ee73d2b360cb819c3893b2a338c571', '1', '1482732609');
INSERT INTO `ghao_picture` VALUES ('493', '/Uploads/Docpic/2016-12-26/5860b45f96c2c.jpg', '', '20fe91d0bd339ce45984feed73deb7b8', 'afcf7e8bc250046d0dca48c6551ddbc0ece9100b', '1', '1482732639');
INSERT INTO `ghao_picture` VALUES ('494', '/Uploads/Docpic/2016-12-26/5860b48857a1c.jpg', '', '504d72bb07ed3dff7f6b35951f81901d', '56cfe2ec580bf62495f92bc80c64a9f3136ea22a', '1', '1482732680');
INSERT INTO `ghao_picture` VALUES ('495', '/Uploads/Docpic/2016-12-26/5860b4e448bc1.jpg', '', '259725ac4f590a84f499005fe33225a5', '8813efe08fb2d300de7975cacfd5090eb5f8d9fc', '1', '1482732772');
INSERT INTO `ghao_picture` VALUES ('496', '/Uploads/Docpic/2016-12-26/5860b506a4691.jpg', '', '0a5dacbd113328210e5073c276200a50', '1438fc6baa6b050e4886674c28b9c5bc138d8a04', '1', '1482732806');
INSERT INTO `ghao_picture` VALUES ('497', '/Uploads/Docpic/2016-12-26/5860b53feebf5.jpg', '', '7d641119f6bfe2afdd293409207e32d0', '069d4fd5991eef1ca3525ceda3f27c118d1ad03e', '1', '1482732863');
INSERT INTO `ghao_picture` VALUES ('498', '/Uploads/Docpic/2016-12-26/5860b55d9019b.jpg', '', '14b9bfa326fba73adb488fc43528cb7c', 'a17d292bb6b47229f84677e919a73010732582bd', '1', '1482732893');
INSERT INTO `ghao_picture` VALUES ('499', '/Uploads/Docpic/2016-12-26/5860b582067aa.jpg', '', '522e5fb2b6606ac4892fd55746939dfa', 'eb1ffa84186dcb4057f658c8de14f28de38d9c75', '1', '1482732929');
INSERT INTO `ghao_picture` VALUES ('500', '/Uploads/Docpic/2016-12-26/5860b59a40e5f.jpg', '', 'f3b4de5f073db03eaa85d0ea3c14f29e', '76a0aa1d9ff884abf837f32a1ee02e9e76131b73', '1', '1482732954');
INSERT INTO `ghao_picture` VALUES ('501', '/Uploads/Docpic/2016-12-26/5860b5bc63e92.jpg', '', '83cb59c9280aaada600cc18224ce5b15', 'c57a401716b26eb522f77bf0e0e44c03ad694ef7', '1', '1482732988');
INSERT INTO `ghao_picture` VALUES ('502', '/Uploads/Docpic/2016-12-26/5860b622a0211.jpg', '', 'd0ad8d962c5ab09631e407d82cb662bf', '18e3eca4ac9f42e33e5d7274c0a6090cd1f48b04', '1', '1482733090');
INSERT INTO `ghao_picture` VALUES ('503', '/Uploads/Docpic/2016-12-26/5860b6d4abfaf.jpg', '', 'a76e6d9466f23e8f3fe7c1df3fd9c4c9', '124135afd02f71a23638780e2a729c1ecf10ce0c', '1', '1482733268');
INSERT INTO `ghao_picture` VALUES ('504', '/Uploads/Docpic/2016-12-26/5860b6e9a3744.jpg', '', '851bddeb553bfb92415897f3351460b0', 'd1ee0e3965a17ccb62f4f951e31739ae9158ddbb', '1', '1482733289');
INSERT INTO `ghao_picture` VALUES ('505', '/Uploads/Docpic/2016-12-26/5860b70ac9818.jpg', '', '317c09e4da188f84b2cd7ac29d9b0315', '16878395e28716d00ee21710dc5ec50e2e342eb2', '1', '1482733322');
INSERT INTO `ghao_picture` VALUES ('506', '/Uploads/Docpic/2016-12-26/5860b72950cda.jpg', '', '902ea5eaf77360a48229d1669abe2215', 'db92c32ca6bdb6e3242b77a4a7729db7192121af', '1', '1482733353');
INSERT INTO `ghao_picture` VALUES ('507', '/Uploads/Docpic/2016-12-26/5860b75ccea70.jpg', '', '4ded553d13d8c51ec985949633f73ad6', '495ab75e66ad94946fb97bd7fd0262f9b72ac886', '1', '1482733404');
INSERT INTO `ghao_picture` VALUES ('508', '/Uploads/Docpic/2016-12-26/5860b76c07942.jpg', '', '5c769f93b33b2634da5c1d0986eaac7c', '2f6c81276d1486f0c92e3673e3e3451e142fe64f', '1', '1482733419');
INSERT INTO `ghao_picture` VALUES ('509', '/Uploads/Docpic/2016-12-26/5860b786445ba.jpg', '', '0028795eb024fcdf144814260bdf54be', '7b2e30611bfd15674312a39cb6eeb4954924aeee', '1', '1482733446');
INSERT INTO `ghao_picture` VALUES ('510', '/Uploads/Docpic/2016-12-26/5860b7d6d7662.jpg', '', '509fcf700ee6261ee737623ab5942fcf', '4f3f6a46958d63b5564faf17845ad4507475b1c4', '1', '1482733526');
INSERT INTO `ghao_picture` VALUES ('511', '/Uploads/Docpic/2016-12-26/5860b7efad22b.jpg', '', '9dc6c9df992d46efca88b224f951cb81', '14efaad3eaa82fae6a6a02a683c448953321c1a4', '1', '1482733551');
INSERT INTO `ghao_picture` VALUES ('512', '/Uploads/Docpic/2016-12-26/5860b802eeac8.jpg', '', 'ecb697b51aaeeb60077de5bc5227441c', '65b9878cd66c11cc674e6929f689b6a8c7a1bfe7', '1', '1482733570');
INSERT INTO `ghao_picture` VALUES ('513', '/Uploads/Docpic/2016-12-26/5860b818f1bf9.jpg', '', '8097eb8ec2219b854e3284dcfb6bed80', 'f602151c3761e5b882163883154119923cf7fe76', '1', '1482733592');
INSERT INTO `ghao_picture` VALUES ('514', '/Uploads/Docpic/2016-12-26/5860b82dd2483.jpg', '', '4f408fbc74d779ce5f4c9170d7d6e990', '02d7debd13327a8c2b02dc6dff23924c1ca51589', '1', '1482733613');
INSERT INTO `ghao_picture` VALUES ('515', '/Uploads/Docpic/2016-12-26/5860b83e61e60.jpg', '', '0a1121f3dfbc4761a40c2d9124b417d1', '5cbcf7de5e7af183d3cc37c6fbb27073cfb5b4c2', '1', '1482733630');
INSERT INTO `ghao_picture` VALUES ('516', '/Uploads/Docpic/2016-12-31/586718878002c.png', '', 'de9992cdae401642ad2c5e68ebebecf6', 'e1a9b16b90be6d10356fe134a99eb6c125d8cd3d', '1', '1483151495');
INSERT INTO `ghao_picture` VALUES ('517', '/Uploads/Docpic/2016-12-31/586718a9946fd.png', '', 'efa1e6a37c08ab7c1d77e202b4a376f2', '2f7cf1d8a23e2508ea22831985c139015a529c97', '1', '1483151529');
INSERT INTO `ghao_picture` VALUES ('518', '/Uploads/Docpic/2016-12-31/586718e665b60.png', '', 'd93bdc45a6d388f6bb3571ac9a9fa621', 'f64599f2093bc908d9ef6711399e5a70124ac9a9', '1', '1483151590');
INSERT INTO `ghao_picture` VALUES ('519', '/Uploads/Docpic/2016-12-31/58671bd10a74c.JPG', '', '3f0e1e52c2ad3ea0a8cd7b57266a279b', 'e9349da8c8af02df6876c051781f1ab17f05d1cf', '1', '1483152336');
INSERT INTO `ghao_picture` VALUES ('520', '/Uploads/Docpic/2016-12-31/58671c16f0618.png', '', '1f98ec1f73733cbbbed5e92e0222474b', 'eaed70eaab6bc692622c19abde2c2bfd2d1c1f15', '1', '1483152406');
INSERT INTO `ghao_picture` VALUES ('521', '/Uploads/Docpic/2016-12-31/58671c3e86848.png', '', 'da7f071025235d133dc26e8c35e18693', 'fcf115a0bff106d0d53d2117abdfad000a4e476c', '1', '1483152446');
INSERT INTO `ghao_picture` VALUES ('522', '/Uploads/Docpic/2016-12-31/58671c8ca9ecc.png', '', '73e83319332bf6507451365ef30d810e', 'ff76095937dd46d6329a446a8d5bed17a4fbf295', '1', '1483152524');
INSERT INTO `ghao_picture` VALUES ('523', '/Uploads/Docpic/2016-12-31/58671cafef51b.png', '', '8b4e40477ca4ce4d26a25d52d8076c10', 'ec5ecd93ebc8cd6793fc8a54d580f42a8dd8b397', '1', '1483152559');
INSERT INTO `ghao_picture` VALUES ('524', '/Uploads/Docpic/2016-12-31/58671cdbaf02e.png', '', 'd7580e3744332c976c29c1aa53a403f5', '59787772b75e10f2fd7826317e353bd7ca48adb7', '1', '1483152603');
INSERT INTO `ghao_picture` VALUES ('525', '/Uploads/Docpic/2016-12-31/58671cf7b1215.png', '', '79fd58516cfd65ac24eeb3d38c57c4ec', '18ac15695da43fad34b3d8ba76a9f1c91c99e48d', '1', '1483152631');
INSERT INTO `ghao_picture` VALUES ('526', '/Uploads/Docpic/2016-12-31/58671d0ce15fc.png', '', 'c605c357b4ce778a5f7d02c201bcbc8f', '888e7b0af824c6a164159fcb2bd742e3d0641c55', '1', '1483152652');
INSERT INTO `ghao_picture` VALUES ('527', '/Uploads/Docpic/2016-12-31/58671d2b71796.png', '', 'f4785e19bfc4733dacdc161fc190a88c', '4253e4419a038968b49fbc218134f5d37e3096c0', '1', '1483152683');
INSERT INTO `ghao_picture` VALUES ('528', '/Uploads/Docpic/2016-12-31/58671f71411cb.JPG', '', 'fd34189ba1502e192b5648cd05691ac3', 'def5ea01fec4a9c57919add8d15c66b6e66da360', '1', '1483153265');
INSERT INTO `ghao_picture` VALUES ('529', '/Uploads/Docpic/2016-12-31/58671f9d37306.JPG', '', 'd6534ea28537f9a715572017119685ff', '668675d11097d7d6572b7369f6284fa269ed4caf', '1', '1483153309');
INSERT INTO `ghao_picture` VALUES ('530', '/Uploads/Docpic/2016-12-31/58671fc3d84c5.png', '', '01555d36e1c98275a1e156a5d3ae6745', '978947dd690dbf4fbc948c4857fbf2d7dc1bfb5f', '1', '1483153347');
INSERT INTO `ghao_picture` VALUES ('531', '/Uploads/Docpic/2016-12-31/586725c3b26e1.png', '', '0e9f70fd9004829bdde20764674d7fa3', '8bd2f741e7bb64c5baf390238ff7e2c90785bf67', '1', '1483154883');
INSERT INTO `ghao_picture` VALUES ('532', '/Uploads/Docpic/2016-12-31/586725d7bd61d.png', '', 'bd902778798db30c9b8065928f1738ce', '428fcb22eb9b29c1dd29b5ecc0653c1109ff5bcb', '1', '1483154903');
INSERT INTO `ghao_picture` VALUES ('533', '/Uploads/Docpic/2016-12-31/586726075b828.JPG', '', '8d7e58f8b20418e44f60353cd12db8ab', 'b333a8d3b169a2eb4e12d73cb629f75e03177f00', '1', '1483154951');
INSERT INTO `ghao_picture` VALUES ('534', '/Uploads/Docpic/2016-12-31/5867263508df6.png', '', '459599b6dbae01af63b3db9dac396618', 'd50580e90751f36ad0bd9e7484f1ae9517f076b3', '1', '1483154996');
INSERT INTO `ghao_picture` VALUES ('535', '/Uploads/Docpic/2016-12-31/5867268f93767.JPG', '', '2f7097b66074740337fa29ee56b314d7', 'd5c6b1048b88780212cf77ba94a9eeba079170c2', '1', '1483155087');
INSERT INTO `ghao_picture` VALUES ('536', '/Uploads/Docpic/2016-12-31/586726c3e498d.png', '', 'bdf7ed5b4453e400533a1c5bac450755', '23b74a4171fbd86570d8d624e6bef0d988c7d204', '1', '1483155139');
INSERT INTO `ghao_picture` VALUES ('537', '/Uploads/Docpic/2016-12-31/586726d5ecf92.png', '', '9903b9d0c4ed51b2533c62fd06fa3d38', '561e1553831cbfda3ef19b1adef95c78a0faa350', '1', '1483155157');
INSERT INTO `ghao_picture` VALUES ('538', '/Uploads/Docpic/2016-12-31/586726e53b929.png', '', 'efbc5175becab01c50547f7611edba9b', '33d56ff73215c9c899bc71b08f0c47597a00bbc9', '1', '1483155173');
INSERT INTO `ghao_picture` VALUES ('539', '/Uploads/Docpic/2016-12-31/5867270b11f49.png', '', '109333aaba763f2bef04c6b4528e2804', '7958ab61ba30e1be7546ec87cb694789e28b2c0d', '1', '1483155211');
INSERT INTO `ghao_picture` VALUES ('540', '/Uploads/Docpic/2016-12-31/5867271c41332.png', '', 'e9feecd58e9652f81fad882b8f90ce82', 'df37aa687587156c9125e248a8a4409b7e4ceafb', '1', '1483155228');
INSERT INTO `ghao_picture` VALUES ('541', '/Uploads/Docpic/2016-12-31/58672735e422d.png', '', 'ca95ce7bb523e37ef25679125c271672', '2e02603c36e7a864c205d4bf4414cd771f057327', '1', '1483155253');
INSERT INTO `ghao_picture` VALUES ('542', '/Uploads/Docpic/2016-12-31/5867274693c5b.png', '', 'ead56da0aba7060c914c68da68976443', 'b79131e9a1982519984b79449854cb777e7f47fc', '1', '1483155270');
INSERT INTO `ghao_picture` VALUES ('543', '/Uploads/Docpic/2016-12-31/586727762a1c0.JPG', '', '41dfa78a8c8fd116978aebfe58d3f10e', '1d1b3e938aa066ae661d39b84007fa6b7e2ed124', '1', '1483155318');
INSERT INTO `ghao_picture` VALUES ('544', '/Uploads/Docpic/2016-12-31/58672798cf607.png', '', 'e78f23e33714f5c5d7bf5c65a12f7ba8', '131e40348d9ca10ec177e38ede08e7075d1652df', '1', '1483155352');
INSERT INTO `ghao_picture` VALUES ('545', '/Uploads/Docpic/2016-12-31/586727acc726b.png', '', '70857c4200c7c3d5d51eb27c1d6ecf9c', '1ffea6ae14a647aac21249f4b9e02e9f7268f372', '1', '1483155372');
INSERT INTO `ghao_picture` VALUES ('546', '/Uploads/Docpic/2016-12-31/586727e085d97.JPG', '', 'e144c1fa76b141245278af09d8b292bf', 'a2e5e07b5595de81418da8194966158e3dec9e85', '1', '1483155424');
INSERT INTO `ghao_picture` VALUES ('547', '/Uploads/Docpic/2016-12-31/58672802c4bbe.png', '', '8337ff13fdec6fa5d6fb33bd7b4e6a8d', '5a4d739f4e15bd53c2808716ed1495c72de65618', '1', '1483155458');
INSERT INTO `ghao_picture` VALUES ('548', '/Uploads/Docpic/2016-12-31/5867281481691.png', '', 'f48b41fce6f10267533027eb9e6d4fd7', '426a738a55c6398baaf06b017ed7a066af24dc6a', '1', '1483155476');
INSERT INTO `ghao_picture` VALUES ('549', '/Uploads/Docpic/2016-12-31/58672827d20f4.png', '', '96e7c5bf8c6d6a8b2061837c7d00a3aa', '391892f59f9ac48afdfb7014bc06093744e8fa3a', '1', '1483155495');
INSERT INTO `ghao_picture` VALUES ('550', '/Uploads/Docpic/2016-12-31/5867283c03e10.png', '', '8c06a168a28dae9446961bad67b33f0a', 'efe1d7b1131edd649a2156d36d4464f67d4af949', '1', '1483155515');
INSERT INTO `ghao_picture` VALUES ('551', '/Uploads/Docpic/2016-12-31/5867285f7a046.JPG', '', 'a241ffa0d0835d8e1973efcedf10b9d1', '6c1000f53cfbff73deeaf8f4dba95a5283039dfd', '1', '1483155551');
INSERT INTO `ghao_picture` VALUES ('552', '/Uploads/Docpic/2016-12-31/5867287b7fb8a.png', '', 'fa3d190b3a16cfa96e7c7c7be5948801', 'ef0464bc9d24ea264acaa4ce7e7b975273e29592', '1', '1483155579');
INSERT INTO `ghao_picture` VALUES ('553', '/Uploads/Docpic/2016-12-31/5867288e8a3c7.png', '', 'd702bd16b8a4e7c2be09a2d28853ca2e', '0e76ff61816c78a885eb6b3a76d6a87713b6dcb8', '1', '1483155598');
INSERT INTO `ghao_picture` VALUES ('554', '/Uploads/Docpic/2016-12-31/586728a1a6cfd.png', '', '542aba2ac83ba5e68f4aca9d74199421', 'a8f60850ab7f9dba37c480d3b45ae4f89d10d250', '1', '1483155617');
INSERT INTO `ghao_picture` VALUES ('555', '/Uploads/Docpic/2016-12-31/586728c144b27.jpg', '', '972b800ddfbc1f962e2b5583bfc2a443', '3122489c15906e5aaebc1fe5dfae7f8d3c012a57', '1', '1483155649');
INSERT INTO `ghao_picture` VALUES ('556', '/Uploads/Docpic/2016-12-31/586728ea45fd5.png', '', '15ac235daa29ea93845ccefc50acb218', '0fe9619dec26d75ae254653415a8506a5c9b4172', '1', '1483155690');
INSERT INTO `ghao_picture` VALUES ('557', '/Uploads/Docpic/2016-12-31/586729081c374.png', '', '45595d57d770f42830d027d5cc0f1449', 'd4f1d55017edd0ce9b7972454c34b78545c4928e', '1', '1483155720');
INSERT INTO `ghao_picture` VALUES ('558', '/Uploads/Docpic/2016-12-31/5867292614170.png', '', '9fb304543723d3c7df5dfe45ce7b014d', 'c2fe421d002d5214bdb714196a6413f550e588f6', '1', '1483155750');
INSERT INTO `ghao_picture` VALUES ('559', '/Uploads/Docpic/2016-12-31/5867293feb80d.JPG', '', '9751daa98654585fba22784bd4fb467a', '020fe13dcb92a4df07945727e9b48664850aeea6', '1', '1483155775');
INSERT INTO `ghao_picture` VALUES ('560', '/Uploads/Docpic/2016-12-31/586729910cc41.JPG', '', '7c527328bf9f517c2ebfef9efded8d25', '6c3b7c6022d0d78ba9feea562d5fc9a40518c173', '1', '1483155856');
INSERT INTO `ghao_picture` VALUES ('561', '/Uploads/Docpic/2016-12-31/58672999bac5f.png', '', '6ef5d7accd083f60778a4f37fcdb558c', 'fa9d4f8ee2c16a68e9ace0bdbab35b5187ed5ac3', '1', '1483155865');
INSERT INTO `ghao_picture` VALUES ('562', '/Uploads/Docpic/2016-12-31/586729b0e4c9e.png', '', '325c799d6cf3085e25aef1283cf4ecad', '3b6443ffccae622360372d37f89ce7d5e0549f67', '1', '1483155888');
INSERT INTO `ghao_picture` VALUES ('563', '/Uploads/Docpic/2016-12-31/586729d42708b.png', '', '068729b551faa5f59621f1542d65ef53', '59f33f36107b6dbf815f8136acc4a0b6cca49c60', '1', '1483155924');
INSERT INTO `ghao_picture` VALUES ('564', '/Uploads/Docpic/2016-12-31/586729eb2a969.png', '', '77bde39caf2c9cc5d8a56b5ec62dbafe', 'ce8e29e4b1da039fcdef49ceeb2b66e8f2515735', '1', '1483155947');
INSERT INTO `ghao_picture` VALUES ('565', '/Uploads/Docpic/2016-12-31/58672a023c361.png', '', 'f4ffede45ef00fd6bef0da0878a8e35d', '0cc773594b94432dc634e4751add103a155bb2fb', '1', '1483155970');
INSERT INTO `ghao_picture` VALUES ('566', '/Uploads/Docpic/2016-12-31/58672a6868ac0.JPG', '', '175a2139f04b1ac463b0cf9c349617af', '7e79f37ba6491f96dfe316601e7ad87ff7db3b33', '1', '1483156072');
INSERT INTO `ghao_picture` VALUES ('567', '/Uploads/Docpic/2016-12-31/58672bc3ce58e.png', '', '00e6599e065222fab52e2d28e5ce06e9', '7c972662e2af79b67c8e1bb253236d4436a5be14', '1', '1483156419');
INSERT INTO `ghao_picture` VALUES ('568', '/Uploads/Docpic/2016-12-31/58672bee32a4a.png', '', 'ab98a403f598b57fbf8fcc69a0865dbf', '0afa02e64d7ee8644abf012e85c65b3c9aafe242', '1', '1483156462');
INSERT INTO `ghao_picture` VALUES ('569', '/Uploads/Docpic/2016-12-31/58672c1179d16.JPG', '', '81fa242723d0e2555664bc1f4e555642', '6f3d0ebe4c51752fb823d14cbc169012deba729c', '1', '1483156497');
INSERT INTO `ghao_picture` VALUES ('570', '/Uploads/Docpic/2016-12-31/58672c351970a.png', '', '138e8530e8e962ecb3345f006955dc93', '6dfc8036e0e65d482b3f81cc2d85585bb141b4d8', '1', '1483156533');
INSERT INTO `ghao_picture` VALUES ('571', '/Uploads/Docpic/2016-12-31/58672c4ac007c.png', '', '80b7b26b108678569064b2e27cfc112e', '48cf536f99da2fd90ffac3911fd232fdcc304e85', '1', '1483156554');
INSERT INTO `ghao_picture` VALUES ('572', '/Uploads/Docpic/2016-12-31/58672c69ad022.JPG', '', 'af3b8225669f941d39a78afe957cd165', '24e012a57113d6f97b706cb098ce3964b9746260', '1', '1483156585');
INSERT INTO `ghao_picture` VALUES ('573', '/Uploads/Docpic/2016-12-31/586757cec6301.JPG', '', 'd084b5462ec82c176ca136534adb267e', '1894a71e36d8d844c808becde0fc198fa72b4730', '1', '1483167694');
INSERT INTO `ghao_picture` VALUES ('574', '/Uploads/Docpic/2017-01-10/5874501026d8c.png', '', 'afda46d13af8af2aca9ad68eb6ba8448', '145ab48e35bd1f0af52d3d7de24b2794bd30144d', '1', '1484017680');
INSERT INTO `ghao_picture` VALUES ('575', '/Uploads/Docpic/2017-01-12/5876d9c6b4280.JPG', '', 'dc2981ed53ff08efb41f4ef6035e5025', '9346282ff9f1b5aeb9c4d5bb5f2ce43bd17b46f9', '1', '1484184006');
INSERT INTO `ghao_picture` VALUES ('576', '/Uploads/Docpic/2017-01-12/5876da08a782d.JPG', '', '697c98732cd86e951f8ad8d251ec006d', '0c3c9faef14404b46d8efb1a9d57b027ba5db573', '1', '1484184072');
INSERT INTO `ghao_picture` VALUES ('577', '/Uploads/Docpic/2017-01-12/5876e1d50fe72.JPG', '', '30752d1262544320d4e1a04ec363acd9', '7c552ff99273232082d6f53088a4ad77a1492b43', '1', '1484186069');
INSERT INTO `ghao_picture` VALUES ('578', '/Uploads/Docpic/2017-01-12/5876e23a55f1f.JPG', '', '559bd3f77f641d51e8728061af08c1c5', '2c6806d131f9879e1c78ecb0e57a7016fe96592f', '1', '1484186170');
INSERT INTO `ghao_picture` VALUES ('579', '/Uploads/Docpic/2017-01-12/5876e262f189e.JPG', '', '79eeaa551ef1a71c65815b46d2450266', '255dc0de10166e4f1163dde58068d0e8297eb9de', '1', '1484186210');
INSERT INTO `ghao_picture` VALUES ('580', '/Uploads/Docpic/2017-01-12/5876e28f56f88.JPG', '', '6fd2a2d8b4187f976891aec6ee7aa103', '329cae7c33ddaef31231c1ad7553b8b1a862aac1', '1', '1484186255');
INSERT INTO `ghao_picture` VALUES ('581', '/Uploads/Docpic/2017-01-12/5876e2a1bdd7a.JPG', '', 'db72a8a3b6f1aa746477681d83c8f95e', '2334187c45c3f83f24ee643f54b4f1d0b96ceff1', '1', '1484186273');
INSERT INTO `ghao_picture` VALUES ('582', '/Uploads/Docpic/2017-01-12/5876e2b5299bc.JPG', '', 'c00d74c382d9bcdd4140522f1f8f2024', 'be73f45ac556f57a3381e66ebc8430110f4e0365', '1', '1484186293');
INSERT INTO `ghao_picture` VALUES ('583', '/Uploads/Docpic/2017-01-12/5876e2c6bfc98.JPG', '', 'febcc48cdd4842f6fa1c08366956f104', 'c764970f7b2b510fc4d9c468dfe8111ec8384c24', '1', '1484186310');
INSERT INTO `ghao_picture` VALUES ('584', '/Uploads/Docpic/2017-01-12/5876e2fcd1075.JPG', '', '2e571def1efdce460be6ea3850d10675', 'b4fa37ba8354873cf01f329d23bb6fd04f2a50f5', '1', '1484186364');
INSERT INTO `ghao_picture` VALUES ('585', '/Uploads/Docpic/2017-01-12/5876e33feda93.JPG', '', 'd6bff4ef57ced4cc5dffed055fd6b418', 'b3768868392149a90dc8eebec39b0bebcc7431e2', '1', '1484186431');
INSERT INTO `ghao_picture` VALUES ('586', '/Uploads/Docpic/2017-01-12/5876e3ba057a6.JPG', '', '9c9a5c675e44e9b1e931f113d46647d0', '8f81c05e6f814db0ea49683a14abd8cc1114cf2e', '1', '1484186553');
INSERT INTO `ghao_picture` VALUES ('587', '/Uploads/Docpic/2017-01-12/5876e4412c351.JPG', '', '10fefc354cdac7b6bd5b4d05ea0596b8', '3ff37d7e812b3f7bfd77bc8e1bc6fe59cc00a3e4', '1', '1484186689');
INSERT INTO `ghao_picture` VALUES ('588', '/Uploads/Docpic/2017-01-12/5876e4605bbd4.JPG', '', '53571553622368430d84040298e5a525', '34dd36f9e86d183bf9293b9446a646948a34eee2', '1', '1484186720');
INSERT INTO `ghao_picture` VALUES ('589', '/Uploads/Docpic/2017-01-12/5876e4763e40a.JPG', '', 'f00a2f4d0513f912558ad0d91468af50', '126967e21e0ac11416015d949df2a2db2420a4b1', '1', '1484186742');
INSERT INTO `ghao_picture` VALUES ('590', '/Uploads/Docpic/2017-01-12/5876e493c002b.JPG', '', '16f5c32a73dbe65ca9678532bd07096e', 'ed7d0467a7852f465a307de36dff00a119313fdb', '1', '1484186771');
INSERT INTO `ghao_picture` VALUES ('591', '/Uploads/Docpic/2017-01-12/5876e4a4e5e4a.JPG', '', 'd38d52eb74beaddb8fe3b5abafa6d8ad', '976ceeb5ac7dd2f37fa1f84d1b84e21891e132aa', '1', '1484186788');
INSERT INTO `ghao_picture` VALUES ('592', '/Uploads/Docpic/2017-01-12/5876e4bfec4e9.JPG', '', '77fb50f0ab1fca065f5bc801926ebee3', '097db8e4a5918d647676d49466dbe3fc5451fc0e', '1', '1484186815');
INSERT INTO `ghao_picture` VALUES ('593', '/Uploads/Docpic/2017-01-12/5876e4de8d49f.JPG', '', 'd00941f28ac4521f0e164b3d51725652', '16ba63ec294cdf97aca13c62955751cb4f14159c', '1', '1484186846');
INSERT INTO `ghao_picture` VALUES ('594', '/Uploads/Docpic/2017-01-12/5876e4ee37fd8.JPG', '', '75d95319fb65f38060e3e414d79b9682', 'baf0c3c1223d4d52e9fa0da04271babfe7e3d650', '1', '1484186862');
INSERT INTO `ghao_picture` VALUES ('595', '/Uploads/Docpic/2017-01-12/5876e4fdb8158.JPG', '', 'eb73bff66705f721e570a228bbe07ee6', 'aea00db7b3a79ce4bb49b539b4ff10d2952a3017', '1', '1484186877');
INSERT INTO `ghao_picture` VALUES ('596', '/Uploads/Docpic/2017-01-12/5876e5167ad3d.JPG', '', 'd799cb21dbc36be1402272004ac31ec2', '8630ba421d423988850e5c2a05ca20e0b8c7edd4', '1', '1484186902');
INSERT INTO `ghao_picture` VALUES ('597', '/Uploads/Docpic/2017-01-12/5876e531db71e.JPG', '', '9114159355d584a6f25220c70e1b4e44', '0fc26d03f45551d5eb02680b1dcc802c7097eead', '1', '1484186929');
INSERT INTO `ghao_picture` VALUES ('598', '/Uploads/Docpic/2017-01-12/5876e54749600.JPG', '', 'f8754d73335e9d8083e010ce9f829510', '087e130c5e55c2d65c2b47dea065ccff6b794042', '1', '1484186951');
INSERT INTO `ghao_picture` VALUES ('599', '/Uploads/Docpic/2017-01-12/5876e556b64e0.JPG', '', 'b59816b2b23fb9a4bb63c4ed891bdbf0', '619bbb732da12358f9438ba315aec3987d0deb96', '1', '1484186966');
INSERT INTO `ghao_picture` VALUES ('600', '/Uploads/Docpic/2017-01-12/5876e573ae8dc.jpg', '', '7b31a5600cee35fe60c4c5f6f89a2e1d', 'ae317741bd32cd5f304cd2dd2072092511d28082', '1', '1484186995');
INSERT INTO `ghao_picture` VALUES ('601', '/Uploads/Docpic/2017-01-12/5876e586b6e88.JPG', '', 'f7e6ff820c0537b26eadfa3d69ccffaf', '53ed27520b5815f103d3f90347d74c931343dbf2', '1', '1484187014');
INSERT INTO `ghao_picture` VALUES ('602', '/Uploads/Docpic/2017-01-17/587d6a3665867.JPG', '', '9260c6c19c30042d4d8b719ccf7809de', '93cb6c1b4fd4c6439dbedcb439a59167187e9f60', '1', '1484614198');
INSERT INTO `ghao_picture` VALUES ('603', '/Uploads/Docpic/2017-01-17/587d7b3be4ba1.jpg', '', '0a7cf7d640608cf8cbfb9629d9bafdf8', 'a1be886fbf8b817f83359c1e853b297094d5c73c', '1', '1484618555');
INSERT INTO `ghao_picture` VALUES ('604', '/Uploads/Docpic/2017-01-17/587daa75dec75.JPG', '', 'd8bf96f269d162ddd566125858bbe58c', '1ba9254313bb0598b002bc7a864ea5094e270cc1', '1', '1484630645');
INSERT INTO `ghao_picture` VALUES ('605', '/Uploads/Docpic/2017-01-17/587dab8b730fe.jpg', '', '06f29313d059f7c5b043e9802f33694c', '2f70c8f9b54e758101322e3684feba70e8ee8cf8', '1', '1484630923');
INSERT INTO `ghao_picture` VALUES ('606', '/Uploads/Docpic/2017-01-17/587dad116c1ab.jpg', '', '2fb2e9c885c4b210209b4c55cc2ab1c2', '627ca501a9acf4dab73e90d3b4ab9a651fbc6634', '1', '1484631313');
INSERT INTO `ghao_picture` VALUES ('607', '/Uploads/Docpic/2017-01-19/5880021b4973f.JPG', '', 'fb20bf19fd8cb921a6fe5602a8b80d0f', '5ba5d6ae02e6697404aea9122230bb35684bc843', '1', '1484784155');
INSERT INTO `ghao_picture` VALUES ('608', '/Uploads/Docpic/2017-01-19/58800870abe8a.gif', '', '88e036f720d95fe8e089a380c21e6d4e', '5c69a70e2b0de3698aa94e43b37d5c95070873e3', '1', '1484785776');
INSERT INTO `ghao_picture` VALUES ('609', '/Uploads/Docpic/2017-01-19/58800886bf4b4.gif', '', '5c7d1058f874fe2eecc3f719f779c91e', '378584905897a4f11f7ce8c79b2a6bbbc5c1eee3', '1', '1484785798');
INSERT INTO `ghao_picture` VALUES ('610', '/Uploads/Docpic/2017-01-19/5880089b0598f.gif', '', '4d88ecff346ad97caad99452ff187b63', '3c62dafdb7bb37fe1188296e5f40402c4086fe21', '1', '1484785818');
INSERT INTO `ghao_picture` VALUES ('611', '/Uploads/Docpic/2017-01-19/588008adc7dbc.gif', '', '3aa8dc8ec37011823e3453aae9f0997a', 'fad4f61fb7f7736cdcbf41553cfc9e9ba550a066', '1', '1484785837');
INSERT INTO `ghao_picture` VALUES ('612', '/Uploads/Docpic/2017-01-19/588008c0b2058.gif', '', '1e0d0e820bc8f2bc7098bb22b44358cc', 'dc7834cee82fbc97593ef76dfb8a892c9018ab69', '1', '1484785856');
INSERT INTO `ghao_picture` VALUES ('613', '/Uploads/Docpic/2017-01-19/588008cc92b8d.gif', '', '0eb5ea5149e0436f5fb102c72136a2f2', 'a6d0a4f1ebd72db107ec3aa86edd2bbf565b1794', '1', '1484785868');
INSERT INTO `ghao_picture` VALUES ('614', '/Uploads/Docpic/2017-01-19/588008deab81f.gif', '', 'd617af20ad27db8481173abcd7fe0228', '1922d18b8ddc560d927e198f74cd94b54377d61e', '1', '1484785886');
INSERT INTO `ghao_picture` VALUES ('615', '/Uploads/Docpic/2017-01-19/588008efd5c11.gif', '', '8c5346ae604be7b72c50662004cbec98', '81fa69bf11d98303aea8aeb78e85fe73c2b90a98', '1', '1484785903');
INSERT INTO `ghao_picture` VALUES ('616', '/Uploads/Docpic/2017-01-19/588009029f9c5.gif', '', '1f57b8461211f03cef8dc2f954189355', '195e9a95978907d0ce2efdc5da02c0338b2c8d5a', '1', '1484785922');
INSERT INTO `ghao_picture` VALUES ('617', '/Uploads/Docpic/2017-01-19/5880091295c9a.gif', '', '40644044ccef2225827058c38cd0c02e', 'edb012bb6f65eccf0ec18d39984e8d695d981bc5', '1', '1484785938');
INSERT INTO `ghao_picture` VALUES ('618', '/Uploads/Docpic/2017-01-19/588009277e96b.gif', '', 'cf47027d4585ac09dc16c2a19cfbe832', '4f473b731f1b3c175b5bbe0e74f5ea311b497b6c', '1', '1484785959');
INSERT INTO `ghao_picture` VALUES ('619', '/Uploads/Docpic/2017-01-19/588009369c9d5.gif', '', '88397f6c8b62c9cdd2b3e9a71c4b1001', '3e7ff87301c3e2812292f9328bcf2a555247830a', '1', '1484785974');
INSERT INTO `ghao_picture` VALUES ('620', '/Uploads/Docpic/2017-01-19/5880094abe8ac.gif', '', '037c016d1a632329bcadb75e99a8652a', '6c189e16535161a6c9ac2f6a9f899e2adcd56564', '1', '1484785994');
INSERT INTO `ghao_picture` VALUES ('621', '/Uploads/Docpic/2017-01-19/58800960eb6e5.gif', '', 'bd9857da680ba26f24612b1088d73da5', 'b9574058eca82650fec3fb05fab1d4e3bc2e527f', '1', '1484786016');
INSERT INTO `ghao_picture` VALUES ('622', '/Uploads/Docpic/2017-01-19/5880096f4c2ce.gif', '', '9ce6b0090d486e8de3f6686cc86b6e20', '949a8c2645b96ebe5671aaf9e98ea9a5eacf8b73', '1', '1484786031');
INSERT INTO `ghao_picture` VALUES ('623', '/Uploads/Docpic/2017-01-19/58800e2a0e78c.gif', '', '572323edcf047443e3e2fb977dde6bc3', 'a1501c1442674d98518e89b7897ddf58c67d4995', '1', '1484787242');
INSERT INTO `ghao_picture` VALUES ('624', '/Uploads/Docpic/2017-01-19/58800e56e4fb9.gif', '', '67472acb5b3b11ca61d9a2df97188575', '629e497d33aa1474ffffc83c6a179e539bfd6df1', '1', '1484787286');
INSERT INTO `ghao_picture` VALUES ('625', '/Uploads/Docpic/2017-01-19/58800f20a3344.gif', '', 'bb51cdaa7094ab87a1e18824b78b96d4', '2ea3668d9867661916e4f3c39c1e7dd249766561', '1', '1484787488');
INSERT INTO `ghao_picture` VALUES ('626', '/Uploads/Docpic/2017-01-19/5880112446cf9.gif', '', 'ddfdc4351a59182df2c5d1fab3be810d', '017dbb260c4685a3ebf617cab73b5e6052e5aa60', '1', '1484788004');
INSERT INTO `ghao_picture` VALUES ('627', '/Uploads/Docpic/2017-01-19/58801137454c3.gif', '', '1dc918835160c8e1a830e420f046fb02', '361dd9c8114c3ebde4c9e31bd917fb42241c369d', '1', '1484788023');
INSERT INTO `ghao_picture` VALUES ('628', '/Uploads/Docpic/2017-01-19/5880115007d46.gif', '', '34caa799c5e3c161ed733a06c1d09ec3', '3cdd88f77316b16126abb6207a23789b11a012fd', '1', '1484788047');
INSERT INTO `ghao_picture` VALUES ('629', '/Uploads/Docpic/2017-01-19/58801163dd8b5.gif', '', '9feccd784c653bf06a9e3c87b42e2626', '2c30049fd927bb46e87edbc4c703dbc8d0e509ec', '1', '1484788067');
INSERT INTO `ghao_picture` VALUES ('630', '/Uploads/Docpic/2017-01-19/58801175684bb.gif', '', '9e48948e2194cacdafcaaf29758557e4', '022625e324bc27fec82cd396dd7372f03931640f', '1', '1484788085');
INSERT INTO `ghao_picture` VALUES ('631', '/Uploads/Docpic/2017-01-19/588011859a314.gif', '', '5db9b2619b6014ba6d2eff83a31bc4ac', '05d3b5d788e17572f6cf95290c257b424a22e50a', '1', '1484788101');
INSERT INTO `ghao_picture` VALUES ('632', '/Uploads/Docpic/2017-01-19/588011af312f9.gif', '', 'ddf80e1622b479c16b3ed8928d192c81', '1ff266f7eb96688610c41de6330683b757c6bb6f', '1', '1484788143');
INSERT INTO `ghao_picture` VALUES ('633', '/Uploads/Docpic/2017-01-19/588011d426406.gif', '', 'ff5e3d83fe9d7acd38b0cf832ebd4147', 'f1945229b5d93319551019f7d2ba7488e1e1e6cb', '1', '1484788180');
INSERT INTO `ghao_picture` VALUES ('634', '/Uploads/Docpic/2017-01-19/588011f2e126e.gif', '', 'f6aec2b2cc7cbaea090d7c316cbec235', '7bec2151a8bb7b1ac2a26fd583733697720707de', '1', '1484788210');
INSERT INTO `ghao_picture` VALUES ('635', '/Uploads/Docpic/2017-01-19/5880120dd9209.gif', '', '873148297f8fb808856615146c874345', '3f0e19ada3258ebeaa460f8eaf45de994a73891e', '1', '1484788237');
INSERT INTO `ghao_picture` VALUES ('636', '/Uploads/Docpic/2017-01-19/588012290b8ba.gif', '', 'e2d9a4a73131fef0b4b197a04a6d1d9a', '556c23aa157dc1e2f55ad52c755938fa8833db42', '1', '1484788264');
INSERT INTO `ghao_picture` VALUES ('637', '/Uploads/Docpic/2017-01-19/5880131e36bfb.gif', '', 'dff59522aa19c15c4e3bb0c641a4de7d', '7de4066fb47df98581626844cb8e11443d514f3a', '1', '1484788510');
INSERT INTO `ghao_picture` VALUES ('638', '/Uploads/Docpic/2017-01-19/5880134ae2900.gif', '', 'fe3eada42370486460c6ce62dc251fdc', '4ee256d7095b553c30a56510bce2a06084d9beea', '1', '1484788554');
INSERT INTO `ghao_picture` VALUES ('639', '/Uploads/Docpic/2017-01-19/5880139693921.gif', '', '1391988055338b35aa71d3b92f079af6', '23bc3414d692471546fb299df7483c66d6df02ba', '1', '1484788630');
INSERT INTO `ghao_picture` VALUES ('640', '/Uploads/Docpic/2017-01-19/588013bc16e2e.gif', '', '0a357e62b6c6127cd6827a5d4068ff6b', '92254857b6e55c48879b829ad551e66eb0d0f37a', '1', '1484788668');
INSERT INTO `ghao_picture` VALUES ('641', '/Uploads/Docpic/2017-01-19/588013cd75ba9.gif', '', 'c937e4dc435d3787eb51df86c02217d9', '3cb391643084aaac0617afadfa3671b1b2aafea6', '1', '1484788685');
INSERT INTO `ghao_picture` VALUES ('642', '/Uploads/Docpic/2017-01-19/588013e47fa58.gif', '', 'cf7a5ed615f59fb1797439d059e54572', '9688b7f5e754f4db3cdd87a2547ecd1ed4a21406', '1', '1484788708');
INSERT INTO `ghao_picture` VALUES ('643', '/Uploads/Docpic/2017-01-19/588013f70a9aa.gif', '', 'a6fd4b49c3f87b0f5d6e94cd1c1f5c4d', '08dcf0764447e90f86ca9c1a9cbeab2dd72db97c', '1', '1484788726');
INSERT INTO `ghao_picture` VALUES ('644', '/Uploads/Docpic/2017-01-19/588014096c1c0.gif', '', '112c47b0b1463ead46601b9521f496ed', '3441757b90d40561804066e838b203e8f3580c57', '1', '1484788745');
INSERT INTO `ghao_picture` VALUES ('645', '/Uploads/Docpic/2017-01-19/5880141bad8a3.gif', '', '7b40c8548b4cb0699d01a318a940b725', 'fbb2eb6cb9d838468a49931e6a3125f729e33d1a', '1', '1484788763');
INSERT INTO `ghao_picture` VALUES ('646', '/Uploads/Docpic/2017-01-19/5880142adbce2.gif', '', '914dbeab116f138fdef8f53c85523de3', '97b33e8f15c75c0116c266920c573ebd42f36716', '1', '1484788778');
INSERT INTO `ghao_picture` VALUES ('647', '/Uploads/Docpic/2017-01-19/5880143edff33.gif', '', 'ffff90912780eef5786dc7aa2d7367c9', 'd713dc3f93275ad65731e5a4d5f8a2fdfa92895c', '1', '1484788798');
INSERT INTO `ghao_picture` VALUES ('648', '/Uploads/Docpic/2017-01-19/588016c7718eb.gif', '', '7a9876d6d2bbea8959e6767291c2db6b', '5847963a5410b2148d674296384b71d29f1bd5b5', '1', '1484789447');
INSERT INTO `ghao_picture` VALUES ('649', '/Uploads/Docpic/2017-01-19/588016e606eb6.gif', '', '3441ec2313276a05cb9eea2985d92d16', '3104c2dc9161456a1ada50e71834248216080aff', '1', '1484789477');
INSERT INTO `ghao_picture` VALUES ('650', '/Uploads/Docpic/2017-01-19/588016f8844a2.gif', '', '8103ee8967a90606b7973b91bb56fd73', '1f1ee5eccb1338e33a2822e9c6a8647a0fff6a3e', '1', '1484789496');
INSERT INTO `ghao_picture` VALUES ('651', '/Uploads/Docpic/2017-01-19/5880170c1ac56.gif', '', '17fc6e63a0365e2f2a2cd87c7068e30e', '391d25e898560819e27fb0171da848d52c93e32d', '1', '1484789516');
INSERT INTO `ghao_picture` VALUES ('652', '/Uploads/Docpic/2017-01-19/588020db4f6fb.JPG', '', 'aeaf916f4796bf14c3b4c7e5986883ea', 'c5d2b5c450988bd9736f3b245972fce935c2c906', '1', '1484792027');
INSERT INTO `ghao_picture` VALUES ('653', '/Uploads/Docpic/2017-01-19/588021bee1fd3.JPG', '', '845036adc6c12e90b269cad8076e06a5', 'a78697419071e0f44c9daf397ec1afa135215da4', '1', '1484792254');
INSERT INTO `ghao_picture` VALUES ('654', '/Uploads/Docpic/2017-01-19/588021d18737e.JPG', '', 'ab002b32f094171355a1932b39663408', 'edd6b26bd96209971ca9cd98feb8dbc388f9621f', '1', '1484792273');
INSERT INTO `ghao_picture` VALUES ('655', '/Uploads/Docpic/2017-01-19/5880223c1cfe9.JPG', '', 'c38a6db4165ba723154417fe489d2836', 'de548f842505c2e291573af3ce22c9b481572d48', '1', '1484792380');
INSERT INTO `ghao_picture` VALUES ('656', '/Uploads/Docpic/2017-01-19/58802276a1b96.JPG', '', '20ff34b7047bf8da244e17d3bc3c8404', 'cd92d9244c130927b08674664753695d69d7e5c8', '1', '1484792438');
INSERT INTO `ghao_picture` VALUES ('657', '/Uploads/Docpic/2017-01-19/58802295e0858.JPG', '', 'eee7b28855c4afac6d2c0ce80ca67bab', 'a3d917142e8cf80d83adaa7573932669c0fccb09', '1', '1484792469');
INSERT INTO `ghao_picture` VALUES ('658', '/Uploads/Docpic/2017-01-19/588022ba311ed.JPG', '', '20564f30e275890ed79a9f7eaf1d8d7c', '1596639737e28cfedc5052df5786ecb181f208de', '1', '1484792506');
INSERT INTO `ghao_picture` VALUES ('659', '/Uploads/Docpic/2017-01-19/588023528946f.JPG', '', '6bc32ec62d77ae82d1df3afdd0c6f397', 'faba1f111490cbb0ad276b87da3b61a776b7c8a6', '1', '1484792658');
INSERT INTO `ghao_picture` VALUES ('660', '/Uploads/Docpic/2017-01-19/588023701652e.jpg', '', 'f766600f43fc8d6be2e7a27dccb9a671', '35d78bc552d243e1ded73ef81a2cc86783307add', '1', '1484792688');
INSERT INTO `ghao_picture` VALUES ('661', '/Uploads/Docpic/2017-01-20/5881be239a243.JPG', '', '2094a5a40e8cf85d80163abbd571f0a0', '7cab0e5371ff8a7b080d10092c89fa2394c0a6a8', '1', '1484897827');
INSERT INTO `ghao_picture` VALUES ('662', '/Uploads/Docpic/2017-01-20/5881be50948cd.JPG', '', '04aad8fba39cd2818a1c481bc04da91b', 'e677d945b1e065e17dde69def0c74911cfd9d8ff', '1', '1484897872');
INSERT INTO `ghao_picture` VALUES ('663', '/Uploads/Docpic/2017-02-07/58992d5e049fa.jpg', '', '34b9295a43db0ac7fdf6822dd2aa992d', '8fc0e2c97cff69dc8574ff115068457f3a6fa6bd', '1', '1486433629');
INSERT INTO `ghao_picture` VALUES ('664', '/Uploads/Docpic/2017-02-08/589abcbc2247e.gif', '', '4ceac62321cdd0af80bd54f65ae3548e', '50d71dcd1b272db41faa40a3342d13cac1c477a6', '1', '1486535868');
INSERT INTO `ghao_picture` VALUES ('665', '/Uploads/Docpic/2017-02-08/589abcc013a73.gif', '', '4e52a6a86064368d60f0490a081bc3fc', '240cda253dfaa85cee7e3fecabb073f3d0e1ae95', '1', '1486535872');
INSERT INTO `ghao_picture` VALUES ('666', '/Uploads/Docpic/2017-02-14/58a2508e742e0.jpg', '', 'cd2936d83c13eb18dba5fc6539dece83', '2062f33e61a6dca7d363c17fbcabdd157647fbc5', '1', '1487032462');
INSERT INTO `ghao_picture` VALUES ('667', '/Uploads/Docpic/2017-03-06/58bcf66e4e6e6.JPG', '', '4a6df61de4ab6ef314c3661ad1a4c903', '8e1a0630541d48b393c88eba242cbf9df7153a18', '1', '1488778862');
INSERT INTO `ghao_picture` VALUES ('668', '/Uploads/Docpic/2017-03-07/58be019ccc626.JPG', '', 'd05bee0fb722b30b4758393d1a88904f', '369643f11bde29874a16250fa3fdfc6202b67918', '1', '1488847260');
INSERT INTO `ghao_picture` VALUES ('669', '/Uploads/Docpic/2017-03-07/58be0225b086a.JPG', '', '95ceafc247d3c41f65bee62f1dfe171d', '866a1ec1d2b634b3850db1f9111bdc2b6ae23a33', '1', '1488847397');
INSERT INTO `ghao_picture` VALUES ('670', '/Uploads/Docpic/2017-03-16/58ca4c5c8cb47.png', '', '7b49a01ecb544e0bcebdd4c58b7c2088', '6f09948f694347fe7b5d6155b7046641b2a35092', '1', '1489652828');
INSERT INTO `ghao_picture` VALUES ('673', '/Uploads/Docpic/2017-03-17/58cb898d9938a.png', '', 'b66656e49737e91c6df517b5f31a7c50', '0fde25c1d8fa9ea62e5d1bb4a5b643820a3c16c3', '1', '1489734029');
INSERT INTO `ghao_picture` VALUES ('674', '/Uploads/Docpic/2017-03-17/58cb8a78658e7.png', '', 'fc23e6c2a782c6a7dc07f6b91b94ee11', 'f9784c0ca2c020a4ac67e0580e8eeb5d3ad8ecfa', '1', '1489734264');
INSERT INTO `ghao_picture` VALUES ('675', '/Uploads/Docpic/2017-03-17/58cb8ab4bdc91.png', '', 'b7325239ef71c986829978522d7d5643', '923827d2477f34d4c2b27df79ecc25b1b3fa21b8', '1', '1489734324');
INSERT INTO `ghao_picture` VALUES ('676', '/Uploads/Docpic/2017-04-07/58e6f1e5b3c80.JPG', '', '886dd9fcb0bc7848a91201dea0ee86e7', '4d275adf9f648af9f86078ba94aae22948a6e8ca', '1', '1491530213');
INSERT INTO `ghao_picture` VALUES ('677', '/Uploads/Docpic/2017-09-01/59a8bf8fb29ae.JPG', '', 'ba9767852cac1bc4e3885785643fad43', '4c5d434fdd212f93f2bd637cce8d3e48e96382a2', '1', '1504231310');

-- ----------------------------
-- Table structure for `ghao_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_ucenter_admin`;
CREATE TABLE `ghao_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ghao_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_ucenter_app`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_ucenter_app`;
CREATE TABLE `ghao_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of ghao_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_ucenter_member`;
CREATE TABLE `ghao_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ghao_ucenter_member
-- ----------------------------
INSERT INTO `ghao_ucenter_member` VALUES ('1', 'admin', '988a56de4e84cf24870de0bb712d9d3a', '12@126.com', '', '1467868340', '0', '1505270926', '0', '1467868340', '1');
INSERT INTO `ghao_ucenter_member` VALUES ('12', 'uuu', '988a56de4e84cf24870de0bb712d9d3a', 'jjj@cc.com', '', '1498798968', '0', '0', '0', '1498798968', '1');
INSERT INTO `ghao_ucenter_member` VALUES ('3', 'nurse', '988a56de4e84cf24870de0bb712d9d3a', 'nurse@163.com', '', '1481509256', '167791627', '1483938474', '2886732565', '1481509256', '1');
INSERT INTO `ghao_ucenter_member` VALUES ('13', 's', '988a56de4e84cf24870de0bb712d9d3a', '111@adsada.com', '', '1499414994', '0', '1499759368', '0', '1499414994', '1');

-- ----------------------------
-- Table structure for `ghao_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_ucenter_setting`;
CREATE TABLE `ghao_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of ghao_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_url`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_url`;
CREATE TABLE `ghao_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of ghao_url
-- ----------------------------

-- ----------------------------
-- Table structure for `ghao_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `ghao_userdata`;
CREATE TABLE `ghao_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ghao_userdata
-- ----------------------------
