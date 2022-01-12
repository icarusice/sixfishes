/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : sixfishes

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 12/01/2022 23:42:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for depository
-- ----------------------------
DROP TABLE IF EXISTS `depository`;
CREATE TABLE `depository`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '仓库名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '仓库地址',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '仓库介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depository
-- ----------------------------
INSERT INTO `depository` VALUES (1, '小商品仓库', '浙江省义乌市', '存放各种小商品');
INSERT INTO `depository` VALUES (2, '外芯仓库', '浙江省义乌市', '存放各类芯片，义乌高新科技的中转仓');
INSERT INTO `depository` VALUES (3, '家电仓库', '浙江省义乌市', '存放家电');
INSERT INTO `depository` VALUES (4, '服装仓库', '浙江省义乌市', '存放服装');
INSERT INTO `depository` VALUES (5, 'aaaa', 'dddd', 'dddd');

-- ----------------------------
-- Table structure for depository_record
-- ----------------------------
DROP TABLE IF EXISTS `depository_record`;
CREATE TABLE `depository_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `application_id` int(11) NULL DEFAULT NULL COMMENT '申请编号(暂时无用)',
  `mname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `depository_id` int(11) NOT NULL COMMENT '调度的仓库id',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '调度记录类型（0出库，1入库)',
  `quantity` double NULL DEFAULT NULL COMMENT '数量',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（待审核/审核未通过，未入库/出库/检验不通过，待验收/已入库/已出库）',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '申请人id',
  `apply_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请备注',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `reviewer_id` int(11) NULL DEFAULT NULL COMMENT '审核人id',
  `review_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果备注',
  `review_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `review_pass` int(11) NULL DEFAULT NULL COMMENT '审核是否通过，0表示未通过，1表示通过',
  `checker_id` int(11) NULL DEFAULT NULL COMMENT '验货人id',
  `check_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收备注',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '出入库时间（验货时间）',
  `check_pass` int(11) NULL DEFAULT NULL COMMENT '验收是否通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库调度记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depository_record
