/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : videosite

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2019-05-20 17:55:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attachement
-- ----------------------------
DROP TABLE IF EXISTS `attachement`;
CREATE TABLE `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongfileldname` varchar(255) DEFAULT NULL,
  `belongid` varchar(255) DEFAULT NULL,
  `belongtable` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachement
-- ----------------------------
INSERT INTO `attachement` VALUES ('18', 'id', '20', 'video', '草莓蛋糕.flv', '2018-05-07 19:55:31', '草莓蛋糕.flv', 'images', '/video/upload/temp/草莓蛋糕.flv');
INSERT INTO `attachement` VALUES ('31', 'id', '29', 'video', '樱花耳环.mp4', '2019-05-13 16:47:55', '樱花耳环.mp4', 'images', '/video/upload/temp/樱花耳环.mp4');
INSERT INTO `attachement` VALUES ('35', 'id', '31', 'video', '樱花耳环.mp4', '2019-05-18 22:46:37', '樱花耳环.mp4', 'images', '/video/upload/temp/樱花耳环.mp4');
INSERT INTO `attachement` VALUES ('36', 'id', '32', 'video', '煎牛排的那些事儿.mp4', '2019-05-19 18:07:21', '煎牛排的那些事儿.mp4', 'images', '/video/upload/temp/煎牛排的那些事儿.mp4');
INSERT INTO `attachement` VALUES ('37', 'id', '33', 'video', '日食记耳光炒饭3.0.mp4', '2019-05-19 18:09:27', '日食记耳光炒饭3.0.mp4', 'images', '/video/upload/temp/日食记耳光炒饭3.0.mp4');
INSERT INTO `attachement` VALUES ('38', 'id', '34', 'video', '日食记家庭版烤鱼.mp4', '2019-05-19 18:11:03', '日食记家庭版烤鱼.mp4', 'images', '/video/upload/temp/日食记家庭版烤鱼.mp4');
INSERT INTO `attachement` VALUES ('39', 'id', '35', 'video', '完美的鸡蛋羹.mp4', '2019-05-19 18:12:59', '完美的鸡蛋羹.mp4', 'images', '/video/upload/temp/完美的鸡蛋羹.mp4');
INSERT INTO `attachement` VALUES ('40', 'id', '36', 'video', '【滴胶】做一个精灵球，能捕获到你么！.mp4', '2019-05-19 18:16:46', '【滴胶】做一个精灵球，能捕获到你么！.mp4', 'images', '/video/upload/temp/【滴胶】做一个精灵球，能捕获到你么！.mp4');
INSERT INTO `attachement` VALUES ('41', 'id', '37', 'video', '海洋史莱姆.mp4', '2019-05-19 18:20:24', '海洋史莱姆.mp4', 'images', '/video/upload/temp/海洋史莱姆.mp4');
INSERT INTO `attachement` VALUES ('42', 'id', '38', 'video', '鲜花棒棒糖.mp4', '2019-05-19 18:22:48', '鲜花棒棒糖.mp4', 'images', '/video/upload/temp/鲜花棒棒糖.mp4');
INSERT INTO `attachement` VALUES ('43', 'id', '39', 'video', '新年锦鲤.mp4', '2019-05-19 18:25:43', '新年锦鲤.mp4', 'images', '/video/upload/temp/新年锦鲤.mp4');
INSERT INTO `attachement` VALUES ('44', 'id', '40', 'video', '3分钟就能在宿舍做好的提拉米苏.mp4', '2019-05-19 18:28:47', '3分钟就能在宿舍做好的提拉米苏.mp4', 'images', '/video/upload/temp/3分钟就能在宿舍做好的提拉米苏.mp4');
INSERT INTO `attachement` VALUES ('45', 'id', '41', 'video', '不用烤箱也能做出口感丝滑的焦糖布丁.mp4', '2019-05-19 18:53:36', '不用烤箱也能做出口感丝滑的焦糖布丁.mp4', 'images', '/video/upload/temp/不用烤箱也能做出口感丝滑的焦糖布丁.mp4');
INSERT INTO `attachement` VALUES ('46', 'id', '42', 'video', '渐变式抹茶慕斯蛋糕.mp4', '2019-05-19 19:01:00', '渐变式抹茶慕斯蛋糕.mp4', 'images', '/video/upload/temp/渐变式抹茶慕斯蛋糕.mp4');
INSERT INTO `attachement` VALUES ('47', 'id', '43', 'video', '经典全蛋海绵蛋糕.mp4', '2019-05-19 19:24:41', '经典全蛋海绵蛋糕.mp4', 'images', '/video/upload/temp/经典全蛋海绵蛋糕.mp4');
INSERT INTO `attachement` VALUES ('48', 'id', '44', 'video', '自制京都抹茶云朵蛋挞.mp4', '2019-05-19 19:25:44', '自制京都抹茶云朵蛋挞.mp4', 'images', '/video/upload/temp/自制京都抹茶云朵蛋挞.mp4');
INSERT INTO `attachement` VALUES ('49', 'id', '26', 'video', '手作羊毛毡1.mp4', '2019-05-19 23:26:24', '手作羊毛毡1.mp4', 'images', '/video/upload/temp/手作羊毛毡1.mp4');
INSERT INTO `attachement` VALUES ('50', 'id', '30', 'video', '小裙子2.mp4', '2019-05-19 23:26:34', '小裙子2.mp4', 'images', '/video/upload/temp/小裙子2.mp4');
INSERT INTO `attachement` VALUES ('52', 'id', '27', 'video', '小蛋糕1.mp4', '2019-05-19 23:26:59', '小蛋糕1.mp4', 'images', '/video/upload/temp/小蛋糕1.mp4');
INSERT INTO `attachement` VALUES ('53', 'id', '45', 'video', '1分钟教你用废旧纸筒做提线木偶.mp4', '2019-05-20 10:37:37', '1分钟教你用废旧纸筒做提线木偶.mp4', 'images', '/video/upload/temp/1分钟教你用废旧纸筒做提线木偶.mp4');
INSERT INTO `attachement` VALUES ('54', 'id', '46', 'video', '非常夏天的珍项链.mp4', '2019-05-20 10:42:27', '非常夏天的珍项链.mp4', 'images', '/video/upload/temp/非常夏天的珍项链.mp4');
INSERT INTO `attachement` VALUES ('55', 'id', '47', 'video', '甜系Lolita饰品制作教程.mp4', '2019-05-20 10:43:45', '甜系Lolita饰品制作教程.mp4', 'images', '/video/upload/temp/甜系Lolita饰品制作教程.mp4');
INSERT INTO `attachement` VALUES ('56', 'id', '48', 'video', '这个夏季你还差清新小饰品.mp4', '2019-05-20 10:44:58', '这个夏季你还差清新小饰品.mp4', 'images', '/video/upload/temp/这个夏季你还差清新小饰品.mp4');
INSERT INTO `attachement` VALUES ('57', 'id', '49', 'video', '制作珍珠手镯.mp4', '2019-05-20 10:45:47', '制作珍珠手镯.mp4', 'images', '/video/upload/temp/制作珍珠手镯.mp4');
INSERT INTO `attachement` VALUES ('58', 'id', '50', 'video', 'DIY手工美美的旗袍.mp4', '2019-05-20 10:50:39', 'DIY手工美美的旗袍.mp4', 'images', '/video/upload/temp/DIY手工美美的旗袍.mp4');
INSERT INTO `attachement` VALUES ('59', 'id', '51', 'video', '荷叶边露肩上衣or连衣裙图纸和制作.mp4', '2019-05-20 10:55:32', '荷叶边露肩上衣or连衣裙图纸和制作.mp4', 'images', '/video/upload/temp/荷叶边露肩上衣or连衣裙图纸和制作.mp4');
INSERT INTO `attachement` VALUES ('60', 'id', '52', 'video', '教你制作一件插肩袖卫衣.mp4', '2019-05-20 10:56:27', '教你制作一件插肩袖卫衣.mp4', 'images', '/video/upload/temp/教你制作一件插肩袖卫衣.mp4');
INSERT INTO `attachement` VALUES ('61', 'id', '53', 'video', '教你制作一件唐装.mp4', '2019-05-20 10:57:23', '教你制作一件唐装.mp4', 'images', '/video/upload/temp/教你制作一件唐装.mp4');
INSERT INTO `attachement` VALUES ('62', 'id', '54', 'video', '小姐姐交你怎样做内衣.mp4', '2019-05-20 12:11:37', '小姐姐交你怎样做内衣.mp4', 'images', '/video/upload/temp/小姐姐交你怎样做内衣.mp4');
INSERT INTO `attachement` VALUES ('63', 'id', '21', 'video', '日食记酸菜鱼.mp4', '2019-05-20 12:26:54', '日食记酸菜鱼.mp4', 'images', '/video/upload/temp/日食记酸菜鱼.mp4');
INSERT INTO `attachement` VALUES ('65', 'id', '55', 'video', '荷叶边露肩上衣or连衣裙图纸和制作.mp4', '2019-05-20 12:28:41', '荷叶边露肩上衣or连衣裙图纸和制作.mp4', 'images', '/video/upload/temp/荷叶边露肩上衣or连衣裙图纸和制作.mp4');
INSERT INTO `attachement` VALUES ('66', 'id', '56', 'video', '椰汁桂花糕.mp4', '2019-05-20 12:59:26', '椰汁桂花糕.mp4', 'images', '/video/upload/temp/椰汁桂花糕.mp4');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `scren` varchar(255) DEFAULT NULL,
  `sctime` datetime DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('16', '20', '黄家驹大地', '/e/yingpianinfo.jsp?id=20', '2019031701', '2019-03-17 01:32:25', '/video/upload/temp/8755144279818532276.jpg', null);
