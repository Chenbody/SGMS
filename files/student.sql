/*
 Navicat Premium Dump SQL

 Source Server         : MacBookair
 Source Server Type    : MySQL
 Source Server Version : 90001 (9.0.1)
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 90001 (9.0.1)
 File Encoding         : 65001

 Date: 12/11/2024 20:09:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Username',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Password',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nickname',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Role',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Admin table';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`id`, `username`, `password`, `name`, `role`) VALUES (1, '111', 'admin123', 'admin111', 'ADMIN');
INSERT INTO `admin` (`id`, `username`, `password`, `name`, `role`) VALUES (2, '20223802015', 'cjx123456', 'cjxAdmin', 'ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Course name',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Course number',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Course description',
  `times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Course hour',
  `teacher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Teacher name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Course message';

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (1, '高等数学', 'JC3001', '涵盖微积分和线性代数的基础课程', '48课时', '宋浩');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (2, '物理学', 'PHY102', '涵盖力学、热学和电磁学', '32课时', '李四');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (3, '化学', 'CHM103', '基础化学理论及实验', '36课时', '王五');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (4, '生物学', 'BIO104', '细胞生物学和遗传学入门', '42课时', '赵六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (5, '计算机科学', 'CS105', '计算机编程及应用', '56课时', '孙七');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (6, '英语', 'ENG106', '英语听说读写提高课程', '60课时', '周八');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (8, '地理', 'GEO108', '地理基础知识及其应用', '40课时', '郑十');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (9, '心理学', 'PSY109', '心理学基础', '30课时', '钱十一');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (10, '法学', 'LAW110', '法律基本原理', '45课时', '孔十二');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (11, '高等数学II', 'MTH201', '高级微积分及其应用', '50课时', '董十三');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (12, '物理学II', 'PHY202', '现代物理学导论', '35课时', '陈十四');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (13, '统计学', 'STA203', '统计理论与方法', '38课时', '蒋十五');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (14, '经济学', 'ECO204', '宏观与微观经济学基础', '44课时', '蔡十六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (15, '哲学', 'PHI205', '西方哲学史', '28课时', '袁十七');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (16, '艺术设计', 'ART206', '基础艺术设计原理', '50课时', '杜十八');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (17, '机械工程', 'MECH207', '机械设计与制造', '60课时', '魏十九');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (18, '电气工程', 'ELE208', '电路理论与应用', '55课时', '任二十');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (19, '环境科学', 'ENV209', '环境保护与可持续发展', '30课时', '卢二一');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (20, '管理学', 'MGMT210', '企业管理基础', '40课时', '苏二二');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (21, '市场营销', 'MKT211', '市场分析与策略', '45课时', '范二三');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (22, '会计学', 'ACC212', '财务会计基础', '35课时', '姜二四');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (23, '国际关系', 'IR213', '国际政治与外交', '30课时', '崔二五');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (24, '新闻学', 'JNL214', '新闻写作与编辑', '25课时', '伍二六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (25, '社会学', 'SOC215', '社会结构与功能', '30课时', '余二七');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (26, '教育学', 'EDU216', '教育理论与实践', '40课时', '叶二八');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (27, '天文学', 'AST217', '宇宙学基础', '30课时', '吕二九');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (28, '地质学', 'GEO218', '地球构造与演化', '40课时', '姜三十');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (29, '材料科学', 'MAT219', '材料性质与应用', '50课时', '申三一');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (30, '信息技术', 'IT220', '信息系统与管理', '40课时', '范三二');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (31, '物流管理', 'LOG221', '供应链与物流优化', '35课时', '包三三');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (32, '航空航天', 'AER222', '航空航天工程概论', '50课时', '纪三四');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (33, '公共卫生', 'PHR223', '流行病学与公共健康', '30课时', '穆三五');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (34, '法律英语', 'LAW224', '法律专业英语', '20课时', '聂三六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (35, '艺术史', 'ART225', '世界艺术史', '30课时', '屈三七');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (36, '信息安全', 'INF226', '网络安全基础', '40课时', '裴三八');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (37, '微电子学', 'ELE227', '微电子器件与技术', '40课时', '洪三九');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (38, '纳米技术', 'NAN228', '纳米材料与应用', '50课时', '霍四十');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (39, '能源科学', 'ENG229', '可再生能源技术', '40课时', '纪四一');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (40, '软件工程', 'CS230', '软件开发生命周期', '50课时', '龙四二');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (41, '人工智能', 'AI231', '机器学习与应用', '50课时', '戴四三');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (42, '数据科学', 'DS232', '大数据分析与处理', '50课时', '涂四四');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (43, '云计算', 'CC233', '云服务与架构', '40课时', '苗四五');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (44, '区块链技术', 'BC234', '区块链原理与应用', '40课时', '方四六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (45, '物联网', 'IoT235', '物联网系统设计', '40课时', '田四六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (46, '生物信息学', 'BIO236', '基因数据分析', '35课时', '童四六');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (47, '量子计算', 'QC237', '量子算法与应用', '50课时', '简四七');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (48, '机器人学', 'ROB238', '机器人设计与控制', '50课时', '樊四八');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (49, '虚拟现实', 'VR239', '虚拟现实技术基础', '40课时', '龚四九');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (50, '增强现实', 'AR240', '增强现实应用开发', '40课时', '单五10');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (51, '高等数学', 'CS2022', '走进数学美妙世界', '48课时', '汤家凤');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (52, 'IELTS', 'CS2024', '2000+铅笔', '12课时', '九分学长');
INSERT INTO `course` (`id`, `name`, `no`, `description`, `times`, `teacher`) VALUES (57, '中国历史', 'HST007', '中华上下五千年', '24课时', '罗新');
COMMIT;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `course_id` int DEFAULT NULL COMMENT 'Course ID',
  `student_id` int DEFAULT NULL COMMENT 'Student ID',
  `score` double(10,1) DEFAULT NULL COMMENT 'Score',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Teacher comments',
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Student feedback',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Student grade';

-- ----------------------------
-- Records of grade
-- ----------------------------
BEGIN;
INSERT INTO `grade` (`id`, `course_id`, `student_id`, `score`, `comment`, `feedback`) VALUES (1, 15, 15, 88.5, 'good', '2222');
INSERT INTO `grade` (`id`, `course_id`, `student_id`, `score`, `comment`, `feedback`) VALUES (2, 48, 15, 90.5, 'fine\n哈哈哈哈这是一个测试', '好好好，这也是个测试1111');
INSERT INTO `grade` (`id`, `course_id`, `student_id`, `score`, `comment`, `feedback`) VALUES (3, 52, 1, 6.5, '仍需努力', '包的');
INSERT INTO `grade` (`id`, `course_id`, `student_id`, `score`, `comment`, `feedback`) VALUES (5, 57, 1, 60.0, '加油', 'okok');
INSERT INTO `grade` (`id`, `course_id`, `student_id`, `score`, `comment`, `feedback`) VALUES (6, 52, 19, 95.0, 'perfect', 'good teacher good mark');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'student ID',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'password',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'student name',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'phone number',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email address',
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sex',
  `birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'student birthday',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'role',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Student message';

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (1, '20223802015', 'student123', '小陈', '12345678909', '2345678909@qq.com', 'Male', '2000-06-18', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (2, '123456', 'abc123', '123456', NULL, NULL, NULL, NULL, NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (3, '456789', 'abc456', '456789', NULL, NULL, NULL, NULL, NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (5, '20223802016', 'password1', '张三', '13900000001', 'zhangsan1@example.com', 'Male', '2001-01-01', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (6, '20223802017', 'password2', '李四', '13900000002', 'lisi2@example.com', 'Female', '2001-02-02', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (7, '20223802018', 'password3', '王五', '13900000003', 'wangwu3@example.com', 'Male', '2001-03-03', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (8, '20223802019', 'password4', '赵六', '13900000004', 'zhaoliu4@example.com', 'Female', '2001-04-04', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (9, '20223802020', 'password5', '周七', '13900000005', 'zhouqi5@example.com', 'Male', '2001-05-05', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (10, '20223802021', 'password6', '吴八', '13900000006', 'wuba6@example.com', 'Female', '2001-06-06', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (11, '20223802022', 'password7', '郑九', '13900000007', 'zhengjiu7@example.com', 'Male', '2001-07-07', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (12, '20223802023', 'password8', '王十', '13900000008', 'wangshi8@example.com', 'Female', '2001-08-08', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (13, '20223802024', 'password9', '陈十一', '13900000009', 'chenshiyi9@example.com', 'Male', '2001-09-09', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (14, '20223802025', 'password10', '杨十二', '13900000010', 'yangshier10@example.com', 'Female', '2001-10-10', NULL, 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (15, '20223802000', 'test123', 'test', '19877889923', 'test@example.com', 'Female', '2024-11-28', 'http://localhost:9090/files/download?fileName=1731412797173_boki.png', 'STUDENT');
INSERT INTO `student` (`id`, `username`, `password`, `name`, `phone`, `email`, `sex`, `birth`, `avatar`, `role`) VALUES (19, '20223802002', 'abc123', '小陆', NULL, NULL, 'Female', NULL, 'http://localhost:9090/files/download?fileName=1731412655219_gewen.png', 'STUDENT');
COMMIT;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CourseName',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Course Number',
  `student_id` int DEFAULT NULL COMMENT 'Student ID',
  `course_id` int DEFAULT NULL COMMENT 'Course ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Student select course record';

-- ----------------------------
-- Records of student_course
-- ----------------------------
BEGIN;
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (1, '中国历史', 'HST007', 1, 57);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (2, 'IELTS', 'CS2024', 1, 52);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (3, '电气工程', 'ELE208', 1, 18);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (5, '社会学', 'SOC215', 15, 25);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (6, '哲学', 'PHI205', 15, 15);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (8, 'IELTS', 'CS2024', 15, 52);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (12, '机器人学', 'ROB238', 15, 48);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (13, 'IELTS', 'CS2024', 19, 52);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (14, '量子计算', 'QC237', 19, 47);
INSERT INTO `student_course` (`id`, `name`, `no`, `student_id`, `course_id`) VALUES (15, '高等数学', 'JC3001', 19, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
