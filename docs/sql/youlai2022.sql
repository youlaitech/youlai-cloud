/*
 Navicat Premium Data Transfer

 Source Server         : root.youlai.tech
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : www.youlai.tech:3306
 Source Schema         : youlai

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 02/10/2022 12:45:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父节点id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '父节点id路径',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(1:正常;0:禁用)',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除标识(1:已删除;0:未删除)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '有来技术', 0, '0', 1, 1, 0, NULL, NULL);
INSERT INTO `sys_dept` VALUES (2, '研发部门', 1, '0,1', 1, 1, 0, NULL, '2022-04-19 12:46:37');
INSERT INTO `sys_dept` VALUES (161, '市场部', 0, '0', 1, 1, 0, '2022-09-26 20:23:19', '2022-09-26 20:23:19');
INSERT INTO `sys_dept` VALUES (162, '奥德赛', 2, '0,1,2', 1, 1, 0, '2022-09-27 08:49:05', '2022-09-27 08:49:05');
INSERT INTO `sys_dept` VALUES (163, '他', 0, '0', 1, 1, 0, '2022-09-27 14:44:31', '2022-09-27 14:44:31');
INSERT INTO `sys_dept` VALUES (164, 'T', 162, '0,1,2,162', 1, 1, 0, '2022-09-27 15:17:02', '2022-09-27 15:17:02');
INSERT INTO `sys_dept` VALUES (165, 'T', 1, '0,1', 1, 1, 0, '2022-09-27 15:17:15', '2022-09-27 15:17:15');
INSERT INTO `sys_dept` VALUES (166, 'f', 161, '0,161', 1, 1, 0, '2022-09-27 15:21:26', '2022-09-27 15:21:26');
INSERT INTO `sys_dept` VALUES (167, '14231', 165, '0,1,165', 1, 1, 0, '2022-09-27 23:14:52', '2022-09-27 23:14:52');
INSERT INTO `sys_dept` VALUES (168, '23', 167, '0,1,165,167', 1, 1, 0, '2022-09-27 23:15:05', '2022-09-27 23:15:05');
INSERT INTO `sys_dept` VALUES (169, '2344', 168, '0,1,165,167,168', 1, 1, 0, '2022-09-27 23:15:15', '2022-09-27 23:15:15');
INSERT INTO `sys_dept` VALUES (170, '2342', 169, '0,1,165,167,168,169', 1, 1, 0, '2022-09-27 23:15:19', '2022-09-27 23:15:19');
INSERT INTO `sys_dept` VALUES (171, '4694898498489498489498489498', 170, '0,1,165,167,168,169,170', 1, 1, 0, '2022-09-27 23:15:44', '2022-09-27 23:15:44');
INSERT INTO `sys_dept` VALUES (172, '231231', 171, '0,1,165,167,168,169,170,171', 1, 1, 0, '2022-09-27 23:16:12', '2022-09-27 23:16:12');
INSERT INTO `sys_dept` VALUES (173, 'EEE', 162, '0,1,2,162', 1, 1, 0, '2022-09-29 11:07:11', '2022-09-29 11:07:11');

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典项名称',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典项值',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(1:正常;0:禁用)',
  `defaulted` tinyint NULL DEFAULT 0 COMMENT '是否默认(1:是;0:否)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, 'gender', '男', '1', 1, 1, 0, NULL, '2019-05-05 13:07:52', '2022-06-12 23:20:39');
INSERT INTO `sys_dict_item` VALUES (2, 'gender', '女', '2', 2, 1, 0, NULL, '2019-04-19 11:33:00', '2019-07-02 14:23:05');
INSERT INTO `sys_dict_item` VALUES (3, 'gender', '未知', '0', 1, 1, 0, NULL, '2020-10-17 08:09:31', '2020-10-17 08:09:31');
INSERT INTO `sys_dict_item` VALUES (6, 'grant_type', '密码模式', 'password', 1, 1, 0, NULL, '2020-10-17 09:11:52', '2021-01-31 09:48:18');
INSERT INTO `sys_dict_item` VALUES (7, 'grant_type', '授权码模式', 'authorization_code', 1, 1, 0, NULL, '2020-10-17 09:12:15', '2020-12-14 10:11:00');
INSERT INTO `sys_dict_item` VALUES (8, 'grant_type', '客户端模式', 'client_credentials', 1, 1, 0, NULL, '2020-10-17 09:12:36', '2020-12-14 10:11:00');
INSERT INTO `sys_dict_item` VALUES (9, 'grant_type', '刷新模式', 'refresh_token', 1, 1, 0, NULL, '2020-10-17 09:12:57', '2021-01-08 17:33:12');
INSERT INTO `sys_dict_item` VALUES (10, 'grant_type', '简化模式', 'implicit', 1, 1, 0, NULL, '2020-10-17 09:13:23', '2020-12-14 10:11:00');
INSERT INTO `sys_dict_item` VALUES (11, 'micro_service', '系统服务', 'youlai-admin', 1, 1, 0, NULL, '2021-06-17 00:14:12', '2021-06-17 00:14:12');
INSERT INTO `sys_dict_item` VALUES (12, 'micro_service', '会员服务', 'youlai-ums', 2, 1, 0, NULL, '2021-06-17 00:15:06', '2021-06-17 00:15:06');
INSERT INTO `sys_dict_item` VALUES (13, 'micro_service', '商品服务', 'youlai-pms', 3, 1, 0, NULL, '2021-06-17 00:15:26', '2021-06-17 00:16:18');
INSERT INTO `sys_dict_item` VALUES (14, 'micro_service', '订单服务', 'youlai-oms', 4, 1, 0, NULL, '2021-06-17 00:15:40', '2021-06-17 00:16:10');
INSERT INTO `sys_dict_item` VALUES (15, 'micro_service', '营销服务', 'youlai-sms', 5, 1, 0, NULL, '2021-06-17 00:16:01', '2021-06-17 00:16:01');
INSERT INTO `sys_dict_item` VALUES (16, 'request_method', '不限', '*', 1, 1, 0, NULL, '2021-06-17 00:18:34', '2021-06-17 00:18:34');
INSERT INTO `sys_dict_item` VALUES (17, 'request_method', 'GET', 'GET', 2, 1, 0, NULL, '2021-06-17 00:18:55', '2021-06-17 00:18:55');
INSERT INTO `sys_dict_item` VALUES (18, 'request_method', 'POST', 'POST', 3, 1, 0, NULL, '2021-06-17 00:19:06', '2021-06-17 00:19:06');
INSERT INTO `sys_dict_item` VALUES (19, 'request_method', 'PUT', 'PUT', 4, 1, 0, NULL, '2021-06-17 00:19:17', '2021-06-17 00:19:17');
INSERT INTO `sys_dict_item` VALUES (20, 'request_method', 'DELETE', 'DELETE', 5, 1, 0, NULL, '2021-06-17 00:19:30', '2021-06-17 00:19:30');
INSERT INTO `sys_dict_item` VALUES (21, 'request_method', 'PATCH', 'PATCH', 6, 1, 0, NULL, '2021-06-17 00:19:42', '2021-06-17 00:19:42');
INSERT INTO `sys_dict_item` VALUES (22, 'grant_type', '验证码', 'captcha', 1, 1, 0, '', '2022-05-28 11:44:28', '2022-05-28 11:44:28');
INSERT INTO `sys_dict_item` VALUES (57, 'gender', '2', '2', 1, 1, 0, '', '2022-09-06 14:51:41', '2022-09-06 14:51:41');
INSERT INTO `sys_dict_item` VALUES (58, 'tyu', '111', '111', 1, 1, 0, '', '2022-09-13 15:40:48', '2022-09-13 15:40:48');
INSERT INTO `sys_dict_item` VALUES (59, 'tyu', '222', '222', 1, 1, 0, '', '2022-09-13 15:40:59', '2022-09-13 15:40:59');
INSERT INTO `sys_dict_item` VALUES (60, 'grant_type', 'eeee', 'eeee', 1, 1, 0, '', '2022-09-19 15:41:25', '2022-09-19 15:41:25');
INSERT INTO `sys_dict_item` VALUES (61, 'gender', '3333', '333', 1, 1, 0, '', '2022-09-19 16:35:50', '2022-09-19 16:35:50');
INSERT INTO `sys_dict_item` VALUES (62, 'uuuu', '888', '8888', 1, 1, 0, '', '2022-09-26 22:17:11', '2022-09-26 22:17:11');
INSERT INTO `sys_dict_item` VALUES (63, 'gender', '他', '1', 1, 1, 0, '', '2022-09-27 14:58:45', '2022-09-27 14:58:45');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型编码',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态(0:正常;1:禁用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '性别', 'gender', 1, NULL, '2019-12-06 19:03:32', '2022-06-12 16:21:28');
INSERT INTO `sys_dict_type` VALUES (2, '授权方式', 'grant_type', 1, NULL, '2020-10-17 08:09:50', '2021-01-31 09:48:24');
INSERT INTO `sys_dict_type` VALUES (3, '微服务列表', 'micro_service', 1, NULL, '2021-06-17 00:13:43', '2021-06-17 00:17:22');
INSERT INTO `sys_dict_type` VALUES (4, '请求方式', 'request_method', 1, NULL, '2021-06-17 00:18:07', '2021-06-17 00:18:07');
INSERT INTO `sys_dict_type` VALUES (62, '1', '1', 1, NULL, '2022-08-19 09:48:40', '2022-08-19 09:48:40');
INSERT INTO `sys_dict_type` VALUES (64, 'demoTest', 'codeType', 1, NULL, '2022-08-20 16:23:11', '2022-08-20 16:23:11');
INSERT INTO `sys_dict_type` VALUES (67, 'dfsa', 'dsaf', 1, NULL, '2022-09-09 20:13:43', '2022-09-09 20:13:43');
INSERT INTO `sys_dict_type` VALUES (68, 'tyu', 'tyu', 1, NULL, '2022-09-13 15:40:32', '2022-09-13 15:40:32');
INSERT INTO `sys_dict_type` VALUES (69, '', '', 0, NULL, '2022-09-15 22:44:32', '2022-09-15 22:44:32');
INSERT INTO `sys_dict_type` VALUES (73, '123', '123123', 1, NULL, '2022-09-23 13:52:50', '2022-09-23 13:52:50');
INSERT INTO `sys_dict_type` VALUES (74, '666', 'uuuu', 1, NULL, '2022-09-26 22:16:54', '2022-09-26 22:16:54');
INSERT INTO `sys_dict_type` VALUES (75, '22', '33', 1, NULL, '2022-09-27 14:32:30', '2022-09-27 14:32:30');
INSERT INTO `sys_dict_type` VALUES (76, 'sds', 'sds', 1, NULL, '2022-09-29 11:05:45', '2022-09-29 11:05:45');
INSERT INTO `sys_dict_type` VALUES (77, '打', '阿瑟的', 1, NULL, '2022-09-29 16:58:03', '2022-09-29 16:58:03');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单名称',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由路径(浏览器地址栏路径)',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径(vue页面完整路径，省略.vue后缀)',
  `perm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `visible` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0:禁用;1:开启)',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '跳转路径',
  `type` tinyint NULL DEFAULT NULL COMMENT '菜单类型(1:菜单;2:目录;3:外链)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, 'system', 1, 1, '/system/user', 2, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'user', 'system/user/index', NULL, 'user', 1, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'role', 'system/role/index', NULL, 'role', 2, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'cmenu', 'system/menu/index', NULL, 'menu', 3, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (5, 1, '部门管理', 'dept', 'system/dept/index', NULL, 'tree', 4, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (6, 1, '字典管理', 'dict', 'system/dict/index', NULL, 'dict', 5, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (7, 1, '客户端管理', 'client', 'system/client/index', NULL, 'client', 6, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (9, 0, '营销管理', '/sms', 'Layout', NULL, 'number', 5, 1, NULL, 2, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (10, 9, '广告列表', 'advert', 'sms/advert/index', NULL, 'advert', 1, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (11, 0, '商品管理', '/pms', 'Layout', NULL, 'goods', 2, 1, '/pms/goods', 2, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (12, 11, '商品列表', 'goods', 'pms/goods/index', NULL, 'goods-list', 1, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (13, 0, '订单管理', '/oms', 'Layout', NULL, 'shopping', 3, 1, '/oms/order', 2, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (14, 13, '订单列表', 'order', 'oms/order/index', NULL, 'order', 1, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (15, 0, '会员管理', '/ums', 'Layout', NULL, 'user', 4, 1, '/ums/member', 2, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (16, 15, '会员列表', 'member', 'ums/member/index', NULL, 'peoples', 1, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (17, 11, '品牌管理', 'brand', 'pms/brand/index', NULL, 'brand', 5, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (18, 11, '商品分类', 'category', 'pms/category/index', NULL, 'menu', 3, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (19, 11, '商品上架', 'goods-detail', 'pms/goods/detail', NULL, 'publish', 2, 1, NULL, 1, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (20, 0, '多级菜单', '/multi-level-menu', 'Layout', NULL, 'nested', 7, 1, '/nested/level1/level2', 2, '2022-02-16 23:11:00', '2022-02-16 23:11:00');
INSERT INTO `sys_menu` VALUES (21, 20, '菜单一级', 'nested_level1_index', 'nested/level1/index', NULL, '', 1, 1, '/nested/level1/level2', 2, '2022-02-16 23:13:38', '2022-02-16 23:13:38');
INSERT INTO `sys_menu` VALUES (22, 21, '菜单二级', 'nested_level1_level2_index', 'nested/level1/level2/index', NULL, '', 1, 1, '/nested/level1/level2/level3', 2, '2022-02-16 23:14:23', '2022-02-16 23:14:23');
INSERT INTO `sys_menu` VALUES (23, 22, '菜单三级-1', 'nested_level1_level2_level3_index1', 'nested/level1/level2/level3/index1', NULL, '', 1, 1, '', 1, '2022-02-16 23:14:51', '2022-02-16 23:14:51');
INSERT INTO `sys_menu` VALUES (24, 22, '菜单三级-2', 'nested_level1_level2_level3_index2', 'nested/level1/level2/level3/index2', NULL, '', 2, 1, '', 1, '2022-02-16 23:15:08', '2022-02-16 23:15:08');
INSERT INTO `sys_menu` VALUES (26, 0, '外部链接', '/external-link', 'Layout', NULL, 'link', 9, 1, 'noredirect', 2, '2022-02-17 22:51:20', '2022-02-17 22:51:20');
INSERT INTO `sys_menu` VALUES (30, 26, 'document', 'https://www.cnblogs.com/haoxianrui/', '', NULL, 'link', 1, 1, '', 3, '2022-02-18 00:01:40', '2022-02-18 00:01:40');
INSERT INTO `sys_menu` VALUES (32, 0, '实验室', '/lab', 'Layout', NULL, 'lab', 8, 1, 'noredirect', 2, '2022-04-19 09:35:38', '2022-04-19 09:35:38');
INSERT INTO `sys_menu` VALUES (33, 32, 'Seata', 'seata', 'lab/seata/index', NULL, 'security', 1, 1, '', 1, '2022-04-19 09:35:38', '2022-04-19 09:35:38');
INSERT INTO `sys_menu` VALUES (34, 32, 'RabbitMQ', 'rabbitmq', 'lab/rabbit/index', NULL, 'rabbitmq', 3, 1, '', 1, '2022-04-19 09:38:25', '2022-04-19 09:38:25');
INSERT INTO `sys_menu` VALUES (37, 9, '优惠券列表', 'coupon', 'sms/coupon/index', NULL, 'coupon', 2, 1, '', 1, '2022-05-29 00:24:07', '2022-05-29 00:24:07');
INSERT INTO `sys_menu` VALUES (39, 32, 'Sentinel', 'sentinel', 'lab/sentinel/index', NULL, 'security', 2, 1, '', 1, '2022-07-23 09:52:41', '2022-07-23 09:52:41');

-- ----------------------------
-- Table structure for sys_oauth_client
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client`;
CREATE TABLE `sys_oauth_client`  (
  `client_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_token_validity` int NULL DEFAULT NULL,
  `refresh_token_validity` int NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oauth_client
-- ----------------------------
INSERT INTO `sys_oauth_client` VALUES ('client', '', '123456', 'all', 'password,refresh_token', NULL, NULL, 3600, 7200, NULL, 'true', NULL, NULL);
INSERT INTO `sys_oauth_client` VALUES ('mall-admin-web', '', '123456', 'all', 'password,refresh_token,captcha', NULL, '', 3600, 7200, NULL, 'true', NULL, NULL);
INSERT INTO `sys_oauth_client` VALUES ('mall-app', '', '123456', 'all', 'sms_code,refresh_token', NULL, NULL, 3600, 7200, NULL, 'true', NULL, NULL);
INSERT INTO `sys_oauth_client` VALUES ('mall-weapp', '', '123456', 'all', 'wechat,refresh_token', NULL, NULL, 3600, 7200, NULL, 'true', NULL, NULL);
INSERT INTO `sys_oauth_client` VALUES ('youlai-admin', '', '123456', 'all', 'password,client_credentials,refresh_token,authorization_code', NULL, '', 3600, 7200, NULL, 'true', NULL, NULL);
INSERT INTO `sys_oauth_client` VALUES ('youlai-mall-app', '', '123456', 'all', 'authorization_code,password,refresh_token,implicit,wechat,refresh_token', NULL, NULL, 3600, 7200, NULL, 'true', NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `menu_id` int NULL DEFAULT NULL COMMENT '菜单模块ID\r\n',
  `url_perm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL权限标识',
  `btn_perm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮权限标识',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '查看用户', 2, 'GET:/youlai-admin/api/v1/users/*', 'sys:user:view', '2021-02-02 14:16:07', '2021-06-16 22:25:24');
INSERT INTO `sys_permission` VALUES (2, '编辑用户', 2, 'PUT:/youlai-admin/users/*', 'sys:user:edit', '2021-06-16 16:19:44', '2021-06-16 23:36:53');
INSERT INTO `sys_permission` VALUES (3, '新增用户', 2, 'POST:/youlai-admin/api/v1/users', 'sys:user:add', '2021-06-16 23:36:37', '2021-06-16 23:37:03');
INSERT INTO `sys_permission` VALUES (4, '删除用户', 2, 'DELETE:/youlai-admin/api/v1/users/*', 'sys:user:delete', '2021-06-16 23:43:54', '2021-06-16 23:43:54');
INSERT INTO `sys_permission` VALUES (97, '新增角色', 3, NULL, 'sys:role:add', '2022-08-18 14:27:01', '2022-08-18 14:27:01');
INSERT INTO `sys_permission` VALUES (98, '删除用户', 2, NULL, 'sys:user:delete', '2022-08-18 15:42:43', '2022-08-18 15:42:43');
INSERT INTO `sys_permission` VALUES (137, '新增用户', 2, NULL, 'sys:usr:add', '2022-09-13 12:00:47', '2022-09-13 12:00:47');
INSERT INTO `sys_permission` VALUES (138, 'newTest', 2, NULL, 'sys:user:add', '2022-09-13 15:26:08', '2022-09-13 15:26:08');
INSERT INTO `sys_permission` VALUES (139, '1', 12, NULL, '', '2022-09-16 14:41:12', '2022-09-16 14:41:12');
INSERT INTO `sys_permission` VALUES (140, '新增', 10, NULL, 'sys:user:add', '2022-09-22 10:13:03', '2022-09-22 10:13:03');
INSERT INTO `sys_permission` VALUES (141, '12312232', 2, NULL, '123123121', '2022-09-22 11:38:27', '2022-09-22 11:38:27');
INSERT INTO `sys_permission` VALUES (142, '添加角色', 3, NULL, NULL, '2022-09-27 08:43:19', '2022-09-27 08:43:19');
INSERT INTO `sys_permission` VALUES (143, 'r', 2, NULL, NULL, '2022-09-27 10:17:13', '2022-09-27 10:17:13');
INSERT INTO `sys_permission` VALUES (144, '3333', 14, NULL, '333', '2022-09-28 09:51:19', '2022-09-28 09:51:19');
INSERT INTO `sys_permission` VALUES (145, '订单删除', 19, 'DELETE:/youlai-oms', 'shop:order:delete', '2022-09-30 00:34:51', '2022-09-30 00:34:51');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '角色状态(1-正常；0-停用)',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除；1-已删除)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'ROOT', 1, 1, 0, '2021-05-21 14:56:51', '2018-12-23 16:00:00');
INSERT INTO `sys_role` VALUES (2, '系统管理员', 'ADMIN', 2, 1, 0, '2021-03-25 12:39:54', '2022-06-12 23:19:11');
INSERT INTO `sys_role` VALUES (3, '访问游客', 'GUEST', 3, 1, 0, '2021-05-26 15:49:05', '2019-05-05 16:00:00');
INSERT INTO `sys_role` VALUES (108, '开发', 'dev', 0, 1, 0, '2022-09-10 13:51:08', '2022-09-10 13:51:08');
INSERT INTO `sys_role` VALUES (109, '测试', 'test', 4, 1, 0, '2022-09-10 15:00:51', '2022-09-10 15:00:51');
INSERT INTO `sys_role` VALUES (110, '12312', '11111', NULL, 1, 0, '2022-09-12 13:45:07', '2022-09-12 13:45:07');
INSERT INTO `sys_role` VALUES (111, '哈哈', '哈哈哈', NULL, 1, 0, '2022-09-12 21:39:04', '2022-09-12 21:39:04');
INSERT INTO `sys_role` VALUES (112, 'gg', 'gg', 5, 1, 0, '2022-09-12 21:56:33', '2022-09-12 21:56:33');
INSERT INTO `sys_role` VALUES (113, '1', '2', NULL, 1, 0, '2022-09-13 11:03:18', '2022-09-13 11:03:18');
INSERT INTO `sys_role` VALUES (114, '2', '33', 12, 1, 0, '2022-09-13 14:30:36', '2022-09-13 14:30:36');
INSERT INTO `sys_role` VALUES (115, '11', '77', NULL, 1, 0, '2022-09-13 15:21:34', '2022-09-13 15:21:34');
INSERT INTO `sys_role` VALUES (116, '23', '23', NULL, 1, 0, '2022-09-15 14:10:12', '2022-09-15 14:10:12');
INSERT INTO `sys_role` VALUES (117, '111', '111', NULL, 1, 0, '2022-09-15 18:06:58', '2022-09-15 18:06:58');
INSERT INTO `sys_role` VALUES (118, 'ee', 'ee', 1, 1, 0, '2022-09-16 15:19:34', '2022-09-16 15:19:34');
INSERT INTO `sys_role` VALUES (119, '测试权限', 'testR', 1, 1, 0, '2022-09-17 10:59:54', '2022-09-17 10:59:54');
INSERT INTO `sys_role` VALUES (120, '666', '2222', 2, 1, 0, '2022-09-19 10:28:24', '2022-09-19 10:28:24');
INSERT INTO `sys_role` VALUES (121, 'asdf ', 'asdf ', 1, 1, 0, '2022-09-19 20:15:20', '2022-09-19 20:15:20');
INSERT INTO `sys_role` VALUES (122, '仨打', '4534533453453', NULL, 1, 0, '2022-09-20 10:17:35', '2022-09-20 10:17:35');
INSERT INTO `sys_role` VALUES (123, '辅导费564', '445', NULL, 1, 0, '2022-09-20 10:19:42', '2022-09-20 10:19:42');
INSERT INTO `sys_role` VALUES (124, 'abc111', 'abc111', 1, 1, 0, '2022-09-23 17:27:56', '2022-09-23 17:27:56');
INSERT INTO `sys_role` VALUES (126, 'adsfa', 'dsfadsf', 555, 1, 0, '2022-09-29 15:30:32', '2022-09-29 15:30:32');
INSERT INTO `sys_role` VALUES (127, '<script>alert(1)</script>', '<script>alert(2)</script>', 1, 1, 0, '2022-09-29 15:31:03', '2022-09-29 15:31:03');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 13);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 37);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 24);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 39);
INSERT INTO `sys_role_menu` VALUES (2, 34);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 30);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` int NULL DEFAULT NULL COMMENT '资源id',
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (2, 1);
INSERT INTO `sys_role_permission` VALUES (2, 2);
INSERT INTO `sys_role_permission` VALUES (2, 3);
INSERT INTO `sys_role_permission` VALUES (2, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) NULL DEFAULT 1 COMMENT '性别((1:男;2:女))',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '用户状态((1:正常;0:禁用))',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除标识(0:未删除;1:已删除)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '有来技术', 0, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', NULL, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '17621590365', 1, 'youlaitech@163.com', 0, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 'admin', '系统管理员', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 2, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '17621210366', 1, '', 0, '2019-10-10 13:41:22', '2022-07-31 12:39:30');
INSERT INTO `sys_user` VALUES (3, 'test', '测试小用户', 1, '$2a$10$MPJkNw.hKT/fZOgwYP8q9eu/rFJJDsNov697AmdkHNJkpjIpVSw2q', 3, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '17621210366', 1, 'youlaitech@163.com', 0, '2021-06-05 01:31:29', '2021-06-05 01:31:29');
INSERT INTO `sys_user` VALUES (215, 'import', '导入测试用户', 1, '$2a$10$i0YY8SG274ZYDILATITXWOOeJAdCVLQdlt0OU8it2jDsFUTe/8doy', 103, '', '18956235689', 1, '123@163.com', 0, '2022-08-18 00:07:50', '2022-08-18 00:07:50');
INSERT INTO `sys_user` VALUES (249, '游客', 'guest', 1, '$2a$10$ocVDVhlw1Fv7rCnIB4Us2.CQaq7EI6o.kJLOhA1.dMc7tYhFEfhM2', 1, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', NULL, 1, NULL, 0, '2022-09-06 17:35:55', '2022-09-06 17:35:55');
INSERT INTO `sys_user` VALUES (250, '23', 'dd', 1, '$2a$10$MDnNcpJ7INqkXIpa1gnXNeICL40PTWvUweR1jE/2mtql46d7S0Zt.', 136, '', '15512345678', 1, NULL, 0, '2022-09-07 07:59:03', '2022-09-07 07:59:03');
INSERT INTO `sys_user` VALUES (253, '2', '1', 1, '$2a$10$gBwcEEbHKoXMb6UF7g7UiegPf8t3KwGYjpKUEBdtX7DVbD2wvsXo6', 142, '', '18570377166', 1, '3233253872@qq.com', 0, '2022-09-07 22:44:19', '2022-09-07 22:44:19');
INSERT INTO `sys_user` VALUES (254, '1', '1', 0, '$2a$10$meA8vfAm7b923pbC2boG7OMnQyYK53zLxVOEPN2bLcjRO35HGrVKy', 1, '', '13111111111', 1, '1@qq.com', 0, '2022-09-08 14:18:43', '2022-09-08 14:18:43');
INSERT INTO `sys_user` VALUES (259, '测试1', '测试1', 0, '$2a$10$Hp3/LWduX/ZWATvG4/CYc.C5/S9y12HICeuUnTWq3QUQTNghlP4J6', 148, '', NULL, 1, NULL, 0, '2022-09-10 15:01:34', '2022-09-10 15:01:34');
INSERT INTO `sys_user` VALUES (260, '12212', '111111', 1, '$2a$10$si2gZfKhD7s/L2x4nvV6w.d10lgnDzv1j/n0eBVqvcDQ4DOb2lsge', NULL, '', '18076583205', 1, NULL, 0, '2022-09-12 13:53:43', '2022-09-12 13:53:43');
INSERT INTO `sys_user` VALUES (261, '12', '123', 1, '$2a$10$vt/2M8Ds4nF1ih0/Z.uhxOFHhDcicB3ECQdbvkYDsAPHQjbAWx5oy', 142, '', '13467893562', 1, '6789@163.com', 0, '2022-09-13 09:33:16', '2022-09-13 09:33:16');
INSERT INTO `sys_user` VALUES (262, 'test1', '2345', 1, '$2a$10$W.z/tLYU.aU0l3/O/hygMePIToDOFMhlI.X40dU50u6t1NTqUnRUa', 144, '', '15985643544', 1, '456625@163.com', 0, '2022-09-13 09:34:18', '2022-09-13 09:34:18');
INSERT INTO `sys_user` VALUES (263, '11', '11', 1, '$2a$10$rYL.brCYD8AdO4GsLyz.R.51r5fcF2haIwLdbBw9qiw9CUq8RK746', 144, '', NULL, 1, NULL, 0, '2022-09-13 14:50:03', '2022-09-13 14:50:03');
INSERT INTO `sys_user` VALUES (264, '11122', '11', 1, '$2a$10$f80/CgzPBH.tZ32O.qSfaOOKlBj3QT85ZpShT9XPeRv2ksG8RyJWq', 142, '', NULL, 1, NULL, 0, '2022-09-13 15:28:04', '2022-09-13 15:28:04');
INSERT INTO `sys_user` VALUES (265, '3etdr', 'etrdf', 1, '$2a$10$Xs8.xT2KybemZqihpNviG.0UnF1hrjcKuA7FzB7BeekdWUICzPozu', 150, '', '13463461339', 1, '13463461339@163.com', 0, '2022-09-14 11:56:50', '2022-09-14 11:56:50');
INSERT INTO `sys_user` VALUES (266, '韩鲁航', '11', 0, '$2a$10$mDWTzwhpikaNJU2.5YCSou5qDwil2e/oXaaimogZJ6RXp7JLp54ea', 153, '', '18903520145', 1, '3201478521@qq.com', 0, '2022-09-15 09:52:52', '2022-09-15 09:52:52');
INSERT INTO `sys_user` VALUES (267, '2121', '1212', 1, '$2a$10$o1EUzHdzEl7OL.vJR3RhKuxWWOG9PSYkoq9P0e1s7JtNNNpwj6vyW', 152, '', '13525142145', 1, '12212@qq.com', 0, '2022-09-15 11:45:08', '2022-09-15 11:45:08');
INSERT INTO `sys_user` VALUES (268, '测试', '123', 0, '$2a$10$WKGXt/fkBIRB7vazB8RSJ.RFhREoH0InoRZzHOAKkMfnReqwEM6xe', 144, '', '13456543212', 1, '213@12.com', 0, '2022-09-15 14:47:31', '2022-09-15 14:47:31');
INSERT INTO `sys_user` VALUES (269, '张三', '三', 1, '$2a$10$GqvYeyzvFLXfet/AaxOufOgyI.ZrYsKOO5pYxNKgrTCMOqEx3wrcW', 152, '', '15729384782', 1, '2984739238@qq.com', 0, '2022-09-15 15:28:14', '2022-09-15 15:28:14');
INSERT INTO `sys_user` VALUES (270, '李四', '张三', 1, '$2a$10$V506DOPvc83HOMHg.DMYxexu2a61exv4EySZGDipWwED/dXa.rTO6', 1, '', '13624645481', 1, '5665@qq.com', 0, '2022-09-17 12:49:00', '2022-09-17 12:49:00');
INSERT INTO `sys_user` VALUES (271, 'ceshi', '测试', 1, '$2a$10$p9le6Z5fP3uktbY3vGdDEeIp34JvTZecuJEatiLqWDljRebRtrAv6', 1, '', NULL, 1, NULL, 0, '2022-09-20 10:37:47', '2022-09-20 10:37:47');
INSERT INTO `sys_user` VALUES (272, '123', '123', 0, '$2a$10$dhkhklmEtpqfxGbvRXhyZuq241EsMJu/JkHBr1QZWeNxrKLPPfgre', 151, '', '17743033827', 0, '17743033827@163.com', 0, '2022-09-20 12:27:59', '2022-09-20 12:27:59');
INSERT INTO `sys_user` VALUES (273, '456', '56', 1, '$2a$10$iBALTAfG8CeiT5i4oIiUPuq/6fl12UyrXHtJnoZKLsScvheCr/QNe', 153, '', NULL, 1, NULL, 0, '2022-09-20 17:23:19', '2022-09-20 17:23:19');
INSERT INTO `sys_user` VALUES (274, '45', '45', 1, '$2a$10$w2kzGyIGEe1g0BpQYC.aXu743e34GgGT5yvTl1ni.DUdDdLo1XSfC', 153, '', NULL, 1, NULL, 0, '2022-09-20 17:24:54', '2022-09-20 17:24:54');
INSERT INTO `sys_user` VALUES (275, '测试01', '242342', 0, '$2a$10$caWweFpdAqwK10AFsYACIO1vtbgKyvdL.DreOkbrotMdsUjrGyaDe', 159, '', '13599999996', 1, '345345@qq.com', 0, '2022-09-21 15:02:21', '2022-09-21 15:02:21');
INSERT INTO `sys_user` VALUES (276, '用户名', '用户昵称', 1, '$2a$10$XFilT7yuNt8agNDly3kcWenuR9WzrSmNQhqjuQ.wHL.jJAoVynGte', 144, '', '15596589785', 1, '596848889@qq.com', 0, '2022-09-21 16:13:00', '2022-09-21 16:13:00');
INSERT INTO `sys_user` VALUES (277, 'zzzzzzzzzzzzz', 'zzzzzzzzzzzzz', 1, '$2a$10$I37iVMYhll33rPMfiRUCZeYfp0y5np1ThASWu0EAt/COUF3249hBa', 159, '', NULL, 1, NULL, 0, '2022-09-21 22:46:17', '2022-09-21 22:46:17');
INSERT INTO `sys_user` VALUES (278, '123321', '1', 1, '$2a$10$23kLswo6p7FLGcs4fOhBAeMSsYBPKMAQkuX0Gd1te./NQXZbWCsiC', 155, '', '18612332111', 1, '1@12.com', 0, '2022-09-22 17:58:06', '2022-09-22 17:58:06');
INSERT INTO `sys_user` VALUES (279, '123123', '123', 0, '$2a$10$TMiy1i1Lm5aUMdHDACmTfeCRaqkbn7pBIFPN18zcnexuANi8s70UK', 153, '', '18812312312', 1, '123@12.com', 0, '2022-09-22 17:59:16', '2022-09-22 17:59:16');
INSERT INTO `sys_user` VALUES (280, 'aaa', 'aaa', 1, '$2a$10$y8P15WAOsC5iaRRDyKPhkurn8KuEfFX9bMNHKs6ss2o7K9evkqVSK', 152, '', NULL, 1, NULL, 0, '2022-09-22 22:40:40', '2022-09-22 22:40:40');
INSERT INTO `sys_user` VALUES (281, 'aaaa', 'aaaa', 1, '$2a$10$o1IH4XPxC/LhPDz4cgMH6e8RyoW/VdPRe6V068qstCk1/EbMO0DCy', 153, '', NULL, 1, NULL, 0, '2022-09-22 22:41:22', '2022-09-22 22:41:22');
INSERT INTO `sys_user` VALUES (282, 'cs', '11ww', 1, '$2a$10$UYKw5TMes5d/4Ai1WspMUOzXbt41fUppH9MA53B2ClkVr9FWPtGge', 153, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '15827243072', 1, 'xm1999@sina.com', 0, '2022-09-23 09:02:38', '2022-09-23 09:02:38');
INSERT INTO `sys_user` VALUES (283, '112321', '1312312', 1, '$2a$10$kpFb1BoC/lYAtFE4FHUlGuCuJ9Al1MI4APq5QuujUhyWIAPF4hiKm', 153, '', NULL, 1, NULL, 0, '2022-09-23 13:51:55', '2022-09-23 13:51:55');
INSERT INTO `sys_user` VALUES (284, '明宇', '明宇', 1, '$2a$10$gSie8g/6iEXVHYcmwwfSOew0r29CwRbOQO88.EzNRCYRThRrRhGki', 1, '', '15555555555', 1, NULL, 0, '2022-09-24 13:56:50', '2022-09-24 13:56:50');
INSERT INTO `sys_user` VALUES (285, 'qweq', 'qwe', 0, '$2a$10$ErzZ0bAZEUEmdM89Zqu73uW5Z7E4WulQfOYXtzWRPAWm2XsyvHA3q', 153, '', '13324567865', 1, '13324567865@163.com', 0, '2022-09-25 15:31:24', '2022-09-25 15:31:24');
INSERT INTO `sys_user` VALUES (286, '122121', 'DEDD', 1, '$2a$10$A4H8InZqFqTsss6jJ4LDZuEvR3uphfSQDAbbOLVGPMiDuVzu0xwOq', 1, '', '13245678902', 1, '1232343@QQ.com', 0, '2022-09-26 15:46:34', '2022-09-26 15:46:34');
INSERT INTO `sys_user` VALUES (287, 'admin2', 'admin2', 1, '$2a$10$ThPQYm81CIVIcj9GZNsN.Ok6m8/iHeXvxX3KntzvpELPEnOcILft.', 1, '', '13111111111', 1, NULL, 0, '2022-09-26 18:31:57', '2022-09-26 18:31:57');
INSERT INTO `sys_user` VALUES (288, 'manager', '测试', 1, '$2a$10$ciXhOd9DPBZjetaN1y53t.JQjX44Snd2pmP.7NviZaNPDCwxRqEr6', 2, '', '13333333333', 1, NULL, 0, '2022-09-26 20:21:03', '2022-09-26 20:21:03');
INSERT INTO `sys_user` VALUES (289, 'demo', '演示账号', 1, '$2a$10$ywhj97/hhxr7TLsVfaoO4OHKcB4ChDmzxdsJo2eQBpMNwHXYSpdoC', 1, '', '13633333333', 1, NULL, 0, '2022-09-26 20:22:34', '2022-09-26 20:22:34');
INSERT INTO `sys_user` VALUES (290, '124', '33', 1, '$2a$10$FPAWaUR9BB5Khl.gn00GL.a6CazGUOu2QQpdObt9a05djDLEsZEHm', 162, '', '18881832384', 1, NULL, 0, '2022-09-27 15:29:38', '2022-09-27 15:29:38');
INSERT INTO `sys_user` VALUES (291, '4', '3', 0, '$2a$10$7z9ONBvU7diENGm62BT7ouZlz7mQSx0qV8n7mLDDXrTCeUjsO3Loa', 1, '', '18881283483', 1, '11@qq.com', 0, '2022-09-27 16:55:43', '2022-09-27 16:55:43');
INSERT INTO `sys_user` VALUES (292, '2多摄氏度', '2', 1, '$2a$10$J5n90jsxy6/HGDDhbVF7eeiLZBXASqWVxIl042u1KWdxJ41wU0Kiq', 1, '', '17606001719', 1, NULL, 0, '2022-09-28 13:55:02', '2022-09-28 13:55:02');
INSERT INTO `sys_user` VALUES (293, 's', 'sss', 0, '$2a$10$ZJrsxBIajEJ6PRUk.i00Ru/H87sgFHQZlo6Oyqvy0y42bu3jH4SCi', 2, '', NULL, 1, '1170464456@qq.com', 0, '2022-09-29 21:31:24', '2022-09-29 21:31:24');
INSERT INTO `sys_user` VALUES (294, '111', 'xiaomi', 1, '$2a$10$uSSpUNJF8sph8EnG4SZtt.jAn6HWTs36yKxnrHm5oyBAXPfGjZ3t6', 1, '', '23344556677878', 1, '2222222', 0, '2022-09-30 16:44:07', '2022-09-30 16:44:07');
INSERT INTO `sys_user` VALUES (296, '花花', 'xiaomi', 1, '$2a$10$1jR.rhNK09uDGlezloHIluWvJowxwidGclBZaPF8NSyMLE8HyTZJC', 1, '', '23344556677878', 1, '2222222', 0, '2022-09-30 16:47:34', '2022-09-30 16:47:34');
INSERT INTO `sys_user` VALUES (304, '222', 'xiaomi', 1, '$2a$10$uqxGSVFO2uwMqoigB81IOe/fNGtByTA8JyK2lugExZOGbwVfR4sJS', 163, '', '23344556677878', 1, '2222222', 0, '2022-09-30 17:11:24', '2022-09-30 17:11:24');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (99, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (100, 3);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (102, 3);
INSERT INTO `sys_user_role` VALUES (103, 21);
INSERT INTO `sys_user_role` VALUES (104, 21);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (107, 3);
INSERT INTO `sys_user_role` VALUES (108, 2);
INSERT INTO `sys_user_role` VALUES (109, 2);
INSERT INTO `sys_user_role` VALUES (110, 2);
INSERT INTO `sys_user_role` VALUES (111, 3);
INSERT INTO `sys_user_role` VALUES (112, 2);
INSERT INTO `sys_user_role` VALUES (113, 2);
INSERT INTO `sys_user_role` VALUES (114, 21);
INSERT INTO `sys_user_role` VALUES (115, 21);
INSERT INTO `sys_user_role` VALUES (116, 23);
INSERT INTO `sys_user_role` VALUES (116, 24);
INSERT INTO `sys_user_role` VALUES (117, 3);
INSERT INTO `sys_user_role` VALUES (118, 3);
INSERT INTO `sys_user_role` VALUES (119, 24);
INSERT INTO `sys_user_role` VALUES (120, 2);
INSERT INTO `sys_user_role` VALUES (121, 3);
INSERT INTO `sys_user_role` VALUES (121, 22);
INSERT INTO `sys_user_role` VALUES (122, 21);
INSERT INTO `sys_user_role` VALUES (123, 21);
INSERT INTO `sys_user_role` VALUES (125, 26);
INSERT INTO `sys_user_role` VALUES (128, 3);
INSERT INTO `sys_user_role` VALUES (129, 26);
INSERT INTO `sys_user_role` VALUES (130, 2);
INSERT INTO `sys_user_role` VALUES (130, 23);
INSERT INTO `sys_user_role` VALUES (131, 23);
INSERT INTO `sys_user_role` VALUES (134, 21);
INSERT INTO `sys_user_role` VALUES (135, 21);
INSERT INTO `sys_user_role` VALUES (143, 57);
INSERT INTO `sys_user_role` VALUES (144, 58);
INSERT INTO `sys_user_role` VALUES (145, 53);
INSERT INTO `sys_user_role` VALUES (146, 52);
INSERT INTO `sys_user_role` VALUES (149, 43);
INSERT INTO `sys_user_role` VALUES (150, 43);
INSERT INTO `sys_user_role` VALUES (151, 3);
INSERT INTO `sys_user_role` VALUES (158, 43);
INSERT INTO `sys_user_role` VALUES (159, 43);
INSERT INTO `sys_user_role` VALUES (162, 2);
INSERT INTO `sys_user_role` VALUES (162, 43);
INSERT INTO `sys_user_role` VALUES (163, 43);
INSERT INTO `sys_user_role` VALUES (164, 62);
INSERT INTO `sys_user_role` VALUES (165, 61);
INSERT INTO `sys_user_role` VALUES (166, 43);
INSERT INTO `sys_user_role` VALUES (167, 62);
INSERT INTO `sys_user_role` VALUES (168, 61);
INSERT INTO `sys_user_role` VALUES (169, 61);
INSERT INTO `sys_user_role` VALUES (172, 61);
INSERT INTO `sys_user_role` VALUES (174, 61);
INSERT INTO `sys_user_role` VALUES (175, 61);
INSERT INTO `sys_user_role` VALUES (178, 71);
INSERT INTO `sys_user_role` VALUES (179, 61);
INSERT INTO `sys_user_role` VALUES (180, 76);
INSERT INTO `sys_user_role` VALUES (181, 72);
INSERT INTO `sys_user_role` VALUES (184, 8);
INSERT INTO `sys_user_role` VALUES (185, 68);
INSERT INTO `sys_user_role` VALUES (188, 77);
INSERT INTO `sys_user_role` VALUES (189, 69);
INSERT INTO `sys_user_role` VALUES (190, 76);
INSERT INTO `sys_user_role` VALUES (194, 76);
INSERT INTO `sys_user_role` VALUES (195, 69);
INSERT INTO `sys_user_role` VALUES (196, 61);
INSERT INTO `sys_user_role` VALUES (197, 76);
INSERT INTO `sys_user_role` VALUES (197, 77);
INSERT INTO `sys_user_role` VALUES (199, 61);
INSERT INTO `sys_user_role` VALUES (200, 61);
INSERT INTO `sys_user_role` VALUES (206, 61);
INSERT INTO `sys_user_role` VALUES (207, 66);
INSERT INTO `sys_user_role` VALUES (208, 76);
INSERT INTO `sys_user_role` VALUES (209, 69);
INSERT INTO `sys_user_role` VALUES (214, 76);
INSERT INTO `sys_user_role` VALUES (215, 72);
INSERT INTO `sys_user_role` VALUES (218, 3);
INSERT INTO `sys_user_role` VALUES (219, 2);
INSERT INTO `sys_user_role` VALUES (220, 2);
INSERT INTO `sys_user_role` VALUES (221, 91);
INSERT INTO `sys_user_role` VALUES (222, 91);
INSERT INTO `sys_user_role` VALUES (223, 94);
INSERT INTO `sys_user_role` VALUES (224, 91);
INSERT INTO `sys_user_role` VALUES (225, 91);
INSERT INTO `sys_user_role` VALUES (226, 2);
INSERT INTO `sys_user_role` VALUES (226, 3);
INSERT INTO `sys_user_role` VALUES (226, 90);
INSERT INTO `sys_user_role` VALUES (226, 91);
INSERT INTO `sys_user_role` VALUES (226, 92);
INSERT INTO `sys_user_role` VALUES (226, 93);
INSERT INTO `sys_user_role` VALUES (226, 94);
INSERT INTO `sys_user_role` VALUES (226, 95);
INSERT INTO `sys_user_role` VALUES (226, 96);
INSERT INTO `sys_user_role` VALUES (227, 2);
INSERT INTO `sys_user_role` VALUES (228, 90);
INSERT INTO `sys_user_role` VALUES (228, 91);
INSERT INTO `sys_user_role` VALUES (229, 91);
INSERT INTO `sys_user_role` VALUES (230, 2);
INSERT INTO `sys_user_role` VALUES (231, 93);
INSERT INTO `sys_user_role` VALUES (232, 2);
INSERT INTO `sys_user_role` VALUES (233, 3);
INSERT INTO `sys_user_role` VALUES (234, 2);
INSERT INTO `sys_user_role` VALUES (235, 97);
INSERT INTO `sys_user_role` VALUES (236, 92);
INSERT INTO `sys_user_role` VALUES (237, 97);
INSERT INTO `sys_user_role` VALUES (238, 90);
INSERT INTO `sys_user_role` VALUES (238, 92);
INSERT INTO `sys_user_role` VALUES (238, 94);
INSERT INTO `sys_user_role` VALUES (239, 90);
INSERT INTO `sys_user_role` VALUES (240, 3);
INSERT INTO `sys_user_role` VALUES (241, 2);
INSERT INTO `sys_user_role` VALUES (242, 92);
INSERT INTO `sys_user_role` VALUES (242, 93);
INSERT INTO `sys_user_role` VALUES (242, 98);
INSERT INTO `sys_user_role` VALUES (243, 91);
INSERT INTO `sys_user_role` VALUES (243, 92);
INSERT INTO `sys_user_role` VALUES (243, 93);
INSERT INTO `sys_user_role` VALUES (243, 99);
INSERT INTO `sys_user_role` VALUES (244, 2);
INSERT INTO `sys_user_role` VALUES (244, 3);
INSERT INTO `sys_user_role` VALUES (246, 97);
INSERT INTO `sys_user_role` VALUES (246, 98);
INSERT INTO `sys_user_role` VALUES (246, 99);
INSERT INTO `sys_user_role` VALUES (247, 2);
INSERT INTO `sys_user_role` VALUES (247, 3);
INSERT INTO `sys_user_role` VALUES (247, 94);
INSERT INTO `sys_user_role` VALUES (247, 95);
INSERT INTO `sys_user_role` VALUES (247, 101);
INSERT INTO `sys_user_role` VALUES (248, 97);
INSERT INTO `sys_user_role` VALUES (249, 3);
INSERT INTO `sys_user_role` VALUES (250, 104);
INSERT INTO `sys_user_role` VALUES (253, 105);
INSERT INTO `sys_user_role` VALUES (254, 2);
INSERT INTO `sys_user_role` VALUES (254, 104);
INSERT INTO `sys_user_role` VALUES (254, 106);
INSERT INTO `sys_user_role` VALUES (259, 109);
INSERT INTO `sys_user_role` VALUES (260, 108);
INSERT INTO `sys_user_role` VALUES (261, 111);
INSERT INTO `sys_user_role` VALUES (262, 108);
INSERT INTO `sys_user_role` VALUES (263, 109);
INSERT INTO `sys_user_role` VALUES (264, 2);
INSERT INTO `sys_user_role` VALUES (264, 3);
INSERT INTO `sys_user_role` VALUES (265, 2);
INSERT INTO `sys_user_role` VALUES (265, 3);
INSERT INTO `sys_user_role` VALUES (266, 111);
INSERT INTO `sys_user_role` VALUES (267, 110);
INSERT INTO `sys_user_role` VALUES (268, 116);
INSERT INTO `sys_user_role` VALUES (269, 2);
INSERT INTO `sys_user_role` VALUES (270, 117);
INSERT INTO `sys_user_role` VALUES (271, 119);
INSERT INTO `sys_user_role` VALUES (272, 115);
INSERT INTO `sys_user_role` VALUES (273, 123);
INSERT INTO `sys_user_role` VALUES (274, 123);
INSERT INTO `sys_user_role` VALUES (275, 123);
INSERT INTO `sys_user_role` VALUES (276, 115);
INSERT INTO `sys_user_role` VALUES (277, 115);
INSERT INTO `sys_user_role` VALUES (278, 2);
INSERT INTO `sys_user_role` VALUES (279, 2);
INSERT INTO `sys_user_role` VALUES (280, 115);
INSERT INTO `sys_user_role` VALUES (281, 123);
INSERT INTO `sys_user_role` VALUES (282, 123);
INSERT INTO `sys_user_role` VALUES (283, 122);
INSERT INTO `sys_user_role` VALUES (284, 111);
INSERT INTO `sys_user_role` VALUES (285, 122);
INSERT INTO `sys_user_role` VALUES (286, 109);
INSERT INTO `sys_user_role` VALUES (286, 122);
INSERT INTO `sys_user_role` VALUES (287, 3);
INSERT INTO `sys_user_role` VALUES (288, 123);
INSERT INTO `sys_user_role` VALUES (289, 111);
INSERT INTO `sys_user_role` VALUES (290, 123);
INSERT INTO `sys_user_role` VALUES (291, 115);
INSERT INTO `sys_user_role` VALUES (291, 122);
INSERT INTO `sys_user_role` VALUES (292, 115);
INSERT INTO `sys_user_role` VALUES (292, 122);
INSERT INTO `sys_user_role` VALUES (293, 115);
INSERT INTO `sys_user_role` VALUES (293, 116);
INSERT INTO `sys_user_role` VALUES (294, 123);
INSERT INTO `sys_user_role` VALUES (296, 122);
INSERT INTO `sys_user_role` VALUES (304, 111);

-- ----------------------------
-- Triggers structure for table sys_user
-- ----------------------------
DROP TRIGGER IF EXISTS `sys_user_2_update`;
delimiter ;;
CREATE TRIGGER `sys_user_2_update` BEFORE UPDATE ON `sys_user` FOR EACH ROW BEGIN
	IF NEW.id = 2 THEN
		SET NEW.status=OLD.status,NEW.deleted=OLD.deleted,NEW.password=OLD.password;
	END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
