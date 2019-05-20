/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : music

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 18/05/2019 12:24:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `grap_type` int(255) NULL DEFAULT NULL,
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author-username`(`author`) USING BTREE,
  CONSTRAINT `author-username` FOREIGN KEY (`author`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES (3, '<p>fdsafdsaf&nbsp;</p>', NULL, '我是标题', 'admin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `note` VALUES (4, '<p>大师傅付付付付付</p>', '2019-03-22 19:38:25', '我是标题', 'admin', '/项目部署1.png', NULL, 0, '2019-03-22 19:38:25', NULL, 'dsaf');
INSERT INTO `note` VALUES (5, '<p>卫计局</p>', '2019-03-22 19:39:35', '我是标题', 'admin', '/项目部署1.png', NULL, 0, '2019-03-22 19:39:35', NULL, 'dsaf1111');
INSERT INTO `note` VALUES (6, '<p>的示范法</p>', '2019-03-22 19:45:48', '我是标题', 'admin', '/项目部署1.png', NULL, 0, '2019-03-22 19:45:48', 0, 'dsaf');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `type_id` int(255) NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '古筝');
INSERT INTO `type` VALUES (2, '扬琴');
INSERT INTO `type` VALUES (3, '二胡');
INSERT INTO `type` VALUES (4, '琵琶');
INSERT INTO `type` VALUES (11, '21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', NULL, NULL, 999999999);
INSERT INTO `user` VALUES ('admin', 'admin', '649814031@qq.com', 0);
INSERT INTO `user` VALUES ('user1', 'user1', '649814031@qq.com', 1);
INSERT INTO `user` VALUES ('user2', 'user2', '649814031@qq.com', 1);
INSERT INTO `user` VALUES ('user5', 'user5', '649814031@qq.com', 1);
INSERT INTO `user` VALUES ('user6', 'user6', '', 1);
INSERT INTO `user` VALUES ('user7', '3e0469fb134991f8f75a2760e409c6ed', '', 1);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `type_id` int(255) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `play_times` int(255) NULL DEFAULT 0,
  `png` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `author_username`(`author`) USING BTREE,
  CONSTRAINT `author_username` FOREIGN KEY (`author`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, 'user7', '20190314035043-192_线程_概念.mp4', '2019-08-09 15:50:51', 1, '大法', 0, '20190314035043-192_线程_概念.png');
INSERT INTO `video` VALUES (2, 'user7', '20190314035043-192_线程_概念.mp4', '2019-08-09 15:50:51', 1, '大法', 399, '20190314035043-192_线程_概念.png');
INSERT INTO `video` VALUES (5, NULL, NULL, NULL, NULL, NULL, 22, NULL);
INSERT INTO `video` VALUES (10, NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO `video` VALUES (11, NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO `video` VALUES (12, NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO `video` VALUES (13, NULL, NULL, NULL, NULL, NULL, 8, NULL);
INSERT INTO `video` VALUES (14, 'user7', '20190313075845-多级联动类图设计.pptx', '2019-03-13 19:58:47', 1, 'xiaoxoa ', 0, NULL);
INSERT INTO `video` VALUES (15, 'user7', '20190313081950-dorianli答辩.pptx', '2019-03-13 20:19:54', 1, '213', 0, NULL);
INSERT INTO `video` VALUES (16, 'user7', NULL, '2019-03-14 15:39:31', 1, '我我', 0, NULL);
INSERT INTO `video` VALUES (17, 'user7', NULL, '2019-03-14 15:48:58', 1, '打', 0, NULL);
INSERT INTO `video` VALUES (21, 'user7', '', '2019-03-14 16:51:11', 2, '第三方', 0, '');
INSERT INTO `video` VALUES (22, 'user7', '', '2019-03-14 16:52:47', 1, '第三方', 0, '');
INSERT INTO `video` VALUES (23, 'user7', '', '2019-03-14 16:54:48', 1, '标题', 0, '');
INSERT INTO `video` VALUES (24, 'user7', '', '2019-03-14 16:55:59', 2, '标题', 0, '');
INSERT INTO `video` VALUES (25, 'user7', '', '2019-03-14 16:56:01', 2, '标题', 0, '');
INSERT INTO `video` VALUES (26, 'user7', '', '2019-03-14 18:42:55', 1, '标题', 0, '');
INSERT INTO `video` VALUES (27, 'user7', '', '2019-03-14 18:44:25', 2, '标题', 0, '');
INSERT INTO `video` VALUES (28, 'user7', '', '2019-03-14 18:44:30', 2, '标题', 0, '');
INSERT INTO `video` VALUES (29, 'user7', '', '2019-03-14 18:44:31', 2, '标题', 0, '');
INSERT INTO `video` VALUES (30, 'user7', '', '2019-03-14 18:44:32', 2, '标题', 0, '');
INSERT INTO `video` VALUES (31, 'user7', '', '2019-03-14 18:45:25', 1, '标题', 0, '');
INSERT INTO `video` VALUES (32, 'user7', '', '2019-03-14 19:01:36', 1, '标题', 0, '');

SET FOREIGN_KEY_CHECKS = 1;
