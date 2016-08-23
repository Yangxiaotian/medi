/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.143 mysql
Source Server Version : 50516
Source Host           : 192.168.1.143:3306
Source Database       : bmc_ver_0.2.3

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2014-11-10 09:26:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bmc_com_att`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_com_att`;
CREATE TABLE `bmc_com_att` (
  `aid` char(36) NOT NULL,
  `bcode` varchar(32) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL COMMENT '附件类型',
  `dpath` varchar(255) DEFAULT NULL,
  `parts` int(11) DEFAULT NULL,
  `lpartno` int(11) DEFAULT NULL,
  `totalsize` bigint(20) DEFAULT NULL,
  `uptime` datetime DEFAULT NULL,
  `smode` char(1) DEFAULT NULL,
  `create_ou` varchar(20) DEFAULT NULL,
  `create_op` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `type` (`type`),
  KEY `bcode` (`bcode`,`bid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1.smode存储方式: 0-文件系统, 1-数据库系统,默认为DB\r\n2.lpartno是从0开始的,上传完';

-- ----------------------------
-- Records of bmc_com_att
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_com_dict`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_com_dict`;
CREATE TABLE `bmc_com_dict` (
  `dno` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `level_` varchar(8) DEFAULT NULL,
  `appno` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_com_dict
-- ----------------------------
INSERT INTO `bmc_com_dict` VALUES ('bcode', '业务点分类', 'tree', null, 'bmc-com');
INSERT INTO `bmc_com_dict` VALUES ('data_type', '数据类型', 'basic', null, 'bmc-com');
INSERT INTO `bmc_com_dict` VALUES ('dict_type', '字典类型', 'basic', null, 'bmc-com');
INSERT INTO `bmc_com_dict` VALUES ('gender', '性别', 'basic', null, 'bmc-com');
INSERT INTO `bmc_com_dict` VALUES ('grid_type', '表格类型', 'basic', null, 'bmc-dc');
INSERT INTO `bmc_com_dict` VALUES ('logic_mode', '逻辑模式', 'basic', null, 'bmc-dc');
INSERT INTO `bmc_com_dict` VALUES ('logic_type', 'SQL类型', 'basic', null, 'bmc-dc');
INSERT INTO `bmc_com_dict` VALUES ('org_type', '机构类型', 'basic', null, 'bmc-core');
INSERT INTO `bmc_com_dict` VALUES ('user_state', '用户状态', 'basic', null, 'bmc-core');
INSERT INTO `bmc_com_dict` VALUES ('proc_type', '流程类型', 'basic', NULL, 'bmc-process');
INSERT INTO `bmc_com_dict` VALUES ('node_type', '流程节点类型', 'basic', NULL, 'bmc-process');
INSERT INTO `bmc_com_dict` VALUES ('proc_status', '流程状态', 'basic', NULL, 'bmc-process');
INSERT INTO `bmc_com_dict` VALUES ('proc_result', '流程结果', 'basic', NULL, 'bmc-process');
INSERT INTO `bmc_com_dict` VALUES ('proc_code', '流程代码', 'basic', NULL, 'bmc-process');
INSERT INTO `bmc_com_dict` VALUES ('enterprise_type', '企业类型', 'basic', NULL, 'bmc-core');
INSERT INTO `bmc_com_dict` VALUES ('unit_class', '单位级别', 'basic', NULL, 'bmc-core');
-- ----------------------------
-- Table structure for `bmc_com_dict_basic`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_com_dict_basic`;
CREATE TABLE `bmc_com_dict_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dno` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_com_dict_basic` (`dno`),
  CONSTRAINT `bmc_com_dict_basic_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `bmc_com_dict` (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_com_dict_basic
-- ----------------------------
INSERT INTO `bmc_com_dict_basic` VALUES ('7', 'org_type', '组织', 'org');
INSERT INTO `bmc_com_dict_basic` VALUES ('8', 'org_type', '部门', 'dept');
INSERT INTO `bmc_com_dict_basic` VALUES ('9', 'dict_type', '基础字典', 'basic');
INSERT INTO `bmc_com_dict_basic` VALUES ('10', 'dict_type', '树形字典', 'tree');
INSERT INTO `bmc_com_dict_basic` VALUES ('11', 'gender', '男', 'M');
INSERT INTO `bmc_com_dict_basic` VALUES ('12', 'gender', '女', 'F');
INSERT INTO `bmc_com_dict_basic` VALUES ('13', 'gender', '其他', 'O');
INSERT INTO `bmc_com_dict_basic` VALUES ('14', 'user_state', '有效', '01');
INSERT INTO `bmc_com_dict_basic` VALUES ('15', 'user_state', '锁定', '02');
INSERT INTO `bmc_com_dict_basic` VALUES ('16', 'user_state', '失效', '03');
INSERT INTO `bmc_com_dict_basic` VALUES ('17', 'grid_type', '汇总报表', '01');
INSERT INTO `bmc_com_dict_basic` VALUES ('18', 'grid_type', '业务单据', '02');
INSERT INTO `bmc_com_dict_basic` VALUES ('19', 'grid_type', '数据报送', '03');
INSERT INTO `bmc_com_dict_basic` VALUES ('20', 'logic_type', '查询', 'select');
INSERT INTO `bmc_com_dict_basic` VALUES ('21', 'logic_type', '新增', 'insert');
INSERT INTO `bmc_com_dict_basic` VALUES ('22', 'logic_type', '修改', 'update');
INSERT INTO `bmc_com_dict_basic` VALUES ('23', 'logic_mode', '自定义Sql', 'sql');
INSERT INTO `bmc_com_dict_basic` VALUES ('24', 'logic_mode', 'Web服务', 'web');
INSERT INTO `bmc_com_dict_basic` VALUES ('25', 'data_type', '自动', 'auto');
INSERT INTO `bmc_com_dict_basic` VALUES ('26', 'data_type', '文本', 'string');
INSERT INTO `bmc_com_dict_basic` VALUES ('27', 'data_type', '整数', 'int');
INSERT INTO `bmc_com_dict_basic` VALUES ('28', 'data_type', '小数', 'double');
INSERT INTO `bmc_com_dict_basic` VALUES ('29', 'data_type', '日期', 'date');
INSERT INTO `bmc_com_dict_basic` VALUES ('30', 'data_type', '时刻', 'datetime');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_type', '模板', 'model');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_type', '流程实体', 'entity');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'node_type', '开始节点', 'start');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'node_type', '普通节点', 'normal');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'node_type', '结束节点', 'end');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_status', '已结束', 'done');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_status', '进行中', 'doing');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_status', '未进行', 'todo');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_result', '同意', 'YES');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'proc_result', '不同意', 'NO');
INSERT INTO `bmc_com_dict_basic` VALUES (300, 'enterprise_type', '国有企业', 'gyqy');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'enterprise_type', '集体企业', 'jtqy');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'enterprise_type', '政府机关', 'zfjg');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'enterprise_type', '事业单位', 'sydw');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'unit_class', '一级单位', 'unit_classA');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'unit_class', '二级单位', 'unit_classB');
INSERT INTO `bmc_com_dict_basic` VALUES (0, 'unit_class', '二级以下', 'unit_classC');
-- ----------------------------
-- Table structure for `bmc_com_dict_tree`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_com_dict_tree`;
CREATE TABLE `bmc_com_dict_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dno` varchar(32) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` varchar(32) DEFAULT NULL,
  `fpath` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_com_dict_tree` (`dno`),
  CONSTRAINT `bmc_com_dict_tree_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `bmc_com_dict` (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_com_dict_tree
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_com_nc_hi`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_com_nc_hi`;
CREATE TABLE `bmc_com_nc_hi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ndt` datetime DEFAULT NULL,
  `cdt` datetime DEFAULT NULL,
  `uid_` varchar(32) DEFAULT NULL,
  `amid` varchar(100) DEFAULT NULL,
  `title` varchar(16) DEFAULT NULL,
  `brief` varchar(16) DEFAULT NULL,
  `body` varchar(64) DEFAULT NULL,
  `app` varchar(64) DEFAULT NULL,
  `inst` varchar(32) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nc_hi` (`ndt`,`uid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息中心历史队列\r\nstate 0 未读 1 已读';

-- ----------------------------
-- Records of bmc_com_nc_hi
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_com_nc_ru`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_com_nc_ru`;
CREATE TABLE `bmc_com_nc_ru` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ndt` datetime DEFAULT NULL,
  `cdt` datetime DEFAULT NULL,
  `uid_` varchar(32) DEFAULT NULL,
  `amid` varchar(100) DEFAULT NULL,
  `title` varchar(16) DEFAULT NULL,
  `brief` varchar(16) DEFAULT NULL,
  `body` varchar(64) DEFAULT NULL,
  `app` varchar(64) DEFAULT NULL,
  `inst` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nc_ru` (`ndt`,`uid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息中心实时队列';

-- ----------------------------
-- Records of bmc_com_nc_ru
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_core_app`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_app`;
CREATE TABLE `bmc_core_app` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `appno` varchar(32) NOT NULL,
  `pno` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `ver` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_app
-- ----------------------------
INSERT INTO `bmc_core_app` VALUES (1, 'bmc-core', null, '系统管理', 0, '0.2.2');
INSERT INTO `bmc_core_app` VALUES (2, 'bmc-dc', 'bmc-core', '数据中心', 1, '0.2.2');
INSERT INTO `bmc_core_app` VALUES (3, 'process', 'bmc-core', '流程管理', 2, '0.2.3');

-- ----------------------------
-- Table structure for `bmc_core_app_fun`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_app_fun`;
CREATE TABLE `bmc_core_app_fun` (
  `amfid` varchar(64) NOT NULL,
  `amid` varchar(48) DEFAULT NULL,
  `fno` varchar(16) DEFAULT NULL,
  `mno` varchar(16) DEFAULT NULL,
  `appno` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`amfid`),
  KEY `idx_app_fun` (`fno`,`mno`),
  KEY `idx_app_fun_amid` (`amid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_app_fun
-- ----------------------------
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/createApp', 'bmc-core/app', 'createApp', 'app', 'bmc-core', '添加应用', '1');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/createFun', 'bmc-core/app', 'createFun', 'app', 'bmc-core', '添加功能', '7');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/createModule', 'bmc-core/app', 'createModule', 'app', 'bmc-core', '添加模块', '4');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/deleteApp', 'bmc-core/app', 'deleteApp', 'app', 'bmc-core', '删除应用', '3');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/deleteFun', 'bmc-core/app', 'deleteFun', 'app', 'bmc-core', '删除功能', '9');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/deleteModule', 'bmc-core/app', 'deleteModule', 'app', 'bmc-core', '删除模块', '6');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/start', 'bmc-core/app', 'start', 'app', 'bmc-core', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/updateApp', 'bmc-core/app', 'updateApp', 'app', 'bmc-core', '编辑应用', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/updateFun', 'bmc-core/app', 'updateFun', 'app', 'bmc-core', '编辑功能', '8');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/app/updateModule', 'bmc-core/app', 'updateModule', 'app', 'bmc-core', '编辑模块', '5');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/auth/createRole', 'bmc-core/auth', 'createRole', 'auth', 'bmc-core', '创建角色', '1');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/auth/deleteRole', 'bmc-core/auth', 'deleteRole', 'auth', 'bmc-core', '删除角色', '3');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/auth/grantRoleFun', 'bmc-core/auth', 'createRoleFun', 'auth', 'bmc-core', '授予功能', '4');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/auth/revokeRoleFun', 'bmc-core/auth', 'deleteRoleFun', 'auth', 'bmc-core', '收回功能', '5');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/auth/start', 'bmc-core/auth', 'start', 'auth', 'bmc-core', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/auth/updateRole', 'bmc-core/auth', 'updateRole', 'auth', 'bmc-core', '编辑角色', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/org/create', 'bmc-core/org', 'create', 'org', 'bmc-core', '添加机构', '1');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/org/delete', 'bmc-core/org', 'delete', 'org', 'bmc-core', '删除机构', '3');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/org/start', 'bmc-core/org', 'start', 'org', 'bmc-core', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/org/update', 'bmc-core/org', 'update', 'org', 'bmc-core', '编辑机构', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/auth', 'bmc-core/user', 'auth', 'user', 'bmc-core', '授权', '10');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/create', 'bmc-core/user', 'create', 'user', 'bmc-core', '添加用户', '1');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/delete', 'bmc-core/user', 'delete', 'user', 'bmc-core', '删除用户', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/grantFun', 'bmc-core/user', 'grantFun', 'user', 'bmc-core', '授予功能', '8');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/grantRole', 'bmc-core/user', 'grantRole', 'user', 'bmc-core', '授予角色', '6');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/lock', 'bmc-core/user', 'lock', 'user', 'bmc-core', '锁定用户', '3');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/resetPwd', 'bmc-core/user', 'resetPwd', 'user', 'bmc-core', '重置密码', '11');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/revokeFun', 'bmc-core/user', 'revokeFun', 'user', 'bmc-core', '收回功能', '9');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/revokeRole', 'bmc-core/user', 'revokeRole', 'user', 'bmc-core', '收回角色', '7');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/start', 'bmc-core/user', 'start', 'user', 'bmc-core', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/unlock', 'bmc-core/user', 'unlock', 'user', 'bmc-core', '解锁用户', '4');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/user/update', 'bmc-core/user', 'update', 'user', 'bmc-core', '编辑用户', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/dict/start', 'bmc-dc/dict', 'start', 'dict', 'bmc-dc', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/ext/start', 'bmc-dc/ext', 'start', 'ext', 'bmc-dc', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/grid/createTpl', 'bmc-dc/grid', 'createTpl', 'grid', 'bmc-dc', '新增模板', '1');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/grid/deleteTpl', 'bmc-dc/grid', 'deleteTpl', 'grid', 'bmc-dc', '删除模板', '3');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/grid/start', 'bmc-dc/grid', 'start', 'grid', 'bmc-dc', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/grid/updateTpl', 'bmc-dc/grid', 'updateTpl', 'grid', 'bmc-dc', '更新模板', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/grid/updateTplXml', 'bmc-dc/grid', 'updateTplXml', 'grid', 'bmc-dc', '编辑样式', '4');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/logic/create', 'bmc-dc/logic', 'create', 'logic', 'bmc-dc', '新增', '1');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/logic/delete', 'bmc-dc/logic', 'delete', 'logic', 'bmc-dc', '删除', '3');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/logic/start', 'bmc-dc/logic', 'start', 'logic', 'bmc-dc', '启动', '0');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/logic/update', 'bmc-dc/logic', 'update', 'logic', 'bmc-dc', '更新', '2');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/logic/updateScript', 'bmc-dc/logic', 'updateScript', 'logic', 'bmc-dc', '编辑脚本', '4');
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-dc/dict/att/delete', 'bmc-dc/dict', 'att/delete', 'dict', 'bmc-dc', '附件删除', '10');
INSERT INTO `bmc_core_app_fun` VALUES ('process/tpl/create', 'process/tpl', 'create', 'tpl', 'process', '创建', 1);
INSERT INTO `bmc_core_app_fun` VALUES ('process/tpl/delete', 'process/tpl', 'delete', 'tpl', 'process', '删除', 3);
INSERT INTO `bmc_core_app_fun` VALUES ('process/tpl/start', 'process/tpl', 'start', 'tpl', 'process', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('process/tpl/update', 'process/tpl', 'update', 'tpl', 'process', '编辑', 2);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/level/create', 'bmc-core/level', 'create', 'level', 'bmc-core', '添加职级管理', 1);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/level/delete', 'bmc-core/level', 'delete', 'level', 'bmc-core', '删除职级管理', 3);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/level/start', 'bmc-core/level', 'start', 'level', 'bmc-core', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/level/update', 'bmc-core/level', 'update', 'level', 'bmc-core', '更新职级管理', 2);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/people/create', 'bmc-core/people', 'create', 'people', 'bmc-core', '新增人员', 1);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/people/delete', 'bmc-core/people', 'delete', 'people', 'bmc-core', '删除人员', 3);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/people/start', 'bmc-core/people', 'start', 'people', 'bmc-core', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-core/people/update', 'bmc-core/people', 'update', 'people', 'bmc-core', '编辑人员', 2);
-- ----------------------------
-- Table structure for `bmc_core_app_module`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_app_module`;
CREATE TABLE `bmc_core_app_module` (
  `amid` varchar(48) NOT NULL,
  `mno` varchar(16) DEFAULT NULL,
  `appno` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `iconCls` varchar(32) DEFAULT NULL,
  `view_` varchar(128) DEFAULT NULL,
  `ctrllor` varchar(128) DEFAULT NULL,
  `config` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`amid`),
  UNIQUE KEY `idx_app_module` (`mno`,`appno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_app_module
-- ----------------------------
INSERT INTO `bmc_core_app_module` VALUES ('bmc-core/app', 'app', 'bmc-core', '应用功能', '3', 'app_m', 'bmc.core.app.view.MngApp', null, '');
INSERT INTO `bmc_core_app_module` VALUES ('bmc-core/auth', 'auth', 'bmc-core', '权限维护', '2', 'auth_m', 'bmc.core.auth.view.MngAuth', null, '');
INSERT INTO `bmc_core_app_module` VALUES ('bmc-core/org', 'org', 'bmc-core', '组织机构', '1', 'org_m', 'bmc.core.org.view.MngOrgTree', null, null);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-core/user', 'user', 'bmc-core', '用户管理', '0', 'user_m', 'bmc.core.user.view.MngUser', null, null);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-core/level', 'level', 'bmc-core', '职级管理', '5', 'level_m', 'bmc.core.level.view.MngLevel', null, null);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-core/people', 'people', 'bmc-core', '人员管理', '4', 'people_m', 'bmc.core.people.view.MngPeople', null, null);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-dc/dict', 'dict', 'bmc-dc', '基础数据', '4', 'dict_m', 'bmc.dc.dict.view.MngDict', null, null);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-dc/ext', 'ext', 'bmc-dc', '外部数据源', '1', 'ext_m', '', null, '');
INSERT INTO `bmc_core_app_module` VALUES ('bmc-dc/grid', 'grid', 'bmc-dc', '表格模板', '3', 'grid_m', 'bmc.dc.grid.view.MngTpl', null, null);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-dc/logic', 'logic', 'bmc-dc', '数据逻辑', '2', 'logic_m', 'bmc.dc.logic.view.MngLogic', null, '');
INSERT INTO `bmc_core_app_module` VALUES ('process/tpl', 'tpl', 'process', '流程模板', 1, 'bmc-process', 'bmc.common.process.view.MngProcessTpl', '', NULL);
-- ----------------------------
-- Table structure for `bmc_core_auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_auth_role`;
CREATE TABLE `bmc_core_auth_role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(16) DEFAULT NULL,
  `detail` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_auth_role
-- ----------------------------
INSERT INTO `bmc_core_auth_role` VALUES ('1', 'admins', '超级管理员');
INSERT INTO `bmc_core_auth_role` VALUES ('2', 'user', '普通用户');

-- ----------------------------
-- Table structure for `bmc_core_auth_rolefun`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_auth_rolefun`;
CREATE TABLE `bmc_core_auth_rolefun` (
  `role` varchar(16) NOT NULL,
  `amfid` varchar(64) NOT NULL,
  PRIMARY KEY (`role`,`amfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_auth_rolefun
-- ----------------------------
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/createApp');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/createFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/createModule');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/deleteApp');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/deleteFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/deleteModule');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/updateApp');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/updateFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/app/updateModule');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/auth/createRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/auth/deleteRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/auth/grantRoleFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/auth/revokeRoleFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/auth/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/auth/updateRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/org/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/org/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/org/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/org/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/auth');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/grantFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/grantRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/lock');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/resetPwd');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/revokeFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/revokeRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/unlock');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/user/update');
-- 职级管理
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/level/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/level/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/level/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/level/delete');
-- 人员管理
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/people/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/people/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/people/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-core/people/delete');

INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/dict/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/ext/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/grid/createTpl');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/grid/deleteTpl');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/grid/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/grid/updateTpl');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/grid/updateTplXml');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/logic/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/logic/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/logic/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/logic/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/logic/updateScript');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-dc/dict/att/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'process/tpl/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'process/tpl/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'process/tpl/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'process/tpl/update');

-- ----------------------------
-- Table structure for `bmc_core_auth_userfun`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_auth_userfun`;
CREATE TABLE `bmc_core_auth_userfun` (
  `uid_` varchar(32) NOT NULL,
  `amfid` varchar(64) NOT NULL,
  PRIMARY KEY (`uid_`,`amfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_auth_userfun
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_core_auth_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_auth_userrole`;
CREATE TABLE `bmc_core_auth_userrole` (
  `uid_` varchar(32) NOT NULL,
  `role` varchar(16) NOT NULL,
  PRIMARY KEY (`uid_`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_auth_userrole
-- ----------------------------
INSERT INTO `bmc_core_auth_userrole` VALUES ('admin', 'admins');
INSERT INTO `bmc_core_auth_userrole` VALUES ('admin', 'user');
INSERT INTO `bmc_core_auth_userrole` VALUES ('test', 'user');

-- ----------------------------
-- Table structure for `bmc_core_org_entity`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_org_entity`;
CREATE TABLE `bmc_core_org_entity` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `ono` varchar(16) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `enterprise_type` varchar(32) NULL,
  `owner` varchar(16) DEFAULT NULL,
  `unit_class` varchar(16) DEFAULT NULL,
  `complement` varchar(16) DEFAULT NULL,
  `borrow_num` varchar(16) DEFAULT NULL,
  `plan_num` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `idx_oe_u_ono` (`ono`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_org_entity
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_core_org_rel`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_org_rel`;
CREATE TABLE `bmc_core_org_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `ono` varchar(16) DEFAULT NULL,
  `leaf` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_or_u_ono` (`ono`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_org_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_core_user`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_user`;
CREATE TABLE `bmc_core_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid_` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `pwd` varchar(128) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `ono` varchar(32) DEFAULT NULL,
  `state` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_user` (`uid_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_core_user
-- ----------------------------
INSERT INTO `bmc_core_user` VALUES ('1', 'admin', '系统管理员', '21232f297a57a5a743894a0e4a801fc3', 'M', '2014-07-25 00:00:00', '', '123', '', '01');
INSERT INTO `bmc_core_user` VALUES ('2', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', 'M', null, null, null, '01', '01');

-- ----------------------------
-- Table structure for `bmc_core_level`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_level`;
CREATE TABLE `bmc_core_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `validate` decimal(18) DEFAULT NULL,
  `ono` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bmc_core_people`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_people`;
CREATE TABLE `bmc_core_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `card` varchar(18) DEFAULT NULL,
  `post` varchar(64) DEFAULT NULL,
  `minorities` varchar(64) DEFAULT NULL,
  `birthplace` varchar(64) DEFAULT NULL,
  `grad_date` date DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `professional` varchar(64) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `job_date` date DEFAULT NULL,
  `ono` varchar(32) DEFAULT NULL,
  `politics` varchar(64) DEFAULT NULL,
  `educate` varchar(64) DEFAULT NULL,
  `account` varchar(32) DEFAULT NULL,
  `account_add` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `postcode` varchar(64) DEFAULT NULL,
  `lnput_person` varchar(64) DEFAULT NULL,
  `lnput_date` date DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for `bmc_dc_grid_inst`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_dc_grid_inst`;
CREATE TABLE `bmc_dc_grid_inst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `tcode` varchar(32) DEFAULT NULL,
  `bcode` varchar(32) DEFAULT NULL,
  `bid` varchar(32) DEFAULT NULL,
  `ono` varchar(32) DEFAULT NULL,
  `cdt` datetime DEFAULT NULL,
  `xml` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gi_b` (`bcode`,`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_dc_grid_inst
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_dc_grid_tpl`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_dc_grid_tpl`;
CREATE TABLE `bmc_dc_grid_tpl` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `detail` varchar(32) DEFAULT NULL,
  `tcode` varchar(32) DEFAULT NULL,
  `bcode` varchar(32) DEFAULT NULL,
  `ono` varchar(32) DEFAULT NULL,
  `uid_` varchar(32) DEFAULT NULL,
  `cdt` datetime DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `xml` longtext,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `idx_gt_tcode` (`tcode`),
  KEY `idx_gt_bcode` (`bcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_dc_grid_tpl
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_dc_logic`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_dc_logic`;
CREATE TABLE `bmc_dc_logic` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `tip` varchar(32) DEFAULT NULL,
  `bcode` varchar(32) DEFAULT NULL,
  `data_url` varchar(64) DEFAULT NULL,
  `desc_url` varchar(32) DEFAULT NULL,
  `mode_` varchar(6) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `sql_script` longtext,
  PRIMARY KEY (`lid`),
  UNIQUE KEY `idx_logic_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_dc_logic
-- ----------------------------

-- ----------------------------
-- Table structure for `bmc_dc_logic_desc`
-- ----------------------------
DROP TABLE IF EXISTS `bmc_dc_logic_desc`;
CREATE TABLE `bmc_dc_logic_desc` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `lcode` varchar(16) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `code` varchar(16) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `idx_logic_desc` (`lcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bmc_dc_logic_desc
-- ----------------------------
drop table if exists bmc_com_process;

/*==============================================================*/
/* Table: bmc_com_process                                       */
/*==============================================================*/
create table bmc_com_process
(
   id                   int not null auto_increment,
   name                 varchar(50),
   code                 varchar(50),
   bcode                varchar(50),
   bid                  varchar(50),
   type                 varchar(32),
   node                 varchar(32),
   next_node            int,
   status               varchar(50),
   role                 varchar(32),
   ono                  varchar(32),
   uid                  varchar(100),
   approval_uid         varchar(32),
   approval_idea        varchar(100),
   approval_time        datetime,
   approval_result      varchar(32),
   sequence             int,
   parameter            varchar(200),
   remark               varchar(100),
   proc_ono             varchar(32),
   primary key (id)
);
/*==============================================================*/
/* Index: bmc_process_index                                     */
/*==============================================================*/
create index bmc_process_index on bmc_com_process
(
   code,
   bcode,
   bid,
   status,
   proc_ono
);
-- ----------------------------
-- Table structure for bmc_core_people_org
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_people_org`;
CREATE TABLE `bmc_core_people_org` (
  `pid` int(11) NOT NULL,
  `ono` varchar(32) NOT NULL,
  PRIMARY KEY (`pid`,`ono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bmc_core_user_org
-- ----------------------------
DROP TABLE IF EXISTS `bmc_core_user_org`;
CREATE TABLE `bmc_core_user_org` (
  `uid` varchar(32) NOT NULL,
  `ono` varchar(32) NOT NULL,
  PRIMARY KEY (`uid`,`ono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
