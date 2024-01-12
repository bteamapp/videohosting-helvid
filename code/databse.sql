/*
 Navicat Premium Data Transfer

 Source Server         : 10.168.1.152
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 10.168.1.152:3306
 Source Schema         : jnsyscn

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 26/05/2019 05:50:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `pass` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录密码',
  `nichen` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `logip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `logtime` int(11) NULL DEFAULT 0 COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'ef34d26317c153a26a896e6b8496a84d', '源码来自lucky博客', '10.168.1.132', 1558814477);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fid` int(11) NULL DEFAULT 0,
  `xid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (16, '搞笑视频', 0, 10);
INSERT INTO `class` VALUES (17, '国产电影', 0, 10);
INSERT INTO `class` VALUES (15, '短视频秀', 0, 19);

-- ----------------------------
-- Table structure for fav
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NULL DEFAULT 0,
  `did` int(11) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, 'lucky', 'https://www.kybai.cn');

-- ----------------------------
-- Table structure for myclass
-- ----------------------------
DROP TABLE IF EXISTS `myclass`;
CREATE TABLE `myclass`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT 0,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fid` int(11) NULL DEFAULT 0,
  `xid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myclass
-- ----------------------------
INSERT INTO `myclass` VALUES (14, 207, '动漫', 0, 0);

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `apiurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `apikey` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `zmnum` smallint(5) NULL DEFAULT 0,
  `mp4dir` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `m3u8dir` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cdnurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `zsize` bigint(20) NULL DEFAULT 0,
  `size` bigint(20) NULL DEFAULT 0,
  `vip` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES (10, '测试长传', 'http://10.168.1.152:81/', '1hh9impb5547e75bkfxcpfjk7am5w2ci', 10, './video/data/', './video/m3u8/', 'http://10.168.1.152:81', 1099511627776, 5863064, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pass` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `zt` tinyint(1) NULL DEFAULT 0,
  `vip` tinyint(1) NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (225, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'admin@helvid.com', '', '', 0, 0, 1558109129);

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT 0,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 592 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES (501, 204, '120.3.228.235', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.110', 1545399005);
INSERT INTO `user_log` VALUES (500, 204, '120.3.228.235', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.110', 1545388988);
INSERT INTO `user_log` VALUES (499, 204, '120.3.228.235', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.110', 1545388949);
INSERT INTO `user_log` VALUES (502, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545705516);
INSERT INTO `user_log` VALUES (503, 205, '117.136.72.120', 'Android&nbsp;/&nbsp;Chrome v62.0.3202.84', 1545708840);
INSERT INTO `user_log` VALUES (504, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545717925);
INSERT INTO `user_log` VALUES (505, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545721050);
INSERT INTO `user_log` VALUES (506, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545721137);
INSERT INTO `user_log` VALUES (507, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545721150);
INSERT INTO `user_log` VALUES (508, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545721164);
INSERT INTO `user_log` VALUES (509, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v55.0.2883.87', 1545721750);
INSERT INTO `user_log` VALUES (510, 204, '221.217.48.241', 'Windows 7&nbsp;/&nbsp;Chrome v55.0.2883.87', 1545721946);
INSERT INTO `user_log` VALUES (511, 206, '27.38.241.64', 'Windows 7&nbsp;/&nbsp;Chrome v71.0.3578.98', 1545739855);
INSERT INTO `user_log` VALUES (512, 207, '14.113.251.247', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.26', 1545739983);
INSERT INTO `user_log` VALUES (513, 208, '103.21.12.216', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.67', 1545740085);
INSERT INTO `user_log` VALUES (514, 204, '221.217.53.189', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545784306);
INSERT INTO `user_log` VALUES (515, 204, '221.217.53.189', 'Windows 7&nbsp;/&nbsp;Internet Explorer v9.0', 1545784362);
INSERT INTO `user_log` VALUES (516, 204, '221.217.53.189', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545811180);
INSERT INTO `user_log` VALUES (517, 204, '221.217.53.189', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545822182);
INSERT INTO `user_log` VALUES (518, 204, '221.217.53.189', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545824683);
INSERT INTO `user_log` VALUES (519, 209, '113.96.231.120', 'Android&nbsp;/&nbsp;Chrome v57.0.2987.132', 1545887412);
INSERT INTO `user_log` VALUES (520, 204, '221.217.53.189', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1545887477);
INSERT INTO `user_log` VALUES (521, 210, '162.158.178.136', 'Android&nbsp;/&nbsp;Chrome v57.0.2987.132', 1545905426);
INSERT INTO `user_log` VALUES (522, 208, '103.21.12.216', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.67', 1545997523);
INSERT INTO `user_log` VALUES (523, 211, '219.146.247.226', 'Windows 10&nbsp;/&nbsp;Chrome v70.0.3538.110', 1545997738);
INSERT INTO `user_log` VALUES (524, 212, '123.7.182.128', 'Windows 7&nbsp;/&nbsp;Chrome v47.0.2626.106', 1545997804);
INSERT INTO `user_log` VALUES (525, 213, '172.68.189.122', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1546004124);
INSERT INTO `user_log` VALUES (526, 214, '172.68.143.247', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1546005562);
INSERT INTO `user_log` VALUES (527, 213, '172.68.142.198', 'Windows 10&nbsp;/&nbsp;Chrome v71.0.3578.98', 1546007864);
INSERT INTO `user_log` VALUES (528, 215, '172.68.141.239', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.26', 1546015695);
INSERT INTO `user_log` VALUES (529, 216, '122.195.14.4', 'Windows 10&nbsp;/&nbsp;Chrome v70.0.3538.25', 1556056938);
INSERT INTO `user_log` VALUES (530, 217, '1.204.194.153', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556079746);
INSERT INTO `user_log` VALUES (531, 217, '223.64.35.79', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556087233);
INSERT INTO `user_log` VALUES (532, 217, '35.221.188.63', 'Windows 7&nbsp;/&nbsp;Chrome v69.0.3497.100', 1556115662);
INSERT INTO `user_log` VALUES (533, 217, '113.246.110.123', 'Windows 7&nbsp;/&nbsp;Chrome v72.0.3626.119', 1556124701);
INSERT INTO `user_log` VALUES (534, 217, '171.213.59.212', 'Windows 10&nbsp;/&nbsp;Chrome v73.0.3683.103', 1556128127);
INSERT INTO `user_log` VALUES (535, 218, '115.222.167.164', 'Windows 7&nbsp;/&nbsp;Chrome v65.0.3325.181', 1556158567);
INSERT INTO `user_log` VALUES (536, 217, '115.60.87.211', 'Windows 10&nbsp;/&nbsp;Chrome v53.0.2785.104', 1556160531);
INSERT INTO `user_log` VALUES (537, 219, '14.218.144.29', 'Windows 7&nbsp;/&nbsp;Chrome v72.0.3626.119', 1556168186);
INSERT INTO `user_log` VALUES (538, 217, '119.50.12.105', 'Windows 7&nbsp;/&nbsp;Chrome v73.0.3683.86', 1556179415);
INSERT INTO `user_log` VALUES (539, 217, '182.113.216.77', 'Windows 8&nbsp;/&nbsp;Chrome v58.0.3029.110', 1556183269);
INSERT INTO `user_log` VALUES (540, 217, '182.113.216.77', 'Windows 8&nbsp;/&nbsp;Chrome v58.0.3029.110', 1556183314);
INSERT INTO `user_log` VALUES (541, 220, '117.177.27.130', 'Windows 10&nbsp;/&nbsp;Chrome v73.0.3683.103', 1556284689);
INSERT INTO `user_log` VALUES (542, 220, '180.191.159.33', 'Windows 10&nbsp;/&nbsp;Chrome v72.0.3626.121', 1556284747);
INSERT INTO `user_log` VALUES (543, 220, '180.191.159.33', 'Windows 10&nbsp;/&nbsp;Chrome v72.0.3626.121', 1556292746);
INSERT INTO `user_log` VALUES (544, 221, '183.0.172.208', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556336639);
INSERT INTO `user_log` VALUES (545, 217, '58.152.14.236', 'Windows 7&nbsp;/&nbsp;Chrome v69.0.3497.92', 1556365527);
INSERT INTO `user_log` VALUES (546, 217, '36.59.249.177', 'Windows 10&nbsp;/&nbsp;Chrome v73.0.3683.86', 1556375047);
INSERT INTO `user_log` VALUES (547, 222, '103.119.154.146', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556378334);
INSERT INTO `user_log` VALUES (548, 222, '103.119.154.146', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556389542);
INSERT INTO `user_log` VALUES (549, 217, '211.99.134.28', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556431779);
INSERT INTO `user_log` VALUES (550, 217, '223.141.150.179', 'Windows 10&nbsp;/&nbsp;Chrome v70.0.3538.77', 1556437661);
INSERT INTO `user_log` VALUES (551, 217, '112.97.56.118', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556541171);
INSERT INTO `user_log` VALUES (552, 223, '103.246.144.106', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556605908);
INSERT INTO `user_log` VALUES (553, 223, '103.246.144.106', 'Windows 7&nbsp;/&nbsp;Chrome v73.0.3683.103', 1556605986);
INSERT INTO `user_log` VALUES (554, 217, '119.50.12.111', 'Windows 7&nbsp;/&nbsp;Chrome v73.0.3683.86', 1556614373);
INSERT INTO `user_log` VALUES (555, 217, '218.23.220.221', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556617710);
INSERT INTO `user_log` VALUES (556, 224, '183.3.226.234', 'Apple iPhone&nbsp;/&nbsp;Safari v604.1', 1556659772);
INSERT INTO `user_log` VALUES (557, 217, '119.134.149.30', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556787847);
INSERT INTO `user_log` VALUES (558, 217, '113.118.233.222', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1556893477);
INSERT INTO `user_log` VALUES (559, 217, '171.34.221.255', 'Windows 10&nbsp;/&nbsp;Chrome v70.0.3538.102', 1556938087);
INSERT INTO `user_log` VALUES (560, 217, '114.88.193.66', 'Windows 10&nbsp;/&nbsp;Chrome v57.0.2987.98', 1556954304);
INSERT INTO `user_log` VALUES (561, 217, '114.88.193.66', 'Windows 10&nbsp;/&nbsp;Chrome v57.0.2987.98', 1556954307);
INSERT INTO `user_log` VALUES (562, 217, '116.28.237.51', 'Windows 7&nbsp;/&nbsp;Chrome v57.0.2987.133', 1557096284);
INSERT INTO `user_log` VALUES (563, 217, '120.229.62.15', 'Windows 7&nbsp;/&nbsp;Chrome v73.0.3683.86', 1557150738);
INSERT INTO `user_log` VALUES (564, 217, '113.104.194.244', 'Windows 10&nbsp;/&nbsp;Chrome v71.0.3578.98', 1557254362);
INSERT INTO `user_log` VALUES (565, 217, '39.191.185.128', 'Windows 10&nbsp;/&nbsp;Chrome v58.0.3029.110', 1557376641);
INSERT INTO `user_log` VALUES (566, 217, '211.99.134.28', 'Windows 7&nbsp;/&nbsp;Chrome v69.0.3497.100', 1557391585);
INSERT INTO `user_log` VALUES (567, 217, '113.118.232.165', 'Windows 10&nbsp;/&nbsp;Chrome v74.0.3729.131', 1557418055);
INSERT INTO `user_log` VALUES (568, 217, '117.136.75.69', 'Apple iPhone&nbsp;/&nbsp;Mozilla v5.0', 1557511068);
INSERT INTO `user_log` VALUES (569, 217, '122.96.40.29', 'Android&nbsp;/&nbsp;Chrome v53.0.2785.134', 1557596947);
INSERT INTO `user_log` VALUES (570, 217, '111.182.6.126', 'Windows 10&nbsp;/&nbsp;Chrome v55.0.2883.87', 1557727578);
INSERT INTO `user_log` VALUES (571, 217, '117.83.131.171', 'Windows 10&nbsp;/&nbsp;Chrome v71.0.3578.98', 1557819648);
INSERT INTO `user_log` VALUES (572, 217, '114.227.64.234', 'Windows 10&nbsp;/&nbsp;Chrome v74.0.3729.108', 1557822214);
INSERT INTO `user_log` VALUES (573, 217, '120.84.11.83', 'Windows 10&nbsp;/&nbsp;Chrome v65.0.3325.181', 1557843914);
INSERT INTO `user_log` VALUES (574, 217, '61.129.10.43', 'Android&nbsp;/&nbsp;Chrome v57.0.2987.132', 1557884483);
INSERT INTO `user_log` VALUES (575, 217, '61.129.10.43', 'Android&nbsp;/&nbsp;Chrome v57.0.2987.132', 1557884525);
INSERT INTO `user_log` VALUES (576, 217, '223.89.6.254', 'Windows 7&nbsp;/&nbsp;Chrome v63.0.3239.132', 1557890947);
INSERT INTO `user_log` VALUES (577, 217, '113.139.107.118', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1558023751);
INSERT INTO `user_log` VALUES (578, 225, '183.4.132.237', 'Windows 10&nbsp;/&nbsp;Chrome v70.0.3538.25', 1558109129);
INSERT INTO `user_log` VALUES (579, 217, '182.112.135.6', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.25', 1558259506);
INSERT INTO `user_log` VALUES (580, 217, '182.112.135.6', 'Windows 7&nbsp;/&nbsp;Chrome v70.0.3538.25', 1558259779);
INSERT INTO `user_log` VALUES (581, 217, '122.189.150.56', 'Windows 7&nbsp;/&nbsp;Chrome v55.0.2883.87', 1558271120);
INSERT INTO `user_log` VALUES (582, 217, '117.34.187.12', 'Windows 10&nbsp;/&nbsp;Chrome v69.0.3497.100', 1558346528);
INSERT INTO `user_log` VALUES (583, 217, '117.34.187.12', 'Windows 10&nbsp;/&nbsp;Chrome v69.0.3497.100', 1558346531);
INSERT INTO `user_log` VALUES (584, 217, '120.227.193.250', 'Windows 7&nbsp;/&nbsp;Chrome v74.0.3729.108', 1558423592);
INSERT INTO `user_log` VALUES (585, 217, '111.59.244.245', 'Windows 10&nbsp;/&nbsp;Chrome v58.0.3029.110', 1558486240);
INSERT INTO `user_log` VALUES (586, 217, '124.88.100.66', 'Windows 7&nbsp;/&nbsp;Chrome v73.0.3683.86', 1558507737);
INSERT INTO `user_log` VALUES (587, 217, '111.20.73.22', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.26', 1558575619);
INSERT INTO `user_log` VALUES (588, 217, '113.102.242.110', 'Windows 8.1&nbsp;/&nbsp;Chrome v55.0.2883.87', 1558690559);
INSERT INTO `user_log` VALUES (589, 217, '114.227.179.140', 'Windows 10&nbsp;/&nbsp;Chrome v69.0.3497.100', 1558741028);
INSERT INTO `user_log` VALUES (590, 225, '10.168.1.132', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1558815446);
INSERT INTO `user_log` VALUES (591, 225, '10.168.1.132', 'Windows 10&nbsp;/&nbsp;Chrome v63.0.3239.132', 1558817854);

-- ----------------------------
-- Table structure for vod
-- ----------------------------
DROP TABLE IF EXISTS `vod`;
CREATE TABLE `vod`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `vip` tinyint(1) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cid` int(11) NULL DEFAULT 0,
  `mycid` int(11) NULL DEFAULT 0,
  `hits` int(11) NULL DEFAULT 0,
  `duration` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `size` bigint(20) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT 0,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `zt` tinyint(1) NULL DEFAULT 0,
  `fid` tinyint(3) NULL DEFAULT 0,
  `addtime` int(11) NULL DEFAULT 0,
  `zmtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `time`(`addtime`) USING BTREE,
  INDEX `vid`(`vid`) USING BTREE,
  INDEX `zmtime`(`zt`, `zmtime`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6179 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vod
-- ----------------------------
INSERT INTO `vod` VALUES (6163, 'afd8ceff8478', 0, 'asas', 1, 0, 24, '52.448267', 5640562, 218, '/www/wwwroot/195.123.238.169/video/data//201904/25/20190425101637cd5a9.mp4', 2, 10, 1556158597, 1556158598);
INSERT INTO `vod` VALUES (6170, '702dd7a276a6', 0, '1552188011776_1525258894791', 1, 0, 11, '4.178333', 222502, 222, '/www/wwwroot/195.123.238.169/video/data//201904/28/20190428022639dc14e.mp4', 2, 10, 1556389599, 1556389600);

SET FOREIGN_KEY_CHECKS = 1;