-- ----------------------------
INSERT INTO `depository_record` VALUES (10, 0, '自研芯片', 1, 1, 10, 9, '待验收', 1, '材料进货', '2021-06-10 11:39:16', 2, '审核通过！', '2021-06-10 11:37:00', 1, 3, '验证通过', NULL, NULL);
INSERT INTO `depository_record` VALUES (11, 0, '手机', 1, 1, 10, 9, '已入库', 1, '材料进货', '2021-06-12 14:53:18', 2, '审核通过！', '2021-06-14 15:57:30', 1, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (12, 0, '衣服A', 4, 1, 123, 123, '审核未通过', 2, '材料进货', '2021-06-04 10:34:05', 2, '', '2021-10-05 15:34:42', 0, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (13, 0, '衣服A', 4, 0, 123, 12312, '待验收', 2, '材料领取', '2021-06-04 10:36:58', 2, '', '2021-10-19 15:22:22', 1, 13, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (14, 0, '骁龙888', 2, 0, 123, 123, '待验收', 2, '材料领取', '2021-06-04 11:36:18', 2, '审核通过', '2021-06-14 16:10:23', 1, 2, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (15, 0, '麒麟9000', 2, 0, 10, 10000, '待审核', 2, '材料领取', '2021-06-05 11:42:50', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (19, 0, '麒麟9000', 2, 1, 10, 10000, '已入库', 2, '材料进货', '2021-06-12 14:52:28', 2, '审核通过', '2021-06-14 16:12:51', 1, 2, '验收通过', '2021-06-16 10:05:17', 1);
INSERT INTO `depository_record` VALUES (20, 0, '儿童服装b', 4, 0, 123, 123, '审核未通过', 2, '材料领取', '2021-06-12 14:52:31', 3, '缺少必要材料，审核不通过！', '2021-06-17 15:57:16', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (24, 0, '骁龙870', 1, 0, 3, 1500, '待审核', 2, '材料出库', '2021-06-12 14:52:34', 2, '通过', '2021-06-12 17:09:26', 1, 2, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (26, 0, '骁龙870', 1, 0, 3, 1500, '审核未通过', 1, '材料进货', '2021-06-12 14:52:54', 2, '', '2021-10-05 15:34:30', 0, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (27, 0, '骁龙870', 1, 0, 3, 1500, '待审核', 1, '材料进货', '2021-06-12 14:52:58', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (28, 0, '天玑1200', 1, 0, 10, 1000, '待审核', 1, '材料进货', '2021-06-12 14:53:01', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (29, 0, '天玑1200+', 1, 0, 10, 1000, '待审核', 1, '材料进货', '2021-06-12 14:53:04', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (31, 0, '天玑1000', 1, 1, 10, 1000, '已入库', 1, '材料进货', '2021-06-10 11:39:12', 3, '2', '2021-06-17 11:36:20', 1, 3, '验证通过', '2021-06-18 11:36:44', 1);
INSERT INTO `depository_record` VALUES (32, 0, '天玑1000', 1, 1, 10, 1000, '已入库', 1, '材料进货', '2021-06-10 11:39:12', 3, '2', '2021-06-17 11:36:20', 1, 3, '验证通过', '2021-06-18 11:36:44', 1);
INSERT INTO `depository_record` VALUES (33, 0, '芯片b', 1, 1, 10, 800, '待审核', 1, '芯片必须尽快进厂', '2021-06-10 19:56:16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (34, 0, '牛排', 3, 1, 120, 12030, '待审核', 1, '顶级牛排，老板要求', '2021-06-10 20:01:56', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (35, 0, '天玑1200', 1, 1, 10, 1000, '已入库', 1, '材料进货', '2021-06-10 11:39:12', 3, '2', '2021-06-17 11:36:20', 1, 3, '验证通过', '2021-06-18 11:36:44', 1);
INSERT INTO `depository_record` VALUES (36, 0, '天玑1200', 1, 1, 10, 1000, '已入库', 1, '材料进货', '2021-06-10 11:39:12', 3, '2', '2021-06-17 11:36:20', 1, 3, '验证通过', '2021-06-18 11:36:44', 1);
INSERT INTO `depository_record` VALUES (37, 0, '天玑1200', 1, 1, 10, 1000, '已入库', 1, '材料进货', '2021-06-10 11:39:12', 3, '2', '2021-06-17 11:36:20', 1, 3, '验证通过', '2021-06-18 11:36:44', 1);
INSERT INTO `depository_record` VALUES (39, 0, '冰箱', 3, 0, 3, 6000, '审核未通过', 2, '材料领取', '2021-06-05 11:42:50', 2, '审核不通过！', '2021-06-14 16:21:29', 0, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (40, 0, '电扇', 2, 0, 5, 1000, '已出库', 2, '材料领取', '2021-06-04 11:36:18', 2, '审核通过', '2021-06-16 10:00:59', 1, 2, '审核通过', '2021-06-16 10:03:57', 1);
INSERT INTO `depository_record` VALUES (41, 0, '冰柜', 2, 0, 4, 4000, '待验收', 2, '材料领取', '2021-06-04 11:36:18', 2, '审核通过', '2021-06-14 16:10:23', 1, 2, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (42, 0, '衣服A', 4, 1, 123, 123, '待审核', 2, '材料进货', '2021-06-04 10:34:05', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (43, 0, '衣服A', 4, 1, 123, 123, '待验收', 2, '材料进货', '2021-06-04 10:34:05', 2, '', '2021-10-23 11:50:53', 1, 13, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (44, 0, '衣服A', 4, 1, 123, 123, '待验收', 2, '材料进货', '2021-06-04 10:34:05', 2, '', '2021-10-23 11:49:29', 1, 23, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (45, 0, '衣服A', 4, 1, 123, 123, '待审核', 2, '材料进货', '2021-06-04 10:34:05', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (46, NULL, 'fff', 4, 1, 2, 2222, '待审核', 2, '', '2021-10-05 15:14:50', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (47, NULL, 'fff', 4, 1, 4, 44, '待审核', 2, '', '2021-10-19 15:20:13', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (48, NULL, 'fffd', 5, 1, 33, 1111, '待审核', 2, '', '2021-10-23 11:47:03', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (49, NULL, 'fff', 5, 0, 22, 222, '待审核', 2, '', '2021-10-23 11:47:33', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (50, NULL, 'fff', 5, 1, 55, 555, '待审核', 20, '', '2021-10-23 13:19:54', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (51, NULL, 'fff', 5, 1, 55, 66, '已入库', 15, '', '2021-10-23 13:21:25', 17, '审核通过', '2021-10-23 13:22:09', 1, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (52, NULL, '123', 5, 1, 123, 123, '待验收', 1, '', '2021-10-23 13:26:00', 17, '', '2021-11-29 16:49:30', 1, 24, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (53, NULL, '童装', 4, 1, 100, 1000, '待验收', 1, '', '2021-10-23 13:28:07', 17, '', '2021-10-23 13:28:56', 1, 13, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (54, NULL, 'ff', 5, 0, 1000, 10000, '待审核', 2, '', NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (55, NULL, 'ff', 2, 1, 1000, 10000, '已入库', 2, '', NULL, 21, '', '2021-11-29 12:02:37', 1, 17, '', '2021-11-29 16:59:15', 1);
INSERT INTO `depository_record` VALUES (56, NULL, '天玑1000', 2, 0, 1, 1000, '待审核', 2, '', NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (58, NULL, '天玑1000', 2, 0, 1, 1000, '待审核', 2, '', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (60, NULL, '天玑1000', 2, 0, 1, 1000, '待审核', 2, '', '2021-12-20 20:15:18', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (61, NULL, '天玑1000', 2, 0, 1, 1000, '已出库', 2, '', '2021-12-20 20:19:31', 12, '', '2021-12-20 20:42:13', 1, 3, '', '2021-12-20 20:56:59', 1);
INSERT INTO `depository_record` VALUES (63, NULL, '天玑1000', 2, 0, 1, 1000, '待验收', 2, '', '2021-12-20 21:54:32', 12, '', '2021-12-20 21:55:02', 1, 3, NULL, NULL, NULL);
INSERT INTO `depository_record` VALUES (65, NULL, '天玑1000', 2, 0, 1, 1000, '已出库', 2, '', '2021-12-20 22:01:46', 12, '', '2021-12-20 22:02:33', 1, 3, '', '2021-12-20 22:03:45', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `authority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表示权限等级（游客/员工/审核员/仓管员/系统管理员）',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录密码（数据库存储的是加密后的）',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `depository_id` int(11) NULL DEFAULT NULL COMMENT '负责仓库，序号表示仓库id，0表示全部仓库',
  `entry_date` date NOT NULL COMMENT '入职日期',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '小张', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', '男', -1, '2021-05-26', '767564319@qq.com', '13173812312');
INSERT INTO `user` VALUES (2, '张三', '仓管员', 'e10adc3949ba59abbe56e057f20f883e', '男', 1, '2021-05-19', '123456@qq.com', '13173812311');
INSERT INTO `user` VALUES (3, '外芯仓库负责人李四', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '1234567@qq.com', '12345678912');
INSERT INTO `user` VALUES (10, '外芯仓库负责人李五', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '12367@qq.com', '12345678912');
INSERT INTO `user` VALUES (11, '外芯仓库负责人李六', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '1@qq.com', '12345678912');
INSERT INTO `user` VALUES (12, '外芯仓库负责人李七', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '12@qq.com', '12345678912');
INSERT INTO `user` VALUES (13, '服装仓库-王五', '仓管员', 'e10adc3949ba59abbe56e057f20f883e', '男', 4, '2021-05-18', '123@qq.com', '12345678912');
INSERT INTO `user` VALUES (15, '赵六', '仓管员', 'e10adc3949ba59abbe56e057f20f883e', '女', 3, '2021-05-18', '12345@qq.com', '12345678912');
INSERT INTO `user` VALUES (17, '李八', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '12345678@qq.com', '12345678912');
INSERT INTO `user` VALUES (19, '李九', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '1234567899@qq.com', '12345678912');
INSERT INTO `user` VALUES (20, '李十', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '12345678998@qq.com', '12345678912');
INSERT INTO `user` VALUES (21, '李二', '审核人', 'e10adc3949ba59abbe56e057f20f883e', '男', 2, '2021-05-18', '123456789987@qq.com', '12345678912');
INSERT INTO `user` VALUES (22, '金昊霖', '游客', 'e10adc3949ba59abbe56e057f20f883e', '男', -1, '2021-06-14', '1234567f@qq.com', '12345678851');
INSERT INTO `user` VALUES (23, 'King', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', '男', 4, '2021-06-14', '123saf@qq.com', '12345678912');
INSERT INTO `user` VALUES (24, 'icarus', '仓管员', 'e10adc3949ba59abbe56e057f20f883e', '男', 5, '2021-12-23', '1542826077@qq.com', '13266023043');

SET FOREIGN_KEY_CHECKS = 1;
