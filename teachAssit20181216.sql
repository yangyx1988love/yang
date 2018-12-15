/*
 Navicat Premium Data Transfer

 Source Server         : xinjiang
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : 221.7.12.194:3306
 Source Schema         : teachAssit

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : 65001

 Date: 16/12/2018 00:55:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `COURSE_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `COURSE_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `YEAR_TERM` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学年学期',
  `TR_SECTION_ID` int(4) NULL DEFAULT NULL COMMENT '教研室编号',
  `TOTAL_HOURS` int(4) NULL DEFAULT NULL COMMENT '总学时',
  `TEACH_NUM` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程审核人',
  `AVAILABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否审核通过',
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`COURSE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('20180133', '病理学', '2018-2019-1', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for course_schedule
-- ----------------------------
DROP TABLE IF EXISTS `course_schedule`;
CREATE TABLE `course_schedule`  (
  `ID` bigint(20) NOT NULL COMMENT '排课表id',
  `COURSE_ID` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名ID',
  `TEACH_NUM` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号',
  `CLASS_SESSION` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上课节次',
  `CLASS_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上课班级',
  `CLASSROOM_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上课地点',
  `COURSE_CONTENT` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课内容',
  `COURSE_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开课类型',
  `TEACH_METHOD` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课方式',
  `CLASS_HOUR` int(1) NULL DEFAULT NULL COMMENT '学时',
  `WEEK_NUM` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周次',
  `DATE` date NOT NULL COMMENT '上课时间',
  `AVAILABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '课程是否生效 1生效',
  `SERVICE_COUNT` int(2) NULL DEFAULT 0 COMMENT '服务器推送次数',
  `CLIENT_COUNT` int(2) NULL DEFAULT 0 COMMENT '客户端回复次数',
  `STYPE_ID` int(2) NULL DEFAULT NULL COMMENT '学生类型ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `ID` int(8) NOT NULL,
  `TITLE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知主题',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知内容',
  `DATE` datetime(0) NULL DEFAULT NULL,
  `TEACH_NUM` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人工号',
  `AVAILABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否有效 1是',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_type
-- ----------------------------
DROP TABLE IF EXISTS `student_type`;
CREATE TABLE `student_type`  (
  `STYPE_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT '学生类型ID',
  `STYPE_NAME` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生类型名称',
  PRIMARY KEY (`STYPE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `PERMISSION_ID` bigint(20) NOT NULL COMMENT '主键',
  `PERMISSION_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `PERMISSION_TYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源类型：menu,button,',
  `PERMISSION_URL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问url地址',
  `PERMISSION_CODE` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限代码字符串',
  `PARENT_ID` bigint(20) NULL DEFAULT NULL COMMENT '父结点id',
  `PARENT_IDS` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父结点id列表串',
  `SORT_STRING` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `AVAILABLE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`PERMISSION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '权限', '', '', NULL, 0, '0/', '0', '1');
INSERT INTO `sys_permission` VALUES (11, '权限管理', 'menu', '/role/queryRole.action', 'role:query', 1, '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES (12, '角色增加', 'permission', '/role/addRole.action', 'role:add', 11, '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES (13, '角色权限', 'permission', '/role/editRole.action', 'role:update', 11, '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES (21, '用户管理', 'menu', '/user/queryUser.action', 'user:query', 1, '0/1/', '2.', '1');
INSERT INTO `sys_permission` VALUES (22, '用户新增', 'permission', '/user/addUser.action', 'user:create', 21, '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES (23, '用户修改', 'permission', '/user/editUser.action', 'user:update', 21, '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES (24, '用户删除', 'permission', '/user/deleteUser.action', 'user:delete', 21, '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES (31, '课程组管理', 'menu', '/trSection/queryTrSection.action', 'trSection:query', 1, '0/1/', '3.', '1');
INSERT INTO `sys_permission` VALUES (32, '课题组新增', 'permission', '/trSection/addTrSection.action', 'trSection:create', 31, '0/1/31/', NULL, '1');
INSERT INTO `sys_permission` VALUES (33, '课题组修改', 'permission', '/trSection/editTrSection.action', 'trSection:update', 31, '0/1/31/', NULL, '1');
INSERT INTO `sys_permission` VALUES (34, '课题组删除', 'permission', '/trSection/deleteTrSection.action', 'trSection:delete', 31, '0/1/31/', NULL, '1');
INSERT INTO `sys_permission` VALUES (41, '学生类型管理', 'menu', '/studentType/queryStudentType.action', 'studentType:query', 1, '0/1/', '4.', '1');
INSERT INTO `sys_permission` VALUES (42, '学生类型增加', 'permission', '/studentType/addStudentType.action', 'studentType:create', 41, '0/1/41', NULL, '1');
INSERT INTO `sys_permission` VALUES (43, '学生类型删除', 'permission', '/studentType/deleteStudentType.action', 'studentType:delete', 41, '0/1/41', NULL, '1');
INSERT INTO `sys_permission` VALUES (51, '课程表管理', 'menu', '/courseSchedule/queryCourseSchedule.action', 'courseSchedule:query', 1, '0/1/', '5.', '1');
INSERT INTO `sys_permission` VALUES (52, '课程表增加', 'permission', '/courseSchedule/addCourseSchedule.action', 'courseSchedule:create', 51, '0/1/51', NULL, '1');
INSERT INTO `sys_permission` VALUES (53, '课程表修改', 'permission', '/courseSchedule/editCourseSchedule.action', 'courseSchedule:update', 51, '0/1/51', NULL, '1');
INSERT INTO `sys_permission` VALUES (54, '课程表删除', 'permission', '/courseSchedule/deleteCourseSchedule.action', 'courseSchedule:delete', 51, '0/1/51', NULL, '1');
INSERT INTO `sys_permission` VALUES (61, '公告管理', 'menu', '/notice/queryNotice.action', 'notice:query', 1, '0/1/', '6.', '1');
INSERT INTO `sys_permission` VALUES (62, '公告增加', 'permission', '/notice/addNotice.action', 'notice:create', 61, '0/1/61', NULL, '1');
INSERT INTO `sys_permission` VALUES (63, '公告修改', 'permission', '/notice/editNotice.action', 'notice:update', 61, '0/1/61', NULL, '1');
INSERT INTO `sys_permission` VALUES (64, '公告删除', 'permission', '/notice/deleteNotice.action', 'notice:delete', 61, '0/1/61', NULL, '1');
INSERT INTO `sys_permission` VALUES (71, '课程管理', 'menu', '/course/queryCourse.action', 'course:query', 1, '0/1/', '7.', '1');
INSERT INTO `sys_permission` VALUES (81, '教室管理', 'menu', '/classroom/queryClassroom.action', 'classroom:query', 1, '0/1/', '8.', '1');
INSERT INTO `sys_permission` VALUES (91, '班级管理', 'menu', '/class/queryClass.action', 'class:query', 1, '0/1/', '9.', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ROLE_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AVAILABLE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('02858fd624eb4a6e813caa12c7458a8a', '教研室管理员/教秘', '1');
INSERT INTO `sys_role` VALUES ('ebc8a441c6f911e4b1370adc305c3f28', '超级管理员', '1');
INSERT INTO `sys_role` VALUES ('ebc9d647c6f911e4b1370adc305c3f28', '教学办管理员', '1');
INSERT INTO `sys_role` VALUES ('f541b23527be4cc383c4d2791d20d98b', '教师', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `PERMISSION_ID` bigint(20) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `sys_permission_id`(`PERMISSION_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 'ebc8a441-c6f9-11e4-b137-0adc305c3f28', 11);
INSERT INTO `sys_role_permission` VALUES (2, 'ebc8a441-c6f9-11e4-b137-0adc305c3f28', 12);
INSERT INTO `sys_role_permission` VALUES (3, 'ebc8a441-c6f9-11e4-b137-0adc305c3f28', 13);
INSERT INTO `sys_role_permission` VALUES (4, 'ebc8a441-c6f9-11e4-b137-0adc305c3f28', 21);
INSERT INTO `sys_role_permission` VALUES (5, 'ebc8a441-c6f9-11e4-b137-0adc305c3f28', 22);
INSERT INTO `sys_role_permission` VALUES (6, 'ebc8a441-c6f9-11e4-b137-0adc305c3f28', 23);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `USERCORD` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `USERNAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `PASSWORD` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `SALT` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '账号状态，1活跃',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('admin', 'admin', '超级管理员', '111111', 'admin', NULL, '0');
INSERT INTO `sys_user` VALUES ('jbtest', 'jiaoban', '教学办管理员', '111111', 'admin', NULL, '0');
INSERT INTO `sys_user` VALUES ('jmtest', 'jiaomi', '教秘管理员', '111111', 'eteokues', NULL, '0');
INSERT INTO `sys_user` VALUES ('jstest', 'jiaoshi', '教师测试员', '111111', 'eteokues', NULL, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 'admin', 'ebc9d647c6f911e4b1370adc305c3f28');
INSERT INTO `sys_user_role` VALUES (2, 'jbtest', 'ebc8a441c6f911e4b1370adc305c3f28');
INSERT INTO `sys_user_role` VALUES (3, 'jmtest', '02858fd624eb4a6e813caa12c7458a8a');
INSERT INTO `sys_user_role` VALUES (4, 'jstest', 'f541b23527be4cc383c4d2791d20d98b');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `TEACH_NUM` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号',
  `TEACH_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师名称',
  `MOBILE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ISMASSEGE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否短信通知1是',
  `ISPUSH` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否推送通知1是',
  `PROFESSIONAL` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `INSTITUTE_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`TEACH_NUM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('jmtest', '教秘测试员', '18526338626', '1111', '1', '1', '教授', '基础医学院');

-- ----------------------------
-- Table structure for tr_section
-- ----------------------------
DROP TABLE IF EXISTS `tr_section`;
CREATE TABLE `tr_section`  (
  `TR_SECTION_ID` int(4) NOT NULL AUTO_INCREMENT,
  `TR_SECTION_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教研室名称',
  `TEACH_NUM` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教秘工号',
  `INSTITUTE_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`TR_SECTION_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tr_section
-- ----------------------------
INSERT INTO `tr_section` VALUES (1, '病理学教研室', 'jmtest', NULL);

SET FOREIGN_KEY_CHECKS = 1;
