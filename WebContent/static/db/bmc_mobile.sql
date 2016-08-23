drop table if exists bmc_mobi_app;

drop table if exists bmc_mobi_app_fun;

drop table if exists bmc_mobi_app_module;

drop table if exists bmc_mobi_auth_rolefun;

drop table if exists bmc_mobi_auth_userfun;

drop table if exists bmc_mobi_login;

/*==============================================================*/
/* Table: bmc_mobi_app                                          */
/*==============================================================*/
create table bmc_mobi_app
(
   aid                  int(11) not null auto_increment,
   appno                varchar(32),
   name                 varchar(32),
   iconCls              varchar(32),
   seq                  int,
   view 				varchar(128),
   primary key (aid)
);

/*==============================================================*/
/* Table: bmc_mobi_app_fun                                      */
/*==============================================================*/
create table bmc_mobi_app_fun
(
   amfid                varchar(64) not null,
   amid                 varchar(48),
   fno               	varchar(16),
   mno                  varchar(16),
   appno                varchar(32),
   name                 varchar(32),
   seq                  int,
   primary key (amfid)
);

/*==============================================================*/
/* Table: bmc_mobi_app_module                                   */
/*==============================================================*/
create table bmc_mobi_app_module
(
   amid                 varchar(48) not null,
   mno                  varchar(16),
   appno                varchar(32),
   name                 varchar(32),
   seq                  int,
   iconCls              varchar(32),
   view                 varchar(128),
   ctrllor              varchar(128),
   config               varchar(128),
   primary key (amid)
);

/*==============================================================*/
/* Table: bmc_mobi_auth_rolefun                                 */
/*==============================================================*/
create table bmc_mobi_auth_rolefun
(
   role                 varchar(16) not null,
   amfid                varchar(64) not null,
   primary key (role, amfid)
);

/*==============================================================*/
/* Table: bmc_mobi_auth_userfun                                 */
/*==============================================================*/
create table bmc_mobi_auth_userfun
(
   uid                  varchar(32) not null,
   amfid                varbinary(64) not null,
   primary key (uid, amfid)
);


/*==============================================================*/
/* Table: bmc_mobi_login                                        */
/*==============================================================*/
create table bmc_mobi_login
(
   uid                  varchar(32) not null,
   uuid                 varchar(32) not null,
   sim                  varchar(32),
   model                varchar(32),
   loginTime            datetime,
   ip                   varchar(32),
   primary key (uid, uuid)
);


alter table bmc_mobi_app_fun add constraint FK_bmc_mobi_mobile_amid foreign key (amid)
      references bmc_mobi_app_module (amid) on delete restrict on update restrict;

      
INSERT INTO `bmc_core_app` VALUES (0, 'bmc-mobi', NULL, '手机应用', 0, NULL);

INSERT INTO `bmc_core_app_module` VALUES ('bmc-mobi/app', 'app', 'bmc-mobi', '模块管理', 0, 'mobi_app', 'bmc.mobi.view.MngAppModule', NULL, NULL);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-mobi/rolefun', 'rolefun', 'bmc-mobi', '角色权限', 1, 'mobi_role_fun', 'bmc.mobi.view.RoleFunView', NULL, NULL);
INSERT INTO `bmc_core_app_module` VALUES ('bmc-mobi/userfun', 'userfun', 'bmc-mobi', '用户权限', 2, 'mobi_user_fun', 'bmc.mobi.view.UserFunView', NULL, NULL);

INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/create', 'bmc-mobi/app', 'create', 'app', 'bmc-mobi', '创建应用页', 1);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/delete', 'bmc-mobi/app', 'delete', 'app', 'bmc-mobi', '删除应用页', 3);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/fun/create', 'bmc-mobi/app', 'fun/create', 'app', 'bmc-mobi', '创建功能', 7);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/fun/delete', 'bmc-mobi/app', 'fun/delete', 'app', 'bmc-mobi', '删除功能', 9);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/fun/update', 'bmc-mobi/app', 'fun/update', 'app', 'bmc-mobi', '编辑功能', 8);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/module/create', 'bmc-mobi/app', 'module/create', 'app', 'bmc-mobi', '创建模块', 4);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/module/delete', 'bmc-mobi/app', 'module/delete', 'app', 'bmc-mobi', '删除模块', 6);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/module/update', 'bmc-mobi/app', 'module/update', 'app', 'bmc-mobi', '编辑模块', 5);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/start', 'bmc-mobi/app', 'start', 'app', 'bmc-mobi', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/update', 'bmc-mobi/app', 'update', 'app', 'bmc-mobi', '编辑应用页', 2);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/rolefun/create', 'bmc-mobi/rolefun', 'create', 'rolefun', 'bmc-mobi', '授权', 4);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/rolefun/delete', 'bmc-mobi/rolefun', 'delete', 'rolefun', 'bmc-mobi', '取消授权', 5);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/rolefun/start', 'bmc-mobi/rolefun', 'start', 'rolefun', 'bmc-mobi', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/userfun/create', 'bmc-mobi/userfun', 'create', 'userfun', 'bmc-mobi', '授权', 1);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/userfun/delete', 'bmc-mobi/userfun', 'delete', 'userfun', 'bmc-mobi', '取消授权', 2);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/userfun/start', 'bmc-mobi/userfun', 'start', 'userfun', 'bmc-mobi', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/appfun/create', 'bmc-mobi/app', 'appfun/create', 'app', 'bmc-mobi', '应用页功能新增', 10);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/appfun/delete', 'bmc-mobi/app', 'appfun/delete', 'app', 'bmc-mobi', '应用页功能删除', 12);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/app/appfun/update', 'bmc-mobi/app', 'appfun/update', 'app', 'bmc-mobi', '应用页功能编辑', 11);

INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/fun/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/fun/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/fun/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/module/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/module/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/module/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/update');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/rolefun/createRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/rolefun/deleteRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/rolefun/grantRoleFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/rolefun/RevokeRoleFun');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/rolefun/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/rolefun/updateRole');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/userfun/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/appfun/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/appfun/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/app/appfun/update');


drop table if exists bmc_mobi_version;

/*==============================================================*/
/* Table: bmc_mobi_version                                      */
/*==============================================================*/
create table bmc_mobi_version
(
   id                   int not null auto_increment,
   version              varchar(32),
   uuid                 varchar(50),
   upload_date          datetime,
   remark               text,
   primary key (id)
);

/*==============================================================*/
/* Index: bmc_mobi_version_index                                */
/*==============================================================*/
create index bmc_mobi_version_index on bmc_mobi_version
(
   upload_date
);

INSERT INTO `bmc_core_app_module` VALUES ('bmc-mobi/version', 'version', 'bmc-mobi', '客户端版本', 3, 'mobi_client_version', 'bmc.mobi.view.MngClientVersion', NULL, NULL);

INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/version/create', 'bmc-mobi/version', 'create', 'version', 'bmc-mobi', '创建版本', 1);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/version/delete', 'bmc-mobi/version', 'delete', 'version', 'bmc-mobi', '删除版本', 3);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/version/start', 'bmc-mobi/version', 'start', 'version', 'bmc-mobi', '启动', 0);
INSERT INTO `bmc_core_app_fun` VALUES ('bmc-mobi/version/update', 'bmc-mobi/version', 'update', 'version', 'bmc-mobi', '编辑版本', 2);

INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/version/create');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/version/delete');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/version/start');
INSERT INTO `bmc_core_auth_rolefun` VALUES ('admins', 'bmc-mobi/version/update');
