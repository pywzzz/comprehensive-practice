/*
 Navicat Premium Data Transfer

 Source Server         : 测试
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3307
 Source Schema         : cgshop_database1

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 17/02/2023 16:44:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(0) NULL DEFAULT 1 COMMENT '1 、图片 \r\n            2、视频\r\n            ....',
  `miniUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `isdefault` bit(1) NULL DEFAULT b'0' COMMENT '0 否\r\n            1 是',
  `businessId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessType` tinyint(0) NULL DEFAULT 1 COMMENT '1 商品 \r\n            2 评论 \r\n            ....',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('98c294cf-8cda-11ed-a63e-98fa9bb10d76', '/attachment/1672910599994.jpg', 1, NULL, '2023-01-05 17:23:21', b'0', '296b27e4-df7c-4f84-9229-b8098875be90', 1);
INSERT INTO `attachment` VALUES ('b0474d07-8cf8-11ed-a63e-98fa9bb10d76', '/attachment/1672923524830.jpg', 1, NULL, '2023-01-05 20:58:45', b'0', '2bd08fa6-5ac6-4951-97db-b6426d85c9e7', 1);

-- ----------------------------
-- Table structure for b_marketing
-- ----------------------------
DROP TABLE IF EXISTS `b_marketing`;
CREATE TABLE `b_marketing`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sorts` tinyint(0) NULL DEFAULT NULL,
  `beginDate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endDate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '1 未开始  \r\n          2、已开始 \r\n         3 已结束 \r\n      4 已取消',
  `isdel` bit(1) NULL DEFAULT b'0' COMMENT '0 未删除\r\n            1已删除 ',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `createUser` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_marketing
-- ----------------------------

-- ----------------------------
-- Table structure for b_marketinggoods
-- ----------------------------
DROP TABLE IF EXISTS `b_marketinggoods`;
CREATE TABLE `b_marketinggoods`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_marketinggoods
-- ----------------------------

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payable` decimal(10, 2) NULL DEFAULT NULL,
  `pay` decimal(10, 2) NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '1 、待付款  （未支付） 2 、（待收货） （已付款） 3、 待评论  (已收货) 4 、取消订单 5、退货',
  `orderDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siteName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siteMobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siteAddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` decimal(9, 6) NULL DEFAULT NULL,
  `latitude` decimal(9, 6) NULL DEFAULT NULL,
  `receiveUser` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiveMobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_order
-- ----------------------------
INSERT INTO `b_order` VALUES ('40e46e23-8c22-48bd-97d4-d2a60e140a3c', 'dd-2022-0001', 222.00, 222.00, 1, '2023-01-05 23:01:19', '1', '张三', '阿五遍历店', '152552322', '郑州市高新区', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for b_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `b_orderdetail`;
CREATE TABLE `b_orderdetail`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `num` tinyint(0) NULL DEFAULT NULL,
  `oid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_orderdetail
-- ----------------------------
INSERT INTO `b_orderdetail` VALUES ('cfbb471f-8d09-11ed-a63e-98fa9bb10d76', '2bd08fa6-5ac6-4951-97db-b6426d85c9e7', '通天塔', 111.00, 2, '40e46e23-8c22-48bd-97d4-d2a60e140a3c');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sorts` tinyint(0) NULL DEFAULT 0,
  `parentId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tags` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `pid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentTotal` int(0) NULL DEFAULT 0,
  `score` decimal(2, 1) NULL,
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `isdel` bit(1) NULL DEFAULT b'0' COMMENT '0 未删除 \r\n            1 已删除 ',
  `categoryPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT 1 COMMENT ' 1  未上架\r\n            2 已上架 \r\n            3 已下架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('296b27e4-df7c-4f84-9229-b8098875be90', '测试1', '标签1', 10.00, 'ttt', 0, 0.0, '2023-01-05 17:23:21', '2023-01-05 17:23:21', b'0', NULL, 1);
INSERT INTO `goods` VALUES ('2bd08fa6-5ac6-4951-97db-b6426d85c9e7', '通天塔', '阿萨德', 111.00, '鞍山市', 0, 0.0, '2023-01-05 20:58:45', '2023-01-05 20:58:45', b'0', '', 1);

-- ----------------------------
-- Table structure for goodscomment
-- ----------------------------
DROP TABLE IF EXISTS `goodscomment`;
CREATE TABLE `goodscomment`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `isAudit` bit(1) NULL DEFAULT b'0' COMMENT '0 未审核\r\n            1已审核 ',
  `score` tinyint(0) NOT NULL DEFAULT 0,
  `parentId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1.默认情况下父id 是商品id 2. 它也可以是评论id ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodscomment
-- ----------------------------

-- ----------------------------
-- Table structure for goodspic
-- ----------------------------
DROP TABLE IF EXISTS `goodspic`;
CREATE TABLE `goodspic`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `miniUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadTime` timestamp(0) NULL DEFAULT NULL,
  `isdefault` bit(1) NULL DEFAULT b'0' COMMENT '0 否\r\n            1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodspic
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatarUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(0) NULL DEFAULT 0 COMMENT '0 未知道 \r\n            1 男\r\n            2 女',
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for memberaddress
-- ----------------------------
DROP TABLE IF EXISTS `memberaddress`;
CREATE TABLE `memberaddress`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` decimal(9, 6) NULL DEFAULT NULL,
  `latitude` decimal(9, 6) NULL DEFAULT NULL,
  `isdefault` bit(1) NULL DEFAULT b'0' COMMENT '0 否\r\n            1 是',
  `isdel` bit(1) NULL DEFAULT b'0' COMMENT '0 否\r\n            1 是 ',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memberaddress
-- ----------------------------

-- ----------------------------
-- Table structure for memberpicksite
-- ----------------------------
DROP TABLE IF EXISTS `memberpicksite`;
CREATE TABLE `memberpicksite`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `psid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memberpicksite
-- ----------------------------

-- ----------------------------
-- Table structure for picksite
-- ----------------------------
DROP TABLE IF EXISTS `picksite`;
CREATE TABLE `picksite`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` decimal(9, 6) NULL DEFAULT NULL,
  `latitude` decimal(9, 6) NULL DEFAULT NULL,
  `photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isHasBusinessLicense` bit(1) NULL DEFAULT b'1' COMMENT '0  没有 \r\n            1  有',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupCount` tinyint(0) NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditTime` timestamp(0) NULL DEFAULT NULL,
  `isAudit` tinyint(0) NULL DEFAULT 0 COMMENT '0 未审核 \r\n            1 审核通过\r\n            2 审核拒绝',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0 尚未营业\r\n            1 正常营业\r\n            2 暂停营业\r\n            ',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picksite
-- ----------------------------

-- ----------------------------
-- Table structure for proivder
-- ----------------------------
DROP TABLE IF EXISTS `proivder`;
CREATE TABLE `proivder`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provideGoods` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isAudit` bit(1) NULL DEFAULT b'0' COMMENT '0 未审核\r\n            1 已审核 ',
  `isdel` bit(1) NULL DEFAULT b'0' COMMENT '0 未删除\r\n            1已删除',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proivder
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(0) NULL DEFAULT 0 COMMENT '0未知\r\n            1 男\r\n            2女\r\n            ',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '1 正常\r\n            2 锁定\r\n            3 禁用\r\n        ',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `isdel` bit(1) NULL DEFAULT b'0' COMMENT '0 未删除\r\n            1已删除',
  `lastLoginTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test1', '123', NULL, 0, NULL, NULL, NULL, 1, '2023-01-05 17:08:06', '2023-01-05 17:08:06', b'1', '2023-01-05 17:08:06');
INSERT INTO `user` VALUES ('64b99f32-8cda-11ed-a63e-98fa9bb10d76', 'test0', '123', 'aaa', 1, NULL, '1234567@qq.com', NULL, 1, '2023-01-05 17:21:53', '2023-01-05 17:21:53', b'0', '2023-01-05 17:21:53');

SET FOREIGN_KEY_CHECKS = 1;
