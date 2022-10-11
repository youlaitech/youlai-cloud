/*
 Navicat Premium Data Transfer

 Source Server         : root.youlai.tech
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : www.youlai.tech:3306
 Source Schema         : youlai_cloud

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 12/10/2022 07:39:01
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
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '有来技术', 0, '0', 1, 1, 0, NULL, NULL);
INSERT INTO `sys_dept` VALUES (2, '研发部门', 1, '0,1', 1, 1, 0, NULL, '2022-04-19 12:46:37');
INSERT INTO `sys_dept` VALUES (135, 'aa3', 2, '0,1,2', 1, 1, 0, '2022-09-05 09:57:28', '2022-09-05 09:57:28');
INSERT INTO `sys_dept` VALUES (136, '12', 135, '0,1,2,135', 2, 1, 0, '2022-09-06 10:06:21', '2022-09-06 10:06:21');
INSERT INTO `sys_dept` VALUES (137, 'demo', 0, '0', 2, 1, 0, '2022-09-06 14:14:03', '2022-09-06 14:14:03');
INSERT INTO `sys_dept` VALUES (138, '哦了阿萨', 137, '0,137', 1, 1, 0, '2022-09-06 14:14:19', '2022-09-06 14:14:19');
INSERT INTO `sys_dept` VALUES (139, '啊SADA', 138, '0,137,138', 1, 1, 0, '2022-09-06 14:14:58', '2022-09-06 14:14:58');
INSERT INTO `sys_dept` VALUES (140, '测试123', 135, '0,1,2,135', 1, 0, 0, '2022-09-06 16:34:04', '2022-09-06 16:34:04');
INSERT INTO `sys_dept` VALUES (141, '测试fff', 140, '0,1,2,135,140', 1, 1, 0, '2022-09-06 16:39:10', '2022-09-06 16:39:10');
INSERT INTO `sys_dept` VALUES (142, 'test', 0, '0', 1, 1, 0, '2022-09-06 19:38:04', '2022-09-06 19:38:04');
INSERT INTO `sys_dept` VALUES (143, '111', 1, '0,1', 1, 1, 0, '2022-09-07 10:21:51', '2022-09-07 10:21:51');
INSERT INTO `sys_dept` VALUES (144, '科技发展部', 0, '0', 1, 1, 0, '2022-09-10 14:54:47', '2022-09-10 14:54:47');
INSERT INTO `sys_dept` VALUES (145, '互联网金融部', 0, '0', 2, 1, 0, '2022-09-10 14:55:28', '2022-09-10 14:55:28');
INSERT INTO `sys_dept` VALUES (146, '开发一', 144, '0,144', 1, 1, 0, '2022-09-10 14:58:07', '2022-09-10 14:58:07');
INSERT INTO `sys_dept` VALUES (147, '开发二', 144, '0,144', 2, 1, 0, '2022-09-10 14:58:20', '2022-09-10 14:58:20');
INSERT INTO `sys_dept` VALUES (148, '测试', 144, '0,144', 3, 1, 0, '2022-09-10 14:58:59', '2022-09-10 14:58:59');
INSERT INTO `sys_dept` VALUES (149, '测试开发', 144, '0,144', 4, 1, 0, '2022-09-10 14:59:11', '2022-09-10 14:59:11');

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
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, 'gender', '男', '1', 1, 1, 0, NULL, '2019-05-05 13:07:52', '2022-06-12 23:20:39');
INSERT INTO `sys_dict_item` VALUES (2, 'gender', '女', '2', 2, 1, 0, NULL, '2019-04-19 11:33:00', '2019-07-02 14:23:05');
INSERT INTO `sys_dict_item` VALUES (3, 'gender', '未知', '0', 1, 1, 0, NULL, '2020-10-17 08:09:31', '2020-10-17 08:09:31');

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

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `type` tinyint NULL DEFAULT NULL COMMENT '菜单类型(1-菜单；2-目录；3-外链；4-按钮权限)',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由路径(浏览器地址栏路径)',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径(vue页面完整路径，省略.vue后缀)',
  `perm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示状态(1-显示;0-隐藏)',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `redirect_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '外链路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 2, '/upms', 'Layout', NULL, 1, 1, 'system', '/system/user', '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 1, 'user', 'system/user/index', NULL, 1, 1, 'user', NULL, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 1, 'role', 'system/role/index', NULL, 1, 2, 'role', NULL, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 1, 'cmenu', 'system/menu/index', NULL, 1, 3, 'menu', NULL, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (5, 1, '部门管理', 1, 'dept', 'system/dept/index', NULL, 1, 4, 'tree', NULL, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (6, 1, '字典管理', 1, 'dict', 'system/dict/index', NULL, 1, 5, 'dict', NULL, '2021-08-28 09:12:21', '2021-08-28 09:12:21');
INSERT INTO `sys_menu` VALUES (20, 0, '多级菜单', 2, '/multi-level-menu', 'Layout', NULL, 1, 7, 'nested', '/nested/level1/level2', '2022-02-16 23:11:00', '2022-02-16 23:11:00');
INSERT INTO `sys_menu` VALUES (21, 20, '菜单一级', 2, 'nested_level1_index', 'nested/level1/index', NULL, 1, 1, '', '/nested/level1/level2', '2022-02-16 23:13:38', '2022-02-16 23:13:38');
INSERT INTO `sys_menu` VALUES (22, 21, '菜单二级', 2, 'nested_level1_level2_index', 'nested/level1/level2/index', NULL, 1, 1, '', '/nested/level1/level2/level3', '2022-02-16 23:14:23', '2022-02-16 23:14:23');
INSERT INTO `sys_menu` VALUES (23, 22, '菜单三级-1', 1, 'nested_level1_level2_level3_index1', 'nested/level1/level2/level3/index1', NULL, 1, 1, '', '', '2022-02-16 23:14:51', '2022-02-16 23:14:51');
INSERT INTO `sys_menu` VALUES (24, 22, '菜单三级-2', 1, 'nested_level1_level2_level3_index2', 'nested/level1/level2/level3/index2', NULL, 1, 2, '', '', '2022-02-16 23:15:08', '2022-02-16 23:15:08');
INSERT INTO `sys_menu` VALUES (26, 0, '外部链接', 2, '/external-link', 'Layout', NULL, 1, 9, 'link', 'noredirect', '2022-02-17 22:51:20', '2022-02-17 22:51:20');
INSERT INTO `sys_menu` VALUES (30, 26, 'document', 3, 'https://www.cnblogs.com/haoxianrui/', '', NULL, 1, 1, 'link', '', '2022-02-18 00:01:40', '2022-02-18 00:01:40');

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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'ROOT', 1, 1, 0, '2021-05-21 14:56:51', '2018-12-23 16:00:00');
INSERT INTO `sys_role` VALUES (2, '系统管理员', 'ADMIN', 2, 1, 0, '2021-03-25 12:39:54', '2022-06-12 23:19:11');
INSERT INTO `sys_role` VALUES (3, '访问游客', 'GUEST', 3, 1, 0, '2021-05-26 15:49:05', '2019-05-05 16:00:00');
INSERT INTO `sys_role` VALUES (108, '开发', 'dev', 0, 1, 0, '2022-09-10 13:51:08', '2022-09-10 13:51:08');
INSERT INTO `sys_role` VALUES (109, '测试', 'test', 4, 1, 0, '2022-09-10 15:00:51', '2022-09-10 15:00:51');

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
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '有来技术', 0, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', NULL, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '17621590365', 1, 'youlaitech@163.com', 0, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 'admin', '系统管理员', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 2, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '17621210366', 1, '', 0, '2019-10-10 13:41:22', '2022-07-31 12:39:30');
INSERT INTO `sys_user` VALUES (3, 'test', '测试小用户', 1, '$2a$10$MPJkNw.hKT/fZOgwYP8q9eu/rFJJDsNov697AmdkHNJkpjIpVSw2q', 3, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', '17621210366', 1, 'youlaitech@163.com', 0, '2021-06-05 01:31:29', '2021-06-05 01:31:29');
INSERT INTO `sys_user` VALUES (215, 'import', '导入测试用户', 1, '$2a$10$i0YY8SG274ZYDILATITXWOOeJAdCVLQdlt0OU8it2jDsFUTe/8doy', 103, '', '18956235689', 1, '123@163.com', 0, '2022-08-18 00:07:50', '2022-08-18 00:07:50');
INSERT INTO `sys_user` VALUES (249, '游客', 'guest', 1, '$2a$10$ocVDVhlw1Fv7rCnIB4Us2.CQaq7EI6o.kJLOhA1.dMc7tYhFEfhM2', 1, 'https://s2.loli.net/2022/04/07/gw1L2Z5sPtS8GIl.gif', NULL, 1, NULL, 0, '2022-09-06 17:35:55', '2022-09-06 17:35:55');
INSERT INTO `sys_user` VALUES (250, '23', 'dd', 1, '$2a$10$uB8ULYW47a3yhRItHOuFXO3yzAqP5mDQyITZIls/lCIC1o2RIHE5K', 136, '', '15512345678', 0, NULL, 0, '2022-09-07 07:59:03', '2022-09-07 07:59:03');
INSERT INTO `sys_user` VALUES (253, '2', '1', 1, '$2a$10$gBwcEEbHKoXMb6UF7g7UiegPf8t3KwGYjpKUEBdtX7DVbD2wvsXo6', 142, '', '18570377166', 1, '3233253872@qq.com', 0, '2022-09-07 22:44:19', '2022-09-07 22:44:19');
INSERT INTO `sys_user` VALUES (254, '1', '1', 0, '$2a$10$meA8vfAm7b923pbC2boG7OMnQyYK53zLxVOEPN2bLcjRO35HGrVKy', 1, '', '13111111111', 1, '1@qq.com', 0, '2022-09-08 14:18:43', '2022-09-08 14:18:43');
INSERT INTO `sys_user` VALUES (259, '测试1', '测试1', 0, '$2a$10$Hp3/LWduX/ZWATvG4/CYc.C5/S9y12HICeuUnTWq3QUQTNghlP4J6', 148, '', NULL, 1, NULL, 0, '2022-09-10 15:01:34', '2022-09-10 15:01:34');

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