INSERT INTO `collect` VALUES ('17', '1', '发布文章测试', '/e/xinxiinfo.jsp?id=1', '2019031701', '2019-03-17 01:33:08', '/video/upload/temp/18_180122115452_1.jpg', null);
INSERT INTO `collect` VALUES ('19', '21', '日食记酸菜鱼', '/e/yingpianinfo.jsp?id=21', '123123', '2019-05-03 12:29:53', '/video/upload/temp/日食记酸菜鱼.png', null);
INSERT INTO `collect` VALUES ('20', '30', '小裙子', '/e/videoinfo.jsp?id=30', '123123', '2019-05-13 17:20:43', '/video/upload/temp/小裙子1.png', null);
INSERT INTO `collect` VALUES ('21', '26', '手作羊毛毯', '/e/videoinfo.jsp?id=26', '2018120501', '2019-05-17 20:48:54', '/video/upload/temp/手作羊毛毡1.png', null);
INSERT INTO `collect` VALUES ('22', '26', '手作羊毛毯', '/e/videoinfo.jsp?id=26', 'Arop', '2019-05-18 21:20:41', '/video/upload/temp/手作羊毛毡1.png', null);
INSERT INTO `collect` VALUES ('23', '31', '樱花', '/e/videoinfo.jsp?id=31', 'Arop', '2019-05-18 21:48:57', '/video/upload/temp/樱花耳环.png', null);
INSERT INTO `collect` VALUES ('24', '48', '清新小饰品', '/e/videoinfo.jsp?id=48', '神奇的包包', '2019-05-20 12:14:52', '/video/upload/temp/这个夏季你还差清新小饰品.jpg', null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongid` varchar(255) DEFAULT NULL,
  `commentcontent` varchar(255) DEFAULT NULL,
  `commentren` varchar(255) DEFAULT NULL,
  `commenttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('7', '21', '哇，看起来好好吃啊', '123123', '2019-04-24 10:26:12', null, 'yingpian', '/video/upload/nopic.jpg');
INSERT INTO `comment` VALUES ('8', '21', '真香，想吃想吃想吃', '123123', '2019-05-03 04:38:08', null, 'yingpian', '/video/upload/nopic.jpg');
INSERT INTO `comment` VALUES ('9', '27', '小高姐好棒棒！！！', '2019031701', '2019-05-03 05:46:21', null, 'yingpian', '/video/upload/temp/亚丝娜.jpg');
INSERT INTO `comment` VALUES ('10', '26', '很帅！！！！！！\r\n', '123123', '2019-05-03 06:37:47', null, 'yingpian', '/video/upload/temp/2.png');
INSERT INTO `comment` VALUES ('11', '31', '好棒鸭！！！！！！！', 'Arop', '2019-05-18 21:49:37', null, 'video', '/video/upload/temp/timg (1).jpg');
INSERT INTO `comment` VALUES ('12', '32', '哇好想吃牛排！！！！！qwq', '123123', '2019-05-19 18:23:42', null, 'video', '/video/upload/temp/timg (5).jpg');
INSERT INTO `comment` VALUES ('13', '44', '好可爱哇！！！想吃！！最喜欢京都抹茶啦', '2018120501', '2019-05-19 19:27:36', null, 'video', '/video/upload/temp/TIM图片20190217214613.jpg');
INSERT INTO `comment` VALUES ('14', '54', '教的好详细啊！！！点赞！！！！', '神奇的包包', '2019-05-20 12:12:32', null, 'video', '/video/upload/temp/TIM图片20181020131458.jpg');

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gzaccount` varchar(255) DEFAULT NULL,
  `hyaccount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('5', '2018120501', '2019031701');
INSERT INTO `friends` VALUES ('7', '2019030701', '123123');
INSERT INTO `friends` VALUES ('8', '2019030701', 'Arop');
INSERT INTO `friends` VALUES ('9', '2019031701', '2019031701');
INSERT INTO `friends` VALUES ('11', '2019030701', '神奇的包包');

-- ----------------------------
-- Table structure for lunbotu
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `pindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '/video/e/videoinfo.jsp?id=21', '0', '日食记酸菜鱼', '/video/upload/temp/rishiji1.jpg', '站内');
INSERT INTO `lunbotu` VALUES ('2', '/video/e/videoinfo.jsp?id=21', '0', '水煮牛肉', '/video/upload/temp/rishiji2.jpg', '站内');
INSERT INTO `lunbotu` VALUES ('3', '/video/e/videoinfo.jsp?id=56', '0', '椰汁桂花糕', '/video/upload/temp/TIM图片20190520125820.png', '站内');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logtimes` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `xiangpian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '2019-03-16 17:30:13', 'root', '670@qq.com', '78', '管理员', 'admin', '管理员', '???', '男', '0411-1234567', 'admin', '/video/upload/temp/TIM图片20190217214128.jpg');

-- ----------------------------
-- Table structure for sitenav
-- ----------------------------
DROP TABLE IF EXISTS `sitenav`;
CREATE TABLE `sitenav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `sindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sitenav
-- ----------------------------
INSERT INTO `sitenav` VALUES ('1', '/e/index.jsp', '1', '首页');
INSERT INTO `sitenav` VALUES ('35', '/e/spacelist.jsp', '3', '播主圈');
INSERT INTO `sitenav` VALUES ('45', '/e/videolist.jsp?typeid=8', '1', '家常');
INSERT INTO `sitenav` VALUES ('46', '/e/videolist.jsp?typeid=9', '1', '手作');
INSERT INTO `sitenav` VALUES ('47', '/e/videolist.jsp?typeid=10', '1', '甜点');
INSERT INTO `sitenav` VALUES ('48', '/e/videolist.jsp?typeid=11', '1', '饰品');
INSERT INTO `sitenav` VALUES ('49', '/e/videolist.jsp?typeid=12', '1', '衣物');

-- ----------------------------
-- Table structure for sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dcontent` longtext,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysconfig
-- ----------------------------
INSERT INTO `sysconfig` VALUES ('1', '<h3>\r\n	<p style=\"padding:0px;margin-top:0px;margin-bottom:0px;font-family:宋体, Arial, Helvetica, sans-serif;white-space:normal;background-color:#FFFFFF;border:0px currentcolor;line-height:25px;font-size:13.04px;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:&quot;font-size:14px;\">北京盛世雅歌琴行有限公司创立于1997年，是集乐器销售、维修、音乐培训为一体的综合乐器行，经销世界著名品牌施坦威、贝希斯坦、雅马哈、珠江、卡西欧、罗兰、敦煌等国内外知名品牌乐器，多年来公司始终坚持以诚信为本、顾客至上的诚信理念，致力于为广大的音乐爱好者提供高品质的产品和服务。目前，盛世雅歌琴行设有10多家门店、音乐艺术中心及多个演奏厅。</span>\r\n	</p>\r\n	<p style=\"padding:0px;margin-top:0px;margin-bottom:0px;font-family:宋体, Arial, Helvetica, sans-serif;transition:all 0.3s ease;white-space:normal;background-color:#FFFFFF;border:0px currentcolor;line-height:25px;font-size:13.04px;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:&quot;transition:all 0.3s ease;font-size:14px;\"> “以提升社会音乐文化水平”为宗旨的音乐中心，提供多元化的儿童及成人音乐课程，师资阵容强大，定期举办音乐会以及大师班，已成为业余音乐培训领域的佼佼者。</span>\r\n	</p>\r\n	<p style=\"padding:0px;margin-top:0px;margin-bottom:0px;font-family:宋体, Arial, Helvetica, sans-serif;white-space:normal;background-color:#FFFFFF;border:0px currentcolor;line-height:25px;font-size:13.04px;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:&quot;font-size:14px;\"> 盛世雅歌琴行拥有强大的售后服务团队，保证每款乐器都能享受到最专业的售后服务。客服中心人员均为名牌厂家认证的高级技师，技术领先，已成为雅马哈等知名乐器公司制定的特约维修中心。</span>\r\n	</p>\r\n	<p style=\"padding:0px;margin-top:0px;margin-bottom:0px;font-family:宋体, Arial, Helvetica, sans-serif;white-space:normal;background-color:#FFFFFF;border:0px currentcolor;line-height:25px;font-size:13.04px;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:&quot;font-size:14px;\"> 盛世雅歌琴行成立二十年来，坚持“以名牌创名店”，“只销售全球音乐界推崇的名牌乐器”，赢得了业内和爱乐者的信赖。在2013年《中国百强琴行与音乐培训机构》评选中，北京盛世雅歌琴行被评选为“中国十大琴行”</span>。\r\n	</p>\r\n</h3>\r\n<p align=\"left\">\r\n	<br />\r\n<br />\r\n<strong><br />\r\n</strong><br />\r\n</p>', '系统介绍');
INSERT INTO `sysconfig` VALUES ('2', '<table class=\"liststyle data ke-zeroborder\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" style=\"margin:0px;padding:0px;border:1px solid #DDDDDD;font-size:12px;font-family:Arial, Helvetica, sans-serif;vertical-align:top;list-style:none;border-collapse:separate;border-spacing:0px;width:738px;color:#666666;\">\r\n	<tbody style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n		<tr style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n			<th style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-weight:400;font-size:14px;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;text-align:right;color:#000000;\">\r\n				<p align=\"left\" style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">服务热线：</span>\r\n				</p>\r\n			</th>\r\n			<td style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-style:inherit;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;\">\r\n				<p style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">沈阳艺新新琴行：024-23231880 &nbsp;23230486</span>\r\n				</p>\r\n				<p style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span class=\"g\" style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\"><span style=\"font-size:medium;\"><span style=\"color:#000000;\">热线服务时间：周一～周日 09：30－18：30</span></span></span>\r\n				</p>\r\n<span style=\"font-size:medium;\"><span style=\"color:#000000;\"></span></span>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n			<th style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-weight:400;font-size:14px;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;text-align:right;color:#000000;\">\r\n				<p align=\"left\" style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">客服QQ：</span>\r\n				</p>\r\n			</th>\r\n			<td style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-style:inherit;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;\">\r\n				<span style=\"color:#000000;font-size:medium;\">\r\n				<p style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<br />\r\n门店：200608895\r\n				</p>\r\n</span>\r\n				<p style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">批发：200708895</span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n			<th style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-weight:400;font-size:14px;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;text-align:right;color:#000000;\">\r\n				<p align=\"left\" style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">商店留言：</span>\r\n				</p>\r\n			</th>\r\n			<td style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-style:inherit;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;\">\r\n				<span style=\"color:#000000;font-size:medium;\">您可以使用“客户留言”将您的意见和建议提给我们。</span>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n			<th style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-weight:400;font-size:14px;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;text-align:right;color:#000000;\">\r\n				<p align=\"left\" style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</span>\r\n				</p>\r\n			</th>\r\n			<td style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-style:inherit;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;\">\r\n				<p style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">沈阳艺新新琴行：辽宁省 沈阳市 和平区南二马路41号（市文化宫东100米，金碧辉煌正对面）</span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"margin:0px;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n			<th style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-weight:400;font-size:14px;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;text-align:right;color:#000000;\">\r\n				<p align=\"left\" style=\"margin-top:0px;margin-bottom:1.5em;padding:0px;border:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\">\r\n					<span style=\"color:#000000;font-size:medium;\">邮政编码：</span>\r\n				</p>\r\n			</th>\r\n			<td style=\"margin:0px;padding:4px;border-width:1px;border-style:solid;border-color:#FFFFFF #DDDDDD #DDDDDD #FFFFFF;border-image:initial;font-style:inherit;font-family:inherit;vertical-align:top;list-style:none;word-break:break-word;\">\r\n				<span style=\"color:#000000;font-size:medium;\">110001</span>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '联系方式');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('8', '', '家常');
INSERT INTO `type` VALUES ('9', '', '手作');
INSERT INTO `type` VALUES ('10', '', '甜点');
INSERT INTO `type` VALUES ('11', '', '饰品');
INSERT INTO `type` VALUES ('12', null, '衣物');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logtimes` int(11) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `touxiang` varchar(255) DEFAULT NULL,
  `idcardno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', '2018120501', 'test@qq.com', '11', '18957151234', '猫猫', '2018120501', '123456', '2019-03-16 17:30:13', '男', '1', '/video/upload/temp/TIM图片20190217214613.jpg', '360122198812043');
INSERT INTO `user` VALUES ('9', '2019030701', '1344343@qq.com', '6', '13732921234', '帅图', '2019030701', '123456', '2019-03-16 17:30:13', '男', '1', '/video/upload/temp/TIM图片20190217214128.jpg', '360122199212043');
INSERT INTO `user` VALUES ('10', '2019031701', '1234884@qq.com', '8', '15797881233', '亚丝娜', '2019031701', '123456', '2019-03-16 17:31:14', '男', '1', '/video/upload/temp/亚丝娜.jpg', '360122199212048');
INSERT INTO `user` VALUES ('11', '123123', '123@email.com', '55', '18811118888', '陳耳東', '123123', '123456', '2019-05-13 09:18:45', '男', '1', '/video/upload/temp/timg (7).jpg', '513436200003227858');
INSERT INTO `user` VALUES ('12', 'Arop', '522896062@qq.com', '5', '18004095313', '陳禾念', 'Arop', '123123', '2019-05-18 11:15:54', '男', '1', '/video/upload/temp/timg (1).jpg', '620102199702261526');
INSERT INTO `user` VALUES ('13', '包包', '522896062@qq.com', '2', '18004095313', '包包', '包包', '101010', '2019-05-20 11:54:02', '男', '1', '/video/upload/temp/TIM图片20181020131428.jpg', '620102199702261526');
INSERT INTO `user` VALUES ('14', '神奇的包包', '522896062@qq.com', '1', '18004095313', '包包', '神奇的包包', '101010', '2019-05-20 12:07:41', '男', '1', '/video/upload/temp/TIM图片20181020131458.jpg', '620102199702261526');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clickcount` int(11) NOT NULL,
  `des` text,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `remoteurl` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xshowtype` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `typename` varchar(255) DEFAULT NULL,
  `againstcount` int(11) DEFAULT NULL,
  `agreecount` int(11) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `alphabetindex` varchar(255) DEFAULT NULL,
  `dqid` int(11) DEFAULT NULL,
  `dqname` varchar(255) DEFAULT NULL,
  `ndid` int(11) DEFAULT NULL,
  `ndname` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('21', '0', '12344444444<audio controls=\"controls\" style=\"display:none;\"></audio>', '13732921234', '2019-01-06 19:10:17', '						\r\n                         \r\n                         \r\n                         ', '日食记酸菜鱼', '/video/upload/temp/日食记酸菜鱼.png', '2', '8', '家常', '1', '3', '酸菜鱼', 'A', '0', '日食记酸菜鱼', '0', '2018', '日食记酸菜鱼');
INSERT INTO `video` VALUES ('26', '0', '12344444444444', '2019031701', '2019-03-17 01:35:40', '						\r\n                         ', '手作羊毛毡', '/video/upload/temp/手作羊毛毡1.png', '2', '9', '手作', '0', '7', '手作羊毛毡', 'S', '0', '手作羊毛毯', '0', '2018', '手作羊毛毡');
INSERT INTO `video` VALUES ('27', '0', '<span style=\"white-space:nowrap;\">炒鸡好吃的小蛋糕，好吃的停不下来</span><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio>', '123123', '2019-05-03 13:41:36', '						 \r\n                         \r\n                         \r\n                         ', '炒鸡好吃的小蛋糕', '/video/upload/temp/小蛋糕1.png', '2', '10', '甜点', '0', '1', '小蛋糕', 'C', '0', null, '0', null, '蛋糕');
INSERT INTO `video` VALUES ('30', '0', '<span style=\"white-space:nowrap;\">超可爱的小裙子2333</span><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio><audio controls=\"controls\" style=\"display:none;\"></audio>', 'admin', '2019-05-13 16:47:05', '                         \r\n                         \r\n                         \r\n                         \r\n                         \r\n                         \r\n                         ', '小裙子', '/video/upload/temp/小裙子1.png', '2', '12', '衣服', '0', '1', '超可爱的小裙子', 'X', '0', null, '0', null, '塔裙');
INSERT INTO `video` VALUES ('31', '2', null, 'Arop', '2019-05-18 21:48:40', '						 \r\n                         \r\n                         ', '樱花', '/video/upload/temp/樱花耳环.png', '2', '11', '饰品', '0', '0', '123', 'A', '0', null, '0', null, '12345');
INSERT INTO `video` VALUES ('32', '2', '超棒的煎牛排', 'Arop', '2019-05-19 18:07:21', '						 ', '煎牛排那些事', '/video/upload/temp/煎牛排的那些事儿.jpg', '2', '8', '家常', '0', '0', '快来一起煎牛排啦', 'J', '0', null, '0', null, '牛排');
INSERT INTO `video` VALUES ('33', '0', '日食记的耳光炒饭！', 'Arop', '2019-05-19 18:09:27', '						 ', '日食记耳光炒饭3.0', '/video/upload/temp/日食记耳光炒饭3.0.jpg', '2', '8', '家常', '0', '0', '耳光炒饭', 'R', '0', null, '0', null, '炒饭');
INSERT INTO `video` VALUES ('34', '1', '家庭版烤肉', 'Arop', '2019-05-19 18:11:03', '						 ', '日食记家庭烤肉', '/video/upload/temp/日食记家庭版烤肉.jpg', '2', '8', '家常', '0', '0', '家庭烤肉', 'R', '0', null, '0', null, '烤肉');
INSERT INTO `video` VALUES ('35', '0', '是完美的鸡蛋羹！owo', 'Arop', '2019-05-19 18:12:59', '						 ', '完美的鸡蛋羹', '/video/upload/temp/完美的鸡蛋羹.jpg', '2', '8', '家常', '0', '0', '完美的鸡蛋羹！', 'W', '0', null, '0', null, '鸡蛋羹');
INSERT INTO `video` VALUES ('36', '0', '来做一个精灵球鸭！', '123123', '2019-05-19 18:16:45', '						 ', '[滴胶]做一个精灵球！', '/video/upload/temp/【滴胶】做一个精灵球，能捕获到你么！.jpg', '2', '9', '手作', '0', '0', '精灵球！', 'D', '0', null, '0', null, '手作精灵球·');
INSERT INTO `video` VALUES ('37', '0', '可以做史莱姆辣！( o\' W \'o ）', '123123', '2019-05-19 18:20:24', '						 ', '海洋史莱姆', '/video/upload/temp/海洋史莱姆.jpg', '2', '9', '手作', '0', '0', '是史莱姆啦！', 'H', '0', null, '0', null, '手作史莱姆');
INSERT INTO `video` VALUES ('38', '0', 'up主教你做鲜花棒棒糖', '123123', '2019-05-19 18:22:48', '						 ', '鲜花棒棒糖~', '/video/upload/temp/鲜花棒棒糖.jpg', '2', '9', '手作', '0', '0', '鲜花棒棒糖', 'X', '0', null, '0', null, '棒棒糖> <');
INSERT INTO `video` VALUES ('39', '0', '新年快乐！一起来做锦鲤！', '123123', '2019-05-19 18:25:43', '						 ', '新年锦鲤！', '/video/upload/temp/新年锦鲤.jpg', '2', '9', '手作', '0', '0', '锦鲤', 'X', '0', null, '0', null, '新年锦鲤');
INSERT INTO `video` VALUES ('40', '0', '教你一起做提拉米苏鸭', '2018120501', '2019-05-19 18:28:47', '						 ', '3分钟做好的提拉米苏！', '/video/upload/temp/3分钟就能在宿舍做好的提拉米苏.jpg', '2', '10', '甜点', '0', '0', '提拉米苏', 'S', '0', null, '0', null, '小蛋糕呀！');
INSERT INTO `video` VALUES ('41', '0', '<span style=\"white-space:nowrap;\">不用烤箱也能做的超棒焦糖布丁！</span>', '2018120501', '2019-05-19 18:53:36', '						 ', '不用烤箱也能做的焦糖布丁！', '/video/upload/temp/不用烤箱也能做出口感丝滑的焦糖布丁.jpg', '2', '10', '甜点', '0', '0', '布丁', 'B', '0', null, '0', null, '焦糖布丁owo');
INSERT INTO `video` VALUES ('42', '0', '渐变式抹茶慕斯蛋糕~', '2018120501', '2019-05-19 19:00:59', '						 ', '渐变式抹茶慕斯蛋糕', '/video/upload/temp/渐变式抹茶慕斯蛋糕.jpg', '2', '10', '甜点', '0', '0', '抹茶蛋糕', 'J', '0', null, '0', null, '慕斯抹茶');
INSERT INTO `video` VALUES ('43', '0', '教你做全蛋海绵蛋糕', '2018120501', '2019-05-19 19:24:41', '						 ', '经典全蛋海绵蛋糕', '/video/upload/temp/经典全蛋海绵蛋糕.jpg', '2', '10', '甜点', '0', '0', '海绵蛋糕哦', 'J', '0', null, '0', null, '海绵蛋糕');
INSERT INTO `video` VALUES ('44', '2', '京都抹茶', '2018120501', '2019-05-19 19:25:44', '						 ', '自制京都抹茶云朵蛋挞', '/video/upload/temp/自制京都抹茶云朵蛋挞.jpg', '2', '10', '甜点', '0', '0', '京都抹茶', 'Z', '0', null, '0', null, '京都抹茶');
INSERT INTO `video` VALUES ('45', '0', '教你做提线木偶啦', '2019031701', '2019-05-20 10:37:37', '						 ', '1分钟做提线木偶', '/video/upload/temp/1分钟教你用废旧纸筒做提线木偶.jpg', '2', '9', '手作', '0', '0', '木偶', 'Y', '0', null, '0', null, '木偶');
INSERT INTO `video` VALUES ('46', '0', '<span style=\"white-space:nowrap;\">非常夏天的项链~</span>', '2019031701', '2019-05-20 10:42:27', '						 ', '非常夏天的项链', '/video/upload/temp/非常夏天的项链.jpg', '2', '11', '饰品', '0', '0', '夏天的项链', 'F', '0', null, '0', null, '项链');
INSERT INTO `video` VALUES ('47', '0', '<span style=\"white-space:nowrap;\">甜系lolita饰品教程·~</span>', '2019031701', '2019-05-20 10:43:45', '						 ', '甜系lolita饰品教程·', '/video/upload/temp/甜系Lolita饰品制作教程.jpg', '2', '11', '饰品', '0', '0', 'lolita', 'T', '0', null, '0', null, 'lolita饰品');
INSERT INTO `video` VALUES ('48', '0', '夏季<span style=\"white-space:nowrap;\">清新小饰品</span>', '2019031701', '2019-05-20 10:44:58', '						 ', '清新小饰品', '/video/upload/temp/这个夏季你还差清新小饰品.jpg', '2', '11', '饰品', '0', '1', '清新', 'Q', '0', null, '0', null, '小饰品');
INSERT INTO `video` VALUES ('49', '0', '<span style=\"white-space:nowrap;\">珍珠手镯</span>', '2019031701', '2019-05-20 10:45:47', '						 ', '珍珠手镯', '/video/upload/temp/制作珍珠手镯.jpg', '2', '11', '饰品', '0', '0', '珍珠手镯', 'Z', '0', null, '0', null, '珍珠手镯');
INSERT INTO `video` VALUES ('50', '0', '<span style=\"white-space:nowrap;\">教你做旗袍</span>', '2019030701', '2019-05-20 10:50:39', '						 ', '教你做旗袍', '/video/upload/temp/DIY手工美美的旗袍.jpg', '2', '12', '衣服', '0', '0', '教你做旗袍', 'J', '0', null, '0', null, '教你做旗袍');
INSERT INTO `video` VALUES ('51', '0', '<span style=\"white-space:nowrap;\">荷叶边露肩上衣</span>', '2019030701', '2019-05-20 10:55:32', '						 ', '荷叶边露肩上衣', '/video/upload/temp/荷叶边露肩上衣or连衣裙图纸和制作.jpg', '2', '12', '衣物', '0', '0', '荷叶边露肩上衣', 'H', '0', null, '0', null, '荷叶边露肩上衣');
INSERT INTO `video` VALUES ('52', '0', '<span style=\"white-space:nowrap;\">教你做插肩袖卫衣</span>', '2019030701', '2019-05-20 10:56:27', '						 ', '教你做插肩袖卫衣', '/video/upload/temp/教你制作一件插肩袖卫衣.jpg', '2', '12', '衣物', '0', '0', '教你做插肩袖卫衣', 'J', '0', null, '0', null, '教你做插肩袖卫衣');
INSERT INTO `video` VALUES ('53', '0', '<span style=\"white-space:nowrap;\">如何制作唐装</span>', '2019030701', '2019-05-20 10:57:23', '						 ', '如何制作唐装', '/video/upload/temp/教你制作一件唐装.jpg', '2', '12', '衣物', '0', '0', '如何制作唐装', 'R', '0', null, '0', null, '如何制作唐装');
INSERT INTO `video` VALUES ('54', '2', '<span style=\"white-space:nowrap;\">教你做内衣</span>', '神奇的包包', '2019-05-20 12:11:37', '						 ', '教你做内衣', '/video/upload/temp/小姐姐交你怎样做内衣.jpg', '2', '12', '衣物', '0', '1', '教你做内衣', 'J', '0', null, '0', null, '教你做内衣');
INSERT INTO `video` VALUES ('55', '0', '<span style=\"white-space:nowrap;\">家庭烤肉</span>', 'admin', '2019-05-20 12:28:11', '                         \r\n                         ', '日食记', '/video/upload/temp/荷叶边露肩上衣or连衣裙图纸和制作.jpg', '2', '8', '家常', '0', '0', '家庭烤肉', 'A', '0', null, '0', null, '肉');
INSERT INTO `video` VALUES ('56', '1', '<span style=\"white-space:nowrap;\">椰汁桂花糕</span>', '神奇的包包', '2019-05-20 12:59:26', '						 ', '椰汁桂花糕', '/video/upload/temp/TIM截图20190520125808.png', '2', '10', '甜点', '0', '0', '椰汁桂花糕', 'Y', '0', null, '0', null, '椰汁桂花糕');
