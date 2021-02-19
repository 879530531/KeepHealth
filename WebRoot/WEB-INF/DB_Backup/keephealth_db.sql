/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : keephealth_db

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 09/05/2019 15:00:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人姓名',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作事件',
  `operate_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `upload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件上传路径',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` int(11) NULL DEFAULT NULL COMMENT '操作类型(1.发布新闻 2.发布视频)',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (12, 1, '管理员发布了内容：易道象数养生之家', '2017-05-17 12:14:43', '/upload/resource/2017-05-17/易道象数养生之家.txt', '易道象数养生之家', 1, '国学养生', '/upload/images/2017-05-17/20170517121442309.png');
INSERT INTO `content` VALUES (13, 14, '李智明发布了内容：漫画版《易经》一看就懂！很难得，建议收藏！', '2017-05-17 15:58:35', '/upload/resource/2017-05-17/漫画版《易经》一看就懂！很难得，建议收藏！4.txt', '漫画版《易经》一看就懂！很难得，建议收藏！', 1, '漫画版《易经》', '/upload/images//2017-05-17/20170517155835262.png');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_cod` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `dept_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `dept_unit` varchar(51) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES (1, '10001', '服务管理部', '服务本部');
INSERT INTO `sys_department` VALUES (2, '10002', '人力资源部', '资源调配部');
INSERT INTO `sys_department` VALUES (3, '10003', '管理分部', '综合管理部');

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号（关联用户表）',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `login_ip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆IP',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  `operate_content` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作内容',
  `operate_type` int(11) NULL DEFAULT NULL COMMENT '操作类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1756 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
