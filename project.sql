/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-06-07 11:06:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `break`
-- ----------------------------
DROP TABLE IF EXISTS `break`;
CREATE TABLE `break` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `_date` datetime DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `person` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `urgency` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tech` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of break
-- ----------------------------
INSERT INTO `break` VALUES ('1', '224#切丝机自主维护', '2020-05-08 15:55:28', '刀片', 'test02', '刀片磨损', '计划处理', '/upload/05.png', 'test07');
INSERT INTO `break` VALUES ('2', '224#切丝机自主维护', '2020-05-22 15:55:24', '砂轮', 'test02', '砂轮磨损', '计划处理', '/upload/04.png', 'test03');
INSERT INTO `break` VALUES ('3', '222#切丝机自主维护', '2020-05-05 15:55:21', '安全保护装置', 'test02', '安全保护装置失效', '立即抢修', '/upload/03.png', null);
INSERT INTO `break` VALUES ('4', '223#切丝机自主维护', '2020-05-28 15:55:18', '金刚石', 'test02', '金刚石磨损', '当日解决', '/upload/02.png', null);
INSERT INTO `break` VALUES ('5', '223#切丝机自主维护', '2020-05-13 15:55:14', '排链', 'test02', '上下排链松动', '立即抢修', '/upload/01.png', 'tttt');
INSERT INTO `break` VALUES ('6', '222#切丝机自主维护', '2020-05-09 23:50:25', 'wsedf', 'test06', 'sdf', '立即抢修', '/upload/c25e88d31f4b7eb838ffcd945026d8fe1475731039450.jpeg', 'wed');
INSERT INTO `break` VALUES ('7', '223#切丝机自主维护', '2020-05-20 17:21:55', 'qwer', 'qwer', '23456789', '立即抢修', '', null);

-- ----------------------------
-- Table structure for `equip`
-- ----------------------------
DROP TABLE IF EXISTS `equip`;
CREATE TABLE `equip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plant` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `work` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of equip
-- ----------------------------
INSERT INTO `equip` VALUES ('1', 'xx卷烟厂', '切丝车间', '高产切梗丝机（配8000kg/制丝线）', 'SQ38', '222#', '待运行');
INSERT INTO `equip` VALUES ('2', 'xx卷烟厂', '切丝车间', '高产切叶丝机（配8000kg/制丝线）', 'SQ37', '223#', '待运行');
INSERT INTO `equip` VALUES ('3', 'xx卷烟厂', '切丝车间', '高产切梗丝机（配8000kg/制丝线）', 'SQ38A型', '224#', '正在运行');
INSERT INTO `equip` VALUES ('4', 'xx卷烟厂', '切丝车间', '高产切叶丝机（配8000kg/制丝线）', 'SQ37A型', '225#', '正在运行');
INSERT INTO `equip` VALUES ('5', 'xx卷烟厂', '切丝车间', '高产切梗丝机', 'SQ36A型', '226#', '待运行');
INSERT INTO `equip` VALUES ('6', 'xx卷烟厂', '切丝车间', '高产切叶丝机', 'SQ35A型', '227#', '待运行');
INSERT INTO `equip` VALUES ('7', 'xx卷烟厂', '切丝车间', '中产切梗丝机', 'SQ34A型', '228#', '正在运行');
INSERT INTO `equip` VALUES ('8', 'xx卷烟厂', '切丝车间', '中产切叶丝机', 'SQ33A型', '239#', '维修中');
INSERT INTO `equip` VALUES ('9', 'xx卷烟厂', '切丝车间', '低产切梗丝机', 'SQ32A型', '245#', '维修中');
INSERT INTO `equip` VALUES ('10', 'xx卷烟厂', '切丝车间', '低产切叶丝机', 'SQ31A型', '236#', '正在运行');

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `person` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inspector` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `scores` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '未执行',
  `_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('14', '221#切丝机自主维护', '2020-05-19 12:46:35', 'test07', 'test06', '45.00', 'qwer', '已注销', '2020-05-19 10:00:00');
INSERT INTO `exam` VALUES ('15', '222#切丝机自主维护', '2020-05-19 12:52:48', 'test02', 'test06', '56.00', 'qwer', '已完成', '2020-05-19 10:00:00');
INSERT INTO `exam` VALUES ('16', '223#切丝机自主维护', '2020-05-19 00:06:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('17', '224#切丝机自主维护', '2020-05-19 00:06:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('18', 'we', '2020-05-19 00:06:00', 'wertq2wert', null, null, null, '未执行', null);
INSERT INTO `exam` VALUES ('21', '221#切丝机自主维护', '2020-05-20 17:04:01', 'test07', 'test06', '100.00', '', '已完成', '2020-05-20 17:52:58');
INSERT INTO `exam` VALUES ('22', '222#切丝机自主维护', '2020-05-20 12:01:30', 'test02', 'test06', '84.44', '', '已完成', '2020-05-20 18:00:14');
INSERT INTO `exam` VALUES ('23', '223#切丝机自主维护', '2020-05-20 12:01:30', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('24', '224#切丝机自主维护', '2020-05-20 12:01:30', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('25', 'we', '2020-05-20 12:01:30', 'wertq2wert', null, null, null, '未执行', null);
INSERT INTO `exam` VALUES ('28', '221#切丝机自主维护', '2020-05-21 07:33:00', 'test02', 'test06', '52.00', 'qwert', '已完成', '2020-05-21 07:37:46');
INSERT INTO `exam` VALUES ('29', '222#切丝机自主维护', '2020-05-21 07:33:00', 'test02', 'test06', '75.56', 'dergthyjukijhgfdsdfvgb', '已完成', '2020-05-21 07:36:46');
INSERT INTO `exam` VALUES ('30', '223#切丝机自主维护', '2020-05-21 07:33:00', 'test02', 'test06', '65.75', '', '已完成', '2020-05-21 22:49:06');
INSERT INTO `exam` VALUES ('31', '224#切丝机自主维护', '2020-05-21 07:33:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('32', 'we', '2020-05-21 07:33:00', 'wertq2wert', 'qwe', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('35', '221#切丝机自主维护', '2020-05-22 08:57:00', 'test02', 'test06', '100.00', '', '已完成', '2020-05-22 23:48:31');
INSERT INTO `exam` VALUES ('36', '222#切丝机自主维护', '2020-05-22 08:57:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('37', '223#切丝机自主维护', '2020-05-22 08:57:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('38', '224#切丝机自主维护', '2020-05-22 08:57:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('39', 'we', '2020-05-22 08:57:00', 'wertq2wert', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('42', '221#切丝机自主维护', '2020-05-23 07:11:40', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('43', '222#切丝机自主维护', '2020-05-23 07:11:40', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('44', '223#切丝机自主维护', '2020-05-23 07:11:40', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('45', '224#切丝机自主维护', '2020-05-23 07:11:40', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('46', 'we', '2020-05-23 07:11:40', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('49', '221#切丝机自主维护', '2020-05-24 08:33:40', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('50', '222#切丝机自主维护', '2020-05-24 08:33:40', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('51', '223#切丝机自主维护', '2020-05-24 08:33:40', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('52', '224#切丝机自主维护', '2020-05-24 08:33:40', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('53', 'we', '2020-05-24 08:33:40', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('56', '221#切丝机自主维护', '2020-05-27 08:33:41', 'test02', 'test06', '78.00', '', '已完成', '2020-05-27 08:41:10');
INSERT INTO `exam` VALUES ('57', '222#切丝机自主维护', '2020-05-27 08:33:41', 'test02', 'test06', null, 'dfgh', '已注销', '2020-05-27 08:40:57');
INSERT INTO `exam` VALUES ('58', '223#切丝机自主维护', '2020-05-27 08:33:41', 'test02', 'test06', '81.25', 'rtyuio', '已完成', '2020-05-27 08:40:35');
INSERT INTO `exam` VALUES ('59', '224#切丝机自主维护', '2020-05-27 08:33:41', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('60', 'we', '2020-05-27 08:33:41', 'wwefdgrtbhjmk,', 'test06', null, 'dfghj', '已注销', '2020-05-27 08:40:47');
INSERT INTO `exam` VALUES ('63', '221#切丝机自主维护', '2020-05-28 08:01:01', 'test02', 'test06', '88.00', '', '已完成', '2020-05-28 08:04:04');
INSERT INTO `exam` VALUES ('64', '222#切丝机自主维护', '2020-05-28 08:01:01', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('65', '223#切丝机自主维护', '2020-05-28 08:01:01', 'test02', 'test06', '80.50', '', '已完成', '2020-05-28 08:04:50');
INSERT INTO `exam` VALUES ('66', '224#切丝机自主维护', '2020-05-28 08:01:01', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('67', 'we', '2020-05-28 08:01:01', 'wwefdgrtbhjmk,', 'test06', 'NaN', '', '已完成', '2020-05-28 08:04:25');
INSERT INTO `exam` VALUES ('70', '221#切丝机自主维护', '2020-05-29 06:25:30', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('71', '222#切丝机自主维护', '2020-05-29 06:25:30', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('72', '223#切丝机自主维护', '2020-05-29 06:25:30', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('73', '224#切丝机自主维护', '2020-05-29 06:25:30', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('74', 'we', '2020-05-29 06:25:30', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('77', '221#切丝机自主维护', '2020-05-30 09:13:50', 'test02', 'test06', '22.00', '', '已完成', '2020-05-30 10:49:57');
INSERT INTO `exam` VALUES ('78', '222#切丝机自主维护', '2020-05-30 09:13:50', 'test02', 'test06', '99.00', '', '已完成', '2020-05-30 10:49:39');
INSERT INTO `exam` VALUES ('79', '223#切丝机自主维护', '2020-05-30 09:13:50', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('80', '224#切丝机自主维护', '2020-05-30 09:13:50', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('81', 'we', '2020-05-30 09:13:50', 'wwefdgrtbhjmk,', 'test06', 'NaN', null, '未执行', null);
INSERT INTO `exam` VALUES ('82', '221#切丝机自主维护', '2020-06-01 18:11:03', 'test02', 'test06', '100.00', '', '已完成', '2020-06-01 18:20:11');
INSERT INTO `exam` VALUES ('83', '222#切丝机自主维护', '2020-06-01 18:11:03', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('84', '223#切丝机自主维护', '2020-06-01 18:11:03', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('85', '224#切丝机自主维护', '2020-06-01 18:11:03', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('86', 'we', '2020-06-01 18:11:03', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('89', '221#切丝机自主维护', '2020-06-02 08:33:00', 'test02', 'test06', '88.00', '', '已完成', '2020-06-02 17:20:36');
INSERT INTO `exam` VALUES ('90', '222#切丝机自主维护', '2020-06-02 08:33:00', 'test02', 'test06', null, 'wsdefgrbhy', '已注销', '2020-06-02 17:20:47');
INSERT INTO `exam` VALUES ('91', '223#切丝机自主维护', '2020-06-02 08:33:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('92', '224#切丝机自主维护', '2020-06-02 08:33:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('93', 'we', '2020-06-02 08:33:00', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('96', '221#切丝机自主维护', '2020-06-03 10:12:00', 'test02', 'test06', '100.00', '', '已完成', '2020-06-03 19:44:43');
INSERT INTO `exam` VALUES ('97', '222#切丝机自主维护', '2020-06-03 10:12:00', 'test02', 'test06', null, 'dfgtyhuj', '已注销', '2020-06-03 19:44:58');
INSERT INTO `exam` VALUES ('98', '223#切丝机自主维护', '2020-06-03 10:12:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('99', '224#切丝机自主维护', '2020-06-03 10:12:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('100', 'we', '2020-06-03 10:12:00', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('101', '221#切丝机自主维护', '2020-06-04 08:22:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('102', '222#切丝机自主维护', '2020-06-04 08:22:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('103', '223#切丝机自主维护', '2020-06-04 08:22:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('104', '224#切丝机自主维护', '2020-06-04 08:22:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('105', 'we', '2020-06-04 08:22:00', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('108', '221#切丝机自主维护', '2020-06-05 08:23:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('109', '222#切丝机自主维护', '2020-06-05 08:23:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('110', '223#切丝机自主维护', '2020-06-05 08:23:00', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('111', '224#切丝机自主维护', '2020-06-05 08:23:00', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('112', 'we', '2020-06-05 08:23:00', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('115', '221#切丝机自主维护', '2020-06-06 00:00:03', 'test02', 'test06', '100.00', '', '已完成', '2020-06-06 11:18:57');
INSERT INTO `exam` VALUES ('116', '222#切丝机自主维护', '2020-06-06 00:00:03', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('117', '223#切丝机自主维护', '2020-06-06 00:00:03', 'test02', 'test06', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('118', '224#切丝机自主维护', '2020-06-06 00:00:03', 'test03', 'test07', null, null, '未执行', null);
INSERT INTO `exam` VALUES ('119', 'we', '2020-06-06 00:00:03', 'wwefdgrtbhjmk,', 'test06', null, null, '未执行', null);

-- ----------------------------
-- Table structure for `exam_item`
-- ----------------------------
DROP TABLE IF EXISTS `exam_item`;
CREATE TABLE `exam_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `scores` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam_item
-- ----------------------------
INSERT INTO `exam_item` VALUES ('1', '1', '2', '80');
INSERT INTO `exam_item` VALUES ('2', '1', '24', '80');
INSERT INTO `exam_item` VALUES ('3', '2', '2', '80');
INSERT INTO `exam_item` VALUES ('4', '2', '2', '80');
INSERT INTO `exam_item` VALUES ('5', '2', '22', '80');
INSERT INTO `exam_item` VALUES ('6', '2', '9', '80');
INSERT INTO `exam_item` VALUES ('7', '2', '8', '80');
INSERT INTO `exam_item` VALUES ('8', '2', '7', '81');
INSERT INTO `exam_item` VALUES ('9', '2', '6', '82');
INSERT INTO `exam_item` VALUES ('10', '2', '5', '80');
INSERT INTO `exam_item` VALUES ('11', '2', '4', '82');
INSERT INTO `exam_item` VALUES ('12', '2', '3', '80');
INSERT INTO `exam_item` VALUES ('13', '2', '2', '80');
INSERT INTO `exam_item` VALUES ('14', '2', '10', '80');
INSERT INTO `exam_item` VALUES ('15', '2', '11', '80');
INSERT INTO `exam_item` VALUES ('16', '2', '12', '80');
INSERT INTO `exam_item` VALUES ('17', '3', '1', '80');
INSERT INTO `exam_item` VALUES ('18', '3', '2', '80');
INSERT INTO `exam_item` VALUES ('19', '3', '3', '80');
INSERT INTO `exam_item` VALUES ('20', '3', '4', '80');
INSERT INTO `exam_item` VALUES ('21', '3', '5', '80');
INSERT INTO `exam_item` VALUES ('22', '3', '6', '80');
INSERT INTO `exam_item` VALUES ('23', '3', '7', '80');
INSERT INTO `exam_item` VALUES ('24', '3', '8', '80');
INSERT INTO `exam_item` VALUES ('25', '3', '9', '80');
INSERT INTO `exam_item` VALUES ('26', '3', '7', '80');
INSERT INTO `exam_item` VALUES ('27', '3', '89', '80');
INSERT INTO `exam_item` VALUES ('28', '3', '3', '80');
INSERT INTO `exam_item` VALUES ('29', '4', '22', '80');
INSERT INTO `exam_item` VALUES ('30', '4', '2', '80');
INSERT INTO `exam_item` VALUES ('31', null, null, null);