INSERT INTO `sys_login_record` VALUES (8, '1', 'admin', '127.0.0.1', '2017-02-28 22:09:54', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (9, '1', 'admin', '127.0.0.1', '2017-02-28 22:10:09', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (10, '1', 'admin', '127.0.0.1', '2017-02-28 22:11:51', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (11, '1', 'admin', '127.0.0.1', '2017-02-28 22:13:32', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (12, '1', 'admin', '127.0.0.1', '2017-02-28 22:13:43', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (13, '1', 'admin', '127.0.0.1', '2017-02-28 22:17:06', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (15, '1', 'admin', '127.0.0.1', '2017-02-28 22:17:46', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (17, '1', 'admin', 'fe80:0:0:0:8d2c:aa5:b136:2a50', '2017-02-28 22:28:27', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (21, '1', 'admin', 'fe80:0:0:0:8d2c:aa5:b136:2a50', '2017-02-28 22:28:30', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (22, '1', 'admin', 'fe80:0:0:0:8d2c:aa5:b136:2a50', '2017-02-28 22:28:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (23, '1', '123', '0:0:0:0:0:0:0:1', '2017-02-28 22:36:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (24, '1', '123', '0:0:0:0:0:0:0:1', '2017-02-28 22:36:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (25, 'admin', 'admin', '127.0.0.1', '2017-03-07 22:57:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (26, 'admin', 'admin', '127.0.0.1', '2017-03-08 16:12:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (27, 'admin', 'admin', '127.0.0.1', '2017-03-08 16:23:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (28, '10001', 'admin', '127.0.0.1', '2017-03-08 16:25:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (29, '10001', 'admin', '127.0.0.1', '2017-03-08 17:05:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (30, '10001', 'admin', '127.0.0.1', '2017-03-08 17:07:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (31, '10001', 'admin', '127.0.0.1', '2017-03-08 17:10:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (32, '10001', 'admin', '127.0.0.1', '2017-03-08 20:16:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (33, '10001', 'admin', '127.0.0.1', '2017-03-08 20:17:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (34, '10001', 'admin', '127.0.0.1', '2017-03-08 20:17:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (35, '10001', 'admin', '127.0.0.1', '2017-03-08 20:22:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (36, '10001', 'admin', '127.0.0.1', '2017-03-08 20:25:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (37, '10001', 'admin', '127.0.0.1', '2017-03-08 20:27:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (38, '10001', 'admin', '127.0.0.1', '2017-03-08 20:27:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (39, '10001', 'admin', '127.0.0.1', '2017-03-08 20:28:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (40, '10001', 'admin', '127.0.0.1', '2017-03-08 20:33:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (41, '10001', 'admin', '127.0.0.1', '2017-03-08 20:34:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (42, '10001', 'admin', '127.0.0.1', '2017-03-08 20:35:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (43, '10001', 'admin', '127.0.0.1', '2017-03-08 20:36:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (44, '10001', 'admin', '127.0.0.1', '2017-03-08 20:37:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (45, '10001', 'admin', '127.0.0.1', '2017-03-08 20:38:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (46, '10001', 'admin', '127.0.0.1', '2017-03-08 20:43:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (47, '10001', 'admin', '127.0.0.1', '2017-03-08 20:44:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (48, '10001', 'admin', '127.0.0.1', '2017-03-08 20:46:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (49, '10001', 'admin', '127.0.0.1', '2017-03-08 20:48:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (50, '10001', 'admin', '127.0.0.1', '2017-03-08 20:50:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (51, '10001', 'admin', '127.0.0.1', '2017-03-08 20:51:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (52, '10001', 'admin', '127.0.0.1', '2017-03-08 20:52:28', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (53, '10001', 'admin', '127.0.0.1', '2017-03-08 20:52:30', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (54, '10001', 'admin', '127.0.0.1', '2017-03-08 20:52:31', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (55, '10001', 'admin', '127.0.0.1', '2017-03-08 20:52:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (56, '10001', 'admin', '127.0.0.1', '2017-03-08 20:54:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (57, '10001', 'admin', '127.0.0.1', '2017-03-08 21:21:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (58, '10001', 'admin', '127.0.0.1', '2017-03-09 20:12:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (59, '10001', 'admin', '127.0.0.1', '2017-03-09 20:34:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (60, '10001', 'admin', '127.0.0.1', '2017-03-09 20:57:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (61, '10001', 'admin', '127.0.0.1', '2017-03-09 20:59:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (62, '10001', 'admin', '127.0.0.1', '2017-03-09 21:06:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (63, '10001', 'admin', '127.0.0.1', '2017-03-09 21:07:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (64, '10001', 'admin', '127.0.0.1', '2017-03-09 21:22:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (65, '10001', 'admin', '127.0.0.1', '2017-03-09 21:23:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (66, '10001', 'admin', '127.0.0.1', '2017-03-09 21:37:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (67, '10001', 'admin', '127.0.0.1', '2017-03-09 21:38:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (68, '10001', 'admin', '127.0.0.1', '2017-03-09 21:50:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (69, '10001', 'admin', '127.0.0.1', '2017-03-09 21:55:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (70, '10001', 'admin', '127.0.0.1', '2017-03-09 21:56:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (71, '10001', 'admin', '127.0.0.1', '2017-03-09 22:01:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (72, '10001', 'admin', '127.0.0.1', '2017-03-09 22:02:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (73, '10001', 'admin', '127.0.0.1', '2017-03-09 22:03:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (74, '10001', 'admin', '127.0.0.1', '2017-03-09 22:09:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (75, '10001', 'admin', '127.0.0.1', '2017-03-10 10:42:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (76, '10001', 'root', '127.0.0.1', '2017-03-10 17:19:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (77, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 10:33:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (78, '10001', 'root', '127.0.0.1', '2017-03-11 10:44:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (79, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 10:55:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (80, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 10:58:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (81, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 11:14:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (82, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 12:36:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (83, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 14:10:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (84, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-11 18:18:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (85, '10001', 'root', '0:0:0:0:0:0:0:1', '2017-03-12 13:46:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (86, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-14 17:23:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (87, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-14 17:33:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (88, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-14 17:37:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (89, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-14 17:50:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (90, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 00:43:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (91, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 00:45:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (92, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 00:49:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (93, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 15:29:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (94, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 15:45:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (95, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 16:22:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (96, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 16:32:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (97, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 16:38:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (98, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 16:52:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (99, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 17:02:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (100, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 17:04:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (101, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 17:19:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (102, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 17:23:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (103, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 17:25:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (104, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 17:52:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (105, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 18:04:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (106, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-15 18:05:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (107, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 20:35:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (108, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 21:06:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (109, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 21:49:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (110, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 21:55:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (111, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 21:58:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (112, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 22:22:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (113, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 22:22:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (114, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 22:30:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (115, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 22:33:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (116, '10001', 'admin', '127.0.0.1', '2017-03-16 22:37:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (117, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-16 22:49:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (118, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-17 01:18:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (119, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-17 01:18:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (120, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-17 01:19:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (121, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-17 12:33:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (122, '10001', 'admin', 'fe80:0:0:0:995:5390:775:c1e0', '2017-03-18 14:26:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (123, '10001', 'admin', '192.168.1.103', '2017-03-19 13:46:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (124, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-21 00:02:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (125, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 13:19:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (126, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 13:35:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (127, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 20:11:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (128, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 20:11:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (129, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 20:26:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (130, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 22:06:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (131, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-23 22:56:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (132, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 11:14:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (133, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 11:18:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (134, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 12:47:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (135, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 12:50:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (136, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 12:54:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (137, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 16:57:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (138, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 18:43:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (139, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 18:46:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (140, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 18:47:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (141, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 18:54:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (142, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 19:00:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (143, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 19:20:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (144, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 19:24:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (145, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 19:25:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (146, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 21:47:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (147, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 21:52:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (148, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 21:55:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (149, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 21:58:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (150, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:03:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (151, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:06:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (152, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:12:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (153, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:15:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (154, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:32:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (155, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:33:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (156, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:56:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (157, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 22:57:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (158, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:07:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (159, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:15:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (160, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:16:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (161, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:19:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (162, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:24:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (163, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:28:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (164, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-24 23:29:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (165, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:15:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (166, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:21:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (167, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:23:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (168, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:24:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (169, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:25:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (170, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:27:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (171, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:27:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (172, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:29:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (173, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:45:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (174, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:47:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (175, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 02:49:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (176, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 03:00:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (177, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 03:02:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (178, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 03:02:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (179, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 03:04:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (180, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:03:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (181, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:03:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (182, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:05:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (183, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:05:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (184, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:09:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (185, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:42:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (186, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 11:50:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (187, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:08:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (188, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:16:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (189, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:21:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (190, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:23:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (191, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:24:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (192, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:32:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (193, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:37:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (194, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:52:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (195, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:56:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (196, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 12:57:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (197, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:02:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (198, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:09:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (199, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:10:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (200, '10001', 'admin', '127.0.0.1', '2017-03-25 13:13:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (201, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:26:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (202, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:30:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (203, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:35:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (204, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:37:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (205, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:40:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (206, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:47:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (207, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 13:58:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (208, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:01:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (209, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:02:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (210, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:06:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (211, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:07:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (212, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:10:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (213, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:33:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (214, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:35:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (215, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:38:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (216, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:38:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (217, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 14:42:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (218, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 15:54:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (219, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 16:02:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (220, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 16:06:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (221, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 16:10:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (222, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 16:25:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (223, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 21:24:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (224, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 22:06:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (225, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 22:10:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (226, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 22:20:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (227, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:02:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (228, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:29:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (229, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:30:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (230, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:35:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (231, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:39:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (232, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:43:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (233, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:44:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (234, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:45:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (235, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:45:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (236, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:47:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (237, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-25 23:50:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (238, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 00:12:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (239, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 00:20:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (240, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 00:24:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (241, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 00:28:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (242, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 00:35:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (243, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 01:56:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (244, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 02:04:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (245, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 02:16:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (246, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 02:27:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (247, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:29:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (248, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:32:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (249, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:33:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (250, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:34:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (251, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:35:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (252, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:36:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (253, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-26 15:40:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (254, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:00:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (255, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:16:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (256, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:18:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (257, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:20:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (258, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:23:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (259, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:25:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (260, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:26:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (261, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:27:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (262, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:33:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (263, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:35:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (264, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 02:48:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (265, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 03:38:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (266, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 03:42:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (267, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 03:43:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (268, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:02:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (269, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:04:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (270, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:07:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (271, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:08:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (272, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:10:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (273, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:11:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (274, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:16:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (275, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:19:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (276, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:26:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (277, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:29:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (278, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:33:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (279, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:36:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (280, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:45:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (281, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 04:58:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (282, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:06:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (283, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:39:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (284, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:41:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (285, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:43:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (286, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:46:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (287, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:49:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (288, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:51:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (289, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:53:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (290, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:54:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (291, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 05:58:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (292, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:01:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (293, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:02:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (294, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:04:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (295, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:28:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (296, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:31:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (297, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:34:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (298, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:48:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (299, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:54:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (300, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:57:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (301, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-27 06:59:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (302, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 11:06:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (303, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 19:12:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (304, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 19:23:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (305, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 19:25:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (306, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 20:43:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (307, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 20:45:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (308, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 20:50:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (309, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 20:59:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (310, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 21:02:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (311, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 21:04:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (312, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 21:20:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (313, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 21:22:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (314, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 21:24:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (315, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-28 22:37:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (316, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 01:22:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (317, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 01:53:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (318, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 05:30:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (319, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 10:41:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (320, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 10:44:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (321, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 10:45:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (322, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 12:01:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (323, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 12:07:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (324, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-29 12:15:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (325, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 14:59:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (326, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:07:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (327, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:08:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (328, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:17:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (329, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:25:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (330, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:28:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (331, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:29:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (332, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:30:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (333, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:32:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (334, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 15:50:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (335, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 16:22:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (336, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 17:25:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (337, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 17:28:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (338, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 17:32:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (339, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 18:23:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (340, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 18:25:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (341, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 18:30:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (342, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 18:53:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (343, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 18:57:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (344, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 18:58:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (345, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 19:02:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (346, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 19:10:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (347, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 19:13:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (348, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 19:14:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (349, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 19:32:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (350, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-03-31 19:36:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (351, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-03 18:18:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (352, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-03 20:21:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (353, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-03 20:31:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (354, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 00:29:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (355, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 00:32:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (356, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 14:51:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (357, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:22:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (358, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:22:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (359, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:24:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (360, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:26:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (361, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:36:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (362, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:38:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (363, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:46:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (364, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:48:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (365, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:50:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (366, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:57:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (367, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 15:58:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (368, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:00:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (369, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:03:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (370, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:07:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (371, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:09:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (372, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:11:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (373, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:12:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (374, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-04 16:26:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (375, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:12:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (376, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:27:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (377, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:29:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (378, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:32:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (379, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:38:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (380, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:39:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (381, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:42:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (382, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:44:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (383, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:49:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (384, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 00:54:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (385, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 01:01:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (386, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 01:05:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (387, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:25:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (388, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:41:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (389, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:42:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (390, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:44:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (391, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:46:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (392, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:49:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (393, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:51:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (394, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:52:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (395, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 18:53:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (396, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 19:20:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (397, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 19:23:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (398, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-05 19:28:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (399, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:20:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (400, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:23:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (401, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:24:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (402, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:25:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (403, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:26:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (404, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:31:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (405, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:33:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (406, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:35:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (407, '10001', 'admin', 'fe80:0:0:0:49d8:f77c:c6f5:fabc', '2017-04-12 10:38:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (408, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:38:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (409, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:39:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (410, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 10:39:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (411, '10001', 'admin', 'fe80:0:0:0:49d8:f77c:c6f5:fabc', '2017-04-12 10:40:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (412, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 11:22:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (413, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 11:25:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (414, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 11:26:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (415, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 11:27:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (416, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 11:28:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (417, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 11:32:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (418, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 12:24:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (419, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 12:25:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (420, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 13:43:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (421, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:07:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (422, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:12:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (423, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:25:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (424, '10001', 'admin', 'fe80:0:0:0:49d8:f77c:c6f5:fabc', '2017-04-12 14:39:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (425, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:39:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (426, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:43:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (427, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:47:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (428, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:57:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (429, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 14:57:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (430, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 20:32:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (431, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 20:34:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (432, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 20:35:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (433, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 20:36:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (434, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 20:54:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (435, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 20:54:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (436, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:04:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (437, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:21:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (438, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:23:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (439, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:30:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (440, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:32:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (441, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:33:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (442, '18378510670', 'bcc', '0:0:0:0:0:0:0:1', '2017-04-12 21:44:23', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (443, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:44:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (444, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:47:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (445, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:50:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (446, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:50:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (447, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:51:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (448, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:51:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (449, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:54:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (450, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-12 21:57:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (451, '10001', 'admin', '127.0.0.1', '2017-04-14 16:52:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (452, '10001', 'admin', '127.0.0.1', '2017-04-14 17:27:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (453, '10001', 'admin', '127.0.0.1', '2017-04-14 17:39:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (454, '10001', 'admin', '127.0.0.1', '2017-04-14 18:12:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (455, '10001', 'admin', '127.0.0.1', '2017-04-14 22:12:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (456, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:13:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (457, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:20:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (458, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:22:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (459, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:24:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (460, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:31:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (461, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:31:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (462, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:38:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (463, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:41:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (464, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:42:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (465, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:43:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (466, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:44:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (467, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:46:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (468, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:47:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (469, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:48:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (470, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:53:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (471, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:55:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (472, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 01:57:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (473, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:00:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (474, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:02:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (475, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:02:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (476, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:03:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (477, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:04:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (478, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:05:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (479, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:07:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (480, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:08:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (481, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:08:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (482, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:08:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (483, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:10:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (484, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:11:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (485, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-15 02:48:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (486, '10001', 'admin', '127.0.0.1', '2017-04-16 14:48:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (487, '10001', 'admin', '127.0.0.1', '2017-04-17 20:47:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (488, '10001', 'admin', '127.0.0.1', '2017-04-17 20:58:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (489, '10001', 'admin', '127.0.0.1', '2017-04-17 20:59:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (490, '10001', 'admin', '127.0.0.1', '2017-04-17 21:00:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (491, '10001', 'admin', '127.0.0.1', '2017-04-17 21:14:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (492, '10001', 'admin', '127.0.0.1', '2017-04-17 21:49:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (493, '10001', 'admin', '127.0.0.1', '2017-04-17 23:49:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (494, '10001', 'root', '127.0.0.1', '2017-04-17 23:51:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (495, '10001', 'root', '127.0.0.1', '2017-04-18 00:02:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (496, '10001', 'root', '127.0.0.1', '2017-04-18 00:08:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (497, '10001', 'root', '127.0.0.1', '2017-04-18 00:10:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (498, '10001', 'root', '127.0.0.1', '2017-04-18 00:13:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (499, '10001', 'root', '127.0.0.1', '2017-04-18 00:19:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (500, '10001', 'root', '127.0.0.1', '2017-04-18 00:20:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (501, '10001', 'root', '127.0.0.1', '2017-04-18 12:01:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (502, '10001', 'root', '127.0.0.1', '2017-04-18 16:31:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (503, '10001', 'admin', '127.0.0.1', '2017-04-19 22:20:09', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (504, '10001', 'admin', '127.0.0.1', '2017-04-19 22:20:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (505, '10001', 'admin', '127.0.0.1', '2017-04-19 22:23:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (506, '10001', 'admin', '127.0.0.1', '2017-04-19 22:26:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (507, '10001', 'admin', '127.0.0.1', '2017-04-20 20:34:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (508, '10001', 'admin', '127.0.0.1', '2017-04-20 20:46:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (509, '10001', 'admin', '127.0.0.1', '2017-04-21 23:56:32', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (510, '10001', 'admin', '127.0.0.1', '2017-04-21 23:56:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (511, '10001', 'admin', '127.0.0.1', '2017-04-21 23:57:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (512, '10001', 'admin', '127.0.0.1', '2017-04-21 23:59:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (513, '10001', 'admin', '127.0.0.1', '2017-04-23 19:32:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (514, '10002', 'teacherAdmin', '127.0.0.1', '2017-04-23 20:40:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (515, '10001', 'admin', '127.0.0.1', '2017-04-23 20:41:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (516, '10002', 'teacherAdmin', '127.0.0.1', '2017-04-23 20:56:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (517, '10001', 'admin', '127.0.0.1', '2017-04-23 20:56:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (518, '10002', 'teacherAdmin', '127.0.0.1', '2017-04-23 21:04:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (519, '10001', 'admin', '127.0.0.1', '2017-04-23 21:05:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (520, '10001', 'admin', '127.0.0.1', '2017-04-23 21:35:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (521, '10002', 'teacherAdmin', '127.0.0.1', '2017-04-23 21:36:03', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (522, '10002', 'teacherAdmin', '127.0.0.1', '2017-04-23 21:36:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (523, '10001', 'admin', '127.0.0.1', '2017-04-26 21:40:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (524, '10001', 'admin', '127.0.0.1', '2017-04-26 21:41:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (525, '10001', 'admin', '127.0.0.1', '2017-04-26 21:42:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (526, '10002', 'teacherAdmin', '127.0.0.1', '2017-04-26 21:49:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (527, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-04-27 06:37:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (528, '201700208401', '李智明', '124.226.166.188', '2017-04-27 09:19:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (529, '201700208401', '李智明', '124.226.166.188', '2017-04-27 09:20:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (530, '201700208401', '李智明', '124.226.166.188', '2017-04-27 09:46:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (531, '201700208401', '李智明', '124.226.166.188', '2017-04-27 10:04:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (532, '201700208401', '李智明', '124.226.166.188', '2017-04-27 10:04:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (533, '201700208401', '李智明', '124.226.166.188', '2017-04-27 10:53:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (534, '201700208401', '李智明', '124.226.166.188', '2017-04-27 11:12:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (535, '201700208401', '李智明', '124.226.166.188', '2017-04-27 11:39:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (536, '201700208401', '李智明', '124.226.166.188', '2017-04-27 11:40:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (537, '201700208401', '李智明', '124.226.166.188', '2017-04-27 13:08:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (538, '201700208401', '李智明', '124.226.166.188', '2017-04-27 13:11:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (539, '201700208401', '李智明', '124.226.166.188', '2017-04-27 15:11:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (540, '201700208401', '李智明', '124.226.166.188', '2017-04-27 16:10:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (541, '201700208401', '李智明', '124.226.166.188', '2017-04-27 17:02:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (542, '201700208401', '李智明', '124.226.166.188', '2017-04-27 17:03:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (543, '201700208401', '李智明', '124.226.166.188', '2017-04-27 17:12:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (544, '201700208401', '李智明', '113.15.26.41', '2017-04-27 17:50:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (545, '10001', 'admin', '222.217.220.226', '2017-04-27 18:09:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (546, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:11:13', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (547, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:11:22', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (548, '10001', 'admin', '222.217.220.226', '2017-04-27 18:11:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (549, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:18:27', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (550, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:18:52', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (551, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:20:18', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (552, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:20:23', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (553, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:20:42', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (554, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:20:53', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (555, '10002', 'teacherAdmin', '222.217.220.226', '2017-04-27 18:21:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (556, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:21:53', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (557, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:22:07', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (558, '201700208401', '李智明', '222.217.220.226', '2017-04-27 18:22:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (559, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:23:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (560, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:24:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (561, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:31:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (562, '201700208401', '李智明', '113.15.26.41', '2017-04-27 18:42:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (563, '201700208401', '李智明', '124.226.166.188', '2017-04-27 19:39:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (564, '10001', 'admin', '121.31.67.157', '2017-04-27 20:20:06', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (565, '10001', 'admin', '121.31.67.157', '2017-04-27 20:20:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (566, '10001', 'admin', '121.31.67.157', '2017-04-27 21:28:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (567, '201700208401', '李智明', '124.226.166.188', '2017-04-27 22:20:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (568, '201700208401', '李智明', '124.226.166.188', '2017-04-27 22:20:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (569, '201700208401', '李智明', '124.226.166.188', '2017-04-28 10:50:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (570, '201700208401', '李智明', '124.226.166.188', '2017-04-28 17:03:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (571, '201700208401', '李智明', '124.226.166.188', '2017-04-28 23:20:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (572, '201700208401', '李智明', '124.226.166.188', '2017-04-28 23:28:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (573, '201700208401', '李智明', '124.226.166.188', '2017-04-28 23:31:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (574, '201700208401', '李智明', '124.226.166.188', '2017-04-28 23:34:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (575, '201700208401', '李智明', '124.226.166.188', '2017-04-29 00:08:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (576, '10001', 'admin', '182.90.60.223', '2017-04-29 08:16:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (577, '10001', 'admin', '182.90.60.223', '2017-04-29 08:32:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (578, '201700208401', '李智明', '124.226.166.188', '2017-04-29 08:51:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (579, '201700208401', '李智明', '124.226.166.188', '2017-04-30 21:06:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (580, '201700208401', '李智明', '124.226.166.188', '2017-05-01 08:05:10', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (581, '201700208401', '李智明', '124.226.166.188', '2017-05-01 08:05:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (582, '201700208401', '李智明', '124.226.166.188', '2017-05-01 08:44:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (583, '201700208401', '李智明', '124.226.166.188', '2017-05-01 08:58:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (584, '201700208401', '李智明', '124.226.166.188', '2017-05-01 09:18:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (585, '201700208401', '李智明', '124.226.166.188', '2017-05-01 09:51:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (586, '10001', 'admin', '119.134.220.20', '2017-05-01 10:05:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (587, '201700208401', '李智明', '171.105.157.196', '2017-05-01 10:13:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (588, '201700208401', '李智明', '171.105.157.196', '2017-05-01 10:15:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (589, '201700208401', '李智明', '113.15.14.46', '2017-05-01 11:51:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (590, '201700208401', '李智明', '113.15.14.46', '2017-05-01 12:18:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (591, '201700208401', '李智明', '113.15.14.46', '2017-05-01 12:22:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (592, '10001', 'admin', '119.134.220.20', '2017-05-01 12:52:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (593, '201700208401', '李智明', '113.15.14.46', '2017-05-01 16:09:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (594, '201700208401', '李智明', '124.226.165.176', '2017-05-01 22:06:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (595, '10001', 'admin', '119.134.220.20', '2017-05-02 00:22:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (596, '10001', 'admin', '182.90.28.136', '2017-05-03 05:57:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (597, '10001', 'admin', '124.227.230.85', '2017-05-03 08:23:40', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (598, '10001', 'admin', '124.227.230.85', '2017-05-03 08:23:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (599, '201700208401', '李智明', '124.226.166.132', '2017-05-03 10:09:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (600, '10001', 'admin', '124.227.230.85', '2017-05-03 10:42:43', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (601, '10001', 'admin', '124.227.230.85', '2017-05-03 10:42:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (602, '10001', 'admin', '182.90.28.136', '2017-05-03 14:17:39', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (603, '10001', 'admin', '182.90.28.136', '2017-05-03 14:17:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (604, '201700208401', '李智明', '113.15.0.156', '2017-05-03 17:49:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (605, '201700208401', '李智明', '116.9.134.79', '2017-05-04 09:25:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (606, '10001', 'admin', '222.217.220.226', '2017-05-04 17:04:55', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (607, '10001', 'admin', '222.217.220.226', '2017-05-04 17:05:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (608, '10001', 'admin', '222.217.220.226', '2017-05-04 17:16:51', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (609, '10001', 'admin', '222.217.220.226', '2017-05-04 17:16:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (610, '10001', 'admin', '222.217.220.226', '2017-05-04 17:18:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (611, '10001', 'admin', '182.90.54.62', '2017-05-04 17:33:50', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (612, '10001', 'admin', '182.90.54.62', '2017-05-04 17:33:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (613, '10001', 'admin', '121.31.67.157', '2017-05-04 20:48:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (614, '10001', 'admin', '121.31.67.157', '2017-05-04 20:49:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (615, '201700208401', '李智明', '124.226.166.230', '2017-05-05 11:13:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (616, '10001', 'admin', '182.90.54.62', '2017-05-05 12:51:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (617, '201700208401', '李智明', '182.90.54.62', '2017-05-05 12:52:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (618, '10001', 'admin', '124.226.161.20', '2017-05-05 12:54:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (619, '201700208401', '李智明', '124.226.166.230', '2017-05-05 14:10:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (620, '201700208401', '李智明', '171.105.118.110', '2017-05-05 17:36:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (621, '201700208401', '李智明', '171.105.118.110', '2017-05-05 18:24:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (622, '201700208401', '李智明', '124.226.166.230', '2017-05-05 20:12:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (623, '201700208401', '李智明', '182.90.54.62', '2017-05-05 22:38:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (624, '201700208401', '李智明', '113.15.1.35', '2017-05-06 18:26:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (625, '201700208401', '李智明', '124.226.164.169', '2017-05-08 14:40:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (626, '201700208401', '李智明', '124.226.164.169', '2017-05-09 17:12:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (627, '201700208401', '李智明', '124.226.164.169', '2017-05-11 09:15:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (628, '201700208401', '李智明', '124.226.164.169', '2017-05-12 12:08:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (629, '201700208401', '李智明', '124.226.164.169', '2017-05-13 17:02:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (630, '201700208401', '李智明', '124.226.164.169', '2017-05-13 17:53:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (631, '201700208401', '李智明', '124.226.164.169', '2017-05-14 17:20:13', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (632, '201700208401', '李智明', '124.226.164.169', '2017-05-14 17:20:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (633, '10001', 'admin', '182.90.67.98', '2017-05-15 03:21:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (634, '10001', 'admin', '182.90.67.98', '2017-05-15 16:24:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (635, '10001', 'admin', '182.90.67.98', '2017-05-15 16:30:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (636, '10001', 'admin', '182.90.67.98', '2017-05-15 16:38:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (637, '10001', 'admin', '182.90.67.98', '2017-05-15 16:40:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (638, '10001', 'admin', '182.90.67.98', '2017-05-15 17:04:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (639, '201700208401', '李智明', '182.90.67.98', '2017-05-15 19:04:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (640, '10001', 'admin', '182.90.20.14', '2017-05-15 19:04:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (641, '10001', 'admin', '182.90.20.14', '2017-05-15 19:13:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (642, '10001', 'admin', '182.90.20.14', '2017-05-15 19:19:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (643, '201700208401', '李智明', '182.90.67.98', '2017-05-15 19:25:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (644, '10001', 'admin', '182.90.20.14', '2017-05-15 19:36:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (645, '10001', 'admin', '222.217.220.226', '2017-05-16 23:03:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (646, '201700208401', '李智明', '116.9.133.222', '2017-05-17 07:14:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (647, '10001', 'admin', '222.217.220.226', '2017-05-17 09:00:04', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (648, '10001', 'admin', '222.217.220.226', '2017-05-17 09:00:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (649, '10001', 'admin', '222.217.220.226', '2017-05-17 11:45:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (650, '10001', 'admin', '182.90.73.103', '2017-05-17 12:10:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (651, '20170415034254110010', '18078743472', '127.0.0.1', '2017-05-17 14:46:16', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (652, '20170415034254110010', '18078743472', '127.0.0.1', '2017-05-17 14:47:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (653, '10001', 'admin', '127.0.0.1', '2017-05-17 14:47:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (654, '20170415034254110010', '18078743472', '127.0.0.1', '2017-05-17 14:50:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (655, '201700208401', '李智明', '116.9.133.222', '2017-05-17 15:39:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (656, '201700208401', '李智明', '116.9.133.222', '2017-05-17 15:57:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (657, '201700208401', '李智明', '116.9.133.222', '2017-05-17 16:20:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (658, '10001', 'admin', '182.90.73.103', '2017-05-17 16:37:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (659, '10001', 'admin', '182.90.73.103', '2017-05-17 16:47:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (660, '20170415034254110010', '18078743472', '182.90.73.103', '2017-05-17 16:59:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (661, '20170415034254110010', '18078743472', '182.90.73.103', '2017-05-17 17:06:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (662, '10001', 'admin', '182.90.73.103', '2017-05-17 17:06:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (663, '10001', 'admin', '182.90.73.103', '2017-05-17 17:12:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (664, '20170415034254110010', '18078743472', '182.90.73.103', '2017-05-17 17:12:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (665, '10001', 'admin', '182.90.73.103', '2017-05-17 17:14:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (666, '20170415034254110010', '18078743472', '182.90.73.103', '2017-05-17 17:14:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (667, '20170415034254110010', '18078743472', '182.90.27.154', '2017-05-17 17:16:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (668, '10001', 'admin', '182.90.27.154', '2017-05-17 17:17:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (669, '10001', 'admin', '182.90.73.103', '2017-05-17 17:19:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (670, '10001', 'admin', '182.90.73.103', '2017-05-17 17:23:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (671, '20170415034254110010', '18078743472', '182.90.73.103', '2017-05-17 17:23:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (672, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:55:59', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (673, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:56:09', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (674, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:56:26', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (675, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:57:00', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (676, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:57:24', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (677, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:57:33', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (678, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:57:55', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (679, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:58:08', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (680, '201700208401', '李智明', '116.9.133.222', '2017-05-17 19:59:44', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (681, '201700208401', '李智明', '182.90.73.103', '2017-05-17 20:00:36', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (682, '201700208401', '李智明', '182.90.73.103', '2017-05-17 20:03:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (683, '201700208401', '李智明', '116.9.133.222', '2017-05-17 20:05:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (684, '201700208401', '李智明', '182.90.73.103', '2017-05-17 20:59:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (685, '201700208401', '李智明', '116.9.133.222', '2017-05-17 22:20:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (686, '201700208401', '李智明', '182.90.73.103', '2017-05-17 22:21:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (687, '20170415034254110010', '18078743472', '182.90.73.103', '2017-05-17 22:21:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (688, '201700208401', '李智明', '116.9.133.222', '2017-05-17 22:54:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (689, '10001', 'admin', '182.90.73.103', '2017-05-17 23:41:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (690, '10001', 'admin', '182.90.73.103', '2017-05-17 23:46:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (691, '10001', 'admin', '182.90.73.103', '2017-05-17 23:47:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (692, '10001', 'admin', '182.90.73.103', '2017-05-18 09:49:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (693, '201700208401', '李智明', '116.9.133.222', '2017-05-18 10:58:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (694, '201700208401', '李智明', '116.9.133.222', '2017-05-18 22:22:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (695, '201700208401', '李智明', '116.9.133.222', '2017-05-19 15:09:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (696, '201700208401', '李智明', '116.9.133.222', '2017-05-19 16:00:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (697, '201700208401', '李智明', '116.9.133.222', '2017-05-19 21:53:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (698, '201700208401', '李智明', '116.9.133.222', '2017-05-20 11:11:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (699, '201700208401', '李智明', '116.9.133.222', '2017-05-22 10:38:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (700, '10001', 'admin', '222.217.220.232', '2017-05-22 10:49:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (701, '201700208401', '李智明', '116.9.133.222', '2017-05-22 11:42:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (702, '201700208401', '李智明', '116.9.133.222', '2017-05-22 16:12:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (703, '10001', 'admin', '222.217.220.232', '2017-05-23 08:46:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (704, '201700208401', '李智明', '125.73.117.164', '2017-05-26 10:09:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (705, '10001', 'admin', '222.217.220.226', '2017-05-26 11:17:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (706, '10001', 'admin', '182.90.43.164', '2017-05-26 15:14:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (707, '10001', 'admin', '182.90.43.164', '2017-05-26 15:14:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (708, '10001', 'admin', '182.90.43.164', '2017-05-26 15:17:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (709, '10001', 'admin', '118.254.201.73', '2017-05-27 03:51:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (710, '201700208401', '李智明', '125.73.117.164', '2017-05-27 07:14:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (711, '201700208401', '李智明', '125.73.117.164', '2017-05-27 09:27:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (712, '201700208401', '李智明', '125.73.117.164', '2017-05-27 11:34:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (713, '201700208401', '李智明', '125.73.117.164', '2017-05-28 21:16:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (714, '201700208401', '李智明', '124.226.164.133', '2017-06-01 20:39:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (715, '10001', 'admin', '182.90.96.211', '2017-06-03 10:36:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (716, '10001', 'admin', '182.90.96.211', '2017-06-03 10:58:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (717, '20170415034254110010', '18078743472', '182.90.96.211', '2017-06-03 10:59:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (718, '10001', 'admin', '182.90.96.211', '2017-06-03 11:00:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (719, '20170415034254110010', '18078743472', '182.90.96.211', '2017-06-03 11:04:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (720, '201700208401', '李智明', '124.226.164.133', '2017-06-03 21:45:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (721, '201700208401', '李智明', '124.226.164.133', '2017-06-04 11:52:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (722, '201700208401', '李智明', '125.73.117.62', '2017-06-09 10:53:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (723, '10001', 'admin', '113.15.8.200', '2017-06-09 13:52:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (724, '10001', 'admin', '182.90.128.106', '2017-06-09 14:06:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (725, '201700208401', '李智明', '125.73.117.62', '2017-06-09 15:59:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (726, '10001', 'admin', '182.90.128.20', '2017-06-10 18:35:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (727, '201700208401', '李智明', '171.110.246.185', '2017-06-11 10:22:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (728, '201700208401', '李智明', '116.9.132.57', '2017-06-12 20:18:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (729, '201700208401', '李智明', '116.9.132.57', '2017-06-14 12:05:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (730, '201700208401', '李智明', '116.9.132.57', '2017-06-14 12:07:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (731, '201700208401', '李智明', '116.9.132.57', '2017-06-15 14:04:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (732, '10001', 'admin', '182.90.26.224', '2017-06-15 17:23:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (733, '201700208401', '李智明', '125.73.116.59', '2017-06-21 13:42:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (734, '201700208401', '李智明', '125.73.119.242', '2017-06-27 10:35:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (735, '201700208401', '李智明', '125.73.119.242', '2017-06-27 10:38:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (736, '201700208401', '李智明', '125.73.119.242', '2017-06-28 10:59:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (737, '201700208401', '李智明', '125.73.119.242', '2017-06-28 11:06:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (738, '10001', 'admin', '182.90.67.54', '2017-06-29 23:24:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (739, '10001', 'admin', '182.90.67.54', '2017-06-30 02:49:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (740, '10001', 'admin', '182.90.67.54', '2017-06-30 02:56:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (741, '10001', 'admin', '182.90.13.232', '2017-07-05 02:22:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (742, '10001', 'admin', '222.217.220.228', '2017-07-05 08:21:50', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (743, '10001', 'admin', '222.217.220.228', '2017-07-05 08:21:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (744, '10001', 'admin', '182.90.13.232', '2017-07-05 23:45:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (745, '201700208401', '李智明', '124.226.166.6', '2017-07-07 12:10:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (746, '201700208401', '李智明', '124.226.166.6', '2017-07-07 12:34:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (747, '20170415034254110010', '18078743472', '182.90.55.243', '2017-07-08 00:29:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (748, '10001', 'admin', '182.90.55.243', '2017-07-08 03:09:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (749, '10001', 'admin', '222.217.220.235', '2017-07-10 10:52:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (750, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-13 17:23:45', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (751, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-13 17:23:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (752, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:44:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (753, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:46:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (754, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:47:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (755, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:48:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (756, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:48:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (757, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:50:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (758, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:53:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (759, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:53:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (760, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:54:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (761, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:55:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (762, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:57:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (763, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:57:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (764, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:58:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (765, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:58:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (766, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 08:59:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (767, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 09:05:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (768, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:06:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (769, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:09:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (770, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 09:11:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (771, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:13:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (772, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:13:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (773, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:13:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (774, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:13:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (775, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:13:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (776, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:14:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (777, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:14:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (778, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:14:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (779, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:14:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (780, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:16:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (781, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:17:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (782, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:17:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (783, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:19:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (784, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:21:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (785, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 09:24:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (786, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:28:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (787, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:30:19', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (788, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:30:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (789, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:30:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (790, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:31:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (791, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:31:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (792, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:32:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (793, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:33:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (794, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 09:40:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (795, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 10:30:19', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (796, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 10:31:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (797, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 10:40:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (798, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 10:43:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (799, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 10:44:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (800, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 10:45:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (801, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 10:45:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (802, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-14 10:48:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (803, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 11:08:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (804, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 11:08:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (805, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 11:10:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (806, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 11:10:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (807, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-14 11:28:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (808, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-14 11:33:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (809, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-14 11:38:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (810, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 12:18:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (811, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:06:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (812, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:12:00', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (813, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:29:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (814, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:30:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (815, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:34:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (816, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:35:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (817, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:36:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (818, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:38:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (819, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:41:19', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (820, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:42:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (821, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:44:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (822, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:44:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (823, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:45:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (824, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:47:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (825, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:49:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (826, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:50:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (827, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:51:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (828, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:51:33', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (829, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:53:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (830, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:53:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (831, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:56:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (832, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 15:57:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (833, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-14 15:59:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (834, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 16:02:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (835, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 16:03:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (836, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 16:04:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (837, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 16:06:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (838, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:10:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (839, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:12:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (840, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:13:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (841, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:13:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (842, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:14:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (843, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:20:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (844, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 17:21:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (845, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 17:27:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (846, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 17:34:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (847, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-14 19:43:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (848, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 20:17:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (849, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 20:23:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (850, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 20:27:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (851, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 20:28:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (852, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 20:30:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (853, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 20:30:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (854, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 21:47:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (855, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 21:52:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (856, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 21:56:38', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (857, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 21:58:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (858, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:01:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (859, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:06:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (860, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:06:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (861, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:07:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (862, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:09:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (863, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:10:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (864, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-14 22:19:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (865, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-15 21:57:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (866, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-15 21:59:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (867, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-15 22:00:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (868, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-15 23:31:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (869, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-15 23:38:26', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (870, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 00:08:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (871, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 09:34:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (872, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 09:35:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (873, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 18:54:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (874, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 20:40:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (875, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 20:56:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (876, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:02:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (877, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:02:44', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (878, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:03:19', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (879, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:04:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (880, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:07:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (881, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:07:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (882, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:09:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (883, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:11:06', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (884, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:11:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (885, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:12:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (886, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:12:31', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (887, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:14:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (888, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:15:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (889, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:15:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (890, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:17:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (891, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:17:38', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (892, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:18:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (893, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:18:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (894, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:19:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (895, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:26:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (896, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:26:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (897, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:30:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (898, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:30:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (899, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:32:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (900, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:32:53', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (901, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:36:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (902, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:39:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (903, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:42:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (904, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:42:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (905, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:44:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (906, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:48:06', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (907, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:52:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (908, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 21:52:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (909, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:00:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (910, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:07:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (911, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:07:38', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (912, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:07:39', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (913, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:08:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (914, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:11:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (915, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:12:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (916, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:17:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (917, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:19:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (918, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:20:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (919, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-16 22:22:26', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (920, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:22:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (921, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:25:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (922, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:38:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (923, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:38:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (924, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:41:31', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (925, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:43:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (926, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:44:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (927, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:44:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (928, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-16 22:56:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (929, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 02:39:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (930, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:03:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (931, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:05:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (932, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:07:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (933, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:07:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (934, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:08:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (935, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:11:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (936, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:12:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (937, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:13:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (938, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:13:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (939, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:14:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (940, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:28:06', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (941, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:29:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (942, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:29:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (943, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:31:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (944, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:32:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (945, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:32:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (946, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:33:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (947, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:56:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (948, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:57:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (949, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:58:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (950, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:59:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (951, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 03:59:49', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (952, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:00:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (953, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:00:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (954, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:04:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (955, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:06:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (956, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:07:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (957, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:07:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (958, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:09:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (959, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:10:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (960, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:10:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (961, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:10:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (962, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:17:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (963, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:17:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (964, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:18:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (965, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:18:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (966, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:19:38', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (967, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:19:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (968, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:19:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (969, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:19:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (970, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:22:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (971, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:23:39', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (972, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:23:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (973, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:24:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (974, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:24:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (975, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:24:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (976, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:25:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (977, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:27:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (978, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:27:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (979, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:28:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (980, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:32:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (981, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:32:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (982, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:32:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (983, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:37:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (984, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:37:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (985, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:41:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (986, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:42:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (987, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:42:39', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (988, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:43:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (989, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:44:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (990, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:44:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (991, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:47:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (992, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:48:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (993, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:50:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (994, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:50:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (995, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:51:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (996, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:58:02', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (997, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 04:59:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (998, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 05:00:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (999, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 05:00:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1000, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 05:01:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1001, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 05:01:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1002, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 05:04:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1003, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 09:08:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1004, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 09:47:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1005, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:10:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1006, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:33:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1007, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:46:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1008, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:49:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1009, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:51:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1010, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:53:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1011, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 10:56:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1012, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:22:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1013, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:36:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1014, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:40:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1015, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:47:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1016, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:48:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1017, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:50:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1018, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:53:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1019, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 11:57:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1020, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 12:06:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1021, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 12:07:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1022, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 12:08:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1023, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 12:09:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1024, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 12:09:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1025, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 12:10:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1026, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-17 12:10:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1027, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 13:28:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1028, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 13:35:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1029, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:04:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1030, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:09:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1031, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:12:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1032, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:15:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1033, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:36:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1034, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:37:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1035, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:49:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1036, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 14:51:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1037, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:02:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1038, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:04:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1039, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:07:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1040, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:16:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1041, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:16:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1042, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:20:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1043, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:21:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1044, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:23:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1045, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:29:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1046, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:40:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1047, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:44:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1048, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-17 15:44:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1049, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-18 01:25:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1050, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-18 01:48:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1051, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:00:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1052, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:08:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1053, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:09:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1054, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:09:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1055, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:09:33', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1056, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:09:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1057, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:10:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1058, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:10:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1059, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:10:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1060, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:10:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1061, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:11:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1062, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:12:00', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1063, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:12:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1064, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:14:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1065, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:14:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1066, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:15:30', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1067, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:15:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1068, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:16:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1069, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:16:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1070, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:17:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1071, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:17:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1072, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:17:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1073, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:17:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1074, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:17:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1075, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:17:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1076, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:18:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1077, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:18:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1078, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:19:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1079, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:19:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1080, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:19:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1081, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:20:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1082, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:21:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1083, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:48:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1084, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:51:00', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1085, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:52:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1086, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:55:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1087, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:57:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1088, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 02:57:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1089, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 02:58:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1090, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:00:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1091, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:02:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1092, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:03:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1093, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:03:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1094, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:04:49', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1095, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:31:00', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1096, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:39:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1097, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:42:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1098, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:43:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1099, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:45:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1100, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:47:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1101, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:47:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1102, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:48:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1103, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:48:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1104, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 03:51:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1105, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:08:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1106, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:11:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1107, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:11:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1108, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:13:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1109, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:13:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1110, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:15:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1111, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:15:49', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1112, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:16:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1113, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:16:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1114, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:19:33', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1115, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:21:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1116, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:22:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1117, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:23:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1118, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:23:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1119, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:23:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1120, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:24:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1121, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:25:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1122, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:26:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1123, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:31:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1124, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:33:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1125, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:35:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1126, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:38:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1127, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:43:31', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1128, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:45:33', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1129, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:48:44', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1130, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:50:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1131, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:51:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1132, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:51:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1133, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:52:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1134, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:52:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1135, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:54:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1136, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:54:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1137, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:54:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1138, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 04:54:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1139, '10001', 'admin', '127.0.0.1', '2017-07-18 05:41:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1140, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:38:21', '密码错误，登陆失败', 2);
INSERT INTO `sys_login_record` VALUES (1141, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:41:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1142, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:44:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1143, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:44:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1144, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:44:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1145, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:44:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1146, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:47:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1147, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:49:00', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1148, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 13:49:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1149, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 13:53:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1150, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 13:57:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1151, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 14:03:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1152, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 14:05:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1153, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 14:06:21', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1154, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 14:11:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1155, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 14:33:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1156, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 14:36:42', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1157, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 15:11:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1158, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 15:14:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1159, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 15:16:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1160, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 15:36:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1161, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:05:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1162, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:29:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1163, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:31:00', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1164, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:33:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1165, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:34:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1166, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:35:38', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1167, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:37:21', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1168, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:38:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1169, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:38:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1170, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:40:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1171, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:40:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1172, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:41:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1173, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:43:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1174, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:44:03', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1175, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:44:21', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1176, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:46:06', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1177, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:46:52', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1178, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:48:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1179, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:58:13', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1180, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:58:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1181, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 16:59:38', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1182, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:01:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1183, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:02:44', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1184, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:04:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1185, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:04:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1186, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:05:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1187, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:06:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1188, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:06:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1189, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 17:08:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1190, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-18 18:47:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1191, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 18:56:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1192, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 19:28:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1193, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 19:30:19', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1194, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 19:44:06', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1195, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 19:54:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1196, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-18 23:18:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1197, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:40:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1198, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:41:53', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1199, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:43:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1200, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:44:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1201, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:45:10', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1202, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:45:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1203, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:46:55', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1204, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:47:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1205, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:47:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1206, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:49:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1207, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:49:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1208, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:50:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1209, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:52:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1210, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:52:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1211, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:52:39', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1212, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-18 23:53:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1213, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 00:09:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1214, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 00:22:30', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1215, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-19 00:23:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1216, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-19 02:23:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1217, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 02:23:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1218, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 03:12:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1219, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 03:41:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1220, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:05:53', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1221, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:23:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1222, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:23:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1223, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:24:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1224, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:25:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1225, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:26:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1226, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:27:49', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1227, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:28:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1228, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:30:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1229, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:31:15', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1230, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 04:34:18', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1231, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-19 04:46:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1232, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-19 04:59:45', '密码错误，登陆失败', 2);
INSERT INTO `sys_login_record` VALUES (1233, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-19 05:00:02', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1234, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 05:03:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1235, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 05:05:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1236, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 14:31:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1237, '20170719143300010153', '12345678912', '0:0:0:0:0:0:0:1', '2017-07-19 14:33:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1238, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 14:34:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1239, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-19 14:35:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1240, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 14:58:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1241, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:16:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1242, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:44:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1243, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:44:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1244, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:44:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1245, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:46:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1246, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:46:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1247, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:55:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1248, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:56:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1249, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 15:59:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1250, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:00:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1251, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:01:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1252, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:03:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1253, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:12:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1254, '20170719143300010153', '12345678912', '0:0:0:0:0:0:0:1', '2017-07-19 16:13:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1255, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 16:13:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1256, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:16:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1257, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:20:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1258, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:25:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1259, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:26:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1260, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:26:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1261, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:29:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1262, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:30:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1263, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:32:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1264, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:35:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1265, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:35:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1266, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:48:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1267, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:51:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1268, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:58:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1269, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 16:59:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1270, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:01:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1271, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:05:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1272, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:07:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1273, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:15:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1274, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:16:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1275, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:17:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1276, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:20:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1277, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:22:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1278, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:24:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1279, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:26:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1280, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:33:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1281, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 17:34:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1282, '10001', 'admin', '0:0:0:0:0:0:0:1', '2017-07-19 20:15:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1283, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:13:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1284, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:14:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1285, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:14:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1286, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:17:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1287, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:18:02', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1288, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:19:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1289, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:21:43', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1290, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:22:23', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1291, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:23:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1292, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:27:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1293, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 21:29:46', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1294, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-19 22:20:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1295, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:02:53', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1296, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:04:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1297, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:11:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1298, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:11:45', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1299, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:12:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1300, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:12:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1301, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:13:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1302, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:25:50', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1303, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:39:17', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1304, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:52:20', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1305, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 02:53:58', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1306, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:22:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1307, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:29:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1308, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:40:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1309, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:44:35', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1310, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:49:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1311, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:49:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1312, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:50:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1313, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:50:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1314, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:50:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1315, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:50:26', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1316, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:51:53', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1317, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:51:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1318, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:52:37', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1319, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:52:39', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1320, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:54:05', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1321, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:54:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1322, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:54:30', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1323, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:54:54', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1324, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:57:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1325, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 03:58:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1326, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 04:02:30', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1327, '20170415034254110010', '18078743472', '0:0:0:0:0:0:0:1', '2017-07-20 04:02:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1328, '20170415011524010009', '18078743473', '0:0:0:0:0:0:0:1', '2017-07-20 04:03:04', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1329, '10001', 'admin', '127.0.0.1', '2019-01-07 21:17:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1330, '10001', 'admin', '127.0.0.1', '2019-01-07 21:17:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1331, '10001', 'admin', '127.0.0.1', '2019-01-07 21:22:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1332, '10001', 'admin', '127.0.0.1', '2019-01-07 21:23:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1333, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:24:01', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1334, '10001', 'admin', '127.0.0.1', '2019-01-07 21:27:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1335, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:29:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1336, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:29:21', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1337, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:29:31', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1338, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:29:47', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1339, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:30:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1340, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:30:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1341, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:35:53', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1342, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:36:07', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1343, '20190107212223110154', '123123123123', '127.0.0.1', '2019-01-07 21:36:34', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1344, '20190107212844010155', '456456456456', '127.0.0.1', '2019-01-07 21:37:25', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1345, '20190107214646010156', '15177436102', '127.0.0.1', '2019-01-07 21:46:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1346, '10001', 'admin', '127.0.0.1', '2019-01-07 21:48:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1347, '10001', 'admin', '127.0.0.1', '2019-01-07 21:56:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1348, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-16 15:13:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1349, '20170423093501010015', '13097749242', '127.0.0.1', '2019-01-16 15:14:09', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1350, '10001', 'admin', '127.0.0.1', '2019-01-16 15:14:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1351, '20170423093501010015', '13097749242', '127.0.0.1', '2019-01-16 15:15:30', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1352, '20170423093501010015', '13097749242', '127.0.0.1', '2019-01-16 15:20:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1353, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-16 15:25:14', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1354, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-16 15:30:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1355, '20170423093501010015', '13097749242', '127.0.0.1', '2019-01-16 15:30:32', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1356, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-16 15:38:28', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1357, '10001', 'admin', '127.0.0.1', '2019-01-16 15:47:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1358, '10001', 'admin', '127.0.0.1', '2019-01-16 15:49:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1359, '10001', 'admin', '127.0.0.1', '2019-01-16 15:50:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1360, '10001', 'admin', '127.0.0.1', '2019-01-16 15:50:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1361, '10001', 'admin', '127.0.0.1', '2019-01-16 15:50:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1362, '10001', 'admin', '127.0.0.1', '2019-01-16 15:52:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1363, '10001', 'admin', '127.0.0.1', '2019-01-16 15:52:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1364, '10001', 'admin', '127.0.0.1', '2019-01-16 15:52:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1365, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-17 16:42:11', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1366, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-20 00:25:22', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1367, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-20 01:02:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1368, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-20 13:51:51', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1370, '10001', 'admin', '127.0.0.1', '2019-01-22 14:37:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1372, '10001', 'admin', '127.0.0.1', '2019-01-22 14:39:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1374, '10001', 'admin', '127.0.0.1', '2019-01-22 16:44:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1376, '10001', 'admin', '127.0.0.1', '2019-01-22 16:44:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1378, '10001', 'admin', '127.0.0.1', '2019-01-22 16:44:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1380, '10001', 'admin', '127.0.0.1', '2019-01-22 16:45:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1382, '10001', 'admin', '127.0.0.1', '2019-01-22 16:46:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1384, '10001', 'admin', '127.0.0.1', '2019-01-22 16:46:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1386, '10001', 'admin', '127.0.0.1', '2019-01-22 16:59:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1388, '10001', 'admin', '127.0.0.1', '2019-01-22 17:08:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1390, '10001', 'admin', '127.0.0.1', '2019-01-22 17:26:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1392, '10001', 'admin', '127.0.0.1', '2019-01-22 17:27:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1394, '10001', 'admin', '127.0.0.1', '2019-01-22 17:28:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1396, '10001', 'admin', '127.0.0.1', '2019-01-22 17:29:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1398, '10001', 'admin', '127.0.0.1', '2019-01-22 17:32:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1400, '10001', 'admin', '127.0.0.1', '2019-01-22 20:55:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1402, '10001', 'admin', '127.0.0.1', '2019-01-22 21:01:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1404, '10001', 'admin', '127.0.0.1', '2019-01-22 21:04:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1406, '10001', 'admin', '127.0.0.1', '2019-01-22 21:24:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1408, '10001', 'admin', '127.0.0.1', '2019-01-22 21:27:32', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (1410, '10001', 'admin', '127.0.0.1', '2019-01-22 21:28:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1412, '10001', 'admin', '127.0.0.1', '2019-01-23 00:07:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1414, '10001', 'admin', '127.0.0.1', '2019-01-24 14:00:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1416, '10001', 'admin', '127.0.0.1', '2019-01-24 14:22:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1418, '10001', 'admin', '127.0.0.1', '2019-01-24 14:23:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1420, '10001', 'admin', '127.0.0.1', '2019-01-24 14:42:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1422, '10001', 'admin', '127.0.0.1', '2019-01-24 15:08:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1424, '10001', 'admin', '127.0.0.1', '2019-01-24 15:10:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1426, '10001', 'admin', '127.0.0.1', '2019-01-24 15:29:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1428, '10001', 'admin', '127.0.0.1', '2019-01-24 15:38:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1430, '10001', 'admin', '127.0.0.1', '2019-01-24 15:42:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1432, '10001', 'admin', '127.0.0.1', '2019-01-24 15:46:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1434, '10001', 'admin', '127.0.0.1', '2019-01-24 15:53:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1436, '10001', 'admin', '127.0.0.1', '2019-01-24 15:55:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1438, '10001', 'admin', '127.0.0.1', '2019-01-24 18:09:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1439, '10001', 'admin', '127.0.0.1', '2019-01-24 18:10:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1440, '10001', 'admin', '127.0.0.1', '2019-01-24 18:11:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1441, '10001', 'admin', '127.0.0.1', '2019-01-24 18:21:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1442, '10001', 'admin', '127.0.0.1', '2019-01-24 19:12:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1443, '10001', 'admin', '127.0.0.1', '2019-01-24 19:27:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1444, '10001', 'admin', '127.0.0.1', '2019-01-24 19:30:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1445, '10001', 'admin', '127.0.0.1', '2019-01-24 20:06:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1446, '10001', 'admin', '127.0.0.1', '2019-01-24 20:15:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1447, '10001', 'admin', '127.0.0.1', '2019-01-24 20:50:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1448, '10001', 'admin', '127.0.0.1', '2019-01-24 20:54:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1449, '10001', 'admin', '127.0.0.1', '2019-01-24 20:55:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1450, '10001', 'admin', '127.0.0.1', '2019-01-24 20:56:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1451, '10001', 'admin', '127.0.0.1', '2019-01-24 20:58:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1452, '10001', 'admin', '127.0.0.1', '2019-01-24 21:04:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1453, '10001', 'admin', '127.0.0.1', '2019-01-24 21:05:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1454, '10001', 'admin', '127.0.0.1', '2019-01-24 21:08:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1455, '10001', 'admin', '127.0.0.1', '2019-01-24 21:09:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1456, '10001', 'admin', '127.0.0.1', '2019-01-24 21:13:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1457, '10001', 'admin', '127.0.0.1', '2019-01-24 21:13:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1458, '10001', 'admin', '127.0.0.1', '2019-01-24 21:38:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1459, '10001', 'admin', '127.0.0.1', '2019-01-24 21:43:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1460, '10001', 'admin', '127.0.0.1', '2019-01-24 21:59:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1461, '10001', 'admin', '127.0.0.1', '2019-01-24 22:09:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1462, '10001', 'admin', '127.0.0.1', '2019-01-24 22:12:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1463, '10001', 'admin', '127.0.0.1', '2019-01-25 11:51:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1464, '10001', 'admin', '127.0.0.1', '2019-01-25 12:01:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1465, '10001', 'admin', '127.0.0.1', '2019-01-25 12:02:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1466, '10001', 'admin', '127.0.0.1', '2019-01-25 12:04:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1467, '10001', 'admin', '127.0.0.1', '2019-01-25 12:22:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1468, '10001', 'admin', '127.0.0.1', '2019-01-25 12:24:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1469, '10001', 'admin', '127.0.0.1', '2019-01-25 14:01:11', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (1470, '10001', 'admin', '127.0.0.1', '2019-01-25 14:01:11', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (1471, '10001', 'admin', '127.0.0.1', '2019-01-25 14:02:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1472, '10001', 'admin', '127.0.0.1', '2019-01-25 14:12:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1473, '10001', 'admin', '127.0.0.1', '2019-01-25 14:13:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1474, '10001', 'admin', '127.0.0.1', '2019-01-25 14:14:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1475, '10001', 'admin', '127.0.0.1', '2019-01-25 14:14:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1476, '10001', 'admin', '127.0.0.1', '2019-01-25 14:15:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1477, '10001', 'admin', '127.0.0.1', '2019-01-25 14:16:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1478, '10001', 'admin', '127.0.0.1', '2019-01-25 14:17:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1479, '10001', 'admin', '127.0.0.1', '2019-01-25 14:17:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1480, '10001', 'admin', '127.0.0.1', '2019-01-25 14:37:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1481, '10001', 'admin', '127.0.0.1', '2019-01-25 14:39:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1482, '10001', 'admin', '127.0.0.1', '2019-01-25 14:44:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1483, '10001', 'admin', '127.0.0.1', '2019-01-25 14:54:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1484, '10001', 'admin', '127.0.0.1', '2019-01-25 15:11:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1485, '10001', 'admin', '127.0.0.1', '2019-01-25 15:18:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1486, '10001', 'admin', '127.0.0.1', '2019-01-25 15:19:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1487, '10001', 'admin', '127.0.0.1', '2019-01-25 15:20:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1488, '10001', 'admin', '127.0.0.1', '2019-01-25 16:46:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1489, '10001', 'admin', '127.0.0.1', '2019-01-25 16:53:23', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1490, '10001', 'admin', '127.0.0.1', '2019-01-25 16:58:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1491, '10001', 'admin', '127.0.0.1', '2019-01-25 17:10:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1492, '10001', 'admin', '127.0.0.1', '2019-01-25 17:13:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1493, '10001', 'admin', '127.0.0.1', '2019-01-25 17:17:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1494, '10001', 'admin', '127.0.0.1', '2019-01-25 17:20:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1495, '10001', 'admin', '127.0.0.1', '2019-01-25 17:21:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1496, '10001', 'admin', '127.0.0.1', '2019-01-25 17:21:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1497, '10001', 'admin', '127.0.0.1', '2019-01-25 17:33:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1498, '10001', 'admin', '127.0.0.1', '2019-01-25 17:35:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1499, '10001', 'admin', '127.0.0.1', '2019-01-25 17:39:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1500, '10001', 'admin', '127.0.0.1', '2019-01-25 17:44:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1501, '10001', 'admin', '127.0.0.1', '2019-01-25 17:45:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1502, '10001', 'admin', '127.0.0.1', '2019-01-25 17:49:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1503, '10001', 'admin', '127.0.0.1', '2019-01-25 17:51:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1504, '10001', 'admin', '127.0.0.1', '2019-01-25 17:58:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1505, '10001', 'admin', '127.0.0.1', '2019-01-25 18:01:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1506, '10001', 'admin', '127.0.0.1', '2019-01-25 18:01:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1507, '10001', 'admin', '127.0.0.1', '2019-01-25 18:10:20', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1508, '10001', 'admin', '127.0.0.1', '2019-01-25 18:31:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1509, '10001', 'admin', '127.0.0.1', '2019-01-25 18:37:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1510, '10001', 'admin', '127.0.0.1', '2019-01-25 18:37:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1511, '10001', 'admin', '127.0.0.1', '2019-01-25 18:39:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1512, '10001', 'admin', '127.0.0.1', '2019-01-25 18:41:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1513, '10001', 'admin', '127.0.0.1', '2019-01-25 21:49:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1514, '10001', 'admin', '127.0.0.1', '2019-01-25 21:56:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1515, '10001', 'admin', '127.0.0.1', '2019-01-25 21:57:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1516, '20170415034254110010', '18078743472', '127.0.0.1', '2019-01-25 22:19:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1517, '10001', 'admin', '127.0.0.1', '2019-01-25 22:37:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1518, '10001', 'admin', '127.0.0.1', '2019-01-25 22:43:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1519, '10001', 'admin', '127.0.0.1', '2019-01-25 22:46:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1520, '10001', 'admin', '127.0.0.1', '2019-01-25 22:48:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1521, '10001', 'admin', '127.0.0.1', '2019-01-25 22:55:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1522, '10001', 'admin', '127.0.0.1', '2019-01-25 22:56:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1523, '10001', 'admin', '127.0.0.1', '2019-01-25 23:10:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1524, '10001', 'admin', '127.0.0.1', '2019-01-25 23:10:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1525, '10001', 'admin', '127.0.0.1', '2019-01-25 23:10:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1526, '10001', 'admin', '127.0.0.1', '2019-01-25 23:11:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1527, '10001', 'admin', '127.0.0.1', '2019-01-25 23:11:43', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1528, '10001', 'admin', '127.0.0.1', '2019-01-25 23:12:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1529, '10001', 'admin', '127.0.0.1', '2019-01-25 23:13:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1530, '10001', 'admin', '127.0.0.1', '2019-01-25 23:13:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1531, '10001', 'admin', '127.0.0.1', '2019-01-25 23:19:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1532, '10001', 'admin', '127.0.0.1', '2019-01-25 23:19:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1533, '10001', 'admin', '127.0.0.1', '2019-01-25 23:19:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1534, '10001', 'admin', '127.0.0.1', '2019-01-26 20:08:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1535, '10001', 'admin', '127.0.0.1', '2019-01-26 20:10:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1536, '10001', 'admin', '127.0.0.1', '2019-01-26 20:15:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1537, '10001', 'admin', '127.0.0.1', '2019-01-26 20:21:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1538, '10001', 'admin', '127.0.0.1', '2019-01-26 20:24:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1539, '10001', 'admin', '127.0.0.1', '2019-01-26 20:27:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1540, '10001', 'admin', '127.0.0.1', '2019-01-26 20:30:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1541, '10001', 'admin', '127.0.0.1', '2019-01-26 22:26:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1542, '10001', 'admin', '127.0.0.1', '2019-01-26 22:31:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1543, '10001', 'admin', '127.0.0.1', '2019-01-26 22:35:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1544, '10001', 'admin', '127.0.0.1', '2019-01-26 22:41:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1545, '10001', 'admin', '127.0.0.1', '2019-01-26 22:49:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1546, '10001', 'admin', '127.0.0.1', '2019-02-15 23:45:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1547, '10001', 'admin', '127.0.0.1', '2019-02-16 12:33:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1548, '10001', 'admin', '127.0.0.1', '2019-02-16 12:34:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1549, '10001', 'admin', '127.0.0.1', '2019-02-16 13:17:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1550, '10001', 'admin', '127.0.0.1', '2019-02-16 14:01:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1551, '10001', 'admin', '127.0.0.1', '2019-02-16 14:03:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1552, '10001', 'admin', '127.0.0.1', '2019-02-16 14:05:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1553, '10001', 'admin', '127.0.0.1', '2019-02-16 14:05:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1554, '10001', 'admin', '127.0.0.1', '2019-02-16 14:06:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1555, '10001', 'admin', '127.0.0.1', '2019-02-16 14:24:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1556, '10001', 'admin', '127.0.0.1', '2019-02-16 14:27:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1557, '10001', 'admin', '127.0.0.1', '2019-02-16 14:27:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1558, '10001', 'admin', '127.0.0.1', '2019-02-16 14:28:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1559, '10001', 'admin', '127.0.0.1', '2019-02-16 14:30:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1560, '10001', 'admin', '127.0.0.1', '2019-02-16 14:31:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1561, '10001', 'admin', '127.0.0.1', '2019-02-16 14:53:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1562, '10001', 'admin', '127.0.0.1', '2019-02-16 14:55:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1563, '10001', 'admin', '127.0.0.1', '2019-02-16 14:56:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1564, '10001', 'admin', '127.0.0.1', '2019-02-16 15:01:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1565, '10001', 'admin', '127.0.0.1', '2019-02-16 15:03:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1566, '10001', 'admin', '127.0.0.1', '2019-02-16 15:05:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1567, '10001', 'admin', '127.0.0.1', '2019-02-16 15:08:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1568, '10001', 'admin', '127.0.0.1', '2019-02-16 15:10:30', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1569, '10001', 'admin', '127.0.0.1', '2019-02-16 15:11:28', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1570, '10001', 'admin', '127.0.0.1', '2019-02-16 15:14:44', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1571, '10001', 'admin', '127.0.0.1', '2019-02-16 15:15:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1572, '10001', 'admin', '127.0.0.1', '2019-02-16 15:15:49', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1573, '10001', 'admin', '127.0.0.1', '2019-02-16 15:16:34', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1574, '10001', 'admin', '127.0.0.1', '2019-02-16 15:17:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1575, '10001', 'admin', '127.0.0.1', '2019-02-16 15:17:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1576, '10001', 'admin', '127.0.0.1', '2019-02-16 15:18:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1577, '10001', 'admin', '127.0.0.1', '2019-02-16 15:18:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1578, '10001', 'admin', '127.0.0.1', '2019-02-16 15:22:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1579, '10001', 'admin', '127.0.0.1', '2019-02-16 15:24:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1580, '10001', 'admin', '127.0.0.1', '2019-02-16 15:27:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1581, '10001', 'admin', '127.0.0.1', '2019-02-16 15:31:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1582, '10001', 'admin', '127.0.0.1', '2019-02-16 15:31:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1583, '10001', 'admin', '127.0.0.1', '2019-02-16 15:32:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1584, '10001', 'admin', '127.0.0.1', '2019-02-16 15:57:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1585, '10001', 'admin', '127.0.0.1', '2019-02-16 15:58:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1586, '10001', 'admin', '127.0.0.1', '2019-02-16 16:00:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1587, '10001', 'admin', '127.0.0.1', '2019-02-16 16:08:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1588, '10001', 'admin', '127.0.0.1', '2019-02-16 16:09:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1589, '10001', 'admin', '127.0.0.1', '2019-02-16 16:11:48', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1590, '10001', 'admin', '127.0.0.1', '2019-02-16 16:12:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1591, '10001', 'admin', '127.0.0.1', '2019-02-16 16:15:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1592, '10001', 'admin', '127.0.0.1', '2019-02-16 16:16:03', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1593, '10001', 'admin', '127.0.0.1', '2019-02-16 16:18:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1594, '10001', 'admin', '127.0.0.1', '2019-02-16 16:27:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1595, '10001', 'admin', '127.0.0.1', '2019-02-16 16:28:17', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1596, '10001', 'admin', '127.0.0.1', '2019-02-16 16:31:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1597, '10001', 'admin', '127.0.0.1', '2019-02-16 16:31:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1598, '10001', 'admin', '127.0.0.1', '2019-02-16 16:32:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1599, '10001', 'admin', '127.0.0.1', '2019-02-16 16:33:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1600, '10001', 'admin', '127.0.0.1', '2019-02-16 16:34:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1601, '10001', 'admin', '127.0.0.1', '2019-02-16 16:39:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1602, '10001', 'admin', '127.0.0.1', '2019-02-16 16:40:24', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1603, '10001', 'admin', '127.0.0.1', '2019-02-16 16:41:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1604, '10001', 'admin', '127.0.0.1', '2019-02-16 16:44:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1605, '10001', 'admin', '127.0.0.1', '2019-02-16 16:46:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1606, '10001', 'admin', '127.0.0.1', '2019-02-16 16:46:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1607, '10001', 'admin', '127.0.0.1', '2019-02-16 16:48:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1608, '10001', 'admin', '127.0.0.1', '2019-02-16 16:51:15', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1609, '10001', 'admin', '127.0.0.1', '2019-02-16 16:52:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1610, '10001', 'admin', '127.0.0.1', '2019-02-16 16:53:35', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1611, '10001', 'admin', '127.0.0.1', '2019-02-16 16:55:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1612, '10001', 'admin', '127.0.0.1', '2019-02-16 17:14:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1613, '10001', 'admin', '127.0.0.1', '2019-02-16 17:15:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1614, '10001', 'admin', '127.0.0.1', '2019-02-16 17:27:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1615, '10001', 'admin', '127.0.0.1', '2019-02-16 17:30:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1616, '10001', 'admin', '127.0.0.1', '2019-02-16 17:30:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1617, '10001', 'admin', '127.0.0.1', '2019-02-16 17:31:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1618, '10001', 'admin', '127.0.0.1', '2019-02-16 17:34:59', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1619, '10001', 'admin', '127.0.0.1', '2019-02-16 17:36:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1620, '10001', 'admin', '127.0.0.1', '2019-02-16 17:38:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1621, '10001', 'admin', '127.0.0.1', '2019-02-16 17:59:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1622, '10001', 'admin', '127.0.0.1', '2019-02-16 18:11:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1623, '10001', 'admin', '127.0.0.1', '2019-02-16 18:14:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1624, '10001', 'admin', '127.0.0.1', '2019-02-16 18:17:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1625, '10001', 'admin', '127.0.0.1', '2019-02-16 18:18:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1626, '10001', 'admin', '127.0.0.1', '2019-02-16 18:20:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1627, '10001', 'admin', '127.0.0.1', '2019-02-16 18:22:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1628, '10001', 'admin', '127.0.0.1', '2019-02-17 20:35:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1629, '10001', 'admin', '127.0.0.1', '2019-02-17 20:36:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1630, '10001', 'admin', '127.0.0.1', '2019-02-17 21:34:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1631, '10001', 'admin', '127.0.0.1', '2019-02-17 21:53:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1632, '10001', 'admin', '127.0.0.1', '2019-02-17 21:54:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1633, '10001', 'admin', '127.0.0.1', '2019-02-17 21:55:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1634, '10001', 'admin', '127.0.0.1', '2019-02-17 21:58:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1635, '10001', 'admin', '127.0.0.1', '2019-02-17 22:01:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1636, '10001', 'admin', '127.0.0.1', '2019-02-17 22:02:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1637, '10001', 'admin', '127.0.0.1', '2019-02-17 22:04:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1638, '10001', 'admin', '127.0.0.1', '2019-02-17 22:06:10', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1639, '10001', 'admin', '127.0.0.1', '2019-02-17 23:05:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1640, '10001', 'admin', '127.0.0.1', '2019-02-17 23:13:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1641, '10001', 'admin', '127.0.0.1', '2019-02-17 23:13:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1642, '10001', 'admin', '127.0.0.1', '2019-02-17 23:14:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1643, '10001', 'admin', '127.0.0.1', '2019-02-18 13:50:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1644, '10001', 'admin', '127.0.0.1', '2019-02-18 13:53:21', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (1645, '10001', 'admin', '127.0.0.1', '2019-02-18 13:53:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1646, '10001', 'admin', '127.0.0.1', '2019-02-18 13:54:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1647, '10001', 'admin', '127.0.0.1', '2019-02-18 15:13:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1648, '10001', 'admin', '127.0.0.1', '2019-02-18 15:14:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1649, '10001', 'admin', '127.0.0.1', '2019-02-18 19:06:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1650, '10001', 'admin', '127.0.0.1', '2019-02-18 20:21:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1651, '10001', 'admin', '127.0.0.1', '2019-02-20 14:16:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1652, '10001', 'admin', '127.0.0.1', '2019-02-20 14:18:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1653, '10001', 'admin', '127.0.0.1', '2019-02-20 14:20:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1654, '10001', 'admin', '127.0.0.1', '2019-02-20 14:21:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1655, '10001', 'admin', '127.0.0.1', '2019-02-20 14:21:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1656, '10001', 'admin', '127.0.0.1', '2019-02-20 14:22:39', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1657, '10001', 'admin', '127.0.0.1', '2019-02-20 14:22:54', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1658, '10001', 'admin', '127.0.0.1', '2019-02-20 14:23:09', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1659, '10001', 'admin', '127.0.0.1', '2019-02-20 14:23:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1660, '10001', 'admin', '127.0.0.1', '2019-02-20 14:23:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1661, '10001', 'admin', '127.0.0.1', '2019-02-20 14:34:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1662, '10001', 'admin', '127.0.0.1', '2019-02-20 14:35:12', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1663, '10001', 'admin', '127.0.0.1', '2019-02-20 14:36:13', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1664, '10001', 'admin', '127.0.0.1', '2019-02-20 14:41:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1665, '10001', 'admin', '127.0.0.1', '2019-02-20 14:57:25', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1666, '10001', 'admin', '127.0.0.1', '2019-02-20 14:58:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1667, '10001', 'admin', '127.0.0.1', '2019-02-20 15:00:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1668, '10001', 'admin', '127.0.0.1', '2019-02-28 12:27:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1669, '10001', 'admin', '127.0.0.1', '2019-03-01 16:52:59', '密码错误，登录失败', 1);
INSERT INTO `sys_login_record` VALUES (1670, '10001', 'admin', '127.0.0.1', '2019-03-01 16:53:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1671, '10001', 'admin', '127.0.0.1', '2019-03-01 16:57:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1672, '10001', 'admin', '127.0.0.1', '2019-03-01 17:13:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1673, '10001', 'admin', '127.0.0.1', '2019-03-01 17:13:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1674, '10001', 'admin', '127.0.0.1', '2019-03-16 16:05:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1675, '10001', 'admin', '127.0.0.1', '2019-03-27 11:31:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1676, '10001', 'admin', '127.0.0.1', '2019-03-27 15:53:05', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1677, '10001', 'admin', '127.0.0.1', '2019-03-27 15:58:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1678, '10001', 'admin', '127.0.0.1', '2019-03-27 16:27:51', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1679, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-27 16:37:12', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1680, '10001', 'admin', '127.0.0.1', '2019-03-27 16:48:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1681, '10001', 'admin', '127.0.0.1', '2019-03-27 17:04:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1682, '10001', 'admin', '127.0.0.1', '2019-03-27 17:06:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1683, '10001', 'admin', '127.0.0.1', '2019-03-27 17:09:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1684, '10001', 'admin', '127.0.0.1', '2019-03-27 17:12:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1685, '10001', 'admin', '127.0.0.1', '2019-03-27 17:15:26', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1686, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-27 17:18:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1687, '10001', 'admin', '127.0.0.1', '2019-03-28 16:05:16', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1688, '10001', 'admin', '127.0.0.1', '2019-03-28 16:20:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1689, '10001', 'admin', '127.0.0.1', '2019-03-29 11:42:11', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1690, '10001', 'admin', '127.0.0.1', '2019-03-29 14:17:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1691, '10001', 'admin', '127.0.0.1', '2019-03-29 14:18:14', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1692, '10001', 'admin', '127.0.0.1', '2019-03-29 16:12:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1693, '10001', 'admin', '127.0.0.1', '2019-03-29 16:16:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1694, '10001', 'admin', '127.0.0.1', '2019-03-29 17:09:53', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1695, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-29 17:29:08', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1696, '10001', 'admin', '127.0.0.1', '2019-03-29 17:29:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1697, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-29 17:30:24', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1698, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-29 17:32:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1699, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-29 17:32:59', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1700, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-29 17:33:29', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1701, '10001', 'admin', '127.0.0.1', '2019-03-29 18:31:21', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1702, '10001', 'admin', '127.0.0.1', '2019-03-29 21:47:32', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1703, '20190107212223110154', '123123123123', '127.0.0.1', '2019-03-29 21:50:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1704, '10001', 'admin', '127.0.0.1', '2019-03-29 21:53:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1705, '10001', 'admin', '127.0.0.1', '2019-03-29 22:16:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1706, '10001', 'admin', '127.0.0.1', '2019-03-29 22:20:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1707, '10001', 'admin', '127.0.0.1', '2019-03-30 12:01:04', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1708, '10001', 'admin', '127.0.0.1', '2019-03-30 12:03:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1709, '10001', 'admin', '127.0.0.1', '2019-03-30 12:15:00', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1710, '10001', 'admin', '127.0.0.1', '2019-03-30 16:43:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1711, '10001', 'admin', '127.0.0.1', '2019-03-30 17:33:42', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1712, '10001', 'admin', '127.0.0.1', '2019-03-30 21:13:22', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1713, '10001', 'admin', '127.0.0.1', '2019-03-30 21:23:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1714, '10001', 'admin', '127.0.0.1', '2019-03-30 23:25:29', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1715, '10001', 'admin', '127.0.0.1', '2019-03-30 23:27:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1716, '10001', 'admin', '127.0.0.1', '2019-03-30 23:32:55', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1717, '10001', 'admin', '127.0.0.1', '2019-03-30 23:35:46', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1718, '10001', 'admin', '127.0.0.1', '2019-03-30 23:55:19', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1719, '10001', 'admin', '127.0.0.1', '2019-03-31 00:12:02', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1720, '10001', 'admin', '127.0.0.1', '2019-03-31 00:26:41', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1721, '10001', 'admin', '127.0.0.1', '2019-03-31 00:28:06', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1722, '10001', 'admin', '127.0.0.1', '2019-03-31 10:11:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1723, '10001', 'admin', '127.0.0.1', '2019-03-31 10:33:36', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1724, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-01 10:51:41', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1725, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-02 21:41:57', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1726, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-09 21:43:40', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1727, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-09 21:45:08', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1728, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-13 09:06:16', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1729, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-13 09:07:40', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1730, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-13 18:16:48', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1731, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-14 15:05:56', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1732, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-15 08:26:27', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1733, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-15 10:08:26', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1734, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-16 20:53:37', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1735, '20170414165709010001', '13052564562', '0:0:0:0:0:0:0:1', '2019-04-16 20:53:49', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1736, '20190416212201010157', '13005971613', '127.0.0.1', '2019-04-16 21:22:36', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1737, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-16 22:33:27', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1738, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-17 08:32:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1739, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-17 08:55:45', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1740, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-24 19:24:18', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1741, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-27 17:45:50', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1742, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-27 20:47:31', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1743, '20190107212223110154', '123123123123', '127.0.0.1', '2019-04-29 19:49:02', '登录成功', 2);
INSERT INTO `sys_login_record` VALUES (1744, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-29 20:39:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1745, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-29 20:39:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1746, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-29 20:43:52', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1747, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-29 20:47:58', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1748, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-29 20:51:01', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1749, '10001', 'admin', '0:0:0:0:0:0:0:1', '2019-04-29 21:57:33', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1750, '10001', 'admin', '127.0.0.1', '2019-04-30 12:08:56', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1751, '10001', 'admin', '127.0.0.1', '2019-04-30 12:08:57', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1752, '10001', 'admin', '127.0.0.1', '2019-05-02 15:46:38', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1753, '10001', 'admin', '127.0.0.1', '2019-05-03 13:24:07', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1754, '10001', 'admin', '127.0.0.1', '2019-05-06 17:35:47', '登录成功', 1);
INSERT INTO `sys_login_record` VALUES (1755, '10001', 'admin', '127.0.0.1', '2019-05-06 17:38:37', '登录成功', 1);

-- ----------------------------
-- Table structure for sys_right
-- ----------------------------
DROP TABLE IF EXISTS `sys_right`;
CREATE TABLE `sys_right`  (
  `right_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编号',
  `right_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `resource_path` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径:(暂时不使用：可以访问的路径)',
  `right_type` int(4) NULL DEFAULT NULL COMMENT '权限类别',
  `right_sort_order` int(4) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`right_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_right
-- ----------------------------
INSERT INTO `sys_right` VALUES ('addAudio', '添加念数机音频', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('addCompany', '添加公司', NULL, NULL, 12);
INSERT INTO `sys_right` VALUES ('addConsultTeacher', '添加咨询老师', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('addDepartment', '添加部门', NULL, NULL, 15);
INSERT INTO `sys_right` VALUES ('addFormula', '添加念数机配方', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('addMumber', '添加会员', NULL, NULL, 8);
INSERT INTO `sys_right` VALUES ('addRight', '添加权限', NULL, NULL, 34);
INSERT INTO `sys_right` VALUES ('addRole', '添加角色', NULL, NULL, 31);
INSERT INTO `sys_right` VALUES ('addSoundSource', '添加念数机音源', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('addTeacher', '添加导师', NULL, NULL, 1);
INSERT INTO `sys_right` VALUES ('addUser', '添加用户', NULL, NULL, 28);
INSERT INTO `sys_right` VALUES ('deleteAudio', '删除念数机音频', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('deleteCompany', '删除公司', NULL, NULL, 13);
INSERT INTO `sys_right` VALUES ('deleteDepartment', '删除部门', NULL, NULL, 16);
INSERT INTO `sys_right` VALUES ('deleteFormula', '删除念数机配方', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('deleteLoginRecord', '删除登陆记录', NULL, NULL, 40);
INSERT INTO `sys_right` VALUES ('deleteMumber', '删除会员', NULL, NULL, 10);
INSERT INTO `sys_right` VALUES ('deleteRight', '删除权限', NULL, NULL, 36);
INSERT INTO `sys_right` VALUES ('deleteRole', '删除角色', NULL, NULL, 33);
INSERT INTO `sys_right` VALUES ('deleteSoundSource', '删除念数机音源', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('deleteTeacher', '删除导师', NULL, NULL, 3);
INSERT INTO `sys_right` VALUES ('deleteUser', '删除用户', NULL, NULL, 30);
INSERT INTO `sys_right` VALUES ('editAudio', '修改念数机音频', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('editCompany', '修改公司', NULL, NULL, 14);
INSERT INTO `sys_right` VALUES ('editConsultTeacher', '修改咨询老师', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('editDepartment', '修改部门', NULL, NULL, 17);
INSERT INTO `sys_right` VALUES ('editFormula', '修改念数机配方', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('editMumber', '修改会员', NULL, NULL, 9);
INSERT INTO `sys_right` VALUES ('editPassword', '重置密码', NULL, NULL, 66);
INSERT INTO `sys_right` VALUES ('editRight', '修改权限', NULL, NULL, 35);
INSERT INTO `sys_right` VALUES ('editRole', '修改角色', NULL, NULL, 32);
INSERT INTO `sys_right` VALUES ('editSoundSource', '修改念数机音源', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('editTeacher', '修改导师', NULL, NULL, 2);
INSERT INTO `sys_right` VALUES ('editUser', '修改用户', NULL, NULL, 29);
INSERT INTO `sys_right` VALUES ('findServicesStatistics', '查询导师服务', NULL, NULL, 7);
INSERT INTO `sys_right` VALUES ('healthData', '健康数据', NULL, NULL, 11);
INSERT INTO `sys_right` VALUES ('healthDataCenter', '健康数据中心', NULL, NULL, 6);
INSERT INTO `sys_right` VALUES ('loginLog', '登陆日志', NULL, NULL, 18);
INSERT INTO `sys_right` VALUES ('resetTeacherPwd', '充值咨询老师密码', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('servicesStatistics', '导师服务统计', NULL, NULL, 60);
INSERT INTO `sys_right` VALUES ('studyGarden', '学习园地', NULL, NULL, 37);
INSERT INTO `sys_right` VALUES ('untreated', '未处理咨询管理', NULL, NULL, 4);
INSERT INTO `sys_right` VALUES ('viewConsultRecord', '查看咨询记录', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('viewConsultStatistics', '查看服务统计', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('viewConsultTeacher', '查看咨询老师', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('viewConsumer', '查看咨询用户', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('viewExceptional', '查看交易对账', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('viewMessage', '查看短信记录', NULL, NULL, 41);
INSERT INTO `sys_right` VALUES ('viewSettlement', '查看结算管理', NULL, NULL, NULL);
INSERT INTO `sys_right` VALUES ('vip', 'VIP管理', NULL, NULL, 5);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号（英文，不能重复）',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_sort_order` int(4) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('super_admin', '超级管理员', 1);
INSERT INTO `sys_role` VALUES ('teacher_admin', '导师管理', 2);

-- ----------------------------
-- Table structure for sys_role_right
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_right`;
CREATE TABLE `sys_role_right`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `right_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 445 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_right
-- ----------------------------
INSERT INTO `sys_role_right` VALUES (239, 'teacher_admin', 'studyGarden');
INSERT INTO `sys_role_right` VALUES (240, 'teacher_admin', 'servicesStatistics');
INSERT INTO `sys_role_right` VALUES (395, 'super_admin', 'addAudio');
INSERT INTO `sys_role_right` VALUES (396, 'super_admin', 'editAudio');
INSERT INTO `sys_role_right` VALUES (397, 'super_admin', 'addFormula');
INSERT INTO `sys_role_right` VALUES (398, 'super_admin', 'deleteAudio');
INSERT INTO `sys_role_right` VALUES (399, 'super_admin', 'editFormula');
INSERT INTO `sys_role_right` VALUES (400, 'super_admin', 'viewConsumer');
INSERT INTO `sys_role_right` VALUES (401, 'super_admin', 'deleteFormula');
INSERT INTO `sys_role_right` VALUES (402, 'super_admin', 'addSoundSource');
INSERT INTO `sys_role_right` VALUES (403, 'super_admin', 'viewSettlement');
INSERT INTO `sys_role_right` VALUES (404, 'super_admin', 'editSoundSource');
INSERT INTO `sys_role_right` VALUES (405, 'super_admin', 'resetTeacherPwd');
INSERT INTO `sys_role_right` VALUES (406, 'super_admin', 'viewExceptional');
INSERT INTO `sys_role_right` VALUES (407, 'super_admin', 'addConsultTeacher');
INSERT INTO `sys_role_right` VALUES (408, 'super_admin', 'deleteSoundSource');
INSERT INTO `sys_role_right` VALUES (409, 'super_admin', 'viewConsultRecord');
INSERT INTO `sys_role_right` VALUES (410, 'super_admin', 'editConsultTeacher');
INSERT INTO `sys_role_right` VALUES (411, 'super_admin', 'viewConsultTeacher');
INSERT INTO `sys_role_right` VALUES (412, 'super_admin', 'viewConsultStatistics');
INSERT INTO `sys_role_right` VALUES (413, 'super_admin', 'addTeacher');
INSERT INTO `sys_role_right` VALUES (414, 'super_admin', 'editTeacher');
INSERT INTO `sys_role_right` VALUES (415, 'super_admin', 'deleteTeacher');
INSERT INTO `sys_role_right` VALUES (416, 'super_admin', 'untreated');
INSERT INTO `sys_role_right` VALUES (417, 'super_admin', 'vip');
INSERT INTO `sys_role_right` VALUES (418, 'super_admin', 'healthDataCenter');
INSERT INTO `sys_role_right` VALUES (419, 'super_admin', 'findServicesStatistics');
INSERT INTO `sys_role_right` VALUES (420, 'super_admin', 'addMumber');
INSERT INTO `sys_role_right` VALUES (421, 'super_admin', 'editMumber');
INSERT INTO `sys_role_right` VALUES (422, 'super_admin', 'deleteMumber');
INSERT INTO `sys_role_right` VALUES (423, 'super_admin', 'healthData');
INSERT INTO `sys_role_right` VALUES (424, 'super_admin', 'addCompany');
INSERT INTO `sys_role_right` VALUES (425, 'super_admin', 'deleteCompany');
INSERT INTO `sys_role_right` VALUES (426, 'super_admin', 'editCompany');
INSERT INTO `sys_role_right` VALUES (427, 'super_admin', 'addDepartment');
INSERT INTO `sys_role_right` VALUES (428, 'super_admin', 'deleteDepartment');
INSERT INTO `sys_role_right` VALUES (429, 'super_admin', 'editDepartment');
INSERT INTO `sys_role_right` VALUES (430, 'super_admin', 'loginLog');
INSERT INTO `sys_role_right` VALUES (431, 'super_admin', 'addUser');
INSERT INTO `sys_role_right` VALUES (432, 'super_admin', 'editUser');
INSERT INTO `sys_role_right` VALUES (433, 'super_admin', 'deleteUser');
INSERT INTO `sys_role_right` VALUES (434, 'super_admin', 'addRole');
INSERT INTO `sys_role_right` VALUES (435, 'super_admin', 'editRole');
INSERT INTO `sys_role_right` VALUES (436, 'super_admin', 'deleteRole');
INSERT INTO `sys_role_right` VALUES (437, 'super_admin', 'addRight');
INSERT INTO `sys_role_right` VALUES (438, 'super_admin', 'editRight');
INSERT INTO `sys_role_right` VALUES (439, 'super_admin', 'deleteRight');
INSERT INTO `sys_role_right` VALUES (440, 'super_admin', 'studyGarden');
INSERT INTO `sys_role_right` VALUES (441, 'super_admin', 'deleteLoginRecord');
INSERT INTO `sys_role_right` VALUES (442, 'super_admin', 'viewMessage');
INSERT INTO `sys_role_right` VALUES (443, 'super_admin', 'servicesStatistics');
INSERT INTO `sys_role_right` VALUES (444, 'super_admin', 'editPassword');

-- ----------------------------
-- Table structure for sys_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit`  (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_area` varchar(51) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `unit_cod` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `unit_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `unit_type` varchar(5) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `unit_subjection` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `business_type` varchar(5) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `units_type` varchar(5) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES (2, '第一区', '1001', '服务部', '其他', '服务部', '本管理部门', NULL);
INSERT INTO `sys_unit` VALUES (3, '第二区', '1002', '人力部', '企业', '人力资源部', '本管理部门', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `user_telephone` varchar(35) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `user_email` varchar(75) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `user_password` varchar(150) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `user_real_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `user_sex` int(4) NULL DEFAULT NULL,
  `user_age` int(4) NULL DEFAULT NULL,
  `user_type` int(4) NOT NULL,
  `user_address` varchar(350) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `unit_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `user_qq` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '10001', '12345678901', NULL, '23446549f2f528c0064707e142ab563b9ff1f2680f7f91ba08604c490deb9950861428f1babe41d8', 'admin', '管理员', NULL, 45, 3, NULL, NULL, '654654646');
INSERT INTO `sys_user` VALUES (13, '10002', '12345678901', '', '4ea75bdf9974b49100d98260806ddeef8b4470a630ad10cf7471e67f09db2c36627023f63972053e', 'teacherAdmin', '导师', NULL, 18, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (14, '201700208401', '18078743472', '3030289941@qq.com', '4ea75bdf9974b49100d98260806ddeef8b4470a630ad10cf7471e67f09db2c36627023f63972053e', '李智明', '李智明', 1, 30, 3, NULL, '服务部', '3030289941');
INSERT INTO `sys_user` VALUES (18, '20170414170733110004', '13556215423', '13056800@qq.com', 'c0587e2f955beda251d33d9737752282b3377a2317661cb44fc64337304a926614fc94b4cf4f1e68', '13556215423', '（测试）CC', 1, NULL, 2, '', '服务部', '13056800');
INSERT INTO `sys_user` VALUES (19, '20170414223005110006', '13556215426', '13510269@qq.com', '7d26f48f1bbeb6d62f1eeba6992ca727f5062e8b086c67f29d0e7247abf324c63034ca28a883e910', '13556215426', '（测试）AS森', 1, NULL, 2, NULL, '服务部', '13510269');
INSERT INTO `sys_user` VALUES (20, '20170414223405110007', '1231234567', '1564523210@qq.com', '6c1b0078ff8bdbdcb249610058ae4e539162fed82c8d93f7b4505fe0d695c98c7e239372e46b4395', '1231234567', '（测试）李明', 0, NULL, 2, NULL, '服务部', '1564523210');
INSERT INTO `sys_user` VALUES (21, '20170414223647110008', '13556420559', '456124158@qq.com', 'bb90c77f7ecfd8c6a12716d026d372d683fd6e98033f24ab15408814e2ef2e5aa6a0a93c0c66a46d', '13556420559', '（测试）凌城', 1, NULL, 2, NULL, '服务部', '456124158');
INSERT INTO `sys_user` VALUES (22, '20170415034254110010', '18078743472', '3030289941@qq.com', '23446549f2f528c0064707e142ab563b9ff1f2680f7f91ba08604c490deb9950861428f1babe41d8', '18078743472', '（测试）李大明', 1, NULL, 2, NULL, '服务部', '3030289941');
INSERT INTO `sys_user` VALUES (23, '20170416132159310012', '13307748603', 'letmeon@163.com', 'e754031db64ca9c04baa8b99cd52288688934555b4dd54c06813d93126a5c49a979019982bb45bb1', '13307748603', '李明', 1, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (24, '20170423153209110016', '18516665389', '19398620@qq.com', '4eff4dae8adc3ba6922d36c0f666a2423376166fedf81a7682d9881cbbb1c40100fe5ae3a2dabd26', '18516665389', '（测试）李智锐', 1, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (25, '20170425091851110017', '13356875352', '', 'b6eceba9a6d091e9875c7f4ffb1afffcd17328dabc4df85a02acc0a06ab8e3bb2c7bb37fcbde9511', '13356875352', '李春彬', 1, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (26, '20170425093856110018', '13831005629', '', '422d11fe3d4febb9296be00a82d8b40636d98eb5739117049e6e1371232fc13cc35c274a579581d5', '13831005629', '耿文涛', 1, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (27, '20170425094045110019', '13738022698', '', '5333363b7cd85731f8bf49036ddb2af1911b4c1cd469c260b1c56b3cd574464829f64c36394d3200', '13738022698', '邢若琪', 1, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (28, '20170425094231110020', '13608188632', '', '53557bfac380c5a36db9bd7c5c14e460038ccf65602e5eeb8d1b29f645bd81ad59cadd1cf7f69b84', '13608188632', '刘江', 1, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (29, '20170425101341110027', '15839938898', '', '2f75bc20762519ab3b686ffcf3a8e2b43ea78eb862fa97f66f2c1102549d19650aa8132f6bd063b6', '15839938898', '彭爱莲', 0, NULL, 2, NULL, '服务部', '');
INSERT INTO `sys_user` VALUES (31, '20190107212223110154', '123123123123', '123123123123@qq.com', '4af06411f943c93ca411359c0ef2edfee3eea0c394b39cc4b31c7934faabbefe8ab6fe09e7cc9c1b', '123123123123', '开发团队', 1, NULL, 2, NULL, NULL, '123123123123');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号（角色主表键）',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号（用户表主键）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 'super_admin', '10001');
INSERT INTO `sys_user_role` VALUES (2, 'Input_user', 'test');
INSERT INTO `sys_user_role` VALUES (3, 'Input_user', '11119');
INSERT INTO `sys_user_role` VALUES (7, 'product_admin', 'padmin');
INSERT INTO `sys_user_role` VALUES (8, 'yulin_admin', 'yladmin');
INSERT INTO `sys_user_role` VALUES (9, 'super_admin', '10001');
INSERT INTO `sys_user_role` VALUES (10, 'super_admin', '18378510670');
INSERT INTO `sys_user_role` VALUES (11, 'product_admin', '暗示法撒发生');
INSERT INTO `sys_user_role` VALUES (14, 'product_admin', '4165416');
INSERT INTO `sys_user_role` VALUES (15, 'product_admin', '18378510670');
INSERT INTO `sys_user_role` VALUES (16, 'product_admin', '5165165161');
INSERT INTO `sys_user_role` VALUES (17, 'product_admin', '18378510670');
INSERT INTO `sys_user_role` VALUES (18, 'product_admin', '18378510670');
INSERT INTO `sys_user_role` VALUES (19, 'product_admin', '18378510670');
INSERT INTO `sys_user_role` VALUES (23, 'teacher_admin', '10002');
INSERT INTO `sys_user_role` VALUES (28, 'teacher_admin', '20170415034254110010');
INSERT INTO `sys_user_role` VALUES (29, 'teacher_admin', '20170414223005110006');
INSERT INTO `sys_user_role` VALUES (30, 'teacher_admin', '20170414223405110007');
INSERT INTO `sys_user_role` VALUES (31, 'teacher_admin', '20170414223647110008');
INSERT INTO `sys_user_role` VALUES (32, 'teacher_admin', '20170416132159310012');
INSERT INTO `sys_user_role` VALUES (33, 'super_admin', '201700208401');
INSERT INTO `sys_user_role` VALUES (34, 'teacher_admin', '20170423153209110016');
INSERT INTO `sys_user_role` VALUES (35, 'teacher_admin', '20170425091851110017');
INSERT INTO `sys_user_role` VALUES (36, 'teacher_admin', '20170425093856110018');
INSERT INTO `sys_user_role` VALUES (37, 'teacher_admin', '20170425094045110019');
INSERT INTO `sys_user_role` VALUES (38, 'teacher_admin', '20170425094231110020');
INSERT INTO `sys_user_role` VALUES (39, 'teacher_admin', '20170425101341110027');
INSERT INTO `sys_user_role` VALUES (40, 'teacher_admin', '20170503162359110124');
INSERT INTO `sys_user_role` VALUES (41, 'teacher_admin', '20190107212223110154');

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `id` int(20) NOT NULL COMMENT '表ID',
  `address_id` int(20) NOT NULL COMMENT '地址ID',
  `address_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `mobile_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号',
  `member_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_advice
-- ----------------------------
DROP TABLE IF EXISTS `tb_advice`;
CREATE TABLE `tb_advice`  (
  `advice_id` int(11) NOT NULL AUTO_INCREMENT,
  `advice_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `advice_time` datetime NULL,
  `readme_id` int(11) NOT NULL,
  `personal_id` int(11) NOT NULL,
  `mentor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `member_id` int(11) NOT NULL,
  `father_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`advice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_advice
-- ----------------------------
INSERT INTO `tb_advice` VALUES (9, '多吃蔬菜、适当放松可缓解疲劳', '2017-04-14 17:48:33', 15, 41, '茗香', 38, 0);
INSERT INTO `tb_advice` VALUES (10, '严重感冒，需及时就诊', '2017-04-14 17:51:11', 16, 40, '百叶戍', 38, 0);
INSERT INTO `tb_advice` VALUES (11, '饮食应以清淡为主', '2017-04-15 04:39:25', 23, 46, '李智明', 38, 0);
INSERT INTO `tb_advice` VALUES (12, 'cessssssssssssssssssssssssssssssssssssssssssssssssssssssss', '2017-04-20 21:10:14', 14, 40, '百叶戍', 37, 0);
INSERT INTO `tb_advice` VALUES (13, '测试数据测试数据', '2017-04-20 22:06:45', 25, 46, '李智明', 45, 0);
INSERT INTO `tb_advice` VALUES (14, 'ZM：测试测试！', '2017-04-25 09:31:29', 27, 53, '李春彬', 45, 0);
INSERT INTO `tb_advice` VALUES (15, '好的祝你好运', '2017-04-25 11:15:55', 30, 52, '李智锐', 67, 0);
INSERT INTO `tb_advice` VALUES (16, '123456', '2017-04-25 14:59:24', 26, 46, '李智明', 45, 0);
INSERT INTO `tb_advice` VALUES (17, '追问回答。', '2017-04-25 16:03:57', 35, 53, '李春彬', 45, 0);
INSERT INTO `tb_advice` VALUES (18, '多喝点酒', '2017-04-25 19:16:57', 29, 52, '李智锐', 67, 0);
INSERT INTO `tb_advice` VALUES (19, '有空出去搓一顿', '2017-04-25 19:19:24', 33, 52, '李智锐', 45, 0);
INSERT INTO `tb_advice` VALUES (20, '好的，谢谢你！辛苦了！', '2017-04-27 09:17:25', 36, 55, '邢若琪', 71, 0);
INSERT INTO `tb_advice` VALUES (21, '好的中午记得自己做饭', '2017-04-27 09:31:31', 39, 52, '（测试）李智锐', 69, 0);
INSERT INTO `tb_advice` VALUES (22, '觉得这个高科技好用吗？', '2017-04-27 17:01:35', 38, 55, '邢若琪', 71, 0);
INSERT INTO `tb_advice` VALUES (24, '好的谢谢', '2017-04-29 10:07:28', 40, 52, '（测试）李智锐', 69, 0);
INSERT INTO `tb_advice` VALUES (25, '一直发不出去啊，郁闷呢', '2017-04-29 10:21:00', 42, 55, '邢若琪', 79, 0);
INSERT INTO `tb_advice` VALUES (26, '收到', '2017-04-29 17:01:43', 32, 52, '（测试）李智锐', 45, 0);
INSERT INTO `tb_advice` VALUES (28, '\r\n用720.260.400.050\r\n贴大椎穴和右脚面', '2017-05-01 10:00:52', 43, 64, '彭爱莲', 78, 0);
INSERT INTO `tb_advice` VALUES (31, '要的', '2017-05-03 06:41:55', 22, 46, '（测试）李大明', 38, 1);
INSERT INTO `tb_advice` VALUES (32, '忌辛辣', '2017-05-03 06:57:59', 24, 46, '（测试）李大明', 38, 0);
INSERT INTO `tb_advice` VALUES (33, '让他试念\r\n4000.030.72000.1650', '2017-05-03 16:37:41', 50, 64, '彭爱莲', 71, 0);
INSERT INTO `tb_advice` VALUES (34, '邱静你好！\r\n把你俩的生辰报过来', '2017-05-03 16:39:18', 47, 64, '彭爱莲', 79, 0);
INSERT INTO `tb_advice` VALUES (36, '改念\r\n260.640.00300.078100\r\n要念和贴', '2017-05-03 20:41:35', 53, 64, '彭爱莲', 141, 0);
INSERT INTO `tb_advice` VALUES (37, '及时反馈', '2017-05-03 20:43:27', 52, 64, '彭爱莲', 71, 0);
INSERT INTO `tb_advice` VALUES (39, ' ? ?  ? ', '2017-05-04 17:13:26', 49, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (40, '26000•00500•7820•0430', '2017-05-04 17:53:44', 56, 55, '邢若琪', 160, 0);
INSERT INTO `tb_advice` VALUES (42, '\r\n建议：\r\n1.默念8200  7200  1660  4400  帮助排便\r\n2. 经常听听云水禅心可以宁心安神，稳定血压。\r\n3. 服用血塞通片预防心脑血管问题。\r\n', '2017-05-04 20:46:52', 67, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (43, '0005000•64000•3820•01110', '2017-05-04 21:52:39', 42, 55, '邢若琪', 79, 25);
INSERT INTO `tb_advice` VALUES (44, '已能追加回复，谢谢 ', '2017-05-04 22:10:57', 51, 52, '（测试）李智锐', 45, 0);
INSERT INTO `tb_advice` VALUES (45, '追加回复', '2017-05-04 22:12:36', 51, 52, '（测试）李智锐', 45, 1);
INSERT INTO `tb_advice` VALUES (46, '先用几天上次配方，有不适及时反馈！', '2017-05-05 06:27:24', 69, 53, '李春彬', 90, 0);
INSERT INTO `tb_advice` VALUES (55, '按新方执行。', '2017-05-05 06:35:15', 68, 53, '李春彬', 90, 0);
INSERT INTO `tb_advice` VALUES (56, '你好，给你母亲配方先调理心脏和疏肝，肝开窍于目(眼不舒)，肝风内动(不自觉摇头)。\r\n2600.44550.030.07810\r\n贴大椎和两脚背太沖穴。\r\n尿频可将下方贴丹田穴，不用念\r\n7000.65000\r\n情况可反馈。\r\n2017.5.5', '2017-05-05 14:45:08', 66, 64, '彭爱莲', 132, 0);
INSERT INTO `tb_advice` VALUES (57, '你好！\r\n我认为你们的婚姻还不致于要分开，刚才起卦看你们是一家,人，还是同路人。只是大家都不肯让步，每个人都心強气傲。肝火旺。情致失控。\r\n多念配方先调自已好吧\r\n400.030.800.260。', '2017-05-05 15:00:16', 59, 64, '彭爱莲', 79, 0);
INSERT INTO `tb_advice` VALUES (58, '你先念，然后用助念器帮你老公念。', '2017-05-05 15:02:23', 58, 64, '彭爱莲', 79, 0);
INSERT INTO `tb_advice` VALUES (59, '你好晓风！\r\n用077710.21660.445500.038200\r\n可贴大椎穴3条，腰部2条，两膝盖各l条\r\n可随时反馈。', '2017-05-06 20:30:23', 80, 64, '彭爱莲', 78, 0);
INSERT INTO `tb_advice` VALUES (60, '邱静你好！\r\n相信八卦象数疗法的能量！他会改好的！给他时间，你多包容！一定行！\r\n在你家客厅和你们卧室的乾位(西北位)贴配方，或放助念器24小时播放。\r\n0001000.2600.400..0810。\r\n有些话语音聊吧。\r\n', '2017-05-06 20:44:03', 76, 64, '彭爱莲', 79, 0);
INSERT INTO `tb_advice` VALUES (62, '需要调整。她现在情况咋样？\r\n看不到提示，回复晚了。', '2017-05-06 20:57:23', 81, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (65, '好吧', '2017-05-06 21:28:34', 44, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (66, '您好，金大姐。我前面回复你的看见了吗？', '2017-05-06 22:53:51', 55, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (68, '用200.160.400.720。写个布条拴小狗尾巴上，助念', '2017-05-07 22:44:01', 83, 64, '彭爱莲', 76, 0);
INSERT INTO `tb_advice` VALUES (69, '你好！\r\n贴穴位是根据病症而定的，不是统一标准，如：损有余可向下贴，下丹田、足三里、脚背冲阳穴、太冲穴等。几行酌情而定。', '2017-05-08 08:11:40', 86, 64, '彭爱莲', 132, 0);
INSERT INTO `tb_advice` VALUES (70, '杨丽你好！\r\n用0770.1660.0550.43800\r\n贴大椎、局部。\r\n下次求方请将性別、年令、症状讲清楚，以便辩证取数。谢谢！', '2017-05-09 14:53:45', 92, 64, '彭爱莲', 76, 0);
INSERT INTO `tb_advice` VALUES (71, '桂秋你好！\r\n用2000.650.03300.820\r\n贴大椎3个', '2017-05-09 14:56:55', 87, 64, '彭爱莲', 99, 0);
INSERT INTO `tb_advice` VALUES (72, '巳提交配方', '2017-05-09 14:58:13', 91, 64, '彭爱莲', 76, 0);
INSERT INTO `tb_advice` VALUES (73, '刚看到，就按早上说的用\r\n87200.1600.050\r\n友脚面4条，大椎1条', '2017-05-10 07:17:22', 94, 64, '彭爱莲', 78, 0);
INSERT INTO `tb_advice` VALUES (74, '嗯嗯嗯', '2017-05-10 20:39:11', 34, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (75, '有什么症状呢', '2017-05-10 20:43:39', 98, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (76, '多注意休息', '2017-05-10 20:45:32', 98, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (77, '休息好就没事了', '2017-05-10 20:45:48', 99, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (78, '嗯嗯', '2017-05-10 21:06:36', 100, 46, '（测试）李大明', 45, 1);
INSERT INTO `tb_advice` VALUES (79, '你好！\r\n念20.650.380\r\n贴大椎穴', '2017-05-11 06:41:28', 101, 64, '彭爱莲', 78, 0);
INSERT INTO `tb_advice` VALUES (80, '72000•2660•4330•3880', '2017-05-11 11:46:23', 95, 53, '李春彬', 165, 0);
INSERT INTO `tb_advice` VALUES (81, '72000•16000•44000•0300', '2017-05-11 11:47:12', 82, 53, '李春彬', 76, 0);
INSERT INTO `tb_advice` VALUES (82, '72000•650•4400•3820', '2017-05-11 11:47:57', 79, 53, '李春彬', 69, 0);
INSERT INTO `tb_advice` VALUES (83, '系统运行初期还不太适应。慢慢就好了。见谅！', '2017-05-11 11:49:39', 75, 53, '李春彬', 132, 0);
INSERT INTO `tb_advice` VALUES (84, '72000•010•2660•45300', '2017-05-11 11:51:22', 74, 53, '李春彬', 90, 0);
INSERT INTO `tb_advice` VALUES (86, '007200•260•6440•0810', '2017-05-12 10:22:41', 105, 55, '邢若琪', 160, 0);
INSERT INTO `tb_advice` VALUES (87, '8220•160•650•4300', '2017-05-12 15:23:23', 104, 53, '李春彬', 69, 0);
INSERT INTO `tb_advice` VALUES (88, '我也是不熟悉。我们慢慢适应。系统应该很不错的', '2017-05-14 20:17:56', 90, 56, '刘江', 129, 0);
INSERT INTO `tb_advice` VALUES (89, '金大姐，再试着应用这个系统。微信里的回复都看见了吧？\r\n您让我看的其他人来了，也看了。', '2017-05-14 20:22:11', 54, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (91, '007700.22116600', '2017-05-19 16:30:59', 46, 54, '耿文涛', 79, 0);
INSERT INTO `tb_advice` VALUES (95, '你好！\r\n牙疼念0770.200.01600.00500晚上贴右侧牙脸上。\r\n眼模糊念400.030.010.6440\r\n如果原方念的有效果还要持念', '2017-05-19 16:41:49', 110, 64, '彭爱莲', 110, 0);
INSERT INTO `tb_advice` VALUES (96, '眼睛的配方也可贴。', '2017-05-19 16:42:27', 111, 64, '彭爱莲', 110, 0);
INSERT INTO `tb_advice` VALUES (98, '您好，王秀玉。\r\n前面调理了几次，时有反复。\r\n现在情况咋样了？', '2017-05-20 16:51:43', 113, 56, '刘江', 152, 0);
INSERT INTO `tb_advice` VALUES (99, '王平您好，由于网络原因，我们在微信进行了几次咨询。\r\n现在您母亲情况咋样了？', '2017-05-20 16:54:45', 107, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (100, '您好王翠琴！\r\n前面微信里做了系列安排，根据你的详细病史。不知进来情况咋样了？', '2017-05-20 16:57:56', 88, 56, '刘江', 129, 0);
INSERT INTO `tb_advice` VALUES (101, '前面已经单独微信配方。', '2017-05-20 17:00:31', 106, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (103, '好的，按微信单独调整的配方默念。', '2017-05-20 17:02:26', 96, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (104, '您好，已经单独回复了。改善了吧？\r\n必要时加用酚酞片。晚上两片即可。安全无毒性反应。', '2017-05-20 17:04:53', 89, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (105, '金大姐，今天可以了吧？\r\n说说现在情况好吗？', '2017-05-20 17:05:48', 85, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (106, '您好，今天才看见。回复如下\r\n默念370  070  200针对脚趾头痛\r\n过敏用  200  160  050贴曲池，血海，大椎穴，穴位可百度一下你就知道。', '2017-05-20 17:10:07', 108, 56, '刘江', 169, 0);
INSERT INTO `tb_advice` VALUES (113, '金大姐，今天可以了吧？\r\n说说现在情况好吗？', '2017-05-20 17:12:31', 85, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (114, '您好，已经单独回复了。改善了吧？\r\n必要时加用酚酞片。晚上两片即可。安全无毒性反应。', '2017-05-20 17:13:01', 89, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (116, '好的，按微信单独调整的配方默念。', '2017-05-20 17:14:03', 96, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (117, '吃你的你觉得积点凯撒凯撒咔咔咔', '2017-05-22 09:56:38', 120, 48, '李明', 164, 0);
INSERT INTO `tb_advice` VALUES (118, '调理建议，回复1', '2017-05-22 10:04:46', 122, 52, '（测试）李智锐', 67, 0);
INSERT INTO `tb_advice` VALUES (119, '追加回复1，好好用。', '2017-05-22 10:08:39', 123, 52, '（测试）李智锐', 67, 0);
INSERT INTO `tb_advice` VALUES (120, '试试罗。', '2017-05-22 10:15:40', 124, 52, '（测试）李智锐', 67, 0);
INSERT INTO `tb_advice` VALUES (121, '你好！\r\n用72000.64440.03810\r\n贴局部', '2017-05-22 20:04:00', 118, 64, '彭爱莲', 78, 0);
INSERT INTO `tb_advice` VALUES (122, '你好！\r\n可以用，分开念也好。', '2017-05-22 20:06:10', 125, 64, '彭爱莲', 110, 0);
INSERT INTO `tb_advice` VALUES (125, '您好，请问有什么能为您效劳的吗？', '2017-05-26 03:10:24', 100, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (126, '您好，请问有什么能为您效劳的吗', '2017-05-26 03:22:54', 103, 46, '（测试）李大明', 45, 0);
INSERT INTO `tb_advice` VALUES (127, '您好，金大姐，现在看到这里了，上午已经在微信中回复，就用那个配方吧，80  720  160.', '2017-05-31 19:15:43', 141, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (128, '健康自述：刘老师您好！我先生53岁。16岁得神经性皮炎。一直无法治愈。他是个老师，上课显得中气不足，咽喉容易发炎，听力下降，以前脾气有点大。一周前我用您上课时分享的配方810.650.4440.20写在纸上放置床上后，脾气好些了。想请您赐象数配方。谢谢！\r\n平时默念   8200  160  0430   \r\n上面的做法很好，请继续。\r\n为了系统掌握你们的健康情况，请在普通\r\n微信里提供你们的耳朵，舌象，掌纹图片。\r\n其它问题还是尽量在中心提交为宜。\r\n\r\n\r\n', '2017-05-31 19:24:04', 136, 56, '刘江', 147, 0);
INSERT INTO `tb_advice` VALUES (129, '金大姐，这个问题在我微信中已经回复。请看看。', '2017-05-31 19:25:50', 140, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (130, '您好！诊断无疑，典型的过敏性鼻炎。\r\n目前的情况先默念72000  6500  3820.\r\n如果没有不适，睡前请将配方三条贴在鼻梁上。\r\n明天看看反应调整。', '2017-05-31 19:31:44', 135, 56, '刘江', 176, 0);
INSERT INTO `tb_advice` VALUES (131, '您好！让久等了，我前面对这个系统不太适应。请把病历资料发给我看看吧。', '2017-05-31 19:34:21', 129, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (132, '刚才看见，对不起。已经好了吧？', '2017-05-31 19:35:49', 134, 56, '刘江', 78, 0);
INSERT INTO `tb_advice` VALUES (133, '刚才看见，对不起。已经好了吧！', '2017-05-31 19:36:51', 134, 56, '刘江', 78, 0);
INSERT INTO `tb_advice` VALUES (134, '您好，诊断无疑。\r\n默念72000  6500  0380\r\n如果没有不适，夜里贴三条配方在鼻梁上', '2017-05-31 19:39:33', 135, 56, '刘江', 176, 0);
INSERT INTO `tb_advice` VALUES (135, '好的。看看舌象吧\r\n如果不行，说说咳嗽时间多久了，起初有没有感冒。\r\n先默念200   0500   430及时反馈调节。', '2017-05-31 20:04:56', 144, 56, '刘江', 180, 0);
INSERT INTO `tb_advice` VALUES (136, '是的，更换配方。', '2017-06-01 17:34:54', 153, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (137, '默念880  770  1650', '2017-06-01 17:36:22', 154, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (138, '你母亲气阴两虚，不能摄汗。汗出更虚。\r\n默念  300   7720   260\r\n且服生脉口服液，每天两支，黄芪颗粒每天两（包）。\r\n', '2017-06-01 17:42:13', 151, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (139, '你母亲气阴两虚，不能摄汗。汗出更虚。\r\n默念  300   7720   260\r\n且服生脉口服液，每天两支，黄芪颗粒每天两（包）。\r\n', '2017-06-01 17:43:06', 151, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (140, '你母亲气阴两虚，不能摄汗。汗出更虚。\r\n默念  300   7720   260\r\n且服生脉口服液，每天两支，黄芪颗粒每天两（包）。\r\n', '2017-06-01 17:44:06', 151, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (141, '好的。现在可默念820  720 1600  440.', '2017-06-01 17:47:34', 148, 56, '刘江', 90, 0);
INSERT INTO `tb_advice` VALUES (142, '需要。默念\r\n300   080  020   1600.\r\n几天后酌情调整。王平', '2017-06-01 17:52:01', 146, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (143, '好的，金大姐。', '2017-06-01 17:52:28', 147, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (144, '好的，金大姐。', '2017-06-01 17:53:51', 147, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (145, '需要。默念\r\n300   080  020   1600.\r\n几天后酌情调整。王平', '2017-06-01 17:54:29', 146, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (146, '默念  300  080  020  1600', '2017-06-01 17:56:12', 146, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (147, '默念  300  080  020  1600', '2017-06-01 17:56:57', 146, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (148, '你母亲气阴两虚，不能摄汗。汗出更虚。\r\n默念  300   7720   260\r\n且服生脉口服液，每天两支，黄芪颗粒每天两（包）。\r\n', '2017-06-01 17:57:39', 151, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (149, '你母亲气阴两虚，不能摄汗。汗出更虚。\r\n默念  300   7720   260\r\n且服生脉口服液，每天两支，黄芪颗粒每天两（包）。\r\n', '2017-06-01 17:58:16', 151, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (150, '默念880  770  1650', '2017-06-01 17:58:52', 154, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (151, '820•260•0450•010', '2017-06-02 10:06:15', 142, 55, '邢若琪', 180, 0);
INSERT INTO `tb_advice` VALUES (152, '820•260•0450•010', '2017-06-02 10:06:41', 143, 55, '邢若琪', 180, 0);
INSERT INTO `tb_advice` VALUES (153, 'OK', '2017-06-03 11:24:56', 126, 52, '（测试）李智锐', 100, 0);
INSERT INTO `tb_advice` VALUES (154, 'OK', '2017-06-03 11:25:07', 62, 52, '（测试）李智锐', 164, 0);
INSERT INTO `tb_advice` VALUES (155, '文锡英   他血压还要观察，没有那样简单。\r\n甲状腺结节无需多虑。\r\n明天看看舌象，耳朵，全身照片\r\n然后再配方好吧！', '2017-06-03 14:47:11', 156, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (156, '文锡英   他血压还要观察，没有那样简单。\r\n甲状腺结节无需多虑。\r\n明天看看舌象，耳朵，全身照片\r\n然后再配方好吧！', '2017-06-03 14:47:35', 156, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (157, '两边耳朵，舌象上下两面。调整工作节奏，稳定情绪。\r\n甲状腺结节多数是良性的。\r\n有恶性倾向可以阻断。', '2017-06-03 19:32:09', 158, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (158, '今天情况咋样？', '2017-06-03 19:32:45', 155, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (159, '好的', '2017-06-03 19:33:16', 157, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (160, '好的。发的图片已经看到了。我这次就发微信吧。', '2017-06-05 19:58:21', 165, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (161, '您重新发给彭老师吧 ', '2017-06-05 20:00:08', 162, 56, '刘江', 131, 0);
INSERT INTO `tb_advice` VALUES (162, '好的，咳血停止了。\r\n现在默念72200  16400  03800', '2017-06-05 20:02:17', 159, 56, '刘江', 187, 0);
INSERT INTO `tb_advice` VALUES (163, '如果还是没联系上彭老师，可先试用\r\n77720  16500   4440', '2017-06-05 20:04:47', 161, 56, '刘江', 131, 0);
INSERT INTO `tb_advice` VALUES (164, '照片收到，那边已回复', '2017-06-05 20:05:42', 164, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (165, '照片收到，那边已回复', '2017-06-05 20:59:43', 164, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (166, '\r\n需要。现在默念380  720   160   4440', '2017-06-05 21:18:16', 167, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (167, '\r\n需要。现在默念380  720   160   4440', '2017-06-05 21:18:43', 167, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (168, '照片收到，那边已回复', '2017-06-05 21:19:13', 164, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (169, '照片收到，那边已回复', '2017-06-05 21:19:23', 164, 56, '刘江', 100, 0);
INSERT INTO `tb_advice` VALUES (170, '好的，咳血停止了。\r\n现在默念72200  16400  03800', '2017-06-05 21:21:24', 159, 56, '刘江', 187, 0);
INSERT INTO `tb_advice` VALUES (171, '072000•16000•64400•0300', '2017-06-06 08:20:43', 149, 53, '李春彬', 138, 0);
INSERT INTO `tb_advice` VALUES (172, '650•430•872000', '2017-06-06 08:21:39', 139, 53, '李春彬', 165, 0);
INSERT INTO `tb_advice` VALUES (173, '72000•6550•4330•82000', '2017-06-06 08:22:27', 137, 53, '李春彬', 179, 0);
INSERT INTO `tb_advice` VALUES (174, '0770•002200•6400', '2017-06-06 08:23:23', 115, 53, '李春彬', 76, 0);
INSERT INTO `tb_advice` VALUES (175, '办面授班忙的没顾上。', '2017-06-06 08:24:17', 116, 53, '李春彬', 76, 0);
INSERT INTO `tb_advice` VALUES (176, '72000•65000•44550•380', '2017-06-06 08:26:19', 150, 53, '李春彬', 176, 0);
INSERT INTO `tb_advice` VALUES (177, '7772000•650•450•380\r\n办面授班太忙，加上网络不稳，请见谅！', '2017-06-06 08:27:56', 132, 53, '李春彬', 177, 0);
INSERT INTO `tb_advice` VALUES (178, '7772000•64000•450', '2017-06-06 08:28:29', 127, 53, '李春彬', 100, 0);
INSERT INTO `tb_advice` VALUES (179, '测试成功！', '2017-06-06 08:28:55', 128, 53, '李春彬', 100, 0);
INSERT INTO `tb_advice` VALUES (180, '间质性肺炎吧？\r\n默念200  0500  0430   720', '2017-06-09 17:15:30', 169, 56, '刘江', 158, 0);
INSERT INTO `tb_advice` VALUES (181, '说说现在症状吧，详细一点，第一次', '2017-06-12 19:35:33', 171, 56, '刘江', 158, 0);
INSERT INTO `tb_advice` VALUES (182, '对，只有间质性肺炎。可以贴上背部，对应肺的两边，各两条配方。', '2017-06-12 19:37:43', 170, 56, '刘江', 158, 0);
INSERT INTO `tb_advice` VALUES (183, '你发错了。老詹', '2017-06-12 19:39:25', 160, 56, '刘江', 131, 0);
INSERT INTO `tb_advice` VALUES (184, '不好意思，这个是测试号。请重新向其他老师发起咨询。抱歉。', '2017-06-12 22:59:11', 173, 48, '李明', 165, 0);
INSERT INTO `tb_advice` VALUES (185, '不好意思，这个是测试号。请重新向其他老师发起咨询。抱歉。', '2017-06-12 22:59:12', 173, 48, '李明', 165, 0);
INSERT INTO `tb_advice` VALUES (186, '007200•650•04300•82000', '2017-06-13 16:57:46', 179, 53, '李春彬', 158, 0);
INSERT INTO `tb_advice` VALUES (187, '更换为260   0430  80  0720\r\n\r\n同时贴在右足背上，三条配方。\r\n\r\n听音乐 云水禅心', '2017-06-13 17:48:17', 178, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (188, '这条见微信给你回的。', '2017-06-13 17:49:26', 176, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (189, '老人用哪个配方感受好就用哪个。', '2017-06-20 21:23:05', 184, 56, '刘江', 187, 0);
INSERT INTO `tb_advice` VALUES (190, '慢慢就熟悉了，我们都有这个过程', '2017-06-20 21:23:59', 185, 56, '刘江', 187, 0);
INSERT INTO `tb_advice` VALUES (191, '微信已经回了。就用那个配方好吧。', '2017-06-20 21:24:56', 183, 56, '刘江', 162, 0);
INSERT INTO `tb_advice` VALUES (192, '陈老师您好！\r\n我这些天进不来，今天才看到，现在什么情况？', '2017-06-22 10:53:18', 182, 64, '彭爱莲', 107, 0);
INSERT INTO `tb_advice` VALUES (193, '陈老师您好！\r\n我这些天进不来，今天才看到，现在什么情况？', '2017-06-22 10:59:55', 182, 64, '彭爱莲', 107, 0);
INSERT INTO `tb_advice` VALUES (194, '你好！\r\n前段时间中心,进不来，沒看到，如需要再来信', '2017-06-22 11:02:06', 166, 64, '彭爱莲', 139, 0);
INSERT INTO `tb_advice` VALUES (195, '詹老师您好！\r\n这条信息很久了。只因进不了中心，现在才看到。哈哈……', '2017-06-22 11:04:52', 163, 64, '彭爱莲', 131, 0);
INSERT INTO `tb_advice` VALUES (196, '你好！\r\n前段时间进不了中心。才看到，需要再发信。', '2017-06-22 11:07:20', 131, 64, '彭爱莲', 142, 0);
INSERT INTO `tb_advice` VALUES (197, '你好！\r\n前段时间进不了中心，才看到。需要再来信。', '2017-06-22 11:09:34', 130, 64, '彭爱莲', 174, 0);
INSERT INTO `tb_advice` VALUES (198, '72000•65000•44000•38000', '2017-06-24 11:17:18', 186, 53, '李春彬', 135, 0);
INSERT INTO `tb_advice` VALUES (199, '72000•65000•44000•38000\r\n72000（山泽通气，通利关节）65000（散寒祛湿通阳）44000（疏泄调达，气机通畅）38000（健脾强运，运化风湿之邪）', '2017-06-24 18:02:19', 189, 53, '李春彬', 135, 0);
INSERT INTO `tb_advice` VALUES (200, '你好！一个患者不能反复要方。就按春彬老师给的念吧，跟着一个老师思路。', '2017-06-25 08:26:47', 192, 64, '彭爱莲', 76, 0);
INSERT INTO `tb_advice` VALUES (201, '3820•16650•44000•3872000', '2017-06-26 13:14:33', 195, 53, '李春彬', 107, 0);
INSERT INTO `tb_advice` VALUES (202, '继续念', '2017-06-26 13:15:12', 191, 53, '李春彬', 135, 0);
INSERT INTO `tb_advice` VALUES (203, '继续念前方', '2017-06-26 13:15:59', 190, 53, '李春彬', 135, 0);
INSERT INTO `tb_advice` VALUES (204, '72000•6450•382000', '2017-06-26 13:16:49', 187, 53, '李春彬', 83, 0);
INSERT INTO `tb_advice` VALUES (205, '07200•2600•6400', '2017-06-26 18:37:19', 196, 53, '李春彬', 158, 0);
INSERT INTO `tb_advice` VALUES (206, '07770•01110•66640•44550', '2017-06-29 20:00:00', 203, 53, '李春彬', 158, 0);
INSERT INTO `tb_advice` VALUES (207, '调整一下\r\n默念650  400  430  820  ', '2017-06-30 12:30:18', 204, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (208, '好的。在微信那边已经调理两次解决了。\r\n迟复为歉。', '2017-06-30 12:32:00', 197, 56, '刘江', 78, 0);
INSERT INTO `tb_advice` VALUES (209, '调整一下\r\n\r\n0400  4300  820   160', '2017-07-02 11:03:23', 209, 56, '刘江', 125, 0);
INSERT INTO `tb_advice` VALUES (210, '72000•1650•4400•0330•82000', '2017-07-02 18:20:18', 212, 53, '李春彬', 69, 0);
INSERT INTO `tb_advice` VALUES (211, '07200•26440•0300•8220', '2017-07-02 18:21:17', 207, 53, '李春彬', 83, 0);
INSERT INTO `tb_advice` VALUES (212, '知道了', '2017-07-02 18:21:40', 213, 53, '李春彬', 69, 0);
INSERT INTO `tb_advice` VALUES (213, '已配象数方', '2017-07-02 18:25:06', 208, 53, '李春彬', 69, 0);
INSERT INTO `tb_advice` VALUES (214, '已发送', '2017-07-02 18:25:27', 206, 53, '李春彬', 83, 0);
INSERT INTO `tb_advice` VALUES (215, '已发送', '2017-07-02 18:25:53', 205, 53, '李春彬', 83, 0);
INSERT INTO `tb_advice` VALUES (216, '哦，你父亲是土月生人，然后呢他九宫飞伏在坎。这样，就形成了土克水的格局。所以，就容易患肾脏方面的疾病。方法调理方法，化土培金固肾。配方：87222000•16660•4455000•4300\r\n', '2017-07-07 10:48:59', 215, 53, '李春彬', 69, 0);
INSERT INTO `tb_advice` VALUES (217, '82000•665500•4000•0300', '2017-07-07 13:40:25', 216, 53, '李春彬', 107, 0);
INSERT INTO `tb_advice` VALUES (218, '好的，孙老师\r\n默念72000  0016  005  003\r\n酌情调整，随时联系。', '2017-07-09 10:48:41', 217, 56, '刘江', 135, 0);
INSERT INTO `tb_advice` VALUES (219, '220•6500•4300•08710', '2017-07-09 21:18:50', 220, 53, '李春彬', 158, 0);
INSERT INTO `tb_advice` VALUES (220, '66666666', '2017-07-16 18:56:34', 221, 46, '（测试）李大明', 147, 0);
INSERT INTO `tb_advice` VALUES (221, '66666666', '2017-07-16 19:03:54', 221, 46, '（测试）李大明', 147, 0);
INSERT INTO `tb_advice` VALUES (222, '2019.1.16导师第一次回复', '2019-01-16 15:25:37', 222, 46, '（测试）李大明', 51, 0);
INSERT INTO `tb_advice` VALUES (223, '2019.1.16追加回复', '2019-01-16 15:39:33', 223, 46, '（测试）李大明', 51, 0);

-- ----------------------------
-- Table structure for tb_audio
-- ----------------------------
DROP TABLE IF EXISTS `tb_audio`;
CREATE TABLE `tb_audio`  (
  `audio_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '音频编号',
  `audio_number` int(5) NOT NULL COMMENT '音频数字',
  `audio_filePath` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '音频路径',
  `audio_soundSource` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '归属音源',
  PRIMARY KEY (`audio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_audio
-- ----------------------------
INSERT INTO `tb_audio` VALUES (226, 0, '/readDeviceMusic/10004/0.mp3', '男音');
INSERT INTO `tb_audio` VALUES (227, 1, '/readDeviceMusic/10004/1.mp3', '男音');
INSERT INTO `tb_audio` VALUES (228, 2, '/readDeviceMusic/10004/2.mp3', '男音');
INSERT INTO `tb_audio` VALUES (229, 3, '/readDeviceMusic/10004/3.mp3', '男音');
INSERT INTO `tb_audio` VALUES (230, 4, '/readDeviceMusic/10004/4.mp3', '男音');
INSERT INTO `tb_audio` VALUES (231, 5, '/readDeviceMusic/10004/5.mp3', '男音');
INSERT INTO `tb_audio` VALUES (232, 6, '/readDeviceMusic/10004/6.mp3', '男音');
INSERT INTO `tb_audio` VALUES (233, 7, '/readDeviceMusic/10004/7.mp3', '男音');
INSERT INTO `tb_audio` VALUES (234, 8, '/readDeviceMusic/10004/8.mp3', '男音');
INSERT INTO `tb_audio` VALUES (235, 0, '/readDeviceMusic/10005/0.mp3', '女音');
INSERT INTO `tb_audio` VALUES (236, 1, '/readDeviceMusic/10005/1.mp3', '女音');
INSERT INTO `tb_audio` VALUES (237, 2, '/readDeviceMusic/10005/2.mp3', '女音');
INSERT INTO `tb_audio` VALUES (238, 3, '/readDeviceMusic/10005/3.mp3', '女音');
INSERT INTO `tb_audio` VALUES (239, 4, '/readDeviceMusic/10005/4.mp3', '女音');
INSERT INTO `tb_audio` VALUES (240, 5, '/readDeviceMusic/10005/5.mp3', '女音');
INSERT INTO `tb_audio` VALUES (241, 6, '/readDeviceMusic/10005/6.mp3', '女音');
INSERT INTO `tb_audio` VALUES (242, 7, '/readDeviceMusic/10005/7.mp3', '女音');
INSERT INTO `tb_audio` VALUES (243, 8, '/readDeviceMusic/10005/8.mp3', '女音');

-- ----------------------------
-- Table structure for tb_consultation_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_consultation_record`;
CREATE TABLE `tb_consultation_record`  (
  `record_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '老师微信唯一码',
  `teacher_id` int(20) NOT NULL COMMENT '老师id',
  `symptom_description` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '症状描述',
  `water_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '流水单号',
  `consult_time` datetime NOT NULL COMMENT '咨询时间',
  `advice` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '调理建议',
  `advice_time` datetime NULL DEFAULT NULL COMMENT '建议时间',
  `additional_advice` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '追加建议',
  `additional_advice_time` datetime NULL DEFAULT NULL COMMENT '追加时间',
  `exceptional_status` int(2) NOT NULL COMMENT '打赏情况',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_consultation_record
-- ----------------------------
INSERT INTO `tb_consultation_record` VALUES (2, 'onMY25yKvMBCj5HTvXM9IdIamTjI', 20, '我经常腰疼，不能受累，下雨天更加严重怎么弄', '', '2019-03-05 00:11:20', '平时要注意坐姿，多运动，加强腰背肌肉功能锻炼，不要睡软床，晚上可以热敷，膏药，希望我能帮助到你，祝您早日康复！', '2019-03-19 00:11:39', '建议避免久坐及重体力劳动，针灸理疗治疗缓解症状', '2019-03-05 00:13:12', 0);
INSERT INTO `tb_consultation_record` VALUES (5, 'onMY25z7vAOeUs2HAkKg3A0FajxU', 20, '我老公一年前腿断了，康复之后经常腿疼，怎么办才好', '', '2019-03-12 23:31:08', '睡觉前一定要用热水泡脚，可减轻疼痛。休息时尽量采取双腿抬高姿势，局部可以热敷、按摩或用随身携带的微型按摩器等进行治疗，同时也可用一些治疗跌打损伤的药物，如外用喷雾剂或红花油揉擦，以促进局部血液循环。 ', '2019-03-28 23:35:24', '用手指或手掌以绕圈方式快速地来回摩擦皮肤表面。 压迫：多半接着揉捏动作使用，用你的手掌对肌肉从垂直角度施加压力；', '2019-03-27 23:35:36', 0);
INSERT INTO `tb_consultation_record` VALUES (15, 'ooimO1bnnE9LiyuL-DAolq_697_w', 20, '我经常心脏跳动很快怎么办', '', '2019-04-16 20:57:35', NULL, NULL, NULL, NULL, 0);
INSERT INTO `tb_consultation_record` VALUES (16, 'ooimO1bnnE9LiyuL-DAolq_697_w', 20, '我经常失眠多梦，晚上睡不好，导致白天也没有精神，很乏，很累，不知什么原因，想请教一下老师', '', '2019-04-29 20:27:19', '可能是肝郁导致，建议用中药调理合并适量运动进行治疗，推荐服用千金加味逍遥丸，祝您健康', '2019-04-29 20:39:15', NULL, NULL, 0);
INSERT INTO `tb_consultation_record` VALUES (17, 'ooimO1bnnE9LiyuL-DAolq_697_w', 20, '我最近皮肤暗黄发黑，气色特别不好，吃不下饭，也不知道是哪里出了问题，想请教一下老师', '', '2019-04-29 20:30:25', '皮肤暗黄发黑可能是肝、胆、脾不调导致的，要多注意睡眠，多服用纯植物的调理品，保持心情愉快，祝您健康', '2019-04-29 20:50:06', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_consumer
-- ----------------------------
DROP TABLE IF EXISTS `tb_consumer`;
CREATE TABLE `tb_consumer`  (
  `consumer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '微信唯一码',
  `consumer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `consumer_sex` int(2) NULL DEFAULT NULL COMMENT '用户性别',
  `consumer_country` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '国家',
  `consumer_city` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `attention_time` datetime NULL DEFAULT NULL COMMENT '关注时间',
  `consumer_head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  PRIMARY KEY (`consumer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_consumer
-- ----------------------------
INSERT INTO `tb_consumer` VALUES (1, 'onMY25y8rUj525SIrbRD3WVYWykU', '音无得声', 1, '法国', '', '2019-03-27 22:17:13', 'http://thirdwx.qlogo.cn/mmopen/YBjIxwTickDVCA6rqtSTLaoNbmvMIWrgSibOlFLha6x5bAOICLfMEYQlJpdcVqVVUkH2WaicZ60LjwkCmx0ZM7yWcq8nFKGWo9ic/132');
INSERT INTO `tb_consumer` VALUES (2, 'onMY25yKvMBCj5HTvXM9IdIamTjI', 'DING', 1, '中国', '绍兴', '2019-03-27 22:19:07', 'http://thirdwx.qlogo.cn/mmopen/Qqz0tkVwNVFiayHefzNh2lMCvXZrNomekAvYdjPuwxmNvbIibDvYNtd9fARicS9cuGicp99x6GoXibSiaaqLjicgHFibiahF6YHjPTYS3/132');
INSERT INTO `tb_consumer` VALUES (3, 'onMY25z7vAOeUs2HAkKg3A0FajxU', 'Violet', 2, '', '', '2019-03-27 23:27:51', 'http://thirdwx.qlogo.cn/mmopen/YBjIxwTickDWfWdXM0IMZpr7dn6EKRI0zI6KcFujFn8rePCaNJ45Qw2u3PerY3vpcRzaxnPCjS7hFOyeqzdmMUFscq1dZvpt3/132');
INSERT INTO `tb_consumer` VALUES (4, 'ooimO1bnnE9LiyuL-DAolq_697_w', '小猪熊', 1, '中国', NULL, '2019-04-02 10:46:17', 'http://thirdwx.qlogo.cn/mmopen/YBjIxwTickDWfWdXM0IMZpr7dn6EKRI0zI6KcFujFn8rePCaNJ45Qw2u3PerY3vpcRzaxnPCjS7hFOyeqzdmMUFscq1dZvpt3/132');
INSERT INTO `tb_consumer` VALUES (6, 'ooimO1ZLFqR7yWbrzoyGvdMlNK4I', '大白鬼', 2, '中国', '', '2019-04-02 20:05:39', 'http://thirdwx.qlogo.cn/mmopen/bUKZRA5Z1WtKxqS7NF7O1iaicT6NAEcdl9JXdPZDrichoMu1xVhLCI0OCck7q7BC0ibrDH91bXyBa9MpubLPW35yibCBYOBJWia6hm/132');
INSERT INTO `tb_consumer` VALUES (7, 'o9rze52bd6HuYHLLvj-s-pPo0KX4', '皮卡皮', 2, '中国', '', '2019-04-20 09:02:31', 'http://thirdwx.qlogo.cn/mmopen/2cpY25o7cbcKQ66SvjOnV8iadbcjHheiajXe3h3rHhtWjibHfNCUB3KFj5EwIUUro3jFOa5MgFQxDV6qIQWs2n705knuO8ne6UD/132');
INSERT INTO `tb_consumer` VALUES (8, 'o9rze51SCfXBB6AbrUjWkPllvyLE', '小猪熊', 2, '中国', '齐齐哈尔', '2019-04-23 10:50:29', 'http://thirdwx.qlogo.cn/mmopen/2cpY25o7cbcRic7CNe1Mea2AL7zicc6VlIvc6dNx6Pibuy5vLe89EdBOoY1mAv7kDUIrRrRynhSbeZVulaYqMBwoEh1830hPgWic/132');
INSERT INTO `tb_consumer` VALUES (9, 'osrX41eETKa5_RE4eS8NzyVQD4fo', '扶苏', 1, '', '', '2019-04-29 21:52:11', 'http://thirdwx.qlogo.cn/mmopen/0TUswMU2zLJKOupPe8fYZT1pNOqibrU8DX0LEHx4PGH1tMTYGNYdxznIX1RwRPPVpiavhRibria2roAsPkpiaibJIUsdTUxKe4EH6g/132');
INSERT INTO `tb_consumer` VALUES (14, 'oM4Zwv3_xzU9NJwlZLd5Q0c3ZBzc', '无期廷', 1, '中国', '贺州', '2019-04-30 18:02:29', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LxkYVxl4otj9YR7wMynwbyt66picZoV7jClOOr1wRloiavNFXl278NI6Cboad9CXqvZQ7sCZxN4f4ULPVh7fvkBa/132');
INSERT INTO `tb_consumer` VALUES (15, 'oM4Zwv72jQLw33DxK4QeZ44LZNU0', '道远易经风水研究15725063809', 0, '', '', '2019-04-30 18:44:19', 'http://thirdwx.qlogo.cn/mmopen/usxAicjvUJvcXkYpov4OCv9D7J4CHlv9vMibCvTy3MZPU4PMeVffUficXXplEWEEJIaotDyK7VKhyicgSHqjh62TFcBQBCEpwo0o/132');
INSERT INTO `tb_consumer` VALUES (16, 'oM4ZwvxS02nzpfHsbcPbW8RMr99I', '吕嘉毅', 1, '中国', '茂名', '2019-04-30 22:00:31', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9KGtMicRKqV5HBXLwuYIRzFUiahCFUrgicFYGhbLLhRyibUby18sOQ92ibQxpv3qZN03DJ8fmM57ED8gPYkIIEOuALps/132');
INSERT INTO `tb_consumer` VALUES (17, 'oM4ZwvzME3QZ81slZ24y_4RopgYE', '暖暖', 2, '中国', '青岛', '2019-05-01 15:43:07', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LfJ2Ytltg388OdFtSXauxOf3icPCT9VQpU7uLMk3BqCr2MMRUqo5b1AMzMl90GauMtEiaMptjs2jMjbaLRRA7mbc/132');
INSERT INTO `tb_consumer` VALUES (18, 'oM4ZwvwzUbrsvx6WbN7fpxvPmE2o', '蜜', 2, '中国', '株洲', '2019-05-01 16:18:38', 'http://thirdwx.qlogo.cn/mmopen/7rsSvDn8pv99bhro3v4AVJc58BbbITAxrCeUkm0N6hLEXDQvvVOXUVEtkOyKADpV5OyNdyqN8DgU31NiaLGFgticEZEzfcmwibM/132');
INSERT INTO `tb_consumer` VALUES (19, 'oM4Zwv5965sbZrhyHDqey9EUA2-I', '郁金香', 0, '', '', '2019-05-01 21:33:37', 'http://thirdwx.qlogo.cn/mmopen/loCZt2ey3L0DcEAX1nK02knG86fShZ9txS5tyECtyE8wgdtFOtKBu4WR91SY9Cav9PK0IqC12ftOHZrfIkKvgksxeibtOdHyH/132');
INSERT INTO `tb_consumer` VALUES (20, 'oM4Zwv9SAwZycJyJiHS7az0bEeiU', 'Mr Kong', 1, '中国', '深圳', '2019-05-01 22:35:35', 'http://thirdwx.qlogo.cn/mmopen/7rsSvDn8pvibMPgIDUWO2qhyBEcwLQic7Yq0Wthks7eibKOWRyhU00JWpUibHtGZuzRRMlZ2SR5Q68R1LUpo1bMtrGh2Df4vgleE/132');
INSERT INTO `tb_consumer` VALUES (21, 'oM4ZwvxW8VqEmYf6VjbpRoKFb9tg', '喜庆*', 2, '中国', '青岛', '2019-05-01 22:42:26', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LfJ2Ytltg38zviaP7JnW2F2cfGQ3mP1b11ly9lGKs52TVa90LbF4Hmbsxue8DAKNBpLBfNdSQ5zUqJ4B1x58517/132');
INSERT INTO `tb_consumer` VALUES (22, 'oM4Zwv07EjJoDpDlRFoOudKMpGkw', '时代万康口腔陈梅清', 2, '中国', '温州', '2019-05-01 22:55:44', 'http://thirdwx.qlogo.cn/mmopen/VvN6Of3jHL5mkN8mHV9KlwvD2yTfXWPzN32piax4QHLnclP0vCB7HFARD9LSM9esaQlcRqeFibBCKIAPxa6XnOdicPVWxibuaibza/132');
INSERT INTO `tb_consumer` VALUES (23, 'oM4Zwv6om9B9BW_9TAw8CcbRCpaY', '高高', 2, '中国', '深圳', '2019-05-02 00:08:09', 'http://thirdwx.qlogo.cn/mmopen/7rsSvDn8pvibMPgIDUWO2qo38XJxsKibX6SamOkDH4FPDZz7xHe2yoCZp62tSaLrErK6TmHuAiaMNbtYMXxT06YibXrv6zmR5dicj/132');
INSERT INTO `tb_consumer` VALUES (24, 'oM4Zwv_VoDK-UFV14RXdAiqM7tTE', '汪洋大海 -如橙', 2, '中国', '济南', '2019-05-02 06:02:20', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LOOBywT9AOK5aECH2AGI91h2tOYmHCKTLhT7o3jZ9bu9lER1QOFp4KKMv8WDBg9NiajjtM31Zc7XE6XMws4Wj3y/132');
INSERT INTO `tb_consumer` VALUES (25, 'oM4Zwv5dEFZ-GoqOGHgID1RGtW9k', '丁不赟（黄广廉妈妈）', 2, '中国', '武汉', '2019-05-02 06:44:31', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LfJ2Ytltg385HAkJFohvP6v15gZfdPENXBOn0I90HqvjR9lgNuBwiaunzbVpUcOMpWkHhpXam0Q2s91h8mcIOPf/132');
INSERT INTO `tb_consumer` VALUES (26, 'oM4ZwvyvJdWxPjslJvZXGU5AxI3w', '皮卡皮', 2, '中国', '', '2019-05-02 11:21:26', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LibiaUFFWBc2V71MPJkfWrSlCGfYHXiaK3R2w0dx3L3zyluOOibw3noAzaSnEx2AJ1LKssf85f4Mxf3Gf0Ew2vRgUN/132');
INSERT INTO `tb_consumer` VALUES (27, 'oM4Zwv-NoYPmbobyixQvsFkyD6Xg', '毳毳', 0, '', '', '2019-05-02 13:26:29', 'http://thirdwx.qlogo.cn/mmopen/7rsSvDn8pvibMPgIDUWO2ql4xNnODG9v2vBGWNgI3lGDRbv8C9zFYTrAfSnJVvzPRRkthL5LEN51XOKMxDI6YYyp0RShrHhL5/132');
INSERT INTO `tb_consumer` VALUES (28, 'oM4Zwv9w_RV7Xe3Fu38Wz70uFrrI', '晰', 1, '中国', '梧州', '2019-05-02 14:13:09', 'http://thirdwx.qlogo.cn/mmopen/loCZt2ey3L1BoRlVHKVvY15ibfabaV7sj2C2tGeNObZqKqBEqicPeW3GECTicibiaDuGsTVicxeq3oibVanzWUb7gM0JC8rE78QKa7o/132');
INSERT INTO `tb_consumer` VALUES (29, 'oM4ZwvwXhfKzAI9opQMZ-ZFetjz8', '默·莫', 2, '中国', '深圳', '2019-05-02 16:32:10', 'http://thirdwx.qlogo.cn/mmopen/OUicWJdJoz3FTjbticbSJca3YphGsbF7pNuJ86aa8zbYAb4cKvnGJE2skzopcUgrQ4fM7LfxZJJDGQQjCAZHGib1uKexGNmKQB6/132');
INSERT INTO `tb_consumer` VALUES (31, 'oM4ZwvxzPe_RBtXO61rfrSOpdzsE', '陈先生', 1, '中国', '滨海新区', '2019-05-02 19:36:04', 'http://thirdwx.qlogo.cn/mmopen/loCZt2ey3L1BoRlVHKVvYzxEqBeBFjHcpXMRuYKle0ffEalIicsVEXv0WXe8abQK3flBiajUDicpolKSsjuicRZg4XPgfCnn4qs5/132');
INSERT INTO `tb_consumer` VALUES (32, 'oM4ZwvxzPe_RBtXO61rfrSOpdzsE', '陈先生', 1, '中国', '滨海新区', '2019-05-02 19:36:04', 'http://thirdwx.qlogo.cn/mmopen/loCZt2ey3L1BoRlVHKVvYzxEqBeBFjHcpXMRuYKle0ffEalIicsVEXv0WXe8abQK3flBiajUDicpolKSsjuicRZg4XPgfCnn4qs5/132');
INSERT INTO `tb_consumer` VALUES (33, 'oM4Zwvy1JAX4nG0Bt9ppSpZw8yi0', '明 008100', 1, '中国', '朝阳', '2019-05-02 19:54:44', 'http://thirdwx.qlogo.cn/mmopen/5Dib6WZWJY9LfJ2Ytltg381LB7icbP4S92ABIl8SK23XZR4LdZ50uz8ic8QTNScPqbiczAgTFmnbs3mTzF93vbbS0RlkypkSQb8W/132');
INSERT INTO `tb_consumer` VALUES (34, 'oM4Zwv1VQowpsZFTUWapdDctObiI', '知一', 0, '中国', '南阳', '2019-05-02 22:53:42', 'http://thirdwx.qlogo.cn/mmopen/7rsSvDn8pv8uVVafVVvHo3Q63RRYpWzFI3ibZNiaichrVCfzNR6uCYgvp3S4iau4mtRiaxEcup2pMoiaXk8HSABMv90uc0uGsAzabt/132');
INSERT INTO `tb_consumer` VALUES (35, 'oM4Zwv5ByPdQl3LZ5y1hvbBIfxx4', '北葵向暖', 2, '冰岛', '', '2019-05-03 06:42:27', 'http://thirdwx.qlogo.cn/mmopen/OUicWJdJoz3Epwap3Ew4FVeibcgDwmnfbBXG7bQTPqicL1NjXGuK6eAFRjlyKGINdma5GqPcqk9w7z3Ce7Z514Hkj2he93ba4KH/132');
INSERT INTO `tb_consumer` VALUES (36, 'oM4Zwv4lfvng_yig9GE_yoeuuaec', '宫庭美容美体19185060219', 2, '中国', '铜仁', '2019-05-03 12:28:50', 'http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5VUskSaSp1lMPQQRlmBRLwH4iaRcia3FSGMqG8bs8xZp7vg51icaUcicNY9arkS4pzrQG0nsUMqQORItiapySl2HUTdx1HL4pE2Zr4/132');
INSERT INTO `tb_consumer` VALUES (37, 'oM4Zwv44ZzoOCjg47ASuYzSpx668', '丑蛋儿', 1, '中国', '西城', '2019-05-03 13:07:56', 'http://thirdwx.qlogo.cn/mmopen/OUicWJdJoz3EfiblNZtOjRB0gdXKW3KttgCYRicAjhNEZxJSfGRWAAlIELTerDcxRYsStvkBvWjdbNmdXozegK9cA/132');
INSERT INTO `tb_consumer` VALUES (38, 'oxFjb5m0jj1elb0PXEN9E-WlB2Ak', 'Violet', 2, '', '', '2019-05-06 17:36:14', 'http://thirdwx.qlogo.cn/mmopen/7Uvq7DjNu080jmBACNib8HzC3LBnOn0JJhTh5X6fy73xHwHKD58WexZLYPmb3bkoOILOf3tERSuZ9ysZ7giauEMQCHjPlSQgIA/132');

-- ----------------------------
-- Table structure for tb_exceptional
-- ----------------------------
DROP TABLE IF EXISTS `tb_exceptional`;
CREATE TABLE `tb_exceptional`  (
  `exceptional_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `teacher_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `teacher_open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '老师微信唯一码',
  `deal_status` int(2) NOT NULL COMMENT '交易状态',
  `exceptional_money` double(11, 2) NOT NULL COMMENT '打赏金额',
  `water_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '流水单号',
  `exceptional_time` datetime NULL DEFAULT NULL COMMENT '打赏时间',
  `prepay_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '拉起支付的编号',
  `prepay_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '最近下单时间',
  PRIMARY KEY (`exceptional_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback`  (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `feedback_time` datetime NULL,
  `star_evaluation` int(4) NOT NULL,
  `personal_id` int(11) NOT NULL,
  `readme_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES (4, '持续默念及家人助念，并写在胶布上贴于大椎穴及四肢。一周后复诊，见其四肢震颤大减，四肢活动已略为柔软自如，呆滞好转。方已对症，效不更方，又持念一月后复诊，諸症已愈其七八。再一月后复诊，四肢不再震颤，活动已柔软灵活，精神清爽，面有喜色', '2017-04-14 17:42:54', 5, 40, 16, 40);
INSERT INTO `tb_feedback` VALUES (6, '经过咨询去医院查询了，目前病情已经好转', '2017-04-14 17:53:14', 5, 40, 14, 37);
INSERT INTO `tb_feedback` VALUES (9, '123', '2017-04-25 14:40:47', 5, 46, 25, 45);
INSERT INTO `tb_feedback` VALUES (10, '效果反馈，长句子测试，肯德基大结局记得记得经济手机刷机第几集刷卡大结局小鸡小鸡大家觉得不大很大很大很大经济大家好的好的好想你缴费机打卡打卡上凯撒卡卡刷卡都比不多你的决定嫁鸡随鸡手机声卡刷卡机手机点击手机刷机上扣扣思考思考思考思考凯撒凯撒凯撒凯撒卡卡不行不行不是不报升不升级手机十几集手机手机声卡凯撒卡卡苏卡达经济法解答解答经济系就打可大刷卡刷卡凯撒', '2017-04-25 16:06:17', 5, 53, 27, 45);
INSERT INTO `tb_feedback` VALUES (11, '效果不错，谢谢', '2017-04-25 19:53:14', 5, 52, 30, 67);
INSERT INTO `tb_feedback` VALUES (13, '好呀好呀? ', '2017-05-05 11:51:04', 5, 52, 33, 45);
INSERT INTO `tb_feedback` VALUES (14, '谢谢彭老师！她一直都在默念你的配方；这两天，都有排便，但是粒粒的；舌头仍痛，让她坚持默念；血压稳定，但没敢停药；我平时喜欢吃塘里的鲫鱼，我觉得这些鱼有点温热，容易上火，建议她尽量吃些海鱼与温性蔬菜。', '2017-05-07 20:28:14', 5, 64, 53, 141);
INSERT INTO `tb_feedback` VALUES (15, '彭老师，您好！我昨天已将配方让我母亲试念了，她说没有不舒服的症状，我让她认真持念，再次感谢您！', '2017-05-08 06:36:07', 5, 64, 66, 132);
INSERT INTO `tb_feedback` VALUES (16, '刘老师您好，您5月6日晚给我母亲调方820 820 02000 160 4440，她从5月7日早晨开始默念，到今天早晨就正常排便了，也不干了，就是一直感觉心慌，90多次/分钟，您看需要调整吗？谢谢', '2017-05-08 15:11:29', 5, 56, 67, 125);
INSERT INTO `tb_feedback` VALUES (17, '刘老师您好，您5月6日晚给我母亲调方820 820 02000 160 4440，她从5月7日早晨开始默念，到今天早晨就正常排便了，也不干了，就是一直感觉心慌，90多次/分钟，您看需要调整吗？谢谢', '2017-05-08 15:11:31', 5, 56, 67, 125);
INSERT INTO `tb_feedback` VALUES (18, '现已退烧', '2017-05-11 06:31:54', 5, 64, 94, 78);
INSERT INTO `tb_feedback` VALUES (19, '现已好', '2017-05-11 06:32:29', 5, 64, 43, 78);
INSERT INTO `tb_feedback` VALUES (20, '现已好', '2017-05-11 06:34:20', 5, 64, 43, 78);
INSERT INTO `tb_feedback` VALUES (21, '邢老师你好，你您上次给配的方26000.00500.7820.0430，开始几天念后打哈气，6，7号两天血压降到130/87，但这几天还是在150/100，其它感觉还好，睡眠也可以，就是血压还偏高。是不是和天气有关系，重庆这段时间气温变化比较剧烈？', '2017-05-11 19:03:10', 5, 55, 56, 160);
INSERT INTO `tb_feedback` VALUES (22, '孩子已康复，谢谢老师', '2017-05-21 15:29:59', 5, 64, 101, 78);
INSERT INTO `tb_feedback` VALUES (23, '效果很好，效果反馈', '2017-05-22 09:57:39', 5, 48, 120, 164);
INSERT INTO `tb_feedback` VALUES (24, '效果很好反馈测试1', '2017-05-22 10:06:24', 5, 52, 122, 67);
INSERT INTO `tb_feedback` VALUES (25, '反馈，酒喝了能睡觉。', '2017-05-22 10:12:34', 5, 52, 29, 67);
INSERT INTO `tb_feedback` VALUES (27, '不打星出乱码吗', '2017-05-22 10:17:49', 1, 52, 124, 67);
INSERT INTO `tb_feedback` VALUES (28, '测试', '2017-05-22 11:18:18', 1, 52, 39, 69);
INSERT INTO `tb_feedback` VALUES (29, '彭老师，经过早晚默念0770.200.01600.00500，牙疼已基本好了。牙疼将近一个月，没有吃一粒药，只是早晚念数现在已基本恢复，就是咬合时还有一点感觉。眼睛糊和胃里有气上顶还没有完全好。', '2017-05-23 12:10:54', 5, 64, 110, 110);
INSERT INTO `tb_feedback` VALUES (30, '渐好，谢谢', '2017-05-24 11:00:16', 5, 64, 118, 78);
INSERT INTO `tb_feedback` VALUES (31, '李老师好，第一时间向您报喜：女儿本月15日去Facebook 公司面试，您赐方72000·2660·4330·3880，助女儿过关，现已得到入取通知书了。女儿在自己的公司里也做考官，她说这次面试＂很难＂。六位考官，每位一小时，且轮番上阵，连续不断，直到结束。女儿得象数护佑，顺利过关。感恩李山玉老师！感恩您！???', '2017-05-30 10:51:35', 5, 53, 95, 165);
INSERT INTO `tb_feedback` VALUES (32, '刘老师您好，我母亲从6月2日开始默念300 080 020 1600，今天排了四次便，一次没多点，不成型，不象前些天那样出汗了，您看需要调方吗', '2017-06-05 17:56:38', 5, 56, 146, 125);
INSERT INTO `tb_feedback` VALUES (33, '彭老师好！\r\n', '2017-06-07 16:29:02', 5, 64, 92, 76);
INSERT INTO `tb_feedback` VALUES (34, '彭老师好！您给的治疗痛风的方很好，病人已经好了，以前我在这里反馈过结果，但是提交不上去，方才我试了一下可以用了，再次谢谢您！！！\r\n', '2017-06-07 16:34:34', 5, 64, 92, 76);
INSERT INTO `tb_feedback` VALUES (35, '刘江老师你好！你为先生的象数配方200.0500.0430.720贴在咽喉外二条，笫二天咽痒咳嗽好多，他说贴方很管用，原来痰爬在咽喉上，咳不出来，现在能咳出痰了，咽喉舒服多，早上起来痰多的，平时偶尔有点痰，无痰不咳嗽，現在学着念数了。是否持念此方？', '2017-06-12 14:57:15', 5, 56, 169, 158);
INSERT INTO `tb_feedback` VALUES (36, '您好！我给猫贴过三天您赠予的配方820.720.1600.440，伤口已长好，有一天它喝水好几次我就没敢再贴（怕它狂饮），现在它大便两天一次但还是干些，另外，因为它那次左耳朵积液做了耳朵压迫止血包扎（就是把耳朵支起这部位向外翻过来包扎，即里面朝外）多天造成它左耳朵这部位外翻（大夫说耳朵这部位是软骨不会骨折），请您帮它调整调整吧，谢谢您！', '2017-06-13 14:46:41', 5, 56, 148, 90);
INSERT INTO `tb_feedback` VALUES (37, '春彬老师你好！007200.650.04300.82000，把感冒发出来，人犯困无力，咳嗽无痰，右鼻孔不通流清涕，右胸肋下肝区部位有坠胀感不舒服，肝区有时偶尔有抽触的痛，向老师求诊l', '2017-06-17 12:27:21', 5, 53, 179, 158);
INSERT INTO `tb_feedback` VALUES (38, '6月5号刘老师给我先生调方05000.2000.60   6号早上我给我先生贴大椎穴和局部，同时助念，他很快有睡意。坚持一周后，患部皮肤没以前痒了。很可喜的是他的大便顺畅了，也不是很臭了。以前每天要喝蜂蜜水的。我有时间就给他在患部写5条。他自己也感觉效果不错。最近家里事多，助念时间少了一些。患部皮肤突起状态暂时没有明显改善，但是瘙痒程度明显减轻。感恩李山玉恩师，感恩刘老师。我们会坚持念象数配方的。有新情况再向老师汇报。', '2017-06-24 22:15:49', 5, 56, 136, 147);
INSERT INTO `tb_feedback` VALUES (39, '刚看到，感谢刘老师反馈，有囊肿正在恢复中，谢谢', '2017-06-25 22:26:12', 5, 56, 134, 78);
INSERT INTO `tb_feedback` VALUES (40, '正在恢复中', '2017-06-25 22:28:15', 5, 64, 80, 78);
INSERT INTO `tb_feedback` VALUES (41, '彭老师婴儿住院在小儿重症监护室，不让家人陪伴，我们就托护士给小儿手机照了个相，并把相照打印出来，在小儿相片背面写上5条你赐的配方050，0538，160，40用读数机对住相片日，夜念(播放)同时，家里东南方位贴5条，现己住2周了，病理性黄疸从340高指标，降至200了，同时颅内两处出血也止住了，小孩从初每次吃5毫升奶，至今今每次吃30毫升，体重由2280克增至2580克。面上黑瘀己退，肺部吸进羊水也吸收，没有引起感染，医生说这样好转下去，估计3周可以出院了。谢谢彭老师!感恩李山玉恩师!', '2017-06-26 14:22:56', 5, 64, 182, 107);
INSERT INTO `tb_feedback` VALUES (42, '未打星测试，就是就是就是计算机耍手机', '2017-06-27 12:58:18', 5, 52, 62, 164);
INSERT INTO `tb_feedback` VALUES (43, '谢谢老师！明白了，因近来家中有事，迟迟没有回应您耐心的解答，请您谅解。', '2017-06-27 18:39:02', 5, 48, 173, 165);
INSERT INTO `tb_feedback` VALUES (44, '我在6/12做过一次血检，甲抗T4指标从5点多在18天下降到1.9, 比正常高0.4左右, TSH还没改善。当然我还是服用西药的，不过我自己将剂量减半，配合念象数和针灸。', '2017-07-02 10:19:46', 5, 53, 104, 69);
INSERT INTO `tb_feedback` VALUES (45, '念数近10天每天念3至4小时，读数机助念两整天。现仍感到咳嗽咳痰频密，痰颜色时白时淡黄，咳时咽部不适，有时痛。另外右边臉旁的腮骨(牙较骨)张大口痛、右边颈部，右边咽喉，右边牙周，大牙也痛，有时影响右边太阳穴也痛，上下咬紧牙，及张太嘴巴都觉得较骨痛，上个星期右耳屎堵了，去医院洗耳，说有些发炎作开了一个星期头孢消炎药，春彬老师是否要调方。', '2017-07-05 21:46:14', 5, 53, 195, 107);
INSERT INTO `tb_feedback` VALUES (46, '我前天晩上开着象数机一晚上，昨天早上、中午又让我妈跟着象数机念差不多二个小时，下午鼓励她抄写象数，居然一年来她从不动笔动纸的，按着样例抄写了半页，久不写字，字体很歪斜，但这已经是非常大的进步！今天早上很顺利地又抄写了一页，昨天晚上象数机一直助念。今天到目前为止没有心烦，这真是振奋人心的好消息。感恩春斌老师，感恩山玉老师！', '2017-07-06 15:17:22', 5, 53, 212, 69);
INSERT INTO `tb_feedback` VALUES (47, '6月29日赐方默念后，腰、胸往下沉坠感好多了。直立行走不难受了，背脊形态看上去比原直立多了，但直立时间不太久。MRI检查报告.胸、腰椎退变，有多发神根囊肿和骶骨囊肿等等疾病，肝上也多发性囊肿(胆切除了)，肾上也囊肿。除上述症状外苔黄、舌两边和舌尖红有点火辣辣感觉、口苦口干、早上起来口臭。请老师调方！', '2017-07-09 20:29:25', 5, 53, 203, 158);
INSERT INTO `tb_feedback` VALUES (48, '2019.1.16效果反馈', '2019-01-16 15:32:59', 5, 46, 222, 51);

-- ----------------------------
-- Table structure for tb_finance
-- ----------------------------
DROP TABLE IF EXISTS `tb_finance`;
CREATE TABLE `tb_finance`  (
  `mentor_id` int(11) NOT NULL COMMENT '导师id',
  `balance` double(20, 2) NOT NULL COMMENT '余额',
  `push_money` double(20, 2) NOT NULL COMMENT '总提成',
  `answer_money` double(20, 2) NOT NULL COMMENT '总作答费',
  `withdraw_money` double(20, 2) NOT NULL COMMENT '总提现',
  PRIMARY KEY (`mentor_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_finance
-- ----------------------------
INSERT INTO `tb_finance` VALUES (40, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (42, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (43, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (44, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (46, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (48, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (52, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (53, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (54, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (55, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (56, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (64, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (161, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tb_finance` VALUES (192, 0.00, 0.00, 0.00, 0.00);

-- ----------------------------
-- Table structure for tb_formula
-- ----------------------------
DROP TABLE IF EXISTS `tb_formula`;
CREATE TABLE `tb_formula`  (
  `formula_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配方编号',
  `formula_context` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '配方内容',
  `formula_state` int(2) NOT NULL COMMENT '配方状态',
  `formula_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '分类',
  `formula_symptom` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '症状',
  `formula_symptom_details` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '症状详情',
  PRIMARY KEY (`formula_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1034 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_formula
-- ----------------------------
INSERT INTO `tb_formula` VALUES (1002, '70·40·160', 0, '乾卦（大肠、首）', '便秘', '便秘');
INSERT INTO `tb_formula` VALUES (1005, '70·40·160', 0, '乾卦（大肠、首）', '痔疮', '痔疮');
INSERT INTO `tb_formula` VALUES (1006, '70·40·30', 0, '乾卦（大肠、首）', '头痛', '头痛');
INSERT INTO `tb_formula` VALUES (1007, '70·40·30', 0, '乾卦（大肠、首）', '落枕', '落枕');
INSERT INTO `tb_formula` VALUES (1008, '80·60·50', 0, '兑卦（肺、口）', '外感风热', '外感风热');
INSERT INTO `tb_formula` VALUES (1009, '80·60·50', 0, '兑卦（肺、口）', '外感风寒', '外感风寒');
INSERT INTO `tb_formula` VALUES (1010, '60·080', 0, '兑卦（肺、口）', '咳嗽', '咳嗽');
INSERT INTO `tb_formula` VALUES (1011, '60·080', 0, '兑卦（肺、口）', '口疮', '口疮');
INSERT INTO `tb_formula` VALUES (1012, '720·650·430', 0, '离卦（心、小肠、目）', '心梗', '心梗');
INSERT INTO `tb_formula` VALUES (1013, '720·650·430', 0, '离卦（心、小肠、目）', '心悸', '心悸');
INSERT INTO `tb_formula` VALUES (1014, '260·4300·7200', 0, '离卦（心、小肠、目）', '小肠火', '小肠火');
INSERT INTO `tb_formula` VALUES (1016, '60·080', 0, '离卦（心、小肠、目）', '疖', '疖');
INSERT INTO `tb_formula` VALUES (1017, '00·26400', 0, '离卦（心、小肠、目）', '目赤', '目赤');
INSERT INTO `tb_formula` VALUES (1018, '60·080', 0, '离卦（心、小肠、目）', '失眠', '失眠');
INSERT INTO `tb_formula` VALUES (1019, '02000·6400', 0, '震卦（肝、足）', '肝炎', '肝炎');
INSERT INTO `tb_formula` VALUES (1020, '02000·6400', 0, '震卦（肝、足）', '流泪', '流泪');
INSERT INTO `tb_formula` VALUES (1021, '4440·38200', 0, '震卦（肝、足）', '抽筋', '抽筋');
INSERT INTO `tb_formula` VALUES (1022, '4440·38200', 0, '震卦（肝、足）', '崴脚', '崴脚');
INSERT INTO `tb_formula` VALUES (1023, '40·500', 0, '巽卦（胆、股）', '胆囊炎', '胆囊炎');
INSERT INTO `tb_formula` VALUES (1024, '60·70·40', 0, '坎（肾、耳）', '腰痛', '腰痛');
INSERT INTO `tb_formula` VALUES (1025, '60·70·40', 0, '坎（肾、耳）', '膀胱炎', '膀胱炎');
INSERT INTO `tb_formula` VALUES (1026, '60·080', 0, '巽卦（胆、股）', '肩周炎', '肩周炎');
INSERT INTO `tb_formula` VALUES (1027, '60·080', 0, '坎（肾、耳）', '耳聋', '耳聋');
INSERT INTO `tb_formula` VALUES (1028, '7200·6400', 0, '艮卦（胃、手）', '胃痛', '胃痛');
INSERT INTO `tb_formula` VALUES (1029, '7200·6400', 0, '艮卦（胃、手）', '晕车', '晕车');
INSERT INTO `tb_formula` VALUES (1030, '77720·640', 0, '艮卦（胃、手）', '手痛', '手痛');
INSERT INTO `tb_formula` VALUES (1031, '77720·640', 0, '艮卦（胃、手）', '关节炎', '关节炎');
INSERT INTO `tb_formula` VALUES (1032, '7000·650·380', 0, '坤卦（脾、腹）', '腹痛', '腹痛');
INSERT INTO `tb_formula` VALUES (1033, '3820·650', 0, '坤卦（脾、腹）', '水肿', '水肿');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `goods_id` int(20) NOT NULL COMMENT '商号ID',
  `goods_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名字',
  `goods_type_id` int(7) NOT NULL COMMENT '商品类型',
  `goods_price` double(20, 2) NOT NULL COMMENT '商品价格',
  `goods_num` int(15) NOT NULL COMMENT '商品库存',
  `goods_state` int(2) NOT NULL COMMENT '商品上下架状态',
  `goods_img_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品图片路径',
  `goods_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商品描述',
  `goods_param_id` int(11) NULL DEFAULT NULL COMMENT '商品参数ID对应值',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_level
-- ----------------------------
DROP TABLE IF EXISTS `tb_level`;
CREATE TABLE `tb_level`  (
  `level_id` int(4) NOT NULL COMMENT '等级ID',
  `level_money` double(13, 2) NOT NULL COMMENT '该等级收费数额',
  `level_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '等级名字',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_level
-- ----------------------------
INSERT INTO `tb_level` VALUES (0, 0.00, '五级导师');
INSERT INTO `tb_level` VALUES (1, 50.00, '四级导师');
INSERT INTO `tb_level` VALUES (2, 100.00, '三级导师');
INSERT INTO `tb_level` VALUES (4, 200.00, '二级导师');
INSERT INTO `tb_level` VALUES (5, 300.00, '一级导师');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `order_id` int(65) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '订单时间',
  `order_state` int(3) NOT NULL COMMENT '订单状态',
  `order_member_id` int(11) NOT NULL COMMENT '会员ID',
  `order_goods_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `order_goods_price` double(20, 2) NOT NULL COMMENT '商品价格',
  `order_goods_num` int(10) NOT NULL COMMENT '商品数量',
  `order_address_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收货地址',
  `promo_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '推广码',
  `royalty_rate` double(5, 5) NULL DEFAULT NULL COMMENT '提成率',
  `push_money` double(20, 2) NULL DEFAULT NULL COMMENT '提成',
  `logistics_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '物流号',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注/退款理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (1001, 10001, '2019-01-26 16:42:23', 2, 37, '养生壶', 50.00, 2, '1001', NULL, NULL, NULL, '54678631235645', '早点发货');
INSERT INTO `tb_order` VALUES (1002, 10001, '2019-01-26 16:42:23', 2, 37, '养生茶', 25.00, 4, '1001', NULL, NULL, NULL, '54678631235645', '早点发货');
INSERT INTO `tb_order` VALUES (1003, 10002, '2019-01-26 16:42:23', 2, 38, '养生壶', 50.00, 1, '1002', NULL, NULL, NULL, '67843534643455', '包装好点');

-- ----------------------------
-- Table structure for tb_param
-- ----------------------------
DROP TABLE IF EXISTS `tb_param`;
CREATE TABLE `tb_param`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  ` param_id` int(20) NOT NULL COMMENT '参数ID',
  ` param_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '参数名称',
  ` param_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数值',
  `param_id` int(11) NULL DEFAULT NULL COMMENT '参数ID',
  `param_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数名称',
  `param_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_pay_notes
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay_notes`;
CREATE TABLE `tb_pay_notes`  (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_way` int(4) NOT NULL,
  `pay_money` float(50, 0) NOT NULL,
  `pay_time` datetime NULL,
  `personal_id` int(11) NOT NULL,
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_pay_notes
-- ----------------------------
INSERT INTO `tb_pay_notes` VALUES (1, 0, 699, '2017-03-31 17:33:48', 30);
INSERT INTO `tb_pay_notes` VALUES (2, 0, 66666, '2017-03-31 18:37:34', 31);
INSERT INTO `tb_pay_notes` VALUES (3, 0, 555, '2017-04-04 00:29:59', 33);
INSERT INTO `tb_pay_notes` VALUES (4, 0, 200, '2017-04-14 17:02:02', 37);
INSERT INTO `tb_pay_notes` VALUES (5, 0, 260, '2017-04-14 17:02:15', 38);
INSERT INTO `tb_pay_notes` VALUES (6, 0, 800, '2017-04-14 17:02:33', 38);
INSERT INTO `tb_pay_notes` VALUES (7, 0, 300, '2017-04-14 17:02:56', 39);
INSERT INTO `tb_pay_notes` VALUES (8, 0, 666, '2017-04-15 01:15:47', 45);
INSERT INTO `tb_pay_notes` VALUES (9, 0, 3800, '2017-04-25 09:53:24', 57);
INSERT INTO `tb_pay_notes` VALUES (10, 0, 3800, '2017-04-25 09:55:24', 58);
INSERT INTO `tb_pay_notes` VALUES (11, 0, 3800, '2017-04-25 09:55:39', 59);
INSERT INTO `tb_pay_notes` VALUES (12, 0, 3800, '2017-04-25 09:55:56', 60);
INSERT INTO `tb_pay_notes` VALUES (13, 0, 3800, '2017-04-25 09:57:11', 61);
INSERT INTO `tb_pay_notes` VALUES (14, 0, 3800, '2017-04-25 10:34:20', 67);
INSERT INTO `tb_pay_notes` VALUES (15, 0, 3800, '2017-04-25 21:40:24', 69);
INSERT INTO `tb_pay_notes` VALUES (16, 0, 3800, '2017-04-26 09:38:08', 70);
INSERT INTO `tb_pay_notes` VALUES (17, 0, 3800, '2017-04-26 11:09:38', 71);
INSERT INTO `tb_pay_notes` VALUES (18, 0, 3800, '2017-04-27 18:27:02', 75);
INSERT INTO `tb_pay_notes` VALUES (19, 0, 3800, '2017-04-27 18:33:53', 76);
INSERT INTO `tb_pay_notes` VALUES (20, 0, 3800, '2017-04-27 18:40:08', 77);
INSERT INTO `tb_pay_notes` VALUES (21, 0, 3800, '2017-04-27 18:43:55', 78);
INSERT INTO `tb_pay_notes` VALUES (22, 0, 3800, '2017-04-27 19:41:12', 79);
INSERT INTO `tb_pay_notes` VALUES (23, 0, 3800, '2017-04-27 19:46:02', 80);
INSERT INTO `tb_pay_notes` VALUES (24, 0, 3800, '2017-05-01 08:07:27', 81);
INSERT INTO `tb_pay_notes` VALUES (25, 0, 3800, '2017-05-01 11:53:30', 82);
INSERT INTO `tb_pay_notes` VALUES (26, 0, 3800, '2017-05-01 16:11:14', 83);
INSERT INTO `tb_pay_notes` VALUES (27, 0, 3800, '2017-05-01 19:14:36', 83);
INSERT INTO `tb_pay_notes` VALUES (28, 0, 3800, '2017-05-01 22:18:25', 84);
INSERT INTO `tb_pay_notes` VALUES (29, 0, 3800, '2017-05-01 22:21:23', 85);
INSERT INTO `tb_pay_notes` VALUES (30, 0, 3800, '2017-05-01 23:20:57', 86);
INSERT INTO `tb_pay_notes` VALUES (31, 0, 3800, '2017-05-01 23:21:25', 87);
INSERT INTO `tb_pay_notes` VALUES (32, 0, 3800, '2017-05-01 23:21:47', 88);
INSERT INTO `tb_pay_notes` VALUES (33, 0, 3800, '2017-05-01 23:22:08', 89);
INSERT INTO `tb_pay_notes` VALUES (34, 0, 3800, '2017-05-01 23:22:38', 90);
INSERT INTO `tb_pay_notes` VALUES (35, 0, 3800, '2017-05-01 23:23:02', 91);
INSERT INTO `tb_pay_notes` VALUES (36, 0, 3800, '2017-05-01 23:23:38', 92);
INSERT INTO `tb_pay_notes` VALUES (37, 0, 3800, '2017-05-01 23:24:03', 93);
INSERT INTO `tb_pay_notes` VALUES (38, 0, 3800, '2017-05-01 23:24:27', 94);
INSERT INTO `tb_pay_notes` VALUES (39, 0, 3800, '2017-05-01 23:24:50', 95);
INSERT INTO `tb_pay_notes` VALUES (40, 0, 3800, '2017-05-01 23:25:14', 96);
INSERT INTO `tb_pay_notes` VALUES (41, 0, 3800, '2017-05-01 23:25:32', 97);
INSERT INTO `tb_pay_notes` VALUES (42, 0, 3800, '2017-05-01 23:25:49', 98);
INSERT INTO `tb_pay_notes` VALUES (43, 0, 3800, '2017-05-01 23:26:03', 99);
INSERT INTO `tb_pay_notes` VALUES (44, 0, 3800, '2017-05-01 23:26:21', 100);
INSERT INTO `tb_pay_notes` VALUES (45, 0, 3800, '2017-05-01 23:26:35', 101);
INSERT INTO `tb_pay_notes` VALUES (46, 0, 3800, '2017-05-01 23:26:52', 102);
INSERT INTO `tb_pay_notes` VALUES (47, 0, 3800, '2017-05-01 23:27:09', 103);
INSERT INTO `tb_pay_notes` VALUES (48, 0, 3800, '2017-05-01 23:27:27', 104);
INSERT INTO `tb_pay_notes` VALUES (49, 0, 3800, '2017-05-01 23:27:46', 105);
INSERT INTO `tb_pay_notes` VALUES (50, 0, 3800, '2017-05-01 23:28:04', 106);
INSERT INTO `tb_pay_notes` VALUES (51, 0, 3800, '2017-05-01 23:28:23', 107);
INSERT INTO `tb_pay_notes` VALUES (52, 0, 3800, '2017-05-01 23:28:41', 108);
INSERT INTO `tb_pay_notes` VALUES (53, 0, 3800, '2017-05-01 23:28:56', 109);
INSERT INTO `tb_pay_notes` VALUES (54, 0, 3800, '2017-05-01 23:29:13', 110);
INSERT INTO `tb_pay_notes` VALUES (55, 0, 3800, '2017-05-01 23:29:30', 111);
INSERT INTO `tb_pay_notes` VALUES (56, 0, 3800, '2017-05-01 23:29:44', 112);
INSERT INTO `tb_pay_notes` VALUES (57, 0, 3800, '2017-05-01 23:29:58', 113);
INSERT INTO `tb_pay_notes` VALUES (58, 0, 3800, '2017-05-01 23:30:22', 114);
INSERT INTO `tb_pay_notes` VALUES (59, 0, 3800, '2017-05-01 23:30:44', 115);
INSERT INTO `tb_pay_notes` VALUES (60, 0, 3800, '2017-05-01 23:30:58', 116);
INSERT INTO `tb_pay_notes` VALUES (61, 0, 3800, '2017-05-01 23:31:13', 117);
INSERT INTO `tb_pay_notes` VALUES (62, 0, 3800, '2017-05-01 23:31:28', 118);
INSERT INTO `tb_pay_notes` VALUES (63, 0, 3800, '2017-05-01 23:31:45', 119);
INSERT INTO `tb_pay_notes` VALUES (64, 0, 3800, '2017-05-01 23:32:02', 120);
INSERT INTO `tb_pay_notes` VALUES (65, 0, 3800, '2017-05-01 23:32:20', 121);
INSERT INTO `tb_pay_notes` VALUES (66, 0, 3800, '2017-05-01 23:32:35', 122);
INSERT INTO `tb_pay_notes` VALUES (67, 0, 3800, '2017-05-01 23:50:58', 123);
INSERT INTO `tb_pay_notes` VALUES (68, 0, 3800, '2017-05-01 23:51:12', 124);
INSERT INTO `tb_pay_notes` VALUES (69, 0, 3800, '2017-05-01 23:51:29', 125);
INSERT INTO `tb_pay_notes` VALUES (70, 0, 3800, '2017-05-01 23:51:47', 126);
INSERT INTO `tb_pay_notes` VALUES (71, 0, 3800, '2017-05-01 23:52:03', 127);
INSERT INTO `tb_pay_notes` VALUES (72, 0, 3800, '2017-05-01 23:52:17', 128);
INSERT INTO `tb_pay_notes` VALUES (73, 0, 3800, '2017-05-01 23:52:32', 129);
INSERT INTO `tb_pay_notes` VALUES (74, 0, 3800, '2017-05-01 23:52:47', 130);
INSERT INTO `tb_pay_notes` VALUES (75, 0, 3800, '2017-05-01 23:53:06', 131);
INSERT INTO `tb_pay_notes` VALUES (76, 0, 3800, '2017-05-01 23:53:23', 132);
INSERT INTO `tb_pay_notes` VALUES (77, 0, 3800, '2017-05-01 23:53:42', 133);
INSERT INTO `tb_pay_notes` VALUES (78, 0, 3800, '2017-05-01 23:53:55', 134);
INSERT INTO `tb_pay_notes` VALUES (79, 0, 3800, '2017-05-01 23:54:10', 135);
INSERT INTO `tb_pay_notes` VALUES (80, 0, 3800, '2017-05-01 23:54:23', 136);
INSERT INTO `tb_pay_notes` VALUES (81, 0, 3800, '2017-05-01 23:54:37', 137);
INSERT INTO `tb_pay_notes` VALUES (82, 0, 3800, '2017-05-01 23:54:52', 138);
INSERT INTO `tb_pay_notes` VALUES (83, 0, 3800, '2017-05-01 23:55:04', 139);
INSERT INTO `tb_pay_notes` VALUES (84, 0, 3800, '2017-05-01 23:55:18', 140);
INSERT INTO `tb_pay_notes` VALUES (85, 0, 3800, '2017-05-01 23:55:29', 141);
INSERT INTO `tb_pay_notes` VALUES (86, 0, 3800, '2017-05-01 23:55:48', 142);
INSERT INTO `tb_pay_notes` VALUES (87, 0, 3800, '2017-05-01 23:56:01', 143);
INSERT INTO `tb_pay_notes` VALUES (88, 0, 3800, '2017-05-01 23:56:16', 144);
INSERT INTO `tb_pay_notes` VALUES (89, 0, 3800, '2017-05-02 00:12:43', 145);
INSERT INTO `tb_pay_notes` VALUES (90, 0, 3800, '2017-05-02 00:13:04', 160);
INSERT INTO `tb_pay_notes` VALUES (91, 0, 3800, '2017-05-02 00:13:24', 146);
INSERT INTO `tb_pay_notes` VALUES (92, 0, 3800, '2017-05-02 00:13:38', 147);
INSERT INTO `tb_pay_notes` VALUES (93, 0, 3800, '2017-05-02 00:13:54', 148);
INSERT INTO `tb_pay_notes` VALUES (94, 0, 3800, '2017-05-02 00:14:10', 149);
INSERT INTO `tb_pay_notes` VALUES (95, 0, 3800, '2017-05-02 00:14:28', 150);
INSERT INTO `tb_pay_notes` VALUES (96, 0, 3800, '2017-05-02 00:14:43', 151);
INSERT INTO `tb_pay_notes` VALUES (97, 0, 3800, '2017-05-02 00:14:59', 152);
INSERT INTO `tb_pay_notes` VALUES (98, 0, 3800, '2017-05-02 00:15:17', 153);
INSERT INTO `tb_pay_notes` VALUES (99, 0, 3800, '2017-05-02 00:15:34', 159);
INSERT INTO `tb_pay_notes` VALUES (100, 0, 3800, '2017-05-02 00:15:51', 154);
INSERT INTO `tb_pay_notes` VALUES (101, 0, 3800, '2017-05-02 00:16:11', 155);
INSERT INTO `tb_pay_notes` VALUES (102, 0, 3800, '2017-05-02 00:16:27', 156);
INSERT INTO `tb_pay_notes` VALUES (103, 0, 3800, '2017-05-02 00:16:43', 157);
INSERT INTO `tb_pay_notes` VALUES (104, 0, 38, '2017-05-02 00:16:55', 158);
INSERT INTO `tb_pay_notes` VALUES (105, 0, 38, '2017-05-02 00:16:55', 158);
INSERT INTO `tb_pay_notes` VALUES (106, 0, 3800, '2017-05-02 09:32:01', 83);
INSERT INTO `tb_pay_notes` VALUES (107, 0, 3800, '2017-05-03 18:45:17', 162);
INSERT INTO `tb_pay_notes` VALUES (108, 0, 3800, '2017-05-04 11:12:16', 163);
INSERT INTO `tb_pay_notes` VALUES (109, 0, 11, '2017-05-04 14:39:06', 164);
INSERT INTO `tb_pay_notes` VALUES (110, 0, 3800, '2017-05-05 11:19:52', 165);
INSERT INTO `tb_pay_notes` VALUES (111, 0, 3800, '2017-05-05 20:18:42', 166);
INSERT INTO `tb_pay_notes` VALUES (112, 0, 3800, '2017-05-09 13:46:14', 167);
INSERT INTO `tb_pay_notes` VALUES (113, 0, 3800, '2017-05-09 15:34:33', 168);
INSERT INTO `tb_pay_notes` VALUES (114, 0, 3800, '2017-05-09 16:41:33', 169);
INSERT INTO `tb_pay_notes` VALUES (115, 0, 300, '2017-05-17 16:22:29', 164);
INSERT INTO `tb_pay_notes` VALUES (116, 0, 3800, '2017-05-17 21:31:18', 173);
INSERT INTO `tb_pay_notes` VALUES (117, 0, 3800, '2017-05-17 21:56:35', 174);
INSERT INTO `tb_pay_notes` VALUES (118, 0, 3800, '2017-05-17 22:58:50', 175);
INSERT INTO `tb_pay_notes` VALUES (119, 0, 3800, '2017-05-18 11:09:38', 176);
INSERT INTO `tb_pay_notes` VALUES (120, 0, 3800, '2017-05-18 22:22:47', 175);
INSERT INTO `tb_pay_notes` VALUES (121, 0, 3800, '2017-05-19 17:30:37', 177);
INSERT INTO `tb_pay_notes` VALUES (122, 0, 3800, '2017-05-20 11:14:09', 178);
INSERT INTO `tb_pay_notes` VALUES (123, 0, 3800, '2017-05-20 17:58:23', 179);
INSERT INTO `tb_pay_notes` VALUES (124, 0, 3800, '2017-05-20 19:46:21', 180);
INSERT INTO `tb_pay_notes` VALUES (125, 0, 3800, '2017-05-22 10:44:15', 181);
INSERT INTO `tb_pay_notes` VALUES (126, 0, 3800, '2017-05-22 16:14:02', 182);
INSERT INTO `tb_pay_notes` VALUES (127, 0, 3800, '2017-05-27 11:35:59', 183);
INSERT INTO `tb_pay_notes` VALUES (128, 0, 3800, '2017-06-03 13:08:19', 186);
INSERT INTO `tb_pay_notes` VALUES (129, 0, 3800, '2017-06-03 19:54:41', 186);
INSERT INTO `tb_pay_notes` VALUES (130, 0, 3800, '2017-06-04 11:55:11', 187);
INSERT INTO `tb_pay_notes` VALUES (131, 0, 1, '2017-06-09 10:58:34', 164);
INSERT INTO `tb_pay_notes` VALUES (132, 0, 3800, '2017-06-28 11:07:17', 189);
INSERT INTO `tb_pay_notes` VALUES (133, 0, 0, '2019-01-16 15:15:18', 51);
INSERT INTO `tb_pay_notes` VALUES (134, 0, 0, '2019-01-16 15:47:08', 51);

-- ----------------------------
-- Table structure for tb_personal_data
-- ----------------------------
DROP TABLE IF EXISTS `tb_personal_data`;
CREATE TABLE `tb_personal_data`  (
  `personal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `personal_number` varchar(80) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `qq` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `flag_type` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `sex` int(11) NOT NULL,
  `place_domicile` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `mobile_phone` varchar(80) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `image` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `email` varchar(80) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `birthday` datetime NULL DEFAULT NULL,
  `id_card` varchar(80) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `marital_status` int(11) NULL DEFAULT NULL,
  `professional` varchar(80) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `direction` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `introduction` varchar(3500) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `level` int(4) NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `promo_code` varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '推广码',
  PRIMARY KEY (`personal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_personal_data
-- ----------------------------
INSERT INTO `tb_personal_data` VALUES (37, '20170414165709010001', '24569874', 0, '萧萧', '萧国龙', '500feedcad15b8cba366d4da20f7f246d7fbc76c5d07aac8d0a21b2c14aa31ccb05e7018f2d4e4a1', 1, '桂林', '13052564562', '1493246245730.jpg', '24569874@qq.com', '1983-05-13 16:56:36', '452145988501625874', 0, '建筑师', '贵港', NULL, NULL, 1, '2017-04-20 00:00:00', '2019-04-10 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (38, '20170414165931010002', '1231654560', 0, '杨华花', '杨华', '96ca7d1614055749b2ea5b39bbe836ba7da128117d0a8ed390673626e67574fe9bd91972901b3d41', 0, '上海', '15668546213', '1493246253346.jpg', 'yanghua@169.com', '1986-11-11 16:58:55', '452109988512035412', 1, '酒店经理', '南京', NULL, NULL, 1, '2017-04-14 00:00:00', '2022-04-22 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (39, '20170414170140010003', '456321456', 0, '高山流水', '刘小红', 'bf07421f38793aee074a86e88c57e57768e7395e57b6a996636de67706ff840226ee3b5273e3fcad', 0, '北京', '13058954623', '1493246262010.jpg', '456321456@qq.com', '1999-05-13 17:01:17', '123434213123142321', 0, '学生', '北京', NULL, NULL, 0, '2017-04-18 00:00:00', '2020-04-08 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (40, '20170414170733110004', '13056800', 1, '百叶戍', '（测试）白小飞', '1b161bd9aca9e6cfa5276569781b79457a6ebde7a0a18293a1c593a8688dd57773690692b21b5fc6', 1, '青岛', '13556215423', '1493246440283.jpg', '13056800@qq.com', '1980-04-14 17:04:46', '456321022562354512', 1, '医师', '青岛', '身体调理', '白小飞导师导师从事了16年的医疗健康工作，造福了几百多名体制弱的病人，是一位颇具权威的医疗专家。', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (42, '20170414223005110006', '13510269', 1, '羊羊', '（测试）AS森', '6ef973b0f8dac87be29d16a6926414a3164f1a0fbc975381ef3bd4e4727ec9efe8bb828ed6057976', 1, '上海', '13556215426', '1493246538716.jpg', '13510269@qq.com', '1980-06-19 23:28:19', '451202266954235941', 1, '教授', NULL, '内科', '杨先森是著名医学院的教授，从事医药教学已经有很多年头，在内科方面有非常高的造诣', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (43, '20170414223405110007', '1564523210', 1, '小明', '（测试）李明', '05508882986535bd2eba402b5d09b6e80d387896435c992a4625fd5ecbfb53a5fa0860f95c3840a6', 0, '杭州', '1231234567', NULL, '1564523210@qq.com', '1990-01-17 22:32:01', '785412236542135421', 0, '营养师', NULL, '生活调理', '李明导师是一位精通营养学的导师，对生活作息及日常生活对身体健康的研究非常有造诣。1968年开始学习中医。\r\n    1978以后，相继完成医学院，中医学院的系统学习。中医研究院的短期提高学习。\r\n     临床方面，经历住院医生，内科急救，中医治疗疑难病几个阶段大量实践。\r\n上个世纪八十年代中期以后，任医院业务院长，县红十字会副会长。\r\n中国中西医结合学会会员。\r\n    2011年开始，学习李山玉老师开创的八卦象数疗法，在医学门诊和网络空间广泛实践，深入探讨，通过五万多病例的研究分析，发现了一些规律性的东西，积累了大量的象数疗法临床经验。\r\n    从2017年开始，在研究所领导下开展一些新的工作。\r\n', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (44, '20170414223647110008', '456124158', 1, '白白', '（测试）凌城', 'bbff06a67cbad907283bea99dde4b207d761519cd86ffd6d3ebbd5814b319db968298e716f3a5b93', 1, '南宁', '13556420559', '1493246492988.jpg', '456124158@qq.com', '2017-04-12 22:35:18', '458962211354687500', 0, '教师', NULL, '养生调理', '凌城导师是养生调理方面的专家，是中医中很厉害的人才', 1, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (45, '20170415011524010009', '3030289941', 0, '李小明', '李小明', 'aab8e5163d77eac5789085f04f9f8d6466a39a37f365f69490c23243bbfa29c91542c434ecb0247e', 1, '梧州市', '18078743473', '1497518651146.jpg', '3030289941@qq.com', '1989-04-15 01:14:56', '450981199609103562', 0, '公司经理', '梧州市', NULL, NULL, 1, '2017-04-15 00:00:00', '2019-04-27 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (46, '20170415034254110010', '3030289941', 1, '李大明', '（测试）李大明', 'cd9f555a56573f7e0cef5bb4c297abd61010bb12f0761a31b4638d0da4bf01f683800e14bdfe4e01', 1, '梧州市', '18078743472', '1500446116889.png', '3030289941@qq.com', '1990-12-06 03:40:23', '450981199012063563', 0, '经理', '广西', '饮食健康', '荣获一级营养师资格证', 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (48, '20170416132159310012', '', 1, '13307748603', '李明', '482109fe5fe15909dbab8a5f7cc4afae1562fac0797c082a9d91eda4f16f5b251d39740b8753efbd', 1, '', '13307748603', NULL, 'letmeon@163.com', '1978-01-01 00:00:00', '123456789012345678', 1, '自由职业', NULL, '', '', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (51, '20170423093501010015', '123456', 0, 'ceshi', 'ceshi', '23446549f2f528c0064707e142ab563b9ff1f2680f7f91ba08604c490deb9950861428f1babe41d8', 1, '', '13097749242', '1492977390790.jpg', '123456@qq.com', '1992-04-26 09:33:02', '452123199104130203', 0, '', '梧州市', NULL, NULL, 0, '2019-01-16 00:00:00', '2020-02-08 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (52, '20170423153209110016', '', 1, '李智锐', '（测试）李智锐', 'bacb9c53b2acba39e40fc2a69c90a32af01b2fc0e150f51063b069f1fefcbf15413ef128a79826e7', 1, '', '18516665389', '1493431623999.jpg', '19398620@qq.com', '1989-04-15 01:14:56', '450404197201010041', 0, '电子工程师', NULL, '', '', 1, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (53, '20170425091851110017', '', 1, '李春彬', '李春彬', '5fe5a46f664a168553f5173ae8328a883df9d255861b7c555b72ceb3dc2fef935e0f9604ae798cfb', 1, '内蒙古赤峰', '13356875352', '1493605432647.jpg', '', '1958-06-18 09:16:52', '150402195806182414', 0, '', NULL, '', '', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (54, '20170425093856110018', '', 1, '耿文涛', '耿文涛', '2b37d7ca93d5319ee45c67eb9a40ea72d6df1e352c641954ce864cced4d922e3952cff5f181b2f28', 1, '', '13831005629', '1495182465963.JPG', '', '1989-04-15 01:14:56', '123456789123456789', 1, '', NULL, '', '', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (55, '20170425094045110019', '', 1, '邢若琪', '邢若琪', '1585aa1478e015f0e13e06e6a49772f6da2f9cb45319fbada973a9b4827799f7cd65a52663803487', 1, '', '13738022698', '1493454294777.jpg', '', '1989-04-15 01:14:56', '123456789012345678', 0, '', NULL, '', '', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (56, '20170425094231110020', '', 1, '刘江', '刘江', '20fc042f9a31ce68c1f92e8bf0e8ee281ded5d0298be7c0443d832f750c18ba43fdde299a31e0cd6', 1, '', '13608188632', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '执业医师', NULL, '医疗，保健，养生，益寿，八卦象数疗法学习', '    1968年开始学习中医。\r\n    1978以后，相继完成医学院，中医学院的系统学习。中医研究院的短期提高学习。\r\n     临床方面，经历住院医生，内科急救，中医治疗疑难病几个阶段大量实践。\r\n上个世纪八十年代中期以后，任医院业务院长，县红十字会副会长。\r\n中国中西医结合学会会员。\r\n    2011年开始，学习李山玉老师开创的八卦象数疗法，在医学门诊和网络空间广泛实践，深入探讨，通过五万多病例的研究分析，发现了一些规律性的东西，积累了大量的象数疗法临床经验。\r\n    从2017年开始，在研究所领导下开展一些新的工作。', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (57, '20170425094416010021', '', 0, '白艳', '白艳', '5f26d02153769073ed6a6d2476ff6ca0b54d245a1188740d1e52cc6096889765f2ebdd6d37243fdf', 0, '', '13309235555', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '陕西西安', NULL, NULL, 0, '2017-04-25 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (58, '20170425094646010022', '', 0, '白福堂', '白福堂', 'ce11d6af47402078a201945849098b2ba17cf2479b9b056a7fe456c2ebeb38e1ad770e3d0984ca06', 1, '', '13709188111', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 1, '', '陕西西安', NULL, NULL, 0, '2017-04-25 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (59, '20170425094743010023', '', 0, '李东升', '李东升', 'd32eea2d3fb583ab5e287aa58a937eb2999802433a2e9eebc0a2cd0a4a215262bf3aa6a1dd8445d2', 1, '', '15900354578', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '天津', NULL, NULL, 0, '2017-04-25 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (60, '20170425095123010024', '', 0, '韩应健', '韩应健', '0cc306fbb787c2b0982b6225ddd08a2957a4e7142002b222aea33a64e56f71d7ce2fa703fe94e37e', 1, '', '13601178133', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '北京海淀区', NULL, NULL, 0, '2017-04-25 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (61, '20170425095658010025', '', 0, '杜莉', '杜莉', '77e33f5ef71a9027e196f406c36e68cfffce5596d61102defac929cb012e20f0cf82924262d59050', 0, '', '13621195787', NULL, '', '1955-01-09 00:00:00', '123456789012345678', 0, '', '北京房山区', NULL, NULL, 0, '2017-04-25 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (64, '20170425101341110027', '', 1, '彭爱莲', '彭爱莲', '8865f8a80d25b8953b4ff1d7205b137f448445e3c3e8a91b58feefa84a1fbf0314aeb0e4704c649a', 0, '', '15839938898', '1495182753310.jpg', '', '1989-04-15 01:14:56', '123456789012345678', 0, '', NULL, '', '', 0, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (67, '20170425103009010030', '', 0, '李智锐', '李智锐', 'd939fef1f92dcc7ef6ac331e56aacfbf50f541b9a7949506b989430395adf99fab0bbe0db0ccfaa3', 1, '', '13307743890', '1493431417582.jpg', '19398620@qq.com', '1989-04-15 01:14:56', '123456789012345678', 0, '电子工程师', '广西梧州', NULL, NULL, 0, '2017-04-25 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (70, '20170426093741010033', '', 0, '昌琳', '昌琳', 'ef46d771f757a620083bf5b5ff1e7ccb11fb24ab6f415573f321bbab2b64e0979b530036b0eed15b', 0, '', '13764239333', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '上海', NULL, NULL, 0, '2017-04-26 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (71, '20170426110919010034', '', 0, '王娟', '彭丽君', 'ee5b8a7f91904f5b16845917b9e6f460660d536dc5a31fa0ab0fa3edc2882c3573cfe50ad537e7fe', 0, '', '15907383388', NULL, 'abc123@qq.com', '1960-11-15 00:00:00', '123456789012345678', 1, '工人', '湖南省娄底市', NULL, NULL, 0, '2017-04-26 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (75, '20170427182631010038', '', 0, '包中琳', '包中琳', '721640b3d4227ad44481d2c187c9d507ca62eaaeb00708fd2e81137b11dcfca184c0e88a4059508b', 0, '', '13552968086', '1493880332726.jpg', '', '1989-04-15 01:14:56', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-04-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (76, '20170427183315010039', '', 0, '杨丽', '杨丽', '605c1b241c7f2dd9efa37ec93a526190339f4f021e57c09fc405629a5b31c0ff0151d2a4b96ef113', 0, '', '18840068296', NULL, '603951182@qq.com', '1989-04-15 01:14:56', '123456789012345678', 1, '公务员', '沈阳', NULL, NULL, 0, '2017-04-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (77, '20170427183925010040', '', 0, '邬雪萍', '邬雪萍', '357851d196550312b2929a7e828b2e1b75fb1c67d0b99455d09945c52220a958f4a7264bd9104cef', 0, '', '13829388088', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-04-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (78, '20170427184328010041', '', 0, '韩胡睿轩', '韩胡睿轩', 'f639fe9e7743ba57ebc89ea3e193e01ed68870a929f19faf0f5c15074b74f6b588b6777b0e2f0916', 0, '', '13199319419', '1494241210517.jpeg', '13199319419@139.com', '1989-04-15 01:14:56', '123456789012345678', 0, '讲师', '中国', NULL, NULL, 0, '2017-04-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (79, '20170427194054010042', '', 0, '邱静', '邱静', '2aecb6ee87a731e098fa27319c90378d22e9b7286d34a4130a4c2c257f978601c5a473660d8c74b3', 0, '', '13885720787', '1493468294566.jpg', '', '1989-04-15 01:14:56', '123456789012345678', 1, '', '四川泸州', NULL, NULL, 0, '2017-04-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (80, '20170427194545010043', '', 0, '靳玲玲', '靳玲玲', '0232d02eff5a680dbe2f13e557fc136a8a38a59674e35182156bf123168d095247fff9a410afc996', 0, '', '13002338881', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-04-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (81, '20170501080642010044', '', 0, '张宏', '张宏', '403dd1edde0d8a4422d748cb4cdfbdce850cc1eab279be9f3fd2d6fc6623cfe9a738acf00fc0ca50', 0, '', '15637918063', NULL, '2248281712@qq.com', '1964-01-15 00:00:00', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (82, '20170501115303010045', '', 0, '芸慧', '卢憶申', '9cf42cebc541892aa4c6fcd457e19ad4346fd79ef76a0b0ab80523b674702b2c286f1a974b5d544a', 0, '南京秦淮区王府大街三茅巷2号501室 ', '13913867389', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 1, '退休', '中国', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (83, '20170501161034010046', '', 0, '乔英艳', '乔英艳', '7b3f9ec7da7fafce1a47557999646dc71c9e8971600e22d5984d38fb03fc3fb70f823866e2056098', 0, '', '13863636706', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (84, '20170501221746010047', '', 0, '栗青爱', '栗青爱', 'c5b46b71e96f167a9ee092ed6449d155f4e3fbe9438961baddcf46cd0c96b8a8dd1e74d0aea90adc', 0, '', '13935327260', NULL, '', '1946-07-24 00:00:00', '123456789012345678', 1, '', '山西阳泉市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (85, '20170501222054010048', '', 0, '王楚娟', '王楚娟', '4855872ce96bfa57ed2f27a076682ab94b9a13a38a08a6596780ef40ce481cb11e29fc12e19098f9', 0, '', '13362704511', NULL, '', '1942-09-13 00:00:00', '123456789012345678', 0, '', '浙江温州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (86, '20170501222304010049', '', 0, '杨士武', '杨士武', '52f6c33865a262b7c6a630071575fdacef8e84e8d624af583a91734ce0ca8f35c01348119744bf74', 1, '', '18910069977', NULL, '', '1955-02-21 00:00:00', '123456789012345678', 0, '', '北京海淀区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (87, '20170501222538010050', '', 0, '苏淑民', '苏淑民', '7d9638beb88a6c6c929b32e23cf781c615a18f202d7ae9e0a1af319235fc61f71febda7ed340408c', 0, '', '13995000235', NULL, '', '1949-07-27 00:00:00', '123456789012345678', 1, '', '宁夏银川市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (88, '20170501222710010051', '', 0, '乔兴伟', '乔兴伟', '862a034159593fd8c9c540108be14eeeff7cf68fd002fe49eabb8f36ad7aeda63856ada8dca3dd48', 1, '', '15921923716', NULL, '', '1989-01-17 22:26:29', '123456789012345678', 0, '', '上海浦东新区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (90, '20170501224032010053', '', 0, '赵雅云', '赵雅云', '384c6966dd616dc7414abf318338810d7e52d0a3b13661021fede1c84360376f975745192edbd7cc', 0, '', '13621378964', NULL, '', '1957-01-31 00:00:00', '123456789012345678', 0, '', '北京东城区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (91, '20170501224206010054', '', 0, '金健', '金健', 'd87594544e0b31f7e4063b7ecb30467360044d5f8701ab76ac5cdc68f712162a3c788fcbf5694962', 0, '', '18613703530', NULL, '', '1973-07-30 00:00:00', '123456789012345678', 0, '', '河南洛阳市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (92, '20170501224304010055', '', 0, '徐一宁', '徐一宁', 'a5e017d82af9583b744e187ec9231de4b4f18b664af677ac1bf2d4a597f7b7fe64b1a1fced28f621', 0, '', '13944941913', NULL, '', '1967-09-03 00:00:00', '123456789012345678', 0, '', '哈尔滨市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (93, '20170501224434010056', '', 0, '李文', '李文', 'e27fd427f1d79cb3d7d7800b4a9bc101d1695be0dbbbc0b5285320a2196ec80e999ca8f8c132eb4a', 1, '', '13303660692', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '黑龙江肇东市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (94, '20170501224604010057', '', 0, '于任平轩', '于任平轩', '1d4a5a650d1771d29c52ad51459021ff7371e4f38abfba458e27afc979fe1870d6a8a3f89a679d42', 0, '', '13419141313', NULL, '', '1970-12-21 00:00:00', '123456789012345678', 0, '', '黑龙江哈尔滨市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (95, '20170501224832010058', '', 0, '莫建国', '莫建国', '326f0edf776f5a32479f3a2040e8b82484e2c6d206667d3ba5b66ed4bc66a9f8ba2bedfe17e66d18', 1, '', '15312082153', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '江苏省南京市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (96, '20170501225050010059', '', 0, '林兰', '林兰', 'e8623187be928123ce852d2bce9d055582702bf70e81a49da8632f88042045423ebd0326cad6cd05', 0, '', '15331941931', NULL, '', '1967-05-28 00:00:00', '123456789012345678', 0, '', '黑龙江哈尔滨市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (97, '20170501225233010060', '', 0, '严凤玲', '严凤玲', '7b64c6d1e8de519b4df5cce005855fcd6f8d2eeb6202fd8357b6bd461a46fcc077541d3ac70bb6cd', 0, '', '13396516229', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (98, '20170501225325010061', '', 0, '金爱子', '金爱子', '98f23cf0f0045ad5ea47b1c182d31d2e95370e5c0c7df8c8853f97015f19040bcad197bd09496f9c', 0, '', '15264256939', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '山东青岛市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (99, '20170501225606010062', '', 0, '张桂秋', '张桂秋', '47e252629e70f216921bbfc24652ac55fce57b2493448ac677b144a0e83ca86405edbd13606fc409', 0, '', '13589889908', NULL, '', '1961-12-31 00:00:00', '123456789012345678', 0, '', '山东烟台市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (100, '20170501225725010063', '', 0, '文锡英', '文锡英', 'ecc9400bc69fca3a627188a4433c1fbaf2ce158b314d3dab5079d7f1d899f9f72e94996b300fcf97', 0, '', '15881629440', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '四川绵阳市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (101, '20170501225823010064', '', 0, '曲玫', '曲玫', 'de7b492c259c546e0fef7ef412fb70c804a955122085addffa304be780099244354ce44a2f1ac63f', 0, '', '13718877207', NULL, '', '1941-09-04 00:00:00', '123456789012345678', 0, '', '北京丰台区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (102, '20170501230006010065', '', 0, '丛秀娟', '丛秀娟', 'eeccc1e4aa6072f6b1a6414431f1cf6eef11de223f706491992aa5bd4c8fc01a523baf2102b74e41', 0, '', '13349413199', NULL, '', '1970-07-06 00:00:00', '123456789012345678', 0, '', '黑龙江哈尔滨市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (103, '20170501230108010066', '', 0, '陈君英', '陈君英', '63ee72748973f76bf91faf0cb4e0bea3c993d43b995120707ed7bfd22ee2aa205126b38d36932ac6', 0, '', '15367998887', '1494242552173.jpg', '', '1942-03-15 00:00:00', '123456789012345678', 0, '', '湖南长沙市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (104, '20170501230145010067', '', 0, '渠淑卿', '渠淑卿', 'afc41bfba0cc78e2f1939447ffa740a962006575c02812f4c142e3d9a00707ee07b3847957ebe34b', 0, '', '13641033757', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '北京海淀区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (105, '20170501230256010068', '864140230', 0, '谭晓昭', '谭晓昭', 'a994872774ffe44681b33309040b9ccb18cc5d59ee374e3846d0213be4ff9d838f2605d03d789924', 1, '', '15295843514', NULL, '864140230@qq.com', '1968-01-02 00:00:00', '123456789012345678', 0, '农业', '广西桂林市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (106, '20170501230436010069', '', 0, '李玉玲', '李玉玲', 'e4855622a547f8c4bcc684580a802a1f1ecc5a7dbba63da2bf590bc91b9098fb74deb8f0e9fe5c8f', 0, '', '13365716568', NULL, '', '1942-09-26 00:00:00', '123456789012345678', 0, '', '安徽芜湖市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (107, '20170501230523010070', '', 0, '陈养添', '陈养添', '0712e0707ddfc87e8e3058b9d48739d8cc2f44d8f8775d93976a3cad29606b83eabefa5a393fb78a', 1, '', '13650833234', NULL, '', '1950-03-05 00:00:00', '123456789012345678', 0, '', '广东广州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (108, '20170501230615010071', '', 0, '唐敏', '唐敏', '1b25fabc52847c5480fb0806643e70e5122beed7f433fda14ed4589f4a1c7b2382d39869fe414aa1', 0, '', '15150949600', NULL, '', '1966-03-23 00:00:00', '123456789012345678', 0, '', '江苏连云港市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (109, '20170501230757010072', '', 0, '谌秋燕', '谌秋燕', 'e8cacc5c72a33ce19c1a509383fc7c6596521b114028266f813a5013cde301f05862033cdd23cc58', 0, '', '13641313526', NULL, '', '1981-11-05 00:00:00', '123456789012345678', 0, '', '北京市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (110, '20170501230911010073', '', 0, '陆宇群', '陆宇群', '695d447e4434f29355b91013bd7e7f71c3beb4ac29bad225878b15f065a79ad765b19ab784266521', 1, '', '13655206665', '1495108990688.jpg', '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '江苏徐州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (111, '20170501231009010074', '', 0, '莫亿锋', '莫亿锋', '727c9283bfb72de8ee18aa0dc8070942b11fd90a285cd00e411b5aadb6007ed9066df095136cdd2d', 1, '', '13758125366', NULL, '', '1974-11-24 00:00:00', '123456789012345678', 0, '', '浙江杭州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (112, '20170501231129010075', '', 0, '孙丽艳', '孙丽艳', '94917bcf2c56c8371422df266f18ba5a93ce1356c579300a270590fda55f93f39c0b8086e83dcae3', 0, '', '13790712084', NULL, '', '1981-01-21 00:00:00', '123456789012345678', 0, '', '广东佛山市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (113, '20170501231234010076', '', 0, '王建新', '王建新', 'f524dc3de03481757cbdc20c79f272f8c535dc737ceb0922eec171645940dfade81cbb7dda0fa9cb', 1, '', '18950419959', NULL, 'fzwls@126.com', '1952-10-03 00:00:00', '123456789012345678', 0, '律师', '福建福州市仓山区融信第一城29座907', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (114, '20170501231334010077', '', 0, '姚飞', '姚飞', '48f5b8129e78116cad394e850fef5a8b7222db2423a26d6cfe8f374aed5b68a5b186ac8dfae65502', 0, '', '13758245141', NULL, '', '1978-01-04 00:00:00', '123456789012345678', 0, '', '浙江杭州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (115, '20170501231412010078', '', 0, '徐守臣', '徐守臣', '09cabb4d62d475ef4e9d543c130983cba795af071daebda1338ad005acb075b9c3c233eabffa6cdf', 1, '', '13603286668', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '河北涿州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (116, '20170501231519010079', '', 0, '宋军军', '宋军军', 'a91d4f8d7a6fa80095e6f3f3f405ea4cad18f1d96580ac6b91ef8b66ef6d9054d516478f1e02b948', 0, '', '18926040616', NULL, '', '1967-07-16 00:00:00', '123456789012345678', 0, '', '广州深圳市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (117, '20170501231616010080', '', 0, '马国武', '马国武', 'd2c6474fac86a79757cd8773f3c91a924ebe66fdb66b18af61627f053e9ab235357ebb62ac5513ff', 1, '', '18105987542', NULL, '', '1935-02-15 00:00:00', '123456789012345678', 0, '', '福建永安市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (118, '20170501231652010081', '', 0, '梁莲玉', '梁莲玉', '766e190493a8c7ba282a05b556556e5f3f1a135cac98fd9c6f44acd7dd026ea22b67a58b5219cafe', 0, '', '13764828413', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '上海 ', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (119, '20170501231747010082', '', 0, '何文君', '何文君', '8b94cf795806056b3a81e0282e8f0458115db10d8c06f561e0a02ce192d985c3bf5efd9a91efffc1', 0, '', '13917823127', '1498539874245.jpg', 'aaa@163.com', '1942-11-27 00:00:00', '123456789012345678', 1, '', '上海 ', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (120, '20170501231841010083', '', 0, '陈景希', '陈景希', '743387627eab494dc6e02b70d74041ef31d3d9b0bbc35892ff9278eecd24022d96cd777efa6dc1da', 1, '', '15859049671', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '福建福州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (121, '20170501231948010084', '', 0, '林雪津', '林雪津', '5276011588ac1925a44c6f14972666640086682fbc8bba8e4393e99b3035e679fa39340cbdfe89a8', 0, '', '13857702058', NULL, '', '1962-01-18 00:00:00', '123456789012345678', 0, '', '浙江温州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (122, '20170501232026010085', '', 0, '周小超', '周小超', '9ef24c96d3641b3fd88b5fbfca01c520bbfc1ba001c403aebae284aac7fd5178d13d3655548f689f', 1, '', '17767688371', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '新疆', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (123, '20170501233326010086', '', 0, '张妙', '张妙', 'badae97cc886820076eb1592807ac75c2517b5cfb35f12e70f686239d08d140d1a2c34883079fc4e', 0, '', '13110054386', NULL, '', '1945-06-07 00:00:00', '123456789012345678', 0, '', '天津和平区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (124, '20170501233358010087', '', 0, '李兆萍', '李兆萍', 'bad08ac69d0100fa72534f078be196aa8745fd035c135dd968c0f33731524216cee3a00865a3e8b2', 0, '', '13658860516', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '云南昆明市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (125, '20170501233451010088', '', 0, '王平', '王平', 'f0e37f6dcc8ed9c31c8420adaa44da11f90a8b59d390f72d140cded4c0282dbf87ed22f54e365b6d', 1, '', '15846035182', NULL, '', '1972-09-06 00:00:00', '123456789012345678', 0, '', '黑龙江依兰县', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (126, '20170501233541010089', '', 0, '黄宏仕', '黄宏仕', '4dc50bc86018109db4b20596c03629058821817d1f40f61c18f66ac58b04505eeeb9c59dc90b8c8c', 1, '', '18923212587', NULL, '', '1951-06-09 00:00:00', '123456789012345678', 0, '', '广东广州市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (127, '20170501233610010090', '', 0, '马春兰', '马春兰', '8e900d5f880156fe7e48e19c898c8668804ae456c510fe83c5e52fa8828eae7868a1fe5ef563f930', 0, '', '13834581711', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '山西太原市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (128, '20170501233703010091', '', 0, '张筱秋', '张筱秋', '369954e7a307957367672ca2f3525c77354841ab22a1e4c01dfaf0ba6c6e9116e33d44dbc4436923', 0, '', '13601278076', NULL, '', '1950-11-13 00:00:00', '123456789012345678', 0, '', '北京西城区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (129, '20170501233741010092', '', 0, '王翠琴', '王翠琴', '6632dd975950701f192d3bc6cb14285608638e5aa9c53a526e1065cd81662e9aaecb9617bd855f50', 0, '', '18108635382', NULL, '', '1957-05-11 00:00:00', '123456789012345678', 0, '', '湖北武汉市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (130, '20170501233815010093', '', 0, '杨丽红', '杨丽红', 'aba75fc8d5bb7f1a58933264eae229443473d8ac41f9cbccb157b1f9628d12e8417f86d40dd69d99', 0, '', '13582520304', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '河北唐山市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (131, '20170501233937010094', '', 0, '詹定金', '詹定金', '1e3257eddd6eb5089c34193e844c5c743455e74f6671f06869a701f5232c204d79e1d6c4015416c8', 1, '', '13918830276', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '上海', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (132, '20170501234121010095', '313425638', 0, '韩蕴辉', '韩蕴辉', 'b85b07744087cab99cedcb3a32d57b525ffa7c6da1a2e9c794aa967f5628965d8c7cc8316a2152dc', 0, '', '13930525226', '1493806741384.jpg', 'kaipinghyh@163.com', '1970-07-26 00:00:00', '123456789012345678', 0, '银行从业者', '河北唐山市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (133, '20170501234212010096', '', 0, '林玲', '林玲', '9743e59ad7bcf7b4427ccceebbe7d6817252ac67eb8ddd1d11bdeec39ca3bc84d3cfb860369d3802', 0, '', '13770620138', NULL, '', '1957-06-13 00:00:00', '123456789012345678', 0, '', '江苏南京市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (134, '20170501234246010097', '', 0, '闫素琴', '闫素琴', 'f463ac7476f44044ddccaa505c509436f55c15ee7742b94fe38999e53e881a0fba7d27d63d83f4e5', 0, '', '13513091293', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '河北秦皇岛市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (135, '20170501234314010098', '', 0, '孙晓云', '孙晓云', '0622683d7144c2414963701a78e4fec9ad25f932ad5b7b4cc2387c9765f7dd6c37542dc53aea5e0c', 0, '', '13655199193', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '江苏南京市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (136, '20170501234403010099', '', 0, '朱星河', '朱星河', '7cad24e54be9a80bcf4f0cddadf29ddffac8d677f16b9489796cdc9e2dcb9f9f508fbc31f2ace5ea', 1, '', '13828209421', '1494665348030.jpg', '', '1959-02-26 00:00:00', '123456789012345678', 0, '', '广东湛江市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (137, '20170501234444010100', '', 0, '于红', '于红', '57c6925f90d30e532879960a62a0f0a3b3b3b1d8e3971b4d70c3bd76d5d003407970b9d8d50df181', 0, '', '13072255060', NULL, '', '1941-06-14 00:00:00', '123456789012345678', 0, '', '天津红桥区', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (138, '20170501234555010101', '395252', 0, '周彰', '周彰', 'cd34a7a04d8d5df82ea5e2f1e410a7e4b5d09035fc06db11eef00fc8c9a5ebe3d42c8eacfa656d40', 1, '', '15327129915', '1494215836361.jpg', '395252@qq.com', '1976-02-02 00:00:00', '123456789012345678', 0, '服务业', '湖北武汉市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (139, '20170501234645010102', '', 0, '刘海燕', '刘海燕', '8ad2a52b9119bea24d708f34afe5ccdf0aaf6e24120584137291d5c430b54ba5ced1cf9e251591d7', 0, '', '13141918526', NULL, '', '1983-11-04 00:00:00', '123456789012345678', 0, '', '江苏 ', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (140, '20170501234733010103', '', 0, '胡明珍', '胡明珍', 'ef60761924ea029a8a858779590c2e9f36abf0ac88fd7e6319dd24fc3025663a583bb4936194140b', 0, '', '13408636496', NULL, '', '1941-09-20 00:00:00', '123456789012345678', 0, '', '四川成都市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (141, '20170501234804010104', '', 0, '陈生', '陈生', '0ca8381cf153fb0c4e76e9971f3e293a5fd79517dd1656e3f98addc88e2f5f368c9a5510755544ae', 1, '', '13542322009', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '广东茂名市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (142, '20170501234900010105', '', 0, '王怡', '王怡', '1a4ce4db3ccf34eb35cf41eb3e9d86113cb276b425c6630f206dd75320105b23439c668b04c05705', 1, '', '17317800810', NULL, '', '1979-12-21 00:00:00', '123456789012345678', 0, '', '上海 ', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (143, '20170501234951010106', '', 0, '杨树兰', '杨树兰', '9565ca6680fa6cedb25882380eaf2d82fdab590b4887576b6e3f8347a5724b0d21061d6448367d57', 0, '', '13618533798', NULL, '', '1937-01-06 00:00:00', '123456789012345678', 0, '', '贵州贵阳市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (144, '20170501235041010107', '', 0, '黄春霞', '黄春霞', '5449421f1554d27734e0a34d296788a7b6341093a8cdac7a1dcada9fcb68c2620cc6427b93c1319d', 0, '', '18938027145', NULL, 'aaa@163.com', '1972-06-02 00:00:00', '123456789012345678', 0, ' ', '广州深圳市', NULL, NULL, 0, '2017-05-01 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (145, '20170501235711010108', '', 0, '李凤双', '李凤双', '26d67ba5598074f664281472bf2a87d4e9ccbe094a30acc1a268b91806e0a837f7ec0ec6f727dc0d', 0, '', '18249551984', NULL, '', '1984-09-04 00:00:00', '123456789012345678', 0, '', '黑龙江大庆市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (146, '20170501235817010109', '', 0, '初丛力', '初丛力', '4c327afc5f6e5a10007b842247e5b01b958082f73c9e6bd523e035afe4ceed92c0fe3a481ba443bd', 1, '', '13633662277', NULL, '', '1972-01-15 00:00:00', '123456789012345678', 0, '', '黑龙江肇东市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (147, '20170502000045010110', '', 0, '潘谷兰', '潘谷兰', '180c02237d2e2f317cf1f79d5f1793e4009eec5a3be662c161219c192ac2ef672ee1daa34c6abc69', 0, '', '13974254292', NULL, '', '1962-07-17 00:00:00', '123456789012345678', 0, '', '湖南常德市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (148, '20170502000135010111', '', 0, '李惠', '李惠', 'b8d0d20b0ce609356052c56948e3a626415e91e1e4b4b6f89986d8f2c44c8fe634ce7a9c9653591f', 0, '', '13552009835', NULL, '', '1957-08-25 00:00:00', '123456789012345678', 0, '', '北京 ', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (149, '20170502000237010112', '', 0, '孙秀英', '孙秀英', 'b8abc3c7ccdadcc807616bda6a7b36e01647cd743423f3c2291b4a184f8940b1e916868b6cff583a', 0, '', '18600411072', NULL, '', '1952-09-24 00:00:00', '123456789012345678', 0, '', '黑龙江鹤岗市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (150, '20170502000330010113', '', 0, '林小津', '林小津', 'ac63c9123b7ba8216cf1549794a63fa547060e8a168cd67e681c36130292a579f1006ff4255bf419', 0, '', '13736328285', NULL, '', '1960-02-17 00:00:00', '123456789012345678', 0, '', '浙江温州市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (151, '20170502000418010114', '', 0, '鲍盈', '鲍盈', '26f4afa827a0aca235dfeed906ebda08fc2df38b5f8d95a763fb9f0d534e42d08163b2b68d384f53', 0, '', '13001976786', NULL, '', '1954-12-08 00:00:00', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (152, '20170502000515010115', '', 0, '王秀玉', '王秀玉', '679fa886b2e57e90cfd956a945a1381071563cb1fd0305cdd02811e5647bf15dad6f0e3fdb3704c3', 0, '', '15562688681', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '山东济南市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (153, '20170502000605010116', '', 0, '王均', '王均', 'cd91bb7c6f13c4284e82aad846ae0318da5ee95c773c4d3833b2907224603f11b9fa5bc2824a36c7', 1, '', '13840321865', NULL, '', '1955-03-20 00:00:00', '123456789012345678', 0, '', '辽宁鞍山市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (154, '20170502000740010117', '', 0, '赵月良', '赵月良', 'f2d81b57699030c0b5c9df2c5b1bcb4f8e22c25a4e0fad774cbc046478a78208612be073a9885a4a', 0, '', '13852887259', NULL, '', '1948-03-26 00:00:00', '123456789012345678', 0, '', '天津 ', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (155, '20170502000832010118', '', 0, '曹量雯', '曹量雯', '07bf5f95ccf24b259efd2163b411f3e78a647e7aba8291fd6c3ce1006cb77434fb9f811b64bde940', 0, '', '18964345347', NULL, '', '1948-04-16 00:00:00', '123456789012345678', 0, '', '上海 ', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (156, '20170502000907010119', '', 0, '王明唐', '王明唐', '74ade806ff45c0c0836c51bc61591ec3b0b2e47242157c396014b5e24b6d1c8c1a72ea3ff5541aaa', 0, '', '15175594309', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '河北唐山市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (157, '20170502000956010120', '', 0, '刘晓辉', '刘晓辉', '41dcd40e96acd6af6d9705d45bb83040d419ea11a3e541a1393aaf1d75390bdc4d83ae57f9e75cf6', 0, '', '13703399875', NULL, '', '1969-06-27 00:00:00', '123456789012345678', 0, '', '河北石家庄市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (158, '20170502001028010121', '13245297209', 0, '庞淑琴', '庞淑琴', '5909a2d4c1b3690ecd96654a45856392be055ffc36f3cc88109866b9eccbe0fa963ffa8b04fdeca7', 1, '', '13245297209', NULL, '13245297209@qq.com', '1989-04-15 01:14:56', '123456789012345678', 0, '退休', '江苏南京市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (159, '20170502001114010122', '', 0, '张茵', '张茵', '18968e23a573a0d77d8b32d2402627e2f50e230bffe8ff460119bda73adfdc7ef0766f7cd5bfc9b0', 0, '', '13776019966', NULL, '', '1978-04-06 00:00:00', '123456789012345678', 0, '', '江苏苏州市', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (160, '20170502001206010123', '66554114', 0, '边艳辉', '边艳辉', '0690feb9c5f73a37674a332b1855d864df712b4d8d870571daf6b084792a423a6e2a230e21581517', 1, '', '15922739353', '1494329734039.jpg', '66554114@qq.com', '1975-10-16 00:00:00', '123456789012345678', 0, '技术研发', '重庆渝北区', NULL, NULL, 0, '2017-05-02 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (162, '20170503184433010125', '', 0, '金藹', '金藹', '7f9953c63f79ee16cab15d63c32674d2dbad089460c9f1c7c5f57ec44122cf56b325d772eb3109b5', 0, '', '18969720567', NULL, '', '1943-05-14 00:00:00', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-03 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (163, '20170504111148010126', '', 0, 'weifen', 'weifen', '2f7cdfb4fee18b75f9878fc3b909c50f47d1db7e659bff2c5c110fd245e5f75289b82a2f173daabf', 1, '', '2022533036', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-04 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (164, '20170504143847010127', '21331212', 0, '测试李', '测试李', 'ecc8d33bf43d7b729e57faa440d5f3ae19736d7b258c04846ce82828b22683b013baa1f84f18a58b', 1, '', '13977496702', NULL, 'letmeon@163.com', '1989-04-15 01:14:56', '123456789012345678', 0, '攻城狮', '中国', NULL, NULL, 0, '2017-05-04 00:00:00', '2017-07-31 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (165, '20170505111933010128', '', 0, '李松江', '李松江', 'e7e051ea4932217aba9d8475a0062a51c2aecd6e7a6d716665c5ce1e04df8266e31ba2e5e47e3c7f', 0, '', '7036188178', NULL, 'Songjiang.li@gmail.com', '1956-03-09 00:00:00', '123456789012345678', 0, '退休', '762 union street #1, Brooklyn ny 11215 U.S.A.', NULL, NULL, 0, '2017-05-05 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (166, '20170505201822010129', '', 0, '明青妤', '明青妤', '660c0ef4f81f9a014698e35800a533a796b408a5ec8896036092db8725eb2a9f4340c428fba95b86', 0, '', '13681961131', NULL, '', '1970-01-19 00:00:00', '123456789011234567', 0, '', '上海宝山区', NULL, NULL, 0, '2017-05-05 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (167, '20170509134549010130', '', 0, '方小敏', '方小敏', '7c7d8d3f1019b74dd4abdf8546a707aa1f993133c064047959e955d400138d72dec3e0e84c20660a', 0, '', '18907198009', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-09 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (168, '20170509153411010131', '', 0, '范永福', '范永福', '30064466da06cc955cce53d433ecb87d63ca7fdb068b99a8acf90b993814b29e56e5efe6385d6290', 1, '', '15023386872', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-09 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (169, '20170509164109010132', '', 0, '刘素琴', '刘素琴', '5c985cbcd1d026d724f5a928ccbaca42985641044278ecc72e51beba3f2cd0bfaacf8115c39fa88b', 0, '', '13131661777', NULL, '', '1989-04-15 01:14:56', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-09 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (172, '20170515193823010135', '456546546', 0, 'ce试', '测试', 'e7098f4a2267d94f00346b59bf746a88f58857e93823681a01770d7d7edc6dc8746c7e8cde9dea51', 1, '发安分', '1036982179', NULL, '456546546@qq.com', '2017-05-15 19:38:05', '450881199625140141', 0, '发送', '安分', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (173, '20170517212932010136', '无', 0, '马春兰', '马春兰', 'd76668824b9d9d7007b36ae429f7c333de862195aae1ab14bd4e661fbc71bd711cdf5a9507dca4a4', 0, '', '15340664668', NULL, 'aAA@163.com', '1989-04-15 01:14:56', '123456789012345678', 1, '工人', '中国山西太原', NULL, NULL, 0, '2017-05-17 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (174, '20170517215605010137', '', 0, '郑海英', '郑海英', '99432efd0f3a2cdc088fe66b595331ac09689a40642f9f67554951164432dc913002616dbd6c0509', 0, '', '13923708659', NULL, 'aaa@163.com', '1989-04-15 01:14:56', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-05-17 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (175, '20170517225817010138', '', 0, '刘云', '刘云', '9bef4b6ff99420f0e163cf752e17f85acbd1a441c2ed893ab16c5cc89f5e969f2910fb0524c9fddf', 1, '', '18159820668', NULL, 'AAAA@163.com', '1989-04-15 01:14:56', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-17 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (176, '20170518110920010139', '', 0, '王锁柱', '王锁柱', '2303fbcb684a22b880d0838557c73752a1f82d53b528e4647b2e4d75ac812851ff36a319fe4578bb', 1, '', '13948206777', NULL, 'aaa@163.com', '2017-06-13 02:54:08', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-18 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (177, '20170519173019010140', '', 0, '陈丽琴', '陈丽琴', 'c15f7c2c8c233fc38ce816d23a2e9e60756b3a9229a46c8530d5b59878f2d31139c5a4bd1191a00b', 0, '', '18960698576', NULL, 'aaa@163.com', '2017-06-20 02:54:03', '123456789012345678', 1, '', '中国', NULL, NULL, 0, '2017-05-19 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (178, '20170520111349010141', '', 0, '王广月', '王广月', 'b8f5c2bd1e0e56a2d81b6b346488ed3fef6ed900393dcb33ce5808a5b7dd7f02c8d5f301b3d87b6e', 0, '', '13132167976', NULL, 'aaa@163.com', '2017-06-20 02:53:51', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-20 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (179, '20170520175747010142', '', 0, '田景花 ', '田景花  ', 'a4a14871a5beaea5f39e93d1fba4134ea862ff56f1cc424fadad5d7a4321f03ad2bab02680022e0b', 0, '', '13012536125', NULL, 'AAAA@163.com', '2017-06-06 02:53:57', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-20 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (180, '20170520194558010143', '', 0, '温育青', '温育青', '1b8438b2ef11ac693f5cb94bed11d128cc23ae5880803de76d474518f88b140678b87cce10718983', 1, '', '18813267947', NULL, 'AAAA@163.com', '2017-06-30 02:53:46', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-20 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (181, '20170522104357010144', '958149680', 0, '吴晓', '吴晓', '492ec98874be9c5c03625fe806ff98533a30d171a95e110ebe502618df2cc135ecfe442f2264205a', 1, '', '15850554016', NULL, '15850554016@139.com', '1989-09-01 02:53:08', '123456789012345678', 0, '自由职业', '南京', NULL, NULL, 0, '2017-05-22 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (182, '20170522161343010145', '', 0, '李圣嫒', '李圣嫒', '6d3ed4f310e5d19832a846e329e0f2492d797c7a13472f24f59739414ba16f1a587785894ebb5cd1', 0, '', '18353276209', NULL, 'aaa@163.com', '2017-06-13 02:54:13', '123456789012345678', 0, '', '青岛', NULL, NULL, 0, '2017-05-22 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (183, '20170527113538010146', '', 0, '钟丽君', '钟丽君', '75b5cf565c0e9007672e9dd48c995d7cab11a475d07a71b2c040372483da9c6fca8fedbee76c6966', 0, '', '13519769677', NULL, 'aaa@163.com', '2017-05-27 11:34:54', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-05-27 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (185, '20170603114638010147', '5318556845', 0, '莫然源', '莫然源', '61dbe8e561897df3be5bc4f606c65b2990348d197a32843e90de9ab63fdc9b97802d2bbe73040a02', 1, NULL, '13005977263', NULL, '563586388@qq.com', '1997-01-12 00:00:00', NULL, 1, '刚刚好', '梧州', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (186, '20170603130659010148', '', 0, '赵小云', '赵小云', '5db5bfa008488132daf14543059f09e0b121d5c3be1237bcefdfeee3321ae934964426e467a308e0', 1, '', '13938854915', NULL, 'AAAA@163.com', '2017-06-03 13:06:41', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-06-03 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (187, '20170604115441010149', '', 0, '朱仕文', '朱仕文', '36c266b631845e72a5143aedf0adff4d7c9ad8a6f68dd58992d8a793a21b9b885880804b818731fc', 1, '', '16462508987', NULL, 'aaa@163.com', '2017-06-04 11:53:59', '123456789012345678', 0, '', '中国', NULL, NULL, 0, '2017-06-04 00:00:00', '2018-04-30 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (188, '20170608162654010150', '452249512', 0, '依', '依', '530826ec2a9c7c5bc8560d736e195b98e2bbe4d172502da450ff6fb6fa92f719673d4d6f26cc0446', 0, NULL, '13611620234', NULL, '452249412@qq.com', '1987-04-25 00:00:00', NULL, 1, '文员', '上海', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (189, '20170628102737010151', '1074726419', 0, '百合花', '白素镭', 'cfca21a43758f5b61153bec4ff1522c702e620f91268bd4009df7989c14759a3349cb6107e6a81ee', 0, NULL, '15268910059', NULL, '1074726419@qq.com', '1977-07-16 00:00:00', NULL, 1, '教师', '甘肃', NULL, NULL, 0, '2017-06-28 00:00:00', '2018-06-28 00:00:00', NULL);
INSERT INTO `tb_personal_data` VALUES (190, '20170628153248010152', '1074726419', 0, '白素镭', '白素镭', '9b19ee322ada3e546caff1a41e45e3a5c87bc6dc7df6312a098a71db332756457ee59e1106cad857', 0, NULL, '15268910059', NULL, '1074726419@qq.com', '1977-07-16 00:00:00', NULL, 1, '教师', '甘肃', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (191, '20170719143300010153', '36524566', 0, 'halou', 'ffrfr', '4195e088c828760d14186d79d4987bb1de6a580fb9c2f9d781c99fa8ffc2b9f5d908e253a99d5662', 1, NULL, '12345678912', 'default_img.png', '3030289941@qq.com', '1985-12-04 00:00:00', NULL, 0, 'fff', '2222', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (192, '20190107212223110154', '123123123123', 1, '测试（开发团队）', '开发团队', '6b53f72e273e95adfda346808b8c963f5d3453275431fb827c1837b723ce22e74da7aa3903deb521', 1, '123', '123123123123', '1546867343065.jpg', '123123123123@qq.com', '2019-01-07 21:21:39', '123123123123123123', 1, '程序员', '123', '123', '123', 2, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (193, '20190107212844010155', '456456456456456', 0, '(测试)', '开发团队', '0f45b716870816eccc84d5896124d35c7e63b6389d309ad5e6b01cb449afae08e8ed7cd7c8189b9c', 1, '456', '456456456456', '1546867724042.jpg', '456456456@qq.com', '2019-01-07 21:28:30', '456456456456456456', 1, '程序员', '456', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (198, '20190125183228010156', '123123123123', 0, '213', '123', '68ac5628dbdd0312ab07d9063638fd3d3ceaf25c4c1ce802cc1f17212c3aeae33f95e9a64cd4e842', 1, '', '45645645645', 'default_img.png', '123@qq.com', '2019-01-25 18:32:25', '123123123123123123', 0, '123', '123', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `tb_personal_data` VALUES (199, '20190416212201010157', '3132124658', 0, '小猪熊', '小笨', 'e1fbea86ff5d34c3161b5af1c1c847b679e1094c06b41c183c51abebabc6a148824e2ddb83790814', 0, NULL, '13005971613', 'default_img.png', '3132124658@qq.com', '2014-07-22 00:00:00', NULL, 0, '学生', '梧州', NULL, NULL, 3, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_read_device
-- ----------------------------
DROP TABLE IF EXISTS `tb_read_device`;
CREATE TABLE `tb_read_device`  (
  `read_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '听读器ID',
  `read_number` int(4) NOT NULL COMMENT '听读器数字',
  `read_file_path` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '听读器音频文件路径',
  PRIMARY KEY (`read_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1021 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_read_device
-- ----------------------------
INSERT INTO `tb_read_device` VALUES (1010, 0, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/0.mp3');
INSERT INTO `tb_read_device` VALUES (1011, 1, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/1.mp3');
INSERT INTO `tb_read_device` VALUES (1012, 2, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/2.mp3');
INSERT INTO `tb_read_device` VALUES (1013, 3, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/3.mp3');
INSERT INTO `tb_read_device` VALUES (1014, 4, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/4.mp3');
INSERT INTO `tb_read_device` VALUES (1015, 5, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/5.mp3');
INSERT INTO `tb_read_device` VALUES (1016, 6, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/6.mp3');
INSERT INTO `tb_read_device` VALUES (1017, 7, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/7.mp3');
INSERT INTO `tb_read_device` VALUES (1018, 9, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/9.mp3');
INSERT INTO `tb_read_device` VALUES (1020, 8, 'E:/MyeclipseWork/KeepHealth/WebRoot/readDeviceMusic/8.mp3');

-- ----------------------------
-- Table structure for tb_readme
-- ----------------------------
DROP TABLE IF EXISTS `tb_readme`;
CREATE TABLE `tb_readme`  (
  `readme_id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) NULL DEFAULT 0,
  `mentor_id` int(11) NULL DEFAULT NULL,
  `reply_state` int(11) NULL DEFAULT 0,
  `flag_type` int(11) NULL DEFAULT NULL,
  `readme_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `readme_time` datetime NULL,
  `personal_id` int(11) NOT NULL,
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `feedback_state` int(11) NULL DEFAULT 0,
  `mentor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`readme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_readme
-- ----------------------------
INSERT INTO `tb_readme` VALUES (14, 0, 40, 1, 0, '舌质淡红，舌苔淡白', '2017-04-14 17:15:18', 37, '萧萧', 1, '（测试）白小飞');
INSERT INTO `tb_readme` VALUES (15, 0, 41, 1, 1, '头昏脑胀，身体发虚，行动缓慢', '2017-04-14 17:39:02', 38, '杨华花', 0, NULL);
INSERT INTO `tb_readme` VALUES (16, 0, 40, 1, 0, '恶心发呕，严重眼晕耳鸣', '2017-04-14 17:40:41', 38, '杨华花', 1, '（测试）白小飞');
INSERT INTO `tb_readme` VALUES (17, 0, 0, 0, 1, '行动不便，胸若火烧', '2017-04-14 17:54:50', 37, '萧萧', 0, NULL);
INSERT INTO `tb_readme` VALUES (18, 17, 0, 0, NULL, '低血糖，经常头晕难受', '2017-04-15 02:51:39', 37, '萧萧', 0, NULL);
INSERT INTO `tb_readme` VALUES (20, 0, 0, 0, 0, '身体不适，小感冒', '2017-04-15 04:33:44', 45, '李智明', 0, '（测试）AS森');
INSERT INTO `tb_readme` VALUES (21, 0, 0, 0, 0, '耳鸣严重。无法入睡', '2017-04-15 04:36:55', 37, '萧萧', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (22, 0, 0, 0, 0, '春困秋乏，四肢无力', '2017-04-15 04:37:55', 38, '杨华花', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (23, 0, 46, 1, 1, '经常梦游', '2017-04-15 04:38:20', 38, '杨华花', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (24, 23, 0, 0, NULL, '需要忌口吗', '2017-04-15 04:40:17', 38, '杨华花', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (25, 0, 46, 1, 0, '测试测试数据\r\n', '2017-04-20 16:29:46', 45, '李智明', 1, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (26, 25, 46, 1, NULL, '试试怎么样', '2017-04-25 09:23:01', 45, '李智明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (27, 0, 53, 1, 0, 'zm:测试。', '2017-04-25 09:24:02', 45, '李智明', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (28, 0, 0, 0, 0, '咯哈', '2017-04-25 10:24:51', 45, '李小明', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (29, 0, 52, 1, 0, '请问老师，舌边有齿印，睡眠质量不好用什么配方', '2017-04-25 11:01:13', 67, '李智锐', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (30, 0, 52, 1, 0, '您好老师，请答复', '2017-04-25 11:15:07', 67, '李智锐', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (31, 0, 0, 0, 0, '123', '2017-04-25 14:44:26', 45, '李小明', 0, '（测试）AS森');
INSERT INTO `tb_readme` VALUES (32, 0, 52, 1, 0, '发给好好', '2017-04-25 14:52:29', 45, '李小明', 0, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (33, 0, 52, 1, 0, '发给好好', '2017-04-25 14:52:40', 45, '李小明', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (34, 25, 46, 1, NULL, '买买买', '2017-04-25 15:00:13', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (35, 27, 53, 1, NULL, '追问测试。', '2017-04-25 16:02:57', 45, '李小明', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (36, 0, 55, 1, 0, '邢老师你好！', '2017-04-26 13:02:16', 71, '王娟', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (37, 36, 55, 1, NULL, '我在试这个高枓技', '2017-04-26 13:05:06', 71, '王娟', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (38, 36, 55, 1, NULL, '我在试这个高枓技', '2017-04-26 13:05:31', 71, '王娟', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (39, 0, 52, 1, 0, '我们都会有些不是我 便是你，我的人都有一个人的时候我就不想再去看了一个人的时候我就', '2017-04-27 09:06:24', 69, '肖毅', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (40, 39, 52, 1, NULL, '第二问', '2017-04-27 09:06:46', 69, '肖毅', 0, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (41, 39, 52, 1, NULL, '第三问', '2017-04-27 09:07:04', 69, '肖毅', 0, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (42, 0, 55, 1, 0, '邢老师您好！听了您的课感觉真是太棒了，那种好真的无法用言语来形容\r\n听了您给杏树治病的故事，我想请问一下那个方可不可以用来治疗梨树？我们这儿的梨树这两年不知道怎么回事？基本上所有的梨树都生病，症状是叶子全部卷起来，卷起来的叶子里面长了许多小虫，看起来非常可怕，而那些卷起来的叶子看起来就像虫子，邢老师，请您看看是用您举例的那个方还是', '2017-04-28 15:53:24', 79, '邱静', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (43, 0, 64, 1, 1, '彭老师好，我小孩6岁总感到鼻塞有痰咳不出，过去有点过敏性哮喘现在不严重。请老师给数谢谢您！', '2017-05-01 09:03:25', 78, '胡晓凤', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (44, 25, 46, 1, NULL, '佳佳晋级赛', '2017-05-02 12:45:14', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (45, 0, 0, 0, 0, '暖男找你吧', '2017-05-02 12:45:51', 45, '李小明', 0, '（测试）白小飞');
INSERT INTO `tb_readme` VALUES (46, 0, 54, 1, 0, '耿老师您好!我家有只小母鸡这几天不吃不喝，好像耐报的样子，就是想孵小鸡的那种情况，耿老师有没有办法不要小鸡这样', '2017-05-03 11:00:25', 79, '邱静', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (47, 0, 64, 1, 0, '彭老师您好!请问我如何让老公按照我的要求来做事情，让他不要阻拦我。', '2017-05-03 11:06:48', 79, '邱静', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (49, 0, 46, 1, 0, '  啊哈哟', '2017-05-03 14:15:16', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (50, 0, 64, 1, 0, '爱莲老师下午好！我一同事全身串痛，我想是肝气瘀滞了，请老师给配个方子，让他默念治疗。', '2017-05-03 15:48:56', 71, '王娟', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (52, 50, 64, 1, NULL, '谢谢爱莲老师', '2017-05-03 17:17:56', 71, '王娟', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (53, 0, 64, 1, 1, '彭老师：我姑姑一直在默念260.640.4300.3820每天都用播放器助念，血压稳定，但每天还吃一粒降压药，没敢停药。\r\n右手好象没那么肿了。总是说舌头涩，舌头痛，便秘，没食欲。', '2017-05-03 18:17:46', 141, '陈生', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (54, 0, 56, 1, 0, '患类风关、间质性肺炎肺纤维化、头胀痛失眠、右脑梗、右肢体沉重、坐骨神經痛、右手指变形伸屈不利、右肾結石等症二三十年。', '2017-05-03 20:11:22', 162, '金靄', 0, '刘江');
INSERT INTO `tb_readme` VALUES (55, 0, 56, 1, 0, '患类风关、间质性肺炎肺纤维化、头胀痛失眠、右脑梗、右肢体沉重、坐骨神經痛、右手指变形伸屈不利、右肾結石等症二三十年。', '2017-05-03 20:12:07', 162, '金靄', 0, '刘江');
INSERT INTO `tb_readme` VALUES (56, 0, 55, 1, 0, '邢老师，我最近睡眠不太好，血压有点不稳定，经常偏高。154/100，有胆囊息肉。麻烦老师诊断一下，我的出生日期是阴历', '2017-05-03 20:32:22', 160, '边艳辉', 1, '邢若琪');
INSERT INTO `tb_readme` VALUES (57, 56, 55, 1, NULL, '还有两个耳朵里面痒，老想用手去抠，晚上明显些', '2017-05-04 08:20:11', 160, '边艳辉', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (58, 47, 64, 1, NULL, '我老公1976年冬月初四亥时\r\n我1974年3月初七巳时', '2017-05-04 12:37:26', 79, '邱静', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (59, 47, 64, 1, NULL, '我们结婚十多年一直都不和谐，长期以来不是战争就是冷战，很简单的一件事情，和他商量都不会得到和平的解决……，现在我都不知道我这婚姻该不该维持？他的出生年月是我从谱书上翻的？彭老师请帮我指点指点，感恩您!', '2017-05-04 12:54:03', 79, '邱静', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (60, 0, 53, 1, 0, '    ', '2017-05-04 13:12:23', 45, '李小明', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (61, 0, 53, 1, 0, '? ', '2017-05-04 13:16:21', 45, '李小明', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (62, 0, 52, 1, 0, '测试提交问题。', '2017-05-04 14:42:36', 164, '测试李', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (63, 0, 0, 0, 0, '???????????', '2017-05-04 15:20:36', 45, '李小明', 0, '（测试）白小飞');
INSERT INTO `tb_readme` VALUES (64, 0, 53, 1, 0, '(๑´╹‸╹`๑)ರ_ರ ...心塞', '2017-05-04 15:21:14', 45, '李小明', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (65, 0, 53, 1, 0, '您好！我爸念了您赠予的7770.1110.26000.64500.3800这配方后睡眠不错（偶尔睡不着吃点养心安神就行了），脚还有点臭，后背和手臂有时还痒但比以前好多了，他右边股骨头摔坏了已经置换了，右膝关节是老年性骨性关节炎（不吃劲），腰椎间盘脱出（现在站半个小时就疼），现在他右大腿内侧起了一小块带状泡疹（上午去的医院，他没觉得疼和痒）。他就晚上睡觉前念2－3个小时（岁数大了不听话），麻烦您再给看看吧，谢谢您了！', '2017-05-04 15:28:23', 90, '赵雅云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (66, 0, 64, 1, 0, '彭老师，您好！我想为我的母亲求方，我母亲，农历1944年5月22日亥时出生，已经很长时间了，总是不由自主的摇头，她自己却不知道，心脏也不好，总是晚上睡觉时心脏不舒服，她说每到初一十五的时候心脏就不舒服，心慌。我母亲从小就有眉毛倒睫的毛病，眼睛受摩擦平时眼屎过多，曾经在1989年因左眼视网膜脱落做过手术。还有尿频的毛病。恳请彭老师综合以上症状为我母亲赐方！?  ', '2017-05-04 16:16:09', 132, '韩蕴辉', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (67, 0, 56, 1, 1, '刘江老师您好，我是象数疗法会员之家的王平（哈尔滨）。我母亲朱桂香1949年阴历6月25日的生日，最近三四天没大便了，也没有便意，平时也经常大便干燥，她有高血压，冠心病，有时心慌，心跳时快时慢，有时突突，偶尔会疼，经常感觉郁闷，右侧眼睛和右脸部及嘴角抽动，右侧颈部抽动，双眼经常流泪，眼睛感觉热痒，双小腿静脉曲张，，右腿稍重，小便去年化验时有白细胞，右耳经常淌水，颜色发白象鸡蛋清，晚间失眠，人瘦，面色白。您看需要念什么象数？谢谢', '2017-05-04 18:14:11', 125, '王平', 1, '刘江');
INSERT INTO `tb_readme` VALUES (68, 0, 53, 1, 0, '我爸肺癌12年了', '2017-05-04 18:30:31', 90, '赵雅云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (69, 0, 53, 1, 0, '老师我说错了，我爸肺癌手术后已经12年了，从没到医院复查过', '2017-05-04 18:44:14', 90, '赵雅云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (70, 0, 53, 1, 1, '李老师早上好！我家金毛狗这几天不吃食，只喝水，从昨天开始喝完水没多长时间就尿了，小便有淡黄色浓样东西，眼睛有红血丝，请您给配个方，救救它。', '2017-05-05 06:31:56', 76, '杨丽', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (71, 0, 0, 0, 0, '耿老师，早上好！今天我为宁夏一朋友的弟弟向您求助。他六十多岁了，恙高血压三十几年，高血糖十八年了，又有心梗，两年前做了两个支架。最近浑身出冷汗、恶心而急诊住院，最后诊断为糖尿并发症。今天大清早我朋友就发来微信求方，可见其心情急切。耿老师，您给个数吧，多谢了！', '2017-05-05 06:36:14', 75, '包中琳', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (72, 71, 0, 0, NULL, '患高血压，纠错。', '2017-05-05 06:38:05', 75, '包中琳', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (73, 0, 53, 1, 1, '尊敬的李老师，您好！我想为我的母亲求方，我母亲，农历1944年5月22日亥时出生，已经很长时间了，总是不由自主的摇头，她自己却不知道，心脏也不好，总是晚上睡觉时心脏不舒服，她说每到初一十五的时候心脏就不舒服，心慌。我母亲从小就有双眼倒睫的毛病，眼睛受摩擦平时眼屎过多，还曾经在1989年因左眼视网膜脱落做过手术。她还有尿频的毛病。恳请李老师在百忙之中综合以上症状为我母亲赐方！', '2017-05-05 09:01:25', 132, '韩蕴辉', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (74, 69, 53, 1, NULL, '春彬老师早上赠予的配方是07770.01110.02200.664400.03300，我爸试念了后说他两个耳朵（忘了说了他耳朵很聋）不舒服。让老师再给他看看。', '2017-05-05 15:16:36', 90, '赵雅云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (75, 73, 53, 1, NULL, '尊敬的李老师，您好！我上面的求方你不必回复了，因为两天前我已经向一位老师求过了，但是因老师工作忙一直未回复，我以为是咱们系统的原因是不是老师看不到？我有些着急了，所以又向您求了同一方，刚刚那位老师已经给我回复了，因此您就不用再配方了，不好意思！麻烦您了！? ?  ', '2017-05-05 19:55:09', 132, '韩蕴辉', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (76, 47, 64, 1, NULL, '谢谢彭老师!感恩您百忙之中配方!我们产生矛盾的原因：一是生活习惯不同，我喜欢早睡早起早锻炼，他则喜欢晚睡晚起不锻炼;二是他反对我学习象数疗法，要砸我的读数器，要丢我的书，认为我是歪门邪道，是法轮功。而我则认为结缘象数疗法是我前世修来的福气，我愿作永远的实践者和追随者，所以我不会妥协，这也是矛盾的焦点;当然还有其他方面的原因，我好希望他能爱学习一点，变得勤劳一点，而不是每天只知道斗地主抽烟喝酒。因为我们的一言一行都在影响着孩子。彭老师，您说他能改变吗？', '2017-05-05 22:41:29', 79, '邱静', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (77, 0, 0, 0, 1, '我有个侄子，24岁，他说今年发现右膝旁边好象有点硬块，不痛，站着时候不明显，坐着膝弯着时，硬块很明显，象不明肿块一样，在医院检查，说可能是积液、脂肪沉积，也可能是尿酸高引起，反正医生没确定。\r\n我试着找些配方来套，没有效果。\r\n能给个配方调理下吗？谢谢！', '2017-05-06 10:26:31', 141, '陈生', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (79, 0, 53, 1, 0, '春斌老师，想为亲戚求一方：1984/7/22生日，女，张伊晨。最近被诊断为胆汁淤积性肝硬化，最近失眠厉害，记性不好，情绪低落。请老师帮忙，谢谢！', '2017-05-06 13:59:52', 69, '肖毅', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (80, 0, 64, 1, 1, '彭老师，我姐姐腰间盘突出压迫神经，并且腰锥内有囊肿，现在导致腰疼腿疼，请老师给个方子，谢谢', '2017-05-06 17:01:41', 78, '胡晓凤', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (81, 67, 56, 1, NULL, '刘老师您好，我母亲从5月5日早晨开始默念8200 7200 1660 4400，今天早晨只排了很少量的球状便，下午4点多时身上发冷突突，心慌心跳，手凉，后来停念，总感觉不到饿，不想吃饭，她吃的药是硝苯地平，血塞通，您看是否持念，谢谢', '2017-05-06 20:13:29', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (82, 0, 53, 1, 1, '李老师好！我家多多还是只喝水，不爱吃饭。听其他养狗人讲，小区打药了，我想是不是多多中毒了，它也不会说，只能分析，能给我个解毒消炎方吗？谢谢！\r\n', '2017-05-07 07:48:55', 76, '杨丽', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (83, 0, 64, 1, 1, '彭老师好！我家金毛狗近几天几喝水不吃东西，后来发现它尿道口有淡黄色的浓，请您给个配方。谢谢！', '2017-05-07 10:07:46', 76, '杨丽', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (84, 0, 0, 0, 0, '老师好，我有混合痔，目前便血痛，而且越长越大越多，请老师给个方子，谢谢', '2017-05-07 10:57:42', 78, '胡晓凤', 0, '孙振洲');
INSERT INTO `tb_readme` VALUES (85, 55, 56, 1, NULL, '刘老師：我沒找到您的回复呀', '2017-05-07 14:12:34', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (86, 66, 64, 1, NULL, '彭老师，您好！请问贴穴的话写几行呢？学生愚钝，请老师赐教！', '2017-05-08 06:38:23', 132, '韩蕴辉', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (87, 0, 64, 1, 0, '老师你好！我哥67岁每天大便6-7次，排便细，四肢和腰下皮炎，痒，嗓子有痰，血稠这些病都是多年了，跟老师求方。多谢！', '2017-05-08 08:23:45', 99, '张桂秋', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (88, 0, 56, 1, 0, '刘老师好！目前主要是1.右肩胳膊疼活动受限。2.这几天是否受火月影响眼睛特痒不舒服。3.动脉硬化脑萎缩（这个有点担心必须控制住）谢谢！', '2017-05-08 09:26:47', 129, '王翠琴', 0, '刘江');
INSERT INTO `tb_readme` VALUES (89, 67, 56, 1, NULL, '刘老师您好，我母亲从昨早晨念820 820\r\n 02000 160 4440，今早已正常排便，但一直感觉心慌，您看需要调整吗？谢谢', '2017-05-08 15:35:54', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (90, 88, 56, 1, NULL, '刘老师在哪能看到您回复啊？第一次用不熟悉啊', '2017-05-08 15:43:07', 129, '王翠琴', 0, '刘江');
INSERT INTO `tb_readme` VALUES (91, 0, 64, 1, 0, '彭老师好！求痛风方。谢谢！\r\n', '2017-05-08 16:07:54', 76, '杨丽', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (92, 0, 64, 1, 0, '彭老师好！求痛风方。谢谢！\r\n', '2017-05-08 16:07:56', 76, '杨丽', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (93, 63, 0, 0, NULL, '? ', '2017-05-09 13:07:35', 45, '李小明', 0, '（测试）白小飞');
INSERT INTO `tb_readme` VALUES (94, 0, 64, 1, 0, '老师，我儿子6岁，天热玩水着凉了，另外前几天不怎么吃饭前天吃很多，昨天晚上发烧38.5度，现在38度，请老师帮忙给个方，事情有点急打扰老师休息了，谢谢', '2017-05-10 05:56:36', 78, '韩胡睿轩', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (95, 0, 53, 1, 0, '李老师好：女儿84年10月19日生，16岁来美国，读高中、大学、工作都很顺利。下星期一（15日)要去一家新公司面试，前面二次电话面试都很顺利过关，这一次是去总公司面试过关，当天要面对6－7名考官，历时6个小时。请老师赐象数，护佑女儿顺利过关。感恩您！！！', '2017-05-10 10:43:12', 165, '李松江', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (96, 67, 56, 1, NULL, '刘老师您好，我母亲从5月9日9点多继续默念820 820 02000 160 4440，昨天排大便两次，今天没大便，从早晨感觉饿但没食欲，还没劲，您看需要调整吗？谢谢', '2017-05-10 12:29:19', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (97, 0, 0, 0, 0, '呃呃呃呃', '2017-05-10 20:40:23', 45, '李小明', 0, '李明');
INSERT INTO `tb_readme` VALUES (98, 0, 46, 1, 0, '不舒服', '2017-05-10 20:43:01', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (99, 98, 46, 1, NULL, '经常失眠', '2017-05-10 20:44:37', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (100, 0, 46, 1, 0, '嗯嗯呢呢', '2017-05-10 21:00:17', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (101, 0, 64, 1, 1, '彭老师孩子不烧了开始拉肚子，水一样，是否用换方，030.877.0200.650', '2017-05-11 06:35:30', 78, '韩胡睿轩', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (102, 67, 56, 1, NULL, '刘老师您好，报歉回复晚了，我母亲今早晨正常排大便了，身上也有劲了，现在没有心慌的感觉，您看是否持念80 720 1640，谢谢', '2017-05-11 08:16:14', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (103, 0, 46, 1, 0, '123456', '2017-05-11 15:40:26', 45, '李小明', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (104, 0, 53, 1, 0, '春彬老师，谢谢你对我上条咨询的回复。现在想为我自己的情况咨询一下。\r\n\r\n我从2011年发现甲亢，西医治疗1年半，2015年复发又治疗一年半。最近发现可能又反复，还没检血（美国约医生有时很慢）最后确认，但症状相似：心慌，心跳，心悸，月经延后，头晕。两年前通过李智锐要了一个山玉老师的方：400.003.640 ，但因为手机数据丢失，不知道准确与否，如果是现在还能用吗？我现居住美国西雅图，谢谢', '2017-05-11 23:01:30', 69, '肖毅', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (105, 56, 55, 1, NULL, '昨天晚上临睡觉前没念数，今天早上量血压170/102，过了段时间才降到150/100。感觉这段时间血压波动较大', '2017-05-12 10:17:02', 160, '边艳辉', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (106, 67, 56, 1, NULL, '刘老师您好，我母亲从5月11日开始念80 720 1640，今天没排大便，早晨刚起来时嗓子干稍微有点疼，嘴里有点发粘，后来没这种感觉了。下午感觉身体突突，浑身没劲，您看需要调整吗？谢谢', '2017-05-12 16:05:12', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (107, 67, 56, 1, NULL, '刘老师您好，我母亲从5月12日晚开始默念800  7200  1600  4440，13日排便有些干，14日和15日排便量少，干成球状。您看是否持念此象数？谢谢', '2017-05-15 18:03:54', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (108, 0, 56, 1, 0, '我左腿漆盖下面，外面回弯的那个骨头疼，右脚的四脚趾头底下面，走路感觉疼，象有石头子搁着一样，不舒服，还有脸皮过敏，起小红疙瘩，痒，脖子，耳朵后都过敏，但身体不过敏，请老师指教，', '2017-05-15 18:24:24', 169, '刘素琴', 0, '刘江');
INSERT INTO `tb_readme` VALUES (109, 0, 54, 1, 0, '耿老师好，我左漆盖外下关节疼脸过敏右脚趾四脚趾底下，走路搁得疼，请老师指教，谢谢', '2017-05-15 20:05:16', 169, '刘素琴', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (110, 0, 64, 1, 0, '彭老师您好！最近一段时间，我右边下面的牙总是疼，还有夜里梦多，这段时间一直在念你赐的方440.03820.1650.72000，请问还需调方吗？', '2017-05-18 13:43:25', 110, '陆宇群', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (111, 110, 64, 1, NULL, '还有眼睛看东西也糊。', '2017-05-18 13:47:54', 110, '陆宇群', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (112, 0, 0, 0, 1, '耿老师您好，我是象数疗法会员之家的王平（哈尔滨），我哥1970年阴历二月二十三早晨2点多出生，周岁47，他颈椎有时疼，右手无名指发木，右脚大拇指也发木并且有硌脚的感觉，但摸着还没有硬物，他血压也高，不敢吃辣的食物，吃了就拉稀，您看他该念什么象数呢？谢谢', '2017-05-19 07:51:26', 125, '王平', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (113, 0, 56, 1, 0, '请刘江老师一对一，給我儿子调理身体。', '2017-05-19 14:47:06', 152, '王秀玉', 0, '刘江');
INSERT INTO `tb_readme` VALUES (114, 0, 64, 1, 0, '彭老师您好，很钦佩您配数神效。我家抽水马桶下水很慢，今天早上微信群里得到个方111110.666660。当时不知道，后来家人说有个透明塑料盖子倒水的时候不小心一起倒进去了，想请您帮帮我，真不想换马桶~~~', '2017-05-19 20:43:29', 114, '姚飞', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (115, 0, 53, 1, 1, '朋友\r\n老母亲84岁，皮诊，今年是在腹部（肚子）上。去年是胳膊和腿上，天越热越历害，求方[抱拳][抱拳][抱拳]', '2017-05-20 15:27:44', 76, '杨丽', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (116, 115, 53, 1, NULL, '不好意思李老师，王娟老师给了我一个方，我看群里没人给方，我就给你发了。', '2017-05-20 15:39:09', 76, '杨丽', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (117, 0, 0, 0, 1, '尊敬的孙老师，您好！我想为我的亲戚求方:女，农历1951年6月10日卯时出生，大概在2000年前就开始患糖尿病，现在空腹血糖都在8--9之间，大便1到2天解一次，血压稍有些偏低，低压总是60多，没到过70，高压没到过110，眼睛有白内障，看不清东西，心脏有点问题，时常胸闷气短，双脚大脚指头尖端麻木，还有多年的腰椎间盘突出毛病，恳请孙老师有时间赐方！不胜感激！谢谢您！', '2017-05-21 15:23:28', 132, '韩蕴辉', 0, '孙振洲');
INSERT INTO `tb_readme` VALUES (118, 0, 64, 1, 1, '老师，我嫂子下楼梯不下心踩空，脚扭伤，目前已经两天了脚痛并且脚面全肿了，请老师给个方子，谢谢', '2017-05-21 15:27:06', 78, '韩胡睿轩', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (119, 53, 64, 1, NULL, '姑姑晚上的血压，一般还是170/85晚上一般都吃一粒降压药，没敢停药。', '2017-05-21 21:22:20', 141, '陈生', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (120, 0, 48, 1, 0, '几点到几点快点快点酷酷哒可大可大看哒', '2017-05-22 09:55:58', 164, '测试李', 1, '李明');
INSERT INTO `tb_readme` VALUES (121, 0, 0, 0, 0, '健康咨询测试。问1', '2017-05-22 10:01:20', 164, '测试李', 0, '李明');
INSERT INTO `tb_readme` VALUES (122, 0, 52, 1, 0, '健康咨询-咨询1', '2017-05-22 10:03:34', 67, '李智锐', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (123, 122, 52, 1, NULL, '追加提问，追加1', '2017-05-22 10:07:31', 67, '李智锐', 0, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (124, 0, 52, 1, 0, '效果反馈没打  星会出乱码吗。', '2017-05-22 10:15:18', 67, '李智锐', 1, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (125, 110, 64, 1, NULL, '彭老师，牙疼方和眼糊方我可以同时念吗？或是上午念一方，下午念一方？', '2017-05-22 13:56:17', 110, '陆宇群', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (126, 0, 52, 1, 0, '您好测试一下', '2017-05-22 21:17:44', 100, '文锡英', 0, '（测试）李智锐');
INSERT INTO `tb_readme` VALUES (127, 0, 53, 1, 0, '我老公右胳膊肘外骨尖疼，请耿老师指教，配象数指疼', '2017-05-22 21:43:12', 100, '文锡英', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (128, 0, 53, 1, 0, '您好测试一下', '2017-05-22 21:18:59', 100, '文锡英', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (129, 0, 56, 1, 1, '刘老师:你好！我提交了了两次咨询都未成功。这次试试', '2017-05-22 21:46:02', 100, '文锡英', 0, '刘江');
INSERT INTO `tb_readme` VALUES (130, 0, 64, 1, 0, '麻烦彭老师帮我配方，谢谢！\r\n咽喉肿痛 影响嗓子发声，曾经因为同样经历而失声。同时后脑勺有些许疼痛和不适。因为明天还要讲课，希望咽喉舒服，容易发声，顺利讲课。\r\n谢谢！', '2017-05-22 22:10:44', 174, '郑海英', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (131, 0, 64, 1, 0, '身上发红点二个月了，开始是四肢现在身上也多是了痒的很。不知道什么原因，可能是新房刚装修。\r\n', '2017-05-23 00:10:13', 142, '王怡', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (132, 0, 53, 1, 0, '李春彬老师您好，我妈妈75岁左膝盖疼痛有7年左右用了很偏方只有缓和不能断根，今年膝盖内侧很痛，看医生说是骨刺。请求一方。', '2017-05-23 15:30:09', 177, '陈丽琴', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (133, 0, 0, 0, 1, '耿老师你好。我母亲71岁（住秦皇岛），去年支气管扩张，背痛，我自己配的720.260.050 念了一段时间，后背早已不痛了，睡眠质量也可以。最近就是有点血压高，经常头晕，早晨吃完饭后容易头晕，另外气力不如以前，走稍微多走几圈，人就累。请老师配个方', '2017-05-23 15:55:19', 160, '边艳辉', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (134, 0, 56, 1, 0, '老师我肚子突然特别痛，我自己配方7720.380效果不明显，请老师给个方，谢谢', '2017-05-24 10:59:08', 78, '韩胡睿轩', 1, '刘江');
INSERT INTO `tb_readme` VALUES (135, 0, 56, 1, 0, '刘老师您好，我是内蒙乌兰浩特会员森韬。我得过敏性鼻炎已10余年了，在医院打过针，吃过中西药不少，但只能解决缓解，时间不长就无效了。我的基本情况：\r\n       现年50岁，主要症状是严重时打喷嚏、流鼻涕、鼻空肿胀等。尤其气候突变或闻到个别气味时更为严重。恳请刘老师给我配方。谢谢!', '2017-05-24 20:09:45', 176, '王锁柱', 0, '刘江');
INSERT INTO `tb_readme` VALUES (136, 0, 56, 1, 0, '刘老师您好！我先生53岁。16岁得神经性皮炎。一直无法治愈。他是个老师，上课显得中气不足，咽喉容易发炎，听力下降，以前脾气有点大。一周前我用您上课时分享的配方810.650.4440.20写在纸上放置床上后，脾气好些了。想请您赐象数配方。谢谢！', '2017-05-24 23:07:18', 147, '潘谷兰', 1, '刘江');
INSERT INTO `tb_readme` VALUES (137, 0, 53, 1, 0, '李老师好!向您求助!我最迈身体出问题了,5月23日下午在家做家务,感觉两只手不协调,不同步了,左手拿东西明显劲不足,左上臂连着左肩后背酸胀疼,牵着心脏也不舒服,心慌胸闷,我原来就心脏不好,76年做过先心房缺修补术,一直挺好,大概2006年又房颤了,住院治疗过,也服过很长时间药,只要心率正常,也无不舒服感,都习惯了,后来也不吃药了,难受时再吃药.我这颗破心真遭罪了.这两天感觉左手好象不是我的手了,拿东西还行,平衡力差了,我是不是跟我妈一样,是脑梗、心梗的先兆啊,麻烦李老师帮我诊治,赐予良方.感恩l', '2017-05-26 22:20:11', 179, '田景花  ', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (138, 0, 0, 0, 0, '肚子疼', '2017-05-27 03:53:21', 45, '李小明', 0, '李明');
INSERT INTO `tb_readme` VALUES (139, 0, 53, 1, 0, '老师好，上星期去海边渡假，回来后右腿疼（在盆骨和股骨、下至足后跟)。想老师这些天忙着教学，自己选用刑老师方：77720·3820·66650·4000有所缓解。但是，今晚8点左右我坐在桌前用电脑制作外孙女的课程表时，右侧后背（从肩到臀部及大腿后面）有凉、酸痛的感觉，而且心脏也有凉的感觉。当下似乎整个后背都发凉了，平时后背会痒，还有些木木的。请求老师赐方。感恩老师！\r\n\r\n ', '2017-05-30 10:28:09', 165, '李松江', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (140, 54, 56, 1, NULL, '刘老师：我先生患萎缩性胃炎伴重度肠化三十多年，进食稍有不慎就出现消化不良、纳呆，隠疼等胃部不适感及乏力消瘦等症状。同时伴有左侧腰肌劳损、双膝退行性关节炎行动步履艰难。请刘老师赐方疗其痼疾为感！', '2017-05-30 11:38:49', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (141, 0, 56, 1, 1, '刘老师：我刚发这里的关于我先生的病史，您好像並没收到。再发一次：他患萎缩性胃炎伴重度肠化已卅多年。饮食稍有不慎就有消化不良、胃部飽胀纳呆隠痛等不适感。此外还患有左侧腰肌劳损、双膝退行性关节炎，失眠症等。请老师给予调理为感！照片已发到微信里。', '2017-05-30 12:29:28', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (142, 0, 55, 1, 0, '女儿七岁咳嗽无痰，请老师配个方，谢谢老师\r\n', '2017-05-31 12:15:52', 180, '温育青', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (143, 0, 55, 1, 0, '女儿七岁咳嗽无痰，请老师配个方，谢谢老师\r\n', '2017-05-31 12:15:53', 180, '温育青', 0, '邢若琪');
INSERT INTO `tb_readme` VALUES (144, 0, 56, 1, 0, '女儿七岁咳嗽无痰，请老师配个方，谢谢老师\r\n', '2017-05-31 12:15:54', 180, '温育青', 0, '刘江');
INSERT INTO `tb_readme` VALUES (145, 0, 0, 0, 0, '耿老师，上次您帮我腰骶处疼痛僵硬的配方7772000.16500.438000极大帮助了我，可以自如活动了。现在我坐久了腰骶有不舒服和僵硬，右边更明显些，请问耿老师需要改方不？谢谢您！', '2017-05-31 13:34:55', 174, '郑海英', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (146, 0, 56, 1, 0, '刘老师您好，我母亲朱桂香，68周岁，平时有高血压，冠心病，经常便秘，5月28日上午做了混合痔和肛乳突瘤手术，您给了抗炎促恢复的方00800，00200，30日排了少量便，31日和今天排便多些，不干，夜间出汗较多，白天微微出汗，在医院住院睡不好，现在刀口平时不疼了，换药时还有点疼，您看需要调方吗？谢谢', '2017-06-01 08:55:45', 125, '王平', 1, '刘江');
INSERT INTO `tb_readme` VALUES (147, 141, 56, 1, NULL, '谢谢老师已遵嘱念诵80．720．160', '2017-06-01 09:56:18', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (148, 0, 56, 1, 0, '您好！前几天在群里您给我的猫配了两个方子，方1：  0300.0072.0016.0400（贴右足三条），方2： 6000.70000（贴左耳周）。现在它的左耳（支起部位）血管出血止住了刀口开始愈合了（但原来形成的夹层里面还有血块，大夫说能慢慢吸收），脾气温顺多了，但它不爱喝水（一天一夜才添几下水），大便干些（大概三天一次），耳蟎上着药呢。麻烦您再给看看吧。谢谢您！', '2017-06-01 10:04:12', 90, '赵雅云', 1, '刘江');
INSERT INTO `tb_readme` VALUES (149, 0, 53, 1, 0, '李老师，打扰了。我继续用之前老师的配方072000.1650.4400.3880  有个问题急需解决，我晚上7点到9点，困得不行，要睡觉，是心包经出了问题，老婆不理解，以为我贪睡，这时间有又要辅导小孩学习，有没有可以提神的配方？谢谢老师。', '2017-06-01 10:06:29', 138, '周彰', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (150, 0, 53, 1, 0, '耿老师您好，我是VIP会员内蒙乌兰浩特森韬。我本人膝关节不适已二十多年，尤其天气变化更为明显。不肿不红就是酸痛，恳请老师给我配个方子，谢谢!', '2017-06-01 11:27:12', 176, '王锁柱', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (151, 146, 56, 1, NULL, '刘老师您好，我是象数疗法会员中心的王平，补充一下，我母亲现在白天晚间出汗都较多', '2017-06-01 12:03:30', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (152, 0, 0, 0, 0, '耿老师您好，我是VIP会员内蒙乌兰浩特森韬，今年50岁。我从7一8岁开始两腿膝关节痛，尤其天气变化（阴天、风天等）时更为明显，一到晚间睡觉时酸痛难忍。但不红不肿。恳请老师给我配方，谢谢!', '2017-06-01 12:59:37', 176, '王锁柱', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (153, 141, 56, 1, NULL, '刘老师：我老伴儿自昨晚开始念80．720．160，今日胃不适有所减轻，但大便又不正常啦，呈不消化不成形样，今日已拉了三次，脐周隠隐作痛。可能前两天肠炎还未完全好是否需要改方？', '2017-06-01 13:54:51', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (154, 141, 56, 1, NULL, '刘老师：我老伴儿自昨晚开始念80．720．160，今日胃不适有所减轻，但大便又不正常啦，呈不消化不成形样，今日已拉了三次，脐周隠隐作痛。可能前两天肠炎还未完全好是否需要改方？', '2017-06-01 13:55:32', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (155, 141, 56, 1, NULL, '好的，谢谢老师，即开始念880．770．1650。', '2017-06-01 18:52:22', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (156, 129, 56, 1, NULL, '刘老师你好！我好几次提问都未成功，今天再来试试。我儿子今年38周岁，体型胖，23岁就开始掉头发，27岁头顶头发就掉光了。去年七月就查出右侧甲状腺有一0.03的节，在川医查到的，现在复查大小未变。经常易咸冒，头痛，5月25号高压150，低压100，用推拿降了血压。敬请刘老师赐方谢谢！\r\n            文锡英拜上', '2017-06-02 20:55:52', 100, '文锡英', 0, '刘江');
INSERT INTO `tb_readme` VALUES (157, 129, 56, 1, NULL, '好的，儿子上完课就去成都了，要周一下午才回绵阳，等他回来我就拍个舌象发给你。', '2017-06-03 14:52:03', 100, '文锡英', 0, '刘江');
INSERT INTO `tb_readme` VALUES (158, 129, 56, 1, NULL, '两边耳朵都拍吗？拍全身照？他血压一累了就高，平时不高，在換季时易容高，血压一高头就痛。甲状腺节节的性质不好。', '2017-06-03 15:00:14', 100, '文锡英', 0, '刘江');
INSERT INTO `tb_readme` VALUES (159, 0, 56, 1, 0, '刘江老师您好！\r\n我父亲2014年9月做的直肠癌手术，化疗。2015年底来美国，2016年中诊断肠癌转移肺癌。接着又在美国做化疗。年底肿瘤又有缓慢增大趋势。现在已经不咳血了。希望老师能给方来化瘤或者变小。老师辛苦了！\r\n谢谢！', '2017-06-05 09:41:23', 187, '朱仕文', 0, '刘江');
INSERT INTO `tb_readme` VALUES (160, 0, 56, 1, 0, '尊敬的彭老师，本人请求您赐方了', '2017-06-05 14:58:03', 131, '詹定金', 0, '刘江');
INSERT INTO `tb_readme` VALUES (161, 160, 56, 1, NULL, '彭老师，刚才操作有误！本人昨晨起右腹股沟连带大腿根部拉涉痛，今天下午又发展到大腿胆经及前侧部位行走疼痛，即站坐无痛觉，只有一动就痛不能行走，自己昨天配方7000、165000、4440、38200不效，特请求彭老师百忙中赐方了，谢谢！', '2017-06-05 15:51:15', 131, '詹定金', 0, '刘江');
INSERT INTO `tb_readme` VALUES (162, 160, 56, 1, NULL, '彭老师，刚才操作有误！本人昨晨起右腹股沟连带大腿根部拉涉痛，今天下午又发展到大腿胆经及前侧部位行走疼痛，即站坐无痛觉，只有一动就痛不能行走，自己昨天配方7000、165000、4440、38200不效，特请求彭老师百忙中赐方了，谢谢！', '2017-06-05 15:51:41', 131, '詹定金', 0, '刘江');
INSERT INTO `tb_readme` VALUES (163, 0, 64, 1, 0, '彭老师，本人昨晨起右腹股沟连带大腿根部拉涉痛，今天下午又发展到胆经部位及大腿前侧行走疼痛，站或坐无痛觉只要一挪步就觉痛，特为此请求彭老师赐方，本人昨日自配7000、165000、4440、38200不效，谢谢了！', '2017-06-05 16:03:31', 131, '詹定金', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (164, 129, 56, 1, NULL, '刘老师:你好！我儿子是79年阳历1月十号上午十点半出生的，名杜峰，是不是土太多？他还有脂肪肝。我现在就把他的舌象等发给你。在这里我不知如何才能发照片，我只能发到你个人微信里。谢谢刘老师！我觉得这里没有个人微信聊起方便，以后在你个人微里聊行吗？感恩感恩！\r\n          文锡英拜谢！\r\n', '2017-06-05 16:57:37', 100, '文锡英', 0, '刘江');
INSERT INTO `tb_readme` VALUES (165, 129, 56, 1, NULL, '刘老师:我儿子的身体就拜托你了。我觉得你在成都，儿子每周也到成都，有机会让他亲自去拜会你，拜请你给他一是调理，更主要想求老师帮我调教调教。我原来几次都没有能进到你建的群里，去年十一月终于进到邢老师的群(三)。我感恩所有好师！感恩李山玉老师！', '2017-06-05 17:32:08', 100, '文锡英', 0, '刘江');
INSERT INTO `tb_readme` VALUES (166, 0, 64, 1, 1, '彭老师您好，我母亲62岁，左膝盖肿一按就打嗝，走路噶吧响很疼，小腿也肿了左腿有点变形，检查说有积液。\r\n右脚大脚趾甲沟炎，指甲长到肉里，还有一块指甲已与肉分开呈现白色。\r\n右侧牙龈肿了很长时间了，老困总想睡觉，她本人爱发脾气，一点小事就生气，请您配个方，谢谢', '2017-06-05 20:07:31', 139, '刘海燕', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (167, 146, 56, 1, NULL, '刘老师您好，我17时56分时反馈的方写错了，这几天默念的是300 7720 260，今天排便4，5次，每次一点点，不成型，现在不象前些天那么出汗了，您看需要调方吗吗？', '2017-06-05 20:27:43', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (168, 0, 0, 0, 1, '耿老师您好.看了您好多神奇的配方，实佩服。我朋友家在林卅办了个发电厂，时己两年，现试发电及第一期工程己完成，但和供电局并网工作确进展缓慢，己拖了一个月。昨天谈起神奇的八卦象数案例，故恳请您施一个象数方，促使并网工程早日完成，万分感谢。', '2017-06-09 15:40:42', 181, '吴晓', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (169, 0, 56, 1, 1, '刘江老师你好！我先生今年83周岁，患有:①高血压吃药控制在120/80，②尿酸高，最高590，每年要犯痛风一至二次，③前列腺增生伴有结节，④间隙肺炎，⑤肝有小囊肿。②至④现在中医治疗吃中药。今天为他求诊是:咽痒有痰，痰不多，咳嗽，请老师赐方！', '2017-06-09 17:00:03', 158, '庞淑琴', 1, '刘江');
INSERT INTO `tb_readme` VALUES (170, 169, 56, 1, NULL, '我问女儿，女儿说老师讲的对，是间质肺炎。我先生怕念，能把配方贴在大椎穴上吗？', '2017-06-09 18:40:36', 158, '庞淑琴', 0, '刘江');
INSERT INTO `tb_readme` VALUES (171, 169, 56, 1, NULL, '我先生心脏上有起博器，已4年多时。', '2017-06-09 18:47:32', 158, '庞淑琴', 0, '刘江');
INSERT INTO `tb_readme` VALUES (172, 0, 0, 0, 0, '耿老师好！家父90岁，第一次查为肺癌晚期，因症状不明显，现又做了第二次检查，星期四出结果。现在家父有两个地方不适，第一是左腿下方外侧疼痛，是一跳一跳的痛，影响睡眠；第二是在腰部，酸痛，有时也跳痛（这部位是第一次穿刺后开始痛的)。腿部跳痛以前也有过多次，没采用任何治疗，过几天自己就好了，这次持续的时间比较长。请老师赐方。感恩您！\r\n', '2017-06-12 06:33:12', 165, '李松江', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (173, 0, 48, 1, 1, '李老师好！向您请教：13个月的宝宝每天吃三颗枣子好不好？枣子它健脾、养血不知道幼儿每天都吃是否有什么副作用？（枣子先煮一开，后蒸45~60分钟)请您赐教！感恩您！', '2017-06-12 06:57:22', 165, '李松江', 1, '李明');
INSERT INTO `tb_readme` VALUES (174, 0, 0, 0, 0, '男的女的你上课你说呢上哪上哪上哪是男是女你什么是什么没撒没撒密码', '2017-06-12 19:10:47', 164, '测试李', 0, '李明');
INSERT INTO `tb_readme` VALUES (175, 0, 0, 0, 1, '孙老师您好!一朋友三十多岁，男性，颈椎间盘突出3节，头晕，这几天在做牵引，请孙老师配个方帮帮他吧！感恩您', '2017-06-12 19:20:57', 79, '邱静', 0, '孙振洲');
INSERT INTO `tb_readme` VALUES (176, 146, 56, 1, NULL, '刘老师您好，我母亲朱桂香，68周岁，平时有高血压，冠心病，痔疮手术，6月5日您调方380 720 160 4440，当天发现是上栓剂导致的一天排便4，5次，而里面的便还是干的，所以就没有默念380 720 160 4440，现在肛门处里面的伤口长好了，外面的伤口排便时还有点疼，夜间出汗，您看念什么象数能促进伤口愈合？谢谢', '2017-06-12 20:07:34', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (177, 172, 0, 0, NULL, '老师好！除了默念外，加贴在什么穴位？谢谢您！', '2017-06-13 08:17:59', 165, '李松江', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (178, 146, 56, 1, NULL, '刘老师您好，我母亲从昨天开始念820 1600 4400 030，促进痔疮伤口愈合今天早晨感觉没劲，出汗，血压160/110，您看需要调方吗？谢谢', '2017-06-13 10:23:16', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (179, 0, 53, 1, 0, '春彬老师你好！青岛回来一直念7200.6500.4300.38200，一直蛮好的。今天早上舌苔白厚，口有异味很大，下午咽痛痒，好似感冒，有点寒，但又冒汗，舌尖有点痛。请老师赐方', '2017-06-13 15:31:19', 158, '庞淑琴', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (180, 0, 0, 0, 0, '耿老师您好，您昨天给我的,004.003800.070.260方子，阿姨昨晚默念半个多小时，今天早上念到现在越未越干涩，就象眼毛掉到眼里非常难受。我叫她停止默念。请耿老师再换一方。不胜感恩！感恩！', '2017-06-14 16:07:51', 177, '陈丽琴', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (181, 0, 0, 0, 0, '我妻子原有', '2017-06-15 08:14:55', 120, '陈景希', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (182, 0, 64, 1, 1, '彭老师，我儿媳6月10日下午3时36分生下个男婴，怀了35周，属早产。出生时体重只有2285克(约4斤6两)由于婴儿缺氧面部有瘀青，肺部吸进羊水，当日从产房转到儿科小儿重症监护室己三天，现肺部渐平稳，但又得病理性重度黄疸，现每天照蓝灯从8小时增至10小时，(黄疸指数340)，同时，过两天脑部照MR，排除脑部有无出血情况。婴儿声音宏亮，中气足，哭声大。请老师赐方。现在人在监护室，外人不让进。方子能否对着婴儿照片，开机器念，还可采用那种方式有效?\r\nI', '2017-06-15 14:30:39', 107, '陈养添', 1, '彭爱莲');
INSERT INTO `tb_readme` VALUES (183, 54, 56, 1, NULL, '我老伴前段时间一直念70．40．820，胃肠基本正常。今日又觉胃部隠隠作痛，大便不爽，拉了还想再拉，坐下又拉不出，不过没腹泻。每日晨起口苦口干，舌苔白、干，食慾不佳。他想请老师给一个调胃癌的方试试，可以吗？', '2017-06-15 16:13:02', 162, '金藹', 0, '刘江');
INSERT INTO `tb_readme` VALUES (184, 159, 56, 1, NULL, '请问老师，之前给过一个：先让老人家默念7220  260   4300  820\r\n跟这次给的相比较，应该让我爸爸念哪一个更好。谢谢老师！', '2017-06-16 10:33:45', 187, '朱仕文', 0, '刘江');
INSERT INTO `tb_readme` VALUES (185, 159, 56, 1, NULL, '抱歉老师，第一次用这个软件，不知道需要回来看，还以为会有信息提示。我才看到。下次知道了，会经常点进来看的。谢谢！', '2017-06-16 10:35:51', 187, '朱仕文', 0, '刘江');
INSERT INTO `tb_readme` VALUES (186, 0, 53, 1, 0, '老师：您好！我是类风湿病患者，我想老师能否帮助我运用象数疗法来调理风湿因子高的问题。因为几年来，身体不断出状况，我想，可能主要矛盾还是免疫系统出的问题。老师，您看呢？', '2017-06-24 10:36:40', 135, '孙晓云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (187, 0, 53, 1, 0, '耿老师您好：89年男孩，昨天游泳耳朵进水，造成发炎，当时给他数6000.7000.40，本人没念，由别人代念几个小时已大大减轻，不疼了，比较舒服，只是稍有点肿，但是今天上午出去出差发现又厉害了，耳道肿痛，半边脸都痛，张嘴也痛，发炎了。麻烦老师给出方，我刚才给他调方77720.16000.05000.4440，是否合适，麻烦老师给予指导或调整，谢谢耿老师！', '2017-06-24 10:59:59', 83, '乔英艳', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (188, 0, 0, 0, 0, '耿老师您好：89年男孩，昨天游泳耳朵进水，造成发炎，当时给他数6000.7000.40，本人没念，由别人代念几个小时已大大减轻，不疼了，比较舒服，只是稍有点肿，但是今天上午出去出差发现又厉害了，耳道肿痛，半边脸都痛，张嘴也痛，发炎了。麻烦老师给出方，我刚才给他调方77720.16000.05000.4440，是否合适，麻烦老师给予指导或调整，谢谢耿老师！', '2017-06-24 11:01:45', 83, '乔英艳', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (189, 186, 53, 1, NULL, '谢谢老师的配方，还烦老师能否解释一下方义，以便学生进一步领悟！很想认真持念，积极治疗。\r\n另外，在念数过程中，还有哪些需要学生做到的，也请老师指点。期盼在老师的帮助下，控制病情，创造奇迹。谢谢！', '2017-06-24 14:45:27', 135, '孙晓云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (190, 186, 53, 1, NULL, '老师，谢谢您的释义！还想请教老师，我近段时间默念的配方一直是针对呼吸道问题的。目前症状有好转，但未能痊愈。晨起还是少许黄痰，早饭后还有少许黄绿块状痰。有咽炎，鼻炎。眼睛有模糊感。老师，不知这些症状与类风湿是否有关联？我是续念原方，还是念今天您新配方？盼老师指点！谢谢老师！给您添麻烦了。\r\n', '2017-06-24 19:45:09', 135, '孙晓云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (191, 186, 53, 1, NULL, '老师，谢谢您的释义！还想请教老师，我近段时间默念的配方一直是针对呼吸道问题的。目前症状有好转，但未能痊愈。晨起还是少许黄痰，早饭后还有少许黄绿块状痰。有咽炎，鼻炎。眼睛有模糊感。老师，不知这些症状与类风湿是否有关联？我是续念原方，还是念今天您新配方？盼老师指点！谢谢老师！给您添麻烦了。\r\n', '2017-06-24 19:45:41', 135, '孙晓云', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (192, 0, 64, 1, 0, '彭老师好！我朋友现年65周岁有余，现身高1．62米，体重60kg，血压80一110，今年单位体检除血脂稍高没有大问题，但多年来腰一直不好，最严重时卧床几曰自然休复未做过治疗，一般都坚持行动自然恢复，据观察脊柱向左弯曲且有凹陷处，回忆过往应是68年下乡务农扛重物劳损所致。一直以来只要坐时间稍长，站立时腰便不能直立，过一会才能恢复正常，请您赐方。谢谢！\r\n', '2017-06-24 20:52:33', 76, '杨丽', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (193, 0, 0, 0, 0, '老师好,我妈早上七点多把头后侧摔了,肿了很大,右手有只痛，求老师配个方，谢谢老师。\r\n', '2017-06-25 16:44:23', 180, '温育青', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (194, 0, 0, 0, 0, '老师好,我妈早上七点多把头后侧摔了,肿了很大,右手有只痛，求老师配个方，谢谢老师。\r\n', '2017-06-25 16:44:24', 180, '温育青', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (195, 0, 53, 1, 0, '\r\n\r\n我自2011年9月体检照B超发现一个7x5毫米的胰腺占位(黄豆大小)，经每年发现该胰线占位至今整整6年仍是黄豆大小没有什么变化。\r\n      本人有高血压，高血脂，动脉硬化，气管炎，慢咽炎，鼻炎，心动过慢，慢性肠胃炎，双眼轻度白内障，肿瘤指标值较高等。\r\n        近期咳痰多，咳的咽喉不适，白色痰居多， 鼻不适，特别是吃饭时特别多鼻涕，夏天天气热，阴部比较潮湿，阴部根痒。后背痛，，一天大便二至三次。便不成型居。右脚小腿肚有一小块静脉突出多年。早上起来口苦，口干。\r\n        \r\n  ', '2017-06-25 23:45:59', 107, '陈养添', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (196, 0, 53, 1, 0, '春彬老师你好！6月17日配方:72000.6440.450.3820。现肝区无坠胀感，郁闷情况了，不流清涕，但感冒引起鼻炎犯 了，右鼻子时通时不通，左耳发闷、好似气在耳里鼓动，耳底不时不时有抽触的痛，说话的声音也发闷，咽喉部也不怎么舒服。恳请老师调方。', '2017-06-26 17:29:54', 158, '庞淑琴', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (197, 0, 56, 1, 0, '刘老师，我小孩昨天开始发烧，今天一直39度多，而且中午因家附近失火有点惊吓，始终不退烧，特向老师求数，谢谢', '2017-06-26 18:21:56', 78, '韩胡睿轩', 0, '刘江');
INSERT INTO `tb_readme` VALUES (198, 0, 0, 0, 1, '彭老师：您好！我女儿今年13岁，她的阳历生日是2005年2月5日。她想考入我们这好的初中，并且考到该初中的重点班。请您给她配方，助她一臂之力。谢谢您！', '2017-06-28 15:47:03', 189, '白素镭', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (199, 0, 0, 0, 1, '耿老师，是否在你的微信中不能进行咨询了，必须在会员中心才能咨询有关事宜！早上8点多在与您的微信中为我才出生的小孙子向你求赐方，但一直没有您的回复，以后都必须在这里求方吗？谢谢了哦！', '2017-06-28 15:56:55', 80, '靳玲玲', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (200, 0, 0, 0, 0, '耿老师您好，我是王平，1972年阴历九月初六未时生，虚岁46，经常心慌眼花腰酸痛，从去年11月中旬开始，月经2，3个月来一次，您4月25日配方4300 03800 200 66400，这两月月经提前，周期23天，您看我是否需要调方？谢谢。', '2017-06-28 18:25:04', 125, '王平', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (201, 0, 0, 0, 0, '耿老师你好.我为我嫂子求方.该人女1955年6月24日生农历.该人2014年做核磁诊断为脑右额页亏血兆.遇事旋晕.双腿长年木涨.右腿浮肿.心脏时而心悸心慌.入睡难易醒.右太阳穴间断的疼痛.求老师赐方.谢谢老师\r\n', '2017-06-29 07:23:44', 149, '孙秀英', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (202, 0, 0, 0, 0, '耿老师你好.我为我嫂子求方.该人女1955年6月24日生农历.该人2014年做核磁诊断为脑右额页亏血兆.遇事旋晕.双腿长年木涨.右腿浮肿.心脏时而心悸心慌.入睡难易醒.右太阳穴间断的疼痛.求老师赐方.谢谢老师\r\n', '2017-06-29 07:23:44', 149, '孙秀英', 0, '耿文涛');
INSERT INTO `tb_readme` VALUES (203, 0, 53, 1, 0, '老师你好！我这兩天从腰椎，胸椎特难受，直立行走好似往下沉的感觉，我是骨质疏松高危人，有点担心。求老师赐方。', '2017-06-29 19:57:24', 158, '庞淑琴', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (204, 146, 56, 1, NULL, '刘老师您好，我母亲有高血压，心脏病，因痔疮和肛乳头瘤手术，六月13日开始念您的配方260 0430 80 0720，现在伤口已基本恢复，只是身上没有力气，每天排便两三次，成条，心情郁闷憋屈，您看需要调整吗', '2017-06-30 09:59:17', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (205, 0, 53, 1, 0, '春彬老师好，亲戚家28岁男孩右手食指老起小水泡，小水泡感觉是从肉里面从里往外满满长出来的，长出来之后就开始破，破了之后就干裂出血，然后再褪一层皮厚就好了。好了之后又会反复，周期差不多一个月，就一直这样反复，老不好。刚刚我给他出方72200.050.80.2000，不知准确否，望春彬老师给予指导，谢谢老师', '2017-07-01 21:34:37', 83, '乔英艳', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (206, 0, 53, 1, 0, '春彬老师好，亲戚家28岁男孩右手食指老起小水泡，小水泡感觉是从肉里面从里往外满满长出来的，长出来之后就开始破，破了之后就干裂出血，然后再褪一层皮厚就好了。好了之后又会反复，周期差不多一个月，就一直这样反复，老不好。刚刚我给他出方72200.050.80.2000，不知准确否，望春彬老师给予指导，谢谢老师', '2017-07-01 21:36:09', 83, '乔英艳', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (207, 0, 53, 1, 0, '春彬老师好，亲戚家28岁男孩右手食指老起小水泡，小水泡感觉是从肉里面从里往外满满长出来的，长出来之后就开始破，破了之后就干裂出血，然后再褪一层皮厚就好了。好了之后又会反复，周期差不多一个月，就一直这样反复，老不好。刚刚我给他出方72200.050.80.2000，不知准确否，望春彬老师给予指导，谢谢老师', '2017-07-01 21:36:35', 83, '乔英艳', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (208, 104, 53, 1, NULL, '我现在回到北京，天气比西雅图热多了，我自己改动了一下象数方成8220.6500.004300.720，有时也念念004.030.6400，没有不良反应，但心率好像还是比在西雅图时快些，西药量还是维持。希望春斌老师给予指导。', '2017-07-02 10:25:21', 69, '肖毅', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (209, 146, 56, 1, NULL, '刘老师您好，我母亲高血压，心脏病，右侧面肌痉挛，双小腿静脉曲张，从6月30日开始默念650 400 430 820 ，原来的无力感消失，但心情还是郁闷，大便有点干燥，您看需调整吗？谢谢', '2017-07-02 10:51:13', 125, '王平', 0, '刘江');
INSERT INTO `tb_readme` VALUES (210, 0, 0, 0, 0, '对对对点点滴滴都是扣扣空间健健康康快快快咔咔咔咔咔咔', '2017-07-02 12:15:05', 164, '测试李', 0, '李明');
INSERT INTO `tb_readme` VALUES (212, 0, 53, 1, 0, '春斌老师，我去年六月带母亲去三亚，结果她在那里脑梗，伤了记忆和情绪区域。之后您给予象数：0720.66500.4400.03880。由于她自己不能念，我也没发现象数机这个方便方法，所以只能把数写了贴她床头或其他常待的地方，在念数质量上没有做好。圣诞节回北京探亲，买了象数机，但她不接受。一年多以后可以看到她记忆恢复还是有很大进步，但情绪一直改善不大，中药用过，半年前也开始用西药抗抑郁，现在还是容易烦躁，焦虑，提不起精神干任何事，就想躺着，对人生心恢意冷。请老师再帮忙调配一下象数。母亲姓名：王蕙芳，1941/4/27。衷心感谢！！', '2017-07-02 14:02:47', 69, '肖毅', 1, '李春彬');
INSERT INTO `tb_readme` VALUES (213, 212, 53, 1, NULL, '补充下：生日是农历', '2017-07-02 14:07:57', 69, '肖毅', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (214, 0, 0, 0, 0, '彭老师你好！2010年曾经为了我妈中风的事第一次请你配方。效果非常好，之后去青岛参加李老师l的初级班，终于见到您。之后我们全家从北京搬回美国西雅图。这么多年来，自己对象数还是很着迷，自己的小毛病自己配数还不错，但帮助别人就不那么有效。今天是为我父亲的健康向您请教：我父亲农历1936年9月23日生，腿关节从40几岁觉得不能行走太多，否则痛开始，到现在行走变得相当困难，拄拐仗也不是太稳，灵活，腿部力量越来越弱。耳也聋，大脑思维、反应都很慢。但是其它没有什么器质性疾病。我是希望象数能帮他强健双腿，不要落到卧床的结局。因为我现在回国探亲，如果彭老师能简单教我一下怎么按象数方点穴，就更感激不尽，因为我担心他念数质量会不太好，象数机念数他不习惯等，所以如果我能帮点穴可以保证治疗的质量。', '2017-07-03 19:37:32', 69, '肖毅', 0, '彭爱莲');
INSERT INTO `tb_readme` VALUES (215, 0, 53, 1, 0, '春斌老师又要麻烦你为我父亲的健康向您请教：我父亲肖季厚，农历1936年9月23日生，腿关节从40几岁就不能行走太多，否则就痛，到现在行走变得相当困难，拄拐仗也不是太稳，身体向右倾斜，身体僵不灵活，腿部力量越来越弱。耳也聋，大脑思维、反应都很迟钝。但是其它没有什么器质性疾病。我是希望象数能帮他强健双腿，不要落到卧床的局面。这几天还打咯不停，有时睡觉时都打，我给他做穴位按摩也无效。八卦象数点穴我知道一点，比如200怎么按，但380就不清楚是先补坤再泻离，还是顺序反过来，也请指点！万分感谢！', '2017-07-06 15:58:01', 69, '肖毅', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (216, 195, 53, 1, NULL, '李老师，您好！念数近10天每天念3至4小时，读数机助念两整天。现仍感到咳嗽咳痰频密，痰颜色时白时淡黄，咳时咽部不适，有时痛。另外右边臉旁的腮骨(牙较骨)张大口痛、右边颈部，右边咽喉，右边牙周，大牙也痛，有时影响右边太阳穴也痛，上下咬紧牙，及张太嘴巴都觉得较骨痛，上个星期右耳屎堵了，去医院洗耳，说有些发炎作开了一个星期头孢消炎药，春彬老师是否要调方。', '2017-07-07 12:36:37', 107, '陈养添', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (217, 0, 56, 1, 0, '老师：您好！向您求助：这两天感冒发烧，鼻咽疼痛，夜不能寐，眼发胀，晨起黄痰后白痰多。关节酸痛。烦请老师赐方。谢谢！孙晓云', '2017-07-09 06:48:03', 135, '孙晓云', 0, '刘江');
INSERT INTO `tb_readme` VALUES (218, 217, 0, 0, NULL, '好的。谢谢老师！', '2017-07-09 11:04:39', 135, '孙晓云', 0, '刘江');
INSERT INTO `tb_readme` VALUES (219, 0, 0, 0, 0, '老师：您好！一直念您的配方，目前的状况是：1.后脑两边有胀痛感，特别左边。2.稍动就出一身汗，但烧未退。3.左胸肋昨夜有疼痛感，下午也时有不适。4..粘痰不多。老师，续念吗？', '2017-07-09 17:35:19', 135, '孙晓云', 0, '刘江');
INSERT INTO `tb_readme` VALUES (220, 203, 53, 1, NULL, '春彬老师你好！我是一个外寒内热的体质，易感冒，夏天不吹电扇和空调，不怕热，怕风，一吹风就感恩，吃食物喜热，但肝、心、胃会上火', '2017-07-09 20:56:35', 158, '庞淑琴', 0, '李春彬');
INSERT INTO `tb_readme` VALUES (221, 0, 46, 1, 0, '老师们好！我侄儿今年36岁，通风多年了。他母亲生前也有通风。侄儿很注意饮食。可是通风还是经常发作，大脚趾关节肿痛，有时需要卧床。这孩子平时不喜欢运动，坐姿常是半躺着。恳请老师赐方帮帮他。谢谢！', '2017-07-10 10:16:09', 147, '潘谷兰', 0, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (222, 0, 46, 1, 0, '2019.1.16健康自述测试', '2019-01-16 15:15:47', 51, 'ceshi', 1, '（测试）李大明');
INSERT INTO `tb_readme` VALUES (223, 222, 46, 1, NULL, '2019.1.16第一次追加回复', '2019-01-16 15:30:52', 51, 'ceshi', 0, '（测试）李大明');

-- ----------------------------
-- Table structure for tb_settlement
-- ----------------------------
DROP TABLE IF EXISTS `tb_settlement`;
CREATE TABLE `tb_settlement`  (
  `settlement_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `teacher_id` int(255) NULL DEFAULT NULL COMMENT '老师编号',
  `teacher_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '老师名称',
  `settlement_date` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `settlement_money` double(20, 2) NULL DEFAULT NULL COMMENT '结算金额',
  `record_id` int(20) NOT NULL COMMENT '对应的咨询记录ID',
  `settlement_status` int(2) NOT NULL COMMENT '结算状态',
  PRIMARY KEY (`settlement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_shopping_cart`;
CREATE TABLE `tb_shopping_cart`  (
  `cart_id` int(20) NOT NULL COMMENT '购物车ID',
  `cart_goods_id` int(20) NOT NULL COMMENT '商品ID',
  `cart_goods_num` int(20) NOT NULL COMMENT '商品数量',
  `cart_member_id` int(20) NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_sound_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_sound_source`;
CREATE TABLE `tb_sound_source`  (
  `sound_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '音源编号',
  `sound_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '音源名称',
  `sound_sex` int(2) NOT NULL COMMENT '音源性别',
  `sound_state` int(2) NOT NULL COMMENT '音源状态',
  PRIMARY KEY (`sound_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10006 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_sound_source
-- ----------------------------
INSERT INTO `tb_sound_source` VALUES (10004, '男音', 1, 1);
INSERT INTO `tb_sound_source` VALUES (10005, '女音', 0, 1);

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `teacher_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '老师编号',
  `teacher_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `teacher_sex` int(2) NOT NULL COMMENT '导师性别',
  `teacher_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '老师名字',
  `professional` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '老师职业',
  `marital_status` int(2) NULL DEFAULT NULL COMMENT '婚姻状况',
  `image` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `teacher_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '老师邮箱',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '微信唯一码',
  `teacher_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '老师电话',
  `teacher_level` int(4) NOT NULL COMMENT '老师等级',
  `guidance_direction` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '指导方向',
  `teacher_introduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '导师简介',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '现居住地',
  `place_domicile` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '户籍所在地',
  `teacher_passwork` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `top_id` int(20) NOT NULL COMMENT '排序、置顶',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES (1, '', 1, '耿文涛', '', 0, '1553999396015.jpg', '', 'osrX41Z9WairPqZbiwR8QY6TinPM', '12', 5, '', '', '', '', 'b4f4875d76cf0957f626d29e47dcadbdbb88d4d3aac6c95aeb062ffbbcfd10b8c95118dd9fb9c63d', 00, 10015);
INSERT INTO `tb_teacher` VALUES (2, '', 0, '彭爱莲', '', 0, '1553998044816.jpg', '', '11', '15839938898', 5, '', '', '', '', 'daee0c39500f48fde5cc5b4d3f710447ed8c0d7257b34134d57a335552f12595e9677b11363e155d', 00, 10014);
INSERT INTO `tb_teacher` VALUES (3, '', 0, '邢若琪', '', 0, '1553998079316.jpg', '', '', '13738022698', 5, '', '', '', '', 'f539d2e0fe90162c43b20c631ca4cd6cfeb46a2af033f27413cea094da777753d29a5c5c8f4f14dd', 00, 10013);
INSERT INTO `tb_teacher` VALUES (4, '', 1, '辛健利', '', 0, '1553998191475.jpg', '', '', '15954872846', 5, '', '', '', '', 'e6500d5e01143522cc564c39f915dc5e4aeac757286194890b1c8970f66cd1033dd71250926e89e0', 00, 10012);
INSERT INTO `tb_teacher` VALUES (5, '', 1, '池肖毅', '', 0, '1553998325830.jpg', '', '', '18650223820', 5, '', '', '', '', 'e8c2cf5b9ad70e3ab30a92ffa6d74c1aab8689be13e2816bd1ea42d1de3e8f13df45dc88fee0abb7', 00, 10011);
INSERT INTO `tb_teacher` VALUES (6, '', 0, '义工成燕', '', 0, '1553998402681.jpg', '', '', '18036773588', 5, '', '', '', '', 'fa5c703fd10a7409cf54804cd13cd99baea2d1996b0ff56ef9fd846622c88497056b5afce217cdd3', 00, 10010);
INSERT INTO `tb_teacher` VALUES (7, '', 1, '义工刘云', '', 0, '1553998432351.jpg', '', '', '15275336696', 5, '', '', '', '', 'a6168a4c620413292b4e7d7bb9cf53a45a427fa6f842cd606a946fb9053749eb2ef90a948fda698f', 00, 10009);
INSERT INTO `tb_teacher` VALUES (8, '', 0, '王娟', '', 0, '1553998453753.jpg', '', '', '15907383388', 5, '', '', '', '', 'e78a27da466d768cf48cc6d9f7e6d7abf817bb55941623a73fc7bb2dfc024345fc755ae46f48204b', 00, 10008);
INSERT INTO `tb_teacher` VALUES (9, '', 1, '义工焦建军', '', 0, '1553998549976.jpg', '', '', '15652233118', 5, '', '', '', '', 'a94bf6dd44b21f955c9a333afa17d00f119cf83c4d498fd4a8a788190e4167eda00624521dbc0c1e', 00, 10007);
INSERT INTO `tb_teacher` VALUES (10, '', 0, '贺楷闳', '', 0, '1553998574720.jpg', '', '', '13789300112', 5, '', '', '', '', '2cd56c0434c24db9aac13f82b7a38a2b2fffd88aec2ccafb0043c4417694c2c3498e9cbd4dccf478', 00, 10006);
INSERT INTO `tb_teacher` VALUES (11, '', 0, '义工乔英艳', '', 0, '1553998649694.jpg', '', '', '13863636706', 5, '', '', '', '', 'd82a48d4808a84ccbf641cd0852d187afce42fffd35571d2773cc1b432af5603964e0c6ab8a7b59d', 00, 10005);
INSERT INTO `tb_teacher` VALUES (12, '', 0, '义工张译丹', '', 0, '1553998674461.jpg', '', '', '15640862968', 5, '', '', '', '', '6a08adb94bb84810365763b84dcc130357f1ed2d832de3cc1a43edf1aec4fb6f1d681ab7b38d1235', 00, 10004);
INSERT INTO `tb_teacher` VALUES (13, '', 1, '詹定金', '', 0, '1553998696519.jpg', '', '', '13918830276', 5, '', '', '', '', 'a3f96a121b15102eb540285eca0ddd9af63b5ade9d46022f967705324b245b5e3dc265cebe989292', 00, 10003);
INSERT INTO `tb_teacher` VALUES (14, '', 0, '支荧', '', 0, '1553998721060.jpg', '', '', '15510292207', 5, '', '', '', '', '602879dedcbe0cfae20fae94b78da09af3c117105a641fedb990bb3a40cb7d1f488029e13f538900', 00, 10002);
INSERT INTO `tb_teacher` VALUES (15, '', 1, '肖钟前', '', 0, '1553998865018.jpg', '', '', '13859910021', 5, '', '', '', '', 'bf5ac3310b6adb71460de4a75eef3d985ae6c76f5b163f6fcf0d166ff78a8f95f667578101a418da', 00, 10001);
INSERT INTO `tb_teacher` VALUES (16, NULL, 0, '测试', NULL, 0, 'default_img.png', NULL, 'oM4Zwv3_xzU9NJwlZLd5Q0c3ZBzc', '123456', 5, NULL, NULL, NULL, NULL, 'c8b9dbf006af107a674ac6de589e3a4097dcd420cea0b67c13887905c74ee53830a5dd36ee2896b6', 00, 10000);

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type`  (
  `type_id` int(7) NOT NULL COMMENT '商品类型ID',
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品类型名称',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