-- ----------------------------
-- Table structure for `exec`
-- ----------------------------
DROP TABLE IF EXISTS `exec`;
CREATE TABLE `exec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `person` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '未完成',
  `_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exec
-- ----------------------------
INSERT INTO `exec` VALUES ('44', '221#切丝机自主维护', 'test07', '已完成', '2020-05-20 22:02:41', null, '2020-05-19 10:06:00');
INSERT INTO `exec` VALUES ('45', '222#切丝机自主维护', 'test02', '已完成', '2020-05-20 22:02:44', null, '2020-05-19 10:06:00');
INSERT INTO `exec` VALUES ('46', '223#切丝机自主维护', 'test02', '未完成', '2020-05-19 00:06:00', null, null);
INSERT INTO `exec` VALUES ('47', '224#切丝机自主维护', 'test03', '未完成', '2020-05-19 00:06:00', null, null);
INSERT INTO `exec` VALUES ('48', 'we', 'wertq2wert', '未完成', '2020-05-19 00:06:00', null, null);
INSERT INTO `exec` VALUES ('51', '221#切丝机自主维护', 'test07', '未完成', '2020-05-20 00:06:00', null, null);
INSERT INTO `exec` VALUES ('52', '222#切丝机自主维护', 'test02', '未完成', '2020-05-20 10:06:00', null, null);
INSERT INTO `exec` VALUES ('53', '223#切丝机自主维护', 'test02', '已完成', '2020-05-20 17:45:02', 'wsedrftyhui', '2020-05-20 23:44:55');
INSERT INTO `exec` VALUES ('54', '224#切丝机自主维护', 'test03', '未完成', '2020-05-20 00:06:00', null, null);
INSERT INTO `exec` VALUES ('55', 'we', 'wertq2wert', '未完成', '2020-05-20 00:06:00', null, '2020-05-18 16:00:45');
INSERT INTO `exec` VALUES ('58', '221#切丝机自主维护', 'test02', '未完成', '2020-05-21 07:33:00', null, null);
INSERT INTO `exec` VALUES ('59', '222#切丝机自主维护', 'test02', '已完成', '2020-05-21 07:35:18', null, '2020-05-21 07:35:16');
INSERT INTO `exec` VALUES ('60', '223#切丝机自主维护', 'test02', '未完成', '2020-05-21 07:33:00', null, null);
INSERT INTO `exec` VALUES ('61', '224#切丝机自主维护', 'test03', '未完成', '2020-05-21 07:33:00', null, null);
INSERT INTO `exec` VALUES ('62', 'we', 'wertq2wert', '未完成', '2020-05-21 07:33:00', null, null);
INSERT INTO `exec` VALUES ('65', '221#切丝机自主维护', 'test02', '未完成', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec` VALUES ('66', '222#切丝机自主维护', 'test02', '已完成', '2020-05-22 08:57:00', null, '2020-05-22 23:47:17');
INSERT INTO `exec` VALUES ('67', '223#切丝机自主维护', 'test02', '未完成', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec` VALUES ('68', '224#切丝机自主维护', 'test03', '未完成', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec` VALUES ('69', 'we', 'wertq2wert', '未完成', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec` VALUES ('72', '221#切丝机自主维护', 'test02', '已完成', '2020-05-23 07:11:40', null, '2020-05-23 22:54:48');
INSERT INTO `exec` VALUES ('73', '222#切丝机自主维护', 'test02', '未完成', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec` VALUES ('74', '223#切丝机自主维护', 'test02', '未完成', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec` VALUES ('75', '224#切丝机自主维护', 'test03', '未完成', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec` VALUES ('76', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec` VALUES ('79', '221#切丝机自主维护', 'test02', '已注销', '2020-05-24 08:33:40', 'asdfgh', '2020-05-24 20:49:11');
INSERT INTO `exec` VALUES ('80', '222#切丝机自主维护', 'test02', '未完成', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec` VALUES ('81', '223#切丝机自主维护', 'test02', '未完成', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec` VALUES ('82', '224#切丝机自主维护', 'test03', '未完成', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec` VALUES ('83', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec` VALUES ('86', '221#切丝机自主维护', 'test02', '已完成', '2020-05-27 08:33:41', null, '2020-05-27 08:39:46');
INSERT INTO `exec` VALUES ('87', '222#切丝机自主维护', 'test02', '已完成', '2020-05-27 08:33:41', null, '2020-05-27 08:39:41');
INSERT INTO `exec` VALUES ('88', '223#切丝机自主维护', 'test02', '已完成', '2020-05-27 08:33:41', null, '2020-05-27 08:39:34');
INSERT INTO `exec` VALUES ('89', '224#切丝机自主维护', 'test03', '未完成', '2020-05-27 08:33:41', null, null);
INSERT INTO `exec` VALUES ('90', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-05-27 08:33:41', null, null);
INSERT INTO `exec` VALUES ('93', '221#切丝机自主维护', 'test02', '已完成', '2020-05-28 08:01:00', null, '2020-05-28 08:02:31');
INSERT INTO `exec` VALUES ('94', '222#切丝机自主维护', 'test02', '已注销', '2020-05-28 08:01:00', '市场的v法国百年好每节课，\n', '2020-05-28 08:03:20');
INSERT INTO `exec` VALUES ('95', '223#切丝机自主维护', 'test02', '未完成', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec` VALUES ('96', '224#切丝机自主维护', 'test03', '未完成', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec` VALUES ('97', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec` VALUES ('100', '221#切丝机自主维护', 'test02', '未完成', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec` VALUES ('101', '222#切丝机自主维护', 'test02', '未完成', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec` VALUES ('102', '223#切丝机自主维护', 'test02', '未完成', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec` VALUES ('103', '224#切丝机自主维护', 'test03', '未完成', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec` VALUES ('104', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec` VALUES ('107', '221#切丝机自主维护', 'test02', '已完成', '2020-05-30 09:13:50', null, '2020-05-30 09:14:41');
INSERT INTO `exec` VALUES ('108', '222#切丝机自主维护', 'test02', '已注销', '2020-05-30 09:13:50', 'sdfghjk\n', '2020-05-30 09:14:47');
INSERT INTO `exec` VALUES ('109', '223#切丝机自主维护', 'test02', '未完成', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec` VALUES ('110', '224#切丝机自主维护', 'test03', '未完成', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec` VALUES ('111', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec` VALUES ('112', '221#切丝机自主维护', 'test02', '已完成', '2020-06-01 18:11:02', null, '2020-06-01 18:19:08');
INSERT INTO `exec` VALUES ('113', '222#切丝机自主维护', 'test02', '已注销', '2020-06-01 18:11:02', 'sdfghjk', '2020-06-01 18:19:14');
INSERT INTO `exec` VALUES ('114', '223#切丝机自主维护', 'test02', '未完成', '2020-06-01 18:11:02', null, null);
INSERT INTO `exec` VALUES ('115', '224#切丝机自主维护', 'test03', '未完成', '2020-06-01 18:11:02', null, null);
INSERT INTO `exec` VALUES ('116', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-06-01 18:11:02', null, null);
INSERT INTO `exec` VALUES ('119', '221#切丝机自主维护', 'test02', '已完成', '2020-06-02 08:33:00', null, '2020-06-02 13:24:04');
INSERT INTO `exec` VALUES ('120', '222#切丝机自主维护', 'test02', '已完成', '2020-06-02 08:33:00', null, '2020-06-02 13:46:37');
INSERT INTO `exec` VALUES ('121', '223#切丝机自主维护', 'test02', '已注销', '2020-06-02 08:33:00', 'wergthyjmk,', '2020-06-02 13:46:44');
INSERT INTO `exec` VALUES ('122', '224#切丝机自主维护', 'test03', '未完成', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec` VALUES ('123', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec` VALUES ('126', '221#切丝机自主维护', 'test02', '已完成', '2020-06-03 10:12:00', null, '2020-06-03 10:12:18');
INSERT INTO `exec` VALUES ('127', '222#切丝机自主维护', 'test02', '已完成', '2020-06-03 10:12:00', null, '2020-06-03 13:29:17');
INSERT INTO `exec` VALUES ('128', '223#切丝机自主维护', 'test02', '已注销', '2020-06-03 10:12:00', 'ertfgh', '2020-06-03 14:57:22');
INSERT INTO `exec` VALUES ('129', '224#切丝机自主维护', 'test03', '未完成', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec` VALUES ('130', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec` VALUES ('131', '221#切丝机自主维护', 'test02', '未完成', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec` VALUES ('132', '222#切丝机自主维护', 'test02', '未完成', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec` VALUES ('133', '223#切丝机自主维护', 'test02', '未完成', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec` VALUES ('134', '224#切丝机自主维护', 'test03', '未完成', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec` VALUES ('135', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec` VALUES ('138', '221#切丝机自主维护', 'test02', '未完成', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec` VALUES ('139', '222#切丝机自主维护', 'test02', '已完成', '2020-06-05 08:23:00', null, '2020-06-05 23:21:27');
INSERT INTO `exec` VALUES ('140', '223#切丝机自主维护', 'test02', '未完成', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec` VALUES ('141', '224#切丝机自主维护', 'test03', '未完成', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec` VALUES ('142', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec` VALUES ('145', '221#切丝机自主维护', 'test02', '已完成', '2020-06-06 00:00:03', null, '2020-06-06 10:36:59');
INSERT INTO `exec` VALUES ('146', '222#切丝机自主维护', 'test02', '已注销', '2020-06-06 00:00:03', 'dfrgh', '2020-06-06 11:17:48');
INSERT INTO `exec` VALUES ('147', '223#切丝机自主维护', 'test02', '未完成', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec` VALUES ('148', '224#切丝机自主维护', 'test03', '未完成', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec` VALUES ('149', 'we', 'wwefdgrtbhjmk,', '未完成', '2020-06-06 00:00:03', null, null);

-- ----------------------------
-- Table structure for `exec_item`
-- ----------------------------
DROP TABLE IF EXISTS `exec_item`;
CREATE TABLE `exec_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exec_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scores` int DEFAULT NULL,
  `_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1634 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exec_item
-- ----------------------------
INSERT INTO `exec_item` VALUES ('1194', '2', '10', '2020-05-19 12:47:34', '78', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1195', '5', '3', '2020-05-19 00:06:00', null, null);
INSERT INTO `exec_item` VALUES ('1196', '1', '2', '2020-05-19 12:46:35', '45', '2020-05-19 12:46:35');
INSERT INTO `exec_item` VALUES ('1197', '2', '9', '2020-05-19 12:47:34', '88', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1198', '2', '8', '2020-05-19 12:47:34', '78', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1199', '2', '7', '2020-05-19 12:47:34', '45', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1200', '2', '6', '2020-05-19 12:47:34', '45', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1201', '2', '5', '2020-05-19 12:47:33', '55', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1202', '2', '4', '2020-05-19 12:47:33', '55', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1203', '2', '3', '2020-05-19 12:47:33', '55', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1204', '2', '2', '2020-05-19 12:47:33', '5', '2020-05-19 12:47:33');
INSERT INTO `exec_item` VALUES ('1209', '2', '10', '2020-05-20 18:00:14', '88', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1210', '5', '3', '2020-05-20 12:01:30', null, null);
INSERT INTO `exec_item` VALUES ('1211', '1', '2', '2020-05-20 18:12:18', '100', '2020-05-20 18:12:18');
INSERT INTO `exec_item` VALUES ('1212', '2', '9', '2020-05-20 18:00:14', '78', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1213', '2', '8', '2020-05-20 18:00:13', '88', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1214', '2', '7', '2020-05-20 18:00:13', '87', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1215', '2', '6', '2020-05-20 18:00:13', '78', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1216', '2', '5', '2020-05-20 18:00:13', '77', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1217', '2', '4', '2020-05-20 18:00:13', '88', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1218', '2', '3', '2020-05-20 18:00:13', '88', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1219', '2', '2', '2020-05-20 18:00:13', '88', '2020-05-20 18:00:13');
INSERT INTO `exec_item` VALUES ('1224', '2', '10', '2020-05-21 07:36:44', '89', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1225', '5', '3', '2020-05-21 07:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1226', '1', '2', '2020-05-21 22:50:42', '52', '2020-05-21 22:50:42');
INSERT INTO `exec_item` VALUES ('1227', '2', '9', '2020-05-21 07:36:44', '88', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1228', '2', '8', '2020-05-21 07:36:44', '78', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1229', '2', '7', '2020-05-21 07:36:44', '87', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1230', '2', '6', '2020-05-21 07:36:44', '77', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1231', '2', '5', '2020-05-21 07:36:43', '98', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1232', '2', '4', '2020-05-21 07:36:43', '77', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1233', '2', '3', '2020-05-21 07:36:43', '78', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1234', '3', '2', '2020-05-21 22:49:02', '45', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1235', '3', '3', '2020-05-21 22:49:02', '55', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1236', '3', '4', '2020-05-21 22:49:02', '55', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1237', '3', '5', '2020-05-21 22:49:02', '63', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1238', '3', '6', '2020-05-21 22:49:02', '66', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1239', '3', '7', '2020-05-21 22:49:02', '66', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1240', '3', '8', '2020-05-21 22:49:02', '88', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1241', '3', '9', '2020-05-21 22:49:02', '88', '2020-05-21 22:49:01');
INSERT INTO `exec_item` VALUES ('1242', '2', '2', '2020-05-21 07:36:43', '8', '2020-05-21 07:36:43');
INSERT INTO `exec_item` VALUES ('1255', '2', '10', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1256', '5', '3', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1257', '1', '2', '2020-05-22 23:48:29', '100', '2020-05-22 23:48:29');
INSERT INTO `exec_item` VALUES ('1258', '2', '9', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1259', '2', '8', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1260', '2', '7', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1261', '2', '6', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1262', '2', '5', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1263', '2', '4', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1264', '2', '3', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1265', '3', '2', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1266', '3', '3', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1267', '3', '4', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1268', '3', '5', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1269', '3', '6', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1270', '3', '7', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1271', '3', '8', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1272', '3', '9', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1273', '2', '2', '2020-05-22 08:57:00', null, null);
INSERT INTO `exec_item` VALUES ('1286', '2', '10', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1287', '5', '3', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1288', '1', '2', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1289', '2', '9', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1290', '2', '8', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1291', '2', '7', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1292', '2', '6', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1293', '2', '5', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1294', '2', '4', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1295', '2', '3', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1296', '3', '2', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1297', '3', '3', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1298', '3', '4', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1299', '3', '5', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1300', '3', '6', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1301', '3', '7', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1302', '3', '8', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1303', '3', '9', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1304', '2', '2', '2020-05-23 07:11:40', null, null);
INSERT INTO `exec_item` VALUES ('1317', '2', '10', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1318', '5', '3', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1319', '1', '2', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1320', '2', '9', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1321', '2', '8', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1322', '2', '7', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1323', '2', '6', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1324', '2', '5', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1325', '2', '4', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1326', '2', '3', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1327', '3', '2', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1328', '3', '3', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1329', '3', '4', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1330', '3', '5', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1331', '3', '6', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1332', '3', '7', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1333', '3', '8', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1334', '3', '9', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1335', '2', '2', '2020-05-24 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1348', '2', '10', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1349', '5', '3', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1350', '1', '2', '2020-05-27 08:41:09', '78', '2020-05-27 08:41:09');
INSERT INTO `exec_item` VALUES ('1351', '2', '9', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1352', '2', '8', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1353', '2', '7', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1354', '2', '6', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1355', '2', '5', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1356', '2', '4', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1357', '2', '3', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1358', '3', '2', '2020-05-27 08:40:32', '74', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1359', '3', '3', '2020-05-27 08:40:32', '78', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1360', '3', '4', '2020-05-27 08:40:32', '88', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1361', '3', '5', '2020-05-27 08:40:32', '78', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1362', '3', '6', '2020-05-27 08:40:32', '77', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1363', '3', '7', '2020-05-27 08:40:33', '78', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1364', '3', '8', '2020-05-27 08:40:33', '88', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1365', '3', '9', '2020-05-27 08:40:33', '89', '2020-05-27 08:40:31');
INSERT INTO `exec_item` VALUES ('1366', '2', '2', '2020-05-27 08:33:40', null, null);
INSERT INTO `exec_item` VALUES ('1379', '2', '10', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1380', '5', '3', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1381', '1', '2', '2020-05-28 08:04:03', '88', '2020-05-28 08:04:03');
INSERT INTO `exec_item` VALUES ('1382', '2', '9', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1383', '2', '8', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1384', '2', '7', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1385', '2', '6', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1386', '2', '5', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1387', '2', '4', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1388', '2', '3', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1389', '3', '2', '2020-05-28 08:04:49', '77', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1390', '3', '3', '2020-05-28 08:04:49', '78', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1391', '3', '4', '2020-05-28 08:04:49', '87', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1392', '3', '5', '2020-05-28 08:04:49', '75', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1393', '3', '6', '2020-05-28 08:04:49', '85', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1394', '3', '7', '2020-05-28 08:04:49', '82', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1395', '3', '8', '2020-05-28 08:04:49', '83', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1396', '3', '9', '2020-05-28 08:04:49', '77', '2020-05-28 08:04:48');
INSERT INTO `exec_item` VALUES ('1397', '2', '2', '2020-05-28 08:01:00', null, null);
INSERT INTO `exec_item` VALUES ('1410', '2', '10', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1411', '5', '3', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1412', '1', '2', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1413', '2', '9', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1414', '2', '8', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1415', '2', '7', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1416', '2', '6', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1417', '2', '5', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1418', '2', '4', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1419', '2', '3', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1420', '3', '2', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1421', '3', '3', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1422', '3', '4', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1423', '3', '5', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1424', '3', '6', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1425', '3', '7', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1426', '3', '8', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1427', '3', '9', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1428', '2', '2', '2020-05-29 06:25:30', null, null);
INSERT INTO `exec_item` VALUES ('1441', '2', '10', '2020-05-30 10:23:45', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1442', '5', '3', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1443', '1', '2', '2020-05-30 10:59:18', '22', '2020-05-30 10:59:18');
INSERT INTO `exec_item` VALUES ('1444', '2', '9', '2020-05-30 10:23:45', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1445', '2', '8', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1446', '2', '7', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1447', '2', '6', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1448', '2', '5', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1449', '2', '4', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1450', '2', '3', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1451', '3', '2', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1452', '3', '3', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1453', '3', '4', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1454', '3', '5', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1455', '3', '6', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1456', '3', '7', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1457', '3', '8', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1458', '3', '9', '2020-05-30 09:13:50', null, null);
INSERT INTO `exec_item` VALUES ('1459', '2', '2', '2020-05-30 10:23:44', '99', '2020-05-30 10:23:43');
INSERT INTO `exec_item` VALUES ('1460', '2', '10', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1461', '5', '3', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1462', '1', '2', '2020-06-01 18:20:10', '100', '2020-06-01 18:20:10');
INSERT INTO `exec_item` VALUES ('1463', '2', '9', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1464', '2', '8', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1465', '2', '7', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1466', '2', '6', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1467', '2', '5', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1468', '2', '4', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1469', '2', '3', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1470', '3', '2', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1471', '3', '3', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1472', '3', '4', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1473', '3', '5', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1474', '3', '6', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1475', '3', '7', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1476', '3', '8', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1477', '3', '9', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1478', '2', '2', '2020-06-01 18:11:00', null, null);
INSERT INTO `exec_item` VALUES ('1491', '2', '10', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1492', '5', '3', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1493', '1', '2', '2020-06-02 17:20:31', '88', '2020-06-02 17:20:31');
INSERT INTO `exec_item` VALUES ('1494', '2', '9', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1495', '2', '8', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1496', '2', '7', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1497', '2', '6', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1498', '2', '5', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1499', '2', '4', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1500', '2', '3', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1501', '3', '2', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1502', '3', '3', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1503', '3', '4', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1504', '3', '5', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1505', '3', '6', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1506', '3', '7', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1507', '3', '8', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1508', '3', '9', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1509', '2', '2', '2020-06-02 08:33:00', null, null);
INSERT INTO `exec_item` VALUES ('1522', '2', '10', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1523', '5', '3', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1524', '1', '2', '2020-06-03 19:44:42', '100', '2020-06-03 19:44:42');
INSERT INTO `exec_item` VALUES ('1525', '2', '9', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1526', '2', '8', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1527', '2', '7', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1528', '2', '6', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1529', '2', '5', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1530', '2', '4', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1531', '2', '3', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1532', '3', '2', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1533', '3', '3', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1534', '3', '4', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1535', '3', '5', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1536', '3', '6', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1537', '3', '7', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1538', '3', '8', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1539', '3', '9', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1540', '2', '2', '2020-06-03 10:12:00', null, null);
INSERT INTO `exec_item` VALUES ('1541', '2', '10', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1542', '5', '3', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1543', '1', '2', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1544', '2', '9', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1545', '2', '8', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1546', '2', '7', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1547', '2', '6', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1548', '2', '5', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1549', '2', '4', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1550', '2', '3', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1551', '3', '2', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1552', '3', '3', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1553', '3', '4', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1554', '3', '5', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1555', '3', '6', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1556', '3', '7', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1557', '3', '8', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1558', '3', '9', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1559', '2', '2', '2020-06-04 08:22:00', null, null);
INSERT INTO `exec_item` VALUES ('1572', '2', '10', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1573', '5', '3', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1574', '1', '2', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1575', '2', '9', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1576', '2', '8', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1577', '2', '7', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1578', '2', '6', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1579', '2', '5', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1580', '2', '4', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1581', '2', '3', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1582', '3', '2', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1583', '3', '3', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1584', '3', '4', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1585', '3', '5', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1586', '3', '6', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1587', '3', '7', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1588', '3', '8', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1589', '3', '9', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1590', '2', '2', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1591', '4', '80', '2020-06-05 08:23:00', null, null);
INSERT INTO `exec_item` VALUES ('1603', '2', '10', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1604', '5', '3', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1605', '1', '2', '2020-06-06 11:18:55', '100', '2020-06-06 11:18:55');
INSERT INTO `exec_item` VALUES ('1606', '2', '9', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1607', '2', '8', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1608', '2', '7', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1609', '2', '6', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1610', '2', '5', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1611', '2', '4', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1612', '2', '3', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1613', '3', '2', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1614', '3', '3', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1615', '3', '4', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1616', '3', '5', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1617', '3', '6', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1618', '3', '7', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1619', '3', '8', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1620', '3', '9', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1621', '2', '2', '2020-06-06 00:00:03', null, null);
INSERT INTO `exec_item` VALUES ('1622', '4', '80', '2020-06-06 00:00:03', null, null);

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES ('1', '点检标准基准书', 'SQ36A型', 'admin', '2020-05-02');
INSERT INTO `form` VALUES ('2', '切丝机设备润滑标准', 'SQ37A型', 'admin', '2020-05-02');
INSERT INTO `form` VALUES ('3', '切丝机设备保养规范', 'SQ31', 'admin', '2020-05-02');
INSERT INTO `form` VALUES ('4', 'we', 'we', 'we', '2020-05-12');

-- ----------------------------
-- Table structure for `form_item`
-- ----------------------------
DROP TABLE IF EXISTS `form_item`;
CREATE TABLE `form_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `base_id` int DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_name` (`base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_item
-- ----------------------------
INSERT INTO `form_item` VALUES ('1', '1', '刀片', '用量足够，刻度线间距＞1cm', '停机', '眼观', '1次/周', '操作工');
INSERT INTO `form_item` VALUES ('2', '1', '砂轮', '用量足够,刻度线间距＞1cm', '停机', '眼观', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('3', '1', '气动阀门及管路表压', '空压的工作压力＞0.6MPa', '停机、运行', '眼观', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('4', '1', '砂轮运行腔内', '内部无杂物积', '停机', '眼', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('5', '1', '喂料小车', '运行平稳无异音', '运行', '眼观', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('6', '1', '砂轮往复导杆', '运行平稳无抖动，缺油旋转油杯', '停机、运行', '眼观、手感、润滑', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('7', '1', '砂轮电机与砂轮进给', '电机运行振动小无异音，砂轮进给正常', '运行', '眼观、耳听、\n手感、润滑', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('8', '1', '安全保护装置', '齐全、有效', '停机、运行', '试验', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('9', '1', '上、下铜排链', '运行平稳、无异响', '运行', '眼观、耳听', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('10', '1', '金刚石修整器', '金刚石无磨损、运行时磨削火花正常', '运行', '眼看磨削火花', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('11', '1', '刀辊进刀机构', '清洁、润滑、运动灵活', '停机', '换刀时手动，眼观', '换刀时', '操作工');
INSERT INTO `form_item` VALUES ('12', '1', '除尘管路', '无堵塞、吸风量足够', '运行', '眼观、手感', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('13', '1', '设备表面', '保持清洁', '停机', '清吹、擦拭', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('14', '1', '除火花器收集盒', '内部清洁、无烟丝灰尘', '停机', '清理', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('15', '1', '排链收集盒', '内部清洁、无烟丝灰尘', '停机', '清理', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('16', '1', '刀门出料口收集盒', '内部清洁、无烟丝灰尘', '停机', '清理', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('17', '1', '砂轮除尘收集盒', '内部清洁、无烟丝灰尘', '停机', '清理', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('18', '1', '上下左右刀门', '外部清洁、无明显结垢', '停机', '清理、铲刮', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('19', '1', '导丝槽与压刀板', '外部清洁、无明显结垢', '停机', '清理、铲刮', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('20', '1', '磨刀装置、挡尘带、压条', '外部清洁、无明显结垢', '停机', '清理、铲刮', '1次/班', '操作工');
INSERT INTO `form_item` VALUES ('21', '1', '防尘钢带及压条', '无变形、无磨损', '停机、运行', '眼观', '1次/周', '机修工');
INSERT INTO `form_item` VALUES ('22', '1', '砂轮往复链条', '无磨损、无拉长', '停机、运行', '眼观', '1次/周', '机修工');
INSERT INTO `form_item` VALUES ('23', '1', '上下排链与刀门间隙（无图）', '0.5 mm～0.7mm', '停机', '塞规测试', '1次/周', '机修工');
INSERT INTO `form_item` VALUES ('24', '1', '砂轮往复导轨', '润滑足够、无磨损', '停机、运行', '眼观', '1次/周', '机修工');
INSERT INTO `form_item` VALUES ('25', '1', '刀辊与下刀门间隙（无图）', '1mm', '停机', '纸测法', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('26', '1', '进刀机构蜗轮、蜗杆', '无磨损、无卡渍', '运行', '眼观', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('27', '1', '砂轮往复变速箱', '无异响', '运行', '眼观、耳听', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('28', '1', '铜排链', '无磨损、无变形', '停机、运行', '眼观、耳听', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('29', '1', '排链传动链条', '无磨损、无拉长', '停机、运行', '眼观、润滑', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('30', '1', '进刀机构胶木齿轮', '无结垢、无磨损', '停机', '眼观', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('31', '1', '进刀丝杆及轴承', '无磨损、无卡渍', '停机', '眼观、润滑', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('32', '1', '主传动三角带', '无老化、无打滑', '停机', '眼观、手感', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('33', '1', '砂轮往复变速箱同步带', '无磨损', '停机', '眼观', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('34', '1', '空压过滤器', '无积垢', '停机、运行', '拆卸清洗', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('35', '1', '磨刀器燕尾槽', '无磨损、无卡渍', '停机、运行', '眼观', '1次/月', '机修工');
INSERT INTO `form_item` VALUES ('36', '1', '设备各部件（无图）', '将设备传动各部件清洗一次', '停机', '拆卸清洗', '1次/2年', '机修工');
INSERT INTO `form_item` VALUES ('54', '2', '砂轮进给燕尾槽', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '3个月', '机修工');
INSERT INTO `form_item` VALUES ('55', '2', '砂轮往复导杆', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '6个月', '机修工');
INSERT INTO `form_item` VALUES ('56', '2', '砂轮进给丝杆', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '6个月', '机修工');
INSERT INTO `form_item` VALUES ('57', '2', '砂轮往复链条', '充满润滑部位', '停机', '喷刷,润滑剂', '2个月', '机修工');
INSERT INTO `form_item` VALUES ('58', '2', '进刀丝杆', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '1个月', '机修工');
INSERT INTO `form_item` VALUES ('59', '2', '万向节', '充满润滑部位', '停机', '喷刷,润滑剂', '1个月', '机修工');
INSERT INTO `form_item` VALUES ('60', '2', '上下排链传动链条', '充满润滑部位', '停机', '喷刷,润滑剂', '2个月', '机修工');
INSERT INTO `form_item` VALUES ('62', '2', '砂轮进给燕尾槽', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '3个月', '机修工');
INSERT INTO `form_item` VALUES ('63', '2', '砂轮往复导杆', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '6个月', '机修工');
INSERT INTO `form_item` VALUES ('64', '2', '砂轮进给丝杆', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '6个月', '机修工');
INSERT INTO `form_item` VALUES ('65', '2', '砂轮往复链条', '充满润滑部位', '停机', '喷刷,润滑剂', '2个月', '机修工');
INSERT INTO `form_item` VALUES ('66', '2', '进刀丝杆', '充满润滑部位', '停机', '手动加油泵,2号锂基润滑脂等', '1个月', '机修工');
INSERT INTO `form_item` VALUES ('67', '2', '万向节', '充满润滑部位', '停机', '喷刷,润滑剂', '1个月', '机修工');
INSERT INTO `form_item` VALUES ('68', '2', '上下排链传动链条', '充满润滑部位', '停机', '喷刷,润滑剂', '2个月', '机修工');
INSERT INTO `form_item` VALUES ('69', '3', '喂料小车', '无积垢，槽体内外表面光洁', '停机', '退出小车上物料，对送料槽内部先清吹后进行清洗。', null, null);
INSERT INTO `form_item` VALUES ('70', '3', '上下排链', '无积垢，上下排链表面光洁', '停机', '退出排链上剩余料头，对排链槽内积垢进行铲刮和清理。', null, null);
INSERT INTO `form_item` VALUES ('71', '3', '砂轮', '无积垢残留', '停机', '翻下砂轮支架，对砂轮运行空腔内积垢进行清理。', '一次/月', 'test04');
INSERT INTO `form_item` VALUES ('72', '3', '砂轮积灰/收集盒', '无积灰残留', '停机', '拆卸砂轮积灰收集盒，清理内部积灰', null, null);
INSERT INTO `form_item` VALUES ('73', '3', '排链积灰/收集盒', '无烟末残留', '停机', '打开排链积灰收集盒，清理内部残留烟末', null, null);
INSERT INTO `form_item` VALUES ('74', '3', '除火花器/积尘盒', '无烟末残留', '停机', '打开除火花器抽屉，清理内部残留烟末', null, null);
INSERT INTO `form_item` VALUES ('75', '3', '机台/内外表面', '无积灰、无污渍', '停机', '空压清吹、抹布擦拭', null, null);
INSERT INTO `form_item` VALUES ('76', '3', '刀辊体', '标准：外表无积垢', '停机', '铲刮导丝槽，清洗压刀板', null, null);
INSERT INTO `form_item` VALUES ('80', '4', 'sdf', 'dsfgb', 'sdf', 'wsedfg', 'werf', 'werf');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `second` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thirdpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `third` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fourth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fourthpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '后台管理系统所有权限', null, null, null, null, null, null, null, null);
INSERT INTO `role` VALUES ('2', '员工', '', '维护工单', 'client/role/worker/task', 'client/role/worker/stat', '任务统计', 'client/role/worker/feedback', '故障反馈', '历史记录', 'client/role/worker/history');
INSERT INTO `role` VALUES ('3', '技术员', '', '维修工单', 'client/role/tech/task', 'client/role/tech/stat', '维修统计', 'client/role/tech/feedback', '维修反馈', '历史记录', 'client/role/tech/history');
INSERT INTO `role` VALUES ('4', '检查员', '', '检查工单', 'client/role/inspector/task', 'client/role/inspector/stat', '检查统计', 'client/role/inspector/feedback', '检查反馈', '历史记录', 'client/role/inspector/history');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `init` datetime DEFAULT NULL,
  `person` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inspector` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '221#切丝机自主维护', '2020-05-12 09:00:00', '2020-06-05 00:00:00', '2020-05-09 22:26:00', 'test02', 'test06');
INSERT INTO `task` VALUES ('2', '222#切丝机自主维护', '2020-05-12 09:00:00', '2020-06-05 00:00:00', '2020-05-20 16:46:35', 'test02', 'test06');
INSERT INTO `task` VALUES ('3', '223#切丝机自主维护', '2020-05-04 09:00:00', '2020-05-29 00:00:00', '2020-05-04 00:00:00', 'test02', 'test06');
INSERT INTO `task` VALUES ('4', '224#切丝机自主维护', '2020-05-05 09:00:00', '2021-06-05 00:00:00', '2020-05-05 00:00:00', 'test03', 'test07');
INSERT INTO `task` VALUES ('7', 'we', '2020-05-13 09:00:00', '2020-06-06 00:00:00', '2020-05-16 00:00:00', 'wwefdgrtbhjmk,', 'test06');

-- ----------------------------
-- Table structure for `task_item`
-- ----------------------------
DROP TABLE IF EXISTS `task_item`;
CREATE TABLE `task_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_item
-- ----------------------------
INSERT INTO `task_item` VALUES ('1', '1', '1');
INSERT INTO `task_item` VALUES ('2', '2', '10');
INSERT INTO `task_item` VALUES ('3', '3', '46');
INSERT INTO `task_item` VALUES ('4', '4', '36');
INSERT INTO `task_item` VALUES ('5', '5', '3');
INSERT INTO `task_item` VALUES ('6', '1', '2');
INSERT INTO `task_item` VALUES ('7', '2', '9');
INSERT INTO `task_item` VALUES ('8', '2', '8');
INSERT INTO `task_item` VALUES ('9', '2', '7');
INSERT INTO `task_item` VALUES ('10', '2', '6');
INSERT INTO `task_item` VALUES ('11', '2', '5');
INSERT INTO `task_item` VALUES ('12', '2', '4');
INSERT INTO `task_item` VALUES ('13', '2', '3');
INSERT INTO `task_item` VALUES ('15', '2', '1');
INSERT INTO `task_item` VALUES ('16', '3', '1');
INSERT INTO `task_item` VALUES ('17', '3', '2');
INSERT INTO `task_item` VALUES ('18', '3', '3');
INSERT INTO `task_item` VALUES ('19', '3', '4');
INSERT INTO `task_item` VALUES ('20', '3', '5');
INSERT INTO `task_item` VALUES ('21', '3', '6');
INSERT INTO `task_item` VALUES ('22', '3', '7');
INSERT INTO `task_item` VALUES ('23', '3', '8');
INSERT INTO `task_item` VALUES ('24', '3', '9');
INSERT INTO `task_item` VALUES ('25', '4', '35');
INSERT INTO `task_item` VALUES ('26', '4', '34');
INSERT INTO `task_item` VALUES ('27', '4', '33');
INSERT INTO `task_item` VALUES ('28', '4', '32');
INSERT INTO `task_item` VALUES ('29', '4', '31');
INSERT INTO `task_item` VALUES ('30', '4', '30');
INSERT INTO `task_item` VALUES ('31', '2', '2');
INSERT INTO `task_item` VALUES ('32', '5', '69');
INSERT INTO `task_item` VALUES ('33', '5', '70');
INSERT INTO `task_item` VALUES ('37', '3', '60');
INSERT INTO `task_item` VALUES ('40', '5', '55');
INSERT INTO `task_item` VALUES ('41', '5', '56');
INSERT INTO `task_item` VALUES ('42', '5', '57');
INSERT INTO `task_item` VALUES ('43', '5', '58');
INSERT INTO `task_item` VALUES ('44', '5', '59');
INSERT INTO `task_item` VALUES ('45', '5', '60');
INSERT INTO `task_item` VALUES ('46', '5', '62');
INSERT INTO `task_item` VALUES ('47', '5', '63');
INSERT INTO `task_item` VALUES ('48', '7', '74');
INSERT INTO `task_item` VALUES ('49', '1', '67');
INSERT INTO `task_item` VALUES ('50', '1', '68');
INSERT INTO `task_item` VALUES ('51', '4', '80');
INSERT INTO `task_item` VALUES ('52', '4', '69');
INSERT INTO `task_item` VALUES ('53', '4', '70');
INSERT INTO `task_item` VALUES ('54', '4', '71');
INSERT INTO `task_item` VALUES ('55', '7', '76');
INSERT INTO `task_item` VALUES ('57', '7', '71');
INSERT INTO `task_item` VALUES ('58', '7', '72');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `image_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '17788889998', '444444@qq.com', '1', '/upload/1fc681068019a95e5529665a08f70293图片1.jpg');
INSERT INTO `user` VALUES ('2', 'test04', '123456', '17788889999', '444444@qq.com', '2', '/upload/b8503ecf199d32f6e0182856540cd4da1475731373374.jpeg');
INSERT INTO `user` VALUES ('3', 'test02', '123456', '17788889900', '4444999944@qq.com', '2', '/upload/86f3cc55c4642e2c0aa7a332fe234b921475731055855.jpeg');
INSERT INTO `user` VALUES ('4', 'test03', '123456', '12345678910', '444444@qq.com', '2', null);
INSERT INTO `user` VALUES ('5', 'test05', '123456', '17788889999', '444444@qq.com', '3', '/upload/6a8b14076e2c044107ebc3bba310f4fe图片1.jpg');
INSERT INTO `user` VALUES ('6', 'test06', '123456', '17733332222', '4651@qq.com', '4', '/upload/6f256f95cd1af3337a0ebedae64c60bd1475731039450.jpeg');
INSERT INTO `user` VALUES ('9', 'test07', '123456', '12233334444', '941@qq.com', '4', '/upload/b8461a318148fc79074d140d232d080c1475731046999.jpeg');
INSERT INTO `user` VALUES ('10', 'test08', '123456', '18888888888', '8888@qq.com', '4', '/upload/3b5db95a41e4b12419fd6704516a45e31475731049972.jpeg');
