/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : multilangsite

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 20/06/2021 07:31:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `parentId` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_3160ca86a6e088fd837b25f8f3`(`identity`) USING BTREE,
  INDEX `FK_d5456fd7e4c4866fec8ada1fa10`(`parentId`) USING BTREE,
  CONSTRAINT `FK_d5456fd7e4c4866fec8ada1fa10` FOREIGN KEY (`parentId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (47, '新闻中心', 'news', '47.', NULL, 0, '3335', '4445', '5555');
INSERT INTO `category` VALUES (48, '企业新闻', '行业新闻', '47.48.', 47, 0, '企业新闻t', '企业新闻k', '企业新闻d');
INSERT INTO `category` VALUES (49, '产品中心', 'product', '49.', NULL, 0, '', '', '');
INSERT INTO `category` VALUES (50, 'IOT产品', 'iot', '49.50.', 49, 0, '', '', '');
INSERT INTO `category` VALUES (51, '图片播放器', 'banner', '51.', NULL, 0, '', '', '');
INSERT INTO `category` VALUES (52, '首页', 'index', '51.52.', 51, 0, '', '', '');
INSERT INTO `category` VALUES (54, '云端产品', 'cloud', '49.54.', 49, 0, '', '', '');
INSERT INTO `category` VALUES (55, '解决方案', 'solution', '55.', NULL, 0, '解决方案', '解决方案', '解决方案');
INSERT INTO `category` VALUES (56, '通用园区', 'generalPark', '55.56.', 55, 0, '', '', '');
INSERT INTO `category` VALUES (57, '城市治理', 'cityGovernment', '55.57.', 55, 0, '城市治理', '', '');
INSERT INTO `category` VALUES (58, '创新业务', 'InnovativeBusiness', '55.58.', 55, 0, '', '', '');
INSERT INTO `category` VALUES (59, '人脸识别终端', 'face', '49.50.59.', 50, 0, '', '', '');

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段id自增',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段名称',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `creatorId` int(11) NULL DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `onlyone` tinyint(4) NOT NULL DEFAULT 0 COMMENT '唯一性 0 禁用 1使用',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认值',
  `isFront` tinyint(4) NOT NULL DEFAULT 0 COMMENT '默认值',
  `search` int(11) NOT NULL DEFAULT 0 COMMENT '是否可以搜索  0不支持搜索 1完全匹配搜索 2 部分匹配搜索  3区间搜索 ',
  `searchSeparaStor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区间搜索时使用的分隔符',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段类型',
  `formType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'text' COMMENT '表单类型',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'safe' COMMENT '接收数据格式化',
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段标识符',
  `moduleId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模型id，数字为模型id，非数字表示其他模型id ，空表示常用字段',
  `formExt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单扩展内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ea7438376bcaa37e55641362825`(`creatorId`) USING BTREE,
  CONSTRAINT `FK_ea7438376bcaa37e55641362825` FOREIGN KEY (`creatorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of field
-- ----------------------------
INSERT INTO `field` VALUES (42, '通栏图片', '建议图片规格是1920x500', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'banner', '', '{\"type\":\"image\",\"multiple\":false}');
INSERT INTO `field` VALUES (43, '内容', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'editor', 'html', 'content', '', '');
INSERT INTO `field` VALUES (44, '子标题', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', 'safe', 'subTitle', '', '');
INSERT INTO `field` VALUES (45, '缩略图', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'thumb', '', '');
INSERT INTO `field` VALUES (46, '摘要', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'textarea', 'safe', 'note', '', '');
INSERT INTO `field` VALUES (79, '摘要', '', NULL, 10, 0, '', 0, 0, '', 'longtext', 'editor', 'safe', 'note', '46', '');
INSERT INTO `field` VALUES (80, '内容', '', NULL, 255, 0, '', 0, 0, '', 'longtext', 'editor', 'html', 'content', '46', '');
INSERT INTO `field` VALUES (81, '缩略图', '', NULL, 10, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'thumb', '46', '');
INSERT INTO `field` VALUES (84, '内容', '', NULL, 255, 0, '', 0, 0, '', 'longtext', 'editor', 'html', 'content', '47', '');
INSERT INTO `field` VALUES (85, '子标题', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', 'safe', 'subTitle', '47', '');
INSERT INTO `field` VALUES (86, '缩略图', '', NULL, 15, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'thumb', '47', '');
INSERT INTO `field` VALUES (87, '摘要', '', NULL, 10, 0, '', 0, 0, '', 'longtext', 'textarea', 'safe', 'note', '47', '');
INSERT INTO `field` VALUES (88, '视频', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'video', '', '{\"type\":\"video\",\"multiple\":false}');
INSERT INTO `field` VALUES (89, '图片', '多图上传', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'pictures', '', '{\"type\":\"image\",\"multiple\":true}');
INSERT INTO `field` VALUES (104, '链接', '请填写链接地址，外链请输入http://或https://', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', '', 'linkurl', '', '');
INSERT INTO `field` VALUES (105, '背景颜色', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'bgcolor', '', '');
INSERT INTO `field` VALUES (106, '链接方式', '设置是否在新窗口打开，仅限链接有效时使用', NULL, 0, 0, '', 0, 0, '', 'varchar', 'radio', '', 'target', '', '');
INSERT INTO `field` VALUES (107, '手机版图片', '仅用于手机版或是公众号或是小程序中，图片宽高要求是：720x400', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', '', 'picmobile', '', '{\"type\":\"image\",\"multiple\":false}');
INSERT INTO `field` VALUES (108, '手机号	', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'mobile', '', '');
INSERT INTO `field` VALUES (109, '联系电话', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'tel', '', '');
INSERT INTO `field` VALUES (110, '备案号', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'cert', '', '');
INSERT INTO `field` VALUES (111, '联系地址', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'address', '', '');
INSERT INTO `field` VALUES (112, '企业名称', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'company', '', '');
INSERT INTO `field` VALUES (113, '页脚版权', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'editor', '', 'copyright', '', '');
INSERT INTO `field` VALUES (114, '通栏图片', '建议图片规格是1920x500', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'banner', '48', '{\"type\":\"image\",\"multiple\":false}');
INSERT INTO `field` VALUES (115, '背景颜色', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'bgcolor', '48', '');
INSERT INTO `field` VALUES (116, '链接', '请填写链接地址，外链请输入http://或https://', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', '', 'linkurl', '48', '');
INSERT INTO `field` VALUES (117, '链接方式', '设置是否在新窗口打开，仅限链接有效时使用', NULL, 0, 0, '', 0, 0, '', 'varchar', 'radio', '', 'target', '48', '');
INSERT INTO `field` VALUES (118, '手机版图片', '仅用于手机版或是公众号或是小程序中，图片宽高要求是：720x400', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', '', 'picmobile', '48', '{\"type\":\"image\",\"multiple\":false}');
INSERT INTO `field` VALUES (119, '子标题', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', 'safe', 'subTitle', '49', '');
INSERT INTO `field` VALUES (120, '内容', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'editor', 'html', 'content', '49', '');
INSERT INTO `field` VALUES (121, '地区', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'area', '51', '');
INSERT INTO `field` VALUES (122, '岗位职责', '', NULL, 10, 0, '', 0, 0, '', 'longtext', 'editor', '', 'duty', '51', '');
INSERT INTO `field` VALUES (123, '任职资格', '', NULL, 20, 0, '', 0, 0, '', 'longtext', 'editor', 'safe', 'qualifications', '51', '');
INSERT INTO `field` VALUES (124, '联系方式', '', NULL, 255, 0, '', 0, 0, '', '', '', '', 'contact', '51', '');
INSERT INTO `field` VALUES (125, '姓名', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'username', '50', '');
INSERT INTO `field` VALUES (126, '邮箱', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'email', '50', '');
INSERT INTO `field` VALUES (127, '电话', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'tel', '50', '');
INSERT INTO `field` VALUES (128, '地址', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'textarea', '', 'address', '50', '');
INSERT INTO `field` VALUES (129, '企业名称', '', NULL, 0, 0, '', 0, 0, '', '', '', '', 'company', '50', '');
INSERT INTO `field` VALUES (132, '缩略图', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'thumb', '53', '');
INSERT INTO `field` VALUES (135, '平台应用', '', NULL, 255, 0, '', 0, 0, '', '', 'extitle', '', 'application', '46', '{\"projectId\":69,\"isSingle\":false,\"limit\":20}');
INSERT INTO `field` VALUES (149, '摘要', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'textarea', 'safe', 'note', '52', '');
INSERT INTO `field` VALUES (150, '方案概述', '', NULL, 20, 0, '', 0, 0, '', 'longtext', 'editor', '', 'summary', '52', '');
INSERT INTO `field` VALUES (151, '落地能力', '请使用无序列表的格式。', NULL, 30, 0, '', 0, 0, '', 'longtext', 'editor', '', 'ability', '52', '');
INSERT INTO `field` VALUES (152, '经典案例', '', NULL, 255, 0, '', 0, 0, '', '', 'extitle', '', 'classicCase', '52', '{\"projectId\":71,\"isSingle\":false,\"limit\":\"4\"}');
INSERT INTO `field` VALUES (153, '子标题', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', 'safe', 'subTitle', '54', '');
INSERT INTO `field` VALUES (154, '缩略图', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'thumb', '54', '');
INSERT INTO `field` VALUES (156, '摘要', '', NULL, 0, 0, '', 0, 0, '', 'longtext', 'textarea', 'safe', 'note', '54', '');
INSERT INTO `field` VALUES (157, '方案亮点', '', NULL, 40, 0, '', 0, 0, '', 'longtext', 'editor', '', 'highlights', '52', '');
INSERT INTO `field` VALUES (158, '缩略图', '', NULL, 10, 0, '', 0, 0, '', 'varchar', 'upload', 'safe', 'thumb', '52', '');
INSERT INTO `field` VALUES (159, '公司地址', '', NULL, 0, 0, '', 0, 0, '', 'varchar', 'text', '', 'address', '56', '');
INSERT INTO `field` VALUES (160, '官方热线', '', NULL, 30, 0, '', 0, 0, '', '', '', '', 'tel', '56', '');
INSERT INTO `field` VALUES (161, '官方邮箱', '', NULL, 30, 0, '', 0, 0, '', '', '', '', 'email', '56', '');
INSERT INTO `field` VALUES (162, '售前咨询', '售前咨询热线', NULL, 40, 0, '', 0, 0, '', '', '', '', 'saletel', '56', '');
INSERT INTO `field` VALUES (163, '商务合作', '商务合作热线', NULL, 50, 0, '', 0, 0, '', '', '', '', 'business', '56', '');
INSERT INTO `field` VALUES (164, '媒体合作', '媒体合作热线', NULL, 60, 0, '', 0, 0, '', '', '', '', 'media', '56', '');
INSERT INTO `field` VALUES (165, '供应商合作', '供应商合作热线', NULL, 70, 0, '', 0, 0, '', '', '', '', 'supplier', '56', '');
INSERT INTO `field` VALUES (166, '公司地址二', '', NULL, 20, 0, '', 0, 0, '', '', '', '', 'adress2', '56', '');
INSERT INTO `field` VALUES (167, '内容', '', NULL, 255, 0, '', 0, 0, '', 'longtext', 'editor', 'html', 'content', '56', '');
INSERT INTO `field` VALUES (168, '联系问题', '请描述您的应用场景和技术要求', NULL, 0, 0, '', 0, 0, '', 'longtext', 'textarea', 'safe', 'note', '50', '');

-- ----------------------------
-- Table structure for list
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `creatorId` int(11) NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_b83bed21d1d68d6759d31afeda3`(`creatorId`) USING BTREE,
  CONSTRAINT `FK_b83bed21d1d68d6759d31afeda3` FOREIGN KEY (`creatorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list
-- ----------------------------

-- ----------------------------
-- Table structure for list_46
-- ----------------------------
DROP TABLE IF EXISTS `list_46`;
CREATE TABLE `list_46`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台应用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_46
-- ----------------------------
INSERT INTO `list_46` VALUES (26, 64, 59, '人脸识别门禁', '2021-06-08 16:20:50', '2021-06-08 08:28:33', '<ul data-v-196701ee=\"\">\n<li data-v-196701ee=\"\">识别准确率高达99%</li>\n<li data-v-196701ee=\"\">识别速度小于1S%</li>\n<li data-v-196701ee=\"\">支持1:1和1：N混合识别模式%</li>\n<li data-v-196701ee=\"\">支持IC卡读卡功能%</li>\n<li data-v-196701ee=\"\">双目人脸识别，支持红外活体检测%</li>\n<li data-v-196701ee=\"\">支持高达万人级别的人脸库%</li>\n</ul>', '', '/upload/images/c46muq86wAYU.jpg', '', '', '', '');
INSERT INTO `list_46` VALUES (27, 64, 59, '桌面智能访客终端', '2021-06-08 16:21:32', '2021-06-08 08:28:20', '<ul data-v-196701ee=\"\">\n<li data-v-196701ee=\"\">集二代身份证阅读、指纹比对、人脸比对等核验功能于一体%</li>\n<li data-v-196701ee=\"\">支持二维码扫描、证件扫描、小票打印、电话拨号等功能%</li>\n<li data-v-196701ee=\"\">外观精美小巧，前端屏幕采用10.1英寸</li>\n</ul>', '', '/upload/images/JjUTkUvenYox.jpg', '', '', '', '');
INSERT INTO `list_46` VALUES (28, 64, 59, 'AI摄像机', '2021-06-08 16:24:19', '2021-06-08 08:28:14', '<p>支持半球、枪机等不同形态，满足不同场景需求</p>\n<p>支持前端人脸比对，支持对运动人脸进行检测、跟踪、抓拍、特</p>\n<p>征提取、识别，输出最优人脸比对结果</p>\n<p>支持多种人脸抓拍模式：快速、间隔、离开后等人脸抓拍模式，</p>\n<p>抓拍次数可设</p>\n<p>支持最多万张人脸库,支持多个布防时间段设置</p>\n<p>支持黑白名单比对，VIP 名单库比对，非人脸库人员识别，完成</p>\n<p>报警输出</p>\n<p>支持人脸智能曝光模式，强逆光下人脸依然清晰可见</p>', '', '', '', '', '', '');
INSERT INTO `list_46` VALUES (29, 64, 59, '人脸识别消费机', '2021-06-08 16:25:56', '2021-06-08 16:25:56', '<p>人脸识别消费机主要应用于食堂、餐厅、超市收银等场景，可用于</p>\n<p>改变刷卡收费、手机支付、现金支付等多种支付手段，操作简单方</p>\n<p>便，运行安全可靠</p>\n<p>消费终端Android 5.1操作系统</p>\n<p>三合一支付认证终端，IC卡、二维码、人脸</p>', '', '/upload/images/kFdyWaB5EdJC.jpg', '', '', '', '');
INSERT INTO `list_46` VALUES (30, 64, 59, 'C型人脸识别一体机', '2021-06-08 16:27:01', '2021-06-08 16:27:01', '<p>支持双目活体检测</p>\n<p>支持强逆光环境下人员运动人脸追踪曝光</p>\n<p>独有的人脸识别算法，精准识别人脸，人脸识别时间&gt;0.5s</p>\n<p>内置国产CPU</p>\n<p>支持TF卡本地存储，图片连续存储1年、视频连续存储1个月</p>\n<p>或更长</p>\n<p>支持中距离测量体温，并高温报警</p>', '', '', '', '', '', '');
INSERT INTO `list_46` VALUES (31, 64, 50, '智能通行终端', '2021-06-08 16:32:58', '2021-06-08 16:32:58', '<ul>\n<li>场景化人行闸机</li>\n<li>防夹功能,断电开闸功能,上电自检功能,通行指示功能</li>\n<li>当有非法闯入、反向闯入、尾随通行、上电自检等报警联动</li>\n<li>可视化主板，可根据实际需要进行调试</li>\n<li>内置主板具有计数功能，统计进出人数数据</li>\n<li>安全性 :不同高度的玻璃阻拦选择能阻止行人翻过。高效性 : 通行速度为1.5秒/人</li>\n<li>智能安全化: 智能化的设计高效率的控制人流，当第二个授权行人通过的时候阻拦保持敞开</li>\n<li>可靠性 : 安装简单，维护成本低</li>\n</ul>', '', '/upload/images/TArVMGkqPgTS.png', '', '', '', '');
INSERT INTO `list_46` VALUES (32, 64, 50, '收费终端', '2021-06-08 16:33:34', '2021-06-08 08:59:53', '<ul>\n<li>专用于停车场管理的Linux系统</li>\n<li>即插即用，人性化向导，调试一步到位</li>\n<li>支持远程调试，一键升级维护</li>\n<li>支持出口收费、场内预缴费等多种缴费模式</li>\n<li>支持服务器、岗亭客户端、中央收费等多种应用模式</li>\n<li>系统配置灵活，支持多进多出</li>\n<li>丰富外围接口，自带8网卡交换机</li>\n</ul>', '', '/upload/images/e5IwhT5dBe3J.png', '', '', '', '');
INSERT INTO `list_46` VALUES (33, 64, 50, '智能车行道闸', '2021-06-08 16:34:21', '2021-06-08 16:34:21', '<p>高度集成，集成车牌识别单元和道闸单元，一机搞定智能补光控制系统，时控开关，补光</p>\n<p>灯亮度可设置为随时间变化而变化</p>\n<p>搭配3/6S双速道闸机芯，通过拨码选择起、落杆速度，起落杆速度可不同</p>\n<p>道闸机芯采用优质工艺，不抖杆、不热保、不卡死</p>\n<p>道闸具备遇阻返回功能，可避免砸车砸人情况</p>', '', '/upload/images/hioKztvAzYd5.png', '', '', '', '');
INSERT INTO `list_46` VALUES (34, 64, 50, '一体水控机', '2021-06-08 16:34:56', '2021-06-08 09:00:27', '<ul>\n<li>一体化水控机，内置电磁阀和水流量传感器</li>\n<li>支持蓝牙、4G通讯方式</li>\n<li>无需下载APP、直接微信、支付宝扫码及绑卡消费</li>\n<li>支持自助充值、查询、挂失补卡及退款</li>\n<li>具有随时查询充值和消费数据明细及汇总功能</li>\n<li>具有异常设备推送功能</li>\n</ul>', '', '/upload/images/ZEIxAd3Mf9RS.png', '', '', '', '');
INSERT INTO `list_46` VALUES (35, 64, 50, '智能终端', '2021-06-08 16:35:27', '2021-06-08 09:00:45', '<ul>\n<li>采用工业级无线通讯技术，30米无线通讯距离超低功耗设计，静态待机耗电小于20&mu;A</li>\n<li>支持IC卡，CPU卡，二代证，密码指纹，APP远程开门</li>\n<li>内置高容量锂电池保证续航时间，支持USB应急供电，可使用充电应急供电开门</li>\n<li>内置真人语音操作提示，OLED智能显示屏，操作便捷标准防盗锁体，采用不锈钢防盗锁芯</li>\n</ul>', '', '/upload/images/1qVo6a8gNZKI.png', '', '', '', '');
INSERT INTO `list_46` VALUES (36, 64, 50, '智能能源管理终端', '2021-06-08 16:35:59', '2021-06-08 16:35:59', '<ul>\n<li>电等能源智能管理</li>\n<li>具有计量、检测、控制,恶性负载识别等功能</li>\n<li>具有防雷功能，避免雷击危害</li>\n<li>定时开关断管理</li>\n</ul>', '', '/upload/images/pj2ZLpLMikIU.png', '', '', '', '');
INSERT INTO `list_46` VALUES (37, 64, 50, '智慧云班牌', '2021-06-08 16:38:34', '2021-06-08 16:38:34', '<p>专为智慧校园量身定制的集人脸识别、纯平超薄超窄机身、双刷卡</p>\n<p>等一身的黑科技产品</p>\n<p>纯平超薄超窄机身</p>\n<p>亮度 400nit高亮度显示，在户外环境下，也清晰可见</p>\n<p>支持双刷卡 提高2倍的考勤速度,可对接考勤、校园一卡通的数据</p>\n<p>首创电子班牌主板可拔插设计，主板可拆卸，免去整机维护的烦恼</p>\n<p>不惧严寒，-20℃也可正常使用</p>\n<p>极致设计，高端大气</p>', '', '/upload/images/vURA7SQZRFnh.png', '', '', '', '');
INSERT INTO `list_46` VALUES (38, 64, 50, '智能数据网关', '2021-06-08 16:39:03', '2021-06-08 16:39:03', '<ul>\n<li>具有防静电/防浪涌/防雷击/历史存储/断点续传等功能</li>\n<li>具有查询到对应电表的电量/总购电量/历史数据/电表状态/告警数据等功能</li>\n<li>具有定时管理表具开关/限流/恶性负载等功能，可设置参数</li>\n</ul>', '', '/upload/images/f4u565ZUiabb.png', '', '', '', '');
INSERT INTO `list_46` VALUES (39, 64, 50, '智能测温仪', '2021-06-08 16:39:54', '2021-06-08 09:01:20', '<p>高温提示：声音报警，人脸框变红</p>\n<p>测温速度：&le;0.1秒</p>\n<p>测温距离：支持6米测温，最佳距离4米内</p>\n<p>接口类型：USB*2,HDMI*1,DC power*1</p>\n<p>测温方式：红外热成像</p>\n<p>体温预警温度：37.3&deg;</p>\n<p>测温精度：&plusmn;0.3℃</p>\n<p>有效测温范围：36℃~120℃</p>\n<p>同时测温人数：20 人</p>\n<p>人脸识别距离：7.5米</p>', '', '/upload/images/8G8eLa1FYEBS.png', '', '', '', '');
INSERT INTO `list_46` VALUES (40, 64, 50, '人脸识别服务器', '2021-06-08 16:40:08', '2021-06-08 09:01:13', '<ul>\n<li>可接入32路人脸抓拍摄像机或1080P摄像机</li>\n<li>支持H.265+、H.265、H.264编码前端自适应接入</li>\n<li>支持Onvif协议接入平台；存储</li>\n<li>支持IPC设备一键添加</li>\n<li>支持IPC集中管理，包括IPC参数配置、数据导入/导出、升级等</li>\n<li>支持导入黑名单、白名单和VIP共10万张人脸库</li>\n<li>支持实时人脸比对、属性提取、名单报警、人脸保存</li>\n<li>支持人脸检索功能，包括以图搜图、以图搜录像</li>\n<li>支持报警管理和推送</li>\n<li>支持浏览器和手机（iOS/Android）访问</li>\n</ul>', '', '/upload/images/jue5M7ktaBq8.png', '', '', '', '');
INSERT INTO `list_46` VALUES (41, 64, 54, '智能园区平台', '2021-06-08 16:47:05', '2021-06-08 16:47:05', '<p>康索特智慧园区平台基于AI可视化能力打造&ldquo;一屏全感知&rdquo;的智慧园区服务体系，整合不同类型的业务系统，共建园区数据大平台，构建数据开放体系，促进园区和城市信息共享，赋能园区通用能力，智能化支撑园区治理与服务优化，打造深度感知的园区管理体系</p>', '', '', '', '', '', '20,21,22,23,24,25');
INSERT INTO `list_46` VALUES (42, 64, 54, '智慧校园平台', '2021-06-08 16:49:27', '2021-06-08 16:49:27', '<p>康索特智慧校园云平台针对多虚拟化管理，以虚</p>\n<p>拟化技术独立管理多个学校的数据和业务，以快</p>\n<p>速部署用户项目投入少周期短为目标，为校园提</p>\n<p>供SAAS式的云应用服务降低校园IT运营成本，全</p>\n<p>场景互联面向四大智慧场景打造便捷校园</p>', '', '', '', '', '', '26,27,28,29');
INSERT INTO `list_46` VALUES (43, 64, 54, '智慧社区平台', '2021-06-08 16:51:31', '2021-06-08 08:58:32', '<p>康索特智慧社区，以人为本，以技术创新为驱动，连接智能化的场景应用，通过物联网一体</p>\n<p>化平台实现社区的数据化改造和智能化管理，推动社区治理能级提升，为居民提供高品质的</p>\n<p>生活体验</p>', '', '', '', '', '', '30,31,32,33,34,35,36');
INSERT INTO `list_46` VALUES (44, 64, 54, '智慧环卫作业云脑平台', '2021-06-08 16:53:05', '2021-06-08 08:58:39', '<p>康索特智慧环卫作业云脑平台通过建立专业的事件处置机制，采用&ldquo;防微杜渐&rdquo;的科学管理模式，完善配套管理机制，通过AIoT技术全方位感知人员、车辆信息，有效识别作业漏洞，实现精细化管理智能监管，极大提升指挥调度能力</p>', '', '', '', '', '', '37,38,39,40,41,42,43,44');
INSERT INTO `list_46` VALUES (45, 64, 54, '智能视频分析平台', '2021-06-08 16:54:08', '2021-06-08 08:58:25', '<p>康索特智能视频分析平台基于行业领先的AI技术整合能力，融合全场景的计算机视觉识别技术，构建</p>\n<p>面向安防、交通、园区、工厂等多维智慧安防视频解决方案</p>', '', '', '', '', '', '45,46,47,48');
INSERT INTO `list_46` VALUES (46, 64, 54, '智慧机关事务管理平台', '2021-06-08 16:54:54', '2021-06-08 08:58:19', '<p>康索特智慧机关事务管理平台通过整合机关事务单位</p>\n<p>内部的各项管理与服务工作，建设智能化管理平台，</p>\n<p>提升单位内部管理水平和服务效率，提供可持续发展</p>\n<p>的后勤服务保障服务解决方案</p>', '', '', '', '', '', '49,50,51,52,53');
INSERT INTO `list_46` VALUES (47, 64, 54, '智慧食药监平台', '2021-06-08 16:56:16', '2021-06-08 08:58:13', '<p>康索特智慧食药监平台通过以视觉识别和大数据分析技术为核心，快速甄别被监管行业的违规问题，提升智能化监管水平，端云结合，构建安全、高效、智能的立体化监管解决方案</p>', '', '', '', '', '', '54,55,56,57,58,59,60,61,62,63');

-- ----------------------------
-- Table structure for list_47
-- ----------------------------
DROP TABLE IF EXISTS `list_47`;
CREATE TABLE `list_47`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hits` int(10) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `publishTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_47
-- ----------------------------
INSERT INTO `list_47` VALUES (46, 65, 0, '康索特携手深促会赴桂拓展商业合作', '2021-06-13 02:01:34', '2021-06-13 14:52:08', '<p>7月10日，深圳市<a title=\"康索特\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">康索特软件有限公司</a>总经理何龙源、深教促进会执行秘书长岳耀颀等一行受邀赴桂，与广西北部湾投资集团有限公司就智慧水务在教育领域的应用及合作模式等展开探讨。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;北投董事长韦勇球对客人的来访表示欢迎，并介绍北投集团山泉直饮水技术研究成果和应用情况，双方通过沟通交流，进一步明确了未来的合作空间。深圳市康索特软件有限公司已在直饮山泉水系统的研发、大数据监控及运营服务等方面与上善若水公司开展了业务上的合作。深圳市康索特软件有限公司总经理何龙源表示，康索特在智能信息化领域拥有十余年的技术和经验积累，拥有基于信息化解决方案+智能终端研发和生产+移动智能信息化系统业务整合的综合项目交付能力，为上善若水公司及北投集团的业务在智能信息化方面提供最专业的服务。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;近十年来，康索特累计了全国100多家高校、200多家中小幼学校，1000多家企事业单位。未来，在技术开发、产品合作、市场拓展等方面有很大的合作前景。上善若水公司直饮山泉水在教育领域的市场开发上，也将有着广阔的合作预期。上善若水副总经理苏健对于双方的合作表示肯定，看好未来合作方向。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;随后，岳耀颀执行秘书长与广西北部湾水务集团总经理、上善若水公司董事长蒋建谊就深教促进会与北部湾水务集团合作方向、合作模式等方面展开探讨。深教促进会是目前深圳市教育信息化产业号召力最强、资源最丰富的协会之一，掌握了深圳市600多家中小学教育机构教育系统智能信息化资源，已有正式会员300家，准入会员200多家，覆盖深圳地区所有学校，辐射广东省乃至全国学校。岳耀颀执行秘书长指出，深教促进会是一个教育生态的大平台，核心是促进产业发展，在服务学校上，我们不仅关注教学教务管理，更关心学生健康，促进会会员企业从多方面研发并服务学校，通过促进会平台扩大影响力，为教育事业发展做出贡献。上善若水公司的智慧水务业务也将填补教育领域在该行业的空白，通过建立示范校、切入新建校等方式，以高标准的饮水服务于教育行业，必将迅速传播品牌形象，带来良好的经济效益和社会效益。</p>', '', '/upload/images/cV8Boqr5oeW1.png', '', '', '', '', 1, 0, '2018-09-28 05:25:00');
INSERT INTO `list_47` VALUES (45, 65, 0, '财政部：PPP项目落地周期开始缩短 投资增速4倍以上', '2021-06-13 02:00:45', '2021-06-13 14:51:26', '<p>3月7日，财政部部长肖捷在记者会上表示，PPP在中国还处于探索阶段，PPP项目的落地周期开始缩短，投资规模增长4倍多。</p>\n<p>　　会议现场记者问及PPP(政府和社会资本合作)项目推进过程中面临的问题时，肖捷回答说，PPP在中国还处于探索阶段。客观上，各方面对这个问题的认识和实践能力的提升，都需要一个过程。随着各项工作的推进，我们国家PPP项目的落地周期已经开始缩短，落地的速度也在不断加快。</p>\n<p>　　肖捷解释，PPP项目普遍资金规模比较大，涉及领域也比较广，同时专业性也很强，如果前期准备、论证不充分，会给项目后续带来不良影响。同时，有关PPP项目的信息发布后，社会资本也要有一个适应期和响应期，这些都需要时间。</p>\n<p>　　他进一步指出，在关注PPP项目落地率的同时，也应该关注项目的规范实施和风险防范。</p>\n<p>　　肖捷补充介绍，截至去年底，已经签约落地了1351个PPP项目，总投资达到2.2万亿元，项目落地率已经超过30%，与年初相比，无论是项目落地的数量，还是投资规模，都增长了4倍多。下一步，财政部将继续发挥好财政资金的引导作用，进一步优化项目融资的环境，加大业务支持和项目推介的力度，推动PPP项目更加规范运作。</p>', '', '', '', '12', '12', '12', 0, 0, '2018-03-28 21:22:00');
INSERT INTO `list_47` VALUES (44, 65, 0, '关于PPP咨询机构库信息公开的公告', '2021-06-13 01:56:34', '2021-06-13 14:50:39', '<p>来源：财政部PPP中心</p>\n<p>&nbsp;</p>\n<p>为贯彻落实财政部《政府和社会资本合作（PPP）咨询机构库管理暂行办法》（财金〔2017〕8号，以下简称《办法》），切实做好PPP咨询机构库首批机构入库工作，财政部PPP中心对按时在线注册和提交业绩信息的咨询机构进行了核查，重点审查委托方是否为政府、政府有关职能部门和事业单位，业绩信息是否真实、是否属于PPP服务内容等。现有406家机构符合《办法》入库条件，作为首批入库机构纳入咨询机构库并予信息公开；有少量机构不符合《办法》入库条件，本次不予入库，也不列入退库名单和黑名单。</p>\n<p>请访问www.cpppc.org &ldquo;机构库信息公开&rdquo;栏目查看入库机构及其服务业绩。财政部PPP中心将根据《办法》对入库机构加强管理。同时，欢迎全社会持续监督，发现违反《办法》规定或不符合上述条件的，可发送邮件到cpppc@cpppc.org进行举报。</p>\n<p>欢迎委托方（政府方）在机构库注册后对咨询机构进行评价，评价结果将予以公开。</p>\n<p>此外，对于目前信息公开内容中尚未包括咨询合同签字盖章页的入库机构，请于本公告之日起30日内按机构库内操作提示重新录入合同相关页。逾期未录入的，将公开此前已录入的全部合同信息。</p>\n<p>特此公告。</p>\n<p>&nbsp;</p>\n<p>财政部政府和社会资本合作中心</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2017年9月8日</p>', '', '', '', '', '', '', 0, 0, '2018-03-29 13:22:00');
INSERT INTO `list_47` VALUES (47, 65, 0, '康索特联手腾讯，强化科技引领，助推教育发展', '2021-06-13 02:02:07', '2021-06-13 14:52:41', '<p>4月份，教育部在印发的《教育信息化2.0行动计划》中明确指出：&ldquo;教学应用覆盖全体教师、学习应用覆盖全体适龄学生、数字校园建设覆盖全体学校，信息化应用水平和师生信息素养普遍提高，建成&lsquo;互联网+教育&rsquo;大平台，推动从教育专用资源向教育大资源转变&rdquo;。在国家的政策支持下，教育信息化建设已在全国范围内全面开展。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;8月8日，<a title=\"康索特\" href=\"http://www.dikaedu.com/about\" target=\"_self\">康索特</a>走进腾讯，围绕智慧校园教育信息化领域技术交流，共同探索教育信息化2.0背景下智慧校园的关键技术应用。明确通过大数据、人工智能、物联网技术与教育、教学、管理等多维教育场景的深度融合，着力推进高校智慧校园的打造，致力新科技与教育的深度融合，助推教育发展变革。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; 当前，教育信息化进程不断推进，我国各大高校信息化在未来的主要发展方向就是智慧校园。目前，大部分高校正处于由&ldquo;数字校园&rdquo;向&ldquo;智慧校园&rdquo;转型的过渡期，数字校园已初步完成了教育信息大跨越，高校教育资源信息的集成与整合也已初步实现。但大部分高校数字化校园的建设仍处于完善与发展阶段，在对用户的服务上，存在着支撑能力较弱、缺乏深入的应用融合等弊端，对高校教育信息资源的传播与分享造成了较大影响，在一定程度上阻碍了各高校信息化发展。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;康索特基于对行业的深刻洞察，本次联手腾讯推出的<a title=\"智慧校园一卡通解决方案\" href=\"http://www.dikaedu.com/product\" target=\"_self\">智慧校园一卡通解决方案</a>旨在助力高校完成校内外业务系统深度融合，通过手机端智能交互，实现教务管理移动化、身份认证无卡化、校园应用一体化以及校内通知泛在化，有效提升高校教学管理水平。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;智慧<a title=\"校园一卡通\" href=\"http://www.dikaedu.com/\" target=\"_self\">校园一卡通</a>解决方案充分利用移动互联网的普及，以微信资源为依托，可实现教育主体全覆盖，让教育信息化建设发挥最大限度作用。通过互联网+大数据的共享和利用上，康索特充分发挥腾讯在大数据等领域的优势，通过丰富应用获取的信息将形成完整丰富的数据库，经过移动智慧校园的分析，清晰直观展示各方面的运营情况，为学校管理和决策提供切实可行的数据支持，有助于校方及时优化调整学校发展方向与策略，提高学校的科学决策水平。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;康索特联手腾讯，强化科技引领，公司将持续探索技术与教育的深度融合，致力于教育信息化技术与产品的研发，助力高校信息化水平提升，让数据发挥更大价值，为人才培养和教学目标达成创造有利条件。</p>', '', '', '', '', '', '', 0, 0, '2018-09-28 13:22:00');
INSERT INTO `list_47` VALUES (48, 65, 0, '康索特应邀参加“2018鼎桥TDOS生态伙伴大会”', '2021-06-13 02:02:38', '2021-06-16 17:23:01', '<p><strong>聚合行业翘楚 共建国产操作系统生态圈</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;四月北京，春风拂面，4月16日，2018鼎桥TDOS生态大会在北京国家会议中心圆满举行。此次盛会，是汇聚各领域精英、展现最新科创成果、表达打造TDOS国产自主创新操作系统生态圈诚意的重要战略举措。亦是积极响应网络安全国家战略，加速网络安全设备国产自主化、成功构建安全可控信息技术体系、推进创新移动化办公操作系统成熟应用的里程碑。康索特作为司法领域合作伙伴应邀参会，共商智慧监区建设新篇。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp;&nbsp;<strong>&nbsp; &nbsp;中国工程院倪光南院士在大会讲话中指出：中国为什么要打破wintel的垄断？</strong>构成Wintel体系的windows操作系统和CUP，两者是该领域的和核心技术，采用wintel体系就必然在这两项核心技术上受制于人，既无法保障网络安全，也无法保障产业发展。在卫星导航领域，我们已经能用&ldquo;北斗&rdquo;体系替代GPS体系，在高端通用芯片和操作系统所构成的技术领域，应以此为榜样，靠生态圈同仁不断努力。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>近日美国商务部宣布，未来7年将禁止美国公司向中兴通讯销售零部件、商品、软件和技术。美国对中兴通讯一芯封喉事件，激发起国人普遍的忧患意识。各路英雄开始刷屏，为中国技术的核心能力和底层技术而担忧。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 华为总裁任正非早在做芯片和操作系统之初时表示，华为需要做手机操作系统和芯片，这主要是出于战略的考虑，因为假如这些垄断者不再对外合作的话，华为自己的操作系统可以顶得上。目前,全球手机操作系统主要是谷歌Android、苹果iOS、微软Windows Phone 三足鼎立，形成了各自的生态圈，留给其他终端OS的机会窗已经很小。任正非明确指出，&rdquo;华为现在做终端操作系统是出于战略的考虑，如果他们突然断了我们的粮食，Android系统不给我用了，Windows Phone系统也不给我用了，我们是不是就傻了？&rdquo;&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;海思芯片已经获得了市场用户的认可，适当减少了对美国的依赖。同样，经过八年的不断创新，TDOS已演变成一套极其成熟、稳定的操作系统，相较于Android系统，TDOS在性能、安全等设计方面有着更加深度的增强，如拥有专属账号管理、对后台应用的管控更加严格、功耗更低、系统续航时间更长，支持双系统分别升级更加保证安全性等。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp;&nbsp;<strong>&nbsp;&nbsp;<a title=\"康索特\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">康索特</a>作为司法系统解决方案生态合作伙伴</strong><strong>，</strong><strong>以完善的移动安全管理产品为着力点，提供&ldquo;端&mdash;管&mdash;云&rdquo;的一站式安全服务。</strong>同时深入行业客户，定制开发贴合监狱和戒毒所干警的移动办公应用，及监区信息化系统。助力客户打造智慧监区！康索特+鼎桥TDOS警务通解决方案结合华为旗舰手机Mate系列和国产终端操作系统（TDOS），形成贴合监狱/戒毒等特殊执法环境的移动信息化办公系统。</p>', '', '', '', '', '', '', 0, 0, '2018-09-28 05:22:00');
INSERT INTO `list_47` VALUES (49, 65, 0, '热烈庆祝康索特乔迁之喜，立足新起点 谋求新跨越', '2021-06-13 02:03:09', '2021-06-13 14:53:46', '<p>岁月流转，匆匆复匆匆，拽不住时光的脚步，又到了下一站的路口，2018年12月05日，天高云淡，气爽风清。在这个值得纪念的日子里，深圳市康索特软件有限公司，由原办公地乔迁至深圳市南山区深圳湾科技生态园10栋A座27楼，顺利完成新知乔迁。</p>\n<p>&nbsp;</p>\n<p>近些年来，康索特积极响应党和国家的号召，紧紧围绕国家发展战略规划，开展具有前瞻性的部署，公司致力于人工智能产业发展，依托在人工智能领域的研发积累，开展智能校园、智能通讯、智能政企、智能司法等领域产品自主研发，重点推动智能专用装备、智能应用解决方案在四大领域中的应用，加快推进产业智能化升级。</p>\n<p>&nbsp;</p>\n<p>随着行业市场需求的不断变化，公司业务模式也出现了产品业务、系统业务、综合运营服务、融合应用服务等多种发展模式，目前，康索特经历从单一产品衍生至覆盖全系列的各类智能化装备、智能应用平台及软件的产业转型后，已逐步向整体解决方案、定制化软件设计开发、软件服务领域转型。</p>\n<p>&nbsp;</p>\n<p>可持续性是康索特开展一切商业活动的核心，康索特始终坚持以技术创新为主导，以核心技术实力保障领先产品竞争力。公司在人工智能+物联网领域不仅拥有完整的从开发到量产的解决方案，而且具备定制化设计和技术支持的全面能力、更掌握了核心生产工艺技术。通过高度整合及深度客制化，将为客户提供差异化空间，增加产品独特卖点。</p>\n<p>&nbsp;</p>\n<p>多行业一站式移动智能管理整体解决方案，将为客户提供多种选择模式，康索特自由研发及运营中心，拥有多名FAE工程师和多名研发人员，从方案选择到场景应用的每个环节都能为客户提供高质高效的服务，缩短项目开发周期，降低研发成本，确保软件性能。在技术支持方面，我们提供完整的参考设计、软件、技术文档、各种O/S固件和驱动程序支持。采用领先的科技和高效的服务带来的模式变化和效率提升。</p>\n<p>&nbsp;</p>\n<p>基于&ldquo;用心、诚信&rdquo;的经营原则，及服务各类学校信息化建设的丰富经验，在日益完善的经验和服务体系，康索特致力以先进的产品与技术，服务于社会的智能化建设事业，为提供业界最专业的智能信息化领域解决方案及服务。基于&ldquo;专注、职业&rdquo;的设计原则，康索特拥有一批专业素质极强的方案设计团队，在所设计的项目中都能取得最优结构体系和设计经济指标。</p>\n<p>&nbsp;</p>\n<p>我们始终信奉，细节将决定成败，诚信立足市场的理念。唯有努力做好，才能长久发展，深圳市康索特软件有限公司之所以能够获得别人想象不到的成功，是因为康索特人一直在坚持不懈的努力。&ldquo;长风破浪会有时，直挂云帆济沧海&rdquo;，满载着全体员工的美好期盼和坚持不懈，康索特将不断向着光明的理想彼岸进发！</p>\n<p>&nbsp;</p>', '', '', '', '', '', '', 27, 0, '2018-12-05 13:22:00');
INSERT INTO `list_47` VALUES (50, 65, 0, '康索特庆祝司龄及员工生日快乐', '2021-06-13 02:03:42', '2021-06-13 14:54:07', '<p>心在飞扬，情在高昂。圣诞节我们在一起，聆听这美妙的钟声。深深祝福，丝丝情谊，串串思念，化作一份礼物，留在你的心田，<a title=\"\" href=\"http://www.dikaedu.com/about1/\" target=\"_blank\" rel=\"noopener\"><strong>康索特</strong></a><strong>祝你圣诞快乐！</strong></p>\n<p>&nbsp;</p>\n<p>圣诞节碰上公司生日，还碰上员工生日，在这样一个三喜临门的日子里，我们欢聚一堂来庆祝这美好的日子。康索特自成立以来就关注员工的成长与发展。公司是一个大家庭，每个成员都是这个大家庭中的一员，生日会让员工在紧张繁忙的工作之余，感受到这个大家庭的温暖和同事们的关怀，增强了员工的归属感和集体凝聚力。</p>\n<p>&nbsp;</p>\n<p>生日会我们也设置了很多的游戏环节，与员工一起分享快乐，现场笑声不断、热闹非凡。因为快乐可以传染，&ldquo;赠人玫瑰，手有余香&rdquo;，给别人快乐，自己也能快乐。活动上，公司还未为了保证每位寿星都能感受到公司的关爱，公司领导精心为每位寿星准备了精美礼物。</p>\n<p>&nbsp;</p>\n<p>借这样一个特殊的日子，我们祝愿公司的每一位员工健健康康、开开心心、快快乐乐，也祝愿公司秉承&ldquo;创造有价值的产品，把有价值产品做好、做精、做到极致，服务于社会信息化教育建设事业&rdquo;<strong>&nbsp;愿<a title=\"\" href=\"http://www.dikaedu.com/about1/\" target=\"_blank\" rel=\"noopener\">康索特</a>在智慧<a title=\"\" href=\"http://www.dikaedu.com/\" target=\"_blank\" rel=\"noopener\">校园一卡通</a>解决方案提供的道路上越做越好。</strong></p>', '', '', '', '', '', '', 19, 0, '2018-12-26 13:22:00');
INSERT INTO `list_47` VALUES (51, 65, 0, '康索特祝辛勤的园丁们，教师节快乐！', '2021-06-13 02:04:07', '2021-06-13 14:54:27', '<p>&nbsp;今天是可爱的园丁们的节日，作为智慧<a title=\"校园一卡通系统\" href=\"http://www.dikaedu.com/product\" target=\"_self\">校园一卡通系统</a>解决方案提供商，康索特向全天下辛勤的园丁们道一句&ldquo;您辛苦了&rdquo;！</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp;&nbsp;<strong>教师节是哪一年定为节日的呢？</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp;&nbsp;1985年1月21日，第六届全国人大常委会第九次会议作出决议，将每年的9月10日定为我国的教师节，用以感谢传道授业解惑的教师。教师们被誉为人类灵魂的工程师，教师职业常被誉为太阳底下最光辉的职业。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp;<strong>&nbsp;为什么建立教师节？</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;建立教师节，是为了进一步提高人民教师的政治地位和社会地位，逐步使教师的工作真正成为社会上最受人尊重、最值得羡慕的职业之一，形成尊师重教、尊重知识、尊重人才的社会风气；有利于全社会关心教育事业，有利于提高整个中华民族的科学文化素质。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;建立教师节，标志着教师受到全社会的尊敬。这是因为教师的工作在很大程度上决定着国家的未来。教师的工作同每个家庭、每个儿童、少年、青年息息相关。在人类社会的发展和进步中，教师起着巨大的作用。教师是铸造人类文明的工程师，是人类文明的传播者和建设者。人类文明发展的连续性，有赖于一代又一代的教师的劳动。一个社会、一个国家、一个民族，如果没有教师辛勤的、有效的劳动，那么，这个社会、国家和民族的文明进程就会遭受损失。所以，一部文明史，离开教师的因素，是不可想象的。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>一首诗歌送给全天下的老师们：</strong></p>\n<p>&nbsp;</p>\n<blockquote>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<em>玉壶存冰心，朱笔写师魂。谆谆如父语，殷殷似友亲。轻盈数行字，浓抹一生人。寄望后来者，成功报师尊。</em></p>\n</blockquote>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;作为领先的智慧<a title=\"校园一卡通\" href=\"http://www.dikaedu.com/\" target=\"_self\">校园一卡通</a>解决方案提供商，康索特，是一家与教师密切相关的公司，能给教师带来更高效，便捷的教学方式，方便教师的教学课程管理，学生沟通和管理，及学校的一体化管理。致力于为中国的教育事业改革贡献自己的力量。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;公司自成立以来，专注于校园智能管理领域，坚持以技术创新为主导，核心技术实力保障领先产品竞争力。公司在校园智能管理领域不仅拥有完整的从开发到量产的解决方案，而且具备定制化设计和技术支持的全面能力、更掌握了核心生产工艺技术。通过高度整合及深度客制化，为客户提供差异化空间，增加产品独特卖点。&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;秉承&ldquo;创造有价值的产品，把有价值产品做好、做精、做到极致，服务于社会信息化教育建设事业&rdquo;企业发展宗旨，准确地把握信息化对传统教育模式带来深刻变革的大趋势，通过运用云计算和大数据技术为教育行业提供一揽子智慧校园解决方案及服务，<a title=\"康索特\" href=\"http://www.dikaedu.com/\" target=\"_self\">康索特</a>一直引领着教育信息化的创新潮流，坚持自主创新及品牌战略，并相信科技是教育领域中最为活跃的细胞。</p>', '', '', '', '', '', '', 0, 0, '2018-09-28 13:22:00');
INSERT INTO `list_47` VALUES (52, 65, 0, '康索特腾讯强强联合，“互联网+AI”助力教育信息化2.0', '2021-06-13 02:05:13', '2021-06-13 14:54:54', '<p>8月6日，由教育部装备研究与发展中心、广东省教育厅教育技术中心、深圳市教育局教育信息技术中心指导，深圳市教育信息化产业促进会主办的教育信息化2.0研讨会暨深促会2018年会员大会在深圳福田区万豪酒店大会议厅隆重举行。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;近300名区域教育局领导、信息（电教）中心主任、中小学校长、教育信息化企业等齐聚深圳，共同探讨教育信息化2.0时代下行业未来发展之路。分享智慧校园的发展成果与经验。作为深促会副会长单位、<a title=\"校园智能管理\" href=\"http://www.dikaedu.com/product\" target=\"_self\">校园智能管理</a>领域的专家--深圳市<a title=\"康索特软件\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">康索特软件</a>有限公司应邀出席本次会议。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;会议由深教促进会执行秘书长李亮主持，李烈相会长首先代表深教促进会致欢迎词，随后深圳市教育信息技术中心杨焕亮主任发表致辞，杨主任强调，信息化是教育现代化的引擎和特征，教育信息化2.0是对信息技术重塑新时代教育理念、体系和内容的高度概括。教育信息化必须坚持&ldquo;育人为本&rdquo;、&ldquo;为每个学生提供最适合的教育&rdquo;的原则，发掘学生潜质、激发学生兴趣，指导学生自主学习，引领学生在其最有天资、最有兴趣、相对最有益于社会的领域成就个人最大价值。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;在教育信息化2.0时代下，各种新技术层出不穷，教育变得越来越便捷，越来越智慧。作为深圳市教育产业促进会副会长单位、<a title=\"校园智能管理\" href=\"http://www.dikaedu.com/product\" target=\"_self\">校园智能管理</a>领域的专家，在本次教育信息化2.0研讨会上<a title=\"康索特\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">康索特</a>总经理何龙源发表了精彩的演讲。何总表示，教育信息化建设过程一般要经历硬软项目、业务融合、数据贯通三个阶段，在当前教育信息化2.0时代，信息技术和智能技术将会继续深度融合到教育全过程，以&ldquo;数据建设为中心&rdquo;，对区域及智慧校园建设进行统筹规划和顶层设计，消除架构零散、数据缺失、孤岛壁垒等诸多信息化建设问题，不断构建师生、事、物、场景、时间、地点的数据化虚拟空间，逐步实现事物数据化、终端一体化。&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<a title=\"康索特软件\" href=\"http://www.dikaedu.com/about\" target=\"_self\">康索特软件</a>作为协会校园智能管理领域的优秀企业代表，结合教育部教育信息化2.0智能+校园的建设要求，在本次会议发布了与腾讯公司联合推出的腾讯微信<a title=\"校园卡\" href=\"http://www.dikaedu.com/\" target=\"_self\">校园卡</a>虚拟<a title=\"一卡通解决方案\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">一卡通解决方案</a>。会议展示期间，得到与会嘉宾和合作伙伴的高度好评，赢得上百家企业的驻台关注。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;该方案依托腾讯公司强大的微信入口和互联网技术，凭借康索特软件多年积累的电信级软硬件产品能力，充分运用物联网及智能AI技术优化校园环境，整合了移动支付、人脸识别、掌上校园增值应用产品。创新解决师生刷卡微信代扣支付难题，完善建立校园支付、身份识别、移动应用的产品框架，从一张卡升级迭代到一个码、一张脸走遍校园，实现统一入口、统一融合云平台、全面感知（物联网、人工智能）的产品新形态。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 康索特前身是华为内部创业公司，拥有华为基因，公司秉承创造价值，达人达己的价值观，以客户为中心的经营理念，康索特始终聚焦战略，自主创新，准确地把握信息化对传统教育模式带来深刻变革的大趋势，公司积累了10余年的电信级产品研发经验及服务经验，同时结合自身技术优势，面向教育行业打造了康索特微信<a title=\"校园卡\" href=\"http://www.dikaedu.com/\" target=\"_self\">校园卡</a>虚拟一卡通产品、<a title=\"校园一卡通\" href=\"http://www.dikaedu.com/\" target=\"_self\">校园一卡通</a>虚拟产品、智慧校园产品、数字化校园产品等等，通过运用云计算、大数据技术、移动互联技术、人工智能技术为教育行业提供一揽子智能化校园解决方案及服务，公司致力以先进的产品与技术，服务于社会的信息化教育建设事业。</p>', '', '', '', '', '', '', 2, 0, '2018-09-28 13:22:00');
INSERT INTO `list_47` VALUES (53, 65, 0, '贵州遵义软件园管委陈主任一行到访康索特进行交流研讨', '2021-06-13 02:06:13', '2021-06-13 14:55:15', '<p>1月22日下午贵州遵义市软件园（大学生创新创业园）管委陈致豫主任、行政主管、招商主管等一行莅临深圳市康索特软件有限公司拜访交流。康索特总经理何龙源及大匠智联总经理刘震、康索特总经理助理洪李明以及康索特相关负责人陪同参与研讨。</p>\n<p>作为国内领先的AIOT应用场景解决方案提供商，公司成立于2006年，注册资金2316万，员工130多人，深耕智慧领域12年，已发展成为一家致力于运用人工智能、云计算和大数据技术，打造智能物联的应用生态圈，为多行业提供一揽子AIOT应用场景解决方案的互联网企业。公司凭借卓越的技术水平以及优秀的客户服务意识，在客户的高度认可中不断壮大，目前已是国家级高新技术企业，深圳市重点双软企业。</p>\n<p>&nbsp;</p>\n<p>各单位领导一行首先参观了康索特产品体验中心的多款信息化设备，体验了新时代下人工智能与物联网深度融合的应用模式。详细了解了康索特产品方案体系、营销概况、研发团队、人才培育、企业发展规划等情况。对康索特软件&ldquo;以市场为导向，为多行业提供AIOT应用场景解决方案&rdquo;的经营理念与企业定位给予高度认可。</p>\n<p>&nbsp;</p>\n<p>遵义软件园（大学生创新创业园），是在贵州省大数据发展战略的引领下，在&ldquo;大众创业、万众创新&rdquo;的号召下应运而生，并作为遵义市委、市政府重点打造的对外开放平台，承载着遵义市创新新引擎的战略任务和目标。3年来，建成省级双创孵化示范基地1个、智能终端研发基地1个，并全面启动了软件园一期35.8万平方米主体建设。成功设立了创业投资基金2支，总规模1.9亿元。吸引入驻了惠普、光启、禾苗、启迪、HTC、斐讯、博岳通信、华普亿方等龙头企业。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>研讨会上，陈会长表示，&rdquo;鉴于贵阳当前重点发展大数据储存的事实，我们将重点发展大数据挖掘、分析和应用，实现区域错位发展。&ldquo;我们将以新蒲&lsquo;云端号&rsquo;空间大数据示范平台项目为依托，推进数据新蒲、智慧新区建设。项目总投资1.4亿元，主要建设基于空间信息化的智慧城市系统，以系留浮空器为基础平台，搭载通信及遥感监测等设备，实现新区大数据搜集、开发、应用和智慧化管理。&rdquo;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;双方在会上进行深入的交流，康索特何总也表示未来将在园区在大数据、信息服务产业上的协作发展，实现资源共享与互补，贯彻落实深化区域信息化深入融合及企合作的精神，多措施扩大政企合作规模，拓宽融合渠道，助力新区新区软件（大数据）产业发展。</p>', '', '', '', '', '', '', 11, 0, '2019-01-25 13:22:00');
INSERT INTO `list_47` VALUES (54, 65, 0, '新一年，为梦想起航！康索特2018年年终尾牙庆典活动', '2021-06-13 02:06:50', '2021-06-13 14:55:34', '<p>历经奋斗而愈加芬芳，历经拼搏而更添娇媚，一种信念，用激昂的青春来记录回首的每一个传奇，一种文化，用绽放的姿态来呼喊未来的下一个飞跃。时值岁末年初之际，恰逢康索特软件成立十二周年，<strong>企业的发展就像一条川流不息的大河，有时汹涌澎湃，有时涓涓细流。这十二年是公司发展的十二年，更是一个满怀激情的新起点。</strong>在这个格外值得纪念的时刻，康索特软件于2019年1月12日在深圳软件生态园五十弦商务音乐酒楼举行了盛大隆重的2018年年终尾牙晚会活动。活动历时3个小时，节目精彩纷呈、现场气氛热烈，大家相聚一起度过了皆大欢喜的难忘夜</p>\n<p>&nbsp;</p>\n<p>&ldquo;日月如流，尺壁寸阴。回眸十二年风雨坎坷路，说不完的酸甜苦辣，道不尽的斗志激昂，我们一起携手走过了平凡而又不平凡的十二年。该铭记于心的太多，该感谢的也太多，十二年的雨雪风霜，十二年的起伏延宕，十二年的披荆斩棘，让我们坚强，让我们成长。&rdquo;<strong>现场康索特总经理何龙源回顾十二年来的征程，无数的新老康索特人挥洒青春，激情与汗水铸就了康索特十二年的持续发展。是你们大家的辛勤付出，铸就了康索特今天的辉煌，在康索特的每一个辉煌的日子都必将铭记你们。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p>过去的一年来，康索特在不断加强科技创新的同时，实现了企业健康良好、稳步持续的发展，真正的成为国内领先的智能信息化解决方案提供商。新的一年，康索特将为梦想启航，跨越新生，迎来新起点。<strong>在充分了解内外环境形势的情况下,我们坚信康索特将有理性、有信心地走好自己的可持续发展道路。总经理何龙源号召全体员工2019年继续发挥团结协作、鼓励创新的精神，让我们为市场交上一份满意的答卷。</strong></p>\n<p>&nbsp;</p>\n<p><strong>随后，开始了丰富多彩的年终尾牙庆典的文娱活动，员工们纷纷各展所长，他们用高亢嘹亮、激情澎湃的演唱传递温暖，用唯美如画，热情的舞蹈带来欢笑，用传统曲艺、诙谐幽默的情景表演给大家送上最真的十二年祝福。</strong>以其精彩绝伦的表演，博得了现场观众和宾客们的阵阵喝彩。所有节目全部为康索特的员工们利用业余时间用心排练而成。同时，伴随着激动人心的抽奖环节，更是将整个年会推向高潮，歌声、掌声、欢呼声一直在会场上空荡漾。</p>\n<p>&nbsp;</p>\n<p>浴火重生，凤凰涅槃。毛主席曾经语重心长地指出：&ldquo;一张白纸好画最新最美的图画&rdquo;；过去是终点，也是未来新的起点。站在这样一个新的历史起点上，经历苦与甘，悲或喜，在我们这些人的手中诞生一个什么样的新康索特？<strong>让我们所有康索特人一起悉心经营，朝夕必争，分秒必夺，力争更大的发展和更长足的进步，用我们这个精诚协作、激情昂扬的团队，与所有关系、支持我们的朋友一道，去赢得新一年的光荣与辉煌！</strong>2019年，让我们一起乘风破浪。</p>', '', '', '', '', '', '', 6, 0, '2019-01-28 13:22:00');
INSERT INTO `list_47` VALUES (55, 65, 0, '深圳康索特应邀参加黑河学院60周年校庆', '2021-06-13 02:07:18', '2021-06-13 14:56:13', '<p>&nbsp;2018年9月28日，黑龙江黑河学院，迎来了60周年华诞。弹指60年，黑河学院循着高等教育改革发展的铿锵足音，&ldquo;立足北疆、服务地方、面向大众、突出应用&rdquo;，黑河学院服务边疆经济社会的初心不改，将地理区位优势与教育信息化建设相结合，大力发展现代化高等教育。<strong>作为领先的智慧</strong><strong>校园一卡通</strong><strong>产品方案提供商，<a title=\"康索特\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">深圳市康索特软件有限公司</a>也应邀参加了此次活动。</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;黑河学院（Heihe University）坐落在国家首批沿边开放城市&mdash;&mdash;黑河市，与素有&ldquo;大学城&rdquo;美誉的俄罗斯布拉戈维申斯克市隔江相望，是中俄边境线上中国境内唯一一所省属普通高等本科院校。该校主动适应高等教育发展形势，坚持改革创新，强化内涵发展，全面提升质量。在60年的办学历程中，学校始终以培养区域型人才、服务边疆发展、弘扬地方文化为己任，逐渐形成了&ldquo;艰苦创业、自强不息、创新发展、育人戍疆&rdquo;的办学精神。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;近年来，黑河学院加强信息化建设驱动学校改革发展，为了全面推进学校教育、教学及管理的信息化建设，进一步提升广大师生的信息素养和驾驭信息技术的能力，提高学校信息化的应用水平和效能，锤炼学校信息化办学特色，学校引入了<a title=\"校园一卡通系统\" href=\"http://www.dikaedu.com/product\" target=\"_self\">校园一卡通系统</a>平台解决方案，以物联网，云计算、大数据等技术构建一个智慧化学习场景，打造现代化多媒体教学、生活、管理、学习应用空间，使得学校信息化建设工作有了新的跨越。为了迎接这次校庆，学校在最大的宿舍上线了先进的人脸识别通道系统，即人工智能门禁一卡通，这是康索特本次活动的重头戏。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;康索特作为国内领先的智慧<a title=\"校园一卡通\" href=\"http://www.dikaedu.com/\" target=\"_self\">校园一卡通</a>解决方案提供商，公司开发的产品旨在打造覆盖全面、高效稳定、安全可靠的统一平台，消除信息孤岛和应用孤岛，建设能对校园的各项服务管理工作和广大教职工提供便捷服务。自成立以来，坚持以技术创新为主导，核心技术实力保障领先产品竞争力，通过高度整合及深度客制化，为黑河学院提供差异化空间，增加产品独特卖点。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;通过参加本次黑河学院的校庆活动，我们更加坚定做好智慧校园信息化建设的道路，为了让行动更有力量，<a title=\"康索特\" href=\"http://www.dikaedu.com/about/\" target=\"_self\">康索特</a>将围绕社会和客户的需求持续创新。以专业技术能力和丰富的实践经验，为行业客户提供全面咨询服务，量身定做行业相关应用及通用方案的整体信息化解决方案。</p>', '', '', '', '', '', '', 4, 0, '2019-01-28 13:22:00');
INSERT INTO `list_47` VALUES (56, 65, 0, '恰逢盛世猪如象；喜庆新春鱼化龙，康索特祝您2019猪事顺利', '2021-06-13 02:07:47', '2021-06-13 14:57:17', '<p>律回春晖渐，万象始更新。过去的一年，康索特历经坎坷而更加辉煌，我们告别成绩斐然的2018，迎来充满希望的2019.在缤纷的焰火和欢快的乐曲中，新的一年向我们走来。辞旧迎新之际，我们总是百感交集、思绪万千。在新的一年,我们有许许多多的事情要做,有许许多多的任务要去完成,我们将面临新的机遇。值此佳节之际,祝所有员工及新老客户,新年快乐，猪事顺利，阖家幸福。</p>\n<p>过去的一年，康索特在不断加强科技创新的同时，实现了企业健康良好、稳步持续的发展，真正在的成为国内领先的智AIOT（智能物联）应用场景解决方案提供商。新的一年，康索特将为梦想启航，跨越新生，迎来新起点。在充分了解内外环境形势的情况下,我们坚信康索特将有理性、有信心地走好自己的可持续发展道路。</p>\n<p>&nbsp;</p>\n<p>&nbsp;&nbsp;&nbsp;浴火重生，凤凰涅槃。毛主席曾经语重心长地指出：&ldquo;一张白纸好画最新最美的图画&rdquo;；过去是终点，也是未来新的起点。站在这样一个新的历史起点上，经历苦与甘，悲或喜，在我们这些人的手中诞生一个什么样的新康索特？这是每一个康索特人都必须面对、必须正视、必须思考的问题。愿我们所有康索特人一起悉心经营，朝夕必争，分秒必夺，力争更大的发展和更长足的进步，用我们这个精诚协作、激情昂扬的团队，与所有关系、支持我们的朋友一道，去赢得新一年的光荣与辉煌！2019年，让我们一起乘风破浪。</p>', '', '/upload/images/exBWXbTdWZGF.JPG', '', '', '', '', 9, 0, '2019-01-31 13:22:00');
INSERT INTO `list_47` VALUES (57, 65, 0, '康索特出席深促会2019年度第一届第七次常务理事会', '2021-06-13 02:08:10', '2021-06-16 17:21:09', '<p>2019年2月25日下午深圳教育信息化产业促进会第一届第七次常务理事会在深圳研祥科技大厦隆重举行，会上大家热烈的讨论了E380计划。E380打造教育装备航母，搭载各会员企业共同出海！康索特作为深教促进会的常务理事单位，有幸为E380计划添砖加瓦。</p>\n<p>&nbsp;</p>\n<p>康索特作为国内领先的AIoT应用场景解决方案提供商，公司成立于2006年，注册资金2316万，员工130多人，依托多年来电信行业的技术、人才、管理积累，专注于智能物联产品研发、生产、销售、服务。目前已发展成为一家致力于运用人工智能、物联网、云计算和大数据技术，打造智能物联的应用生态圈，为多行业提供一揽子AIOT应用场景解决方案的高科技企业。公司凭借卓越的技术水平以及优秀的客户服务意识，在客户的高度认可中不断壮大，目前已是国家级高新技术企业，深圳市重点双软企业。</p>\n<p>&nbsp;</p>\n<p>本次常务理事会议议程分为上下两部分，上半场就金融&amp;资本对接进行了深入沟通交流与讨论；下半场异度云张总分享了异度云的成功经验，广东同宏邵总介绍了E380计划的最新进展，并开展了现代教育装备评估中心说明会。会上康索特总经理何龙源先生就促进会未来发展，会员之间的合作，促进会与政府的沟通以及E380计划建设等方面的话题进行了深度沟通与交流。</p>\n<p>&nbsp;</p>\n<p>一直以来，深教促进会致力于为会员建立会员和会员之间，会员与政府、市场、企业之间的沟通平台，帮助会员整合资源、促进会员企业发展。深教促进会旨在&ldquo;聚行业精英，促教育发展&rdquo;，一方面积极宣传贯彻党和国家发展教育信息化的相关政策、法律法规，充分发挥行业协调、服务和自律的职能；另一方面也为相关企业以及教育信息化的产品用户搭建沟通交流平台，为政府和行业提供双向服务，以促进中国教育信息化产业健康快速发展。</p>\n<p>&nbsp;</p>\n<p>当前，中国教育信息化的发展需要通过政府主导，借助信息技术和资本力量，而深圳市教育信息化产业协会的初衷正是搭建政府、技术、资金的交流平台。未来，在政府主管部门的领导下，在以康索特、异度云等行业领导企业的示范和带动下，在产业协会的精心组织下，在深圳市教育信息化产业协会的企业的共同努力下，深圳教育信息化产业有望做大做强，成为中国教育信息化行业的一张名片。</p>', '', '', '', '', '', '', 16, 0, '2019-03-26 21:22:00');
INSERT INTO `list_47` VALUES (58, 65, 0, '热烈欢迎江西省戒毒系统一行领导莅临康索特参观指导', '2021-06-13 02:08:29', '2021-06-13 14:57:56', '<p>&nbsp;2019年4月4日下午，江西省戒毒系统一行领导莅临深圳市康索特软件有限公司参观指导。康索特总经理何龙源、副总经理刘庆江以及大匠总经理刘震、公司国内销售部、市场部等多个部门领导参加了此次接待工作。</p>\n<p>&nbsp;</p>\n<p>&nbsp;<img title=\"1619336215510710.png\" src=\"http://www.dikaedu.com/upload/202104/1619336215510710.png\" alt=\"图片4.png\" width=\"undefined\" height=\"undefined\" data-width=\"undefined\" data-height=\"undefined\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 康索特总经理何龙源对江西省戒毒系统一行领导的到来访表示感谢，并热情接待了考察团参观康索特智慧戒毒园区体验中心，详细介绍了公司12年来在智慧司法领域建设情况及在推广信息化过程中的实践经验。体验了新时代下信息化与司法行政工作深度融合的模式。详细的了解康索特产品方案体系、营销概况、研发团队、生产制造、人才培育、企业发展规划等情况。对康索特&ldquo;以市场为导向，提供领先的智能物联应用场景解决方案&rdquo;的企业定位与&ldquo;创造价值，达人达己&rdquo;的经营理念给予高度认可。</p>\n<p>&nbsp;</p>\n<p><img title=\"校园一卡通\" src=\"http://www.dikaedu.com/upload/202104/1619336258384059.png\" alt=\"校园一卡通\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 同时对康索特&ldquo;以人为本，不断创新&rdquo;的研发思路给予充分肯定，对&ldquo;以员工为中心，不断营造舒适工作与生活环境&rdquo;的和谐发展思路给予大力赞许。江西省戒毒所领导表示，此次将康索特软件作为行业标杆企业进行考察及交流，希望未来康索特能积极参与到江西省在司法行政信息化的建设中来。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 近年来，康索特不断探索营销路径，以先进经营理念作支撑，全力提升企业在司法领域的竞争力。公司坚持以技术创新为主导，核心技术实力保障领先产品竞争力。在智能物联领域不仅拥有完整的从开发到量产的解决方案，而且具备定制化设计和技术支持的全面能力、更掌握了核心生产工艺技术。通过高度整合及深度客制化，为客户提供差异化空间，增加产品独特卖点。</p>\n<p>&nbsp;</p>\n<p><img title=\"校园一卡通\" src=\"http://www.dikaedu.com/upload/202104/1619336273412637.png\" alt=\"校园一卡通\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 交流会上，江西省戒毒系统领导围绕江西省依据全国统一戒毒工作基本模式总体要求，以&ldquo;1+3+1&rdquo;智慧戒毒大平台为总体框架，建成&ldquo;智慧安防、智慧戒治、智慧服务&rdquo;三个平台和一个大数据中心，打造&ldquo;四纵五横&rdquo;的功能模块的工作建设提出了相关问题。康索特总经理何龙源表示，公司将积极推动云计算、大数据、人工智能等现代信息技术手段与江西省戒毒行政工作进行高度融合，将建设感知更全面、控制更智能、交互更广泛、协同更紧密的服务体系，助力江西省智慧戒毒工作成功落地。</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 基于&ldquo;用心、诚信&rdquo;的经营原则，及服务各类司法信息化建设的丰富经验，在日益完善的经验和服务体系，康索特致力以先进的产品与技术，服务于社会的信息化司法建设事业，为业界提供最专业的智能物联应用场景解决方案及服务。</p>', '', '/upload/images/lRf6CFlo8JGI.png', '', '', '', '', 19, 0, '2019-04-08 13:22:00');
INSERT INTO `list_47` VALUES (59, 65, 0, '助力企业复工-助力学校开学-不同应用场景身份识别+测温方案', '2021-06-13 02:08:55', '2021-06-13 21:52:43', '<p>复工、开学在即，但我们依然处于疫情防控的关键时期，为了有效阻断疫情传播，除了减少聚集和接触之外，社区及众多复工的企业都肩扛重担，严格执行体温筛查、人员管控，在小区、园区、楼宇建筑等入口对住户、员工以及访客进行体温检测与实名登记。但是，由于人流量多、普通手持测温枪检测速度慢、信息化程度不足等难题，限制了通行管控的效率与安全性。</p>\n<p>对于疫情防控的局限性，康索特立即成立了&lsquo;疫情防控专项小组&rsquo;针对疫情防控制定了可落地实施方案，包括人脸识别技术、红外测温技术、视频分析技术、物联网技术以及移动互联技术的整合，康索特公司在人脸识别及物联网技术深耕多年，在这个疫情防控方案上充分发挥展示公司能力。</p>\n<p>&nbsp;</p>\n<p><strong>方案介绍</strong></p>\n<p>实现内部人员出入身份核验，体温排查，</p>\n<p><img title=\"校园一卡通\" src=\"http://www.dikaedu.com/upload/202002/1582961482829366.png\" alt=\"校园一卡通\" /><img title=\"校园一卡通\" src=\"http://www.dikaedu.com/upload/202002/1582961529848211.png\" alt=\"校园一卡通\" /></p>\n<p>对于公共区域体温的检测，传统接触式的耳温枪和水银温度计，在人员较为开放区域的情况下，每个人单独检测费时费力。</p>\n<p>利用热成像检测摄像机部署在工厂、教学楼、医院、银行、写字楼、食堂、图书馆等人员密集公共区域及出入口，可远离检源进行自动检测，减少人员投入，防止疫情传染给工作人员;同时高效率被动式完成体温检测、体温异常发出预警；针对疫情重点区域可以结合AI算法对人员是否佩戴口罩、人员聚集进行预警。</p>\n<p>&nbsp;</p>\n<p><img title=\"1582961568830768.png\" src=\"http://www.dikaedu.com/upload/202002/1582961568830768.png\" alt=\"\" /></p>\n<p><img title=\"1582961570494127.png\" src=\"http://www.dikaedu.com/upload/202002/1582961570494127.png\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>有些潜伏期的携带者，进门的时候不会出现发热，对于接触相关病史人员或者发现疑似人员进行医学隔离观察可以佩戴手环，一般体温监测只在主要通道处，因为受环境等多种因素影响，无法精准检测体温，佩戴手环可以通过后台实时监测，异常预警。</p>\n<p>可对隔离观察人员进行区域定位，确认是否正常在隔离区域，防止人工检查遗漏。</p>\n<p><img title=\"校园一卡通\" src=\"http://www.dikaedu.com/upload/202002/1582961611954303.png\" alt=\"校园一卡通\" />&nbsp; &nbsp; &nbsp;&nbsp;疫情当前，没有人可以置身事外。不管是企业还是个人,都是防控疫情责任链上的重要一环。唯有众志成城，才能更好地打赢这场防疫攻坚战。</p>', '', '/upload/images/5rU4vpEMYzE2.png', '', '助力企业复工-助力学校开学-不同应用场景身份识别+测温方案|康索特', '康索特,助力企业复工-助力学校开学,不同应用场景身份识别,测温方案', '复工、开学在即，但我们依然处于疫情防控的关键时期，为了有效阻断疫情传播，除了减少聚集和接触之外，社区及众多复工的企业都肩扛重担，严格执行体温筛查、人员管控，在小区、园区、楼宇建筑等入口对住户、员工以及访客进行体温检测与实名登记。但是，由于人流量多、普通手持测温枪检测速度慢、信息化程度不足等难题，限制了通行管控的效率与安全性', 69, 0, '2020-02-28 21:22:00');

-- ----------------------------
-- Table structure for list_48
-- ----------------------------
DROP TABLE IF EXISTS `list_48`;
CREATE TABLE `list_48`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通栏图片',
  `bgcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接方式',
  `picmobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机版图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_48
-- ----------------------------

-- ----------------------------
-- Table structure for list_49
-- ----------------------------
DROP TABLE IF EXISTS `list_49`;
CREATE TABLE `list_49`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_49
-- ----------------------------

-- ----------------------------
-- Table structure for list_50
-- ----------------------------
DROP TABLE IF EXISTS `list_50`;
CREATE TABLE `list_50`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地址',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '联系问题',
  `publishTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_50
-- ----------------------------
INSERT INTO `list_50` VALUES (13, NULL, 67, NULL, 'te的申请', '2021-06-17 09:58:45', '2021-06-17 09:58:45', 'te', 'te', 'te', 'tete', 'tet', 'te', '2021-06-17 09:58:45');
INSERT INTO `list_50` VALUES (14, NULL, 67, NULL, 'ddd的申请', '2021-06-17 09:59:06', '2021-06-17 09:59:06', 'ddd', 'dd', 'dd', 'ddd', 'dd', 'ddd', '2021-06-17 09:59:06');

-- ----------------------------
-- Table structure for list_51
-- ----------------------------
DROP TABLE IF EXISTS `list_51`;
CREATE TABLE `list_51`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `duty` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '岗位职责',
  `qualifications` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任职资格',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_51
-- ----------------------------
INSERT INTO `list_51` VALUES (1, NULL, 66, 0, '集团CTO', '2021-06-07 17:33:23', '2021-06-07 17:33:23', NULL, NULL, NULL, '北京', '<ol>\n<li>根据集团发展战略，统筹规划集团技术发展方向，全面提高集团技术研发实力；</li>\n<li>把握人工智能及物联网的研发方向和发展趋势，以操盘智慧城市等大型IT类集成项目为核心，组织制定和实施重大技术决策和技术方案；</li>\n<li>负责集团整体技术架构优化，规范技术标准，对技术研发流程的规范化管理与过程监控；</li>\n<li>把控集团技术开发、项目产品风险，促进团队技术进步与创新，解决技术难题。</li>\n</ol>', '<p>1、硕士及以上学历，10年以上技术开发及管理经验，具备AI研发背景；<br />2、熟悉人工智能、物联网、大数据、云计算等专业领域技术发展趋势，具备相应成功落地项目经验；<br />3、具备较强的平台化、强整合思维，对大型IT集成类项目的城市级应用领域有前瞻性的理解，有一定的全球化视野；<br />4、具有优秀的团队管理经验及良好的内外部沟通能力，具备高层管理经验；<br />5、极强的内驱力与责任心，出色的职业素养，乐于挑战。</p>', 'HR@cst.com');
INSERT INTO `list_51` VALUES (2, NULL, 66, 0, '生产总监', '2021-06-07 17:39:30', '2021-06-07 09:40:04', NULL, NULL, NULL, '深圳', '<p>全面负责智能硬件产品的生产、技术、设备、现场管理、安全生产管理工作，确保生产的正常运行；</p>\n<p>配合公司高层制定公司生产目标，编制年度生产计划，进行生产调度、管理和控制；</p>\n<p>协调生产过程中的各个环节及资源，及时发现并采取措施解决生产过程中出现的问题；</p>\n<p>组织监督生产及技术研发人员改善生产工艺、技术升级，不断提高和改进产品质量；</p>\n<p>建立、规范和完善生产体系各部门的运作流程，建立生产体系各部门良好的沟通机制；</p>\n<p>组织、完善生产运营体系、成本控制体系、考核体系以及各项制度</p>\n<p>日常管理工作及员工管理、指导、培训及评估，有效激励员工提高工作绩效；</p>\n<p>加强安全生产的控制、实施、严格执行安全法规、生产操作规程，确保安全生产。</p>', '<div>大学本科以上学历，机械制造、机电一体化相关专业；</div>\n<div>8年以上机加工和注塑件生产制造型企业高层管理经验，有服务机器人行业生产管理经验者优先；</div>\n<div>精通机械加工工艺，注塑件、挤出件加工工艺；</div>\n<div>熟悉制造型企业的生产运作和管理，拥有丰富的生产管理、成本控制、统筹运作等经验；</div>\n<div>具备全面的精益生产理念和丰富的精益生产实践经验；</div>\n<div>具备良好的计划能力、指导能力、协调能力、决策能力，较强的综合协调能力和组织管理能力。</div>', '');
INSERT INTO `list_51` VALUES (3, NULL, 66, 0, '区域销售经理/总监', '2021-06-07 17:41:42', '2021-06-07 17:41:42', NULL, NULL, NULL, '北京 / 重庆 / 上海 / 广州 / 深圳', '<p data-v-94e4ce78=\"\">1.&nbsp;<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">负责</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">服务机器人及智慧城市</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">解决</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">方案</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">在</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">相应</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">区域</span>/<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">行业的市场渠道开拓与销售工作，执行并完成公司产品年度销售计划。</span></p>\n<p data-v-94e4ce78=\"\">2.&nbsp;<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">挖掘客户需求及痛点，进行差异化营销</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">，</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">积极完成销售指标，扩大产品市场占有率。</span></p>\n<p data-v-94e4ce78=\"\">3.&nbsp;<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">开发与维系客户关系，与客户保持良好沟通，实时把握客户需求。</span></p>\n<p data-v-94e4ce78=\"\">4.&nbsp;<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">负责所在区域</span>/<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">行业的合作伙伴生态建立，</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">结合合</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">作伙伴</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">实际情况和</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">能力范围，</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">打造相应细分行业的</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">解决方案，建设并运营合作生态。</span></p>\n<p data-v-94e4ce78=\"\">5.&nbsp;<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">定期汇总客户意见、市场信息、竞争对手、行业信息，整理和分析并定期提交相关报告</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">；</span></p>', '<p data-v-94e4ce78=\"\">1<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">本科</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">以上学历，工科类如电子、计算机、自动化等专业</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">毕业</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">；</span></p>\n<p data-v-94e4ce78=\"\">2<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、</span><span style=\"font-family: Helvetica Neue;\" data-v-94e4ce78=\"\">5</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">年以上</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">相关工作</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">经验，具有相关行业区域复杂系统销售经验；</span></p>\n<p data-v-94e4ce78=\"\">3<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、了解</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">人工智能</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">行业</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">发展</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">及国家政策，熟悉人工智能解决方案</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">的应用与落地；</span></p>\n<p data-v-94e4ce78=\"\">4<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、有丰富的科技产品大客户销售经验，</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">熟悉项目的立项</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">，</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">政府、企业招投标</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">流程</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">及订单合同流程</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">，有渠道拓展与管理经验；</span></p>\n<p data-v-94e4ce78=\"\">5<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、有一定政府、金融、</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">展览展示</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、酒店、新零售</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、公共服务</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">等行业客户或渠道资源者优先</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">；</span></p>\n<p data-v-94e4ce78=\"\">6<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">具备</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">较</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">好的语言及文字表达能力、沟通能力、谈判能力，逻辑思维清晰</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">，有团队合作精神</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">；</span></p>\n<p data-v-94e4ce78=\"\">7<span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">、</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">学习能力强、逻辑性强，喜欢简单、激情、全力以赴、客户第一的价值观</span><span style=\"font-family: 等线;\" data-v-94e4ce78=\"\">。</span></p>', '');
INSERT INTO `list_51` VALUES (4, NULL, 66, 0, 'UX/UI设计师', '2021-06-07 17:48:51', '2021-06-07 09:49:20', NULL, NULL, NULL, '深圳', '<p>UX/UI设计师将配合机器人工业设计团队及软件开发团队从事与机器人交互及图形界面、手机APP</p>\n<p>软件交互及图形界面设计相关的项目。工作内容将包括数字产品设计的所有方面，从UX规划和应用程序线框图到各类移动和桌面终端的可视化设计。我们的团队分部在中国、美国和中东，该职位需要与在这些地点的同事开展合作，因此需要申请人能够使用英语进行有效交流。</p>\n<p>&nbsp;</p>\n<div>&nbsp;</div>\n<p>&nbsp;</p>', '<p data-v-94e4ce78=\"\">岗位要求</p>\n<p data-v-94e4ce78=\"\">1-3<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">年相关行业工作经验，从概念到上市的数字产品设计经验</span></p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">对数字产品设计充满热情</span></p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">具备</span>UX<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">学科</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">系统性的专业知识，包括</span>Information&nbsp;Architecture<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">，交互设计，系统设计</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">和</span>UI<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">设计等</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">。</span></p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">熟练使用相关设计软件（</span>&nbsp;Sketch, Adobe&nbsp;Illustrator, Photoshop, Indesign, After Effects<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">等</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">）</span></p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">熟练使用数字产品原型制作工具（尤其是</span>Figma<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">）或</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">者能够快速学习此类工具</span></p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">对细节有超乎常人的关注</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">，</span><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">具有较强的创造力和沟通能力</span></p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">语言要求：必须能熟练的使用英语进行工作沟通</span></p>\n<p data-v-94e4ce78=\"\">&nbsp;</p>\n<p data-v-94e4ce78=\"\">学历要求</p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">工业设计或交互设计本科学历者优先，</span>&nbsp;<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">其它相关专业本科学历也将被考虑。</span></p>\n<p data-v-94e4ce78=\"\">&nbsp;</p>\n<p data-v-94e4ce78=\"\">申请要求</p>\n<p data-v-94e4ce78=\"\"><span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">需提供</span>PDF<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">版本的简历及能够体现</span>UX/UI<span style=\"font-family: Arial Unicode MS;\" data-v-94e4ce78=\"\">设计能力的作品集。</span></p>', '');

-- ----------------------------
-- Table structure for list_52
-- ----------------------------
DROP TABLE IF EXISTS `list_52`;
CREATE TABLE `list_52`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  `summary` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方案概述',
  `ability` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '落地能力',
  `classicCase` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经典案例',
  `highlights` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方案亮点',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_52
-- ----------------------------
INSERT INTO `list_52` VALUES (1, NULL, 72, 56, '园区管理', '2021-06-08 17:30:32', '2021-06-10 15:42:39', NULL, NULL, NULL, '为工业园区和综合性办公园区，提供行政管理系统、安防管理系统、信息宣发系统和刷脸消费系统等智慧化管理服务，包括通行管理、考勤管理、会议管理、人车搜索、刷脸消费、信息精准推送等。', '<p style=\"text-align: center;\">康索特智慧园区平台基于AI可视化能力打造&ldquo;一屏全感知&rdquo;的智慧园区服务体系，整合不同类型的业务系统，共建园区数据大平台，构建数据开放体系，促进园区和城市信息共享， 赋能园区通用能力，智能化支撑园区治理与服务优化，打造深度感知的园区管理体系</p>', '<ul>\n<li>AI可视化</li>\n<li>智慧安防管理</li>\n<li>智慧会议</li>\n<li>智慧访客</li>\n<li>智慧就餐</li>\n<li>园区同行解决方案</li>\n</ul>', '1,2,3', '', '/upload/images/kNi0GBbHE5vK.jpg');
INSERT INTO `list_52` VALUES (2, NULL, 72, 56, '校园管理', '2021-06-08 17:49:56', '2021-06-08 17:49:56', NULL, NULL, NULL, '为小学、初高中、高职、大学等学校提供专业的提供AIoT产品和解决方案应用服务，包含通行管理、归寝管理、人车检索等安全与后勤管理服务，食堂消费、水电控制等计费管理，电子黑板、电子班牌等智慧教务系统等。', '', '', '', '', '/upload/images/eo6kf7UNQ2HS.jpg');
INSERT INTO `list_52` VALUES (3, NULL, 72, 56, '医院管理', '2021-06-08 17:50:33', '2021-06-08 09:53:22', NULL, NULL, NULL, '实现“刷脸“全自助就诊服务，如挂号、取号、缴费、取报告等。同时搭载动态人像识别系统、车牌车型识别系统等应用系统，用于医院的人员出入管理、公共区域安全防护、打击“号贩子”和“医闹”等。', '', '', '', '', '/upload/images/N1G9ZOa40EXO.jpg');
INSERT INTO `list_52` VALUES (4, NULL, 72, 56, '智慧社区', '2021-06-08 17:51:54', '2021-06-08 17:51:54', NULL, NULL, NULL, '实现“刷脸“全自助就诊服务，如挂号、取号、缴费、取报告等。同时搭载动态人像识别系统、车牌车型识别系统等应用系统，用于医院的人员出入管理、公共区域安全防护、打击“号贩子”和“医闹”等。', '', '', '', '', '/upload/images/TEspTgY3KjRs.jpg');
INSERT INTO `list_52` VALUES (5, NULL, 72, 56, '智能楼宇', '2021-06-08 17:52:43', '2021-06-08 17:52:43', NULL, NULL, NULL, '实现“刷脸“全自助就诊服务，如挂号、取号、缴费、取报告等。同时搭载动态人像识别系统、车牌车型识别系统等应用系统，用于医院的人员出入管理、公共区域安全防护、打击“号贩子”和“医闹”等。', '', '', '', '', '/upload/images/TAoHMiqtvxwz.jpg');
INSERT INTO `list_52` VALUES (6, NULL, 72, 56, '停车场', '2021-06-08 17:53:48', '2021-06-08 17:53:48', NULL, NULL, NULL, '实现“刷脸“全自助就诊服务，如挂号、取号、缴费、取报告等。同时搭载动态人像识别系统、车牌车型识别系统等应用系统，用于医院的人员出入管理、公共区域安全防护、打击“号贩子”和“医闹”等。', '', '', '', '', '/upload/images/SbOIkhwnbDn6.jpg');
INSERT INTO `list_52` VALUES (7, NULL, 72, 57, '机关事务管理', '2021-06-08 21:18:36', '2021-06-08 13:19:42', NULL, NULL, NULL, '应政府机关事务管理智能化需求，康索特解决当今政府机关单位实际面临的种种管理问题，系统采用数字化、集约化的管理模式，集停车场管理、门禁管理、会议签到、考勤管理及巡更等多个子系统于一体，满足协同办公和多项管理要求', '', '', '', '', '/upload/images/7UyQNa3kWnDq.png');
INSERT INTO `list_52` VALUES (8, NULL, 72, 57, '智慧食药监', '2021-06-08 21:19:14', '2021-06-08 21:19:14', NULL, NULL, NULL, '以视觉识别和大数据分析技术为核心，快速甄别被监管行业的违规问题，如违规医疗执业事件、食品药品安监溯源，提升政府监管智能化水平', '', '', '', '', '/upload/images/nBB6NCJHkgQE.png');
INSERT INTO `list_52` VALUES (9, NULL, 72, 0, '疫情防控', '2021-06-08 21:20:14', '2021-06-08 21:20:14', NULL, NULL, NULL, '运用红外测温+人脸识别，高温预警有效告警高达99.7%，秒级反馈比对的结果，准确率高达99.5%。融合社区/企业信息、疫情公开政务信息，实现涉疫人员和密接人员追踪能力。以预防-管控-阻断-追溯为防控主线，提供设施智能、高效管理、安全有序、便民先进的疫情防控AIoT解决方案', '', '', '', '', '/upload/images/oZ1NvOtmuZvI.png');
INSERT INTO `list_52` VALUES (10, NULL, 72, 57, '智慧监管', '2021-06-08 21:20:45', '2021-06-08 21:20:45', NULL, NULL, NULL, '端”、“管”、“云”三重控制，采用省局集中平台+分所前置平台的建设方案，快速搭建统一门户、统一身份、共享数据、即时通讯，实现智慧综合指挥，构建高可靠性、高运行性、高安全性和高可管理性的智慧监所解决方案', '', '', '', '', '/upload/images/wH708qqz9A9B.png');

-- ----------------------------
-- Table structure for list_53
-- ----------------------------
DROP TABLE IF EXISTS `list_53`;
CREATE TABLE `list_53`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_53
-- ----------------------------
INSERT INTO `list_53` VALUES (1, NULL, 69, NULL, '123', '2021-06-08 12:17:00', '2021-06-08 12:17:00', '/upload/images/QrtDzrHllmMu.jpg');
INSERT INTO `list_53` VALUES (2, NULL, 69, NULL, 'test2', '2021-06-08 12:21:16', '2021-06-08 12:21:16', '/upload/images/e9FD8AjmuZg2.jpg');
INSERT INTO `list_53` VALUES (3, NULL, 69, NULL, '特图', '2021-06-08 12:29:42', '2021-06-08 12:29:42', '/upload/images/CLRcq2hanIFh.png');
INSERT INTO `list_53` VALUES (4, NULL, 69, NULL, 'tetanus', '2021-06-08 12:30:47', '2021-06-08 12:30:47', '/upload/images/ETm7sV1CzHHW.png');
INSERT INTO `list_53` VALUES (5, NULL, 69, NULL, '213', '2021-06-08 12:41:37', '2021-06-08 12:41:37', '/upload/images/9tp5gACWA1hd.png');
INSERT INTO `list_53` VALUES (6, NULL, 69, NULL, '12', '2021-06-08 12:43:50', '2021-06-08 12:43:50', '/upload/images/DSymtkTUt5ja.png');
INSERT INTO `list_53` VALUES (7, NULL, 69, NULL, '11', '2021-06-08 12:46:36', '2021-06-08 12:46:36', '/upload/images/frePIdJIJ04g.png');
INSERT INTO `list_53` VALUES (8, NULL, 69, NULL, '313', '2021-06-08 12:46:52', '2021-06-08 12:46:52', '/upload/images/iuuIdpqNvz7B.png');
INSERT INTO `list_53` VALUES (9, NULL, 69, NULL, 'asd', '2021-06-08 12:47:29', '2021-06-08 12:47:29', '/upload/images/CvPMSHfjcBvR.png');
INSERT INTO `list_53` VALUES (10, NULL, 69, NULL, '211', '2021-06-08 12:48:54', '2021-06-08 12:48:54', '/upload/images/AdNCbweEeqPj.jpg');
INSERT INTO `list_53` VALUES (11, NULL, 69, NULL, 'dqaq', '2021-06-08 12:50:22', '2021-06-08 12:50:22', '/upload/images/dqcSK9d90eDm.png');
INSERT INTO `list_53` VALUES (12, NULL, 69, NULL, 'dd', '2021-06-08 12:52:12', '2021-06-08 12:52:12', '/upload/images/lRk6lLe5TaGW.png');
INSERT INTO `list_53` VALUES (13, NULL, 69, NULL, '33', '2021-06-08 12:59:26', '2021-06-08 12:59:26', '/upload/images/bGekMw2q02GD.png');
INSERT INTO `list_53` VALUES (14, NULL, 69, NULL, '444', '2021-06-08 13:03:31', '2021-06-08 13:03:31', '/upload/images/jmcKED7GJpwT.png');
INSERT INTO `list_53` VALUES (15, NULL, 69, NULL, 'teet', '2021-06-08 13:10:49', '2021-06-08 13:10:49', '/upload/images/1RqNUAMTnSmR.png');
INSERT INTO `list_53` VALUES (16, NULL, 69, NULL, '', '2021-06-08 13:11:21', '2021-06-08 13:11:21', '/upload/images/xxOQBWPoCc7e.png');
INSERT INTO `list_53` VALUES (17, NULL, 69, NULL, '44', '2021-06-08 13:13:02', '2021-06-08 13:13:02', '/upload/images/5wz9HA008bWp.png');
INSERT INTO `list_53` VALUES (18, NULL, 69, NULL, '556', '2021-06-08 13:13:09', '2021-06-08 13:13:09', '/upload/images/wcZAEfXrZeEf.png');
INSERT INTO `list_53` VALUES (19, NULL, 69, NULL, '555', '2021-06-08 13:29:20', '2021-06-08 13:29:20', '/upload/images/irx8r1PzPfNF.png');
INSERT INTO `list_53` VALUES (20, NULL, 69, NULL, '园区通行', '2021-06-08 16:44:30', '2021-06-08 16:44:30', '/upload/images/8RYn5oVuYlC2.png');
INSERT INTO `list_53` VALUES (21, NULL, 69, NULL, '智慧就餐', '2021-06-08 16:45:06', '2021-06-08 16:45:06', '/upload/images/rxaEzM6gMy58.png');
INSERT INTO `list_53` VALUES (22, NULL, 69, NULL, '智慧访客', '2021-06-08 16:45:17', '2021-06-08 16:45:17', '');
INSERT INTO `list_53` VALUES (23, NULL, 69, NULL, '智慧会议', '2021-06-08 16:45:25', '2021-06-08 16:45:25', '');
INSERT INTO `list_53` VALUES (24, NULL, 69, NULL, '智慧安防管理', '2021-06-08 16:45:43', '2021-06-08 16:45:43', '');
INSERT INTO `list_53` VALUES (25, NULL, 69, NULL, 'AI可视化', '2021-06-08 16:45:50', '2021-06-08 16:45:50', '');
INSERT INTO `list_53` VALUES (26, NULL, 69, NULL, '智慧通行', '2021-06-08 16:48:39', '2021-06-08 16:48:39', '/upload/images/FotrfaxauWDn.png');
INSERT INTO `list_53` VALUES (27, NULL, 69, NULL, '智慧宿舍', '2021-06-08 16:48:55', '2021-06-08 16:48:55', '/upload/images/PqC7RmCEAzN4.png');
INSERT INTO `list_53` VALUES (28, NULL, 69, NULL, '智慧安防', '2021-06-08 16:49:11', '2021-06-08 16:49:11', '/upload/images/ukOEASVZTIlA.png');
INSERT INTO `list_53` VALUES (29, NULL, 69, NULL, '智慧食堂', '2021-06-08 16:49:20', '2021-06-08 16:49:20', '/upload/images/vJM2A0jz7i2n.png');
INSERT INTO `list_53` VALUES (30, NULL, 69, NULL, '广告电商', '2021-06-08 16:50:39', '2021-06-08 16:50:39', '');
INSERT INTO `list_53` VALUES (31, NULL, 69, NULL, '综合治理', '2021-06-08 16:50:46', '2021-06-08 16:50:46', '');
INSERT INTO `list_53` VALUES (32, NULL, 69, NULL, '三方应用', '2021-06-08 16:50:52', '2021-06-08 16:50:52', '');
INSERT INTO `list_53` VALUES (33, NULL, 69, NULL, '人员管理', '2021-06-08 16:50:59', '2021-06-08 16:50:59', '');
INSERT INTO `list_53` VALUES (34, NULL, 69, NULL, '社区物联', '2021-06-08 16:51:06', '2021-06-08 16:51:06', '');
INSERT INTO `list_53` VALUES (35, NULL, 69, NULL, '数字物业', '2021-06-08 16:51:11', '2021-06-08 16:51:11', '');
INSERT INTO `list_53` VALUES (36, NULL, 69, NULL, '智慧场景', '2021-06-08 16:51:18', '2021-06-08 16:51:18', '');
INSERT INTO `list_53` VALUES (37, NULL, 69, NULL, '车辆台账精细化管理模块', '2021-06-08 16:52:14', '2021-06-08 16:52:14', '');
INSERT INTO `list_53` VALUES (38, NULL, 69, NULL, '车辆经营精细化管理模块', '2021-06-08 16:52:20', '2021-06-08 16:52:20', '');
INSERT INTO `list_53` VALUES (39, NULL, 69, NULL, '车辆运行精细化管理模块', '2021-06-08 16:52:28', '2021-06-08 16:52:28', '');
INSERT INTO `list_53` VALUES (40, NULL, 69, NULL, '车辆作业管理AI+模块', '2021-06-08 16:52:34', '2021-06-08 16:52:34', '');
INSERT INTO `list_53` VALUES (41, NULL, 69, NULL, '垃圾清运管理模块', '2021-06-08 16:52:41', '2021-06-08 16:52:41', '');
INSERT INTO `list_53` VALUES (42, NULL, 69, NULL, '垃圾运转管理模块', '2021-06-08 16:52:47', '2021-06-08 16:52:47', '');
INSERT INTO `list_53` VALUES (43, NULL, 69, NULL, '统一指挥调度模块', '2021-06-08 16:52:54', '2021-06-08 16:52:54', '');
INSERT INTO `list_53` VALUES (44, NULL, 69, NULL, 'AIoT接入模块', '2021-06-08 16:53:02', '2021-06-08 16:53:02', '');
INSERT INTO `list_53` VALUES (45, NULL, 69, NULL, '安全管理', '2021-06-08 16:53:45', '2021-06-08 16:53:45', '');
INSERT INTO `list_53` VALUES (46, NULL, 69, NULL, '绿色工厂', '2021-06-08 16:53:51', '2021-06-08 16:53:51', '');
INSERT INTO `list_53` VALUES (47, NULL, 69, NULL, '智慧交通', '2021-06-08 16:53:57', '2021-06-08 16:53:57', '');
INSERT INTO `list_53` VALUES (48, NULL, 69, NULL, '隐患治理', '2021-06-08 16:54:05', '2021-06-08 16:54:05', '');
INSERT INTO `list_53` VALUES (49, NULL, 69, NULL, '智能事务', '2021-06-08 16:54:27', '2021-06-08 16:54:27', '');
INSERT INTO `list_53` VALUES (50, NULL, 69, NULL, '办事中心', '2021-06-08 16:54:33', '2021-06-08 16:54:33', '');
INSERT INTO `list_53` VALUES (51, NULL, 69, NULL, '数据分析', '2021-06-08 16:54:40', '2021-06-08 16:54:40', '');
INSERT INTO `list_53` VALUES (52, NULL, 69, NULL, '智能安保', '2021-06-08 16:54:46', '2021-06-08 16:54:46', '');
INSERT INTO `list_53` VALUES (53, NULL, 69, NULL, '智能食堂', '2021-06-08 16:54:51', '2021-06-08 16:54:51', '');
INSERT INTO `list_53` VALUES (54, NULL, 69, NULL, '食药监管', '2021-06-08 16:55:22', '2021-06-08 16:55:22', '');
INSERT INTO `list_53` VALUES (55, NULL, 69, NULL, '人工智能分析', '2021-06-08 16:55:29', '2021-06-08 16:55:29', '');
INSERT INTO `list_53` VALUES (56, NULL, 69, NULL, '应急指挥中心管理', '2021-06-08 16:55:34', '2021-06-08 16:55:34', '');
INSERT INTO `list_53` VALUES (57, NULL, 69, NULL, '移动应急指挥调度', '2021-06-08 16:55:40', '2021-06-08 16:55:40', '');
INSERT INTO `list_53` VALUES (58, NULL, 69, NULL, '移动执法管理', '2021-06-08 16:55:46', '2021-06-08 16:55:46', '');
INSERT INTO `list_53` VALUES (59, NULL, 69, NULL, '执法终端安全管控', '2021-06-08 16:55:51', '2021-06-08 16:55:51', '');
INSERT INTO `list_53` VALUES (60, NULL, 69, NULL, '食品溯源', '2021-06-08 16:55:56', '2021-06-08 16:55:56', '');
INSERT INTO `list_53` VALUES (61, NULL, 69, NULL, '食药监大数据数据分析', '2021-06-08 16:56:01', '2021-06-08 16:56:01', '');
INSERT INTO `list_53` VALUES (62, NULL, 69, NULL, '物联网监管', '2021-06-08 16:56:06', '2021-06-08 16:56:06', '');
INSERT INTO `list_53` VALUES (63, NULL, 69, NULL, '视频会议', '2021-06-08 16:56:11', '2021-06-08 16:56:11', '');

-- ----------------------------
-- Table structure for list_54
-- ----------------------------
DROP TABLE IF EXISTS `list_54`;
CREATE TABLE `list_54`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_54
-- ----------------------------
INSERT INTO `list_54` VALUES (1, NULL, 71, NULL, '南宁华润大厦', '2021-06-08 17:35:47', '2021-06-08 17:35:47', '智能楼宇出入管理系统', '/upload/images/TnB6b0a0Gc1p.png', '南宁最高地标建筑，广西第一高楼\n总高482米，可同时容纳1.2万人办公\n软硬一体化组件式通行，通过率超99%\n单人通行时间小于1秒，真正实现无感通行');
INSERT INTO `list_54` VALUES (2, NULL, 71, NULL, '茅台集团', '2021-06-10 23:41:19', '2021-06-10 23:41:19', '', '', '茅台集团');
INSERT INTO `list_54` VALUES (3, NULL, 71, NULL, '东莞妇幼保健院', '2021-06-10 23:41:50', '2021-06-10 23:41:50', '', '', '东莞妇幼保健院...');

-- ----------------------------
-- Table structure for list_55
-- ----------------------------
DROP TABLE IF EXISTS `list_55`;
CREATE TABLE `list_55`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_55
-- ----------------------------

-- ----------------------------
-- Table structure for list_56
-- ----------------------------
DROP TABLE IF EXISTS `list_56`;
CREATE TABLE `list_56`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `moduleId` int(10) UNSIGNED NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NULL DEFAULT NULL,
  `categoryId` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatedAt` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '官方热线',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '官方邮箱',
  `saletel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售前咨询',
  `business` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商务合作',
  `media` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体合作',
  `supplier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商合作',
  `adress2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址二',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_56
-- ----------------------------
INSERT INTO `list_56` VALUES (1, NULL, 73, 0, '联系我们', '2021-06-11 12:07:15', '2021-06-12 17:48:35', '深圳市南山区高新南九道10号', '400-0755-972', 'commsoft@commsoft.com.cn', '400-xxxxxxxx', '400-xxxxxxxx', 'xxxxxxxxxx', ' xxxxxxxxxxx', '深圳湾科技生态园10栋Ａ座27F', '<p>&nbsp;深圳市康索特软件有限公司自2006年成立至今，拥有十分强大的移动智能管理项目集成团队，具有专业能力和相应资质，能够为政府以及社会各行业提供系统、综合的全生命周期专业项目集成服务。成员包括管理、市场、技术、方案、项目等领域的专家，他们均参与过众多政府类、公共事业类、工程类等大型集成项目，对移动智能管理具有深刻的理解，拥有丰富的理论基础和实践经验。</p>\n<p>&nbsp;</p>\n<table class=\"table table-striped table-bordered table-hover\">\n<tbody>\n<tr class=\"firstRow\">\n<td valign=\"top\" width=\"606\">\n<p><strong>深圳南山总部</strong></p>\n<p>联系人：刘总监</p>\n<p>联系电话：18631116222</p>\n<p>联系地址：广东省深圳市南山区高新南九道10号深圳湾科技生态园10栋Ａ座27F</p>\n<p>&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"606\">\n<p><strong>深圳宝安生产基地</strong>&nbsp;</p>\n<p>联系人：刘经理</p>\n<p>联系电话：0755-85272705</p>\n<p>联系地址：广东省深圳市宝安区固戍二路星辉科技园F栋B座6楼</p>\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"606\">\n<p><strong>湖南办事处</strong></p>\n<p>联系人：吕经理</p>\n<p>联系电话：18586836160</p>\n<p>联系地址：湖南省长沙市雨花区象峪优山美地7栋802室</p>\n<p>&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"606\">\n<p><strong>江西办事处&nbsp;</strong></p>\n<p>联系人：吕经理</p>\n<p>联系电话：18586836160</p>\n<p>联系地址：江西省南昌市东湖区福州路235号2栋2单元402室</p>\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"606\">\n<p><strong>湖北办事处</strong></p>\n<p>联系人：张经理</p>\n<p>联系电话：18688775101</p>\n<p>联系地址：湖北省武汉市东湖新技术开发区关山大道光谷时代广场B座1702室</p>\n<p>&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"606\">\n<p><strong>广西办事处&nbsp;</strong></p>\n<p>联系人：洪经理</p>\n<p>联系电话：15217762112</p>\n<p>联系地址：广西省南宁市青秀区厢竹大道33号10栋1单元202号</p>\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"606\">\n<p><strong>江苏办事处</strong></p>\n<p>联系人：顾经理</p>\n<p>联系电话：18551630932</p>\n<p>联系地址：江苏省泰州市海陵区人民西路财富广场南楼512室</p>\n<p>&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"606\">\n<p><strong>四川办事处&nbsp;</strong></p>\n<p>联系人：庞经理</p>\n<p>联系电话：18615750432</p>\n<p>联系地址：四川省成都市龙泉驿区上东阳光林曦二期21栋4号503室</p>\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"606\">\n<p><strong>云南办事处</strong></p>\n<p>联系人：曹经理</p>\n<p>联系电话：15087000023</p>\n<p>联系地址：云南省昆明市官渡区海运花园2栋3单元1104</p>\n<p>&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"606\">\n<p><strong>华北大区（京津晋冀）办事处&nbsp;</strong></p>\n<p>联系人：吴经理</p>\n<p>联系电话：18322280090</p>\n<p>联系地址：河北省天津市南开区灵潼路灵潼西里13号楼4楼403门</p>\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td colspan=\"1\" rowspan=\"1\" valign=\"top\">\n<p><strong>新疆办事处</strong></p>\n<p>联系人：杨经理</p>\n<p>联系电话：18690183166</p>\n<p>联系地址：新疆乌鲁木齐沙依巴克区宝山路386号和风雅居5号楼3单元301</p>\n<p>&nbsp;</p>\n</td>\n<td colspan=\"1\" rowspan=\"1\" valign=\"top\">&nbsp;</td>\n</tr>\n</tbody>\n</table>');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '标题',
  `siteId` int(11) NOT NULL DEFAULT 0,
  `parentId` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型，project指项目，cate指分类，content指内容，link自定义',
  `projectId` int(11) NOT NULL COMMENT '项目ID',
  `categoryId` int(11) NOT NULL DEFAULT 0 COMMENT '分类id',
  `listId` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `target` int(11) NOT NULL DEFAULT 0 COMMENT '0当前页，1新窗口',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序，最大255，值越小越往前靠',
  `accessType` int(11) NOT NULL DEFAULT 0 COMMENT '访问权限类型:0游客，1仅限会员',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0未审，1正常',
  `submenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下级菜单类型',
  `groupId` int(11) NOT NULL COMMENT '组id',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自定义链接，最长不能超过255',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_4f5bac23feb5ede01dce721a7fd`(`groupId`) USING BTREE,
  CONSTRAINT `FK_4f5bac23feb5ede01dce721a7fd` FOREIGN KEY (`groupId`) REFERENCES `menu_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '云帆创新应用平台', 0, 0, 'link', 67, 0, 0, 1, 0, 0, 1, 'cate_title', 1, '/yunfan');
INSERT INTO `menu` VALUES (2, '核心技术', 0, 0, 'link', 0, 0, 0, 1, 2, 0, 1, '', 1, '/dajiang');
INSERT INTO `menu` VALUES (3, '云启', 0, 2, 'link', 0, 0, 0, 0, 0, 0, 1, '', 1, '/yunqi');
INSERT INTO `menu` VALUES (4, '大匠', 0, 2, 'link', 0, 0, 0, 0, 0, 0, 1, '', 1, '/dajiang');
INSERT INTO `menu` VALUES (5, '解决方案', 0, 0, 'project', 72, 0, 0, 0, 3, 0, 1, 'cate_title', 1, '');
INSERT INTO `menu` VALUES (6, '产品中心', 0, 0, 'project', 64, 0, 0, 0, 4, 0, 1, 'cate1', 1, '');
INSERT INTO `menu` VALUES (7, '新闻中心', 0, 0, 'project', 65, 0, 0, 0, 5, 0, 1, '', 1, '');
INSERT INTO `menu` VALUES (8, '关于我们', 0, 0, 'link', 0, 0, 0, 0, 6, 0, 1, '', 1, '/about');
INSERT INTO `menu` VALUES (9, '关于CST', 0, 8, 'link', 0, 0, 0, 0, 0, 0, 1, '', 1, '/about');
INSERT INTO `menu` VALUES (10, '联系我们', 0, 8, 'project', 73, 0, 0, 0, 0, 0, 1, '', 1, '/contact');
INSERT INTO `menu` VALUES (11, '加入我们', 0, 8, 'project', 66, 0, 0, 0, 0, 0, 1, '', 1, '/joinus');

-- ----------------------------
-- Table structure for menu_group
-- ----------------------------
DROP TABLE IF EXISTS `menu_group`;
CREATE TABLE `menu_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称，用于后台管理',
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_a91a3c576a83dc476876085b28`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_group
-- ----------------------------
INSERT INTO `menu_group` VALUES (1, '导航菜单', 'top');
INSERT INTO `menu_group` VALUES (2, '页脚导航', 'bottom');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名称',
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块说明',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '模块排序',
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '后台字段布局',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型 0联合模块，1独立模块',
  `table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'list' COMMENT '关联主表',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0不使用1使用',
  `isSeo` tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型 0不使用 1启用非必填默认隐藏，2启用非必填默认显示，3启用必填,',
  `isHits` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支持查看次数',
  `isPublishTime` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支持查看次数',
  `isSort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支持排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (46, '产品模块', '2021-05-26 22:55:42.100000', '2021-06-13 14:26:21.954491', '产品模块', 0, '', 0, 'list', 0, 1, 0, 0, 0);
INSERT INTO `module` VALUES (47, '新闻模块', '2021-05-26 23:11:10.587000', '2021-06-13 21:22:14.000000', '', 0, 'hits,sort,thumb,publishTime', 0, 'list', 0, 1, 1, 1, 1);
INSERT INTO `module` VALUES (48, '图片轮播', '2021-05-28 16:27:50.333000', '2021-06-13 14:26:16.355237', '适用于图片播放器，图片友情链接', 0, '', 0, 'list', 0, 0, 0, 0, 0);
INSERT INTO `module` VALUES (49, '单页信息（适用于公司简介，联系我们）', '2021-05-28 17:00:40.378000', '2021-06-13 14:26:11.569826', '', 0, '', 0, 'list', 0, 1, 0, 0, 0);
INSERT INTO `module` VALUES (50, '留言模块', '2021-05-28 17:06:50.578000', '2021-06-17 09:55:38.000000', '', 0, 'publishTime,email,tel,note', 0, 'list', 0, 0, 0, 1, 0);
INSERT INTO `module` VALUES (51, '加入我们', '2021-06-07 17:19:28.826000', '2021-06-07 17:19:28.826000', '', 0, '', 0, 'list', 0, 1, 0, 0, 0);
INSERT INTO `module` VALUES (52, '解决方案', '2021-06-07 19:23:49.947000', '2021-06-07 19:23:49.947000', '', 0, '', 0, 'list', 0, 1, 0, 0, 0);
INSERT INTO `module` VALUES (53, '平台应用', '2021-06-07 19:37:14.109000', '2021-06-08 13:42:39.000000', '', 0, 'thumb', 0, 'list', 0, 0, 0, 0, 0);
INSERT INTO `module` VALUES (54, '经典案例', '2021-06-08 17:03:24.558000', '2021-06-08 17:03:24.558000', '', 0, '', 0, 'list', 0, 0, 0, 0, 0);
INSERT INTO `module` VALUES (55, '落地能力', '2021-06-08 17:05:32.445000', '2021-06-08 17:05:32.445000', '', 0, '', 0, 'list', 0, 0, 0, 0, 0);
INSERT INTO `module` VALUES (56, '联系我们', '2021-06-11 11:56:52.954000', '2021-06-11 11:56:52.954000', '', 0, '', 0, 'list', 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `creatorId` int(11) NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_f2089d6c82cd8ee2709f53dfd00`(`creatorId`) USING BTREE,
  CONSTRAINT `FK_f2089d6c82cd8ee2709f53dfd00` FOREIGN KEY (`creatorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID，也是应用ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `sort` int(11) NOT NULL DEFAULT 255 COMMENT '排序，值越小越往前靠',
  `parentId` int(11) NOT NULL DEFAULT 0 COMMENT '父id',
  `groupId` int(11) NOT NULL COMMENT '组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_36bc87d0a59a8049be8e59b4808`(`groupId`) USING BTREE,
  CONSTRAINT `FK_36bc87d0a59a8049be8e59b4808` FOREIGN KEY (`groupId`) REFERENCES `option_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 15134 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option
-- ----------------------------
INSERT INTO `option` VALUES (1, '未设置', '0', 30, 0, 1);
INSERT INTO `option` VALUES (2, '男', '1', 10, 0, 1);
INSERT INTO `option` VALUES (17, '是', '1', 10, 0, 4);
INSERT INTO `option` VALUES (18, '否', '0', 20, 0, 4);
INSERT INTO `option` VALUES (21, '当前窗口', '_self', 10, 0, 6);
INSERT INTO `option` VALUES (22, '新窗口', '_blank', 20, 0, 6);
INSERT INTO `option` VALUES (23, '启用', '1', 10, 0, 7);
INSERT INTO `option` VALUES (24, '禁用', '', 20, 0, 7);
INSERT INTO `option` VALUES (25, 'UTF-8', 'utf8', 20, 0, 8);
INSERT INTO `option` VALUES (26, 'GBK', 'gbk', 10, 0, 8);
INSERT INTO `option` VALUES (62, '不置顶', '', 10, 0, 12);
INSERT INTO `option` VALUES (63, '一级置顶', '1', 20, 0, 12);
INSERT INTO `option` VALUES (64, '二级置顶', '2', 30, 0, 12);
INSERT INTO `option` VALUES (65, '三分钟', '180', 10, 0, 13);
INSERT INTO `option` VALUES (66, '点击推事件', 'click', 10, 0, 14);
INSERT INTO `option` VALUES (67, '跳转链接', 'view', 20, 0, 14);
INSERT INTO `option` VALUES (10147, '北京市', '北京市', 5, 0, 19);
INSERT INTO `option` VALUES (10148, '朝阳区', '朝阳区', 5, 10147, 19);
INSERT INTO `option` VALUES (10149, '三环到四环之间', '三环到四环之间', 5, 10148, 19);
INSERT INTO `option` VALUES (10150, '四环到五环之间', '四环到五环之间', 10, 10148, 19);
INSERT INTO `option` VALUES (10151, '五环到六环之间', '五环到六环之间', 15, 10148, 19);
INSERT INTO `option` VALUES (10152, '管庄', '管庄', 20, 10148, 19);
INSERT INTO `option` VALUES (10153, '北苑', '北苑', 25, 10148, 19);
INSERT INTO `option` VALUES (10154, '定福庄', '定福庄', 30, 10148, 19);
INSERT INTO `option` VALUES (10155, '三环以内', '三环以内', 35, 10148, 19);
INSERT INTO `option` VALUES (10156, '海淀区', '海淀区', 10, 10147, 19);
INSERT INTO `option` VALUES (10157, '三环以内', '三环以内', 5, 10156, 19);
INSERT INTO `option` VALUES (10158, '三环到四环之间', '三环到四环之间', 10, 10156, 19);
INSERT INTO `option` VALUES (10159, '四环到五环之间', '四环到五环之间', 15, 10156, 19);
INSERT INTO `option` VALUES (10160, '五环到六环之间', '五环到六环之间', 20, 10156, 19);
INSERT INTO `option` VALUES (10161, '六环以外', '六环以外', 25, 10156, 19);
INSERT INTO `option` VALUES (10162, '西三旗', '西三旗', 30, 10156, 19);
INSERT INTO `option` VALUES (10163, '西二旗', '西二旗', 35, 10156, 19);
INSERT INTO `option` VALUES (10164, '西城区', '西城区', 15, 10147, 19);
INSERT INTO `option` VALUES (10165, '内环到二环里', '内环到二环里', 5, 10164, 19);
INSERT INTO `option` VALUES (10166, '二环到三环', '二环到三环', 10, 10164, 19);
INSERT INTO `option` VALUES (10167, '东城区', '东城区', 20, 10147, 19);
INSERT INTO `option` VALUES (10168, '内环到三环里', '内环到三环里', 5, 10167, 19);
INSERT INTO `option` VALUES (10169, '崇文区', '崇文区', 25, 10147, 19);
INSERT INTO `option` VALUES (10170, '一环到二环', '一环到二环', 5, 10169, 19);
INSERT INTO `option` VALUES (10171, '二环到三环', '二环到三环', 10, 10169, 19);
INSERT INTO `option` VALUES (10172, '宣武区', '宣武区', 30, 10147, 19);
INSERT INTO `option` VALUES (10173, '内环到三环里', '内环到三环里', 5, 10172, 19);
INSERT INTO `option` VALUES (10174, '丰台区', '丰台区', 35, 10147, 19);
INSERT INTO `option` VALUES (10175, '四环到五环之间', '四环到五环之间', 5, 10174, 19);
INSERT INTO `option` VALUES (10176, '二环到三环', '二环到三环', 10, 10174, 19);
INSERT INTO `option` VALUES (10177, '三环到四环之间', '三环到四环之间', 15, 10174, 19);
INSERT INTO `option` VALUES (10178, '五环到六环之间', '五环到六环之间', 20, 10174, 19);
INSERT INTO `option` VALUES (10179, '六环之外', '六环之外', 25, 10174, 19);
INSERT INTO `option` VALUES (10180, '石景山区', '石景山区', 40, 10147, 19);
INSERT INTO `option` VALUES (10181, '四环到五环内', '四环到五环内', 5, 10180, 19);
INSERT INTO `option` VALUES (10182, '石景山城区', '石景山城区', 10, 10180, 19);
INSERT INTO `option` VALUES (10183, '八大处科技园区', '八大处科技园区', 15, 10180, 19);
INSERT INTO `option` VALUES (10184, '门头沟', '门头沟', 45, 10147, 19);
INSERT INTO `option` VALUES (10185, '城区', '城区', 5, 10184, 19);
INSERT INTO `option` VALUES (10186, '龙泉镇', '龙泉镇', 10, 10184, 19);
INSERT INTO `option` VALUES (10187, '永定镇', '永定镇', 15, 10184, 19);
INSERT INTO `option` VALUES (10188, '大台镇', '大台镇', 20, 10184, 19);
INSERT INTO `option` VALUES (10189, '潭柘寺镇', '潭柘寺镇', 25, 10184, 19);
INSERT INTO `option` VALUES (10190, '王平镇', '王平镇', 30, 10184, 19);
INSERT INTO `option` VALUES (10191, '军庄镇', '军庄镇', 35, 10184, 19);
INSERT INTO `option` VALUES (10192, '妙峰山镇', '妙峰山镇', 40, 10184, 19);
INSERT INTO `option` VALUES (10193, '雁翅镇', '雁翅镇', 45, 10184, 19);
INSERT INTO `option` VALUES (10194, '斋堂镇', '斋堂镇', 50, 10184, 19);
INSERT INTO `option` VALUES (10195, '清水镇', '清水镇', 55, 10184, 19);
INSERT INTO `option` VALUES (10196, '房山区', '房山区', 50, 10147, 19);
INSERT INTO `option` VALUES (10197, '城区', '城区', 5, 10196, 19);
INSERT INTO `option` VALUES (10198, '大安山乡', '大安山乡', 10, 10196, 19);
INSERT INTO `option` VALUES (10199, '大石窝镇', '大石窝镇', 15, 10196, 19);
INSERT INTO `option` VALUES (10200, '窦店镇', '窦店镇', 20, 10196, 19);
INSERT INTO `option` VALUES (10201, '佛子庄乡', '佛子庄乡', 25, 10196, 19);
INSERT INTO `option` VALUES (10202, '韩村河镇', '韩村河镇', 30, 10196, 19);
INSERT INTO `option` VALUES (10203, '河北镇', '河北镇', 35, 10196, 19);
INSERT INTO `option` VALUES (10204, '良乡镇', '良乡镇', 40, 10196, 19);
INSERT INTO `option` VALUES (10205, '琉璃河镇', '琉璃河镇', 45, 10196, 19);
INSERT INTO `option` VALUES (10206, '南窖乡', '南窖乡', 50, 10196, 19);
INSERT INTO `option` VALUES (10207, '蒲洼乡', '蒲洼乡', 55, 10196, 19);
INSERT INTO `option` VALUES (10208, '青龙湖镇', '青龙湖镇', 60, 10196, 19);
INSERT INTO `option` VALUES (10209, '十渡镇', '十渡镇', 65, 10196, 19);
INSERT INTO `option` VALUES (10210, '石楼镇', '石楼镇', 70, 10196, 19);
INSERT INTO `option` VALUES (10211, '史家营乡', '史家营乡', 75, 10196, 19);
INSERT INTO `option` VALUES (10212, '霞云岭乡', '霞云岭乡', 80, 10196, 19);
INSERT INTO `option` VALUES (10213, '新镇', '新镇', 85, 10196, 19);
INSERT INTO `option` VALUES (10214, '阎村镇', '阎村镇', 90, 10196, 19);
INSERT INTO `option` VALUES (10215, '燕山地区', '燕山地区', 95, 10196, 19);
INSERT INTO `option` VALUES (10216, '张坊镇', '张坊镇', 100, 10196, 19);
INSERT INTO `option` VALUES (10217, '长沟镇', '长沟镇', 105, 10196, 19);
INSERT INTO `option` VALUES (10218, '长阳镇', '长阳镇', 110, 10196, 19);
INSERT INTO `option` VALUES (10219, '周口店镇', '周口店镇', 115, 10196, 19);
INSERT INTO `option` VALUES (10220, '通州区', '通州区', 55, 10147, 19);
INSERT INTO `option` VALUES (10221, '六环内（马驹桥镇）', '六环内（马驹桥镇）', 5, 10220, 19);
INSERT INTO `option` VALUES (10222, '中仓街道', '中仓街道', 10, 10220, 19);
INSERT INTO `option` VALUES (10223, '新华街道', '新华街道', 15, 10220, 19);
INSERT INTO `option` VALUES (10224, '玉桥街道', '玉桥街道', 20, 10220, 19);
INSERT INTO `option` VALUES (10225, '北苑街道', '北苑街道', 25, 10220, 19);
INSERT INTO `option` VALUES (10226, '六环外（马驹桥镇）', '六环外（马驹桥镇）', 30, 10220, 19);
INSERT INTO `option` VALUES (10227, '永顺镇', '永顺镇', 35, 10220, 19);
INSERT INTO `option` VALUES (10228, '梨园镇', '梨园镇', 40, 10220, 19);
INSERT INTO `option` VALUES (10229, '宋庄镇', '宋庄镇', 45, 10220, 19);
INSERT INTO `option` VALUES (10230, '漷县镇', '漷县镇', 50, 10220, 19);
INSERT INTO `option` VALUES (10231, '张家湾镇', '张家湾镇', 55, 10220, 19);
INSERT INTO `option` VALUES (10232, '西集镇', '西集镇', 60, 10220, 19);
INSERT INTO `option` VALUES (10233, '永乐店镇', '永乐店镇', 65, 10220, 19);
INSERT INTO `option` VALUES (10234, '潞城镇', '潞城镇', 70, 10220, 19);
INSERT INTO `option` VALUES (10235, '台湖镇', '台湖镇', 75, 10220, 19);
INSERT INTO `option` VALUES (10236, '于家务乡', '于家务乡', 80, 10220, 19);
INSERT INTO `option` VALUES (10237, '次渠镇', '次渠镇', 85, 10220, 19);
INSERT INTO `option` VALUES (10238, '大兴区', '大兴区', 60, 10147, 19);
INSERT INTO `option` VALUES (10239, '四环至五环之间', '四环至五环之间', 5, 10238, 19);
INSERT INTO `option` VALUES (10240, '五环至六环之间', '五环至六环之间', 10, 10238, 19);
INSERT INTO `option` VALUES (10241, '六环以外', '六环以外', 15, 10238, 19);
INSERT INTO `option` VALUES (10242, '亦庄经济开发区', '亦庄经济开发区', 20, 10238, 19);
INSERT INTO `option` VALUES (10243, '顺义区', '顺义区', 65, 10147, 19);
INSERT INTO `option` VALUES (10244, '北石槽镇', '北石槽镇', 5, 10243, 19);
INSERT INTO `option` VALUES (10245, '北务镇', '北务镇', 10, 10243, 19);
INSERT INTO `option` VALUES (10246, '北小营镇', '北小营镇', 15, 10243, 19);
INSERT INTO `option` VALUES (10247, '大孙各庄镇', '大孙各庄镇', 20, 10243, 19);
INSERT INTO `option` VALUES (10248, '高丽营镇', '高丽营镇', 25, 10243, 19);
INSERT INTO `option` VALUES (10249, '光明街道', '光明街道', 30, 10243, 19);
INSERT INTO `option` VALUES (10250, '后沙峪地区', '后沙峪地区', 35, 10243, 19);
INSERT INTO `option` VALUES (10251, '空港街道', '空港街道', 40, 10243, 19);
INSERT INTO `option` VALUES (10252, '李桥镇', '李桥镇', 45, 10243, 19);
INSERT INTO `option` VALUES (10253, '李遂镇', '李遂镇', 50, 10243, 19);
INSERT INTO `option` VALUES (10254, '龙湾屯镇', '龙湾屯镇', 55, 10243, 19);
INSERT INTO `option` VALUES (10255, '马坡地区', '马坡地区', 60, 10243, 19);
INSERT INTO `option` VALUES (10256, '木林镇', '木林镇', 65, 10243, 19);
INSERT INTO `option` VALUES (10257, '南彩镇', '南彩镇', 70, 10243, 19);
INSERT INTO `option` VALUES (10258, '南法信地区', '南法信地区', 75, 10243, 19);
INSERT INTO `option` VALUES (10259, '牛栏山地区', '牛栏山地区', 80, 10243, 19);
INSERT INTO `option` VALUES (10260, '仁和地区', '仁和地区', 85, 10243, 19);
INSERT INTO `option` VALUES (10261, '胜利街道', '胜利街道', 90, 10243, 19);
INSERT INTO `option` VALUES (10262, '石园街道', '石园街道', 95, 10243, 19);
INSERT INTO `option` VALUES (10263, '双丰街道', '双丰街道', 100, 10243, 19);
INSERT INTO `option` VALUES (10264, '天竺地区', '天竺地区', 105, 10243, 19);
INSERT INTO `option` VALUES (10265, '旺泉街道', '旺泉街道', 110, 10243, 19);
INSERT INTO `option` VALUES (10266, '杨镇地区', '杨镇地区', 115, 10243, 19);
INSERT INTO `option` VALUES (10267, '张镇', '张镇', 120, 10243, 19);
INSERT INTO `option` VALUES (10268, '赵全营镇', '赵全营镇', 125, 10243, 19);
INSERT INTO `option` VALUES (10269, '怀柔区', '怀柔区', 70, 10147, 19);
INSERT INTO `option` VALUES (10270, '城区以内', '城区以内', 5, 10269, 19);
INSERT INTO `option` VALUES (10271, '郊区', '郊区', 10, 10269, 19);
INSERT INTO `option` VALUES (10272, '密云区', '密云区', 75, 10147, 19);
INSERT INTO `option` VALUES (10273, '城区', '城区', 5, 10272, 19);
INSERT INTO `option` VALUES (10274, '城区以外', '城区以外', 10, 10272, 19);
INSERT INTO `option` VALUES (10275, '昌平区', '昌平区', 80, 10147, 19);
INSERT INTO `option` VALUES (10276, '六环以内', '六环以内', 5, 10275, 19);
INSERT INTO `option` VALUES (10277, '城区', '城区', 10, 10275, 19);
INSERT INTO `option` VALUES (10278, '城区以外', '城区以外', 15, 10275, 19);
INSERT INTO `option` VALUES (10279, '平谷区', '平谷区', 85, 10147, 19);
INSERT INTO `option` VALUES (10280, '城区', '城区', 5, 10279, 19);
INSERT INTO `option` VALUES (10281, '城区以外', '城区以外', 10, 10279, 19);
INSERT INTO `option` VALUES (10282, '延庆县', '延庆县', 90, 10147, 19);
INSERT INTO `option` VALUES (10283, '延庆镇', '延庆镇', 5, 10282, 19);
INSERT INTO `option` VALUES (10284, '城区', '城区', 10, 10282, 19);
INSERT INTO `option` VALUES (10285, '康庄镇', '康庄镇', 15, 10282, 19);
INSERT INTO `option` VALUES (10286, '八达岭镇', '八达岭镇', 20, 10282, 19);
INSERT INTO `option` VALUES (10287, '永宁镇', '永宁镇', 25, 10282, 19);
INSERT INTO `option` VALUES (10288, '旧县镇', '旧县镇', 30, 10282, 19);
INSERT INTO `option` VALUES (10289, '张山营镇', '张山营镇', 35, 10282, 19);
INSERT INTO `option` VALUES (10290, '四海镇', '四海镇', 40, 10282, 19);
INSERT INTO `option` VALUES (10291, '千家店镇', '千家店镇', 45, 10282, 19);
INSERT INTO `option` VALUES (10292, '沈家营镇', '沈家营镇', 50, 10282, 19);
INSERT INTO `option` VALUES (10293, '大榆树镇', '大榆树镇', 55, 10282, 19);
INSERT INTO `option` VALUES (10294, '井庄镇', '井庄镇', 60, 10282, 19);
INSERT INTO `option` VALUES (10295, '大庄科乡', '大庄科乡', 65, 10282, 19);
INSERT INTO `option` VALUES (10296, '刘斌堡乡', '刘斌堡乡', 70, 10282, 19);
INSERT INTO `option` VALUES (10297, '香营乡', '香营乡', 75, 10282, 19);
INSERT INTO `option` VALUES (10298, '珍珠泉乡', '珍珠泉乡', 80, 10282, 19);
INSERT INTO `option` VALUES (10299, '上海市', '上海市', 10, 0, 19);
INSERT INTO `option` VALUES (10300, '黄浦区', '黄浦区', 5, 10299, 19);
INSERT INTO `option` VALUES (10301, '徐汇区', '徐汇区', 10, 10299, 19);
INSERT INTO `option` VALUES (10302, '长宁区', '长宁区', 15, 10299, 19);
INSERT INTO `option` VALUES (10303, '静安区', '静安区', 20, 10299, 19);
INSERT INTO `option` VALUES (10304, '闸北区', '闸北区', 25, 10299, 19);
INSERT INTO `option` VALUES (10305, '虹口区', '虹口区', 30, 10299, 19);
INSERT INTO `option` VALUES (10306, '杨浦区', '杨浦区', 35, 10299, 19);
INSERT INTO `option` VALUES (10307, '宝山区', '宝山区', 40, 10299, 19);
INSERT INTO `option` VALUES (10308, '罗店镇', '罗店镇', 5, 10307, 19);
INSERT INTO `option` VALUES (10309, '城区', '城区', 10, 10307, 19);
INSERT INTO `option` VALUES (10310, '大场镇', '大场镇', 15, 10307, 19);
INSERT INTO `option` VALUES (10311, '杨行镇', '杨行镇', 20, 10307, 19);
INSERT INTO `option` VALUES (10312, '月浦镇', '月浦镇', 25, 10307, 19);
INSERT INTO `option` VALUES (10313, '罗泾镇', '罗泾镇', 30, 10307, 19);
INSERT INTO `option` VALUES (10314, '顾村镇', '顾村镇', 35, 10307, 19);
INSERT INTO `option` VALUES (10315, '高境镇', '高境镇', 40, 10307, 19);
INSERT INTO `option` VALUES (10316, '庙行镇', '庙行镇', 45, 10307, 19);
INSERT INTO `option` VALUES (10317, '淞南镇', '淞南镇', 50, 10307, 19);
INSERT INTO `option` VALUES (10318, '宝山城市工业园区', '宝山城市工业园区', 55, 10307, 19);
INSERT INTO `option` VALUES (10319, '闵行区', '闵行区', 45, 10299, 19);
INSERT INTO `option` VALUES (10320, '城区', '城区', 5, 10319, 19);
INSERT INTO `option` VALUES (10321, '莘庄镇', '莘庄镇', 10, 10319, 19);
INSERT INTO `option` VALUES (10322, '七宝镇', '七宝镇', 15, 10319, 19);
INSERT INTO `option` VALUES (10323, '浦江镇', '浦江镇', 20, 10319, 19);
INSERT INTO `option` VALUES (10324, '梅陇镇', '梅陇镇', 25, 10319, 19);
INSERT INTO `option` VALUES (10325, '虹桥镇', '虹桥镇', 30, 10319, 19);
INSERT INTO `option` VALUES (10326, '马桥镇', '马桥镇', 35, 10319, 19);
INSERT INTO `option` VALUES (10327, '吴泾镇', '吴泾镇', 40, 10319, 19);
INSERT INTO `option` VALUES (10328, '华漕镇', '华漕镇', 45, 10319, 19);
INSERT INTO `option` VALUES (10329, '颛桥镇', '颛桥镇', 50, 10319, 19);
INSERT INTO `option` VALUES (10330, '嘉定区', '嘉定区', 50, 10299, 19);
INSERT INTO `option` VALUES (10331, '城区', '城区', 5, 10330, 19);
INSERT INTO `option` VALUES (10332, '南翔镇', '南翔镇', 10, 10330, 19);
INSERT INTO `option` VALUES (10333, '马陆镇', '马陆镇', 15, 10330, 19);
INSERT INTO `option` VALUES (10334, '华亭镇', '华亭镇', 20, 10330, 19);
INSERT INTO `option` VALUES (10335, '江桥镇', '江桥镇', 25, 10330, 19);
INSERT INTO `option` VALUES (10336, '菊园新区', '菊园新区', 30, 10330, 19);
INSERT INTO `option` VALUES (10337, '安亭镇', '安亭镇', 35, 10330, 19);
INSERT INTO `option` VALUES (10338, '徐行镇', '徐行镇', 40, 10330, 19);
INSERT INTO `option` VALUES (10339, '外冈镇', '外冈镇', 45, 10330, 19);
INSERT INTO `option` VALUES (10340, '嘉定工业区', '嘉定工业区', 50, 10330, 19);
INSERT INTO `option` VALUES (10341, '浦东新区', '浦东新区', 55, 10299, 19);
INSERT INTO `option` VALUES (10342, '城区', '城区', 5, 10341, 19);
INSERT INTO `option` VALUES (10343, '川沙新镇', '川沙新镇', 10, 10341, 19);
INSERT INTO `option` VALUES (10344, '祝桥镇', '祝桥镇', 15, 10341, 19);
INSERT INTO `option` VALUES (10345, '新场镇', '新场镇', 20, 10341, 19);
INSERT INTO `option` VALUES (10346, '高桥镇', '高桥镇', 25, 10341, 19);
INSERT INTO `option` VALUES (10347, '惠南镇', '惠南镇', 30, 10341, 19);
INSERT INTO `option` VALUES (10348, '北蔡镇', '北蔡镇', 35, 10341, 19);
INSERT INTO `option` VALUES (10349, '合庆镇', '合庆镇', 40, 10341, 19);
INSERT INTO `option` VALUES (10350, '唐镇', '唐镇', 45, 10341, 19);
INSERT INTO `option` VALUES (10351, '曹路镇', '曹路镇', 50, 10341, 19);
INSERT INTO `option` VALUES (10352, '金桥镇', '金桥镇', 55, 10341, 19);
INSERT INTO `option` VALUES (10353, '高行镇', '高行镇', 60, 10341, 19);
INSERT INTO `option` VALUES (10354, '高东镇', '高东镇', 65, 10341, 19);
INSERT INTO `option` VALUES (10355, '张江镇', '张江镇', 70, 10341, 19);
INSERT INTO `option` VALUES (10356, '三林镇', '三林镇', 75, 10341, 19);
INSERT INTO `option` VALUES (10357, '南汇新城镇', '南汇新城镇', 80, 10341, 19);
INSERT INTO `option` VALUES (10358, '康桥镇', '康桥镇', 85, 10341, 19);
INSERT INTO `option` VALUES (10359, '宣桥镇', '宣桥镇', 90, 10341, 19);
INSERT INTO `option` VALUES (10360, '书院镇', '书院镇', 95, 10341, 19);
INSERT INTO `option` VALUES (10361, '大团镇', '大团镇', 100, 10341, 19);
INSERT INTO `option` VALUES (10362, '周浦镇', '周浦镇', 105, 10341, 19);
INSERT INTO `option` VALUES (10363, '芦潮港镇', '芦潮港镇', 110, 10341, 19);
INSERT INTO `option` VALUES (10364, '泥城镇', '泥城镇', 115, 10341, 19);
INSERT INTO `option` VALUES (10365, '航头镇', '航头镇', 120, 10341, 19);
INSERT INTO `option` VALUES (10366, '万祥镇', '万祥镇', 125, 10341, 19);
INSERT INTO `option` VALUES (10367, '老港镇', '老港镇', 130, 10341, 19);
INSERT INTO `option` VALUES (10368, '青浦区', '青浦区', 60, 10299, 19);
INSERT INTO `option` VALUES (10369, '城区', '城区', 5, 10368, 19);
INSERT INTO `option` VALUES (10370, '赵巷镇', '赵巷镇', 10, 10368, 19);
INSERT INTO `option` VALUES (10371, '徐泾镇', '徐泾镇', 15, 10368, 19);
INSERT INTO `option` VALUES (10372, '华新镇', '华新镇', 20, 10368, 19);
INSERT INTO `option` VALUES (10373, '重固镇', '重固镇', 25, 10368, 19);
INSERT INTO `option` VALUES (10374, '白鹤镇', '白鹤镇', 30, 10368, 19);
INSERT INTO `option` VALUES (10375, '练塘镇', '练塘镇', 35, 10368, 19);
INSERT INTO `option` VALUES (10376, '金泽镇', '金泽镇', 40, 10368, 19);
INSERT INTO `option` VALUES (10377, '朱家角镇', '朱家角镇', 45, 10368, 19);
INSERT INTO `option` VALUES (10378, '松江区', '松江区', 65, 10299, 19);
INSERT INTO `option` VALUES (10379, '城区', '城区', 5, 10378, 19);
INSERT INTO `option` VALUES (10380, '泗泾镇', '泗泾镇', 10, 10378, 19);
INSERT INTO `option` VALUES (10381, '佘山镇', '佘山镇', 15, 10378, 19);
INSERT INTO `option` VALUES (10382, '车墩镇', '车墩镇', 20, 10378, 19);
INSERT INTO `option` VALUES (10383, '新桥镇', '新桥镇', 25, 10378, 19);
INSERT INTO `option` VALUES (10384, '洞泾镇', '洞泾镇', 30, 10378, 19);
INSERT INTO `option` VALUES (10385, '九亭镇', '九亭镇', 35, 10378, 19);
INSERT INTO `option` VALUES (10386, '泖港镇', '泖港镇', 40, 10378, 19);
INSERT INTO `option` VALUES (10387, '石湖荡镇', '石湖荡镇', 45, 10378, 19);
INSERT INTO `option` VALUES (10388, '新浜镇', '新浜镇', 50, 10378, 19);
INSERT INTO `option` VALUES (10389, '叶榭镇', '叶榭镇', 55, 10378, 19);
INSERT INTO `option` VALUES (10390, '小昆山镇', '小昆山镇', 60, 10378, 19);
INSERT INTO `option` VALUES (10391, '金山区', '金山区', 70, 10299, 19);
INSERT INTO `option` VALUES (10392, '城区', '城区', 5, 10391, 19);
INSERT INTO `option` VALUES (10393, '金山工业区', '金山工业区', 10, 10391, 19);
INSERT INTO `option` VALUES (10394, '朱泾镇', '朱泾镇', 15, 10391, 19);
INSERT INTO `option` VALUES (10395, '枫泾镇', '枫泾镇', 20, 10391, 19);
INSERT INTO `option` VALUES (10396, '张堰镇', '张堰镇', 25, 10391, 19);
INSERT INTO `option` VALUES (10397, '亭林镇', '亭林镇', 30, 10391, 19);
INSERT INTO `option` VALUES (10398, '吕巷镇', '吕巷镇', 35, 10391, 19);
INSERT INTO `option` VALUES (10399, '廊下镇', '廊下镇', 40, 10391, 19);
INSERT INTO `option` VALUES (10400, '金山卫镇', '金山卫镇', 45, 10391, 19);
INSERT INTO `option` VALUES (10401, '漕泾镇', '漕泾镇', 50, 10391, 19);
INSERT INTO `option` VALUES (10402, '山阳镇', '山阳镇', 55, 10391, 19);
INSERT INTO `option` VALUES (10403, '奉贤区', '奉贤区', 75, 10299, 19);
INSERT INTO `option` VALUES (10404, '南桥镇', '南桥镇', 5, 10403, 19);
INSERT INTO `option` VALUES (10405, '奉城镇', '奉城镇', 10, 10403, 19);
INSERT INTO `option` VALUES (10406, '四团镇', '四团镇', 15, 10403, 19);
INSERT INTO `option` VALUES (10407, '柘林镇', '柘林镇', 20, 10403, 19);
INSERT INTO `option` VALUES (10408, '庄行镇', '庄行镇', 25, 10403, 19);
INSERT INTO `option` VALUES (10409, '金汇镇', '金汇镇', 30, 10403, 19);
INSERT INTO `option` VALUES (10410, '青村镇', '青村镇', 35, 10403, 19);
INSERT INTO `option` VALUES (10411, '海湾镇', '海湾镇', 40, 10403, 19);
INSERT INTO `option` VALUES (10412, '普陀区', '普陀区', 80, 10299, 19);
INSERT INTO `option` VALUES (10413, '崇明县', '崇明县', 85, 10299, 19);
INSERT INTO `option` VALUES (10414, '堡镇', '堡镇', 5, 10413, 19);
INSERT INTO `option` VALUES (10415, '庙镇', '庙镇', 10, 10413, 19);
INSERT INTO `option` VALUES (10416, '陈家镇', '陈家镇', 15, 10413, 19);
INSERT INTO `option` VALUES (10417, '城桥镇', '城桥镇', 20, 10413, 19);
INSERT INTO `option` VALUES (10418, '东平镇', '东平镇', 25, 10413, 19);
INSERT INTO `option` VALUES (10419, '港西镇', '港西镇', 30, 10413, 19);
INSERT INTO `option` VALUES (10420, '港沿镇', '港沿镇', 35, 10413, 19);
INSERT INTO `option` VALUES (10421, '建设镇', '建设镇', 40, 10413, 19);
INSERT INTO `option` VALUES (10422, '绿华镇', '绿华镇', 45, 10413, 19);
INSERT INTO `option` VALUES (10423, '三星镇', '三星镇', 50, 10413, 19);
INSERT INTO `option` VALUES (10424, '竖新镇', '竖新镇', 55, 10413, 19);
INSERT INTO `option` VALUES (10425, '向化镇', '向化镇', 60, 10413, 19);
INSERT INTO `option` VALUES (10426, '新海镇', '新海镇', 65, 10413, 19);
INSERT INTO `option` VALUES (10427, '新河镇', '新河镇', 70, 10413, 19);
INSERT INTO `option` VALUES (10428, '中兴镇', '中兴镇', 75, 10413, 19);
INSERT INTO `option` VALUES (10429, '长兴乡', '长兴乡', 80, 10413, 19);
INSERT INTO `option` VALUES (10430, '横沙乡', '横沙乡', 85, 10413, 19);
INSERT INTO `option` VALUES (10431, '新村乡', '新村乡', 90, 10413, 19);
INSERT INTO `option` VALUES (10432, '天津市', '天津市', 15, 0, 19);
INSERT INTO `option` VALUES (10433, '东丽区', '东丽区', 5, 10432, 19);
INSERT INTO `option` VALUES (10434, '和平区', '和平区', 10, 10432, 19);
INSERT INTO `option` VALUES (10435, '河北区', '河北区', 15, 10432, 19);
INSERT INTO `option` VALUES (10436, '河东区', '河东区', 20, 10432, 19);
INSERT INTO `option` VALUES (10437, '河西区', '河西区', 25, 10432, 19);
INSERT INTO `option` VALUES (10438, '红桥区', '红桥区', 30, 10432, 19);
INSERT INTO `option` VALUES (10439, '蓟县', '蓟县', 35, 10432, 19);
INSERT INTO `option` VALUES (10440, '静海县', '静海县', 40, 10432, 19);
INSERT INTO `option` VALUES (10441, '南开区', '南开区', 45, 10432, 19);
INSERT INTO `option` VALUES (10442, '塘沽区', '塘沽区', 50, 10432, 19);
INSERT INTO `option` VALUES (10443, '西青区', '西青区', 55, 10432, 19);
INSERT INTO `option` VALUES (10444, '杨柳青,中北,精武,大寺镇,环外海泰及外环内', '杨柳青,中北,精武,大寺镇,环外海泰及外环内', 5, 10443, 19);
INSERT INTO `option` VALUES (10445, '其它地区', '其它地区', 10, 10443, 19);
INSERT INTO `option` VALUES (10446, '武清区', '武清区', 60, 10432, 19);
INSERT INTO `option` VALUES (10447, '杨村镇、下朱庄内', '杨村镇、下朱庄内', 5, 10446, 19);
INSERT INTO `option` VALUES (10448, '其它地区', '其它地区', 10, 10446, 19);
INSERT INTO `option` VALUES (10449, '津南区', '津南区', 65, 10432, 19);
INSERT INTO `option` VALUES (10450, '双港，辛庄', '双港，辛庄', 5, 10449, 19);
INSERT INTO `option` VALUES (10451, '咸水沽镇、海河教育园，海河科技园', '咸水沽镇、海河教育园，海河科技园', 10, 10449, 19);
INSERT INTO `option` VALUES (10452, '其他地区', '其他地区', 15, 10449, 19);
INSERT INTO `option` VALUES (10453, '汉沽区', '汉沽区', 70, 10432, 19);
INSERT INTO `option` VALUES (10454, '汉沽区街里、汉沽开发区', '汉沽区街里、汉沽开发区', 5, 10453, 19);
INSERT INTO `option` VALUES (10455, '其它地区', '其它地区', 10, 10453, 19);
INSERT INTO `option` VALUES (10456, '大港区', '大港区', 75, 10432, 19);
INSERT INTO `option` VALUES (10457, '大港油田', '大港油田', 5, 10456, 19);
INSERT INTO `option` VALUES (10458, '主城区内', '主城区内', 10, 10456, 19);
INSERT INTO `option` VALUES (10459, '主城区外', '主城区外', 15, 10456, 19);
INSERT INTO `option` VALUES (10460, '北辰区', '北辰区', 80, 10432, 19);
INSERT INTO `option` VALUES (10461, '外环外双街镇，河北工大新校，屈店工业园', '外环外双街镇，河北工大新校，屈店工业园', 5, 10460, 19);
INSERT INTO `option` VALUES (10462, '外环内', '外环内', 10, 10460, 19);
INSERT INTO `option` VALUES (10463, '外环外其它地区', '外环外其它地区', 15, 10460, 19);
INSERT INTO `option` VALUES (10464, '宝坻区', '宝坻区', 85, 10432, 19);
INSERT INTO `option` VALUES (10465, '城关镇、马家店开发区、天宝工业园', '城关镇、马家店开发区、天宝工业园', 5, 10464, 19);
INSERT INTO `option` VALUES (10466, '其它地区', '其它地区', 10, 10464, 19);
INSERT INTO `option` VALUES (10467, '宁河县', '宁河县', 90, 10432, 19);
INSERT INTO `option` VALUES (10468, '芦台镇、经济开发区、贸易开发区', '芦台镇、经济开发区、贸易开发区', 5, 10467, 19);
INSERT INTO `option` VALUES (10469, '其它地区', '其它地区', 10, 10467, 19);
INSERT INTO `option` VALUES (10470, '重庆市', '重庆市', 20, 0, 19);
INSERT INTO `option` VALUES (10471, '万州区', '万州区', 5, 10470, 19);
INSERT INTO `option` VALUES (10472, '城区', '城区', 5, 10471, 19);
INSERT INTO `option` VALUES (10473, '白土镇', '白土镇', 10, 10471, 19);
INSERT INTO `option` VALUES (10474, '白羊镇', '白羊镇', 15, 10471, 19);
INSERT INTO `option` VALUES (10475, '大周镇', '大周镇', 20, 10471, 19);
INSERT INTO `option` VALUES (10476, '弹子镇', '弹子镇', 25, 10471, 19);
INSERT INTO `option` VALUES (10477, '分水镇', '分水镇', 30, 10471, 19);
INSERT INTO `option` VALUES (10478, '甘宁镇', '甘宁镇', 35, 10471, 19);
INSERT INTO `option` VALUES (10479, '高峰镇', '高峰镇', 40, 10471, 19);
INSERT INTO `option` VALUES (10480, '高梁镇', '高梁镇', 45, 10471, 19);
INSERT INTO `option` VALUES (10481, '后山镇', '后山镇', 50, 10471, 19);
INSERT INTO `option` VALUES (10482, '李河镇', '李河镇', 55, 10471, 19);
INSERT INTO `option` VALUES (10483, '龙驹镇', '龙驹镇', 60, 10471, 19);
INSERT INTO `option` VALUES (10484, '龙沙镇', '龙沙镇', 65, 10471, 19);
INSERT INTO `option` VALUES (10485, '罗田镇', '罗田镇', 70, 10471, 19);
INSERT INTO `option` VALUES (10486, '孙家镇', '孙家镇', 75, 10471, 19);
INSERT INTO `option` VALUES (10487, '太安镇', '太安镇', 80, 10471, 19);
INSERT INTO `option` VALUES (10488, '太龙镇', '太龙镇', 85, 10471, 19);
INSERT INTO `option` VALUES (10489, '天城镇', '天城镇', 90, 10471, 19);
INSERT INTO `option` VALUES (10490, '武陵镇', '武陵镇', 95, 10471, 19);
INSERT INTO `option` VALUES (10491, '响水镇', '响水镇', 100, 10471, 19);
INSERT INTO `option` VALUES (10492, '小周镇', '小周镇', 105, 10471, 19);
INSERT INTO `option` VALUES (10493, '新田镇', '新田镇', 110, 10471, 19);
INSERT INTO `option` VALUES (10494, '新乡镇', '新乡镇', 115, 10471, 19);
INSERT INTO `option` VALUES (10495, '熊家镇', '熊家镇', 120, 10471, 19);
INSERT INTO `option` VALUES (10496, '余家镇', '余家镇', 125, 10471, 19);
INSERT INTO `option` VALUES (10497, '长岭镇', '长岭镇', 130, 10471, 19);
INSERT INTO `option` VALUES (10498, '长坪镇', '长坪镇', 135, 10471, 19);
INSERT INTO `option` VALUES (10499, '长滩镇', '长滩镇', 140, 10471, 19);
INSERT INTO `option` VALUES (10500, '走马镇', '走马镇', 145, 10471, 19);
INSERT INTO `option` VALUES (10501, '瀼渡镇', '瀼渡镇', 150, 10471, 19);
INSERT INTO `option` VALUES (10502, '茨竹乡', '茨竹乡', 155, 10471, 19);
INSERT INTO `option` VALUES (10503, '柱山乡', '柱山乡', 160, 10471, 19);
INSERT INTO `option` VALUES (10504, '燕山乡', '燕山乡', 165, 10471, 19);
INSERT INTO `option` VALUES (10505, '溪口乡', '溪口乡', 170, 10471, 19);
INSERT INTO `option` VALUES (10506, '普子乡', '普子乡', 175, 10471, 19);
INSERT INTO `option` VALUES (10507, '地宝乡', '地宝乡', 180, 10471, 19);
INSERT INTO `option` VALUES (10508, '铁峰乡', '铁峰乡', 185, 10471, 19);
INSERT INTO `option` VALUES (10509, '黄柏乡', '黄柏乡', 190, 10471, 19);
INSERT INTO `option` VALUES (10510, '九池乡', '九池乡', 195, 10471, 19);
INSERT INTO `option` VALUES (10511, '梨树乡', '梨树乡', 200, 10471, 19);
INSERT INTO `option` VALUES (10512, '郭村乡', '郭村乡', 205, 10471, 19);
INSERT INTO `option` VALUES (10513, '恒合乡', '恒合乡', 210, 10471, 19);
INSERT INTO `option` VALUES (10514, '涪陵区', '涪陵区', 10, 10470, 19);
INSERT INTO `option` VALUES (10515, '城区', '城区', 5, 10514, 19);
INSERT INTO `option` VALUES (10516, '李渡镇', '李渡镇', 10, 10514, 19);
INSERT INTO `option` VALUES (10517, '白涛镇', '白涛镇', 15, 10514, 19);
INSERT INTO `option` VALUES (10518, '百胜镇', '百胜镇', 20, 10514, 19);
INSERT INTO `option` VALUES (10519, '堡子镇', '堡子镇', 25, 10514, 19);
INSERT INTO `option` VALUES (10520, '焦石镇', '焦石镇', 30, 10514, 19);
INSERT INTO `option` VALUES (10521, '蔺市镇', '蔺市镇', 35, 10514, 19);
INSERT INTO `option` VALUES (10522, '龙桥镇', '龙桥镇', 40, 10514, 19);
INSERT INTO `option` VALUES (10523, '龙潭镇', '龙潭镇', 45, 10514, 19);
INSERT INTO `option` VALUES (10524, '马武镇', '马武镇', 50, 10514, 19);
INSERT INTO `option` VALUES (10525, '南沱镇', '南沱镇', 55, 10514, 19);
INSERT INTO `option` VALUES (10526, '青羊镇', '青羊镇', 60, 10514, 19);
INSERT INTO `option` VALUES (10527, '清溪镇', '清溪镇', 65, 10514, 19);
INSERT INTO `option` VALUES (10528, '石沱镇', '石沱镇', 70, 10514, 19);
INSERT INTO `option` VALUES (10529, '新妙镇', '新妙镇', 75, 10514, 19);
INSERT INTO `option` VALUES (10530, '义和镇', '义和镇', 80, 10514, 19);
INSERT INTO `option` VALUES (10531, '增福乡', '增福乡', 85, 10514, 19);
INSERT INTO `option` VALUES (10532, '珍溪镇', '珍溪镇', 90, 10514, 19);
INSERT INTO `option` VALUES (10533, '镇安镇', '镇安镇', 95, 10514, 19);
INSERT INTO `option` VALUES (10534, '致韩镇', '致韩镇', 100, 10514, 19);
INSERT INTO `option` VALUES (10535, '土地坡乡', '土地坡乡', 105, 10514, 19);
INSERT INTO `option` VALUES (10536, '武陵山乡', '武陵山乡', 110, 10514, 19);
INSERT INTO `option` VALUES (10537, '中峰乡', '中峰乡', 115, 10514, 19);
INSERT INTO `option` VALUES (10538, '梓里乡', '梓里乡', 120, 10514, 19);
INSERT INTO `option` VALUES (10539, '丛林乡', '丛林乡', 125, 10514, 19);
INSERT INTO `option` VALUES (10540, '大木乡', '大木乡', 130, 10514, 19);
INSERT INTO `option` VALUES (10541, '惠民乡', '惠民乡', 135, 10514, 19);
INSERT INTO `option` VALUES (10542, '酒店乡', '酒店乡', 140, 10514, 19);
INSERT INTO `option` VALUES (10543, '聚宝乡', '聚宝乡', 145, 10514, 19);
INSERT INTO `option` VALUES (10544, '卷洞乡', '卷洞乡', 150, 10514, 19);
INSERT INTO `option` VALUES (10545, '两汇乡', '两汇乡', 155, 10514, 19);
INSERT INTO `option` VALUES (10546, '罗云乡', '罗云乡', 160, 10514, 19);
INSERT INTO `option` VALUES (10547, '明家乡', '明家乡', 165, 10514, 19);
INSERT INTO `option` VALUES (10548, '仁义乡', '仁义乡', 170, 10514, 19);
INSERT INTO `option` VALUES (10549, '山窝乡', '山窝乡', 175, 10514, 19);
INSERT INTO `option` VALUES (10550, '石和乡', '石和乡', 180, 10514, 19);
INSERT INTO `option` VALUES (10551, '石龙乡', '石龙乡', 185, 10514, 19);
INSERT INTO `option` VALUES (10552, '太和乡', '太和乡', 190, 10514, 19);
INSERT INTO `option` VALUES (10553, '天台乡', '天台乡', 195, 10514, 19);
INSERT INTO `option` VALUES (10554, '同乐乡', '同乐乡', 200, 10514, 19);
INSERT INTO `option` VALUES (10555, '新村乡', '新村乡', 205, 10514, 19);
INSERT INTO `option` VALUES (10556, '梁平县', '梁平县', 15, 10470, 19);
INSERT INTO `option` VALUES (10557, '县城内', '县城内', 5, 10556, 19);
INSERT INTO `option` VALUES (10558, '梁山镇', '梁山镇', 10, 10556, 19);
INSERT INTO `option` VALUES (10559, '柏家镇', '柏家镇', 15, 10556, 19);
INSERT INTO `option` VALUES (10560, '碧山镇', '碧山镇', 20, 10556, 19);
INSERT INTO `option` VALUES (10561, '大观镇', '大观镇', 25, 10556, 19);
INSERT INTO `option` VALUES (10562, '福禄镇', '福禄镇', 30, 10556, 19);
INSERT INTO `option` VALUES (10563, '合兴镇', '合兴镇', 35, 10556, 19);
INSERT INTO `option` VALUES (10564, '和林镇', '和林镇', 40, 10556, 19);
INSERT INTO `option` VALUES (10565, '虎城镇', '虎城镇', 45, 10556, 19);
INSERT INTO `option` VALUES (10566, '回龙镇', '回龙镇', 50, 10556, 19);
INSERT INTO `option` VALUES (10567, '金带镇', '金带镇', 55, 10556, 19);
INSERT INTO `option` VALUES (10568, '聚奎镇', '聚奎镇', 60, 10556, 19);
INSERT INTO `option` VALUES (10569, '礼让镇', '礼让镇', 65, 10556, 19);
INSERT INTO `option` VALUES (10570, '龙门镇', '龙门镇', 70, 10556, 19);
INSERT INTO `option` VALUES (10571, '明达镇', '明达镇', 75, 10556, 19);
INSERT INTO `option` VALUES (10572, '蟠龙镇', '蟠龙镇', 80, 10556, 19);
INSERT INTO `option` VALUES (10573, '屏锦镇', '屏锦镇', 85, 10556, 19);
INSERT INTO `option` VALUES (10574, '仁贤镇', '仁贤镇', 90, 10556, 19);
INSERT INTO `option` VALUES (10575, '石安镇', '石安镇', 95, 10556, 19);
INSERT INTO `option` VALUES (10576, '文化镇', '文化镇', 100, 10556, 19);
INSERT INTO `option` VALUES (10577, '新盛镇', '新盛镇', 105, 10556, 19);
INSERT INTO `option` VALUES (10578, '荫平镇', '荫平镇', 110, 10556, 19);
INSERT INTO `option` VALUES (10579, '袁驿镇', '袁驿镇', 115, 10556, 19);
INSERT INTO `option` VALUES (10580, '云龙镇', '云龙镇', 120, 10556, 19);
INSERT INTO `option` VALUES (10581, '竹山镇', '竹山镇', 125, 10556, 19);
INSERT INTO `option` VALUES (10582, '安胜乡', '安胜乡', 130, 10556, 19);
INSERT INTO `option` VALUES (10583, '铁门乡', '铁门乡', 135, 10556, 19);
INSERT INTO `option` VALUES (10584, '紫照乡', '紫照乡', 140, 10556, 19);
INSERT INTO `option` VALUES (10585, '曲水乡', '曲水乡', 145, 10556, 19);
INSERT INTO `option` VALUES (10586, '龙胜乡', '龙胜乡', 150, 10556, 19);
INSERT INTO `option` VALUES (10587, '城北乡', '城北乡', 155, 10556, 19);
INSERT INTO `option` VALUES (10588, '城东乡', '城东乡', 160, 10556, 19);
INSERT INTO `option` VALUES (10589, '复平乡', '复平乡', 165, 10556, 19);
INSERT INTO `option` VALUES (10590, '南川区', '南川区', 20, 10470, 19);
INSERT INTO `option` VALUES (10591, '城区', '城区', 5, 10590, 19);
INSERT INTO `option` VALUES (10592, '头渡镇', '头渡镇', 10, 10590, 19);
INSERT INTO `option` VALUES (10593, '兴隆镇', '兴隆镇', 15, 10590, 19);
INSERT INTO `option` VALUES (10594, '冷水关乡', '冷水关乡', 20, 10590, 19);
INSERT INTO `option` VALUES (10595, '德隆乡', '德隆乡', 25, 10590, 19);
INSERT INTO `option` VALUES (10596, '峰岩乡', '峰岩乡', 30, 10590, 19);
INSERT INTO `option` VALUES (10597, '福寿乡', '福寿乡', 35, 10590, 19);
INSERT INTO `option` VALUES (10598, '古花乡', '古花乡', 40, 10590, 19);
INSERT INTO `option` VALUES (10599, '河图乡', '河图乡', 45, 10590, 19);
INSERT INTO `option` VALUES (10600, '民主乡', '民主乡', 50, 10590, 19);
INSERT INTO `option` VALUES (10601, '木凉乡', '木凉乡', 55, 10590, 19);
INSERT INTO `option` VALUES (10602, '乾丰乡', '乾丰乡', 60, 10590, 19);
INSERT INTO `option` VALUES (10603, '庆元乡', '庆元乡', 65, 10590, 19);
INSERT INTO `option` VALUES (10604, '石莲乡', '石莲乡', 70, 10590, 19);
INSERT INTO `option` VALUES (10605, '石溪乡', '石溪乡', 75, 10590, 19);
INSERT INTO `option` VALUES (10606, '铁村乡', '铁村乡', 80, 10590, 19);
INSERT INTO `option` VALUES (10607, '土溪乡', '土溪乡', 85, 10590, 19);
INSERT INTO `option` VALUES (10608, '鱼泉乡', '鱼泉乡', 90, 10590, 19);
INSERT INTO `option` VALUES (10609, '中桥乡', '中桥乡', 95, 10590, 19);
INSERT INTO `option` VALUES (10610, '太平场镇', '太平场镇', 100, 10590, 19);
INSERT INTO `option` VALUES (10611, '大观镇', '大观镇', 105, 10590, 19);
INSERT INTO `option` VALUES (10612, '大有镇', '大有镇', 110, 10590, 19);
INSERT INTO `option` VALUES (10613, '合溪镇', '合溪镇', 115, 10590, 19);
INSERT INTO `option` VALUES (10614, '金山镇', '金山镇', 120, 10590, 19);
INSERT INTO `option` VALUES (10615, '鸣玉镇', '鸣玉镇', 125, 10590, 19);
INSERT INTO `option` VALUES (10616, '南平镇', '南平镇', 130, 10590, 19);
INSERT INTO `option` VALUES (10617, '三泉镇', '三泉镇', 135, 10590, 19);
INSERT INTO `option` VALUES (10618, '神童镇', '神童镇', 140, 10590, 19);
INSERT INTO `option` VALUES (10619, '石墙镇', '石墙镇', 145, 10590, 19);
INSERT INTO `option` VALUES (10620, '水江镇', '水江镇', 150, 10590, 19);
INSERT INTO `option` VALUES (10621, '潼南县', '潼南县', 25, 10470, 19);
INSERT INTO `option` VALUES (10622, '县城内', '县城内', 5, 10621, 19);
INSERT INTO `option` VALUES (10623, '柏梓镇', '柏梓镇', 10, 10621, 19);
INSERT INTO `option` VALUES (10624, '宝龙镇', '宝龙镇', 15, 10621, 19);
INSERT INTO `option` VALUES (10625, '崇龛镇', '崇龛镇', 20, 10621, 19);
INSERT INTO `option` VALUES (10626, '古溪镇', '古溪镇', 25, 10621, 19);
INSERT INTO `option` VALUES (10627, '龙形镇', '龙形镇', 30, 10621, 19);
INSERT INTO `option` VALUES (10628, '米心镇', '米心镇', 35, 10621, 19);
INSERT INTO `option` VALUES (10629, '群力镇', '群力镇', 40, 10621, 19);
INSERT INTO `option` VALUES (10630, '上和镇', '上和镇', 45, 10621, 19);
INSERT INTO `option` VALUES (10631, '双江镇', '双江镇', 50, 10621, 19);
INSERT INTO `option` VALUES (10632, '太安镇', '太安镇', 55, 10621, 19);
INSERT INTO `option` VALUES (10633, '塘坝镇', '塘坝镇', 60, 10621, 19);
INSERT INTO `option` VALUES (10634, '卧佛镇', '卧佛镇', 65, 10621, 19);
INSERT INTO `option` VALUES (10635, '五桂镇', '五桂镇', 70, 10621, 19);
INSERT INTO `option` VALUES (10636, '小渡镇', '小渡镇', 75, 10621, 19);
INSERT INTO `option` VALUES (10637, '新胜镇', '新胜镇', 80, 10621, 19);
INSERT INTO `option` VALUES (10638, '玉溪镇', '玉溪镇', 85, 10621, 19);
INSERT INTO `option` VALUES (10639, '别口乡', '别口乡', 90, 10621, 19);
INSERT INTO `option` VALUES (10640, '田家乡', '田家乡', 95, 10621, 19);
INSERT INTO `option` VALUES (10641, '寿桥乡', '寿桥乡', 100, 10621, 19);
INSERT INTO `option` VALUES (10642, '大足区', '大足区', 30, 10470, 19);
INSERT INTO `option` VALUES (10643, '城区', '城区', 5, 10642, 19);
INSERT INTO `option` VALUES (10644, '龙滩子镇', '龙滩子镇', 10, 10642, 19);
INSERT INTO `option` VALUES (10645, '龙水镇', '龙水镇', 15, 10642, 19);
INSERT INTO `option` VALUES (10646, '智凤镇', '智凤镇', 20, 10642, 19);
INSERT INTO `option` VALUES (10647, '宝顶镇', '宝顶镇', 25, 10642, 19);
INSERT INTO `option` VALUES (10648, '中敖镇', '中敖镇', 30, 10642, 19);
INSERT INTO `option` VALUES (10649, '三驱镇', '三驱镇', 35, 10642, 19);
INSERT INTO `option` VALUES (10650, '宝兴镇', '宝兴镇', 40, 10642, 19);
INSERT INTO `option` VALUES (10651, '玉龙镇', '玉龙镇', 45, 10642, 19);
INSERT INTO `option` VALUES (10652, '石马镇', '石马镇', 50, 10642, 19);
INSERT INTO `option` VALUES (10653, '拾万镇', '拾万镇', 55, 10642, 19);
INSERT INTO `option` VALUES (10654, '回龙镇', '回龙镇', 60, 10642, 19);
INSERT INTO `option` VALUES (10655, '金山镇', '金山镇', 65, 10642, 19);
INSERT INTO `option` VALUES (10656, '万古镇', '万古镇', 70, 10642, 19);
INSERT INTO `option` VALUES (10657, '国梁镇', '国梁镇', 75, 10642, 19);
INSERT INTO `option` VALUES (10658, '雍溪镇', '雍溪镇', 80, 10642, 19);
INSERT INTO `option` VALUES (10659, '珠溪镇', '珠溪镇', 85, 10642, 19);
INSERT INTO `option` VALUES (10660, '龙石镇', '龙石镇', 90, 10642, 19);
INSERT INTO `option` VALUES (10661, '邮亭镇', '邮亭镇', 95, 10642, 19);
INSERT INTO `option` VALUES (10662, '铁山镇', '铁山镇', 100, 10642, 19);
INSERT INTO `option` VALUES (10663, '高升镇', '高升镇', 105, 10642, 19);
INSERT INTO `option` VALUES (10664, '季家镇', '季家镇', 110, 10642, 19);
INSERT INTO `option` VALUES (10665, '古龙镇', '古龙镇', 115, 10642, 19);
INSERT INTO `option` VALUES (10666, '高坪镇', '高坪镇', 120, 10642, 19);
INSERT INTO `option` VALUES (10667, '双路镇', '双路镇', 125, 10642, 19);
INSERT INTO `option` VALUES (10668, '通桥镇', '通桥镇', 130, 10642, 19);
INSERT INTO `option` VALUES (10669, '黔江区', '黔江区', 35, 10470, 19);
INSERT INTO `option` VALUES (10670, '城区', '城区', 5, 10669, 19);
INSERT INTO `option` VALUES (10671, '正阳镇', '正阳镇', 10, 10669, 19);
INSERT INTO `option` VALUES (10672, '舟白镇', '舟白镇', 15, 10669, 19);
INSERT INTO `option` VALUES (10673, '阿蓬江镇', '阿蓬江镇', 20, 10669, 19);
INSERT INTO `option` VALUES (10674, '小南海镇', '小南海镇', 25, 10669, 19);
INSERT INTO `option` VALUES (10675, '鹅池镇', '鹅池镇', 30, 10669, 19);
INSERT INTO `option` VALUES (10676, '冯家镇', '冯家镇', 35, 10669, 19);
INSERT INTO `option` VALUES (10677, '黑溪镇', '黑溪镇', 40, 10669, 19);
INSERT INTO `option` VALUES (10678, '黄溪镇', '黄溪镇', 45, 10669, 19);
INSERT INTO `option` VALUES (10679, '金溪镇', '金溪镇', 50, 10669, 19);
INSERT INTO `option` VALUES (10680, '黎水镇', '黎水镇', 55, 10669, 19);
INSERT INTO `option` VALUES (10681, '邻鄂镇', '邻鄂镇', 60, 10669, 19);
INSERT INTO `option` VALUES (10682, '马喇镇', '马喇镇', 65, 10669, 19);
INSERT INTO `option` VALUES (10683, '石会镇', '石会镇', 70, 10669, 19);
INSERT INTO `option` VALUES (10684, '石家镇', '石家镇', 75, 10669, 19);
INSERT INTO `option` VALUES (10685, '濯水镇', '濯水镇', 80, 10669, 19);
INSERT INTO `option` VALUES (10686, '白石乡', '白石乡', 85, 10669, 19);
INSERT INTO `option` VALUES (10687, '白土乡', '白土乡', 90, 10669, 19);
INSERT INTO `option` VALUES (10688, '金洞乡', '金洞乡', 95, 10669, 19);
INSERT INTO `option` VALUES (10689, '蓬东乡', '蓬东乡', 100, 10669, 19);
INSERT INTO `option` VALUES (10690, '沙坝乡', '沙坝乡', 105, 10669, 19);
INSERT INTO `option` VALUES (10691, '杉岭乡', '杉岭乡', 110, 10669, 19);
INSERT INTO `option` VALUES (10692, '水市乡', '水市乡', 115, 10669, 19);
INSERT INTO `option` VALUES (10693, '水田乡', '水田乡', 120, 10669, 19);
INSERT INTO `option` VALUES (10694, '太极乡', '太极乡', 125, 10669, 19);
INSERT INTO `option` VALUES (10695, '五里乡', '五里乡', 130, 10669, 19);
INSERT INTO `option` VALUES (10696, '新华乡', '新华乡', 135, 10669, 19);
INSERT INTO `option` VALUES (10697, '中塘乡', '中塘乡', 140, 10669, 19);
INSERT INTO `option` VALUES (10698, '武隆县', '武隆县', 40, 10470, 19);
INSERT INTO `option` VALUES (10699, '县城内', '县城内', 5, 10698, 19);
INSERT INTO `option` VALUES (10700, '仙女山镇', '仙女山镇', 10, 10698, 19);
INSERT INTO `option` VALUES (10701, '巷口镇', '巷口镇', 15, 10698, 19);
INSERT INTO `option` VALUES (10702, '白马镇', '白马镇', 20, 10698, 19);
INSERT INTO `option` VALUES (10703, '火炉镇', '火炉镇', 25, 10698, 19);
INSERT INTO `option` VALUES (10704, '江口镇', '江口镇', 30, 10698, 19);
INSERT INTO `option` VALUES (10705, '平桥镇', '平桥镇', 35, 10698, 19);
INSERT INTO `option` VALUES (10706, '桐梓镇', '桐梓镇', 40, 10698, 19);
INSERT INTO `option` VALUES (10707, '土坎镇', '土坎镇', 45, 10698, 19);
INSERT INTO `option` VALUES (10708, '鸭江镇', '鸭江镇', 50, 10698, 19);
INSERT INTO `option` VALUES (10709, '羊角镇', '羊角镇', 55, 10698, 19);
INSERT INTO `option` VALUES (10710, '长坝镇', '长坝镇', 60, 10698, 19);
INSERT INTO `option` VALUES (10711, '白云乡', '白云乡', 65, 10698, 19);
INSERT INTO `option` VALUES (10712, '沧沟乡', '沧沟乡', 70, 10698, 19);
INSERT INTO `option` VALUES (10713, '凤来乡', '凤来乡', 75, 10698, 19);
INSERT INTO `option` VALUES (10714, '浩口乡', '浩口乡', 80, 10698, 19);
INSERT INTO `option` VALUES (10715, '和顺乡', '和顺乡', 85, 10698, 19);
INSERT INTO `option` VALUES (10716, '后坪乡', '后坪乡', 90, 10698, 19);
INSERT INTO `option` VALUES (10717, '黄莺乡', '黄莺乡', 95, 10698, 19);
INSERT INTO `option` VALUES (10718, '接龙乡', '接龙乡', 100, 10698, 19);
INSERT INTO `option` VALUES (10719, '庙垭乡', '庙垭乡', 105, 10698, 19);
INSERT INTO `option` VALUES (10720, '石桥乡', '石桥乡', 110, 10698, 19);
INSERT INTO `option` VALUES (10721, '双河乡', '双河乡', 115, 10698, 19);
INSERT INTO `option` VALUES (10722, '铁矿乡', '铁矿乡', 120, 10698, 19);
INSERT INTO `option` VALUES (10723, '土地乡', '土地乡', 125, 10698, 19);
INSERT INTO `option` VALUES (10724, '文复乡', '文复乡', 130, 10698, 19);
INSERT INTO `option` VALUES (10725, '赵家乡', '赵家乡', 135, 10698, 19);
INSERT INTO `option` VALUES (10726, '丰都县', '丰都县', 45, 10470, 19);
INSERT INTO `option` VALUES (10727, '县城内', '县城内', 5, 10726, 19);
INSERT INTO `option` VALUES (10728, '南天湖镇', '南天湖镇', 10, 10726, 19);
INSERT INTO `option` VALUES (10729, '许明寺镇', '许明寺镇', 15, 10726, 19);
INSERT INTO `option` VALUES (10730, '包鸾镇', '包鸾镇', 20, 10726, 19);
INSERT INTO `option` VALUES (10731, '董家镇', '董家镇', 25, 10726, 19);
INSERT INTO `option` VALUES (10732, '高家镇', '高家镇', 30, 10726, 19);
INSERT INTO `option` VALUES (10733, '虎威镇', '虎威镇', 35, 10726, 19);
INSERT INTO `option` VALUES (10734, '江池镇', '江池镇', 40, 10726, 19);
INSERT INTO `option` VALUES (10735, '龙河镇', '龙河镇', 45, 10726, 19);
INSERT INTO `option` VALUES (10736, '名山镇', '名山镇', 50, 10726, 19);
INSERT INTO `option` VALUES (10737, '三元镇', '三元镇', 55, 10726, 19);
INSERT INTO `option` VALUES (10738, '社坛镇', '社坛镇', 60, 10726, 19);
INSERT INTO `option` VALUES (10739, '十直镇', '十直镇', 65, 10726, 19);
INSERT INTO `option` VALUES (10740, '树人镇', '树人镇', 70, 10726, 19);
INSERT INTO `option` VALUES (10741, '双路镇', '双路镇', 75, 10726, 19);
INSERT INTO `option` VALUES (10742, '武平镇', '武平镇', 80, 10726, 19);
INSERT INTO `option` VALUES (10743, '兴义镇', '兴义镇', 85, 10726, 19);
INSERT INTO `option` VALUES (10744, '湛普镇', '湛普镇', 90, 10726, 19);
INSERT INTO `option` VALUES (10745, '镇江镇', '镇江镇', 95, 10726, 19);
INSERT INTO `option` VALUES (10746, '太平坝乡', '太平坝乡', 100, 10726, 19);
INSERT INTO `option` VALUES (10747, '双龙场乡', '双龙场乡', 105, 10726, 19);
INSERT INTO `option` VALUES (10748, '保合乡', '保合乡', 110, 10726, 19);
INSERT INTO `option` VALUES (10749, '崇兴乡', '崇兴乡', 115, 10726, 19);
INSERT INTO `option` VALUES (10750, '都督乡', '都督乡', 120, 10726, 19);
INSERT INTO `option` VALUES (10751, '暨龙乡', '暨龙乡', 125, 10726, 19);
INSERT INTO `option` VALUES (10752, '栗子乡', '栗子乡', 130, 10726, 19);
INSERT INTO `option` VALUES (10753, '龙孔乡', '龙孔乡', 135, 10726, 19);
INSERT INTO `option` VALUES (10754, '青龙乡', '青龙乡', 140, 10726, 19);
INSERT INTO `option` VALUES (10755, '仁沙乡', '仁沙乡', 145, 10726, 19);
INSERT INTO `option` VALUES (10756, '三坝乡', '三坝乡', 150, 10726, 19);
INSERT INTO `option` VALUES (10757, '三建乡', '三建乡', 155, 10726, 19);
INSERT INTO `option` VALUES (10758, '奉节县', '奉节县', 50, 10470, 19);
INSERT INTO `option` VALUES (10759, '永乐镇', '永乐镇', 5, 10758, 19);
INSERT INTO `option` VALUES (10760, '县城内', '县城内', 10, 10758, 19);
INSERT INTO `option` VALUES (10761, '永安镇', '永安镇', 15, 10758, 19);
INSERT INTO `option` VALUES (10762, '白帝镇', '白帝镇', 20, 10758, 19);
INSERT INTO `option` VALUES (10763, '草堂镇', '草堂镇', 25, 10758, 19);
INSERT INTO `option` VALUES (10764, '大树镇', '大树镇', 30, 10758, 19);
INSERT INTO `option` VALUES (10765, '汾河镇', '汾河镇', 35, 10758, 19);
INSERT INTO `option` VALUES (10766, '公平镇', '公平镇', 40, 10758, 19);
INSERT INTO `option` VALUES (10767, '甲高镇', '甲高镇', 45, 10758, 19);
INSERT INTO `option` VALUES (10768, '康乐镇', '康乐镇', 50, 10758, 19);
INSERT INTO `option` VALUES (10769, '青龙镇', '青龙镇', 55, 10758, 19);
INSERT INTO `option` VALUES (10770, '吐祥镇', '吐祥镇', 60, 10758, 19);
INSERT INTO `option` VALUES (10771, '新民镇', '新民镇', 65, 10758, 19);
INSERT INTO `option` VALUES (10772, '兴隆镇', '兴隆镇', 70, 10758, 19);
INSERT INTO `option` VALUES (10773, '羊市镇', '羊市镇', 75, 10758, 19);
INSERT INTO `option` VALUES (10774, '朱衣镇', '朱衣镇', 80, 10758, 19);
INSERT INTO `option` VALUES (10775, '竹园镇', '竹园镇', 85, 10758, 19);
INSERT INTO `option` VALUES (10776, '安坪乡', '安坪乡', 90, 10758, 19);
INSERT INTO `option` VALUES (10777, '冯坪乡', '冯坪乡', 95, 10758, 19);
INSERT INTO `option` VALUES (10778, '鹤峰乡', '鹤峰乡', 100, 10758, 19);
INSERT INTO `option` VALUES (10779, '红土乡', '红土乡', 105, 10758, 19);
INSERT INTO `option` VALUES (10780, '康坪乡', '康坪乡', 110, 10758, 19);
INSERT INTO `option` VALUES (10781, '龙桥乡', '龙桥乡', 115, 10758, 19);
INSERT INTO `option` VALUES (10782, '平安乡', '平安乡', 120, 10758, 19);
INSERT INTO `option` VALUES (10783, '石岗乡', '石岗乡', 125, 10758, 19);
INSERT INTO `option` VALUES (10784, '太和乡', '太和乡', 130, 10758, 19);
INSERT INTO `option` VALUES (10785, '五马乡', '五马乡', 135, 10758, 19);
INSERT INTO `option` VALUES (10786, '新政乡', '新政乡', 140, 10758, 19);
INSERT INTO `option` VALUES (10787, '岩湾乡', '岩湾乡', 145, 10758, 19);
INSERT INTO `option` VALUES (10788, '云雾乡', '云雾乡', 150, 10758, 19);
INSERT INTO `option` VALUES (10789, '长安乡', '长安乡', 155, 10758, 19);
INSERT INTO `option` VALUES (10790, '开县', '开县', 55, 10470, 19);
INSERT INTO `option` VALUES (10791, '白桥镇', '白桥镇', 5, 10790, 19);
INSERT INTO `option` VALUES (10792, '大德镇', '大德镇', 10, 10790, 19);
INSERT INTO `option` VALUES (10793, '金峰镇', '金峰镇', 15, 10790, 19);
INSERT INTO `option` VALUES (10794, '谭家镇', '谭家镇', 20, 10790, 19);
INSERT INTO `option` VALUES (10795, '天和镇', '天和镇', 25, 10790, 19);
INSERT INTO `option` VALUES (10796, '白泉乡', '白泉乡', 30, 10790, 19);
INSERT INTO `option` VALUES (10797, '县城内', '县城内', 35, 10790, 19);
INSERT INTO `option` VALUES (10798, '九龙山镇', '九龙山镇', 40, 10790, 19);
INSERT INTO `option` VALUES (10799, '大进镇', '大进镇', 45, 10790, 19);
INSERT INTO `option` VALUES (10800, '敦好镇', '敦好镇', 50, 10790, 19);
INSERT INTO `option` VALUES (10801, '高桥镇', '高桥镇', 55, 10790, 19);
INSERT INTO `option` VALUES (10802, '郭家镇', '郭家镇', 60, 10790, 19);
INSERT INTO `option` VALUES (10803, '和谦镇', '和谦镇', 65, 10790, 19);
INSERT INTO `option` VALUES (10804, '河堰镇', '河堰镇', 70, 10790, 19);
INSERT INTO `option` VALUES (10805, '厚坝镇', '厚坝镇', 75, 10790, 19);
INSERT INTO `option` VALUES (10806, '临江镇', '临江镇', 80, 10790, 19);
INSERT INTO `option` VALUES (10807, '南门镇', '南门镇', 85, 10790, 19);
INSERT INTO `option` VALUES (10808, '南雅镇', '南雅镇', 90, 10790, 19);
INSERT INTO `option` VALUES (10809, '渠口镇', '渠口镇', 95, 10790, 19);
INSERT INTO `option` VALUES (10810, '铁桥镇', '铁桥镇', 100, 10790, 19);
INSERT INTO `option` VALUES (10811, '岳溪镇', '岳溪镇', 105, 10790, 19);
INSERT INTO `option` VALUES (10812, '温泉镇', '温泉镇', 110, 10790, 19);
INSERT INTO `option` VALUES (10813, '义和镇', '义和镇', 115, 10790, 19);
INSERT INTO `option` VALUES (10814, '长沙镇', '长沙镇', 120, 10790, 19);
INSERT INTO `option` VALUES (10815, '赵家镇', '赵家镇', 125, 10790, 19);
INSERT INTO `option` VALUES (10816, '镇安镇', '镇安镇', 130, 10790, 19);
INSERT INTO `option` VALUES (10817, '中和镇', '中和镇', 135, 10790, 19);
INSERT INTO `option` VALUES (10818, '竹溪镇', '竹溪镇', 140, 10790, 19);
INSERT INTO `option` VALUES (10819, '三汇口乡', '三汇口乡', 145, 10790, 19);
INSERT INTO `option` VALUES (10820, '白桥乡', '白桥乡', 150, 10790, 19);
INSERT INTO `option` VALUES (10821, '大德乡', '大德乡', 155, 10790, 19);
INSERT INTO `option` VALUES (10822, '关面乡', '关面乡', 160, 10790, 19);
INSERT INTO `option` VALUES (10823, '金峰乡', '金峰乡', 165, 10790, 19);
INSERT INTO `option` VALUES (10824, '麻柳乡', '麻柳乡', 170, 10790, 19);
INSERT INTO `option` VALUES (10825, '满月乡', '满月乡', 175, 10790, 19);
INSERT INTO `option` VALUES (10826, '谭家乡', '谭家乡', 180, 10790, 19);
INSERT INTO `option` VALUES (10827, '天和乡', '天和乡', 185, 10790, 19);
INSERT INTO `option` VALUES (10828, '巫山镇', '巫山镇', 190, 10790, 19);
INSERT INTO `option` VALUES (10829, '五通乡', '五通乡', 195, 10790, 19);
INSERT INTO `option` VALUES (10830, '紫水乡', '紫水乡', 200, 10790, 19);
INSERT INTO `option` VALUES (10831, '云阳县', '云阳县', 60, 10470, 19);
INSERT INTO `option` VALUES (10832, '县城内', '县城内', 5, 10831, 19);
INSERT INTO `option` VALUES (10833, '云阳镇', '云阳镇', 10, 10831, 19);
INSERT INTO `option` VALUES (10834, '巴阳镇', '巴阳镇', 15, 10831, 19);
INSERT INTO `option` VALUES (10835, '凤鸣镇', '凤鸣镇', 20, 10831, 19);
INSERT INTO `option` VALUES (10836, '高阳镇', '高阳镇', 25, 10831, 19);
INSERT INTO `option` VALUES (10837, '故陵镇', '故陵镇', 30, 10831, 19);
INSERT INTO `option` VALUES (10838, '红狮镇', '红狮镇', 35, 10831, 19);
INSERT INTO `option` VALUES (10839, '黄石镇', '黄石镇', 40, 10831, 19);
INSERT INTO `option` VALUES (10840, '江口镇', '江口镇', 45, 10831, 19);
INSERT INTO `option` VALUES (10841, '龙角镇', '龙角镇', 50, 10831, 19);
INSERT INTO `option` VALUES (10842, '路阳镇', '路阳镇', 55, 10831, 19);
INSERT INTO `option` VALUES (10843, '南溪镇', '南溪镇', 60, 10831, 19);
INSERT INTO `option` VALUES (10844, '农坝镇', '农坝镇', 65, 10831, 19);
INSERT INTO `option` VALUES (10845, '盘龙镇', '盘龙镇', 70, 10831, 19);
INSERT INTO `option` VALUES (10846, '平安镇', '平安镇', 75, 10831, 19);
INSERT INTO `option` VALUES (10847, '渠马镇', '渠马镇', 80, 10831, 19);
INSERT INTO `option` VALUES (10848, '人和镇', '人和镇', 85, 10831, 19);
INSERT INTO `option` VALUES (10849, '桑坪镇', '桑坪镇', 90, 10831, 19);
INSERT INTO `option` VALUES (10850, '沙市镇', '沙市镇', 95, 10831, 19);
INSERT INTO `option` VALUES (10851, '双土镇', '双土镇', 100, 10831, 19);
INSERT INTO `option` VALUES (10852, '鱼泉镇', '鱼泉镇', 105, 10831, 19);
INSERT INTO `option` VALUES (10853, '云安镇', '云安镇', 110, 10831, 19);
INSERT INTO `option` VALUES (10854, '洞鹿乡', '洞鹿乡', 115, 10831, 19);
INSERT INTO `option` VALUES (10855, '后叶乡', '后叶乡', 120, 10831, 19);
INSERT INTO `option` VALUES (10856, '龙洞乡', '龙洞乡', 125, 10831, 19);
INSERT INTO `option` VALUES (10857, '毛坝乡', '毛坝乡', 130, 10831, 19);
INSERT INTO `option` VALUES (10858, '泥溪乡', '泥溪乡', 135, 10831, 19);
INSERT INTO `option` VALUES (10859, '票草乡', '票草乡', 140, 10831, 19);
INSERT INTO `option` VALUES (10860, '普安乡', '普安乡', 145, 10831, 19);
INSERT INTO `option` VALUES (10861, '栖霞乡', '栖霞乡', 150, 10831, 19);
INSERT INTO `option` VALUES (10862, '清水乡', '清水乡', 155, 10831, 19);
INSERT INTO `option` VALUES (10863, '上坝乡', '上坝乡', 160, 10831, 19);
INSERT INTO `option` VALUES (10864, '石门乡', '石门乡', 165, 10831, 19);
INSERT INTO `option` VALUES (10865, '双龙乡', '双龙乡', 170, 10831, 19);
INSERT INTO `option` VALUES (10866, '水口乡', '水口乡', 175, 10831, 19);
INSERT INTO `option` VALUES (10867, '外郎乡', '外郎乡', 180, 10831, 19);
INSERT INTO `option` VALUES (10868, '新津乡', '新津乡', 185, 10831, 19);
INSERT INTO `option` VALUES (10869, '堰坪乡', '堰坪乡', 190, 10831, 19);
INSERT INTO `option` VALUES (10870, '养鹿乡', '养鹿乡', 195, 10831, 19);
INSERT INTO `option` VALUES (10871, '耀灵乡', '耀灵乡', 200, 10831, 19);
INSERT INTO `option` VALUES (10872, '云硐乡', '云硐乡', 205, 10831, 19);
INSERT INTO `option` VALUES (10873, '忠县', '忠县', 65, 10470, 19);
INSERT INTO `option` VALUES (10874, '县城内', '县城内', 5, 10873, 19);
INSERT INTO `option` VALUES (10875, '忠州镇', '忠州镇', 10, 10873, 19);
INSERT INTO `option` VALUES (10876, '拔山镇', '拔山镇', 15, 10873, 19);
INSERT INTO `option` VALUES (10877, '白石镇', '白石镇', 20, 10873, 19);
INSERT INTO `option` VALUES (10878, '东溪镇', '东溪镇', 25, 10873, 19);
INSERT INTO `option` VALUES (10879, '复兴镇', '复兴镇', 30, 10873, 19);
INSERT INTO `option` VALUES (10880, '官坝镇', '官坝镇', 35, 10873, 19);
INSERT INTO `option` VALUES (10881, '花桥镇', '花桥镇', 40, 10873, 19);
INSERT INTO `option` VALUES (10882, '黄金镇', '黄金镇', 45, 10873, 19);
INSERT INTO `option` VALUES (10883, '金鸡镇', '金鸡镇', 50, 10873, 19);
INSERT INTO `option` VALUES (10884, '马灌镇', '马灌镇', 55, 10873, 19);
INSERT INTO `option` VALUES (10885, '任家镇', '任家镇', 60, 10873, 19);
INSERT INTO `option` VALUES (10886, '汝溪镇', '汝溪镇', 65, 10873, 19);
INSERT INTO `option` VALUES (10887, '三汇镇', '三汇镇', 70, 10873, 19);
INSERT INTO `option` VALUES (10888, '石宝镇', '石宝镇', 75, 10873, 19);
INSERT INTO `option` VALUES (10889, '石黄镇', '石黄镇', 80, 10873, 19);
INSERT INTO `option` VALUES (10890, '双桂镇', '双桂镇', 85, 10873, 19);
INSERT INTO `option` VALUES (10891, '乌杨镇', '乌杨镇', 90, 10873, 19);
INSERT INTO `option` VALUES (10892, '新生镇', '新生镇', 95, 10873, 19);
INSERT INTO `option` VALUES (10893, '洋渡镇', '洋渡镇', 100, 10873, 19);
INSERT INTO `option` VALUES (10894, '野鹤镇', '野鹤镇', 105, 10873, 19);
INSERT INTO `option` VALUES (10895, '永丰镇', '永丰镇', 110, 10873, 19);
INSERT INTO `option` VALUES (10896, '金声乡', '金声乡', 115, 10873, 19);
INSERT INTO `option` VALUES (10897, '磨子乡', '磨子乡', 120, 10873, 19);
INSERT INTO `option` VALUES (10898, '善广乡', '善广乡', 125, 10873, 19);
INSERT INTO `option` VALUES (10899, '石子乡', '石子乡', 130, 10873, 19);
INSERT INTO `option` VALUES (10900, '涂井乡', '涂井乡', 135, 10873, 19);
INSERT INTO `option` VALUES (10901, '兴峰乡', '兴峰乡', 140, 10873, 19);
INSERT INTO `option` VALUES (10902, '新立镇', '新立镇', 145, 10873, 19);
INSERT INTO `option` VALUES (10903, '巫溪县', '巫溪县', 70, 10470, 19);
INSERT INTO `option` VALUES (10904, '县城内', '县城内', 5, 10903, 19);
INSERT INTO `option` VALUES (10905, '城厢镇', '城厢镇', 10, 10903, 19);
INSERT INTO `option` VALUES (10906, '凤凰镇', '凤凰镇', 15, 10903, 19);
INSERT INTO `option` VALUES (10907, '古路镇', '古路镇', 20, 10903, 19);
INSERT INTO `option` VALUES (10908, '尖山镇', '尖山镇', 25, 10903, 19);
INSERT INTO `option` VALUES (10909, '宁厂镇', '宁厂镇', 30, 10903, 19);
INSERT INTO `option` VALUES (10910, '上磺镇', '上磺镇', 35, 10903, 19);
INSERT INTO `option` VALUES (10911, '文峰镇', '文峰镇', 40, 10903, 19);
INSERT INTO `option` VALUES (10912, '下堡镇', '下堡镇', 45, 10903, 19);
INSERT INTO `option` VALUES (10913, '徐家镇', '徐家镇', 50, 10903, 19);
INSERT INTO `option` VALUES (10914, '朝阳洞乡', '朝阳洞乡', 55, 10903, 19);
INSERT INTO `option` VALUES (10915, '大河乡', '大河乡', 60, 10903, 19);
INSERT INTO `option` VALUES (10916, '峰灵乡', '峰灵乡', 65, 10903, 19);
INSERT INTO `option` VALUES (10917, '花台乡', '花台乡', 70, 10903, 19);
INSERT INTO `option` VALUES (10918, '兰英乡', '兰英乡', 75, 10903, 19);
INSERT INTO `option` VALUES (10919, '菱角乡', '菱角乡', 80, 10903, 19);
INSERT INTO `option` VALUES (10920, '蒲莲乡', '蒲莲乡', 85, 10903, 19);
INSERT INTO `option` VALUES (10921, '胜利乡', '胜利乡', 90, 10903, 19);
INSERT INTO `option` VALUES (10922, '双阳乡', '双阳乡', 95, 10903, 19);
INSERT INTO `option` VALUES (10923, '塘坊乡', '塘坊乡', 100, 10903, 19);
INSERT INTO `option` VALUES (10924, '天星乡', '天星乡', 105, 10903, 19);
INSERT INTO `option` VALUES (10925, '天元乡', '天元乡', 110, 10903, 19);
INSERT INTO `option` VALUES (10926, '田坝乡', '田坝乡', 115, 10903, 19);
INSERT INTO `option` VALUES (10927, '通城乡', '通城乡', 120, 10903, 19);
INSERT INTO `option` VALUES (10928, '土城乡', '土城乡', 125, 10903, 19);
INSERT INTO `option` VALUES (10929, '乌龙乡', '乌龙乡', 130, 10903, 19);
INSERT INTO `option` VALUES (10930, '鱼鳞乡', '鱼鳞乡', 135, 10903, 19);
INSERT INTO `option` VALUES (10931, '长桂乡', '长桂乡', 140, 10903, 19);
INSERT INTO `option` VALUES (10932, '中岗乡', '中岗乡', 145, 10903, 19);
INSERT INTO `option` VALUES (10933, '中梁乡', '中梁乡', 150, 10903, 19);
INSERT INTO `option` VALUES (10934, '巫山县', '巫山县', 75, 10470, 19);
INSERT INTO `option` VALUES (10935, '县城内', '县城内', 5, 10934, 19);
INSERT INTO `option` VALUES (10936, '巫峡镇', '巫峡镇', 10, 10934, 19);
INSERT INTO `option` VALUES (10937, '大昌镇', '大昌镇', 15, 10934, 19);
INSERT INTO `option` VALUES (10938, '福田镇', '福田镇', 20, 10934, 19);
INSERT INTO `option` VALUES (10939, '官渡镇', '官渡镇', 25, 10934, 19);
INSERT INTO `option` VALUES (10940, '官阳镇', '官阳镇', 30, 10934, 19);
INSERT INTO `option` VALUES (10941, '龙溪镇', '龙溪镇', 35, 10934, 19);
INSERT INTO `option` VALUES (10942, '骡坪镇', '骡坪镇', 40, 10934, 19);
INSERT INTO `option` VALUES (10943, '庙堂乡', '庙堂乡', 45, 10934, 19);
INSERT INTO `option` VALUES (10944, '庙宇镇', '庙宇镇', 50, 10934, 19);
INSERT INTO `option` VALUES (10945, '双龙镇', '双龙镇', 55, 10934, 19);
INSERT INTO `option` VALUES (10946, '铜鼓镇', '铜鼓镇', 60, 10934, 19);
INSERT INTO `option` VALUES (10947, '抱龙镇', '抱龙镇', 65, 10934, 19);
INSERT INTO `option` VALUES (10948, '大溪乡', '大溪乡', 70, 10934, 19);
INSERT INTO `option` VALUES (10949, '当阳乡', '当阳乡', 75, 10934, 19);
INSERT INTO `option` VALUES (10950, '邓家乡', '邓家乡', 80, 10934, 19);
INSERT INTO `option` VALUES (10951, '笃坪乡', '笃坪乡', 85, 10934, 19);
INSERT INTO `option` VALUES (10952, '红椿乡', '红椿乡', 90, 10934, 19);
INSERT INTO `option` VALUES (10953, '建平乡', '建平乡', 95, 10934, 19);
INSERT INTO `option` VALUES (10954, '金坪乡', '金坪乡', 100, 10934, 19);
INSERT INTO `option` VALUES (10955, '两坪乡', '两坪乡', 105, 10934, 19);
INSERT INTO `option` VALUES (10956, '龙井乡', '龙井乡', 110, 10934, 19);
INSERT INTO `option` VALUES (10957, '培石乡', '培石乡', 115, 10934, 19);
INSERT INTO `option` VALUES (10958, '平河乡', '平河乡', 120, 10934, 19);
INSERT INTO `option` VALUES (10959, '曲尺乡', '曲尺乡', 125, 10934, 19);
INSERT INTO `option` VALUES (10960, '三溪乡', '三溪乡', 130, 10934, 19);
INSERT INTO `option` VALUES (10961, '竹贤乡', '竹贤乡', 135, 10934, 19);
INSERT INTO `option` VALUES (10962, '石柱县', '石柱县', 80, 10470, 19);
INSERT INTO `option` VALUES (10963, '王家乡', '王家乡', 5, 10962, 19);
INSERT INTO `option` VALUES (10964, '洗新乡', '洗新乡', 10, 10962, 19);
INSERT INTO `option` VALUES (10965, '新乐乡', '新乐乡', 15, 10962, 19);
INSERT INTO `option` VALUES (10966, '中益乡', '中益乡', 20, 10962, 19);
INSERT INTO `option` VALUES (10967, '县城内', '县城内', 25, 10962, 19);
INSERT INTO `option` VALUES (10968, '南宾镇', '南宾镇', 30, 10962, 19);
INSERT INTO `option` VALUES (10969, '黄水镇', '黄水镇', 35, 10962, 19);
INSERT INTO `option` VALUES (10970, '临溪镇', '临溪镇', 40, 10962, 19);
INSERT INTO `option` VALUES (10971, '龙沙镇', '龙沙镇', 45, 10962, 19);
INSERT INTO `option` VALUES (10972, '马武镇', '马武镇', 50, 10962, 19);
INSERT INTO `option` VALUES (10973, '沙子镇', '沙子镇', 55, 10962, 19);
INSERT INTO `option` VALUES (10974, '王场镇', '王场镇', 60, 10962, 19);
INSERT INTO `option` VALUES (10975, '西沱镇', '西沱镇', 65, 10962, 19);
INSERT INTO `option` VALUES (10976, '下路镇', '下路镇', 70, 10962, 19);
INSERT INTO `option` VALUES (10977, '沿溪镇', '沿溪镇', 75, 10962, 19);
INSERT INTO `option` VALUES (10978, '渔池镇', '渔池镇', 80, 10962, 19);
INSERT INTO `option` VALUES (10979, '悦崃镇', '悦崃镇', 85, 10962, 19);
INSERT INTO `option` VALUES (10980, '大歇乡', '大歇乡', 90, 10962, 19);
INSERT INTO `option` VALUES (10981, '枫木乡', '枫木乡', 95, 10962, 19);
INSERT INTO `option` VALUES (10982, '河嘴乡', '河嘴乡', 100, 10962, 19);
INSERT INTO `option` VALUES (10983, '黄鹤乡', '黄鹤乡', 105, 10962, 19);
INSERT INTO `option` VALUES (10984, '金铃乡', '金铃乡', 110, 10962, 19);
INSERT INTO `option` VALUES (10985, '金竹乡', '金竹乡', 115, 10962, 19);
INSERT INTO `option` VALUES (10986, '冷水乡', '冷水乡', 120, 10962, 19);
INSERT INTO `option` VALUES (10987, '黎场乡', '黎场乡', 125, 10962, 19);
INSERT INTO `option` VALUES (10988, '六塘乡', '六塘乡', 130, 10962, 19);
INSERT INTO `option` VALUES (10989, '龙潭乡', '龙潭乡', 135, 10962, 19);
INSERT INTO `option` VALUES (10990, '桥头乡', '桥头乡', 140, 10962, 19);
INSERT INTO `option` VALUES (10991, '三河乡', '三河乡', 145, 10962, 19);
INSERT INTO `option` VALUES (10992, '三益乡', '三益乡', 150, 10962, 19);
INSERT INTO `option` VALUES (10993, '石家乡', '石家乡', 155, 10962, 19);
INSERT INTO `option` VALUES (10994, '万朝乡', '万朝乡', 160, 10962, 19);
INSERT INTO `option` VALUES (10995, '彭水县', '彭水县', 85, 10470, 19);
INSERT INTO `option` VALUES (10996, '保家镇', '保家镇', 5, 10995, 19);
INSERT INTO `option` VALUES (10997, '高谷镇', '高谷镇', 10, 10995, 19);
INSERT INTO `option` VALUES (10998, '黄家镇', '黄家镇', 15, 10995, 19);
INSERT INTO `option` VALUES (10999, '连湖镇', '连湖镇', 20, 10995, 19);
INSERT INTO `option` VALUES (11000, '龙射镇', '龙射镇', 25, 10995, 19);
INSERT INTO `option` VALUES (11001, '鹿角镇', '鹿角镇', 30, 10995, 19);
INSERT INTO `option` VALUES (11002, '普子镇', '普子镇', 35, 10995, 19);
INSERT INTO `option` VALUES (11003, '桑柘镇', '桑柘镇', 40, 10995, 19);
INSERT INTO `option` VALUES (11004, '万足镇', '万足镇', 45, 10995, 19);
INSERT INTO `option` VALUES (11005, '郁山镇', '郁山镇', 50, 10995, 19);
INSERT INTO `option` VALUES (11006, '梅子垭乡', '梅子垭乡', 55, 10995, 19);
INSERT INTO `option` VALUES (11007, '鞍子乡', '鞍子乡', 60, 10995, 19);
INSERT INTO `option` VALUES (11008, '大垭乡', '大垭乡', 65, 10995, 19);
INSERT INTO `option` VALUES (11009, '棣棠乡', '棣棠乡', 70, 10995, 19);
INSERT INTO `option` VALUES (11010, '靛水乡', '靛水乡', 75, 10995, 19);
INSERT INTO `option` VALUES (11011, '朗溪乡', '朗溪乡', 80, 10995, 19);
INSERT INTO `option` VALUES (11012, '联合乡', '联合乡', 85, 10995, 19);
INSERT INTO `option` VALUES (11013, '龙塘乡', '龙塘乡', 90, 10995, 19);
INSERT INTO `option` VALUES (11014, '龙溪乡', '龙溪乡', 95, 10995, 19);
INSERT INTO `option` VALUES (11015, '芦塘乡', '芦塘乡', 100, 10995, 19);
INSERT INTO `option` VALUES (11016, '鹿鸣乡', '鹿鸣乡', 105, 10995, 19);
INSERT INTO `option` VALUES (11017, '平安乡', '平安乡', 110, 10995, 19);
INSERT INTO `option` VALUES (11018, '迁乔乡', '迁乔乡', 115, 10995, 19);
INSERT INTO `option` VALUES (11019, '乔梓乡', '乔梓乡', 120, 10995, 19);
INSERT INTO `option` VALUES (11020, '润溪乡', '润溪乡', 125, 10995, 19);
INSERT INTO `option` VALUES (11021, '三义乡', '三义乡', 130, 10995, 19);
INSERT INTO `option` VALUES (11022, '善感乡', '善感乡', 135, 10995, 19);
INSERT INTO `option` VALUES (11023, '县城内', '县城内', 140, 10995, 19);
INSERT INTO `option` VALUES (11024, '石柳乡', '石柳乡', 145, 10995, 19);
INSERT INTO `option` VALUES (11025, '石盘乡', '石盘乡', 150, 10995, 19);
INSERT INTO `option` VALUES (11026, '双龙乡', '双龙乡', 155, 10995, 19);
INSERT INTO `option` VALUES (11027, '太原乡', '太原乡', 160, 10995, 19);
INSERT INTO `option` VALUES (11028, '桐楼乡', '桐楼乡', 165, 10995, 19);
INSERT INTO `option` VALUES (11029, '小厂乡', '小厂乡', 170, 10995, 19);
INSERT INTO `option` VALUES (11030, '新田乡', '新田乡', 175, 10995, 19);
INSERT INTO `option` VALUES (11031, '岩东乡', '岩东乡', 180, 10995, 19);
INSERT INTO `option` VALUES (11032, '长滩乡', '长滩乡', 185, 10995, 19);
INSERT INTO `option` VALUES (11033, '诸佛乡', '诸佛乡', 190, 10995, 19);
INSERT INTO `option` VALUES (11034, '走马乡', '走马乡', 195, 10995, 19);
INSERT INTO `option` VALUES (11035, '垫江县', '垫江县', 90, 10470, 19);
INSERT INTO `option` VALUES (11036, '县城内', '县城内', 5, 11035, 19);
INSERT INTO `option` VALUES (11037, '桂溪镇', '桂溪镇', 10, 11035, 19);
INSERT INTO `option` VALUES (11038, '澄溪镇', '澄溪镇', 15, 11035, 19);
INSERT INTO `option` VALUES (11039, '高安镇', '高安镇', 20, 11035, 19);
INSERT INTO `option` VALUES (11040, '高峰镇', '高峰镇', 25, 11035, 19);
INSERT INTO `option` VALUES (11041, '鹤游镇', '鹤游镇', 30, 11035, 19);
INSERT INTO `option` VALUES (11042, '普顺镇', '普顺镇', 35, 11035, 19);
INSERT INTO `option` VALUES (11043, '沙坪镇', '沙坪镇', 40, 11035, 19);
INSERT INTO `option` VALUES (11044, '太平镇', '太平镇', 45, 11035, 19);
INSERT INTO `option` VALUES (11045, '五洞镇', '五洞镇', 50, 11035, 19);
INSERT INTO `option` VALUES (11046, '新民镇', '新民镇', 55, 11035, 19);
INSERT INTO `option` VALUES (11047, '砚台镇', '砚台镇', 60, 11035, 19);
INSERT INTO `option` VALUES (11048, '永安镇', '永安镇', 65, 11035, 19);
INSERT INTO `option` VALUES (11049, '周嘉镇', '周嘉镇', 70, 11035, 19);
INSERT INTO `option` VALUES (11050, '白家乡', '白家乡', 75, 11035, 19);
INSERT INTO `option` VALUES (11051, '包家乡', '包家乡', 80, 11035, 19);
INSERT INTO `option` VALUES (11052, '曹回乡', '曹回乡', 85, 11035, 19);
INSERT INTO `option` VALUES (11053, '大石乡', '大石乡', 90, 11035, 19);
INSERT INTO `option` VALUES (11054, '杠家乡', '杠家乡', 95, 11035, 19);
INSERT INTO `option` VALUES (11055, '坪山镇', '坪山镇', 100, 11035, 19);
INSERT INTO `option` VALUES (11056, '黄沙乡', '黄沙乡', 105, 11035, 19);
INSERT INTO `option` VALUES (11057, '裴兴乡', '裴兴乡', 110, 11035, 19);
INSERT INTO `option` VALUES (11058, '三溪乡', '三溪乡', 115, 11035, 19);
INSERT INTO `option` VALUES (11059, '沙河乡', '沙河乡', 120, 11035, 19);
INSERT INTO `option` VALUES (11060, '永平乡', '永平乡', 125, 11035, 19);
INSERT INTO `option` VALUES (11061, '长龙乡', '长龙乡', 130, 11035, 19);
INSERT INTO `option` VALUES (11062, '酉阳县', '酉阳县', 95, 10470, 19);
INSERT INTO `option` VALUES (11063, '县城内', '县城内', 5, 11062, 19);
INSERT INTO `option` VALUES (11064, '钟多镇', '钟多镇', 10, 11062, 19);
INSERT INTO `option` VALUES (11065, '苍岭镇', '苍岭镇', 15, 11062, 19);
INSERT INTO `option` VALUES (11066, '车田乡', '车田乡', 20, 11062, 19);
INSERT INTO `option` VALUES (11067, '大溪镇', '大溪镇', 25, 11062, 19);
INSERT INTO `option` VALUES (11068, '丁市镇', '丁市镇', 30, 11062, 19);
INSERT INTO `option` VALUES (11069, '泔溪镇', '泔溪镇', 35, 11062, 19);
INSERT INTO `option` VALUES (11070, '龚滩镇', '龚滩镇', 40, 11062, 19);
INSERT INTO `option` VALUES (11071, '黑水镇', '黑水镇', 45, 11062, 19);
INSERT INTO `option` VALUES (11072, '后溪镇', '后溪镇', 50, 11062, 19);
INSERT INTO `option` VALUES (11073, '李溪镇', '李溪镇', 55, 11062, 19);
INSERT INTO `option` VALUES (11074, '龙潭镇', '龙潭镇', 60, 11062, 19);
INSERT INTO `option` VALUES (11075, '麻旺镇', '麻旺镇', 65, 11062, 19);
INSERT INTO `option` VALUES (11076, '小河镇', '小河镇', 70, 11062, 19);
INSERT INTO `option` VALUES (11077, '兴隆镇', '兴隆镇', 75, 11062, 19);
INSERT INTO `option` VALUES (11078, '酉酬镇', '酉酬镇', 80, 11062, 19);
INSERT INTO `option` VALUES (11079, '南腰界乡', '南腰界乡', 85, 11062, 19);
INSERT INTO `option` VALUES (11080, '后坪坝乡', '后坪坝乡', 90, 11062, 19);
INSERT INTO `option` VALUES (11081, '板溪乡', '板溪乡', 95, 11062, 19);
INSERT INTO `option` VALUES (11082, '官清乡', '官清乡', 100, 11062, 19);
INSERT INTO `option` VALUES (11083, '花田乡', '花田乡', 105, 11062, 19);
INSERT INTO `option` VALUES (11084, '江丰乡', '江丰乡', 110, 11062, 19);
INSERT INTO `option` VALUES (11085, '可大乡', '可大乡', 115, 11062, 19);
INSERT INTO `option` VALUES (11086, '浪坪乡', '浪坪乡', 120, 11062, 19);
INSERT INTO `option` VALUES (11087, '两罾乡', '两罾乡', 125, 11062, 19);
INSERT INTO `option` VALUES (11088, '毛坝乡', '毛坝乡', 130, 11062, 19);
INSERT INTO `option` VALUES (11089, '庙溪乡', '庙溪乡', 135, 11062, 19);
INSERT INTO `option` VALUES (11090, '木叶乡', '木叶乡', 140, 11062, 19);
INSERT INTO `option` VALUES (11091, '楠木乡', '楠木乡', 145, 11062, 19);
INSERT INTO `option` VALUES (11092, '偏柏乡', '偏柏乡', 150, 11062, 19);
INSERT INTO `option` VALUES (11093, '清泉乡', '清泉乡', 155, 11062, 19);
INSERT INTO `option` VALUES (11094, '双泉乡', '双泉乡', 160, 11062, 19);
INSERT INTO `option` VALUES (11095, '天馆乡', '天馆乡', 165, 11062, 19);
INSERT INTO `option` VALUES (11096, '铜鼓乡', '铜鼓乡', 170, 11062, 19);
INSERT INTO `option` VALUES (11097, '涂市乡', '涂市乡', 175, 11062, 19);
INSERT INTO `option` VALUES (11098, '万木乡', '万木乡', 180, 11062, 19);
INSERT INTO `option` VALUES (11099, '五福乡', '五福乡', 185, 11062, 19);
INSERT INTO `option` VALUES (11100, '宜居乡', '宜居乡', 190, 11062, 19);
INSERT INTO `option` VALUES (11101, '腴地乡', '腴地乡', 195, 11062, 19);
INSERT INTO `option` VALUES (11102, '板桥乡', '板桥乡', 200, 11062, 19);
INSERT INTO `option` VALUES (11103, '秀山县', '秀山县', 100, 10470, 19);
INSERT INTO `option` VALUES (11104, '县城内', '县城内', 5, 11103, 19);
INSERT INTO `option` VALUES (11105, '清溪场镇', '清溪场镇', 10, 11103, 19);
INSERT INTO `option` VALUES (11106, '中和镇', '中和镇', 15, 11103, 19);
INSERT INTO `option` VALUES (11107, '隘口镇', '隘口镇', 20, 11103, 19);
INSERT INTO `option` VALUES (11108, '峨溶镇', '峨溶镇', 25, 11103, 19);
INSERT INTO `option` VALUES (11109, '官庄镇', '官庄镇', 30, 11103, 19);
INSERT INTO `option` VALUES (11110, '洪安镇', '洪安镇', 35, 11103, 19);
INSERT INTO `option` VALUES (11111, '兰桥镇', '兰桥镇', 40, 11103, 19);
INSERT INTO `option` VALUES (11112, '龙池镇', '龙池镇', 45, 11103, 19);
INSERT INTO `option` VALUES (11113, '梅江镇', '梅江镇', 50, 11103, 19);
INSERT INTO `option` VALUES (11114, '平凯镇', '平凯镇', 55, 11103, 19);
INSERT INTO `option` VALUES (11115, '溶溪镇', '溶溪镇', 60, 11103, 19);
INSERT INTO `option` VALUES (11116, '石堤镇', '石堤镇', 65, 11103, 19);
INSERT INTO `option` VALUES (11117, '石耶镇', '石耶镇', 70, 11103, 19);
INSERT INTO `option` VALUES (11118, '雅江镇', '雅江镇', 75, 11103, 19);
INSERT INTO `option` VALUES (11119, '巴家乡', '巴家乡', 80, 11103, 19);
INSERT INTO `option` VALUES (11120, '保安乡', '保安乡', 85, 11103, 19);
INSERT INTO `option` VALUES (11121, '岑溪乡', '岑溪乡', 90, 11103, 19);
INSERT INTO `option` VALUES (11122, '大溪乡', '大溪乡', 95, 11103, 19);
INSERT INTO `option` VALUES (11123, '干川乡', '干川乡', 100, 11103, 19);
INSERT INTO `option` VALUES (11124, '膏田乡', '膏田乡', 105, 11103, 19);
INSERT INTO `option` VALUES (11125, '官舟乡', '官舟乡', 110, 11103, 19);
INSERT INTO `option` VALUES (11126, '海洋乡', '海洋乡', 115, 11103, 19);
INSERT INTO `option` VALUES (11127, '里仁乡', '里仁乡', 120, 11103, 19);
INSERT INTO `option` VALUES (11128, '妙泉乡', '妙泉乡', 125, 11103, 19);
INSERT INTO `option` VALUES (11129, '平马乡', '平马乡', 130, 11103, 19);
INSERT INTO `option` VALUES (11130, '宋农乡', '宋农乡', 135, 11103, 19);
INSERT INTO `option` VALUES (11131, '溪口乡', '溪口乡', 140, 11103, 19);
INSERT INTO `option` VALUES (11132, '孝溪乡', '孝溪乡', 145, 11103, 19);
INSERT INTO `option` VALUES (11133, '涌洞乡', '涌洞乡', 150, 11103, 19);
INSERT INTO `option` VALUES (11134, '中平乡', '中平乡', 155, 11103, 19);
INSERT INTO `option` VALUES (11135, '钟灵乡', '钟灵乡', 160, 11103, 19);
INSERT INTO `option` VALUES (11136, '城口县', '城口县', 105, 10470, 19);
INSERT INTO `option` VALUES (11137, '县城内', '县城内', 5, 11136, 19);
INSERT INTO `option` VALUES (11138, '葛城镇', '葛城镇', 10, 11136, 19);
INSERT INTO `option` VALUES (11139, '巴山镇', '巴山镇', 15, 11136, 19);
INSERT INTO `option` VALUES (11140, '高观镇', '高观镇', 20, 11136, 19);
INSERT INTO `option` VALUES (11141, '庙坝镇', '庙坝镇', 25, 11136, 19);
INSERT INTO `option` VALUES (11142, '明通镇', '明通镇', 30, 11136, 19);
INSERT INTO `option` VALUES (11143, '坪坝镇', '坪坝镇', 35, 11136, 19);
INSERT INTO `option` VALUES (11144, '修齐镇', '修齐镇', 40, 11136, 19);
INSERT INTO `option` VALUES (11145, '北屏乡', '北屏乡', 45, 11136, 19);
INSERT INTO `option` VALUES (11146, '东安乡', '东安乡', 50, 11136, 19);
INSERT INTO `option` VALUES (11147, '高楠乡', '高楠乡', 55, 11136, 19);
INSERT INTO `option` VALUES (11148, '高燕乡', '高燕乡', 60, 11136, 19);
INSERT INTO `option` VALUES (11149, '河鱼乡', '河鱼乡', 65, 11136, 19);
INSERT INTO `option` VALUES (11150, '厚坪乡', '厚坪乡', 70, 11136, 19);
INSERT INTO `option` VALUES (11151, '鸡鸣乡', '鸡鸣乡', 75, 11136, 19);
INSERT INTO `option` VALUES (11152, '岚天乡', '岚天乡', 80, 11136, 19);
INSERT INTO `option` VALUES (11153, '蓼子乡', '蓼子乡', 85, 11136, 19);
INSERT INTO `option` VALUES (11154, '龙田乡', '龙田乡', 90, 11136, 19);
INSERT INTO `option` VALUES (11155, '明中乡', '明中乡', 95, 11136, 19);
INSERT INTO `option` VALUES (11156, '双河乡', '双河乡', 100, 11136, 19);
INSERT INTO `option` VALUES (11157, '咸宜乡', '咸宜乡', 105, 11136, 19);
INSERT INTO `option` VALUES (11158, '沿河乡', '沿河乡', 110, 11136, 19);
INSERT INTO `option` VALUES (11159, '治平乡', '治平乡', 115, 11136, 19);
INSERT INTO `option` VALUES (11160, '周溪乡', '周溪乡', 120, 11136, 19);
INSERT INTO `option` VALUES (11161, '左岚乡', '左岚乡', 125, 11136, 19);
INSERT INTO `option` VALUES (11162, '璧山县', '璧山县', 110, 10470, 19);
INSERT INTO `option` VALUES (11163, '县城内', '县城内', 5, 11162, 19);
INSERT INTO `option` VALUES (11164, '青杠镇', '青杠镇', 10, 11162, 19);
INSERT INTO `option` VALUES (11165, '来凤镇', '来凤镇', 15, 11162, 19);
INSERT INTO `option` VALUES (11166, '丁家镇', '丁家镇', 20, 11162, 19);
INSERT INTO `option` VALUES (11167, '大路镇', '大路镇', 25, 11162, 19);
INSERT INTO `option` VALUES (11168, '八塘镇', '八塘镇', 30, 11162, 19);
INSERT INTO `option` VALUES (11169, '七塘镇', '七塘镇', 35, 11162, 19);
INSERT INTO `option` VALUES (11170, '河边镇', '河边镇', 40, 11162, 19);
INSERT INTO `option` VALUES (11171, '福禄镇', '福禄镇', 45, 11162, 19);
INSERT INTO `option` VALUES (11172, '大兴镇', '大兴镇', 50, 11162, 19);
INSERT INTO `option` VALUES (11173, '正兴镇', '正兴镇', 55, 11162, 19);
INSERT INTO `option` VALUES (11174, '广普镇', '广普镇', 60, 11162, 19);
INSERT INTO `option` VALUES (11175, '三合镇', '三合镇', 65, 11162, 19);
INSERT INTO `option` VALUES (11176, '健龙镇', '健龙镇', 70, 11162, 19);
INSERT INTO `option` VALUES (11177, '荣昌县', '荣昌县', 115, 10470, 19);
INSERT INTO `option` VALUES (11178, '县城内', '县城内', 5, 11177, 19);
INSERT INTO `option` VALUES (11179, '广顺镇', '广顺镇', 10, 11177, 19);
INSERT INTO `option` VALUES (11180, '安富镇', '安富镇', 15, 11177, 19);
INSERT INTO `option` VALUES (11181, '峰高镇', '峰高镇', 20, 11177, 19);
INSERT INTO `option` VALUES (11182, '双河镇', '双河镇', 25, 11177, 19);
INSERT INTO `option` VALUES (11183, '直升镇', '直升镇', 30, 11177, 19);
INSERT INTO `option` VALUES (11184, '路孔镇', '路孔镇', 35, 11177, 19);
INSERT INTO `option` VALUES (11185, '清江镇', '清江镇', 40, 11177, 19);
INSERT INTO `option` VALUES (11186, '仁义镇', '仁义镇', 45, 11177, 19);
INSERT INTO `option` VALUES (11187, '河包镇', '河包镇', 50, 11177, 19);
INSERT INTO `option` VALUES (11188, '古昌镇', '古昌镇', 55, 11177, 19);
INSERT INTO `option` VALUES (11189, '吴家镇', '吴家镇', 60, 11177, 19);
INSERT INTO `option` VALUES (11190, '观胜镇', '观胜镇', 65, 11177, 19);
INSERT INTO `option` VALUES (11191, '铜鼓镇', '铜鼓镇', 70, 11177, 19);
INSERT INTO `option` VALUES (11192, '清流镇', '清流镇', 75, 11177, 19);
INSERT INTO `option` VALUES (11193, '盘龙镇', '盘龙镇', 80, 11177, 19);
INSERT INTO `option` VALUES (11194, '远觉镇', '远觉镇', 85, 11177, 19);
INSERT INTO `option` VALUES (11195, '清升镇', '清升镇', 90, 11177, 19);
INSERT INTO `option` VALUES (11196, '荣隆镇', '荣隆镇', 95, 11177, 19);
INSERT INTO `option` VALUES (11197, '龙集镇', '龙集镇', 100, 11177, 19);
INSERT INTO `option` VALUES (11198, '铜梁县', '铜梁县', 120, 10470, 19);
INSERT INTO `option` VALUES (11199, '县城内', '县城内', 5, 11198, 19);
INSERT INTO `option` VALUES (11200, '土桥镇', '土桥镇', 10, 11198, 19);
INSERT INTO `option` VALUES (11201, '二坪镇', '二坪镇', 15, 11198, 19);
INSERT INTO `option` VALUES (11202, '水口镇', '水口镇', 20, 11198, 19);
INSERT INTO `option` VALUES (11203, '安居镇', '安居镇', 25, 11198, 19);
INSERT INTO `option` VALUES (11204, '白羊镇', '白羊镇', 30, 11198, 19);
INSERT INTO `option` VALUES (11205, '平滩镇', '平滩镇', 35, 11198, 19);
INSERT INTO `option` VALUES (11206, '石鱼镇', '石鱼镇', 40, 11198, 19);
INSERT INTO `option` VALUES (11207, '福果镇', '福果镇', 45, 11198, 19);
INSERT INTO `option` VALUES (11208, '维新镇', '维新镇', 50, 11198, 19);
INSERT INTO `option` VALUES (11209, '高楼镇', '高楼镇', 55, 11198, 19);
INSERT INTO `option` VALUES (11210, '大庙镇', '大庙镇', 60, 11198, 19);
INSERT INTO `option` VALUES (11211, '围龙镇', '围龙镇', 65, 11198, 19);
INSERT INTO `option` VALUES (11212, '华兴镇', '华兴镇', 70, 11198, 19);
INSERT INTO `option` VALUES (11213, '永嘉镇', '永嘉镇', 75, 11198, 19);
INSERT INTO `option` VALUES (11214, '安溪镇', '安溪镇', 80, 11198, 19);
INSERT INTO `option` VALUES (11215, '西河镇', '西河镇', 85, 11198, 19);
INSERT INTO `option` VALUES (11216, '太平镇', '太平镇', 90, 11198, 19);
INSERT INTO `option` VALUES (11217, '旧县镇', '旧县镇', 95, 11198, 19);
INSERT INTO `option` VALUES (11218, '虎峰镇', '虎峰镇', 100, 11198, 19);
INSERT INTO `option` VALUES (11219, '少云镇', '少云镇', 105, 11198, 19);
INSERT INTO `option` VALUES (11220, '蒲吕镇', '蒲吕镇', 110, 11198, 19);
INSERT INTO `option` VALUES (11221, '侣俸镇', '侣俸镇', 115, 11198, 19);
INSERT INTO `option` VALUES (11222, '小林乡', '小林乡', 120, 11198, 19);
INSERT INTO `option` VALUES (11223, '双山乡', '双山乡', 125, 11198, 19);
INSERT INTO `option` VALUES (11224, '庆隆乡', '庆隆乡', 130, 11198, 19);
INSERT INTO `option` VALUES (11225, '合川区', '合川区', 125, 10470, 19);
INSERT INTO `option` VALUES (11226, '城区', '城区', 5, 11225, 19);
INSERT INTO `option` VALUES (11227, '草街镇', '草街镇', 10, 11225, 19);
INSERT INTO `option` VALUES (11228, '盐井镇', '盐井镇', 15, 11225, 19);
INSERT INTO `option` VALUES (11229, '云门镇', '云门镇', 20, 11225, 19);
INSERT INTO `option` VALUES (11230, '大石镇', '大石镇', 25, 11225, 19);
INSERT INTO `option` VALUES (11231, '沙鱼镇', '沙鱼镇', 30, 11225, 19);
INSERT INTO `option` VALUES (11232, '官渡镇', '官渡镇', 35, 11225, 19);
INSERT INTO `option` VALUES (11233, '涞滩镇', '涞滩镇', 40, 11225, 19);
INSERT INTO `option` VALUES (11234, '肖家镇', '肖家镇', 45, 11225, 19);
INSERT INTO `option` VALUES (11235, '古楼镇', '古楼镇', 50, 11225, 19);
INSERT INTO `option` VALUES (11236, '三庙镇', '三庙镇', 55, 11225, 19);
INSERT INTO `option` VALUES (11237, '二郎镇', '二郎镇', 60, 11225, 19);
INSERT INTO `option` VALUES (11238, '龙凤镇', '龙凤镇', 65, 11225, 19);
INSERT INTO `option` VALUES (11239, '隆兴镇', '隆兴镇', 70, 11225, 19);
INSERT INTO `option` VALUES (11240, '铜溪镇', '铜溪镇', 75, 11225, 19);
INSERT INTO `option` VALUES (11241, '双凤镇', '双凤镇', 80, 11225, 19);
INSERT INTO `option` VALUES (11242, '狮滩镇', '狮滩镇', 85, 11225, 19);
INSERT INTO `option` VALUES (11243, '清平镇', '清平镇', 90, 11225, 19);
INSERT INTO `option` VALUES (11244, '土场镇', '土场镇', 95, 11225, 19);
INSERT INTO `option` VALUES (11245, '小沔镇', '小沔镇', 100, 11225, 19);
INSERT INTO `option` VALUES (11246, '三汇镇', '三汇镇', 105, 11225, 19);
INSERT INTO `option` VALUES (11247, '香龙镇', '香龙镇', 110, 11225, 19);
INSERT INTO `option` VALUES (11248, '钱塘镇', '钱塘镇', 115, 11225, 19);
INSERT INTO `option` VALUES (11249, '龙市镇', '龙市镇', 120, 11225, 19);
INSERT INTO `option` VALUES (11250, '燕窝镇', '燕窝镇', 125, 11225, 19);
INSERT INTO `option` VALUES (11251, '太和镇', '太和镇', 130, 11225, 19);
INSERT INTO `option` VALUES (11252, '渭沱镇', '渭沱镇', 135, 11225, 19);
INSERT INTO `option` VALUES (11253, '双槐镇', '双槐镇', 140, 11225, 19);
INSERT INTO `option` VALUES (11254, '巴南区', '巴南区', 130, 10470, 19);
INSERT INTO `option` VALUES (11255, '城区', '城区', 5, 11254, 19);
INSERT INTO `option` VALUES (11256, '南泉镇', '南泉镇', 10, 11254, 19);
INSERT INTO `option` VALUES (11257, '一品镇', '一品镇', 15, 11254, 19);
INSERT INTO `option` VALUES (11258, '南彭镇', '南彭镇', 20, 11254, 19);
INSERT INTO `option` VALUES (11259, '惠民镇', '惠民镇', 25, 11254, 19);
INSERT INTO `option` VALUES (11260, '麻柳嘴镇', '麻柳嘴镇', 30, 11254, 19);
INSERT INTO `option` VALUES (11261, '天星寺镇', '天星寺镇', 35, 11254, 19);
INSERT INTO `option` VALUES (11262, '双河口镇', '双河口镇', 40, 11254, 19);
INSERT INTO `option` VALUES (11263, '界石镇', '界石镇', 45, 11254, 19);
INSERT INTO `option` VALUES (11264, '安澜镇', '安澜镇', 50, 11254, 19);
INSERT INTO `option` VALUES (11265, '跳石镇', '跳石镇', 55, 11254, 19);
INSERT INTO `option` VALUES (11266, '木洞镇', '木洞镇', 60, 11254, 19);
INSERT INTO `option` VALUES (11267, '丰盛镇', '丰盛镇', 65, 11254, 19);
INSERT INTO `option` VALUES (11268, '二圣镇', '二圣镇', 70, 11254, 19);
INSERT INTO `option` VALUES (11269, '东泉镇', '东泉镇', 75, 11254, 19);
INSERT INTO `option` VALUES (11270, '姜家镇', '姜家镇', 80, 11254, 19);
INSERT INTO `option` VALUES (11271, '接龙镇', '接龙镇', 85, 11254, 19);
INSERT INTO `option` VALUES (11272, '石滩镇', '石滩镇', 90, 11254, 19);
INSERT INTO `option` VALUES (11273, '石龙镇', '石龙镇', 95, 11254, 19);
INSERT INTO `option` VALUES (11274, '北碚区', '北碚区', 135, 10470, 19);
INSERT INTO `option` VALUES (11275, '城区', '城区', 5, 11274, 19);
INSERT INTO `option` VALUES (11276, '东阳镇', '东阳镇', 10, 11274, 19);
INSERT INTO `option` VALUES (11277, '蔡家岗镇', '蔡家岗镇', 15, 11274, 19);
INSERT INTO `option` VALUES (11278, '童家溪镇', '童家溪镇', 20, 11274, 19);
INSERT INTO `option` VALUES (11279, '施家梁镇', '施家梁镇', 25, 11274, 19);
INSERT INTO `option` VALUES (11280, '金刀峡镇', '金刀峡镇', 30, 11274, 19);
INSERT INTO `option` VALUES (11281, '澄江镇', '澄江镇', 35, 11274, 19);
INSERT INTO `option` VALUES (11282, '水土镇', '水土镇', 40, 11274, 19);
INSERT INTO `option` VALUES (11283, '歇马镇', '歇马镇', 45, 11274, 19);
INSERT INTO `option` VALUES (11284, '天府镇', '天府镇', 50, 11274, 19);
INSERT INTO `option` VALUES (11285, '复兴镇', '复兴镇', 55, 11274, 19);
INSERT INTO `option` VALUES (11286, '静观镇', '静观镇', 60, 11274, 19);
INSERT INTO `option` VALUES (11287, '柳荫镇', '柳荫镇', 65, 11274, 19);
INSERT INTO `option` VALUES (11288, '三圣镇', '三圣镇', 70, 11274, 19);
INSERT INTO `option` VALUES (11289, '江津区', '江津区', 140, 10470, 19);
INSERT INTO `option` VALUES (11290, '城区', '城区', 5, 11289, 19);
INSERT INTO `option` VALUES (11291, '四面山镇', '四面山镇', 10, 11289, 19);
INSERT INTO `option` VALUES (11292, '支坪镇', '支坪镇', 15, 11289, 19);
INSERT INTO `option` VALUES (11293, '白沙镇', '白沙镇', 20, 11289, 19);
INSERT INTO `option` VALUES (11294, '珞璜镇', '珞璜镇', 25, 11289, 19);
INSERT INTO `option` VALUES (11295, '柏林镇', '柏林镇', 30, 11289, 19);
INSERT INTO `option` VALUES (11296, '蔡家镇', '蔡家镇', 35, 11289, 19);
INSERT INTO `option` VALUES (11297, '慈云镇', '慈云镇', 40, 11289, 19);
INSERT INTO `option` VALUES (11298, '杜市镇', '杜市镇', 45, 11289, 19);
INSERT INTO `option` VALUES (11299, '广兴镇', '广兴镇', 50, 11289, 19);
INSERT INTO `option` VALUES (11300, '嘉平镇', '嘉平镇', 55, 11289, 19);
INSERT INTO `option` VALUES (11301, '贾嗣镇', '贾嗣镇', 60, 11289, 19);
INSERT INTO `option` VALUES (11302, '李市镇', '李市镇', 65, 11289, 19);
INSERT INTO `option` VALUES (11303, '龙华镇', '龙华镇', 70, 11289, 19);
INSERT INTO `option` VALUES (11304, '石蟆镇', '石蟆镇', 75, 11289, 19);
INSERT INTO `option` VALUES (11305, '石门镇', '石门镇', 80, 11289, 19);
INSERT INTO `option` VALUES (11306, '塘河镇', '塘河镇', 85, 11289, 19);
INSERT INTO `option` VALUES (11307, '吴滩镇', '吴滩镇', 90, 11289, 19);
INSERT INTO `option` VALUES (11308, '西湖镇', '西湖镇', 95, 11289, 19);
INSERT INTO `option` VALUES (11309, '夏坝镇', '夏坝镇', 100, 11289, 19);
INSERT INTO `option` VALUES (11310, '先锋镇', '先锋镇', 105, 11289, 19);
INSERT INTO `option` VALUES (11311, '永兴镇', '永兴镇', 110, 11289, 19);
INSERT INTO `option` VALUES (11312, '油溪镇', '油溪镇', 115, 11289, 19);
INSERT INTO `option` VALUES (11313, '中山镇', '中山镇', 120, 11289, 19);
INSERT INTO `option` VALUES (11314, '朱杨镇', '朱杨镇', 125, 11289, 19);
INSERT INTO `option` VALUES (11315, '渝北区', '渝北区', 145, 10470, 19);
INSERT INTO `option` VALUES (11316, '城区', '城区', 5, 11315, 19);
INSERT INTO `option` VALUES (11317, '礼嘉镇', '礼嘉镇', 10, 11315, 19);
INSERT INTO `option` VALUES (11318, '两路镇', '两路镇', 15, 11315, 19);
INSERT INTO `option` VALUES (11319, '王家镇', '王家镇', 20, 11315, 19);
INSERT INTO `option` VALUES (11320, '悦来镇', '悦来镇', 25, 11315, 19);
INSERT INTO `option` VALUES (11321, '玉峰山镇', '玉峰山镇', 30, 11315, 19);
INSERT INTO `option` VALUES (11322, '茨竹镇', '茨竹镇', 35, 11315, 19);
INSERT INTO `option` VALUES (11323, '大盛镇', '大盛镇', 40, 11315, 19);
INSERT INTO `option` VALUES (11324, '大塆镇', '大塆镇', 45, 11315, 19);
INSERT INTO `option` VALUES (11325, '古路镇', '古路镇', 50, 11315, 19);
INSERT INTO `option` VALUES (11326, '龙兴镇', '龙兴镇', 55, 11315, 19);
INSERT INTO `option` VALUES (11327, '洛碛镇', '洛碛镇', 60, 11315, 19);
INSERT INTO `option` VALUES (11328, '木耳镇', '木耳镇', 65, 11315, 19);
INSERT INTO `option` VALUES (11329, '石船镇', '石船镇', 70, 11315, 19);
INSERT INTO `option` VALUES (11330, '统景镇', '统景镇', 75, 11315, 19);
INSERT INTO `option` VALUES (11331, '兴隆镇', '兴隆镇', 80, 11315, 19);
INSERT INTO `option` VALUES (11332, '长寿区', '长寿区', 150, 10470, 19);
INSERT INTO `option` VALUES (11333, '城区', '城区', 5, 11332, 19);
INSERT INTO `option` VALUES (11334, '长寿湖镇', '长寿湖镇', 10, 11332, 19);
INSERT INTO `option` VALUES (11335, '邻封镇', '邻封镇', 15, 11332, 19);
INSERT INTO `option` VALUES (11336, '但渡镇', '但渡镇', 20, 11332, 19);
INSERT INTO `option` VALUES (11337, '云集镇', '云集镇', 25, 11332, 19);
INSERT INTO `option` VALUES (11338, '双龙镇', '双龙镇', 30, 11332, 19);
INSERT INTO `option` VALUES (11339, '龙河镇', '龙河镇', 35, 11332, 19);
INSERT INTO `option` VALUES (11340, '石堰镇', '石堰镇', 40, 11332, 19);
INSERT INTO `option` VALUES (11341, '云台镇', '云台镇', 45, 11332, 19);
INSERT INTO `option` VALUES (11342, '海棠镇', '海棠镇', 50, 11332, 19);
INSERT INTO `option` VALUES (11343, '葛兰镇', '葛兰镇', 55, 11332, 19);
INSERT INTO `option` VALUES (11344, '新市镇', '新市镇', 60, 11332, 19);
INSERT INTO `option` VALUES (11345, '八颗镇', '八颗镇', 65, 11332, 19);
INSERT INTO `option` VALUES (11346, '洪湖镇', '洪湖镇', 70, 11332, 19);
INSERT INTO `option` VALUES (11347, '万顺镇', '万顺镇', 75, 11332, 19);
INSERT INTO `option` VALUES (11348, '永川区', '永川区', 155, 10470, 19);
INSERT INTO `option` VALUES (11349, '城区', '城区', 5, 11348, 19);
INSERT INTO `option` VALUES (11350, '双竹镇', '双竹镇', 10, 11348, 19);
INSERT INTO `option` VALUES (11351, '三教镇', '三教镇', 15, 11348, 19);
INSERT INTO `option` VALUES (11352, '大安镇', '大安镇', 20, 11348, 19);
INSERT INTO `option` VALUES (11353, '陈食镇', '陈食镇', 25, 11348, 19);
INSERT INTO `option` VALUES (11354, '板桥镇', '板桥镇', 30, 11348, 19);
INSERT INTO `option` VALUES (11355, '宝峰镇', '宝峰镇', 35, 11348, 19);
INSERT INTO `option` VALUES (11356, '临江镇', '临江镇', 40, 11348, 19);
INSERT INTO `option` VALUES (11357, '红炉镇', '红炉镇', 45, 11348, 19);
INSERT INTO `option` VALUES (11358, '吉安镇', '吉安镇', 50, 11348, 19);
INSERT INTO `option` VALUES (11359, '金龙镇', '金龙镇', 55, 11348, 19);
INSERT INTO `option` VALUES (11360, '来苏镇', '来苏镇', 60, 11348, 19);
INSERT INTO `option` VALUES (11361, '青峰镇', '青峰镇', 65, 11348, 19);
INSERT INTO `option` VALUES (11362, '三教镇', '三教镇', 70, 11348, 19);
INSERT INTO `option` VALUES (11363, '双石镇', '双石镇', 75, 11348, 19);
INSERT INTO `option` VALUES (11364, '松溉镇', '松溉镇', 80, 11348, 19);
INSERT INTO `option` VALUES (11365, '五间镇', '五间镇', 85, 11348, 19);
INSERT INTO `option` VALUES (11366, '仙龙镇', '仙龙镇', 90, 11348, 19);
INSERT INTO `option` VALUES (11367, '永荣镇', '永荣镇', 95, 11348, 19);
INSERT INTO `option` VALUES (11368, '朱沱镇', '朱沱镇', 100, 11348, 19);
INSERT INTO `option` VALUES (11369, '何埂镇', '何埂镇', 105, 11348, 19);
INSERT INTO `option` VALUES (11370, '江北区', '江北区', 160, 10470, 19);
INSERT INTO `option` VALUES (11371, '内环以内', '内环以内', 5, 11370, 19);
INSERT INTO `option` VALUES (11372, '寸滩镇', '寸滩镇', 10, 11370, 19);
INSERT INTO `option` VALUES (11373, '郭家沱镇', '郭家沱镇', 15, 11370, 19);
INSERT INTO `option` VALUES (11374, '铁山坪镇', '铁山坪镇', 20, 11370, 19);
INSERT INTO `option` VALUES (11375, '鱼嘴镇', '鱼嘴镇', 25, 11370, 19);
INSERT INTO `option` VALUES (11376, '复盛镇', '复盛镇', 30, 11370, 19);
INSERT INTO `option` VALUES (11377, '五宝镇', '五宝镇', 35, 11370, 19);
INSERT INTO `option` VALUES (11378, '大石坝镇', '大石坝镇', 40, 11370, 19);
INSERT INTO `option` VALUES (11379, '南岸区', '南岸区', 165, 10470, 19);
INSERT INTO `option` VALUES (11380, '城区', '城区', 5, 11379, 19);
INSERT INTO `option` VALUES (11381, '内环以内', '内环以内', 10, 11379, 19);
INSERT INTO `option` VALUES (11382, '茶园新区', '茶园新区', 15, 11379, 19);
INSERT INTO `option` VALUES (11383, '鸡冠石镇', '鸡冠石镇', 20, 11379, 19);
INSERT INTO `option` VALUES (11384, '长生桥镇', '长生桥镇', 25, 11379, 19);
INSERT INTO `option` VALUES (11385, '峡口镇', '峡口镇', 30, 11379, 19);
INSERT INTO `option` VALUES (11386, '广阳镇', '广阳镇', 35, 11379, 19);
INSERT INTO `option` VALUES (11387, '迎龙镇', '迎龙镇', 40, 11379, 19);
INSERT INTO `option` VALUES (11388, '九龙坡区', '九龙坡区', 170, 10470, 19);
INSERT INTO `option` VALUES (11389, '内环以内', '内环以内', 5, 11388, 19);
INSERT INTO `option` VALUES (11390, '白市驿镇', '白市驿镇', 10, 11388, 19);
INSERT INTO `option` VALUES (11391, '铜罐驿镇', '铜罐驿镇', 15, 11388, 19);
INSERT INTO `option` VALUES (11392, '华岩镇', '华岩镇', 20, 11388, 19);
INSERT INTO `option` VALUES (11393, '巴福镇', '巴福镇', 25, 11388, 19);
INSERT INTO `option` VALUES (11394, '含谷镇', '含谷镇', 30, 11388, 19);
INSERT INTO `option` VALUES (11395, '金凤镇', '金凤镇', 35, 11388, 19);
INSERT INTO `option` VALUES (11396, '石板镇', '石板镇', 40, 11388, 19);
INSERT INTO `option` VALUES (11397, '陶家镇', '陶家镇', 45, 11388, 19);
INSERT INTO `option` VALUES (11398, '西彭镇', '西彭镇', 50, 11388, 19);
INSERT INTO `option` VALUES (11399, '走马镇', '走马镇', 55, 11388, 19);
INSERT INTO `option` VALUES (11400, '沙坪坝区', '沙坪坝区', 175, 10470, 19);
INSERT INTO `option` VALUES (11401, '内环以内', '内环以内', 5, 11400, 19);
INSERT INTO `option` VALUES (11402, '陈家桥镇', '陈家桥镇', 10, 11400, 19);
INSERT INTO `option` VALUES (11403, '歌乐山镇', '歌乐山镇', 15, 11400, 19);
INSERT INTO `option` VALUES (11404, '青木关镇', '青木关镇', 20, 11400, 19);
INSERT INTO `option` VALUES (11405, '回龙坝镇', '回龙坝镇', 25, 11400, 19);
INSERT INTO `option` VALUES (11406, '大学城', '大学城', 30, 11400, 19);
INSERT INTO `option` VALUES (11407, '虎溪镇', '虎溪镇', 35, 11400, 19);
INSERT INTO `option` VALUES (11408, '西永镇', '西永镇', 40, 11400, 19);
INSERT INTO `option` VALUES (11409, '土主镇', '土主镇', 45, 11400, 19);
INSERT INTO `option` VALUES (11410, '井口镇', '井口镇', 50, 11400, 19);
INSERT INTO `option` VALUES (11411, '曾家镇', '曾家镇', 55, 11400, 19);
INSERT INTO `option` VALUES (11412, '凤凰镇', '凤凰镇', 60, 11400, 19);
INSERT INTO `option` VALUES (11413, '中梁镇', '中梁镇', 65, 11400, 19);
INSERT INTO `option` VALUES (11414, '大渡口区', '大渡口区', 180, 10470, 19);
INSERT INTO `option` VALUES (11415, '茄子溪镇', '茄子溪镇', 5, 11414, 19);
INSERT INTO `option` VALUES (11416, '建胜镇', '建胜镇', 10, 11414, 19);
INSERT INTO `option` VALUES (11417, '跳磴镇', '跳磴镇', 15, 11414, 19);
INSERT INTO `option` VALUES (11418, '内环以内', '内环以内', 20, 11414, 19);
INSERT INTO `option` VALUES (11419, '綦江区', '綦江区', 185, 10470, 19);
INSERT INTO `option` VALUES (11420, '城区', '城区', 5, 11419, 19);
INSERT INTO `option` VALUES (11421, '三江镇', '三江镇', 10, 11419, 19);
INSERT INTO `option` VALUES (11422, '安稳镇', '安稳镇', 15, 11419, 19);
INSERT INTO `option` VALUES (11423, '打通镇', '打通镇', 20, 11419, 19);
INSERT INTO `option` VALUES (11424, '丁山镇', '丁山镇', 25, 11419, 19);
INSERT INTO `option` VALUES (11425, '东溪镇', '东溪镇', 30, 11419, 19);
INSERT INTO `option` VALUES (11426, '扶欢镇', '扶欢镇', 35, 11419, 19);
INSERT INTO `option` VALUES (11427, '赶水镇', '赶水镇', 40, 11419, 19);
INSERT INTO `option` VALUES (11428, '郭扶镇', '郭扶镇', 45, 11419, 19);
INSERT INTO `option` VALUES (11429, '横山镇', '横山镇', 50, 11419, 19);
INSERT INTO `option` VALUES (11430, '隆盛镇', '隆盛镇', 55, 11419, 19);
INSERT INTO `option` VALUES (11431, '三角镇', '三角镇', 60, 11419, 19);
INSERT INTO `option` VALUES (11432, '石壕镇', '石壕镇', 65, 11419, 19);
INSERT INTO `option` VALUES (11433, '石角镇', '石角镇', 70, 11419, 19);
INSERT INTO `option` VALUES (11434, '新盛镇', '新盛镇', 75, 11419, 19);
INSERT INTO `option` VALUES (11435, '永城镇', '永城镇', 80, 11419, 19);
INSERT INTO `option` VALUES (11436, '永新镇', '永新镇', 85, 11419, 19);
INSERT INTO `option` VALUES (11437, '中峰镇', '中峰镇', 90, 11419, 19);
INSERT INTO `option` VALUES (11438, '篆塘镇', '篆塘镇', 95, 11419, 19);
INSERT INTO `option` VALUES (11439, '丛林镇', '丛林镇', 100, 11419, 19);
INSERT INTO `option` VALUES (11440, '关坝镇', '关坝镇', 105, 11419, 19);
INSERT INTO `option` VALUES (11441, '黑山镇', '黑山镇', 110, 11419, 19);
INSERT INTO `option` VALUES (11442, '金桥镇', '金桥镇', 115, 11419, 19);
INSERT INTO `option` VALUES (11443, '南桐镇', '南桐镇', 120, 11419, 19);
INSERT INTO `option` VALUES (11444, '青年镇', '青年镇', 125, 11419, 19);
INSERT INTO `option` VALUES (11445, '石林镇', '石林镇', 130, 11419, 19);
INSERT INTO `option` VALUES (11446, '万东镇', '万东镇', 135, 11419, 19);
INSERT INTO `option` VALUES (11447, '渝中区', '渝中区', 190, 10470, 19);
INSERT INTO `option` VALUES (11448, '高新区', '高新区', 195, 10470, 19);
INSERT INTO `option` VALUES (11449, '北部新区', '北部新区', 200, 10470, 19);
INSERT INTO `option` VALUES (11450, '河北省', '河北省', 25, 0, 19);
INSERT INTO `option` VALUES (11451, '石家庄市', '石家庄市', 5, 11450, 19);
INSERT INTO `option` VALUES (11452, '藁城市', '藁城市', 5, 11451, 19);
INSERT INTO `option` VALUES (11453, '鹿泉市', '鹿泉市', 10, 11451, 19);
INSERT INTO `option` VALUES (11454, '正定县', '正定县', 15, 11451, 19);
INSERT INTO `option` VALUES (11455, '新华区', '新华区', 20, 11451, 19);
INSERT INTO `option` VALUES (11456, '桥西区', '桥西区', 25, 11451, 19);
INSERT INTO `option` VALUES (11457, '桥东区', '桥东区', 30, 11451, 19);
INSERT INTO `option` VALUES (11458, '裕华区', '裕华区', 35, 11451, 19);
INSERT INTO `option` VALUES (11459, '长安区', '长安区', 40, 11451, 19);
INSERT INTO `option` VALUES (11460, '辛集市', '辛集市', 45, 11451, 19);
INSERT INTO `option` VALUES (11461, '晋州市', '晋州市', 50, 11451, 19);
INSERT INTO `option` VALUES (11462, '新乐市', '新乐市', 55, 11451, 19);
INSERT INTO `option` VALUES (11463, '平山县', '平山县', 60, 11451, 19);
INSERT INTO `option` VALUES (11464, '井陉矿区', '井陉矿区', 65, 11451, 19);
INSERT INTO `option` VALUES (11465, '井陉县', '井陉县', 70, 11451, 19);
INSERT INTO `option` VALUES (11466, '栾城县', '栾城县', 75, 11451, 19);
INSERT INTO `option` VALUES (11467, '行唐县', '行唐县', 80, 11451, 19);
INSERT INTO `option` VALUES (11468, '灵寿县', '灵寿县', 85, 11451, 19);
INSERT INTO `option` VALUES (11469, '高邑县', '高邑县', 90, 11451, 19);
INSERT INTO `option` VALUES (11470, '赵县', '赵县', 95, 11451, 19);
INSERT INTO `option` VALUES (11471, '赞皇县', '赞皇县', 100, 11451, 19);
INSERT INTO `option` VALUES (11472, '深泽县', '深泽县', 105, 11451, 19);
INSERT INTO `option` VALUES (11473, '无极县', '无极县', 110, 11451, 19);
INSERT INTO `option` VALUES (11474, '元氏县', '元氏县', 115, 11451, 19);
INSERT INTO `option` VALUES (11475, '邯郸市', '邯郸市', 10, 11450, 19);
INSERT INTO `option` VALUES (11476, '丛台区', '丛台区', 5, 11475, 19);
INSERT INTO `option` VALUES (11477, '邯山区', '邯山区', 10, 11475, 19);
INSERT INTO `option` VALUES (11478, '复兴区', '复兴区', 15, 11475, 19);
INSERT INTO `option` VALUES (11479, '武安市', '武安市', 20, 11475, 19);
INSERT INTO `option` VALUES (11480, '临漳县', '临漳县', 25, 11475, 19);
INSERT INTO `option` VALUES (11481, '永年县', '永年县', 30, 11475, 19);
INSERT INTO `option` VALUES (11482, '邯郸县', '邯郸县', 35, 11475, 19);
INSERT INTO `option` VALUES (11483, '峰峰矿区', '峰峰矿区', 40, 11475, 19);
INSERT INTO `option` VALUES (11484, '曲周县', '曲周县', 45, 11475, 19);
INSERT INTO `option` VALUES (11485, '馆陶县', '馆陶县', 50, 11475, 19);
INSERT INTO `option` VALUES (11486, '魏县', '魏县', 55, 11475, 19);
INSERT INTO `option` VALUES (11487, '成安县', '成安县', 60, 11475, 19);
INSERT INTO `option` VALUES (11488, '大名县', '大名县', 65, 11475, 19);
INSERT INTO `option` VALUES (11489, '涉县', '涉县', 70, 11475, 19);
INSERT INTO `option` VALUES (11490, '鸡泽县', '鸡泽县', 75, 11475, 19);
INSERT INTO `option` VALUES (11491, '邱县', '邱县', 80, 11475, 19);
INSERT INTO `option` VALUES (11492, '广平县', '广平县', 85, 11475, 19);
INSERT INTO `option` VALUES (11493, '肥乡县', '肥乡县', 90, 11475, 19);
INSERT INTO `option` VALUES (11494, '磁县', '磁县', 95, 11475, 19);
INSERT INTO `option` VALUES (11495, '邢台市', '邢台市', 15, 11450, 19);
INSERT INTO `option` VALUES (11496, '宁晋县', '宁晋县', 5, 11495, 19);
INSERT INTO `option` VALUES (11497, '威县', '威县', 10, 11495, 19);
INSERT INTO `option` VALUES (11498, '桥西区', '桥西区', 15, 11495, 19);
INSERT INTO `option` VALUES (11499, '桥东区', '桥东区', 20, 11495, 19);
INSERT INTO `option` VALUES (11500, '邢台县', '邢台县', 25, 11495, 19);
INSERT INTO `option` VALUES (11501, '南宫市', '南宫市', 30, 11495, 19);
INSERT INTO `option` VALUES (11502, '沙河市', '沙河市', 35, 11495, 19);
INSERT INTO `option` VALUES (11503, '柏乡县', '柏乡县', 40, 11495, 19);
INSERT INTO `option` VALUES (11504, '任县', '任县', 45, 11495, 19);
INSERT INTO `option` VALUES (11505, '清河县', '清河县', 50, 11495, 19);
INSERT INTO `option` VALUES (11506, '隆尧县', '隆尧县', 55, 11495, 19);
INSERT INTO `option` VALUES (11507, '临城县', '临城县', 60, 11495, 19);
INSERT INTO `option` VALUES (11508, '广宗县', '广宗县', 65, 11495, 19);
INSERT INTO `option` VALUES (11509, '临西县', '临西县', 70, 11495, 19);
INSERT INTO `option` VALUES (11510, '内丘县', '内丘县', 75, 11495, 19);
INSERT INTO `option` VALUES (11511, '平乡县', '平乡县', 80, 11495, 19);
INSERT INTO `option` VALUES (11512, '巨鹿县', '巨鹿县', 85, 11495, 19);
INSERT INTO `option` VALUES (11513, '新河县', '新河县', 90, 11495, 19);
INSERT INTO `option` VALUES (11514, '南和县', '南和县', 95, 11495, 19);
INSERT INTO `option` VALUES (11515, '保定市', '保定市', 20, 11450, 19);
INSERT INTO `option` VALUES (11516, '涿州市', '涿州市', 5, 11515, 19);
INSERT INTO `option` VALUES (11517, '定州市', '定州市', 10, 11515, 19);
INSERT INTO `option` VALUES (11518, '徐水县', '徐水县', 15, 11515, 19);
INSERT INTO `option` VALUES (11519, '高碑店市', '高碑店市', 20, 11515, 19);
INSERT INTO `option` VALUES (11520, '新市区', '新市区', 25, 11515, 19);
INSERT INTO `option` VALUES (11521, '北市区', '北市区', 30, 11515, 19);
INSERT INTO `option` VALUES (11522, '南市区', '南市区', 35, 11515, 19);
INSERT INTO `option` VALUES (11523, '安国市', '安国市', 40, 11515, 19);
INSERT INTO `option` VALUES (11524, '安新县', '安新县', 45, 11515, 19);
INSERT INTO `option` VALUES (11525, '满城县', '满城县', 50, 11515, 19);
INSERT INTO `option` VALUES (11526, '清苑县', '清苑县', 55, 11515, 19);
INSERT INTO `option` VALUES (11527, '涞水县', '涞水县', 60, 11515, 19);
INSERT INTO `option` VALUES (11528, '阜平县', '阜平县', 65, 11515, 19);
INSERT INTO `option` VALUES (11529, '定兴县', '定兴县', 70, 11515, 19);
INSERT INTO `option` VALUES (11530, '唐县', '唐县', 75, 11515, 19);
INSERT INTO `option` VALUES (11531, '高阳县', '高阳县', 80, 11515, 19);
INSERT INTO `option` VALUES (11532, '容城县', '容城县', 85, 11515, 19);
INSERT INTO `option` VALUES (11533, '涞源县', '涞源县', 90, 11515, 19);
INSERT INTO `option` VALUES (11534, '望都县', '望都县', 95, 11515, 19);
INSERT INTO `option` VALUES (11535, '易县', '易县', 100, 11515, 19);
INSERT INTO `option` VALUES (11536, '曲阳县', '曲阳县', 105, 11515, 19);
INSERT INTO `option` VALUES (11537, '蠡县', '蠡县', 110, 11515, 19);
INSERT INTO `option` VALUES (11538, '顺平县', '顺平县', 115, 11515, 19);
INSERT INTO `option` VALUES (11539, '博野县', '博野县', 120, 11515, 19);
INSERT INTO `option` VALUES (11540, '雄县', '雄县', 125, 11515, 19);
INSERT INTO `option` VALUES (11541, '张家口市', '张家口市', 25, 11450, 19);
INSERT INTO `option` VALUES (11542, '怀安县', '怀安县', 5, 11541, 19);
INSERT INTO `option` VALUES (11543, '沽源县', '沽源县', 10, 11541, 19);
INSERT INTO `option` VALUES (11544, '宣化区', '宣化区', 15, 11541, 19);
INSERT INTO `option` VALUES (11545, '宣化县', '宣化县', 20, 11541, 19);
INSERT INTO `option` VALUES (11546, '康保县', '康保县', 25, 11541, 19);
INSERT INTO `option` VALUES (11547, '张北县', '张北县', 30, 11541, 19);
INSERT INTO `option` VALUES (11548, '阳原县', '阳原县', 35, 11541, 19);
INSERT INTO `option` VALUES (11549, '赤城县', '赤城县', 40, 11541, 19);
INSERT INTO `option` VALUES (11550, '崇礼县', '崇礼县', 45, 11541, 19);
INSERT INTO `option` VALUES (11551, '尚义县', '尚义县', 50, 11541, 19);
INSERT INTO `option` VALUES (11552, '蔚县', '蔚县', 55, 11541, 19);
INSERT INTO `option` VALUES (11553, '涿鹿县', '涿鹿县', 60, 11541, 19);
INSERT INTO `option` VALUES (11554, '万全县', '万全县', 65, 11541, 19);
INSERT INTO `option` VALUES (11555, '下花园区', '下花园区', 70, 11541, 19);
INSERT INTO `option` VALUES (11556, '桥西区', '桥西区', 75, 11541, 19);
INSERT INTO `option` VALUES (11557, '桥东区', '桥东区', 80, 11541, 19);
INSERT INTO `option` VALUES (11558, '怀来县', '怀来县', 85, 11541, 19);
INSERT INTO `option` VALUES (11559, '承德市', '承德市', 30, 11450, 19);
INSERT INTO `option` VALUES (11560, '双滦区', '双滦区', 5, 11559, 19);
INSERT INTO `option` VALUES (11561, '鹰手营子矿区', '鹰手营子矿区', 10, 11559, 19);
INSERT INTO `option` VALUES (11562, '隆化县', '隆化县', 15, 11559, 19);
INSERT INTO `option` VALUES (11563, '兴隆县', '兴隆县', 20, 11559, 19);
INSERT INTO `option` VALUES (11564, '平泉县', '平泉县', 25, 11559, 19);
INSERT INTO `option` VALUES (11565, '滦平县', '滦平县', 30, 11559, 19);
INSERT INTO `option` VALUES (11566, '丰宁县', '丰宁县', 35, 11559, 19);
INSERT INTO `option` VALUES (11567, '围场县', '围场县', 40, 11559, 19);
INSERT INTO `option` VALUES (11568, '宽城县', '宽城县', 45, 11559, 19);
INSERT INTO `option` VALUES (11569, '双桥区', '双桥区', 50, 11559, 19);
INSERT INTO `option` VALUES (11570, '承德县', '承德县', 55, 11559, 19);
INSERT INTO `option` VALUES (11571, '秦皇岛市', '秦皇岛市', 35, 11450, 19);
INSERT INTO `option` VALUES (11572, '卢龙县', '卢龙县', 5, 11571, 19);
INSERT INTO `option` VALUES (11573, '青龙县', '青龙县', 10, 11571, 19);
INSERT INTO `option` VALUES (11574, '昌黎县', '昌黎县', 15, 11571, 19);
INSERT INTO `option` VALUES (11575, '北戴河区', '北戴河区', 20, 11571, 19);
INSERT INTO `option` VALUES (11576, '海港区', '海港区', 25, 11571, 19);
INSERT INTO `option` VALUES (11577, '山海关区', '山海关区', 30, 11571, 19);
INSERT INTO `option` VALUES (11578, '抚宁县', '抚宁县', 35, 11571, 19);
INSERT INTO `option` VALUES (11579, '唐山市', '唐山市', 40, 11450, 19);
INSERT INTO `option` VALUES (11580, '路北区', '路北区', 5, 11579, 19);
INSERT INTO `option` VALUES (11581, '路南区', '路南区', 10, 11579, 19);
INSERT INTO `option` VALUES (11582, '迁安市', '迁安市', 15, 11579, 19);
INSERT INTO `option` VALUES (11583, '丰润区', '丰润区', 20, 11579, 19);
INSERT INTO `option` VALUES (11584, '古冶区', '古冶区', 25, 11579, 19);
INSERT INTO `option` VALUES (11585, '开平区', '开平区', 30, 11579, 19);
INSERT INTO `option` VALUES (11586, '遵化市', '遵化市', 35, 11579, 19);
INSERT INTO `option` VALUES (11587, '丰南区', '丰南区', 40, 11579, 19);
INSERT INTO `option` VALUES (11588, '迁西县', '迁西县', 45, 11579, 19);
INSERT INTO `option` VALUES (11589, '滦南县', '滦南县', 50, 11579, 19);
INSERT INTO `option` VALUES (11590, '玉田县', '玉田县', 55, 11579, 19);
INSERT INTO `option` VALUES (11591, '曹妃甸区', '曹妃甸区', 60, 11579, 19);
INSERT INTO `option` VALUES (11592, '乐亭县', '乐亭县', 65, 11579, 19);
INSERT INTO `option` VALUES (11593, '滦县', '滦县', 70, 11579, 19);
INSERT INTO `option` VALUES (11594, '沧州市', '沧州市', 45, 11450, 19);
INSERT INTO `option` VALUES (11595, '沧县', '沧县', 5, 11594, 19);
INSERT INTO `option` VALUES (11596, '泊头市', '泊头市', 10, 11594, 19);
INSERT INTO `option` VALUES (11597, '河间市', '河间市', 15, 11594, 19);
INSERT INTO `option` VALUES (11598, '献县', '献县', 20, 11594, 19);
INSERT INTO `option` VALUES (11599, '肃宁县', '肃宁县', 25, 11594, 19);
INSERT INTO `option` VALUES (11600, '青县', '青县', 30, 11594, 19);
INSERT INTO `option` VALUES (11601, '东光县', '东光县', 35, 11594, 19);
INSERT INTO `option` VALUES (11602, '吴桥县', '吴桥县', 40, 11594, 19);
INSERT INTO `option` VALUES (11603, '南皮县', '南皮县', 45, 11594, 19);
INSERT INTO `option` VALUES (11604, '盐山县', '盐山县', 50, 11594, 19);
INSERT INTO `option` VALUES (11605, '海兴县', '海兴县', 55, 11594, 19);
INSERT INTO `option` VALUES (11606, '孟村县', '孟村县', 60, 11594, 19);
INSERT INTO `option` VALUES (11607, '运河区', '运河区', 65, 11594, 19);
INSERT INTO `option` VALUES (11608, '新华区', '新华区', 70, 11594, 19);
INSERT INTO `option` VALUES (11609, '任丘市', '任丘市', 75, 11594, 19);
INSERT INTO `option` VALUES (11610, '黄骅市', '黄骅市', 80, 11594, 19);
INSERT INTO `option` VALUES (11611, '廊坊市', '廊坊市', 50, 11450, 19);
INSERT INTO `option` VALUES (11612, '三河市', '三河市', 5, 11611, 19);
INSERT INTO `option` VALUES (11613, '广阳区', '广阳区', 10, 11611, 19);
INSERT INTO `option` VALUES (11614, '开发区', '开发区', 15, 11611, 19);
INSERT INTO `option` VALUES (11615, '固安县', '固安县', 20, 11611, 19);
INSERT INTO `option` VALUES (11616, '安次区', '安次区', 25, 11611, 19);
INSERT INTO `option` VALUES (11617, '永清县', '永清县', 30, 11611, 19);
INSERT INTO `option` VALUES (11618, '香河县', '香河县', 35, 11611, 19);
INSERT INTO `option` VALUES (11619, '大城县', '大城县', 40, 11611, 19);
INSERT INTO `option` VALUES (11620, '文安县', '文安县', 45, 11611, 19);
INSERT INTO `option` VALUES (11621, '大厂县', '大厂县', 50, 11611, 19);
INSERT INTO `option` VALUES (11622, '霸州市', '霸州市', 55, 11611, 19);
INSERT INTO `option` VALUES (11623, '衡水市', '衡水市', 55, 11450, 19);
INSERT INTO `option` VALUES (11624, '冀州市', '冀州市', 5, 11623, 19);
INSERT INTO `option` VALUES (11625, '深州市', '深州市', 10, 11623, 19);
INSERT INTO `option` VALUES (11626, '饶阳县', '饶阳县', 15, 11623, 19);
INSERT INTO `option` VALUES (11627, '枣强县', '枣强县', 20, 11623, 19);
INSERT INTO `option` VALUES (11628, '桃城区', '桃城区', 25, 11623, 19);
INSERT INTO `option` VALUES (11629, '故城县', '故城县', 30, 11623, 19);
INSERT INTO `option` VALUES (11630, '阜城县', '阜城县', 35, 11623, 19);
INSERT INTO `option` VALUES (11631, '安平县', '安平县', 40, 11623, 19);
INSERT INTO `option` VALUES (11632, '武邑县', '武邑县', 45, 11623, 19);
INSERT INTO `option` VALUES (11633, '景县', '景县', 50, 11623, 19);
INSERT INTO `option` VALUES (11634, '武强县', '武强县', 55, 11623, 19);
INSERT INTO `option` VALUES (11635, '山西省', '山西省', 30, 0, 19);
INSERT INTO `option` VALUES (11636, '太原市', '太原市', 5, 11635, 19);
INSERT INTO `option` VALUES (11637, '小店区', '小店区', 5, 11636, 19);
INSERT INTO `option` VALUES (11638, '迎泽区', '迎泽区', 10, 11636, 19);
INSERT INTO `option` VALUES (11639, '晋源区', '晋源区', 15, 11636, 19);
INSERT INTO `option` VALUES (11640, '万柏林区', '万柏林区', 20, 11636, 19);
INSERT INTO `option` VALUES (11641, '尖草坪区', '尖草坪区', 25, 11636, 19);
INSERT INTO `option` VALUES (11642, '杏花岭区', '杏花岭区', 30, 11636, 19);
INSERT INTO `option` VALUES (11643, '古交市', '古交市', 35, 11636, 19);
INSERT INTO `option` VALUES (11644, '阳曲县', '阳曲县', 40, 11636, 19);
INSERT INTO `option` VALUES (11645, '娄烦县', '娄烦县', 45, 11636, 19);
INSERT INTO `option` VALUES (11646, '清徐县', '清徐县', 50, 11636, 19);
INSERT INTO `option` VALUES (11647, '大同市', '大同市', 10, 11635, 19);
INSERT INTO `option` VALUES (11648, '大同县', '大同县', 5, 11647, 19);
INSERT INTO `option` VALUES (11649, '天镇县', '天镇县', 10, 11647, 19);
INSERT INTO `option` VALUES (11650, '灵丘县', '灵丘县', 15, 11647, 19);
INSERT INTO `option` VALUES (11651, '阳高县', '阳高县', 20, 11647, 19);
INSERT INTO `option` VALUES (11652, '左云县', '左云县', 25, 11647, 19);
INSERT INTO `option` VALUES (11653, '浑源县', '浑源县', 30, 11647, 19);
INSERT INTO `option` VALUES (11654, '广灵县', '广灵县', 35, 11647, 19);
INSERT INTO `option` VALUES (11655, '城区', '城区', 40, 11647, 19);
INSERT INTO `option` VALUES (11656, '新荣区', '新荣区', 45, 11647, 19);
INSERT INTO `option` VALUES (11657, '南郊区', '南郊区', 50, 11647, 19);
INSERT INTO `option` VALUES (11658, '矿区', '矿区', 55, 11647, 19);
INSERT INTO `option` VALUES (11659, '阳泉市', '阳泉市', 15, 11635, 19);
INSERT INTO `option` VALUES (11660, '盂县', '盂县', 5, 11659, 19);
INSERT INTO `option` VALUES (11661, '平定县', '平定县', 10, 11659, 19);
INSERT INTO `option` VALUES (11662, '郊区', '郊区', 15, 11659, 19);
INSERT INTO `option` VALUES (11663, '城区', '城区', 20, 11659, 19);
INSERT INTO `option` VALUES (11664, '矿区', '矿区', 25, 11659, 19);
INSERT INTO `option` VALUES (11665, '晋城市', '晋城市', 20, 11635, 19);
INSERT INTO `option` VALUES (11666, '城区', '城区', 5, 11665, 19);
INSERT INTO `option` VALUES (11667, '高平市', '高平市', 10, 11665, 19);
INSERT INTO `option` VALUES (11668, '阳城县', '阳城县', 15, 11665, 19);
INSERT INTO `option` VALUES (11669, '沁水县', '沁水县', 20, 11665, 19);
INSERT INTO `option` VALUES (11670, '陵川县', '陵川县', 25, 11665, 19);
INSERT INTO `option` VALUES (11671, '泽州县', '泽州县', 30, 11665, 19);
INSERT INTO `option` VALUES (11672, '朔州市', '朔州市', 25, 11635, 19);
INSERT INTO `option` VALUES (11673, '平鲁区', '平鲁区', 5, 11672, 19);
INSERT INTO `option` VALUES (11674, '山阴县', '山阴县', 10, 11672, 19);
INSERT INTO `option` VALUES (11675, '右玉县', '右玉县', 15, 11672, 19);
INSERT INTO `option` VALUES (11676, '应县', '应县', 20, 11672, 19);
INSERT INTO `option` VALUES (11677, '怀仁县', '怀仁县', 25, 11672, 19);
INSERT INTO `option` VALUES (11678, '朔城区', '朔城区', 30, 11672, 19);
INSERT INTO `option` VALUES (11679, '晋中市', '晋中市', 30, 11635, 19);
INSERT INTO `option` VALUES (11680, '介休市', '介休市', 5, 11679, 19);
INSERT INTO `option` VALUES (11681, '昔阳县', '昔阳县', 10, 11679, 19);
INSERT INTO `option` VALUES (11682, '祁县', '祁县', 15, 11679, 19);
INSERT INTO `option` VALUES (11683, '左权县', '左权县', 20, 11679, 19);
INSERT INTO `option` VALUES (11684, '寿阳县', '寿阳县', 25, 11679, 19);
INSERT INTO `option` VALUES (11685, '太谷县', '太谷县', 30, 11679, 19);
INSERT INTO `option` VALUES (11686, '和顺县', '和顺县', 35, 11679, 19);
INSERT INTO `option` VALUES (11687, '灵石县', '灵石县', 40, 11679, 19);
INSERT INTO `option` VALUES (11688, '平遥县', '平遥县', 45, 11679, 19);
INSERT INTO `option` VALUES (11689, '榆社县', '榆社县', 50, 11679, 19);
INSERT INTO `option` VALUES (11690, '榆次区', '榆次区', 55, 11679, 19);
INSERT INTO `option` VALUES (11691, '忻州市', '忻州市', 35, 11635, 19);
INSERT INTO `option` VALUES (11692, '原平市', '原平市', 5, 11691, 19);
INSERT INTO `option` VALUES (11693, '代县', '代县', 10, 11691, 19);
INSERT INTO `option` VALUES (11694, '神池县', '神池县', 15, 11691, 19);
INSERT INTO `option` VALUES (11695, '五寨县', '五寨县', 20, 11691, 19);
INSERT INTO `option` VALUES (11696, '五台县', '五台县', 25, 11691, 19);
INSERT INTO `option` VALUES (11697, '偏关县', '偏关县', 30, 11691, 19);
INSERT INTO `option` VALUES (11698, '宁武县', '宁武县', 35, 11691, 19);
INSERT INTO `option` VALUES (11699, '静乐县', '静乐县', 40, 11691, 19);
INSERT INTO `option` VALUES (11700, '繁峙县', '繁峙县', 45, 11691, 19);
INSERT INTO `option` VALUES (11701, '河曲县', '河曲县', 50, 11691, 19);
INSERT INTO `option` VALUES (11702, '保德县', '保德县', 55, 11691, 19);
INSERT INTO `option` VALUES (11703, '定襄县', '定襄县', 60, 11691, 19);
INSERT INTO `option` VALUES (11704, '忻府区', '忻府区', 65, 11691, 19);
INSERT INTO `option` VALUES (11705, '岢岚县', '岢岚县', 70, 11691, 19);
INSERT INTO `option` VALUES (11706, '吕梁市', '吕梁市', 40, 11635, 19);
INSERT INTO `option` VALUES (11707, '离石区', '离石区', 5, 11706, 19);
INSERT INTO `option` VALUES (11708, '孝义市', '孝义市', 10, 11706, 19);
INSERT INTO `option` VALUES (11709, '汾阳市', '汾阳市', 15, 11706, 19);
INSERT INTO `option` VALUES (11710, '文水县', '文水县', 20, 11706, 19);
INSERT INTO `option` VALUES (11711, '中阳县', '中阳县', 25, 11706, 19);
INSERT INTO `option` VALUES (11712, '兴县', '兴县', 30, 11706, 19);
INSERT INTO `option` VALUES (11713, '临县', '临县', 35, 11706, 19);
INSERT INTO `option` VALUES (11714, '方山县', '方山县', 40, 11706, 19);
INSERT INTO `option` VALUES (11715, '柳林县', '柳林县', 45, 11706, 19);
INSERT INTO `option` VALUES (11716, '岚县', '岚县', 50, 11706, 19);
INSERT INTO `option` VALUES (11717, '交口县', '交口县', 55, 11706, 19);
INSERT INTO `option` VALUES (11718, '交城县', '交城县', 60, 11706, 19);
INSERT INTO `option` VALUES (11719, '石楼县', '石楼县', 65, 11706, 19);
INSERT INTO `option` VALUES (11720, '临汾市', '临汾市', 45, 11635, 19);
INSERT INTO `option` VALUES (11721, '曲沃县', '曲沃县', 5, 11720, 19);
INSERT INTO `option` VALUES (11722, '侯马市', '侯马市', 10, 11720, 19);
INSERT INTO `option` VALUES (11723, '霍州市', '霍州市', 15, 11720, 19);
INSERT INTO `option` VALUES (11724, '汾西县', '汾西县', 20, 11720, 19);
INSERT INTO `option` VALUES (11725, '吉县', '吉县', 25, 11720, 19);
INSERT INTO `option` VALUES (11726, '安泽县', '安泽县', 30, 11720, 19);
INSERT INTO `option` VALUES (11727, '浮山县', '浮山县', 35, 11720, 19);
INSERT INTO `option` VALUES (11728, '大宁县', '大宁县', 40, 11720, 19);
INSERT INTO `option` VALUES (11729, '古县', '古县', 45, 11720, 19);
INSERT INTO `option` VALUES (11730, '隰县', '隰县', 50, 11720, 19);
INSERT INTO `option` VALUES (11731, '襄汾县', '襄汾县', 55, 11720, 19);
INSERT INTO `option` VALUES (11732, '翼城县', '翼城县', 60, 11720, 19);
INSERT INTO `option` VALUES (11733, '永和县', '永和县', 65, 11720, 19);
INSERT INTO `option` VALUES (11734, '乡宁县', '乡宁县', 70, 11720, 19);
INSERT INTO `option` VALUES (11735, '洪洞县', '洪洞县', 75, 11720, 19);
INSERT INTO `option` VALUES (11736, '蒲县', '蒲县', 80, 11720, 19);
INSERT INTO `option` VALUES (11737, '尧都区', '尧都区', 85, 11720, 19);
INSERT INTO `option` VALUES (11738, '运城市', '运城市', 50, 11635, 19);
INSERT INTO `option` VALUES (11739, '盐湖区', '盐湖区', 5, 11738, 19);
INSERT INTO `option` VALUES (11740, '河津市', '河津市', 10, 11738, 19);
INSERT INTO `option` VALUES (11741, '永济市', '永济市', 15, 11738, 19);
INSERT INTO `option` VALUES (11742, '新绛县', '新绛县', 20, 11738, 19);
INSERT INTO `option` VALUES (11743, '平陆县', '平陆县', 25, 11738, 19);
INSERT INTO `option` VALUES (11744, '垣曲县', '垣曲县', 30, 11738, 19);
INSERT INTO `option` VALUES (11745, '绛县', '绛县', 35, 11738, 19);
INSERT INTO `option` VALUES (11746, '稷山县', '稷山县', 40, 11738, 19);
INSERT INTO `option` VALUES (11747, '芮城县', '芮城县', 45, 11738, 19);
INSERT INTO `option` VALUES (11748, '夏县', '夏县', 50, 11738, 19);
INSERT INTO `option` VALUES (11749, '临猗县', '临猗县', 55, 11738, 19);
INSERT INTO `option` VALUES (11750, '万荣县', '万荣县', 60, 11738, 19);
INSERT INTO `option` VALUES (11751, '闻喜县', '闻喜县', 65, 11738, 19);
INSERT INTO `option` VALUES (11752, '长治市', '长治市', 55, 11635, 19);
INSERT INTO `option` VALUES (11753, '长治县', '长治县', 5, 11752, 19);
INSERT INTO `option` VALUES (11754, '潞城市', '潞城市', 10, 11752, 19);
INSERT INTO `option` VALUES (11755, '郊区', '郊区', 15, 11752, 19);
INSERT INTO `option` VALUES (11756, '襄垣县', '襄垣县', 20, 11752, 19);
INSERT INTO `option` VALUES (11757, '屯留县', '屯留县', 25, 11752, 19);
INSERT INTO `option` VALUES (11758, '平顺县', '平顺县', 30, 11752, 19);
INSERT INTO `option` VALUES (11759, '黎城县', '黎城县', 35, 11752, 19);
INSERT INTO `option` VALUES (11760, '壶关县', '壶关县', 40, 11752, 19);
INSERT INTO `option` VALUES (11761, '长子县', '长子县', 45, 11752, 19);
INSERT INTO `option` VALUES (11762, '武乡县', '武乡县', 50, 11752, 19);
INSERT INTO `option` VALUES (11763, '沁县', '沁县', 55, 11752, 19);
INSERT INTO `option` VALUES (11764, '沁源县', '沁源县', 60, 11752, 19);
INSERT INTO `option` VALUES (11765, '城区', '城区', 65, 11752, 19);
INSERT INTO `option` VALUES (11766, '河南省', '河南省', 35, 0, 19);
INSERT INTO `option` VALUES (11767, '郑州市', '郑州市', 5, 11766, 19);
INSERT INTO `option` VALUES (11768, '二七区', '二七区', 5, 11767, 19);
INSERT INTO `option` VALUES (11769, '中原区', '中原区', 10, 11767, 19);
INSERT INTO `option` VALUES (11770, '郑东新区', '郑东新区', 15, 11767, 19);
INSERT INTO `option` VALUES (11771, '管城区', '管城区', 20, 11767, 19);
INSERT INTO `option` VALUES (11772, '金水区', '金水区', 25, 11767, 19);
INSERT INTO `option` VALUES (11773, '经济开发区', '经济开发区', 30, 11767, 19);
INSERT INTO `option` VALUES (11774, '高新技术开发区', '高新技术开发区', 35, 11767, 19);
INSERT INTO `option` VALUES (11775, '新郑市', '新郑市', 40, 11767, 19);
INSERT INTO `option` VALUES (11776, '巩义市', '巩义市', 45, 11767, 19);
INSERT INTO `option` VALUES (11777, '荥阳市', '荥阳市', 50, 11767, 19);
INSERT INTO `option` VALUES (11778, '中牟县', '中牟县', 55, 11767, 19);
INSERT INTO `option` VALUES (11779, '新密市', '新密市', 60, 11767, 19);
INSERT INTO `option` VALUES (11780, '登封市', '登封市', 65, 11767, 19);
INSERT INTO `option` VALUES (11781, '惠济区', '惠济区', 70, 11767, 19);
INSERT INTO `option` VALUES (11782, '上街区', '上街区', 75, 11767, 19);
INSERT INTO `option` VALUES (11783, '开封市', '开封市', 10, 11766, 19);
INSERT INTO `option` VALUES (11784, '金明区', '金明区', 5, 11783, 19);
INSERT INTO `option` VALUES (11785, '龙亭区', '龙亭区', 10, 11783, 19);
INSERT INTO `option` VALUES (11786, '顺河区', '顺河区', 15, 11783, 19);
INSERT INTO `option` VALUES (11787, '鼓楼区', '鼓楼区', 20, 11783, 19);
INSERT INTO `option` VALUES (11788, '禹王台区', '禹王台区', 25, 11783, 19);
INSERT INTO `option` VALUES (11789, '通许县', '通许县', 30, 11783, 19);
INSERT INTO `option` VALUES (11790, '开封县', '开封县', 35, 11783, 19);
INSERT INTO `option` VALUES (11791, '杞县', '杞县', 40, 11783, 19);
INSERT INTO `option` VALUES (11792, '兰考县', '兰考县', 45, 11783, 19);
INSERT INTO `option` VALUES (11793, '尉氏县', '尉氏县', 50, 11783, 19);
INSERT INTO `option` VALUES (11794, '洛阳市', '洛阳市', 15, 11766, 19);
INSERT INTO `option` VALUES (11795, '涧西区', '涧西区', 5, 11794, 19);
INSERT INTO `option` VALUES (11796, '西工区', '西工区', 10, 11794, 19);
INSERT INTO `option` VALUES (11797, '洛龙区', '洛龙区', 15, 11794, 19);
INSERT INTO `option` VALUES (11798, '嵩县', '嵩县', 20, 11794, 19);
INSERT INTO `option` VALUES (11799, '偃师市', '偃师市', 25, 11794, 19);
INSERT INTO `option` VALUES (11800, '孟津县', '孟津县', 30, 11794, 19);
INSERT INTO `option` VALUES (11801, '汝阳县', '汝阳县', 35, 11794, 19);
INSERT INTO `option` VALUES (11802, '伊川县', '伊川县', 40, 11794, 19);
INSERT INTO `option` VALUES (11803, '洛宁县', '洛宁县', 45, 11794, 19);
INSERT INTO `option` VALUES (11804, '宜阳县', '宜阳县', 50, 11794, 19);
INSERT INTO `option` VALUES (11805, '栾川县', '栾川县', 55, 11794, 19);
INSERT INTO `option` VALUES (11806, '新安县', '新安县', 60, 11794, 19);
INSERT INTO `option` VALUES (11807, '伊滨区', '伊滨区', 65, 11794, 19);
INSERT INTO `option` VALUES (11808, '吉利区', '吉利区', 70, 11794, 19);
INSERT INTO `option` VALUES (11809, '瀍河区', '瀍河区', 75, 11794, 19);
INSERT INTO `option` VALUES (11810, '老城区', '老城区', 80, 11794, 19);
INSERT INTO `option` VALUES (11811, '平顶山市', '平顶山市', 20, 11766, 19);
INSERT INTO `option` VALUES (11812, '湛河区', '湛河区', 5, 11811, 19);
INSERT INTO `option` VALUES (11813, '卫东区', '卫东区', 10, 11811, 19);
INSERT INTO `option` VALUES (11814, '新华区', '新华区', 15, 11811, 19);
INSERT INTO `option` VALUES (11815, '汝州市', '汝州市', 20, 11811, 19);
INSERT INTO `option` VALUES (11816, '舞钢市', '舞钢市', 25, 11811, 19);
INSERT INTO `option` VALUES (11817, '郏县', '郏县', 30, 11811, 19);
INSERT INTO `option` VALUES (11818, '叶县', '叶县', 35, 11811, 19);
INSERT INTO `option` VALUES (11819, '鲁山县', '鲁山县', 40, 11811, 19);
INSERT INTO `option` VALUES (11820, '宝丰县', '宝丰县', 45, 11811, 19);
INSERT INTO `option` VALUES (11821, '石龙区', '石龙区', 50, 11811, 19);
INSERT INTO `option` VALUES (11822, '焦作市', '焦作市', 25, 11766, 19);
INSERT INTO `option` VALUES (11823, '沁阳市', '沁阳市', 5, 11822, 19);
INSERT INTO `option` VALUES (11824, '孟州市', '孟州市', 10, 11822, 19);
INSERT INTO `option` VALUES (11825, '修武县', '修武县', 15, 11822, 19);
INSERT INTO `option` VALUES (11826, '温县', '温县', 20, 11822, 19);
INSERT INTO `option` VALUES (11827, '武陟县', '武陟县', 25, 11822, 19);
INSERT INTO `option` VALUES (11828, '博爱县', '博爱县', 30, 11822, 19);
INSERT INTO `option` VALUES (11829, '山阳区', '山阳区', 35, 11822, 19);
INSERT INTO `option` VALUES (11830, '解放区', '解放区', 40, 11822, 19);
INSERT INTO `option` VALUES (11831, '马村区', '马村区', 45, 11822, 19);
INSERT INTO `option` VALUES (11832, '中站区', '中站区', 50, 11822, 19);
INSERT INTO `option` VALUES (11833, '鹤壁市', '鹤壁市', 30, 11766, 19);
INSERT INTO `option` VALUES (11834, '淇滨区', '淇滨区', 5, 11833, 19);
INSERT INTO `option` VALUES (11835, '浚县', '浚县', 10, 11833, 19);
INSERT INTO `option` VALUES (11836, '淇县', '淇县', 15, 11833, 19);
INSERT INTO `option` VALUES (11837, '鹤山区', '鹤山区', 20, 11833, 19);
INSERT INTO `option` VALUES (11838, '山城区', '山城区', 25, 11833, 19);
INSERT INTO `option` VALUES (11839, '新乡市', '新乡市', 35, 11766, 19);
INSERT INTO `option` VALUES (11840, '牧野区', '牧野区', 5, 11839, 19);
INSERT INTO `option` VALUES (11841, '红旗区', '红旗区', 10, 11839, 19);
INSERT INTO `option` VALUES (11842, '卫滨区', '卫滨区', 15, 11839, 19);
INSERT INTO `option` VALUES (11843, '卫辉市', '卫辉市', 20, 11839, 19);
INSERT INTO `option` VALUES (11844, '辉县市', '辉县市', 25, 11839, 19);
INSERT INTO `option` VALUES (11845, '新乡县', '新乡县', 30, 11839, 19);
INSERT INTO `option` VALUES (11846, '获嘉县', '获嘉县', 35, 11839, 19);
INSERT INTO `option` VALUES (11847, '原阳县', '原阳县', 40, 11839, 19);
INSERT INTO `option` VALUES (11848, '长垣县', '长垣县', 45, 11839, 19);
INSERT INTO `option` VALUES (11849, '延津县', '延津县', 50, 11839, 19);
INSERT INTO `option` VALUES (11850, '封丘县', '封丘县', 55, 11839, 19);
INSERT INTO `option` VALUES (11851, '凤泉区', '凤泉区', 60, 11839, 19);
INSERT INTO `option` VALUES (11852, '安阳市', '安阳市', 40, 11766, 19);
INSERT INTO `option` VALUES (11853, '龙安区', '龙安区', 5, 11852, 19);
INSERT INTO `option` VALUES (11854, '殷都区', '殷都区', 10, 11852, 19);
INSERT INTO `option` VALUES (11855, '文峰区', '文峰区', 15, 11852, 19);
INSERT INTO `option` VALUES (11856, '开发区', '开发区', 20, 11852, 19);
INSERT INTO `option` VALUES (11857, '北关区', '北关区', 25, 11852, 19);
INSERT INTO `option` VALUES (11858, '林州市', '林州市', 30, 11852, 19);
INSERT INTO `option` VALUES (11859, '安阳县', '安阳县', 35, 11852, 19);
INSERT INTO `option` VALUES (11860, '滑县', '滑县', 40, 11852, 19);
INSERT INTO `option` VALUES (11861, '汤阴县', '汤阴县', 45, 11852, 19);
INSERT INTO `option` VALUES (11862, '内黄县', '内黄县', 50, 11852, 19);
INSERT INTO `option` VALUES (11863, '濮阳市', '濮阳市', 45, 11766, 19);
INSERT INTO `option` VALUES (11864, '濮阳县', '濮阳县', 5, 11863, 19);
INSERT INTO `option` VALUES (11865, '南乐县', '南乐县', 10, 11863, 19);
INSERT INTO `option` VALUES (11866, '台前县', '台前县', 15, 11863, 19);
INSERT INTO `option` VALUES (11867, '清丰县', '清丰县', 20, 11863, 19);
INSERT INTO `option` VALUES (11868, '范县', '范县', 25, 11863, 19);
INSERT INTO `option` VALUES (11869, '华龙区', '华龙区', 30, 11863, 19);
INSERT INTO `option` VALUES (11870, '许昌市', '许昌市', 50, 11766, 19);
INSERT INTO `option` VALUES (11871, '魏都区', '魏都区', 5, 11870, 19);
INSERT INTO `option` VALUES (11872, '禹州市', '禹州市', 10, 11870, 19);
INSERT INTO `option` VALUES (11873, '长葛市', '长葛市', 15, 11870, 19);
INSERT INTO `option` VALUES (11874, '许昌县', '许昌县', 20, 11870, 19);
INSERT INTO `option` VALUES (11875, '鄢陵县', '鄢陵县', 25, 11870, 19);
INSERT INTO `option` VALUES (11876, '襄城县', '襄城县', 30, 11870, 19);
INSERT INTO `option` VALUES (11877, '漯河市', '漯河市', 55, 11766, 19);
INSERT INTO `option` VALUES (11878, '郾城区', '郾城区', 5, 11877, 19);
INSERT INTO `option` VALUES (11879, '临颍县', '临颍县', 10, 11877, 19);
INSERT INTO `option` VALUES (11880, '召陵区', '召陵区', 15, 11877, 19);
INSERT INTO `option` VALUES (11881, '舞阳县', '舞阳县', 20, 11877, 19);
INSERT INTO `option` VALUES (11882, '源汇区', '源汇区', 25, 11877, 19);
INSERT INTO `option` VALUES (11883, '三门峡市', '三门峡市', 60, 11766, 19);
INSERT INTO `option` VALUES (11884, '渑池县', '渑池县', 5, 11883, 19);
INSERT INTO `option` VALUES (11885, '湖滨区', '湖滨区', 10, 11883, 19);
INSERT INTO `option` VALUES (11886, '义马市', '义马市', 15, 11883, 19);
INSERT INTO `option` VALUES (11887, '灵宝市', '灵宝市', 20, 11883, 19);
INSERT INTO `option` VALUES (11888, '陕县', '陕县', 25, 11883, 19);
INSERT INTO `option` VALUES (11889, '卢氏县', '卢氏县', 30, 11883, 19);
INSERT INTO `option` VALUES (11890, '南阳市', '南阳市', 65, 11766, 19);
INSERT INTO `option` VALUES (11891, '社旗县', '社旗县', 5, 11890, 19);
INSERT INTO `option` VALUES (11892, '西峡县', '西峡县', 10, 11890, 19);
INSERT INTO `option` VALUES (11893, '卧龙区', '卧龙区', 15, 11890, 19);
INSERT INTO `option` VALUES (11894, '宛城区', '宛城区', 20, 11890, 19);
INSERT INTO `option` VALUES (11895, '邓州市', '邓州市', 25, 11890, 19);
INSERT INTO `option` VALUES (11896, '桐柏县', '桐柏县', 30, 11890, 19);
INSERT INTO `option` VALUES (11897, '方城县', '方城县', 35, 11890, 19);
INSERT INTO `option` VALUES (11898, '淅川县', '淅川县', 40, 11890, 19);
INSERT INTO `option` VALUES (11899, '镇平县', '镇平县', 45, 11890, 19);
INSERT INTO `option` VALUES (11900, '唐河县', '唐河县', 50, 11890, 19);
INSERT INTO `option` VALUES (11901, '南召县', '南召县', 55, 11890, 19);
INSERT INTO `option` VALUES (11902, '内乡县', '内乡县', 60, 11890, 19);
INSERT INTO `option` VALUES (11903, '新野县', '新野县', 65, 11890, 19);
INSERT INTO `option` VALUES (11904, '商丘市', '商丘市', 70, 11766, 19);
INSERT INTO `option` VALUES (11905, '永城市', '永城市', 5, 11904, 19);
INSERT INTO `option` VALUES (11906, '宁陵县', '宁陵县', 10, 11904, 19);
INSERT INTO `option` VALUES (11907, '虞城县', '虞城县', 15, 11904, 19);
INSERT INTO `option` VALUES (11908, '民权县', '民权县', 20, 11904, 19);
INSERT INTO `option` VALUES (11909, '夏邑县', '夏邑县', 25, 11904, 19);
INSERT INTO `option` VALUES (11910, '柘城县', '柘城县', 30, 11904, 19);
INSERT INTO `option` VALUES (11911, '睢县', '睢县', 35, 11904, 19);
INSERT INTO `option` VALUES (11912, '睢阳区', '睢阳区', 40, 11904, 19);
INSERT INTO `option` VALUES (11913, '梁园区', '梁园区', 45, 11904, 19);
INSERT INTO `option` VALUES (11914, '周口市', '周口市', 75, 11766, 19);
INSERT INTO `option` VALUES (11915, '项城市', '项城市', 5, 11914, 19);
INSERT INTO `option` VALUES (11916, '商水县', '商水县', 10, 11914, 19);
INSERT INTO `option` VALUES (11917, '淮阳县', '淮阳县', 15, 11914, 19);
INSERT INTO `option` VALUES (11918, '太康县', '太康县', 20, 11914, 19);
INSERT INTO `option` VALUES (11919, '鹿邑县', '鹿邑县', 25, 11914, 19);
INSERT INTO `option` VALUES (11920, '西华县', '西华县', 30, 11914, 19);
INSERT INTO `option` VALUES (11921, '扶沟县', '扶沟县', 35, 11914, 19);
INSERT INTO `option` VALUES (11922, '沈丘县', '沈丘县', 40, 11914, 19);
INSERT INTO `option` VALUES (11923, '郸城县', '郸城县', 45, 11914, 19);
INSERT INTO `option` VALUES (11924, '川汇区', '川汇区', 50, 11914, 19);
INSERT INTO `option` VALUES (11925, '东新区', '东新区', 55, 11914, 19);
INSERT INTO `option` VALUES (11926, '经济开发区', '经济开发区', 60, 11914, 19);
INSERT INTO `option` VALUES (11927, '驻马店市', '驻马店市', 80, 11766, 19);
INSERT INTO `option` VALUES (11928, '确山县', '确山县', 5, 11927, 19);
INSERT INTO `option` VALUES (11929, '新蔡县', '新蔡县', 10, 11927, 19);
INSERT INTO `option` VALUES (11930, '上蔡县', '上蔡县', 15, 11927, 19);
INSERT INTO `option` VALUES (11931, '泌阳县', '泌阳县', 20, 11927, 19);
INSERT INTO `option` VALUES (11932, '西平县', '西平县', 25, 11927, 19);
INSERT INTO `option` VALUES (11933, '遂平县', '遂平县', 30, 11927, 19);
INSERT INTO `option` VALUES (11934, '汝南县', '汝南县', 35, 11927, 19);
INSERT INTO `option` VALUES (11935, '平舆县', '平舆县', 40, 11927, 19);
INSERT INTO `option` VALUES (11936, '正阳县', '正阳县', 45, 11927, 19);
INSERT INTO `option` VALUES (11937, '驿城区', '驿城区', 50, 11927, 19);
INSERT INTO `option` VALUES (11938, '信阳市', '信阳市', 85, 11766, 19);
INSERT INTO `option` VALUES (11939, '潢川县', '潢川县', 5, 11938, 19);
INSERT INTO `option` VALUES (11940, '淮滨县', '淮滨县', 10, 11938, 19);
INSERT INTO `option` VALUES (11941, '息县', '息县', 15, 11938, 19);
INSERT INTO `option` VALUES (11942, '新县', '新县', 20, 11938, 19);
INSERT INTO `option` VALUES (11943, '固始县', '固始县', 25, 11938, 19);
INSERT INTO `option` VALUES (11944, '罗山县', '罗山县', 30, 11938, 19);
INSERT INTO `option` VALUES (11945, '光山县', '光山县', 35, 11938, 19);
INSERT INTO `option` VALUES (11946, '商城县', '商城县', 40, 11938, 19);
INSERT INTO `option` VALUES (11947, '平桥区', '平桥区', 45, 11938, 19);
INSERT INTO `option` VALUES (11948, '浉河区', '浉河区', 50, 11938, 19);
INSERT INTO `option` VALUES (11949, '济源市', '济源市', 90, 11766, 19);
INSERT INTO `option` VALUES (11950, '城区', '城区', 5, 11949, 19);
INSERT INTO `option` VALUES (11951, '五龙口镇', '五龙口镇', 10, 11949, 19);
INSERT INTO `option` VALUES (11952, '下冶镇', '下冶镇', 15, 11949, 19);
INSERT INTO `option` VALUES (11953, '轵城镇', '轵城镇', 20, 11949, 19);
INSERT INTO `option` VALUES (11954, '王屋镇', '王屋镇', 25, 11949, 19);
INSERT INTO `option` VALUES (11955, '思礼镇', '思礼镇', 30, 11949, 19);
INSERT INTO `option` VALUES (11956, '邵原镇', '邵原镇', 35, 11949, 19);
INSERT INTO `option` VALUES (11957, '坡头镇', '坡头镇', 40, 11949, 19);
INSERT INTO `option` VALUES (11958, '梨林镇', '梨林镇', 45, 11949, 19);
INSERT INTO `option` VALUES (11959, '克井镇', '克井镇', 50, 11949, 19);
INSERT INTO `option` VALUES (11960, '大峪镇', '大峪镇', 55, 11949, 19);
INSERT INTO `option` VALUES (11961, '承留镇', '承留镇', 60, 11949, 19);
INSERT INTO `option` VALUES (11962, '辽宁省', '辽宁省', 40, 0, 19);
INSERT INTO `option` VALUES (11963, '沈阳市', '沈阳市', 5, 11962, 19);
INSERT INTO `option` VALUES (11964, '苏家屯区', '苏家屯区', 5, 11963, 19);
INSERT INTO `option` VALUES (11965, '新民市', '新民市', 10, 11963, 19);
INSERT INTO `option` VALUES (11966, '法库县', '法库县', 15, 11963, 19);
INSERT INTO `option` VALUES (11967, '辽中县', '辽中县', 20, 11963, 19);
INSERT INTO `option` VALUES (11968, '康平县', '康平县', 25, 11963, 19);
INSERT INTO `option` VALUES (11969, '皇姑区', '皇姑区', 30, 11963, 19);
INSERT INTO `option` VALUES (11970, '铁西区', '铁西区', 35, 11963, 19);
INSERT INTO `option` VALUES (11971, '大东区', '大东区', 40, 11963, 19);
INSERT INTO `option` VALUES (11972, '沈河区', '沈河区', 45, 11963, 19);
INSERT INTO `option` VALUES (11973, '东陵区', '东陵区', 50, 11963, 19);
INSERT INTO `option` VALUES (11974, '于洪区', '于洪区', 55, 11963, 19);
INSERT INTO `option` VALUES (11975, '和平区', '和平区', 60, 11963, 19);
INSERT INTO `option` VALUES (11976, '浑南新区', '浑南新区', 65, 11963, 19);
INSERT INTO `option` VALUES (11977, '沈北新区', '沈北新区', 70, 11963, 19);
INSERT INTO `option` VALUES (11978, '大连市', '大连市', 10, 11962, 19);
INSERT INTO `option` VALUES (11979, '中山区', '中山区', 5, 11978, 19);
INSERT INTO `option` VALUES (11980, '沙河口区', '沙河口区', 10, 11978, 19);
INSERT INTO `option` VALUES (11981, '西岗区', '西岗区', 15, 11978, 19);
INSERT INTO `option` VALUES (11982, '甘井子区', '甘井子区', 20, 11978, 19);
INSERT INTO `option` VALUES (11983, '高新园区', '高新园区', 25, 11978, 19);
INSERT INTO `option` VALUES (11984, '大连开发区', '大连开发区', 30, 11978, 19);
INSERT INTO `option` VALUES (11985, '金州区', '金州区', 35, 11978, 19);
INSERT INTO `option` VALUES (11986, '旅顺口区', '旅顺口区', 40, 11978, 19);
INSERT INTO `option` VALUES (11987, '普兰店市', '普兰店市', 45, 11978, 19);
INSERT INTO `option` VALUES (11988, '瓦房店市', '瓦房店市', 50, 11978, 19);
INSERT INTO `option` VALUES (11989, '庄河市', '庄河市', 55, 11978, 19);
INSERT INTO `option` VALUES (11990, '长海县', '长海县', 60, 11978, 19);
INSERT INTO `option` VALUES (11991, '鞍山市', '鞍山市', 15, 11962, 19);
INSERT INTO `option` VALUES (11992, '铁东区', '铁东区', 5, 11991, 19);
INSERT INTO `option` VALUES (11993, '立山区', '立山区', 10, 11991, 19);
INSERT INTO `option` VALUES (11994, '台安县', '台安县', 15, 11991, 19);
INSERT INTO `option` VALUES (11995, '海城市', '海城市', 20, 11991, 19);
INSERT INTO `option` VALUES (11996, '岫岩县', '岫岩县', 25, 11991, 19);
INSERT INTO `option` VALUES (11997, '铁西区', '铁西区', 30, 11991, 19);
INSERT INTO `option` VALUES (11998, '千山区', '千山区', 35, 11991, 19);
INSERT INTO `option` VALUES (11999, '抚顺市', '抚顺市', 20, 11962, 19);
INSERT INTO `option` VALUES (12000, '望花区', '望花区', 5, 11999, 19);
INSERT INTO `option` VALUES (12001, '东洲区', '东洲区', 10, 11999, 19);
INSERT INTO `option` VALUES (12002, '新抚区', '新抚区', 15, 11999, 19);
INSERT INTO `option` VALUES (12003, '顺城区', '顺城区', 20, 11999, 19);
INSERT INTO `option` VALUES (12004, '抚顺县', '抚顺县', 25, 11999, 19);
INSERT INTO `option` VALUES (12005, '新宾县', '新宾县', 30, 11999, 19);
INSERT INTO `option` VALUES (12006, '清原县', '清原县', 35, 11999, 19);
INSERT INTO `option` VALUES (12007, '本溪市', '本溪市', 25, 11962, 19);
INSERT INTO `option` VALUES (12008, '桓仁县', '桓仁县', 5, 12007, 19);
INSERT INTO `option` VALUES (12009, '本溪县', '本溪县', 10, 12007, 19);
INSERT INTO `option` VALUES (12010, '平山区', '平山区', 15, 12007, 19);
INSERT INTO `option` VALUES (12011, '溪湖区', '溪湖区', 20, 12007, 19);
INSERT INTO `option` VALUES (12012, '明山区', '明山区', 25, 12007, 19);
INSERT INTO `option` VALUES (12013, '南芬区', '南芬区', 30, 12007, 19);
INSERT INTO `option` VALUES (12014, '丹东市', '丹东市', 30, 11962, 19);
INSERT INTO `option` VALUES (12015, '元宝区', '元宝区', 5, 12014, 19);
INSERT INTO `option` VALUES (12016, '振兴区', '振兴区', 10, 12014, 19);
INSERT INTO `option` VALUES (12017, '振安区', '振安区', 15, 12014, 19);
INSERT INTO `option` VALUES (12018, '东港市', '东港市', 20, 12014, 19);
INSERT INTO `option` VALUES (12019, '凤城市', '凤城市', 25, 12014, 19);
INSERT INTO `option` VALUES (12020, '宽甸县', '宽甸县', 30, 12014, 19);
INSERT INTO `option` VALUES (12021, '锦州市', '锦州市', 35, 11962, 19);
INSERT INTO `option` VALUES (12022, '凌河区', '凌河区', 5, 12021, 19);
INSERT INTO `option` VALUES (12023, '古塔区', '古塔区', 10, 12021, 19);
INSERT INTO `option` VALUES (12024, '太和区', '太和区', 15, 12021, 19);
INSERT INTO `option` VALUES (12025, '义县', '义县', 20, 12021, 19);
INSERT INTO `option` VALUES (12026, '凌海市', '凌海市', 25, 12021, 19);
INSERT INTO `option` VALUES (12027, '北镇市', '北镇市', 30, 12021, 19);
INSERT INTO `option` VALUES (12028, '黑山县', '黑山县', 35, 12021, 19);
INSERT INTO `option` VALUES (12029, '经济技术开发区', '经济技术开发区', 40, 12021, 19);
INSERT INTO `option` VALUES (12030, '葫芦岛市', '葫芦岛市', 40, 11962, 19);
INSERT INTO `option` VALUES (12031, '龙港区', '龙港区', 5, 12030, 19);
INSERT INTO `option` VALUES (12032, '连山区', '连山区', 10, 12030, 19);
INSERT INTO `option` VALUES (12033, '兴城市', '兴城市', 15, 12030, 19);
INSERT INTO `option` VALUES (12034, '绥中县', '绥中县', 20, 12030, 19);
INSERT INTO `option` VALUES (12035, '建昌县', '建昌县', 25, 12030, 19);
INSERT INTO `option` VALUES (12036, '南票区', '南票区', 30, 12030, 19);
INSERT INTO `option` VALUES (12037, '营口市', '营口市', 45, 11962, 19);
INSERT INTO `option` VALUES (12038, '西市区', '西市区', 5, 12037, 19);
INSERT INTO `option` VALUES (12039, '站前区', '站前区', 10, 12037, 19);
INSERT INTO `option` VALUES (12040, '大石桥市', '大石桥市', 15, 12037, 19);
INSERT INTO `option` VALUES (12041, '盖州市', '盖州市', 20, 12037, 19);
INSERT INTO `option` VALUES (12042, '老边区', '老边区', 25, 12037, 19);
INSERT INTO `option` VALUES (12043, '鲅鱼圈区', '鲅鱼圈区', 30, 12037, 19);
INSERT INTO `option` VALUES (12044, '盘锦市', '盘锦市', 50, 11962, 19);
INSERT INTO `option` VALUES (12045, '盘山县', '盘山县', 5, 12044, 19);
INSERT INTO `option` VALUES (12046, '大洼县', '大洼县', 10, 12044, 19);
INSERT INTO `option` VALUES (12047, '兴隆台区', '兴隆台区', 15, 12044, 19);
INSERT INTO `option` VALUES (12048, '双台子区', '双台子区', 20, 12044, 19);
INSERT INTO `option` VALUES (12049, '阜新市', '阜新市', 55, 11962, 19);
INSERT INTO `option` VALUES (12050, '阜新县', '阜新县', 5, 12049, 19);
INSERT INTO `option` VALUES (12051, '彰武县', '彰武县', 10, 12049, 19);
INSERT INTO `option` VALUES (12052, '海州区', '海州区', 15, 12049, 19);
INSERT INTO `option` VALUES (12053, '太平区', '太平区', 20, 12049, 19);
INSERT INTO `option` VALUES (12054, '细河区', '细河区', 25, 12049, 19);
INSERT INTO `option` VALUES (12055, '清河门区', '清河门区', 30, 12049, 19);
INSERT INTO `option` VALUES (12056, '新邱区', '新邱区', 35, 12049, 19);
INSERT INTO `option` VALUES (12057, '辽阳市', '辽阳市', 60, 11962, 19);
INSERT INTO `option` VALUES (12058, '辽阳县', '辽阳县', 5, 12057, 19);
INSERT INTO `option` VALUES (12059, '白塔区', '白塔区', 10, 12057, 19);
INSERT INTO `option` VALUES (12060, '文圣区', '文圣区', 15, 12057, 19);
INSERT INTO `option` VALUES (12061, '灯塔市', '灯塔市', 20, 12057, 19);
INSERT INTO `option` VALUES (12062, '太子河区', '太子河区', 25, 12057, 19);
INSERT INTO `option` VALUES (12063, '弓长岭区', '弓长岭区', 30, 12057, 19);
INSERT INTO `option` VALUES (12064, '宏伟区', '宏伟区', 35, 12057, 19);
INSERT INTO `option` VALUES (12065, '朝阳市', '朝阳市', 65, 11962, 19);
INSERT INTO `option` VALUES (12066, '凌源市', '凌源市', 5, 12065, 19);
INSERT INTO `option` VALUES (12067, '北票市', '北票市', 10, 12065, 19);
INSERT INTO `option` VALUES (12068, '喀喇沁左翼县', '喀喇沁左翼县', 15, 12065, 19);
INSERT INTO `option` VALUES (12069, '朝阳县', '朝阳县', 20, 12065, 19);
INSERT INTO `option` VALUES (12070, '双塔区', '双塔区', 25, 12065, 19);
INSERT INTO `option` VALUES (12071, '建平县', '建平县', 30, 12065, 19);
INSERT INTO `option` VALUES (12072, '龙城区', '龙城区', 35, 12065, 19);
INSERT INTO `option` VALUES (12073, '铁岭市', '铁岭市', 70, 11962, 19);
INSERT INTO `option` VALUES (12074, '银州区', '银州区', 5, 12073, 19);
INSERT INTO `option` VALUES (12075, '清河区', '清河区', 10, 12073, 19);
INSERT INTO `option` VALUES (12076, '开原市', '开原市', 15, 12073, 19);
INSERT INTO `option` VALUES (12077, '铁岭县', '铁岭县', 20, 12073, 19);
INSERT INTO `option` VALUES (12078, '西丰县', '西丰县', 25, 12073, 19);
INSERT INTO `option` VALUES (12079, '昌图县', '昌图县', 30, 12073, 19);
INSERT INTO `option` VALUES (12080, '调兵山市', '调兵山市', 35, 12073, 19);
INSERT INTO `option` VALUES (12081, '吉林省', '吉林省', 45, 0, 19);
INSERT INTO `option` VALUES (12082, '长春市', '长春市', 5, 12081, 19);
INSERT INTO `option` VALUES (12083, '德惠市', '德惠市', 5, 12082, 19);
INSERT INTO `option` VALUES (12084, '榆树市', '榆树市', 10, 12082, 19);
INSERT INTO `option` VALUES (12085, '九台市', '九台市', 15, 12082, 19);
INSERT INTO `option` VALUES (12086, '农安县', '农安县', 20, 12082, 19);
INSERT INTO `option` VALUES (12087, '朝阳区', '朝阳区', 25, 12082, 19);
INSERT INTO `option` VALUES (12088, '南关区', '南关区', 30, 12082, 19);
INSERT INTO `option` VALUES (12089, '宽城区', '宽城区', 35, 12082, 19);
INSERT INTO `option` VALUES (12090, '二道区', '二道区', 40, 12082, 19);
INSERT INTO `option` VALUES (12091, '双阳区', '双阳区', 45, 12082, 19);
INSERT INTO `option` VALUES (12092, '绿园区', '绿园区', 50, 12082, 19);
INSERT INTO `option` VALUES (12093, '净月区', '净月区', 55, 12082, 19);
INSERT INTO `option` VALUES (12094, '汽车产业开发区', '汽车产业开发区', 60, 12082, 19);
INSERT INTO `option` VALUES (12095, '高新技术开发区', '高新技术开发区', 65, 12082, 19);
INSERT INTO `option` VALUES (12096, '经济技术开发区', '经济技术开发区', 70, 12082, 19);
INSERT INTO `option` VALUES (12097, '吉林市', '吉林市', 10, 12081, 19);
INSERT INTO `option` VALUES (12098, '昌邑区', '昌邑区', 5, 12097, 19);
INSERT INTO `option` VALUES (12099, '龙潭区', '龙潭区', 10, 12097, 19);
INSERT INTO `option` VALUES (12100, '船营区', '船营区', 15, 12097, 19);
INSERT INTO `option` VALUES (12101, '丰满区', '丰满区', 20, 12097, 19);
INSERT INTO `option` VALUES (12102, '舒兰市', '舒兰市', 25, 12097, 19);
INSERT INTO `option` VALUES (12103, '桦甸市', '桦甸市', 30, 12097, 19);
INSERT INTO `option` VALUES (12104, '蛟河市', '蛟河市', 35, 12097, 19);
INSERT INTO `option` VALUES (12105, '磐石市', '磐石市', 40, 12097, 19);
INSERT INTO `option` VALUES (12106, '永吉县', '永吉县', 45, 12097, 19);
INSERT INTO `option` VALUES (12107, '四平市', '四平市', 15, 12081, 19);
INSERT INTO `option` VALUES (12108, '铁东区', '铁东区', 5, 12107, 19);
INSERT INTO `option` VALUES (12109, '铁西区', '铁西区', 10, 12107, 19);
INSERT INTO `option` VALUES (12110, '公主岭市', '公主岭市', 15, 12107, 19);
INSERT INTO `option` VALUES (12111, '双辽市', '双辽市', 20, 12107, 19);
INSERT INTO `option` VALUES (12112, '梨树县', '梨树县', 25, 12107, 19);
INSERT INTO `option` VALUES (12113, '伊通县', '伊通县', 30, 12107, 19);
INSERT INTO `option` VALUES (12114, '通化市', '通化市', 20, 12081, 19);
INSERT INTO `option` VALUES (12115, '东昌区', '东昌区', 5, 12114, 19);
INSERT INTO `option` VALUES (12116, '梅河口市', '梅河口市', 10, 12114, 19);
INSERT INTO `option` VALUES (12117, '集安市', '集安市', 15, 12114, 19);
INSERT INTO `option` VALUES (12118, '通化县', '通化县', 20, 12114, 19);
INSERT INTO `option` VALUES (12119, '辉南县', '辉南县', 25, 12114, 19);
INSERT INTO `option` VALUES (12120, '柳河县', '柳河县', 30, 12114, 19);
INSERT INTO `option` VALUES (12121, '二道江区', '二道江区', 35, 12114, 19);
INSERT INTO `option` VALUES (12122, '白山市', '白山市', 25, 12081, 19);
INSERT INTO `option` VALUES (12123, '浑江区', '浑江区', 5, 12122, 19);
INSERT INTO `option` VALUES (12124, '临江市', '临江市', 10, 12122, 19);
INSERT INTO `option` VALUES (12125, '江源区', '江源区', 15, 12122, 19);
INSERT INTO `option` VALUES (12126, '靖宇县', '靖宇县', 20, 12122, 19);
INSERT INTO `option` VALUES (12127, '抚松县', '抚松县', 25, 12122, 19);
INSERT INTO `option` VALUES (12128, '长白县', '长白县', 30, 12122, 19);
INSERT INTO `option` VALUES (12129, '松原市', '松原市', 30, 12081, 19);
INSERT INTO `option` VALUES (12130, '宁江区', '宁江区', 5, 12129, 19);
INSERT INTO `option` VALUES (12131, '前郭县', '前郭县', 10, 12129, 19);
INSERT INTO `option` VALUES (12132, '乾安县', '乾安县', 15, 12129, 19);
INSERT INTO `option` VALUES (12133, '长岭县', '长岭县', 20, 12129, 19);
INSERT INTO `option` VALUES (12134, '扶余县', '扶余县', 25, 12129, 19);
INSERT INTO `option` VALUES (12135, '白城市', '白城市', 35, 12081, 19);
INSERT INTO `option` VALUES (12136, '大安市', '大安市', 5, 12135, 19);
INSERT INTO `option` VALUES (12137, '洮南市', '洮南市', 10, 12135, 19);
INSERT INTO `option` VALUES (12138, '通榆县', '通榆县', 15, 12135, 19);
INSERT INTO `option` VALUES (12139, '镇赉县', '镇赉县', 20, 12135, 19);
INSERT INTO `option` VALUES (12140, '洮北区', '洮北区', 25, 12135, 19);
INSERT INTO `option` VALUES (12141, '延边州', '延边州', 40, 12081, 19);
INSERT INTO `option` VALUES (12142, '延吉市', '延吉市', 5, 12141, 19);
INSERT INTO `option` VALUES (12143, '图们市', '图们市', 10, 12141, 19);
INSERT INTO `option` VALUES (12144, '敦化市', '敦化市', 15, 12141, 19);
INSERT INTO `option` VALUES (12145, '珲春市', '珲春市', 20, 12141, 19);
INSERT INTO `option` VALUES (12146, '龙井市', '龙井市', 25, 12141, 19);
INSERT INTO `option` VALUES (12147, '和龙市', '和龙市', 30, 12141, 19);
INSERT INTO `option` VALUES (12148, '汪清县', '汪清县', 35, 12141, 19);
INSERT INTO `option` VALUES (12149, '安图县', '安图县', 40, 12141, 19);
INSERT INTO `option` VALUES (12150, '辽源市', '辽源市', 45, 12081, 19);
INSERT INTO `option` VALUES (12151, '龙山区', '龙山区', 5, 12150, 19);
INSERT INTO `option` VALUES (12152, '西安区', '西安区', 10, 12150, 19);
INSERT INTO `option` VALUES (12153, '东丰县', '东丰县', 15, 12150, 19);
INSERT INTO `option` VALUES (12154, '东辽县', '东辽县', 20, 12150, 19);
INSERT INTO `option` VALUES (12155, '黑龙江省', '黑龙江省', 50, 0, 19);
INSERT INTO `option` VALUES (12156, '哈尔滨市', '哈尔滨市', 5, 12155, 19);
INSERT INTO `option` VALUES (12157, '阿城区', '阿城区', 5, 12156, 19);
INSERT INTO `option` VALUES (12158, '尚志市', '尚志市', 10, 12156, 19);
INSERT INTO `option` VALUES (12159, '双城市', '双城市', 15, 12156, 19);
INSERT INTO `option` VALUES (12160, '五常市', '五常市', 20, 12156, 19);
INSERT INTO `option` VALUES (12161, '方正县', '方正县', 25, 12156, 19);
INSERT INTO `option` VALUES (12162, '宾县', '宾县', 30, 12156, 19);
INSERT INTO `option` VALUES (12163, '依兰县', '依兰县', 35, 12156, 19);
INSERT INTO `option` VALUES (12164, '巴彦县', '巴彦县', 40, 12156, 19);
INSERT INTO `option` VALUES (12165, '通河县', '通河县', 45, 12156, 19);
INSERT INTO `option` VALUES (12166, '木兰县', '木兰县', 50, 12156, 19);
INSERT INTO `option` VALUES (12167, '延寿县', '延寿县', 55, 12156, 19);
INSERT INTO `option` VALUES (12168, '呼兰区', '呼兰区', 60, 12156, 19);
INSERT INTO `option` VALUES (12169, '松北区', '松北区', 65, 12156, 19);
INSERT INTO `option` VALUES (12170, '道里区', '道里区', 70, 12156, 19);
INSERT INTO `option` VALUES (12171, '南岗区', '南岗区', 75, 12156, 19);
INSERT INTO `option` VALUES (12172, '道外区', '道外区', 80, 12156, 19);
INSERT INTO `option` VALUES (12173, '香坊区', '香坊区', 85, 12156, 19);
INSERT INTO `option` VALUES (12174, '平房区', '平房区', 90, 12156, 19);
INSERT INTO `option` VALUES (12175, '齐齐哈尔市', '齐齐哈尔市', 10, 12155, 19);
INSERT INTO `option` VALUES (12176, '建华区', '建华区', 5, 12175, 19);
INSERT INTO `option` VALUES (12177, '龙沙区', '龙沙区', 10, 12175, 19);
INSERT INTO `option` VALUES (12178, '铁锋区', '铁锋区', 15, 12175, 19);
INSERT INTO `option` VALUES (12179, '梅里斯区', '梅里斯区', 20, 12175, 19);
INSERT INTO `option` VALUES (12180, '昂昂溪区', '昂昂溪区', 25, 12175, 19);
INSERT INTO `option` VALUES (12181, '富拉尔基区', '富拉尔基区', 30, 12175, 19);
INSERT INTO `option` VALUES (12182, '碾子山区', '碾子山区', 35, 12175, 19);
INSERT INTO `option` VALUES (12183, '讷河市', '讷河市', 40, 12175, 19);
INSERT INTO `option` VALUES (12184, '富裕县', '富裕县', 45, 12175, 19);
INSERT INTO `option` VALUES (12185, '拜泉县', '拜泉县', 50, 12175, 19);
INSERT INTO `option` VALUES (12186, '甘南县', '甘南县', 55, 12175, 19);
INSERT INTO `option` VALUES (12187, '依安县', '依安县', 60, 12175, 19);
INSERT INTO `option` VALUES (12188, '克山县', '克山县', 65, 12175, 19);
INSERT INTO `option` VALUES (12189, '龙江县', '龙江县', 70, 12175, 19);
INSERT INTO `option` VALUES (12190, '克东县', '克东县', 75, 12175, 19);
INSERT INTO `option` VALUES (12191, '泰来县', '泰来县', 80, 12175, 19);
INSERT INTO `option` VALUES (12192, '鹤岗市', '鹤岗市', 15, 12155, 19);
INSERT INTO `option` VALUES (12193, '兴山区', '兴山区', 5, 12192, 19);
INSERT INTO `option` VALUES (12194, '向阳区', '向阳区', 10, 12192, 19);
INSERT INTO `option` VALUES (12195, '工农区', '工农区', 15, 12192, 19);
INSERT INTO `option` VALUES (12196, '南山区', '南山区', 20, 12192, 19);
INSERT INTO `option` VALUES (12197, '兴安区', '兴安区', 25, 12192, 19);
INSERT INTO `option` VALUES (12198, '东山区', '东山区', 30, 12192, 19);
INSERT INTO `option` VALUES (12199, '萝北县', '萝北县', 35, 12192, 19);
INSERT INTO `option` VALUES (12200, '绥滨县', '绥滨县', 40, 12192, 19);
INSERT INTO `option` VALUES (12201, '双鸭山市', '双鸭山市', 20, 12155, 19);
INSERT INTO `option` VALUES (12202, '尖山区', '尖山区', 5, 12201, 19);
INSERT INTO `option` VALUES (12203, '岭东区', '岭东区', 10, 12201, 19);
INSERT INTO `option` VALUES (12204, '四方台区', '四方台区', 15, 12201, 19);
INSERT INTO `option` VALUES (12205, '宝山区', '宝山区', 20, 12201, 19);
INSERT INTO `option` VALUES (12206, '集贤县', '集贤县', 25, 12201, 19);
INSERT INTO `option` VALUES (12207, '宝清县', '宝清县', 30, 12201, 19);
INSERT INTO `option` VALUES (12208, '友谊县', '友谊县', 35, 12201, 19);
INSERT INTO `option` VALUES (12209, '饶河县', '饶河县', 40, 12201, 19);
INSERT INTO `option` VALUES (12210, '鸡西市', '鸡西市', 25, 12155, 19);
INSERT INTO `option` VALUES (12211, '恒山区', '恒山区', 5, 12210, 19);
INSERT INTO `option` VALUES (12212, '滴道区', '滴道区', 10, 12210, 19);
INSERT INTO `option` VALUES (12213, '梨树区', '梨树区', 15, 12210, 19);
INSERT INTO `option` VALUES (12214, '城子河区', '城子河区', 20, 12210, 19);
INSERT INTO `option` VALUES (12215, '麻山区', '麻山区', 25, 12210, 19);
INSERT INTO `option` VALUES (12216, '鸡冠区', '鸡冠区', 30, 12210, 19);
INSERT INTO `option` VALUES (12217, '密山市', '密山市', 35, 12210, 19);
INSERT INTO `option` VALUES (12218, '虎林市', '虎林市', 40, 12210, 19);
INSERT INTO `option` VALUES (12219, '鸡东县', '鸡东县', 45, 12210, 19);
INSERT INTO `option` VALUES (12220, '大庆市', '大庆市', 30, 12155, 19);
INSERT INTO `option` VALUES (12221, '萨尔图区', '萨尔图区', 5, 12220, 19);
INSERT INTO `option` VALUES (12222, '龙凤区', '龙凤区', 10, 12220, 19);
INSERT INTO `option` VALUES (12223, '让胡路区', '让胡路区', 15, 12220, 19);
INSERT INTO `option` VALUES (12224, '红岗区', '红岗区', 20, 12220, 19);
INSERT INTO `option` VALUES (12225, '大同区', '大同区', 25, 12220, 19);
INSERT INTO `option` VALUES (12226, '林甸县', '林甸县', 30, 12220, 19);
INSERT INTO `option` VALUES (12227, '肇州县', '肇州县', 35, 12220, 19);
INSERT INTO `option` VALUES (12228, '肇源县', '肇源县', 40, 12220, 19);
INSERT INTO `option` VALUES (12229, '杜尔伯特县', '杜尔伯特县', 45, 12220, 19);
INSERT INTO `option` VALUES (12230, '伊春市', '伊春市', 35, 12155, 19);
INSERT INTO `option` VALUES (12231, '伊春区', '伊春区', 5, 12230, 19);
INSERT INTO `option` VALUES (12232, '南岔区', '南岔区', 10, 12230, 19);
INSERT INTO `option` VALUES (12233, '友好区', '友好区', 15, 12230, 19);
INSERT INTO `option` VALUES (12234, '西林区', '西林区', 20, 12230, 19);
INSERT INTO `option` VALUES (12235, '翠峦区', '翠峦区', 25, 12230, 19);
INSERT INTO `option` VALUES (12236, '新青区', '新青区', 30, 12230, 19);
INSERT INTO `option` VALUES (12237, '美溪区', '美溪区', 35, 12230, 19);
INSERT INTO `option` VALUES (12238, '金山屯区', '金山屯区', 40, 12230, 19);
INSERT INTO `option` VALUES (12239, '五营区', '五营区', 45, 12230, 19);
INSERT INTO `option` VALUES (12240, '乌马河区', '乌马河区', 50, 12230, 19);
INSERT INTO `option` VALUES (12241, '汤旺河区', '汤旺河区', 55, 12230, 19);
INSERT INTO `option` VALUES (12242, '带岭区', '带岭区', 60, 12230, 19);
INSERT INTO `option` VALUES (12243, '乌伊岭区', '乌伊岭区', 65, 12230, 19);
INSERT INTO `option` VALUES (12244, '红星区', '红星区', 70, 12230, 19);
INSERT INTO `option` VALUES (12245, '上甘岭区', '上甘岭区', 75, 12230, 19);
INSERT INTO `option` VALUES (12246, '铁力市', '铁力市', 80, 12230, 19);
INSERT INTO `option` VALUES (12247, '嘉荫县', '嘉荫县', 85, 12230, 19);
INSERT INTO `option` VALUES (12248, '牡丹江市', '牡丹江市', 40, 12155, 19);
INSERT INTO `option` VALUES (12249, '爱民区', '爱民区', 5, 12248, 19);
INSERT INTO `option` VALUES (12250, '东安区', '东安区', 10, 12248, 19);
INSERT INTO `option` VALUES (12251, '阳明区', '阳明区', 15, 12248, 19);
INSERT INTO `option` VALUES (12252, '西安区', '西安区', 20, 12248, 19);
INSERT INTO `option` VALUES (12253, '绥芬河市', '绥芬河市', 25, 12248, 19);
INSERT INTO `option` VALUES (12254, '海林市', '海林市', 30, 12248, 19);
INSERT INTO `option` VALUES (12255, '宁安市', '宁安市', 35, 12248, 19);
INSERT INTO `option` VALUES (12256, '穆棱市', '穆棱市', 40, 12248, 19);
INSERT INTO `option` VALUES (12257, '林口县', '林口县', 45, 12248, 19);
INSERT INTO `option` VALUES (12258, '东宁县', '东宁县', 50, 12248, 19);
INSERT INTO `option` VALUES (12259, '佳木斯市', '佳木斯市', 45, 12155, 19);
INSERT INTO `option` VALUES (12260, '桦川县', '桦川县', 5, 12259, 19);
INSERT INTO `option` VALUES (12261, '抚远县', '抚远县', 10, 12259, 19);
INSERT INTO `option` VALUES (12262, '桦南县', '桦南县', 15, 12259, 19);
INSERT INTO `option` VALUES (12263, '汤原县', '汤原县', 20, 12259, 19);
INSERT INTO `option` VALUES (12264, '前进区', '前进区', 25, 12259, 19);
INSERT INTO `option` VALUES (12265, '向阳区', '向阳区', 30, 12259, 19);
INSERT INTO `option` VALUES (12266, '东风区', '东风区', 35, 12259, 19);
INSERT INTO `option` VALUES (12267, '郊区', '郊区', 40, 12259, 19);
INSERT INTO `option` VALUES (12268, '同江市', '同江市', 45, 12259, 19);
INSERT INTO `option` VALUES (12269, '富锦市', '富锦市', 50, 12259, 19);
INSERT INTO `option` VALUES (12270, '七台河市', '七台河市', 50, 12155, 19);
INSERT INTO `option` VALUES (12271, '勃利县', '勃利县', 5, 12270, 19);
INSERT INTO `option` VALUES (12272, '桃山区', '桃山区', 10, 12270, 19);
INSERT INTO `option` VALUES (12273, '新兴区', '新兴区', 15, 12270, 19);
INSERT INTO `option` VALUES (12274, '茄子河区', '茄子河区', 20, 12270, 19);
INSERT INTO `option` VALUES (12275, '黑河市', '黑河市', 55, 12155, 19);
INSERT INTO `option` VALUES (12276, '北安市', '北安市', 5, 12275, 19);
INSERT INTO `option` VALUES (12277, '五大连池市', '五大连池市', 10, 12275, 19);
INSERT INTO `option` VALUES (12278, '逊克县', '逊克县', 15, 12275, 19);
INSERT INTO `option` VALUES (12279, '孙吴县', '孙吴县', 20, 12275, 19);
INSERT INTO `option` VALUES (12280, '嫩江县', '嫩江县', 25, 12275, 19);
INSERT INTO `option` VALUES (12281, '爱辉区', '爱辉区', 30, 12275, 19);
INSERT INTO `option` VALUES (12282, '绥化市', '绥化市', 60, 12155, 19);
INSERT INTO `option` VALUES (12283, '北林区', '北林区', 5, 12282, 19);
INSERT INTO `option` VALUES (12284, '安达市', '安达市', 10, 12282, 19);
INSERT INTO `option` VALUES (12285, '肇东市', '肇东市', 15, 12282, 19);
INSERT INTO `option` VALUES (12286, '海伦市', '海伦市', 20, 12282, 19);
INSERT INTO `option` VALUES (12287, '绥棱县', '绥棱县', 25, 12282, 19);
INSERT INTO `option` VALUES (12288, '兰西县', '兰西县', 30, 12282, 19);
INSERT INTO `option` VALUES (12289, '明水县', '明水县', 35, 12282, 19);
INSERT INTO `option` VALUES (12290, '青冈县', '青冈县', 40, 12282, 19);
INSERT INTO `option` VALUES (12291, '庆安县', '庆安县', 45, 12282, 19);
INSERT INTO `option` VALUES (12292, '望奎县', '望奎县', 50, 12282, 19);
INSERT INTO `option` VALUES (12293, '大兴安岭地区', '大兴安岭地区', 65, 12155, 19);
INSERT INTO `option` VALUES (12294, '加格达奇区', '加格达奇区', 5, 12293, 19);
INSERT INTO `option` VALUES (12295, '松岭区', '松岭区', 10, 12293, 19);
INSERT INTO `option` VALUES (12296, '呼中区', '呼中区', 15, 12293, 19);
INSERT INTO `option` VALUES (12297, '呼玛县', '呼玛县', 20, 12293, 19);
INSERT INTO `option` VALUES (12298, '塔河县', '塔河县', 25, 12293, 19);
INSERT INTO `option` VALUES (12299, '漠河县', '漠河县', 30, 12293, 19);
INSERT INTO `option` VALUES (12300, '新林区', '新林区', 35, 12293, 19);
INSERT INTO `option` VALUES (12301, '内蒙古自治区', '内蒙古自治区', 55, 0, 19);
INSERT INTO `option` VALUES (12302, '呼和浩特市', '呼和浩特市', 5, 12301, 19);
INSERT INTO `option` VALUES (12303, '玉泉区', '玉泉区', 5, 12302, 19);
INSERT INTO `option` VALUES (12304, '赛罕区', '赛罕区', 10, 12302, 19);
INSERT INTO `option` VALUES (12305, '土默特左旗', '土默特左旗', 15, 12302, 19);
INSERT INTO `option` VALUES (12306, '和林格尔县', '和林格尔县', 20, 12302, 19);
INSERT INTO `option` VALUES (12307, '武川县', '武川县', 25, 12302, 19);
INSERT INTO `option` VALUES (12308, '托克托县', '托克托县', 30, 12302, 19);
INSERT INTO `option` VALUES (12309, '清水河县', '清水河县', 35, 12302, 19);
INSERT INTO `option` VALUES (12310, '回民区', '回民区', 40, 12302, 19);
INSERT INTO `option` VALUES (12311, '新城区', '新城区', 45, 12302, 19);
INSERT INTO `option` VALUES (12312, '包头市', '包头市', 10, 12301, 19);
INSERT INTO `option` VALUES (12313, '固阳县', '固阳县', 5, 12312, 19);
INSERT INTO `option` VALUES (12314, '土默特右旗', '土默特右旗', 10, 12312, 19);
INSERT INTO `option` VALUES (12315, '达茂联合旗', '达茂联合旗', 15, 12312, 19);
INSERT INTO `option` VALUES (12316, '东河区', '东河区', 20, 12312, 19);
INSERT INTO `option` VALUES (12317, '九原区', '九原区', 25, 12312, 19);
INSERT INTO `option` VALUES (12318, '青山区', '青山区', 30, 12312, 19);
INSERT INTO `option` VALUES (12319, '昆都仑区', '昆都仑区', 35, 12312, 19);
INSERT INTO `option` VALUES (12320, '石拐区', '石拐区', 40, 12312, 19);
INSERT INTO `option` VALUES (12321, '白云矿区', '白云矿区', 45, 12312, 19);
INSERT INTO `option` VALUES (12322, '乌海市', '乌海市', 15, 12301, 19);
INSERT INTO `option` VALUES (12323, '海勃湾区', '海勃湾区', 5, 12322, 19);
INSERT INTO `option` VALUES (12324, '海南区', '海南区', 10, 12322, 19);
INSERT INTO `option` VALUES (12325, '乌达区', '乌达区', 15, 12322, 19);
INSERT INTO `option` VALUES (12326, '赤峰市', '赤峰市', 20, 12301, 19);
INSERT INTO `option` VALUES (12327, '宁城县', '宁城县', 5, 12326, 19);
INSERT INTO `option` VALUES (12328, '敖汉旗', '敖汉旗', 10, 12326, 19);
INSERT INTO `option` VALUES (12329, '喀喇沁旗', '喀喇沁旗', 15, 12326, 19);
INSERT INTO `option` VALUES (12330, '翁牛特旗', '翁牛特旗', 20, 12326, 19);
INSERT INTO `option` VALUES (12331, '巴林右旗', '巴林右旗', 25, 12326, 19);
INSERT INTO `option` VALUES (12332, '林西县', '林西县', 30, 12326, 19);
INSERT INTO `option` VALUES (12333, '克什克腾旗', '克什克腾旗', 35, 12326, 19);
INSERT INTO `option` VALUES (12334, '巴林左旗', '巴林左旗', 40, 12326, 19);
INSERT INTO `option` VALUES (12335, '阿鲁科尔沁旗', '阿鲁科尔沁旗', 45, 12326, 19);
INSERT INTO `option` VALUES (12336, '元宝山区', '元宝山区', 50, 12326, 19);
INSERT INTO `option` VALUES (12337, '红山区', '红山区', 55, 12326, 19);
INSERT INTO `option` VALUES (12338, '松山区', '松山区', 60, 12326, 19);
INSERT INTO `option` VALUES (12339, '乌兰察布市', '乌兰察布市', 25, 12301, 19);
INSERT INTO `option` VALUES (12340, '集宁区', '集宁区', 5, 12339, 19);
INSERT INTO `option` VALUES (12341, '丰镇市', '丰镇市', 10, 12339, 19);
INSERT INTO `option` VALUES (12342, '兴和县', '兴和县', 15, 12339, 19);
INSERT INTO `option` VALUES (12343, '卓资县', '卓资县', 20, 12339, 19);
INSERT INTO `option` VALUES (12344, '商都县', '商都县', 25, 12339, 19);
INSERT INTO `option` VALUES (12345, '凉城县', '凉城县', 30, 12339, 19);
INSERT INTO `option` VALUES (12346, '化德县', '化德县', 35, 12339, 19);
INSERT INTO `option` VALUES (12347, '察哈尔右翼前旗', '察哈尔右翼前旗', 40, 12339, 19);
INSERT INTO `option` VALUES (12348, '察哈尔右翼中旗', '察哈尔右翼中旗', 45, 12339, 19);
INSERT INTO `option` VALUES (12349, '察哈尔右翼后旗', '察哈尔右翼后旗', 50, 12339, 19);
INSERT INTO `option` VALUES (12350, '四子王旗', '四子王旗', 55, 12339, 19);
INSERT INTO `option` VALUES (12351, '锡林郭勒盟', '锡林郭勒盟', 30, 12301, 19);
INSERT INTO `option` VALUES (12352, '锡林浩特市', '锡林浩特市', 5, 12351, 19);
INSERT INTO `option` VALUES (12353, '二连浩特市', '二连浩特市', 10, 12351, 19);
INSERT INTO `option` VALUES (12354, '多伦县', '多伦县', 15, 12351, 19);
INSERT INTO `option` VALUES (12355, '阿巴嘎旗', '阿巴嘎旗', 20, 12351, 19);
INSERT INTO `option` VALUES (12356, '西乌珠穆沁旗', '西乌珠穆沁旗', 25, 12351, 19);
INSERT INTO `option` VALUES (12357, '东乌珠穆沁旗', '东乌珠穆沁旗', 30, 12351, 19);
INSERT INTO `option` VALUES (12358, '苏尼特右旗', '苏尼特右旗', 35, 12351, 19);
INSERT INTO `option` VALUES (12359, '苏尼特左旗', '苏尼特左旗', 40, 12351, 19);
INSERT INTO `option` VALUES (12360, '太仆寺旗', '太仆寺旗', 45, 12351, 19);
INSERT INTO `option` VALUES (12361, '正镶白旗', '正镶白旗', 50, 12351, 19);
INSERT INTO `option` VALUES (12362, '正蓝旗', '正蓝旗', 55, 12351, 19);
INSERT INTO `option` VALUES (12363, '镶黄旗', '镶黄旗', 60, 12351, 19);
INSERT INTO `option` VALUES (12364, '呼伦贝尔市', '呼伦贝尔市', 35, 12301, 19);
INSERT INTO `option` VALUES (12365, '海拉尔区', '海拉尔区', 5, 12364, 19);
INSERT INTO `option` VALUES (12366, '满洲里市', '满洲里市', 10, 12364, 19);
INSERT INTO `option` VALUES (12367, '牙克石市', '牙克石市', 15, 12364, 19);
INSERT INTO `option` VALUES (12368, '扎兰屯市', '扎兰屯市', 20, 12364, 19);
INSERT INTO `option` VALUES (12369, '根河市', '根河市', 25, 12364, 19);
INSERT INTO `option` VALUES (12370, '额尔古纳市', '额尔古纳市', 30, 12364, 19);
INSERT INTO `option` VALUES (12371, '陈巴尔虎旗', '陈巴尔虎旗', 35, 12364, 19);
INSERT INTO `option` VALUES (12372, '阿荣旗', '阿荣旗', 40, 12364, 19);
INSERT INTO `option` VALUES (12373, '新巴尔虎左旗', '新巴尔虎左旗', 45, 12364, 19);
INSERT INTO `option` VALUES (12374, '新巴尔虎右旗', '新巴尔虎右旗', 50, 12364, 19);
INSERT INTO `option` VALUES (12375, '鄂伦春旗', '鄂伦春旗', 55, 12364, 19);
INSERT INTO `option` VALUES (12376, '莫力达瓦旗', '莫力达瓦旗', 60, 12364, 19);
INSERT INTO `option` VALUES (12377, '鄂温克族旗', '鄂温克族旗', 65, 12364, 19);
INSERT INTO `option` VALUES (12378, '鄂尔多斯市', '鄂尔多斯市', 40, 12301, 19);
INSERT INTO `option` VALUES (12379, '东胜区', '东胜区', 5, 12378, 19);
INSERT INTO `option` VALUES (12380, '准格尔旗', '准格尔旗', 10, 12378, 19);
INSERT INTO `option` VALUES (12381, '伊金霍洛旗', '伊金霍洛旗', 15, 12378, 19);
INSERT INTO `option` VALUES (12382, '乌审旗', '乌审旗', 20, 12378, 19);
INSERT INTO `option` VALUES (12383, '杭锦旗', '杭锦旗', 25, 12378, 19);
INSERT INTO `option` VALUES (12384, '鄂托克旗', '鄂托克旗', 30, 12378, 19);
INSERT INTO `option` VALUES (12385, '鄂托克前旗', '鄂托克前旗', 35, 12378, 19);
INSERT INTO `option` VALUES (12386, '达拉特旗', '达拉特旗', 40, 12378, 19);
INSERT INTO `option` VALUES (12387, '康巴什新区', '康巴什新区', 45, 12378, 19);
INSERT INTO `option` VALUES (12388, '巴彦淖尔市', '巴彦淖尔市', 45, 12301, 19);
INSERT INTO `option` VALUES (12389, '临河区', '临河区', 5, 12388, 19);
INSERT INTO `option` VALUES (12390, '五原县', '五原县', 10, 12388, 19);
INSERT INTO `option` VALUES (12391, '磴口县', '磴口县', 15, 12388, 19);
INSERT INTO `option` VALUES (12392, '杭锦后旗', '杭锦后旗', 20, 12388, 19);
INSERT INTO `option` VALUES (12393, '乌拉特中旗', '乌拉特中旗', 25, 12388, 19);
INSERT INTO `option` VALUES (12394, '乌拉特后旗 ', '乌拉特后旗 ', 30, 12388, 19);
INSERT INTO `option` VALUES (12395, '乌拉特前旗', '乌拉特前旗', 35, 12388, 19);
INSERT INTO `option` VALUES (12396, '阿拉善盟', '阿拉善盟', 50, 12301, 19);
INSERT INTO `option` VALUES (12397, '阿拉善右旗', '阿拉善右旗', 5, 12396, 19);
INSERT INTO `option` VALUES (12398, '阿拉善左旗', '阿拉善左旗', 10, 12396, 19);
INSERT INTO `option` VALUES (12399, '额济纳旗', '额济纳旗', 15, 12396, 19);
INSERT INTO `option` VALUES (12400, '兴安盟', '兴安盟', 55, 12301, 19);
INSERT INTO `option` VALUES (12401, '乌兰浩特市', '乌兰浩特市', 5, 12400, 19);
INSERT INTO `option` VALUES (12402, '阿尔山市', '阿尔山市', 10, 12400, 19);
INSERT INTO `option` VALUES (12403, '突泉县', '突泉县', 15, 12400, 19);
INSERT INTO `option` VALUES (12404, '扎赉特旗', '扎赉特旗', 20, 12400, 19);
INSERT INTO `option` VALUES (12405, '科尔沁右翼前旗', '科尔沁右翼前旗', 25, 12400, 19);
INSERT INTO `option` VALUES (12406, '科尔沁右翼中旗', '科尔沁右翼中旗', 30, 12400, 19);
INSERT INTO `option` VALUES (12407, '通辽市', '通辽市', 60, 12301, 19);
INSERT INTO `option` VALUES (12408, '科尔沁区', '科尔沁区', 5, 12407, 19);
INSERT INTO `option` VALUES (12409, '霍林郭勒市', '霍林郭勒市', 10, 12407, 19);
INSERT INTO `option` VALUES (12410, '开鲁县', '开鲁县', 15, 12407, 19);
INSERT INTO `option` VALUES (12411, '库伦旗', '库伦旗', 20, 12407, 19);
INSERT INTO `option` VALUES (12412, '奈曼旗', '奈曼旗', 25, 12407, 19);
INSERT INTO `option` VALUES (12413, '扎鲁特旗', '扎鲁特旗', 30, 12407, 19);
INSERT INTO `option` VALUES (12414, '科尔沁左翼中旗', '科尔沁左翼中旗', 35, 12407, 19);
INSERT INTO `option` VALUES (12415, '科尔沁左翼后旗', '科尔沁左翼后旗', 40, 12407, 19);
INSERT INTO `option` VALUES (12416, '江苏省', '江苏省', 60, 0, 19);
INSERT INTO `option` VALUES (12417, '南京市', '南京市', 5, 12416, 19);
INSERT INTO `option` VALUES (12418, '玄武区', '玄武区', 5, 12417, 19);
INSERT INTO `option` VALUES (12419, '秦淮区', '秦淮区', 10, 12417, 19);
INSERT INTO `option` VALUES (12420, '建邺区', '建邺区', 15, 12417, 19);
INSERT INTO `option` VALUES (12421, '鼓楼区', '鼓楼区', 20, 12417, 19);
INSERT INTO `option` VALUES (12422, '栖霞区', '栖霞区', 25, 12417, 19);
INSERT INTO `option` VALUES (12423, '江宁区', '江宁区', 30, 12417, 19);
INSERT INTO `option` VALUES (12424, '六合区', '六合区', 35, 12417, 19);
INSERT INTO `option` VALUES (12425, '雨花台区', '雨花台区', 40, 12417, 19);
INSERT INTO `option` VALUES (12426, '高淳区', '高淳区', 45, 12417, 19);
INSERT INTO `option` VALUES (12427, '溧水区', '溧水区', 50, 12417, 19);
INSERT INTO `option` VALUES (12428, '浦口区', '浦口区', 55, 12417, 19);
INSERT INTO `option` VALUES (12429, '徐州市', '徐州市', 10, 12416, 19);
INSERT INTO `option` VALUES (12430, '贾汪区', '贾汪区', 5, 12429, 19);
INSERT INTO `option` VALUES (12431, '金山桥开发区', '金山桥开发区', 10, 12429, 19);
INSERT INTO `option` VALUES (12432, '铜山经济技术开发区', '铜山经济技术开发区', 15, 12429, 19);
INSERT INTO `option` VALUES (12433, '八段工业园区', '八段工业园区', 20, 12429, 19);
INSERT INTO `option` VALUES (12434, '鼓楼区', '鼓楼区', 25, 12429, 19);
INSERT INTO `option` VALUES (12435, '邳州市', '邳州市', 30, 12429, 19);
INSERT INTO `option` VALUES (12436, '泉山区', '泉山区', 35, 12429, 19);
INSERT INTO `option` VALUES (12437, '新沂市', '新沂市', 40, 12429, 19);
INSERT INTO `option` VALUES (12438, '云龙区', '云龙区', 45, 12429, 19);
INSERT INTO `option` VALUES (12439, '铜山区', '铜山区', 50, 12429, 19);
INSERT INTO `option` VALUES (12440, '睢宁县', '睢宁县', 55, 12429, 19);
INSERT INTO `option` VALUES (12441, '沛县', '沛县', 60, 12429, 19);
INSERT INTO `option` VALUES (12442, '丰县', '丰县', 65, 12429, 19);
INSERT INTO `option` VALUES (12443, '连云港市', '连云港市', 15, 12416, 19);
INSERT INTO `option` VALUES (12444, '海州区', '海州区', 5, 12443, 19);
INSERT INTO `option` VALUES (12445, '新浦区', '新浦区', 10, 12443, 19);
INSERT INTO `option` VALUES (12446, '赣榆县', '赣榆县', 15, 12443, 19);
INSERT INTO `option` VALUES (12447, '连云区', '连云区', 20, 12443, 19);
INSERT INTO `option` VALUES (12448, '灌云县', '灌云县', 25, 12443, 19);
INSERT INTO `option` VALUES (12449, '东海县', '东海县', 30, 12443, 19);
INSERT INTO `option` VALUES (12450, '灌南县', '灌南县', 35, 12443, 19);
INSERT INTO `option` VALUES (12451, '淮安市', '淮安市', 20, 12416, 19);
INSERT INTO `option` VALUES (12452, '经济开发区', '经济开发区', 5, 12451, 19);
INSERT INTO `option` VALUES (12453, '楚州区', '楚州区', 10, 12451, 19);
INSERT INTO `option` VALUES (12454, '洪泽县', '洪泽县', 15, 12451, 19);
INSERT INTO `option` VALUES (12455, '金湖县', '金湖县', 20, 12451, 19);
INSERT INTO `option` VALUES (12456, '盱眙县', '盱眙县', 25, 12451, 19);
INSERT INTO `option` VALUES (12457, '清河区', '清河区', 30, 12451, 19);
INSERT INTO `option` VALUES (12458, '淮阴区', '淮阴区', 35, 12451, 19);
INSERT INTO `option` VALUES (12459, '清浦区', '清浦区', 40, 12451, 19);
INSERT INTO `option` VALUES (12460, '涟水县', '涟水县', 45, 12451, 19);
INSERT INTO `option` VALUES (12461, '宿迁市', '宿迁市', 25, 12416, 19);
INSERT INTO `option` VALUES (12462, '宿城区', '宿城区', 5, 12461, 19);
INSERT INTO `option` VALUES (12463, '沭阳县', '沭阳县', 10, 12461, 19);
INSERT INTO `option` VALUES (12464, '泗阳县', '泗阳县', 15, 12461, 19);
INSERT INTO `option` VALUES (12465, '宿豫区', '宿豫区', 20, 12461, 19);
INSERT INTO `option` VALUES (12466, '泗洪县', '泗洪县', 25, 12461, 19);
INSERT INTO `option` VALUES (12467, '宿迁经济开发区', '宿迁经济开发区', 30, 12461, 19);
INSERT INTO `option` VALUES (12468, '盐城市', '盐城市', 30, 12416, 19);
INSERT INTO `option` VALUES (12469, '射阳县', '射阳县', 5, 12468, 19);
INSERT INTO `option` VALUES (12470, '亭湖区', '亭湖区', 10, 12468, 19);
INSERT INTO `option` VALUES (12471, '盐都区', '盐都区', 15, 12468, 19);
INSERT INTO `option` VALUES (12472, '东台市', '东台市', 20, 12468, 19);
INSERT INTO `option` VALUES (12473, '大丰市', '大丰市', 25, 12468, 19);
INSERT INTO `option` VALUES (12474, '建湖县', '建湖县', 30, 12468, 19);
INSERT INTO `option` VALUES (12475, '响水县', '响水县', 35, 12468, 19);
INSERT INTO `option` VALUES (12476, '阜宁县', '阜宁县', 40, 12468, 19);
INSERT INTO `option` VALUES (12477, '滨海县', '滨海县', 45, 12468, 19);
INSERT INTO `option` VALUES (12478, '扬州市', '扬州市', 35, 12416, 19);
INSERT INTO `option` VALUES (12479, '广陵区', '广陵区', 5, 12478, 19);
INSERT INTO `option` VALUES (12480, '邗江区', '邗江区', 10, 12478, 19);
INSERT INTO `option` VALUES (12481, '宝应县', '宝应县', 15, 12478, 19);
INSERT INTO `option` VALUES (12482, '仪征市', '仪征市', 20, 12478, 19);
INSERT INTO `option` VALUES (12483, '高邮市', '高邮市', 25, 12478, 19);
INSERT INTO `option` VALUES (12484, '江都区', '江都区', 30, 12478, 19);
INSERT INTO `option` VALUES (12485, '泰州市', '泰州市', 40, 12416, 19);
INSERT INTO `option` VALUES (12486, '海陵区', '海陵区', 5, 12485, 19);
INSERT INTO `option` VALUES (12487, '高港区', '高港区', 10, 12485, 19);
INSERT INTO `option` VALUES (12488, '泰兴市', '泰兴市', 15, 12485, 19);
INSERT INTO `option` VALUES (12489, '靖江市', '靖江市', 20, 12485, 19);
INSERT INTO `option` VALUES (12490, '兴化市', '兴化市', 25, 12485, 19);
INSERT INTO `option` VALUES (12491, '姜堰市', '姜堰市', 30, 12485, 19);
INSERT INTO `option` VALUES (12492, '南通市', '南通市', 45, 12416, 19);
INSERT INTO `option` VALUES (12493, '港闸区', '港闸区', 5, 12492, 19);
INSERT INTO `option` VALUES (12494, '崇川区', '崇川区', 10, 12492, 19);
INSERT INTO `option` VALUES (12495, '通州区', '通州区', 15, 12492, 19);
INSERT INTO `option` VALUES (12496, '南通经济技术开发区', '南通经济技术开发区', 20, 12492, 19);
INSERT INTO `option` VALUES (12497, '如东县', '如东县', 25, 12492, 19);
INSERT INTO `option` VALUES (12498, '海安县', '海安县', 30, 12492, 19);
INSERT INTO `option` VALUES (12499, '如皋市', '如皋市', 35, 12492, 19);
INSERT INTO `option` VALUES (12500, '海门市', '海门市', 40, 12492, 19);
INSERT INTO `option` VALUES (12501, '启东市', '启东市', 45, 12492, 19);
INSERT INTO `option` VALUES (12502, '镇江市', '镇江市', 50, 12416, 19);
INSERT INTO `option` VALUES (12503, '润州区', '润州区', 5, 12502, 19);
INSERT INTO `option` VALUES (12504, '京口区', '京口区', 10, 12502, 19);
INSERT INTO `option` VALUES (12505, '丹徒区', '丹徒区', 15, 12502, 19);
INSERT INTO `option` VALUES (12506, '镇江新区', '镇江新区', 20, 12502, 19);
INSERT INTO `option` VALUES (12507, '丹阳市', '丹阳市', 25, 12502, 19);
INSERT INTO `option` VALUES (12508, '句容市', '句容市', 30, 12502, 19);
INSERT INTO `option` VALUES (12509, '扬中市', '扬中市', 35, 12502, 19);
INSERT INTO `option` VALUES (12510, '丹徒新区', '丹徒新区', 40, 12502, 19);
INSERT INTO `option` VALUES (12511, '常州市', '常州市', 55, 12416, 19);
INSERT INTO `option` VALUES (12512, '钟楼区', '钟楼区', 5, 12511, 19);
INSERT INTO `option` VALUES (12513, '天宁区', '天宁区', 10, 12511, 19);
INSERT INTO `option` VALUES (12514, '武进区', '武进区', 15, 12511, 19);
INSERT INTO `option` VALUES (12515, '新北区', '新北区', 20, 12511, 19);
INSERT INTO `option` VALUES (12516, '戚墅堰区', '戚墅堰区', 25, 12511, 19);
INSERT INTO `option` VALUES (12517, '金坛市', '金坛市', 30, 12511, 19);
INSERT INTO `option` VALUES (12518, '溧阳市', '溧阳市', 35, 12511, 19);
INSERT INTO `option` VALUES (12519, '无锡市', '无锡市', 60, 12416, 19);
INSERT INTO `option` VALUES (12520, '崇安区', '崇安区', 5, 12519, 19);
INSERT INTO `option` VALUES (12521, '南长区', '南长区', 10, 12519, 19);
INSERT INTO `option` VALUES (12522, '北塘区', '北塘区', 15, 12519, 19);
INSERT INTO `option` VALUES (12523, '锡山区', '锡山区', 20, 12519, 19);
INSERT INTO `option` VALUES (12524, '惠山区', '惠山区', 25, 12519, 19);
INSERT INTO `option` VALUES (12525, '新区', '新区', 30, 12519, 19);
INSERT INTO `option` VALUES (12526, '江阴市', '江阴市', 35, 12519, 19);
INSERT INTO `option` VALUES (12527, '宜兴市', '宜兴市', 40, 12519, 19);
INSERT INTO `option` VALUES (12528, '滨湖区', '滨湖区', 45, 12519, 19);
INSERT INTO `option` VALUES (12529, '苏州市', '苏州市', 65, 12416, 19);
INSERT INTO `option` VALUES (12530, '常熟市', '常熟市', 5, 12529, 19);
INSERT INTO `option` VALUES (12531, '张家港市', '张家港市', 10, 12529, 19);
INSERT INTO `option` VALUES (12532, '太仓市', '太仓市', 15, 12529, 19);
INSERT INTO `option` VALUES (12533, '相城区', '相城区', 20, 12529, 19);
INSERT INTO `option` VALUES (12534, '金阊区', '金阊区', 25, 12529, 19);
INSERT INTO `option` VALUES (12535, '虎丘区', '虎丘区', 30, 12529, 19);
INSERT INTO `option` VALUES (12536, '平江区', '平江区', 35, 12529, 19);
INSERT INTO `option` VALUES (12537, '沧浪区', '沧浪区', 40, 12529, 19);
INSERT INTO `option` VALUES (12538, '工业园区', '工业园区', 45, 12529, 19);
INSERT INTO `option` VALUES (12539, '高新区', '高新区', 50, 12529, 19);
INSERT INTO `option` VALUES (12540, '吴江区', '吴江区', 55, 12529, 19);
INSERT INTO `option` VALUES (12541, '吴中区', '吴中区', 60, 12529, 19);
INSERT INTO `option` VALUES (12542, '昆山市', '昆山市', 65, 12529, 19);
INSERT INTO `option` VALUES (12543, '山东省', '山东省', 65, 0, 19);
INSERT INTO `option` VALUES (12544, '济南市', '济南市', 5, 12543, 19);
INSERT INTO `option` VALUES (12545, '高新区', '高新区', 5, 12544, 19);
INSERT INTO `option` VALUES (12546, '长清区', '长清区', 10, 12544, 19);
INSERT INTO `option` VALUES (12547, '历城区', '历城区', 15, 12544, 19);
INSERT INTO `option` VALUES (12548, '天桥区', '天桥区', 20, 12544, 19);
INSERT INTO `option` VALUES (12549, '槐荫区', '槐荫区', 25, 12544, 19);
INSERT INTO `option` VALUES (12550, '历下区', '历下区', 30, 12544, 19);
INSERT INTO `option` VALUES (12551, '市中区', '市中区', 35, 12544, 19);
INSERT INTO `option` VALUES (12552, '章丘市', '章丘市', 40, 12544, 19);
INSERT INTO `option` VALUES (12553, '平阴县', '平阴县', 45, 12544, 19);
INSERT INTO `option` VALUES (12554, '济阳县', '济阳县', 50, 12544, 19);
INSERT INTO `option` VALUES (12555, '商河县', '商河县', 55, 12544, 19);
INSERT INTO `option` VALUES (12556, '青岛市', '青岛市', 10, 12543, 19);
INSERT INTO `option` VALUES (12557, '四方区', '四方区', 5, 12556, 19);
INSERT INTO `option` VALUES (12558, '市北区', '市北区', 10, 12556, 19);
INSERT INTO `option` VALUES (12559, '市南区', '市南区', 15, 12556, 19);
INSERT INTO `option` VALUES (12560, '黄岛区', '黄岛区', 20, 12556, 19);
INSERT INTO `option` VALUES (12561, '李沧区', '李沧区', 25, 12556, 19);
INSERT INTO `option` VALUES (12562, '即墨市', '即墨市', 30, 12556, 19);
INSERT INTO `option` VALUES (12563, '城阳区', '城阳区', 35, 12556, 19);
INSERT INTO `option` VALUES (12564, '崂山区', '崂山区', 40, 12556, 19);
INSERT INTO `option` VALUES (12565, '胶州市', '胶州市', 45, 12556, 19);
INSERT INTO `option` VALUES (12566, '平度市', '平度市', 50, 12556, 19);
INSERT INTO `option` VALUES (12567, '莱西市', '莱西市', 55, 12556, 19);
INSERT INTO `option` VALUES (12568, '淄博市', '淄博市', 15, 12543, 19);
INSERT INTO `option` VALUES (12569, '临淄区', '临淄区', 5, 12568, 19);
INSERT INTO `option` VALUES (12570, '张店区', '张店区', 10, 12568, 19);
INSERT INTO `option` VALUES (12571, '周村区', '周村区', 15, 12568, 19);
INSERT INTO `option` VALUES (12572, '淄川区', '淄川区', 20, 12568, 19);
INSERT INTO `option` VALUES (12573, '博山区', '博山区', 25, 12568, 19);
INSERT INTO `option` VALUES (12574, '高青县', '高青县', 30, 12568, 19);
INSERT INTO `option` VALUES (12575, '沂源县', '沂源县', 35, 12568, 19);
INSERT INTO `option` VALUES (12576, '桓台县', '桓台县', 40, 12568, 19);
INSERT INTO `option` VALUES (12577, '枣庄市', '枣庄市', 20, 12543, 19);
INSERT INTO `option` VALUES (12578, '滕州市', '滕州市', 5, 12577, 19);
INSERT INTO `option` VALUES (12579, '山亭区', '山亭区', 10, 12577, 19);
INSERT INTO `option` VALUES (12580, '台儿庄区', '台儿庄区', 15, 12577, 19);
INSERT INTO `option` VALUES (12581, '峄城区', '峄城区', 20, 12577, 19);
INSERT INTO `option` VALUES (12582, '薛城区', '薛城区', 25, 12577, 19);
INSERT INTO `option` VALUES (12583, '市中区', '市中区', 30, 12577, 19);
INSERT INTO `option` VALUES (12584, '东营市', '东营市', 25, 12543, 19);
INSERT INTO `option` VALUES (12585, '河口区', '河口区', 5, 12584, 19);
INSERT INTO `option` VALUES (12586, '广饶县', '广饶县', 10, 12584, 19);
INSERT INTO `option` VALUES (12587, '利津县', '利津县', 15, 12584, 19);
INSERT INTO `option` VALUES (12588, '垦利县', '垦利县', 20, 12584, 19);
INSERT INTO `option` VALUES (12589, '东营区', '东营区', 25, 12584, 19);
INSERT INTO `option` VALUES (12590, '潍坊市', '潍坊市', 30, 12543, 19);
INSERT INTO `option` VALUES (12591, '潍城区', '潍城区', 5, 12590, 19);
INSERT INTO `option` VALUES (12592, '奎文区', '奎文区', 10, 12590, 19);
INSERT INTO `option` VALUES (12593, '高新区', '高新区', 15, 12590, 19);
INSERT INTO `option` VALUES (12594, '寒亭区', '寒亭区', 20, 12590, 19);
INSERT INTO `option` VALUES (12595, '寿光市', '寿光市', 25, 12590, 19);
INSERT INTO `option` VALUES (12596, '青州市', '青州市', 30, 12590, 19);
INSERT INTO `option` VALUES (12597, '诸城市', '诸城市', 35, 12590, 19);
INSERT INTO `option` VALUES (12598, '安丘市', '安丘市', 40, 12590, 19);
INSERT INTO `option` VALUES (12599, '高密市', '高密市', 45, 12590, 19);
INSERT INTO `option` VALUES (12600, '昌邑市', '昌邑市', 50, 12590, 19);
INSERT INTO `option` VALUES (12601, '昌乐县', '昌乐县', 55, 12590, 19);
INSERT INTO `option` VALUES (12602, '临朐县', '临朐县', 60, 12590, 19);
INSERT INTO `option` VALUES (12603, '坊子区', '坊子区', 65, 12590, 19);
INSERT INTO `option` VALUES (12604, '烟台市', '烟台市', 35, 12543, 19);
INSERT INTO `option` VALUES (12605, '莱山区', '莱山区', 5, 12604, 19);
INSERT INTO `option` VALUES (12606, '芝罘区', '芝罘区', 10, 12604, 19);
INSERT INTO `option` VALUES (12607, '开发区', '开发区', 15, 12604, 19);
INSERT INTO `option` VALUES (12608, '福山区', '福山区', 20, 12604, 19);
INSERT INTO `option` VALUES (12609, '牟平区', '牟平区', 25, 12604, 19);
INSERT INTO `option` VALUES (12610, '龙口市', '龙口市', 30, 12604, 19);
INSERT INTO `option` VALUES (12611, '莱州市', '莱州市', 35, 12604, 19);
INSERT INTO `option` VALUES (12612, '莱阳市', '莱阳市', 40, 12604, 19);
INSERT INTO `option` VALUES (12613, '招远市', '招远市', 45, 12604, 19);
INSERT INTO `option` VALUES (12614, '蓬莱市', '蓬莱市', 50, 12604, 19);
INSERT INTO `option` VALUES (12615, '栖霞市', '栖霞市', 55, 12604, 19);
INSERT INTO `option` VALUES (12616, '海阳市', '海阳市', 60, 12604, 19);
INSERT INTO `option` VALUES (12617, '长岛县', '长岛县', 65, 12604, 19);
INSERT INTO `option` VALUES (12618, '威海市', '威海市', 40, 12543, 19);
INSERT INTO `option` VALUES (12619, '荣成市', '荣成市', 5, 12618, 19);
INSERT INTO `option` VALUES (12620, '文登市', '文登市', 10, 12618, 19);
INSERT INTO `option` VALUES (12621, '乳山市', '乳山市', 15, 12618, 19);
INSERT INTO `option` VALUES (12622, '环翠区', '环翠区', 20, 12618, 19);
INSERT INTO `option` VALUES (12623, '莱芜市', '莱芜市', 45, 12543, 19);
INSERT INTO `option` VALUES (12624, '莱城区', '莱城区', 5, 12623, 19);
INSERT INTO `option` VALUES (12625, '钢城区', '钢城区', 10, 12623, 19);
INSERT INTO `option` VALUES (12626, '德州市', '德州市', 50, 12543, 19);
INSERT INTO `option` VALUES (12627, '德城区', '德城区', 5, 12626, 19);
INSERT INTO `option` VALUES (12628, '临邑县', '临邑县', 10, 12626, 19);
INSERT INTO `option` VALUES (12629, '齐河县', '齐河县', 15, 12626, 19);
INSERT INTO `option` VALUES (12630, '乐陵市', '乐陵市', 20, 12626, 19);
INSERT INTO `option` VALUES (12631, '禹城市', '禹城市', 25, 12626, 19);
INSERT INTO `option` VALUES (12632, '陵县', '陵县', 30, 12626, 19);
INSERT INTO `option` VALUES (12633, '宁津县', '宁津县', 35, 12626, 19);
INSERT INTO `option` VALUES (12634, '武城县', '武城县', 40, 12626, 19);
INSERT INTO `option` VALUES (12635, '庆云县', '庆云县', 45, 12626, 19);
INSERT INTO `option` VALUES (12636, '平原县', '平原县', 50, 12626, 19);
INSERT INTO `option` VALUES (12637, '夏津县', '夏津县', 55, 12626, 19);
INSERT INTO `option` VALUES (12638, '临沂市', '临沂市', 55, 12543, 19);
INSERT INTO `option` VALUES (12639, '兰陵县', '兰陵县', 5, 12638, 19);
INSERT INTO `option` VALUES (12640, '兰山区', '兰山区', 10, 12638, 19);
INSERT INTO `option` VALUES (12641, '河东区', '河东区', 15, 12638, 19);
INSERT INTO `option` VALUES (12642, '沂南县', '沂南县', 20, 12638, 19);
INSERT INTO `option` VALUES (12643, '沂水县', '沂水县', 25, 12638, 19);
INSERT INTO `option` VALUES (12644, '费县', '费县', 30, 12638, 19);
INSERT INTO `option` VALUES (12645, '平邑县', '平邑县', 35, 12638, 19);
INSERT INTO `option` VALUES (12646, '蒙阴县', '蒙阴县', 40, 12638, 19);
INSERT INTO `option` VALUES (12647, '临沭县', '临沭县', 45, 12638, 19);
INSERT INTO `option` VALUES (12648, '莒南县', '莒南县', 50, 12638, 19);
INSERT INTO `option` VALUES (12649, '郯城县', '郯城县', 55, 12638, 19);
INSERT INTO `option` VALUES (12650, '罗庄区', '罗庄区', 60, 12638, 19);
INSERT INTO `option` VALUES (12651, '聊城市', '聊城市', 60, 12543, 19);
INSERT INTO `option` VALUES (12652, '东昌府区', '东昌府区', 5, 12651, 19);
INSERT INTO `option` VALUES (12653, '临清市', '临清市', 10, 12651, 19);
INSERT INTO `option` VALUES (12654, '阳谷县', '阳谷县', 15, 12651, 19);
INSERT INTO `option` VALUES (12655, '茌平县', '茌平县', 20, 12651, 19);
INSERT INTO `option` VALUES (12656, '莘县', '莘县', 25, 12651, 19);
INSERT INTO `option` VALUES (12657, '东阿县', '东阿县', 30, 12651, 19);
INSERT INTO `option` VALUES (12658, '冠县', '冠县', 35, 12651, 19);
INSERT INTO `option` VALUES (12659, '高唐县', '高唐县', 40, 12651, 19);
INSERT INTO `option` VALUES (12660, '滨州市', '滨州市', 65, 12543, 19);
INSERT INTO `option` VALUES (12661, '北海新区', '北海新区', 5, 12660, 19);
INSERT INTO `option` VALUES (12662, '滨城区', '滨城区', 10, 12660, 19);
INSERT INTO `option` VALUES (12663, '邹平县', '邹平县', 15, 12660, 19);
INSERT INTO `option` VALUES (12664, '沾化县', '沾化县', 20, 12660, 19);
INSERT INTO `option` VALUES (12665, '惠民县', '惠民县', 25, 12660, 19);
INSERT INTO `option` VALUES (12666, '博兴县', '博兴县', 30, 12660, 19);
INSERT INTO `option` VALUES (12667, '阳信县', '阳信县', 35, 12660, 19);
INSERT INTO `option` VALUES (12668, '无棣县', '无棣县', 40, 12660, 19);
INSERT INTO `option` VALUES (12669, '菏泽市', '菏泽市', 70, 12543, 19);
INSERT INTO `option` VALUES (12670, '牡丹区', '牡丹区', 5, 12669, 19);
INSERT INTO `option` VALUES (12671, '单县', '单县', 10, 12669, 19);
INSERT INTO `option` VALUES (12672, '曹县', '曹县', 15, 12669, 19);
INSERT INTO `option` VALUES (12673, '定陶县', '定陶县', 20, 12669, 19);
INSERT INTO `option` VALUES (12674, '巨野县', '巨野县', 25, 12669, 19);
INSERT INTO `option` VALUES (12675, '成武县', '成武县', 30, 12669, 19);
INSERT INTO `option` VALUES (12676, '东明县', '东明县', 35, 12669, 19);
INSERT INTO `option` VALUES (12677, '郓城县', '郓城县', 40, 12669, 19);
INSERT INTO `option` VALUES (12678, '鄄城县', '鄄城县', 45, 12669, 19);
INSERT INTO `option` VALUES (12679, '日照市', '日照市', 75, 12543, 19);
INSERT INTO `option` VALUES (12680, '岚山区', '岚山区', 5, 12679, 19);
INSERT INTO `option` VALUES (12681, '新市区', '新市区', 10, 12679, 19);
INSERT INTO `option` VALUES (12682, '五莲县', '五莲县', 15, 12679, 19);
INSERT INTO `option` VALUES (12683, '东港区', '东港区', 20, 12679, 19);
INSERT INTO `option` VALUES (12684, '莒县', '莒县', 25, 12679, 19);
INSERT INTO `option` VALUES (12685, '泰安市', '泰安市', 80, 12543, 19);
INSERT INTO `option` VALUES (12686, '东平县', '东平县', 5, 12685, 19);
INSERT INTO `option` VALUES (12687, '岱岳区', '岱岳区', 10, 12685, 19);
INSERT INTO `option` VALUES (12688, '泰山区', '泰山区', 15, 12685, 19);
INSERT INTO `option` VALUES (12689, '肥城市', '肥城市', 20, 12685, 19);
INSERT INTO `option` VALUES (12690, '新泰市', '新泰市', 25, 12685, 19);
INSERT INTO `option` VALUES (12691, '宁阳县', '宁阳县', 30, 12685, 19);
INSERT INTO `option` VALUES (12692, '济宁市', '济宁市', 85, 12543, 19);
INSERT INTO `option` VALUES (12693, '梁山县', '梁山县', 5, 12692, 19);
INSERT INTO `option` VALUES (12694, '兖州市', '兖州市', 10, 12692, 19);
INSERT INTO `option` VALUES (12695, '微山县', '微山县', 15, 12692, 19);
INSERT INTO `option` VALUES (12696, '汶上县', '汶上县', 20, 12692, 19);
INSERT INTO `option` VALUES (12697, '泗水县', '泗水县', 25, 12692, 19);
INSERT INTO `option` VALUES (12698, '嘉祥县', '嘉祥县', 30, 12692, 19);
INSERT INTO `option` VALUES (12699, '鱼台县', '鱼台县', 35, 12692, 19);
INSERT INTO `option` VALUES (12700, '金乡县', '金乡县', 40, 12692, 19);
INSERT INTO `option` VALUES (12701, '邹城市', '邹城市', 45, 12692, 19);
INSERT INTO `option` VALUES (12702, '市中区', '市中区', 50, 12692, 19);
INSERT INTO `option` VALUES (12703, '曲阜市', '曲阜市', 55, 12692, 19);
INSERT INTO `option` VALUES (12704, '高新区', '高新区', 60, 12692, 19);
INSERT INTO `option` VALUES (12705, '任城区', '任城区', 65, 12692, 19);
INSERT INTO `option` VALUES (12706, '安徽省', '安徽省', 70, 0, 19);
INSERT INTO `option` VALUES (12707, '铜陵市', '铜陵市', 5, 12706, 19);
INSERT INTO `option` VALUES (12708, '铜官山区', '铜官山区', 5, 12707, 19);
INSERT INTO `option` VALUES (12709, '郊区', '郊区', 10, 12707, 19);
INSERT INTO `option` VALUES (12710, '狮子山区', '狮子山区', 15, 12707, 19);
INSERT INTO `option` VALUES (12711, '铜陵县', '铜陵县', 20, 12707, 19);
INSERT INTO `option` VALUES (12712, '合肥市', '合肥市', 10, 12706, 19);
INSERT INTO `option` VALUES (12713, '包河区', '包河区', 5, 12712, 19);
INSERT INTO `option` VALUES (12714, '蜀山区', '蜀山区', 10, 12712, 19);
INSERT INTO `option` VALUES (12715, '瑶海区', '瑶海区', 15, 12712, 19);
INSERT INTO `option` VALUES (12716, '庐阳区', '庐阳区', 20, 12712, 19);
INSERT INTO `option` VALUES (12717, '滨湖新区', '滨湖新区', 25, 12712, 19);
INSERT INTO `option` VALUES (12718, '经济技术开发区', '经济技术开发区', 30, 12712, 19);
INSERT INTO `option` VALUES (12719, '高新技术开发区', '高新技术开发区', 35, 12712, 19);
INSERT INTO `option` VALUES (12720, '新站综合开发试验区', '新站综合开发试验区', 40, 12712, 19);
INSERT INTO `option` VALUES (12721, '肥西县', '肥西县', 45, 12712, 19);
INSERT INTO `option` VALUES (12722, '政务文化新区', '政务文化新区', 50, 12712, 19);
INSERT INTO `option` VALUES (12723, '巢湖市', '巢湖市', 55, 12712, 19);
INSERT INTO `option` VALUES (12724, '长丰县', '长丰县', 60, 12712, 19);
INSERT INTO `option` VALUES (12725, '肥东县', '肥东县', 65, 12712, 19);
INSERT INTO `option` VALUES (12726, '庐江县', '庐江县', 70, 12712, 19);
INSERT INTO `option` VALUES (12727, '北城新区', '北城新区', 75, 12712, 19);
INSERT INTO `option` VALUES (12728, '淮南市', '淮南市', 15, 12706, 19);
INSERT INTO `option` VALUES (12729, '淮南高新技术开发区', '淮南高新技术开发区', 5, 12728, 19);
INSERT INTO `option` VALUES (12730, '田家庵区', '田家庵区', 10, 12728, 19);
INSERT INTO `option` VALUES (12731, '大通区', '大通区', 15, 12728, 19);
INSERT INTO `option` VALUES (12732, '谢家集区', '谢家集区', 20, 12728, 19);
INSERT INTO `option` VALUES (12733, '八公山区', '八公山区', 25, 12728, 19);
INSERT INTO `option` VALUES (12734, '凤台县', '凤台县', 30, 12728, 19);
INSERT INTO `option` VALUES (12735, '潘集区', '潘集区', 35, 12728, 19);
INSERT INTO `option` VALUES (12736, '淮北市', '淮北市', 20, 12706, 19);
INSERT INTO `option` VALUES (12737, '杜集区', '杜集区', 5, 12736, 19);
INSERT INTO `option` VALUES (12738, '烈山区', '烈山区', 10, 12736, 19);
INSERT INTO `option` VALUES (12739, '濉溪县', '濉溪县', 15, 12736, 19);
INSERT INTO `option` VALUES (12740, '相山区', '相山区', 20, 12736, 19);
INSERT INTO `option` VALUES (12741, '芜湖市', '芜湖市', 25, 12706, 19);
INSERT INTO `option` VALUES (12742, '镜湖区', '镜湖区', 5, 12741, 19);
INSERT INTO `option` VALUES (12743, '弋江区', '弋江区', 10, 12741, 19);
INSERT INTO `option` VALUES (12744, '无为县', '无为县', 15, 12741, 19);
INSERT INTO `option` VALUES (12745, '芜湖县', '芜湖县', 20, 12741, 19);
INSERT INTO `option` VALUES (12746, '繁昌县', '繁昌县', 25, 12741, 19);
INSERT INTO `option` VALUES (12747, '南陵县', '南陵县', 30, 12741, 19);
INSERT INTO `option` VALUES (12748, '鸠江区', '鸠江区', 35, 12741, 19);
INSERT INTO `option` VALUES (12749, '三山区', '三山区', 40, 12741, 19);
INSERT INTO `option` VALUES (12750, '蚌埠市', '蚌埠市', 30, 12706, 19);
INSERT INTO `option` VALUES (12751, '蚌山区', '蚌山区', 5, 12750, 19);
INSERT INTO `option` VALUES (12752, '怀远县', '怀远县', 10, 12750, 19);
INSERT INTO `option` VALUES (12753, '固镇县', '固镇县', 15, 12750, 19);
INSERT INTO `option` VALUES (12754, '五河县', '五河县', 20, 12750, 19);
INSERT INTO `option` VALUES (12755, '淮上区', '淮上区', 25, 12750, 19);
INSERT INTO `option` VALUES (12756, '龙子湖区', '龙子湖区', 30, 12750, 19);
INSERT INTO `option` VALUES (12757, '禹会区', '禹会区', 35, 12750, 19);
INSERT INTO `option` VALUES (12758, '马鞍山市', '马鞍山市', 35, 12706, 19);
INSERT INTO `option` VALUES (12759, '博望区', '博望区', 5, 12758, 19);
INSERT INTO `option` VALUES (12760, '花山区', '花山区', 10, 12758, 19);
INSERT INTO `option` VALUES (12761, '雨山区', '雨山区', 15, 12758, 19);
INSERT INTO `option` VALUES (12762, '当涂县', '当涂县', 20, 12758, 19);
INSERT INTO `option` VALUES (12763, '含山县', '含山县', 25, 12758, 19);
INSERT INTO `option` VALUES (12764, '和县', '和县', 30, 12758, 19);
INSERT INTO `option` VALUES (12765, '安庆市', '安庆市', 40, 12706, 19);
INSERT INTO `option` VALUES (12766, '桐城市', '桐城市', 5, 12765, 19);
INSERT INTO `option` VALUES (12767, '宿松县', '宿松县', 10, 12765, 19);
INSERT INTO `option` VALUES (12768, '枞阳县', '枞阳县', 15, 12765, 19);
INSERT INTO `option` VALUES (12769, '太湖县', '太湖县', 20, 12765, 19);
INSERT INTO `option` VALUES (12770, '怀宁县', '怀宁县', 25, 12765, 19);
INSERT INTO `option` VALUES (12771, '岳西县', '岳西县', 30, 12765, 19);
INSERT INTO `option` VALUES (12772, '望江县', '望江县', 35, 12765, 19);
INSERT INTO `option` VALUES (12773, '潜山县', '潜山县', 40, 12765, 19);
INSERT INTO `option` VALUES (12774, '大观区', '大观区', 45, 12765, 19);
INSERT INTO `option` VALUES (12775, '宜秀区', '宜秀区', 50, 12765, 19);
INSERT INTO `option` VALUES (12776, '迎江区', '迎江区', 55, 12765, 19);
INSERT INTO `option` VALUES (12777, '开发区', '开发区', 60, 12765, 19);
INSERT INTO `option` VALUES (12778, '黄山市', '黄山市', 45, 12706, 19);
INSERT INTO `option` VALUES (12779, '徽州区', '徽州区', 5, 12778, 19);
INSERT INTO `option` VALUES (12780, '屯溪区', '屯溪区', 10, 12778, 19);
INSERT INTO `option` VALUES (12781, '休宁县', '休宁县', 15, 12778, 19);
INSERT INTO `option` VALUES (12782, '歙县', '歙县', 20, 12778, 19);
INSERT INTO `option` VALUES (12783, '黟县', '黟县', 25, 12778, 19);
INSERT INTO `option` VALUES (12784, '祁门县', '祁门县', 30, 12778, 19);
INSERT INTO `option` VALUES (12785, '黄山区', '黄山区', 35, 12778, 19);
INSERT INTO `option` VALUES (12786, '滁州市', '滁州市', 50, 12706, 19);
INSERT INTO `option` VALUES (12787, '琅琊区', '琅琊区', 5, 12786, 19);
INSERT INTO `option` VALUES (12788, '天长市', '天长市', 10, 12786, 19);
INSERT INTO `option` VALUES (12789, '明光市', '明光市', 15, 12786, 19);
INSERT INTO `option` VALUES (12790, '全椒县', '全椒县', 20, 12786, 19);
INSERT INTO `option` VALUES (12791, '来安县', '来安县', 25, 12786, 19);
INSERT INTO `option` VALUES (12792, '南谯区', '南谯区', 30, 12786, 19);
INSERT INTO `option` VALUES (12793, '定远县', '定远县', 35, 12786, 19);
INSERT INTO `option` VALUES (12794, '凤阳县', '凤阳县', 40, 12786, 19);
INSERT INTO `option` VALUES (12795, '阜阳市', '阜阳市', 55, 12706, 19);
INSERT INTO `option` VALUES (12796, '经济开发区', '经济开发区', 5, 12795, 19);
INSERT INTO `option` VALUES (12797, '界首市', '界首市', 10, 12795, 19);
INSERT INTO `option` VALUES (12798, '太和县', '太和县', 15, 12795, 19);
INSERT INTO `option` VALUES (12799, '阜南县', '阜南县', 20, 12795, 19);
INSERT INTO `option` VALUES (12800, '颍上县', '颍上县', 25, 12795, 19);
INSERT INTO `option` VALUES (12801, '临泉县', '临泉县', 30, 12795, 19);
INSERT INTO `option` VALUES (12802, '颍泉区', '颍泉区', 35, 12795, 19);
INSERT INTO `option` VALUES (12803, '颍州区', '颍州区', 40, 12795, 19);
INSERT INTO `option` VALUES (12804, '颍东区', '颍东区', 45, 12795, 19);
INSERT INTO `option` VALUES (12805, '亳州市', '亳州市', 60, 12706, 19);
INSERT INTO `option` VALUES (12806, '利辛县', '利辛县', 5, 12805, 19);
INSERT INTO `option` VALUES (12807, '蒙城县', '蒙城县', 10, 12805, 19);
INSERT INTO `option` VALUES (12808, '涡阳县', '涡阳县', 15, 12805, 19);
INSERT INTO `option` VALUES (12809, '谯城区', '谯城区', 20, 12805, 19);
INSERT INTO `option` VALUES (12810, '宿州市', '宿州市', 65, 12706, 19);
INSERT INTO `option` VALUES (12811, '经济开发区', '经济开发区', 5, 12810, 19);
INSERT INTO `option` VALUES (12812, '埇桥区', '埇桥区', 10, 12810, 19);
INSERT INTO `option` VALUES (12813, '灵璧县', '灵璧县', 15, 12810, 19);
INSERT INTO `option` VALUES (12814, '泗县', '泗县', 20, 12810, 19);
INSERT INTO `option` VALUES (12815, '萧县', '萧县', 25, 12810, 19);
INSERT INTO `option` VALUES (12816, '砀山县', '砀山县', 30, 12810, 19);
INSERT INTO `option` VALUES (12817, '池州市', '池州市', 70, 12706, 19);
INSERT INTO `option` VALUES (12818, '贵池区', '贵池区', 5, 12817, 19);
INSERT INTO `option` VALUES (12819, '东至县', '东至县', 10, 12817, 19);
INSERT INTO `option` VALUES (12820, '石台县', '石台县', 15, 12817, 19);
INSERT INTO `option` VALUES (12821, '青阳县', '青阳县', 20, 12817, 19);
INSERT INTO `option` VALUES (12822, '六安市', '六安市', 75, 12706, 19);
INSERT INTO `option` VALUES (12823, '寿县', '寿县', 5, 12822, 19);
INSERT INTO `option` VALUES (12824, '霍山县', '霍山县', 10, 12822, 19);
INSERT INTO `option` VALUES (12825, '金寨县', '金寨县', 15, 12822, 19);
INSERT INTO `option` VALUES (12826, '霍邱县', '霍邱县', 20, 12822, 19);
INSERT INTO `option` VALUES (12827, '舒城县', '舒城县', 25, 12822, 19);
INSERT INTO `option` VALUES (12828, '金安区', '金安区', 30, 12822, 19);
INSERT INTO `option` VALUES (12829, '裕安区', '裕安区', 35, 12822, 19);
INSERT INTO `option` VALUES (12830, '宣城市', '宣城市', 80, 12706, 19);
INSERT INTO `option` VALUES (12831, '旌德县', '旌德县', 5, 12830, 19);
INSERT INTO `option` VALUES (12832, '宁国市', '宁国市', 10, 12830, 19);
INSERT INTO `option` VALUES (12833, '郎溪县', '郎溪县', 15, 12830, 19);
INSERT INTO `option` VALUES (12834, '广德县', '广德县', 20, 12830, 19);
INSERT INTO `option` VALUES (12835, '绩溪县', '绩溪县', 25, 12830, 19);
INSERT INTO `option` VALUES (12836, '泾县', '泾县', 30, 12830, 19);
INSERT INTO `option` VALUES (12837, '宣州区', '宣州区', 35, 12830, 19);
INSERT INTO `option` VALUES (12838, '浙江省', '浙江省', 75, 0, 19);
INSERT INTO `option` VALUES (12839, '宁波市', '宁波市', 5, 12838, 19);
INSERT INTO `option` VALUES (12840, '海曙区', '海曙区', 5, 12839, 19);
INSERT INTO `option` VALUES (12841, '江东区', '江东区', 10, 12839, 19);
INSERT INTO `option` VALUES (12842, '高新科技开发区', '高新科技开发区', 15, 12839, 19);
INSERT INTO `option` VALUES (12843, '慈溪市', '慈溪市', 20, 12839, 19);
INSERT INTO `option` VALUES (12844, '北仑区', '北仑区', 25, 12839, 19);
INSERT INTO `option` VALUES (12845, '镇海区', '镇海区', 30, 12839, 19);
INSERT INTO `option` VALUES (12846, '鄞州区', '鄞州区', 35, 12839, 19);
INSERT INTO `option` VALUES (12847, '江北区', '江北区', 40, 12839, 19);
INSERT INTO `option` VALUES (12848, '余姚市', '余姚市', 45, 12839, 19);
INSERT INTO `option` VALUES (12849, '奉化市', '奉化市', 50, 12839, 19);
INSERT INTO `option` VALUES (12850, '宁海县', '宁海县', 55, 12839, 19);
INSERT INTO `option` VALUES (12851, '象山县', '象山县', 60, 12839, 19);
INSERT INTO `option` VALUES (12852, '杭州市', '杭州市', 10, 12838, 19);
INSERT INTO `option` VALUES (12853, '上城区', '上城区', 5, 12852, 19);
INSERT INTO `option` VALUES (12854, '下城区', '下城区', 10, 12852, 19);
INSERT INTO `option` VALUES (12855, '拱墅区', '拱墅区', 15, 12852, 19);
INSERT INTO `option` VALUES (12856, '西湖区', '西湖区', 20, 12852, 19);
INSERT INTO `option` VALUES (12857, '江干区', '江干区', 25, 12852, 19);
INSERT INTO `option` VALUES (12858, '下沙区', '下沙区', 30, 12852, 19);
INSERT INTO `option` VALUES (12859, '余杭区', '余杭区', 35, 12852, 19);
INSERT INTO `option` VALUES (12860, '萧山区', '萧山区', 40, 12852, 19);
INSERT INTO `option` VALUES (12861, '滨江区', '滨江区', 45, 12852, 19);
INSERT INTO `option` VALUES (12862, '临安市', '临安市', 50, 12852, 19);
INSERT INTO `option` VALUES (12863, '富阳市', '富阳市', 55, 12852, 19);
INSERT INTO `option` VALUES (12864, '桐庐县', '桐庐县', 60, 12852, 19);
INSERT INTO `option` VALUES (12865, '建德市', '建德市', 65, 12852, 19);
INSERT INTO `option` VALUES (12866, '淳安县', '淳安县', 70, 12852, 19);
INSERT INTO `option` VALUES (12867, '温州市', '温州市', 15, 12838, 19);
INSERT INTO `option` VALUES (12868, '龙湾区', '龙湾区', 5, 12867, 19);
INSERT INTO `option` VALUES (12869, '茶山高教园区', '茶山高教园区', 10, 12867, 19);
INSERT INTO `option` VALUES (12870, '瑞安市', '瑞安市', 15, 12867, 19);
INSERT INTO `option` VALUES (12871, '乐清市', '乐清市', 20, 12867, 19);
INSERT INTO `option` VALUES (12872, '鹿城区', '鹿城区', 25, 12867, 19);
INSERT INTO `option` VALUES (12873, '瓯海区', '瓯海区', 30, 12867, 19);
INSERT INTO `option` VALUES (12874, '永嘉县', '永嘉县', 35, 12867, 19);
INSERT INTO `option` VALUES (12875, '文成县', '文成县', 40, 12867, 19);
INSERT INTO `option` VALUES (12876, '平阳县', '平阳县', 45, 12867, 19);
INSERT INTO `option` VALUES (12877, '泰顺县', '泰顺县', 50, 12867, 19);
INSERT INTO `option` VALUES (12878, '洞头县', '洞头县', 55, 12867, 19);
INSERT INTO `option` VALUES (12879, '苍南县', '苍南县', 60, 12867, 19);
INSERT INTO `option` VALUES (12880, '嘉兴市', '嘉兴市', 20, 12838, 19);
INSERT INTO `option` VALUES (12881, '桐乡市', '桐乡市', 5, 12880, 19);
INSERT INTO `option` VALUES (12882, '平湖市', '平湖市', 10, 12880, 19);
INSERT INTO `option` VALUES (12883, '嘉善县', '嘉善县', 15, 12880, 19);
INSERT INTO `option` VALUES (12884, '南湖区', '南湖区', 20, 12880, 19);
INSERT INTO `option` VALUES (12885, '秀洲区', '秀洲区', 25, 12880, 19);
INSERT INTO `option` VALUES (12886, '海宁市', '海宁市', 30, 12880, 19);
INSERT INTO `option` VALUES (12887, '海盐县', '海盐县', 35, 12880, 19);
INSERT INTO `option` VALUES (12888, '湖州市', '湖州市', 25, 12838, 19);
INSERT INTO `option` VALUES (12889, '南浔区', '南浔区', 5, 12888, 19);
INSERT INTO `option` VALUES (12890, '吴兴区', '吴兴区', 10, 12888, 19);
INSERT INTO `option` VALUES (12891, '长兴县', '长兴县', 15, 12888, 19);
INSERT INTO `option` VALUES (12892, '德清县', '德清县', 20, 12888, 19);
INSERT INTO `option` VALUES (12893, '安吉县', '安吉县', 25, 12888, 19);
INSERT INTO `option` VALUES (12894, '绍兴市', '绍兴市', 30, 12838, 19);
INSERT INTO `option` VALUES (12895, '柯桥区', '柯桥区', 5, 12894, 19);
INSERT INTO `option` VALUES (12896, '越城区', '越城区', 10, 12894, 19);
INSERT INTO `option` VALUES (12897, '诸暨市', '诸暨市', 15, 12894, 19);
INSERT INTO `option` VALUES (12898, '上虞区', '上虞区', 20, 12894, 19);
INSERT INTO `option` VALUES (12899, '嵊州市', '嵊州市', 25, 12894, 19);
INSERT INTO `option` VALUES (12900, '新昌县', '新昌县', 30, 12894, 19);
INSERT INTO `option` VALUES (12901, '金华市', '金华市', 35, 12838, 19);
INSERT INTO `option` VALUES (12902, '金东区', '金东区', 5, 12901, 19);
INSERT INTO `option` VALUES (12903, '婺城区', '婺城区', 10, 12901, 19);
INSERT INTO `option` VALUES (12904, '兰溪市', '兰溪市', 15, 12901, 19);
INSERT INTO `option` VALUES (12905, '武义县', '武义县', 20, 12901, 19);
INSERT INTO `option` VALUES (12906, '浦江县', '浦江县', 25, 12901, 19);
INSERT INTO `option` VALUES (12907, '磐安县', '磐安县', 30, 12901, 19);
INSERT INTO `option` VALUES (12908, '义乌市', '义乌市', 35, 12901, 19);
INSERT INTO `option` VALUES (12909, '永康市', '永康市', 40, 12901, 19);
INSERT INTO `option` VALUES (12910, '东阳市', '东阳市', 45, 12901, 19);
INSERT INTO `option` VALUES (12911, '衢州市', '衢州市', 40, 12838, 19);
INSERT INTO `option` VALUES (12912, '柯城区', '柯城区', 5, 12911, 19);
INSERT INTO `option` VALUES (12913, '衢江区', '衢江区', 10, 12911, 19);
INSERT INTO `option` VALUES (12914, '江山市', '江山市', 15, 12911, 19);
INSERT INTO `option` VALUES (12915, '常山县', '常山县', 20, 12911, 19);
INSERT INTO `option` VALUES (12916, '开化县', '开化县', 25, 12911, 19);
INSERT INTO `option` VALUES (12917, '龙游县', '龙游县', 30, 12911, 19);
INSERT INTO `option` VALUES (12918, '丽水市', '丽水市', 45, 12838, 19);
INSERT INTO `option` VALUES (12919, '龙泉市', '龙泉市', 5, 12918, 19);
INSERT INTO `option` VALUES (12920, '缙云县', '缙云县', 10, 12918, 19);
INSERT INTO `option` VALUES (12921, '遂昌县', '遂昌县', 15, 12918, 19);
INSERT INTO `option` VALUES (12922, '松阳县', '松阳县', 20, 12918, 19);
INSERT INTO `option` VALUES (12923, '景宁县', '景宁县', 25, 12918, 19);
INSERT INTO `option` VALUES (12924, '云和县', '云和县', 30, 12918, 19);
INSERT INTO `option` VALUES (12925, '青田县', '青田县', 35, 12918, 19);
INSERT INTO `option` VALUES (12926, '莲都区', '莲都区', 40, 12918, 19);
INSERT INTO `option` VALUES (12927, '庆元县', '庆元县', 45, 12918, 19);
INSERT INTO `option` VALUES (12928, '台州市', '台州市', 50, 12838, 19);
INSERT INTO `option` VALUES (12929, '临海市', '临海市', 5, 12928, 19);
INSERT INTO `option` VALUES (12930, '三门县', '三门县', 10, 12928, 19);
INSERT INTO `option` VALUES (12931, '天台县', '天台县', 15, 12928, 19);
INSERT INTO `option` VALUES (12932, '仙居县', '仙居县', 20, 12928, 19);
INSERT INTO `option` VALUES (12933, '黄岩区', '黄岩区', 25, 12928, 19);
INSERT INTO `option` VALUES (12934, '椒江区', '椒江区', 30, 12928, 19);
INSERT INTO `option` VALUES (12935, '路桥区', '路桥区', 35, 12928, 19);
INSERT INTO `option` VALUES (12936, '温岭市', '温岭市', 40, 12928, 19);
INSERT INTO `option` VALUES (12937, '玉环县', '玉环县', 45, 12928, 19);
INSERT INTO `option` VALUES (12938, '舟山市', '舟山市', 55, 12838, 19);
INSERT INTO `option` VALUES (12939, '岱山县', '岱山县', 5, 12938, 19);
INSERT INTO `option` VALUES (12940, '嵊泗县', '嵊泗县', 10, 12938, 19);
INSERT INTO `option` VALUES (12941, '普陀区', '普陀区', 15, 12938, 19);
INSERT INTO `option` VALUES (12942, '定海区', '定海区', 20, 12938, 19);
INSERT INTO `option` VALUES (12943, '福建省', '福建省', 80, 0, 19);
INSERT INTO `option` VALUES (12944, '福州市', '福州市', 5, 12943, 19);
INSERT INTO `option` VALUES (12945, '台江区', '台江区', 5, 12944, 19);
INSERT INTO `option` VALUES (12946, '鼓楼区', '鼓楼区', 10, 12944, 19);
INSERT INTO `option` VALUES (12947, '晋安区', '晋安区', 15, 12944, 19);
INSERT INTO `option` VALUES (12948, '仓山区', '仓山区', 20, 12944, 19);
INSERT INTO `option` VALUES (12949, '马尾区', '马尾区', 25, 12944, 19);
INSERT INTO `option` VALUES (12950, '福清市', '福清市', 30, 12944, 19);
INSERT INTO `option` VALUES (12951, '闽侯县', '闽侯县', 35, 12944, 19);
INSERT INTO `option` VALUES (12952, '长乐市', '长乐市', 40, 12944, 19);
INSERT INTO `option` VALUES (12953, '平潭县', '平潭县', 45, 12944, 19);
INSERT INTO `option` VALUES (12954, '连江县', '连江县', 50, 12944, 19);
INSERT INTO `option` VALUES (12955, '罗源县', '罗源县', 55, 12944, 19);
INSERT INTO `option` VALUES (12956, '永泰县', '永泰县', 60, 12944, 19);
INSERT INTO `option` VALUES (12957, '闽清县', '闽清县', 65, 12944, 19);
INSERT INTO `option` VALUES (12958, '厦门市', '厦门市', 10, 12943, 19);
INSERT INTO `option` VALUES (12959, '思明区', '思明区', 5, 12958, 19);
INSERT INTO `option` VALUES (12960, '湖里区', '湖里区', 10, 12958, 19);
INSERT INTO `option` VALUES (12961, '翔安区', '翔安区', 15, 12958, 19);
INSERT INTO `option` VALUES (12962, '海沧区', '海沧区', 20, 12958, 19);
INSERT INTO `option` VALUES (12963, '集美区', '集美区', 25, 12958, 19);
INSERT INTO `option` VALUES (12964, '同安区', '同安区', 30, 12958, 19);
INSERT INTO `option` VALUES (12965, '三明市', '三明市', 15, 12943, 19);
INSERT INTO `option` VALUES (12966, '永安市', '永安市', 5, 12965, 19);
INSERT INTO `option` VALUES (12967, '明溪县', '明溪县', 10, 12965, 19);
INSERT INTO `option` VALUES (12968, '将乐县', '将乐县', 15, 12965, 19);
INSERT INTO `option` VALUES (12969, '大田县', '大田县', 20, 12965, 19);
INSERT INTO `option` VALUES (12970, '宁化县', '宁化县', 25, 12965, 19);
INSERT INTO `option` VALUES (12971, '建宁县', '建宁县', 30, 12965, 19);
INSERT INTO `option` VALUES (12972, '沙县', '沙县', 35, 12965, 19);
INSERT INTO `option` VALUES (12973, '尤溪县', '尤溪县', 40, 12965, 19);
INSERT INTO `option` VALUES (12974, '清流县', '清流县', 45, 12965, 19);
INSERT INTO `option` VALUES (12975, '泰宁县', '泰宁县', 50, 12965, 19);
INSERT INTO `option` VALUES (12976, '梅列区', '梅列区', 55, 12965, 19);
INSERT INTO `option` VALUES (12977, '三元区', '三元区', 60, 12965, 19);
INSERT INTO `option` VALUES (12978, '莆田市', '莆田市', 20, 12943, 19);
INSERT INTO `option` VALUES (12979, '仙游县', '仙游县', 5, 12978, 19);
INSERT INTO `option` VALUES (12980, '城厢区', '城厢区', 10, 12978, 19);
INSERT INTO `option` VALUES (12981, '荔城区', '荔城区', 15, 12978, 19);
INSERT INTO `option` VALUES (12982, '秀屿区', '秀屿区', 20, 12978, 19);
INSERT INTO `option` VALUES (12983, '涵江区', '涵江区', 25, 12978, 19);
INSERT INTO `option` VALUES (12984, '泉州市', '泉州市', 25, 12943, 19);
INSERT INTO `option` VALUES (12985, '泉港区', '泉港区', 5, 12984, 19);
INSERT INTO `option` VALUES (12986, '石狮市', '石狮市', 10, 12984, 19);
INSERT INTO `option` VALUES (12987, '南安市', '南安市', 15, 12984, 19);
INSERT INTO `option` VALUES (12988, '惠安县', '惠安县', 20, 12984, 19);
INSERT INTO `option` VALUES (12989, '安溪县', '安溪县', 25, 12984, 19);
INSERT INTO `option` VALUES (12990, '德化县', '德化县', 30, 12984, 19);
INSERT INTO `option` VALUES (12991, '永春县', '永春县', 35, 12984, 19);
INSERT INTO `option` VALUES (12992, '金门县', '金门县', 40, 12984, 19);
INSERT INTO `option` VALUES (12993, '洛江区', '洛江区', 45, 12984, 19);
INSERT INTO `option` VALUES (12994, '鲤城区', '鲤城区', 50, 12984, 19);
INSERT INTO `option` VALUES (12995, '丰泽区', '丰泽区', 55, 12984, 19);
INSERT INTO `option` VALUES (12996, '晋江市', '晋江市', 60, 12984, 19);
INSERT INTO `option` VALUES (12997, '漳州市', '漳州市', 30, 12943, 19);
INSERT INTO `option` VALUES (12998, '芗城区', '芗城区', 5, 12997, 19);
INSERT INTO `option` VALUES (12999, '龙文区', '龙文区', 10, 12997, 19);
INSERT INTO `option` VALUES (13000, '龙海市', '龙海市', 15, 12997, 19);
INSERT INTO `option` VALUES (13001, '平和县', '平和县', 20, 12997, 19);
INSERT INTO `option` VALUES (13002, '南靖县', '南靖县', 25, 12997, 19);
INSERT INTO `option` VALUES (13003, '诏安县', '诏安县', 30, 12997, 19);
INSERT INTO `option` VALUES (13004, '漳浦县', '漳浦县', 35, 12997, 19);
INSERT INTO `option` VALUES (13005, '华安县', '华安县', 40, 12997, 19);
INSERT INTO `option` VALUES (13006, '云霄县', '云霄县', 45, 12997, 19);
INSERT INTO `option` VALUES (13007, '东山县', '东山县', 50, 12997, 19);
INSERT INTO `option` VALUES (13008, '长泰县', '长泰县', 55, 12997, 19);
INSERT INTO `option` VALUES (13009, '南平市', '南平市', 35, 12943, 19);
INSERT INTO `option` VALUES (13010, '建瓯市', '建瓯市', 5, 13009, 19);
INSERT INTO `option` VALUES (13011, '邵武市', '邵武市', 10, 13009, 19);
INSERT INTO `option` VALUES (13012, '武夷山市', '武夷山市', 15, 13009, 19);
INSERT INTO `option` VALUES (13013, '建阳市', '建阳市', 20, 13009, 19);
INSERT INTO `option` VALUES (13014, '松溪县', '松溪县', 25, 13009, 19);
INSERT INTO `option` VALUES (13015, '顺昌县', '顺昌县', 30, 13009, 19);
INSERT INTO `option` VALUES (13016, '浦城县', '浦城县', 35, 13009, 19);
INSERT INTO `option` VALUES (13017, '政和县', '政和县', 40, 13009, 19);
INSERT INTO `option` VALUES (13018, '光泽县', '光泽县', 45, 13009, 19);
INSERT INTO `option` VALUES (13019, '延平区', '延平区', 50, 13009, 19);
INSERT INTO `option` VALUES (13020, '龙岩市', '龙岩市', 40, 12943, 19);
INSERT INTO `option` VALUES (13021, '新罗区', '新罗区', 5, 13020, 19);
INSERT INTO `option` VALUES (13022, '漳平市', '漳平市', 10, 13020, 19);
INSERT INTO `option` VALUES (13023, '长汀县', '长汀县', 15, 13020, 19);
INSERT INTO `option` VALUES (13024, '武平县', '武平县', 20, 13020, 19);
INSERT INTO `option` VALUES (13025, '永定县', '永定县', 25, 13020, 19);
INSERT INTO `option` VALUES (13026, '上杭县', '上杭县', 30, 13020, 19);
INSERT INTO `option` VALUES (13027, '连城县', '连城县', 35, 13020, 19);
INSERT INTO `option` VALUES (13028, '宁德市', '宁德市', 45, 12943, 19);
INSERT INTO `option` VALUES (13029, '蕉城区', '蕉城区', 5, 13028, 19);
INSERT INTO `option` VALUES (13030, '东侨开发区', '东侨开发区', 10, 13028, 19);
INSERT INTO `option` VALUES (13031, '福安市', '福安市', 15, 13028, 19);
INSERT INTO `option` VALUES (13032, '福鼎市', '福鼎市', 20, 13028, 19);
INSERT INTO `option` VALUES (13033, '寿宁县', '寿宁县', 25, 13028, 19);
INSERT INTO `option` VALUES (13034, '霞浦县', '霞浦县', 30, 13028, 19);
INSERT INTO `option` VALUES (13035, '柘荣县', '柘荣县', 35, 13028, 19);
INSERT INTO `option` VALUES (13036, '屏南县', '屏南县', 40, 13028, 19);
INSERT INTO `option` VALUES (13037, '古田县', '古田县', 45, 13028, 19);
INSERT INTO `option` VALUES (13038, '周宁县', '周宁县', 50, 13028, 19);
INSERT INTO `option` VALUES (13039, '湖北省', '湖北省', 85, 0, 19);
INSERT INTO `option` VALUES (13040, '武汉市', '武汉市', 5, 13039, 19);
INSERT INTO `option` VALUES (13041, '硚口区', '硚口区', 5, 13040, 19);
INSERT INTO `option` VALUES (13042, '武昌区', '武昌区', 10, 13040, 19);
INSERT INTO `option` VALUES (13043, '武汉经济技术开发区', '武汉经济技术开发区', 15, 13040, 19);
INSERT INTO `option` VALUES (13044, '江岸区', '江岸区', 20, 13040, 19);
INSERT INTO `option` VALUES (13045, '江汉区', '江汉区', 25, 13040, 19);
INSERT INTO `option` VALUES (13046, '蔡甸区', '蔡甸区', 30, 13040, 19);
INSERT INTO `option` VALUES (13047, '江夏区', '江夏区', 35, 13040, 19);
INSERT INTO `option` VALUES (13048, '新洲区', '新洲区', 40, 13040, 19);
INSERT INTO `option` VALUES (13049, '黄陂区', '黄陂区', 45, 13040, 19);
INSERT INTO `option` VALUES (13050, '汉阳区', '汉阳区', 50, 13040, 19);
INSERT INTO `option` VALUES (13051, '青山区', '青山区', 55, 13040, 19);
INSERT INTO `option` VALUES (13052, '洪山区', '洪山区', 60, 13040, 19);
INSERT INTO `option` VALUES (13053, '汉南区', '汉南区', 65, 13040, 19);
INSERT INTO `option` VALUES (13054, '东西湖区', '东西湖区', 70, 13040, 19);
INSERT INTO `option` VALUES (13055, '黄石市', '黄石市', 10, 13039, 19);
INSERT INTO `option` VALUES (13056, '黄石港区', '黄石港区', 5, 13055, 19);
INSERT INTO `option` VALUES (13057, '下陆区', '下陆区', 10, 13055, 19);
INSERT INTO `option` VALUES (13058, '西塞山区', '西塞山区', 15, 13055, 19);
INSERT INTO `option` VALUES (13059, '铁山区', '铁山区', 20, 13055, 19);
INSERT INTO `option` VALUES (13060, '大冶市', '大冶市', 25, 13055, 19);
INSERT INTO `option` VALUES (13061, '阳新县', '阳新县', 30, 13055, 19);
INSERT INTO `option` VALUES (13062, '经济技术开发区', '经济技术开发区', 35, 13055, 19);
INSERT INTO `option` VALUES (13063, '襄阳市', '襄阳市', 15, 13039, 19);
INSERT INTO `option` VALUES (13064, '老河口市', '老河口市', 5, 13063, 19);
INSERT INTO `option` VALUES (13065, '枣阳市', '枣阳市', 10, 13063, 19);
INSERT INTO `option` VALUES (13066, '宜城市', '宜城市', 15, 13063, 19);
INSERT INTO `option` VALUES (13067, '南漳县', '南漳县', 20, 13063, 19);
INSERT INTO `option` VALUES (13068, '保康县', '保康县', 25, 13063, 19);
INSERT INTO `option` VALUES (13069, '谷城县', '谷城县', 30, 13063, 19);
INSERT INTO `option` VALUES (13070, '樊城区', '樊城区', 35, 13063, 19);
INSERT INTO `option` VALUES (13071, '襄城区', '襄城区', 40, 13063, 19);
INSERT INTO `option` VALUES (13072, '襄州区', '襄州区', 45, 13063, 19);
INSERT INTO `option` VALUES (13073, '十堰市', '十堰市', 20, 13039, 19);
INSERT INTO `option` VALUES (13074, '丹江口市', '丹江口市', 5, 13073, 19);
INSERT INTO `option` VALUES (13075, '房县', '房县', 10, 13073, 19);
INSERT INTO `option` VALUES (13076, '竹山县', '竹山县', 15, 13073, 19);
INSERT INTO `option` VALUES (13077, '竹溪县', '竹溪县', 20, 13073, 19);
INSERT INTO `option` VALUES (13078, '郧县', '郧县', 25, 13073, 19);
INSERT INTO `option` VALUES (13079, '郧西县', '郧西县', 30, 13073, 19);
INSERT INTO `option` VALUES (13080, '茅箭区', '茅箭区', 35, 13073, 19);
INSERT INTO `option` VALUES (13081, '张湾区', '张湾区', 40, 13073, 19);
INSERT INTO `option` VALUES (13082, '荆州市', '荆州市', 25, 13039, 19);
INSERT INTO `option` VALUES (13083, '沙市区', '沙市区', 5, 13082, 19);
INSERT INTO `option` VALUES (13084, '荆州区', '荆州区', 10, 13082, 19);
INSERT INTO `option` VALUES (13085, '江陵县', '江陵县', 15, 13082, 19);
INSERT INTO `option` VALUES (13086, '洪湖市', '洪湖市', 20, 13082, 19);
INSERT INTO `option` VALUES (13087, '石首市', '石首市', 25, 13082, 19);
INSERT INTO `option` VALUES (13088, '松滋市', '松滋市', 30, 13082, 19);
INSERT INTO `option` VALUES (13089, '监利县', '监利县', 35, 13082, 19);
INSERT INTO `option` VALUES (13090, '公安县', '公安县', 40, 13082, 19);
INSERT INTO `option` VALUES (13091, '宜昌市', '宜昌市', 30, 13039, 19);
INSERT INTO `option` VALUES (13092, '伍家岗区', '伍家岗区', 5, 13091, 19);
INSERT INTO `option` VALUES (13093, '西陵区', '西陵区', 10, 13091, 19);
INSERT INTO `option` VALUES (13094, '宜都市', '宜都市', 15, 13091, 19);
INSERT INTO `option` VALUES (13095, '猇亭区', '猇亭区', 20, 13091, 19);
INSERT INTO `option` VALUES (13096, '点军区', '点军区', 25, 13091, 19);
INSERT INTO `option` VALUES (13097, '当阳市', '当阳市', 30, 13091, 19);
INSERT INTO `option` VALUES (13098, '枝江市', '枝江市', 35, 13091, 19);
INSERT INTO `option` VALUES (13099, '夷陵区', '夷陵区', 40, 13091, 19);
INSERT INTO `option` VALUES (13100, '秭归县', '秭归县', 45, 13091, 19);
INSERT INTO `option` VALUES (13101, '兴山县', '兴山县', 50, 13091, 19);
INSERT INTO `option` VALUES (13102, '远安县', '远安县', 55, 13091, 19);
INSERT INTO `option` VALUES (13103, '五峰土家族自治县', '五峰土家族自治县', 60, 13091, 19);
INSERT INTO `option` VALUES (13104, '长阳土家族自治县', '长阳土家族自治县', 65, 13091, 19);
INSERT INTO `option` VALUES (13105, '孝感市', '孝感市', 35, 13039, 19);
INSERT INTO `option` VALUES (13106, '汉川市', '汉川市', 5, 13105, 19);
INSERT INTO `option` VALUES (13107, '云梦县', '云梦县', 10, 13105, 19);
INSERT INTO `option` VALUES (13108, '大悟县', '大悟县', 15, 13105, 19);
INSERT INTO `option` VALUES (13109, '孝昌县', '孝昌县', 20, 13105, 19);
INSERT INTO `option` VALUES (13110, '孝南区', '孝南区', 25, 13105, 19);
INSERT INTO `option` VALUES (13111, '应城市', '应城市', 30, 13105, 19);
INSERT INTO `option` VALUES (13112, '安陆市', '安陆市', 35, 13105, 19);
INSERT INTO `option` VALUES (13113, '黄冈市', '黄冈市', 40, 13039, 19);
INSERT INTO `option` VALUES (13114, '黄州区', '黄州区', 5, 13113, 19);
INSERT INTO `option` VALUES (13115, '蕲春县', '蕲春县', 10, 13113, 19);
INSERT INTO `option` VALUES (13116, '麻城市', '麻城市', 15, 13113, 19);
INSERT INTO `option` VALUES (13117, '武穴市', '武穴市', 20, 13113, 19);
INSERT INTO `option` VALUES (13118, '浠水县', '浠水县', 25, 13113, 19);
INSERT INTO `option` VALUES (13119, '红安县', '红安县', 30, 13113, 19);
INSERT INTO `option` VALUES (13120, '罗田县', '罗田县', 35, 13113, 19);
INSERT INTO `option` VALUES (13121, '黄梅县', '黄梅县', 40, 13113, 19);
INSERT INTO `option` VALUES (13122, '英山县', '英山县', 45, 13113, 19);
INSERT INTO `option` VALUES (13123, '团风县', '团风县', 50, 13113, 19);
INSERT INTO `option` VALUES (13124, '咸宁市', '咸宁市', 45, 13039, 19);
INSERT INTO `option` VALUES (13125, '咸安区', '咸安区', 5, 13124, 19);
INSERT INTO `option` VALUES (13126, '赤壁市', '赤壁市', 10, 13124, 19);
INSERT INTO `option` VALUES (13127, '嘉鱼县', '嘉鱼县', 15, 13124, 19);
INSERT INTO `option` VALUES (13128, '通山县', '通山县', 20, 13124, 19);
INSERT INTO `option` VALUES (13129, '崇阳县', '崇阳县', 25, 13124, 19);
INSERT INTO `option` VALUES (13130, '通城县', '通城县', 30, 13124, 19);
INSERT INTO `option` VALUES (13131, '恩施州', '恩施州', 50, 13039, 19);
INSERT INTO `option` VALUES (13132, '恩施市', '恩施市', 5, 13131, 19);
INSERT INTO `option` VALUES (13133, '利川市', '利川市', 10, 13131, 19);
INSERT INTO `option` VALUES (13134, '建始县', '建始县', 15, 13131, 19);
INSERT INTO `option` VALUES (13135, '来凤县', '来凤县', 20, 13131, 19);
INSERT INTO `option` VALUES (13136, '巴东县', '巴东县', 25, 13131, 19);
INSERT INTO `option` VALUES (13137, '鹤峰县', '鹤峰县', 30, 13131, 19);
INSERT INTO `option` VALUES (13138, '宣恩县', '宣恩县', 35, 13131, 19);
INSERT INTO `option` VALUES (13139, '咸丰县', '咸丰县', 40, 13131, 19);
INSERT INTO `option` VALUES (13140, '鄂州市', '鄂州市', 55, 13039, 19);
INSERT INTO `option` VALUES (13141, '梁子湖区', '梁子湖区', 5, 13140, 19);
INSERT INTO `option` VALUES (13142, '华容区', '华容区', 10, 13140, 19);
INSERT INTO `option` VALUES (13143, '鄂城区', '鄂城区', 15, 13140, 19);
INSERT INTO `option` VALUES (13144, '荆门市', '荆门市', 60, 13039, 19);
INSERT INTO `option` VALUES (13145, '东宝区', '东宝区', 5, 13144, 19);
INSERT INTO `option` VALUES (13146, '掇刀区', '掇刀区', 10, 13144, 19);
INSERT INTO `option` VALUES (13147, '钟祥市', '钟祥市', 15, 13144, 19);
INSERT INTO `option` VALUES (13148, '京山县', '京山县', 20, 13144, 19);
INSERT INTO `option` VALUES (13149, '沙洋县', '沙洋县', 25, 13144, 19);
INSERT INTO `option` VALUES (13150, '随州市', '随州市', 65, 13039, 19);
INSERT INTO `option` VALUES (13151, '曾都区', '曾都区', 5, 13150, 19);
INSERT INTO `option` VALUES (13152, '广水市', '广水市', 10, 13150, 19);
INSERT INTO `option` VALUES (13153, '随县', '随县', 15, 13150, 19);
INSERT INTO `option` VALUES (13154, '潜江市', '潜江市', 70, 13039, 19);
INSERT INTO `option` VALUES (13155, '园林', '园林', 5, 13154, 19);
INSERT INTO `option` VALUES (13156, '杨市', '杨市', 10, 13154, 19);
INSERT INTO `option` VALUES (13157, '周矶', '周矶', 15, 13154, 19);
INSERT INTO `option` VALUES (13158, '广华', '广华', 20, 13154, 19);
INSERT INTO `option` VALUES (13159, '泰丰', '泰丰', 25, 13154, 19);
INSERT INTO `option` VALUES (13160, '竹根滩镇', '竹根滩镇', 30, 13154, 19);
INSERT INTO `option` VALUES (13161, '高石碑镇', '高石碑镇', 35, 13154, 19);
INSERT INTO `option` VALUES (13162, '积玉口镇', '积玉口镇', 40, 13154, 19);
INSERT INTO `option` VALUES (13163, '渔洋镇', '渔洋镇', 45, 13154, 19);
INSERT INTO `option` VALUES (13164, '王场镇', '王场镇', 50, 13154, 19);
INSERT INTO `option` VALUES (13165, '熊口镇', '熊口镇', 55, 13154, 19);
INSERT INTO `option` VALUES (13166, '老新镇', '老新镇', 60, 13154, 19);
INSERT INTO `option` VALUES (13167, '浩口镇', '浩口镇', 65, 13154, 19);
INSERT INTO `option` VALUES (13168, '张金镇', '张金镇', 70, 13154, 19);
INSERT INTO `option` VALUES (13169, '龙湾镇', '龙湾镇', 75, 13154, 19);
INSERT INTO `option` VALUES (13170, '江汉石油管理局', '江汉石油管理局', 80, 13154, 19);
INSERT INTO `option` VALUES (13171, '潜江经济开发区', '潜江经济开发区', 85, 13154, 19);
INSERT INTO `option` VALUES (13172, '西大垸管理区', '西大垸管理区', 90, 13154, 19);
INSERT INTO `option` VALUES (13173, '运粮湖管理区', '运粮湖管理区', 95, 13154, 19);
INSERT INTO `option` VALUES (13174, '周矶管理区', '周矶管理区', 100, 13154, 19);
INSERT INTO `option` VALUES (13175, '后湖管理区', '后湖管理区', 105, 13154, 19);
INSERT INTO `option` VALUES (13176, '熊口管理区', '熊口管理区', 110, 13154, 19);
INSERT INTO `option` VALUES (13177, '总口管理区', '总口管理区', 115, 13154, 19);
INSERT INTO `option` VALUES (13178, '高场原种场', '高场原种场', 120, 13154, 19);
INSERT INTO `option` VALUES (13179, '浩口原种场', '浩口原种场', 125, 13154, 19);
INSERT INTO `option` VALUES (13180, '天门市', '天门市', 75, 13039, 19);
INSERT INTO `option` VALUES (13181, '侨乡街道开发区', '侨乡街道开发区', 5, 13180, 19);
INSERT INTO `option` VALUES (13182, '竟陵街道', '竟陵街道', 10, 13180, 19);
INSERT INTO `option` VALUES (13183, '杨林街道', '杨林街道', 15, 13180, 19);
INSERT INTO `option` VALUES (13184, '佛子山镇', '佛子山镇', 20, 13180, 19);
INSERT INTO `option` VALUES (13185, '多宝镇', '多宝镇', 25, 13180, 19);
INSERT INTO `option` VALUES (13186, '拖市镇', '拖市镇', 30, 13180, 19);
INSERT INTO `option` VALUES (13187, '张港镇', '张港镇', 35, 13180, 19);
INSERT INTO `option` VALUES (13188, '蒋场镇', '蒋场镇', 40, 13180, 19);
INSERT INTO `option` VALUES (13189, '汪场镇', '汪场镇', 45, 13180, 19);
INSERT INTO `option` VALUES (13190, '渔薪镇', '渔薪镇', 50, 13180, 19);
INSERT INTO `option` VALUES (13191, '黄潭镇', '黄潭镇', 55, 13180, 19);
INSERT INTO `option` VALUES (13192, '岳口镇', '岳口镇', 60, 13180, 19);
INSERT INTO `option` VALUES (13193, '横林镇', '横林镇', 65, 13180, 19);
INSERT INTO `option` VALUES (13194, '彭市镇', '彭市镇', 70, 13180, 19);
INSERT INTO `option` VALUES (13195, '麻洋镇', '麻洋镇', 75, 13180, 19);
INSERT INTO `option` VALUES (13196, '多祥镇', '多祥镇', 80, 13180, 19);
INSERT INTO `option` VALUES (13197, '干驿镇', '干驿镇', 85, 13180, 19);
INSERT INTO `option` VALUES (13198, '马湾镇', '马湾镇', 90, 13180, 19);
INSERT INTO `option` VALUES (13199, '卢市镇', '卢市镇', 95, 13180, 19);
INSERT INTO `option` VALUES (13200, '小板镇', '小板镇', 100, 13180, 19);
INSERT INTO `option` VALUES (13201, '九真镇', '九真镇', 105, 13180, 19);
INSERT INTO `option` VALUES (13202, '皂市镇', '皂市镇', 110, 13180, 19);
INSERT INTO `option` VALUES (13203, '胡市镇', '胡市镇', 115, 13180, 19);
INSERT INTO `option` VALUES (13204, '石河镇', '石河镇', 120, 13180, 19);
INSERT INTO `option` VALUES (13205, '净潭乡', '净潭乡', 125, 13180, 19);
INSERT INTO `option` VALUES (13206, '蒋湖农场', '蒋湖农场', 130, 13180, 19);
INSERT INTO `option` VALUES (13207, '白茅湖农场', '白茅湖农场', 135, 13180, 19);
INSERT INTO `option` VALUES (13208, '沉湖管委会', '沉湖管委会', 140, 13180, 19);
INSERT INTO `option` VALUES (13209, '仙桃市', '仙桃市', 80, 13039, 19);
INSERT INTO `option` VALUES (13210, '城区', '城区', 5, 13209, 19);
INSERT INTO `option` VALUES (13211, '郑场镇', '郑场镇', 10, 13209, 19);
INSERT INTO `option` VALUES (13212, '毛嘴镇', '毛嘴镇', 15, 13209, 19);
INSERT INTO `option` VALUES (13213, '豆河镇', '豆河镇', 20, 13209, 19);
INSERT INTO `option` VALUES (13214, '三伏潭镇', '三伏潭镇', 25, 13209, 19);
INSERT INTO `option` VALUES (13215, '胡场镇', '胡场镇', 30, 13209, 19);
INSERT INTO `option` VALUES (13216, '长埫口镇', '长埫口镇', 35, 13209, 19);
INSERT INTO `option` VALUES (13217, '西流河镇', '西流河镇', 40, 13209, 19);
INSERT INTO `option` VALUES (13218, '沙湖镇', '沙湖镇', 45, 13209, 19);
INSERT INTO `option` VALUES (13219, '杨林尾镇', '杨林尾镇', 50, 13209, 19);
INSERT INTO `option` VALUES (13220, '彭场镇', '彭场镇', 55, 13209, 19);
INSERT INTO `option` VALUES (13221, '张沟镇', '张沟镇', 60, 13209, 19);
INSERT INTO `option` VALUES (13222, '郭河镇', '郭河镇', 65, 13209, 19);
INSERT INTO `option` VALUES (13223, '沔城镇', '沔城镇', 70, 13209, 19);
INSERT INTO `option` VALUES (13224, '通海口镇', '通海口镇', 75, 13209, 19);
INSERT INTO `option` VALUES (13225, '陈场镇', '陈场镇', 80, 13209, 19);
INSERT INTO `option` VALUES (13226, '工业园区', '工业园区', 85, 13209, 19);
INSERT INTO `option` VALUES (13227, '九合垸原种场', '九合垸原种场', 90, 13209, 19);
INSERT INTO `option` VALUES (13228, '沙湖原种场', '沙湖原种场', 95, 13209, 19);
INSERT INTO `option` VALUES (13229, '排湖渔场', '排湖渔场', 100, 13209, 19);
INSERT INTO `option` VALUES (13230, '五湖渔场', '五湖渔场', 105, 13209, 19);
INSERT INTO `option` VALUES (13231, '赵西垸林场', '赵西垸林场', 110, 13209, 19);
INSERT INTO `option` VALUES (13232, '刘家垸林场', '刘家垸林场', 115, 13209, 19);
INSERT INTO `option` VALUES (13233, '畜禽良种场', '畜禽良种场', 120, 13209, 19);
INSERT INTO `option` VALUES (13234, '神农架林区', '神农架林区', 85, 13039, 19);
INSERT INTO `option` VALUES (13235, '松柏镇', '松柏镇', 5, 13234, 19);
INSERT INTO `option` VALUES (13236, '阳日镇', '阳日镇', 10, 13234, 19);
INSERT INTO `option` VALUES (13237, '木鱼镇', '木鱼镇', 15, 13234, 19);
INSERT INTO `option` VALUES (13238, '红坪镇', '红坪镇', 20, 13234, 19);
INSERT INTO `option` VALUES (13239, '新华镇', '新华镇', 25, 13234, 19);
INSERT INTO `option` VALUES (13240, '宋洛乡', '宋洛乡', 30, 13234, 19);
INSERT INTO `option` VALUES (13241, '九湖乡', '九湖乡', 35, 13234, 19);
INSERT INTO `option` VALUES (13242, '下谷坪乡', '下谷坪乡', 40, 13234, 19);
INSERT INTO `option` VALUES (13243, '湖南省', '湖南省', 90, 0, 19);
INSERT INTO `option` VALUES (13244, '长沙市', '长沙市', 5, 13243, 19);
INSERT INTO `option` VALUES (13245, '芙蓉区', '芙蓉区', 5, 13244, 19);
INSERT INTO `option` VALUES (13246, '岳麓区', '岳麓区', 10, 13244, 19);
INSERT INTO `option` VALUES (13247, '雨花区', '雨花区', 15, 13244, 19);
INSERT INTO `option` VALUES (13248, '开福区', '开福区', 20, 13244, 19);
INSERT INTO `option` VALUES (13249, '天心区', '天心区', 25, 13244, 19);
INSERT INTO `option` VALUES (13250, '浏阳市', '浏阳市', 30, 13244, 19);
INSERT INTO `option` VALUES (13251, '长沙县', '长沙县', 35, 13244, 19);
INSERT INTO `option` VALUES (13252, '宁乡县', '宁乡县', 40, 13244, 19);
INSERT INTO `option` VALUES (13253, '望城区', '望城区', 45, 13244, 19);
INSERT INTO `option` VALUES (13254, '株洲市', '株洲市', 10, 13243, 19);
INSERT INTO `option` VALUES (13255, '天元区', '天元区', 5, 13254, 19);
INSERT INTO `option` VALUES (13256, '石峰区', '石峰区', 10, 13254, 19);
INSERT INTO `option` VALUES (13257, '芦淞区', '芦淞区', 15, 13254, 19);
INSERT INTO `option` VALUES (13258, '荷塘区', '荷塘区', 20, 13254, 19);
INSERT INTO `option` VALUES (13259, '醴陵市', '醴陵市', 25, 13254, 19);
INSERT INTO `option` VALUES (13260, '株洲县', '株洲县', 30, 13254, 19);
INSERT INTO `option` VALUES (13261, '攸县', '攸县', 35, 13254, 19);
INSERT INTO `option` VALUES (13262, '茶陵县', '茶陵县', 40, 13254, 19);
INSERT INTO `option` VALUES (13263, '炎陵县', '炎陵县', 45, 13254, 19);
INSERT INTO `option` VALUES (13264, '湘潭市', '湘潭市', 15, 13243, 19);
INSERT INTO `option` VALUES (13265, '雨湖区', '雨湖区', 5, 13264, 19);
INSERT INTO `option` VALUES (13266, '岳塘区', '岳塘区', 10, 13264, 19);
INSERT INTO `option` VALUES (13267, '湘乡市', '湘乡市', 15, 13264, 19);
INSERT INTO `option` VALUES (13268, '湘潭县', '湘潭县', 20, 13264, 19);
INSERT INTO `option` VALUES (13269, '韶山市', '韶山市', 25, 13264, 19);
INSERT INTO `option` VALUES (13270, '韶山市', '韶山市', 20, 13243, 19);
INSERT INTO `option` VALUES (13271, '韶山市区内', '韶山市区内', 5, 13270, 19);
INSERT INTO `option` VALUES (13272, '衡阳市', '衡阳市', 25, 13243, 19);
INSERT INTO `option` VALUES (13273, '蒸湘区', '蒸湘区', 5, 13272, 19);
INSERT INTO `option` VALUES (13274, '石鼓区', '石鼓区', 10, 13272, 19);
INSERT INTO `option` VALUES (13275, '珠晖区', '珠晖区', 15, 13272, 19);
INSERT INTO `option` VALUES (13276, '雁峰区', '雁峰区', 20, 13272, 19);
INSERT INTO `option` VALUES (13277, '常宁市', '常宁市', 25, 13272, 19);
INSERT INTO `option` VALUES (13278, '衡阳县', '衡阳县', 30, 13272, 19);
INSERT INTO `option` VALUES (13279, '耒阳市', '耒阳市', 35, 13272, 19);
INSERT INTO `option` VALUES (13280, '衡东县', '衡东县', 40, 13272, 19);
INSERT INTO `option` VALUES (13281, '衡南县', '衡南县', 45, 13272, 19);
INSERT INTO `option` VALUES (13282, '衡山县', '衡山县', 50, 13272, 19);
INSERT INTO `option` VALUES (13283, '祁东县', '祁东县', 55, 13272, 19);
INSERT INTO `option` VALUES (13284, '南岳区', '南岳区', 60, 13272, 19);
INSERT INTO `option` VALUES (13285, '邵阳市', '邵阳市', 30, 13243, 19);
INSERT INTO `option` VALUES (13286, '大祥区', '大祥区', 5, 13285, 19);
INSERT INTO `option` VALUES (13287, '双清区', '双清区', 10, 13285, 19);
INSERT INTO `option` VALUES (13288, '北塔区', '北塔区', 15, 13285, 19);
INSERT INTO `option` VALUES (13289, '武冈市', '武冈市', 20, 13285, 19);
INSERT INTO `option` VALUES (13290, '邵东县', '邵东县', 25, 13285, 19);
INSERT INTO `option` VALUES (13291, '洞口县', '洞口县', 30, 13285, 19);
INSERT INTO `option` VALUES (13292, '新邵县', '新邵县', 35, 13285, 19);
INSERT INTO `option` VALUES (13293, '绥宁县', '绥宁县', 40, 13285, 19);
INSERT INTO `option` VALUES (13294, '新宁县', '新宁县', 45, 13285, 19);
INSERT INTO `option` VALUES (13295, '邵阳县', '邵阳县', 50, 13285, 19);
INSERT INTO `option` VALUES (13296, '隆回县', '隆回县', 55, 13285, 19);
INSERT INTO `option` VALUES (13297, '城步县', '城步县', 60, 13285, 19);
INSERT INTO `option` VALUES (13298, '岳阳市', '岳阳市', 35, 13243, 19);
INSERT INTO `option` VALUES (13299, '岳阳楼区', '岳阳楼区', 5, 13298, 19);
INSERT INTO `option` VALUES (13300, '君山区', '君山区', 10, 13298, 19);
INSERT INTO `option` VALUES (13301, '云溪区', '云溪区', 15, 13298, 19);
INSERT INTO `option` VALUES (13302, '临湘市', '临湘市', 20, 13298, 19);
INSERT INTO `option` VALUES (13303, '汨罗市', '汨罗市', 25, 13298, 19);
INSERT INTO `option` VALUES (13304, '岳阳县', '岳阳县', 30, 13298, 19);
INSERT INTO `option` VALUES (13305, '湘阴县', '湘阴县', 35, 13298, 19);
INSERT INTO `option` VALUES (13306, '华容县', '华容县', 40, 13298, 19);
INSERT INTO `option` VALUES (13307, '平江县', '平江县', 45, 13298, 19);
INSERT INTO `option` VALUES (13308, '常德市', '常德市', 40, 13243, 19);
INSERT INTO `option` VALUES (13309, '汉寿县', '汉寿县', 5, 13308, 19);
INSERT INTO `option` VALUES (13310, '石门县', '石门县', 10, 13308, 19);
INSERT INTO `option` VALUES (13311, '安乡县', '安乡县', 15, 13308, 19);
INSERT INTO `option` VALUES (13312, '鼎城区', '鼎城区', 20, 13308, 19);
INSERT INTO `option` VALUES (13313, '武陵区', '武陵区', 25, 13308, 19);
INSERT INTO `option` VALUES (13314, '津市市', '津市市', 30, 13308, 19);
INSERT INTO `option` VALUES (13315, '澧县', '澧县', 35, 13308, 19);
INSERT INTO `option` VALUES (13316, '临澧县', '临澧县', 40, 13308, 19);
INSERT INTO `option` VALUES (13317, '桃源县', '桃源县', 45, 13308, 19);
INSERT INTO `option` VALUES (13318, '张家界市', '张家界市', 45, 13243, 19);
INSERT INTO `option` VALUES (13319, '慈利县', '慈利县', 5, 13318, 19);
INSERT INTO `option` VALUES (13320, '桑植县', '桑植县', 10, 13318, 19);
INSERT INTO `option` VALUES (13321, '武陵源区', '武陵源区', 15, 13318, 19);
INSERT INTO `option` VALUES (13322, '永定区', '永定区', 20, 13318, 19);
INSERT INTO `option` VALUES (13323, '郴州市', '郴州市', 50, 13243, 19);
INSERT INTO `option` VALUES (13324, '资兴市', '资兴市', 5, 13323, 19);
INSERT INTO `option` VALUES (13325, '宜章县', '宜章县', 10, 13323, 19);
INSERT INTO `option` VALUES (13326, '安仁县', '安仁县', 15, 13323, 19);
INSERT INTO `option` VALUES (13327, '汝城县', '汝城县', 20, 13323, 19);
INSERT INTO `option` VALUES (13328, '嘉禾县', '嘉禾县', 25, 13323, 19);
INSERT INTO `option` VALUES (13329, '临武县', '临武县', 30, 13323, 19);
INSERT INTO `option` VALUES (13330, '桂东县', '桂东县', 35, 13323, 19);
INSERT INTO `option` VALUES (13331, '永兴县', '永兴县', 40, 13323, 19);
INSERT INTO `option` VALUES (13332, '桂阳县', '桂阳县', 45, 13323, 19);
INSERT INTO `option` VALUES (13333, '北湖区', '北湖区', 50, 13323, 19);
INSERT INTO `option` VALUES (13334, '苏仙区', '苏仙区', 55, 13323, 19);
INSERT INTO `option` VALUES (13335, '益阳市', '益阳市', 55, 13243, 19);
INSERT INTO `option` VALUES (13336, '南县', '南县', 5, 13335, 19);
INSERT INTO `option` VALUES (13337, '桃江县', '桃江县', 10, 13335, 19);
INSERT INTO `option` VALUES (13338, '安化县', '安化县', 15, 13335, 19);
INSERT INTO `option` VALUES (13339, '赫山区', '赫山区', 20, 13335, 19);
INSERT INTO `option` VALUES (13340, '资阳区', '资阳区', 25, 13335, 19);
INSERT INTO `option` VALUES (13341, '沅江市', '沅江市', 30, 13335, 19);
INSERT INTO `option` VALUES (13342, '永州市', '永州市', 60, 13243, 19);
INSERT INTO `option` VALUES (13343, '冷水滩区', '冷水滩区', 5, 13342, 19);
INSERT INTO `option` VALUES (13344, '祁阳县', '祁阳县', 10, 13342, 19);
INSERT INTO `option` VALUES (13345, '双牌县', '双牌县', 15, 13342, 19);
INSERT INTO `option` VALUES (13346, '道县', '道县', 20, 13342, 19);
INSERT INTO `option` VALUES (13347, '江永县', '江永县', 25, 13342, 19);
INSERT INTO `option` VALUES (13348, '江华县', '江华县', 30, 13342, 19);
INSERT INTO `option` VALUES (13349, '宁远县', '宁远县', 35, 13342, 19);
INSERT INTO `option` VALUES (13350, '新田县', '新田县', 40, 13342, 19);
INSERT INTO `option` VALUES (13351, '蓝山县', '蓝山县', 45, 13342, 19);
INSERT INTO `option` VALUES (13352, '东安县', '东安县', 50, 13342, 19);
INSERT INTO `option` VALUES (13353, '零陵区', '零陵区', 55, 13342, 19);
INSERT INTO `option` VALUES (13354, '怀化市', '怀化市', 65, 13243, 19);
INSERT INTO `option` VALUES (13355, '鹤城区', '鹤城区', 5, 13354, 19);
INSERT INTO `option` VALUES (13356, '洪江市', '洪江市', 10, 13354, 19);
INSERT INTO `option` VALUES (13357, '会同县', '会同县', 15, 13354, 19);
INSERT INTO `option` VALUES (13358, '溆浦县', '溆浦县', 20, 13354, 19);
INSERT INTO `option` VALUES (13359, '中方县', '中方县', 25, 13354, 19);
INSERT INTO `option` VALUES (13360, '辰溪县', '辰溪县', 30, 13354, 19);
INSERT INTO `option` VALUES (13361, '靖州县', '靖州县', 35, 13354, 19);
INSERT INTO `option` VALUES (13362, '通道县', '通道县', 40, 13354, 19);
INSERT INTO `option` VALUES (13363, '芷江县', '芷江县', 45, 13354, 19);
INSERT INTO `option` VALUES (13364, '新晃县', '新晃县', 50, 13354, 19);
INSERT INTO `option` VALUES (13365, '麻阳县', '麻阳县', 55, 13354, 19);
INSERT INTO `option` VALUES (13366, '沅陵县', '沅陵县', 60, 13354, 19);
INSERT INTO `option` VALUES (13367, '娄底市', '娄底市', 70, 13243, 19);
INSERT INTO `option` VALUES (13368, '娄星区', '娄星区', 5, 13367, 19);
INSERT INTO `option` VALUES (13369, '冷水江市', '冷水江市', 10, 13367, 19);
INSERT INTO `option` VALUES (13370, '涟源市', '涟源市', 15, 13367, 19);
INSERT INTO `option` VALUES (13371, '新化县', '新化县', 20, 13367, 19);
INSERT INTO `option` VALUES (13372, '双峰县', '双峰县', 25, 13367, 19);
INSERT INTO `option` VALUES (13373, '湘西州', '湘西州', 75, 13243, 19);
INSERT INTO `option` VALUES (13374, '吉首市', '吉首市', 5, 13373, 19);
INSERT INTO `option` VALUES (13375, '古丈县', '古丈县', 10, 13373, 19);
INSERT INTO `option` VALUES (13376, '龙山县', '龙山县', 15, 13373, 19);
INSERT INTO `option` VALUES (13377, '永顺县', '永顺县', 20, 13373, 19);
INSERT INTO `option` VALUES (13378, '泸溪县', '泸溪县', 25, 13373, 19);
INSERT INTO `option` VALUES (13379, '凤凰县', '凤凰县', 30, 13373, 19);
INSERT INTO `option` VALUES (13380, '花垣县', '花垣县', 35, 13373, 19);
INSERT INTO `option` VALUES (13381, '保靖县', '保靖县', 40, 13373, 19);
INSERT INTO `option` VALUES (13382, '广东省', '广东省', 95, 0, 19);
INSERT INTO `option` VALUES (13383, '广州市', '广州市', 5, 13382, 19);
INSERT INTO `option` VALUES (13384, '天河区', '天河区', 5, 13383, 19);
INSERT INTO `option` VALUES (13385, '海珠区', '海珠区', 10, 13383, 19);
INSERT INTO `option` VALUES (13386, '荔湾区', '荔湾区', 15, 13383, 19);
INSERT INTO `option` VALUES (13387, '越秀区', '越秀区', 20, 13383, 19);
INSERT INTO `option` VALUES (13388, '番禺区', '番禺区', 25, 13383, 19);
INSERT INTO `option` VALUES (13389, '花都区', '花都区', 30, 13383, 19);
INSERT INTO `option` VALUES (13390, '萝岗区', '萝岗区', 35, 13383, 19);
INSERT INTO `option` VALUES (13391, '白云区', '白云区', 40, 13383, 19);
INSERT INTO `option` VALUES (13392, '南沙区', '南沙区', 45, 13383, 19);
INSERT INTO `option` VALUES (13393, '黄埔区', '黄埔区', 50, 13383, 19);
INSERT INTO `option` VALUES (13394, '增城市', '增城市', 55, 13383, 19);
INSERT INTO `option` VALUES (13395, '从化市', '从化市', 60, 13383, 19);
INSERT INTO `option` VALUES (13396, '广州大学城', '广州大学城', 65, 13383, 19);
INSERT INTO `option` VALUES (13397, '深圳市', '深圳市', 10, 13382, 19);
INSERT INTO `option` VALUES (13398, '罗湖区', '罗湖区', 5, 13397, 19);
INSERT INTO `option` VALUES (13399, '福田区', '福田区', 10, 13397, 19);
INSERT INTO `option` VALUES (13400, '南山区', '南山区', 15, 13397, 19);
INSERT INTO `option` VALUES (13401, '宝安区', '宝安区', 20, 13397, 19);
INSERT INTO `option` VALUES (13402, '光明新区', '光明新区', 25, 13397, 19);
INSERT INTO `option` VALUES (13403, '龙岗区', '龙岗区', 30, 13397, 19);
INSERT INTO `option` VALUES (13404, '坪山新区', '坪山新区', 35, 13397, 19);
INSERT INTO `option` VALUES (13405, '盐田区', '盐田区', 40, 13397, 19);
INSERT INTO `option` VALUES (13406, '龙华区', '龙华区', 45, 13397, 19);
INSERT INTO `option` VALUES (13407, '大鹏新区', '大鹏新区', 50, 13397, 19);
INSERT INTO `option` VALUES (13408, '珠海市', '珠海市', 15, 13382, 19);
INSERT INTO `option` VALUES (13409, '斗门区', '斗门区', 5, 13408, 19);
INSERT INTO `option` VALUES (13410, '金湾区', '金湾区', 10, 13408, 19);
INSERT INTO `option` VALUES (13411, '香洲区', '香洲区', 15, 13408, 19);
INSERT INTO `option` VALUES (13412, '汕头市', '汕头市', 20, 13382, 19);
INSERT INTO `option` VALUES (13413, '龙湖区', '龙湖区', 5, 13412, 19);
INSERT INTO `option` VALUES (13414, '金平区', '金平区', 10, 13412, 19);
INSERT INTO `option` VALUES (13415, '澄海区', '澄海区', 15, 13412, 19);
INSERT INTO `option` VALUES (13416, '潮阳区', '潮阳区', 20, 13412, 19);
INSERT INTO `option` VALUES (13417, '潮南区', '潮南区', 25, 13412, 19);
INSERT INTO `option` VALUES (13418, '濠江区', '濠江区', 30, 13412, 19);
INSERT INTO `option` VALUES (13419, '南澳县', '南澳县', 35, 13412, 19);
INSERT INTO `option` VALUES (13420, '韶关市', '韶关市', 25, 13382, 19);
INSERT INTO `option` VALUES (13421, '武江区', '武江区', 5, 13420, 19);
INSERT INTO `option` VALUES (13422, '浈江区', '浈江区', 10, 13420, 19);
INSERT INTO `option` VALUES (13423, '南雄市', '南雄市', 15, 13420, 19);
INSERT INTO `option` VALUES (13424, '乐昌市', '乐昌市', 20, 13420, 19);
INSERT INTO `option` VALUES (13425, '仁化县', '仁化县', 25, 13420, 19);
INSERT INTO `option` VALUES (13426, '始兴县', '始兴县', 30, 13420, 19);
INSERT INTO `option` VALUES (13427, '翁源县', '翁源县', 35, 13420, 19);
INSERT INTO `option` VALUES (13428, '新丰县', '新丰县', 40, 13420, 19);
INSERT INTO `option` VALUES (13429, '乳源瑶族自治县', '乳源瑶族自治县', 45, 13420, 19);
INSERT INTO `option` VALUES (13430, '曲江区', '曲江区', 50, 13420, 19);
INSERT INTO `option` VALUES (13431, '河源市', '河源市', 30, 13382, 19);
INSERT INTO `option` VALUES (13432, '和平县', '和平县', 5, 13431, 19);
INSERT INTO `option` VALUES (13433, '龙川县', '龙川县', 10, 13431, 19);
INSERT INTO `option` VALUES (13434, '紫金县', '紫金县', 15, 13431, 19);
INSERT INTO `option` VALUES (13435, '连平县', '连平县', 20, 13431, 19);
INSERT INTO `option` VALUES (13436, '源城区', '源城区', 25, 13431, 19);
INSERT INTO `option` VALUES (13437, '东源县', '东源县', 30, 13431, 19);
INSERT INTO `option` VALUES (13438, '梅州市', '梅州市', 35, 13382, 19);
INSERT INTO `option` VALUES (13439, '梅江区', '梅江区', 5, 13438, 19);
INSERT INTO `option` VALUES (13440, '兴宁市', '兴宁市', 10, 13438, 19);
INSERT INTO `option` VALUES (13441, '梅县', '梅县', 15, 13438, 19);
INSERT INTO `option` VALUES (13442, '蕉岭县', '蕉岭县', 20, 13438, 19);
INSERT INTO `option` VALUES (13443, '大埔县', '大埔县', 25, 13438, 19);
INSERT INTO `option` VALUES (13444, '丰顺县', '丰顺县', 30, 13438, 19);
INSERT INTO `option` VALUES (13445, '五华县', '五华县', 35, 13438, 19);
INSERT INTO `option` VALUES (13446, '平远县', '平远县', 40, 13438, 19);
INSERT INTO `option` VALUES (13447, '惠州市', '惠州市', 40, 13382, 19);
INSERT INTO `option` VALUES (13448, '惠阳区', '惠阳区', 5, 13447, 19);
INSERT INTO `option` VALUES (13449, '大亚湾区', '大亚湾区', 10, 13447, 19);
INSERT INTO `option` VALUES (13450, '惠城区', '惠城区', 15, 13447, 19);
INSERT INTO `option` VALUES (13451, '惠东县', '惠东县', 20, 13447, 19);
INSERT INTO `option` VALUES (13452, '博罗县', '博罗县', 25, 13447, 19);
INSERT INTO `option` VALUES (13453, '龙门县', '龙门县', 30, 13447, 19);
INSERT INTO `option` VALUES (13454, '汕尾市', '汕尾市', 45, 13382, 19);
INSERT INTO `option` VALUES (13455, '城区', '城区', 5, 13454, 19);
INSERT INTO `option` VALUES (13456, '陆丰市', '陆丰市', 10, 13454, 19);
INSERT INTO `option` VALUES (13457, '陆河县', '陆河县', 15, 13454, 19);
INSERT INTO `option` VALUES (13458, '海丰县', '海丰县', 20, 13454, 19);
INSERT INTO `option` VALUES (13459, '东莞市', '东莞市', 50, 13382, 19);
INSERT INTO `option` VALUES (13460, '长安镇', '长安镇', 5, 13459, 19);
INSERT INTO `option` VALUES (13461, '莞城区', '莞城区', 10, 13459, 19);
INSERT INTO `option` VALUES (13462, '南城区', '南城区', 15, 13459, 19);
INSERT INTO `option` VALUES (13463, '寮步镇', '寮步镇', 20, 13459, 19);
INSERT INTO `option` VALUES (13464, '大岭山镇', '大岭山镇', 25, 13459, 19);
INSERT INTO `option` VALUES (13465, '横沥镇', '横沥镇', 30, 13459, 19);
INSERT INTO `option` VALUES (13466, '常平镇', '常平镇', 35, 13459, 19);
INSERT INTO `option` VALUES (13467, '厚街镇', '厚街镇', 40, 13459, 19);
INSERT INTO `option` VALUES (13468, '万江区', '万江区', 45, 13459, 19);
INSERT INTO `option` VALUES (13469, '樟木头镇', '樟木头镇', 50, 13459, 19);
INSERT INTO `option` VALUES (13470, '塘厦镇', '塘厦镇', 55, 13459, 19);
INSERT INTO `option` VALUES (13471, '凤岗镇', '凤岗镇', 60, 13459, 19);
INSERT INTO `option` VALUES (13472, '大朗镇', '大朗镇', 65, 13459, 19);
INSERT INTO `option` VALUES (13473, '东坑镇', '东坑镇', 70, 13459, 19);
INSERT INTO `option` VALUES (13474, '清溪镇', '清溪镇', 75, 13459, 19);
INSERT INTO `option` VALUES (13475, '企石镇', '企石镇', 80, 13459, 19);
INSERT INTO `option` VALUES (13476, '茶山镇', '茶山镇', 85, 13459, 19);
INSERT INTO `option` VALUES (13477, '东城区', '东城区', 90, 13459, 19);
INSERT INTO `option` VALUES (13478, '虎门镇', '虎门镇', 95, 13459, 19);
INSERT INTO `option` VALUES (13479, '黄江镇', '黄江镇', 100, 13459, 19);
INSERT INTO `option` VALUES (13480, '石排镇', '石排镇', 105, 13459, 19);
INSERT INTO `option` VALUES (13481, '道滘镇', '道滘镇', 110, 13459, 19);
INSERT INTO `option` VALUES (13482, '沙田镇', '沙田镇', 115, 13459, 19);
INSERT INTO `option` VALUES (13483, '高埗镇', '高埗镇', 120, 13459, 19);
INSERT INTO `option` VALUES (13484, '石龙镇', '石龙镇', 125, 13459, 19);
INSERT INTO `option` VALUES (13485, '石碣镇', '石碣镇', 130, 13459, 19);
INSERT INTO `option` VALUES (13486, '洪梅镇', '洪梅镇', 135, 13459, 19);
INSERT INTO `option` VALUES (13487, '麻涌镇', '麻涌镇', 140, 13459, 19);
INSERT INTO `option` VALUES (13488, '松山湖', '松山湖', 145, 13459, 19);
INSERT INTO `option` VALUES (13489, '桥头镇', '桥头镇', 150, 13459, 19);
INSERT INTO `option` VALUES (13490, '望牛墩镇', '望牛墩镇', 155, 13459, 19);
INSERT INTO `option` VALUES (13491, '中堂镇', '中堂镇', 160, 13459, 19);
INSERT INTO `option` VALUES (13492, '谢岗镇', '谢岗镇', 165, 13459, 19);
INSERT INTO `option` VALUES (13493, '中山市', '中山市', 55, 13382, 19);
INSERT INTO `option` VALUES (13494, '城区', '城区', 5, 13493, 19);
INSERT INTO `option` VALUES (13495, '火炬开发区', '火炬开发区', 10, 13493, 19);
INSERT INTO `option` VALUES (13496, '小榄镇', '小榄镇', 15, 13493, 19);
INSERT INTO `option` VALUES (13497, '古镇', '古镇', 20, 13493, 19);
INSERT INTO `option` VALUES (13498, '三乡镇', '三乡镇', 25, 13493, 19);
INSERT INTO `option` VALUES (13499, '民众镇', '民众镇', 30, 13493, 19);
INSERT INTO `option` VALUES (13500, '东凤镇', '东凤镇', 35, 13493, 19);
INSERT INTO `option` VALUES (13501, '板芙镇', '板芙镇', 40, 13493, 19);
INSERT INTO `option` VALUES (13502, '神湾镇', '神湾镇', 45, 13493, 19);
INSERT INTO `option` VALUES (13503, '横栏镇', '横栏镇', 50, 13493, 19);
INSERT INTO `option` VALUES (13504, '港口镇', '港口镇', 55, 13493, 19);
INSERT INTO `option` VALUES (13505, '三角镇', '三角镇', 60, 13493, 19);
INSERT INTO `option` VALUES (13506, '大涌镇', '大涌镇', 65, 13493, 19);
INSERT INTO `option` VALUES (13507, '南头镇', '南头镇', 70, 13493, 19);
INSERT INTO `option` VALUES (13508, '沙溪镇', '沙溪镇', 75, 13493, 19);
INSERT INTO `option` VALUES (13509, '坦洲镇', '坦洲镇', 80, 13493, 19);
INSERT INTO `option` VALUES (13510, '黄圃镇', '黄圃镇', 85, 13493, 19);
INSERT INTO `option` VALUES (13511, '五桂山镇', '五桂山镇', 90, 13493, 19);
INSERT INTO `option` VALUES (13512, '南朗镇', '南朗镇', 95, 13493, 19);
INSERT INTO `option` VALUES (13513, '沙朗镇', '沙朗镇', 100, 13493, 19);
INSERT INTO `option` VALUES (13514, '阜沙镇', '阜沙镇', 105, 13493, 19);
INSERT INTO `option` VALUES (13515, '东升镇', '东升镇', 110, 13493, 19);
INSERT INTO `option` VALUES (13516, '江门市', '江门市', 60, 13382, 19);
INSERT INTO `option` VALUES (13517, '台山市', '台山市', 5, 13516, 19);
INSERT INTO `option` VALUES (13518, '新会区', '新会区', 10, 13516, 19);
INSERT INTO `option` VALUES (13519, '鹤山市', '鹤山市', 15, 13516, 19);
INSERT INTO `option` VALUES (13520, '江海区', '江海区', 20, 13516, 19);
INSERT INTO `option` VALUES (13521, '蓬江区', '蓬江区', 25, 13516, 19);
INSERT INTO `option` VALUES (13522, '开平市', '开平市', 30, 13516, 19);
INSERT INTO `option` VALUES (13523, '恩平市', '恩平市', 35, 13516, 19);
INSERT INTO `option` VALUES (13524, '佛山市', '佛山市', 65, 13382, 19);
INSERT INTO `option` VALUES (13525, '顺德区', '顺德区', 5, 13524, 19);
INSERT INTO `option` VALUES (13526, '禅城区', '禅城区', 10, 13524, 19);
INSERT INTO `option` VALUES (13527, '高明区', '高明区', 15, 13524, 19);
INSERT INTO `option` VALUES (13528, '三水区', '三水区', 20, 13524, 19);
INSERT INTO `option` VALUES (13529, '南海区', '南海区', 25, 13524, 19);
INSERT INTO `option` VALUES (13530, '阳江市', '阳江市', 70, 13382, 19);
INSERT INTO `option` VALUES (13531, '江城区', '江城区', 5, 13530, 19);
INSERT INTO `option` VALUES (13532, '阳东县', '阳东县', 10, 13530, 19);
INSERT INTO `option` VALUES (13533, '阳春市', '阳春市', 15, 13530, 19);
INSERT INTO `option` VALUES (13534, '阳西县', '阳西县', 20, 13530, 19);
INSERT INTO `option` VALUES (13535, '湛江市', '湛江市', 75, 13382, 19);
INSERT INTO `option` VALUES (13536, '赤坎区', '赤坎区', 5, 13535, 19);
INSERT INTO `option` VALUES (13537, '霞山区', '霞山区', 10, 13535, 19);
INSERT INTO `option` VALUES (13538, '经济技术开发区', '经济技术开发区', 15, 13535, 19);
INSERT INTO `option` VALUES (13539, '麻章区', '麻章区', 20, 13535, 19);
INSERT INTO `option` VALUES (13540, '遂溪县', '遂溪县', 25, 13535, 19);
INSERT INTO `option` VALUES (13541, '廉江市', '廉江市', 30, 13535, 19);
INSERT INTO `option` VALUES (13542, '坡头区', '坡头区', 35, 13535, 19);
INSERT INTO `option` VALUES (13543, '雷州市', '雷州市', 40, 13535, 19);
INSERT INTO `option` VALUES (13544, '吴川市', '吴川市', 45, 13535, 19);
INSERT INTO `option` VALUES (13545, '徐闻县', '徐闻县', 50, 13535, 19);
INSERT INTO `option` VALUES (13546, '茂名市', '茂名市', 80, 13382, 19);
INSERT INTO `option` VALUES (13547, '茂南区', '茂南区', 5, 13546, 19);
INSERT INTO `option` VALUES (13548, '电白县', '电白县', 10, 13546, 19);
INSERT INTO `option` VALUES (13549, '高州市', '高州市', 15, 13546, 19);
INSERT INTO `option` VALUES (13550, '化州市', '化州市', 20, 13546, 19);
INSERT INTO `option` VALUES (13551, '茂港区', '茂港区', 25, 13546, 19);
INSERT INTO `option` VALUES (13552, '信宜市', '信宜市', 30, 13546, 19);
INSERT INTO `option` VALUES (13553, '肇庆市', '肇庆市', 85, 13382, 19);
INSERT INTO `option` VALUES (13554, '端州区', '端州区', 5, 13553, 19);
INSERT INTO `option` VALUES (13555, '四会市', '四会市', 10, 13553, 19);
INSERT INTO `option` VALUES (13556, '高要市', '高要市', 15, 13553, 19);
INSERT INTO `option` VALUES (13557, '广宁县', '广宁县', 20, 13553, 19);
INSERT INTO `option` VALUES (13558, '德庆县', '德庆县', 25, 13553, 19);
INSERT INTO `option` VALUES (13559, '怀集县', '怀集县', 30, 13553, 19);
INSERT INTO `option` VALUES (13560, '封开县', '封开县', 35, 13553, 19);
INSERT INTO `option` VALUES (13561, '鼎湖区', '鼎湖区', 40, 13553, 19);
INSERT INTO `option` VALUES (13562, '云浮市', '云浮市', 90, 13382, 19);
INSERT INTO `option` VALUES (13563, '云城区', '云城区', 5, 13562, 19);
INSERT INTO `option` VALUES (13564, '罗定市', '罗定市', 10, 13562, 19);
INSERT INTO `option` VALUES (13565, '云安县', '云安县', 15, 13562, 19);
INSERT INTO `option` VALUES (13566, '新兴县', '新兴县', 20, 13562, 19);
INSERT INTO `option` VALUES (13567, '郁南县', '郁南县', 25, 13562, 19);
INSERT INTO `option` VALUES (13568, '清远市', '清远市', 95, 13382, 19);
INSERT INTO `option` VALUES (13569, '连州市', '连州市', 5, 13568, 19);
INSERT INTO `option` VALUES (13570, '佛冈县', '佛冈县', 10, 13568, 19);
INSERT INTO `option` VALUES (13571, '阳山县', '阳山县', 15, 13568, 19);
INSERT INTO `option` VALUES (13572, '清新县', '清新县', 20, 13568, 19);
INSERT INTO `option` VALUES (13573, '连山县', '连山县', 25, 13568, 19);
INSERT INTO `option` VALUES (13574, '连南县', '连南县', 30, 13568, 19);
INSERT INTO `option` VALUES (13575, '清城区', '清城区', 35, 13568, 19);
INSERT INTO `option` VALUES (13576, '英德市', '英德市', 40, 13568, 19);
INSERT INTO `option` VALUES (13577, '潮州市', '潮州市', 100, 13382, 19);
INSERT INTO `option` VALUES (13578, '湘桥区', '湘桥区', 5, 13577, 19);
INSERT INTO `option` VALUES (13579, '枫溪区', '枫溪区', 10, 13577, 19);
INSERT INTO `option` VALUES (13580, '潮安县', '潮安县', 15, 13577, 19);
INSERT INTO `option` VALUES (13581, '饶平县', '饶平县', 20, 13577, 19);
INSERT INTO `option` VALUES (13582, '揭阳市', '揭阳市', 105, 13382, 19);
INSERT INTO `option` VALUES (13583, '东山区', '东山区', 5, 13582, 19);
INSERT INTO `option` VALUES (13584, '普宁市', '普宁市', 10, 13582, 19);
INSERT INTO `option` VALUES (13585, '榕城区', '榕城区', 15, 13582, 19);
INSERT INTO `option` VALUES (13586, '揭东县', '揭东县', 20, 13582, 19);
INSERT INTO `option` VALUES (13587, '揭西县', '揭西县', 25, 13582, 19);
INSERT INTO `option` VALUES (13588, '惠来县', '惠来县', 30, 13582, 19);
INSERT INTO `option` VALUES (13589, '广西壮族自治区', '广西壮族自治区', 100, 0, 19);
INSERT INTO `option` VALUES (13590, '南宁市', '南宁市', 5, 13589, 19);
INSERT INTO `option` VALUES (13591, '良庆区', '良庆区', 5, 13590, 19);
INSERT INTO `option` VALUES (13592, '江南区', '江南区', 10, 13590, 19);
INSERT INTO `option` VALUES (13593, '兴宁区', '兴宁区', 15, 13590, 19);
INSERT INTO `option` VALUES (13594, '青秀区', '青秀区', 20, 13590, 19);
INSERT INTO `option` VALUES (13595, '西乡塘区', '西乡塘区', 25, 13590, 19);
INSERT INTO `option` VALUES (13596, '横县', '横县', 30, 13590, 19);
INSERT INTO `option` VALUES (13597, '上林县', '上林县', 35, 13590, 19);
INSERT INTO `option` VALUES (13598, '隆安县', '隆安县', 40, 13590, 19);
INSERT INTO `option` VALUES (13599, '马山县', '马山县', 45, 13590, 19);
INSERT INTO `option` VALUES (13600, '武鸣县', '武鸣县', 50, 13590, 19);
INSERT INTO `option` VALUES (13601, '邕宁区', '邕宁区', 55, 13590, 19);
INSERT INTO `option` VALUES (13602, '宾阳县', '宾阳县', 60, 13590, 19);
INSERT INTO `option` VALUES (13603, '柳州市', '柳州市', 10, 13589, 19);
INSERT INTO `option` VALUES (13604, '融安县', '融安县', 5, 13603, 19);
INSERT INTO `option` VALUES (13605, '三江县', '三江县', 10, 13603, 19);
INSERT INTO `option` VALUES (13606, '融水县', '融水县', 15, 13603, 19);
INSERT INTO `option` VALUES (13607, '鱼峰区', '鱼峰区', 20, 13603, 19);
INSERT INTO `option` VALUES (13608, '城中区', '城中区', 25, 13603, 19);
INSERT INTO `option` VALUES (13609, '柳南区', '柳南区', 30, 13603, 19);
INSERT INTO `option` VALUES (13610, '柳北区', '柳北区', 35, 13603, 19);
INSERT INTO `option` VALUES (13611, '柳江县', '柳江县', 40, 13603, 19);
INSERT INTO `option` VALUES (13612, '柳城县', '柳城县', 45, 13603, 19);
INSERT INTO `option` VALUES (13613, '鹿寨县', '鹿寨县', 50, 13603, 19);
INSERT INTO `option` VALUES (13614, '桂林市', '桂林市', 15, 13589, 19);
INSERT INTO `option` VALUES (13615, '象山区', '象山区', 5, 13614, 19);
INSERT INTO `option` VALUES (13616, '恭城县', '恭城县', 10, 13614, 19);
INSERT INTO `option` VALUES (13617, '秀峰区', '秀峰区', 15, 13614, 19);
INSERT INTO `option` VALUES (13618, '叠彩区', '叠彩区', 20, 13614, 19);
INSERT INTO `option` VALUES (13619, '七星区', '七星区', 25, 13614, 19);
INSERT INTO `option` VALUES (13620, '雁山区', '雁山区', 30, 13614, 19);
INSERT INTO `option` VALUES (13621, '阳朔县', '阳朔县', 35, 13614, 19);
INSERT INTO `option` VALUES (13622, '临桂县', '临桂县', 40, 13614, 19);
INSERT INTO `option` VALUES (13623, '灵川县', '灵川县', 45, 13614, 19);
INSERT INTO `option` VALUES (13624, '全州县', '全州县', 50, 13614, 19);
INSERT INTO `option` VALUES (13625, '平乐县', '平乐县', 55, 13614, 19);
INSERT INTO `option` VALUES (13626, '兴安县', '兴安县', 60, 13614, 19);
INSERT INTO `option` VALUES (13627, '灌阳县', '灌阳县', 65, 13614, 19);
INSERT INTO `option` VALUES (13628, '荔浦县', '荔浦县', 70, 13614, 19);
INSERT INTO `option` VALUES (13629, '资源县', '资源县', 75, 13614, 19);
INSERT INTO `option` VALUES (13630, '永福县', '永福县', 80, 13614, 19);
INSERT INTO `option` VALUES (13631, '龙胜县', '龙胜县', 85, 13614, 19);
INSERT INTO `option` VALUES (13632, '梧州市', '梧州市', 20, 13589, 19);
INSERT INTO `option` VALUES (13633, '岑溪市', '岑溪市', 5, 13632, 19);
INSERT INTO `option` VALUES (13634, '苍梧县', '苍梧县', 10, 13632, 19);
INSERT INTO `option` VALUES (13635, '藤县', '藤县', 15, 13632, 19);
INSERT INTO `option` VALUES (13636, '蒙山县', '蒙山县', 20, 13632, 19);
INSERT INTO `option` VALUES (13637, '万秀区', '万秀区', 25, 13632, 19);
INSERT INTO `option` VALUES (13638, '蝶山区', '蝶山区', 30, 13632, 19);
INSERT INTO `option` VALUES (13639, '长洲区', '长洲区', 35, 13632, 19);
INSERT INTO `option` VALUES (13640, '北海市', '北海市', 25, 13589, 19);
INSERT INTO `option` VALUES (13641, '海城区', '海城区', 5, 13640, 19);
INSERT INTO `option` VALUES (13642, '银海区', '银海区', 10, 13640, 19);
INSERT INTO `option` VALUES (13643, '合浦县', '合浦县', 15, 13640, 19);
INSERT INTO `option` VALUES (13644, '铁山港区', '铁山港区', 20, 13640, 19);
INSERT INTO `option` VALUES (13645, '防城港市', '防城港市', 30, 13589, 19);
INSERT INTO `option` VALUES (13646, '防城区', '防城区', 5, 13645, 19);
INSERT INTO `option` VALUES (13647, '港口区', '港口区', 10, 13645, 19);
INSERT INTO `option` VALUES (13648, '东兴市', '东兴市', 15, 13645, 19);
INSERT INTO `option` VALUES (13649, '上思县', '上思县', 20, 13645, 19);
INSERT INTO `option` VALUES (13650, '钦州市', '钦州市', 35, 13589, 19);
INSERT INTO `option` VALUES (13651, '钦南区', '钦南区', 5, 13650, 19);
INSERT INTO `option` VALUES (13652, '钦北区', '钦北区', 10, 13650, 19);
INSERT INTO `option` VALUES (13653, '浦北县', '浦北县', 15, 13650, 19);
INSERT INTO `option` VALUES (13654, '灵山县', '灵山县', 20, 13650, 19);
INSERT INTO `option` VALUES (13655, '贵港市', '贵港市', 40, 13589, 19);
INSERT INTO `option` VALUES (13656, '港南区', '港南区', 5, 13655, 19);
INSERT INTO `option` VALUES (13657, '港北区', '港北区', 10, 13655, 19);
INSERT INTO `option` VALUES (13658, '桂平市', '桂平市', 15, 13655, 19);
INSERT INTO `option` VALUES (13659, '平南县', '平南县', 20, 13655, 19);
INSERT INTO `option` VALUES (13660, '覃塘区', '覃塘区', 25, 13655, 19);
INSERT INTO `option` VALUES (13661, '玉林市', '玉林市', 45, 13589, 19);
INSERT INTO `option` VALUES (13662, '玉州区', '玉州区', 5, 13661, 19);
INSERT INTO `option` VALUES (13663, '北流市', '北流市', 10, 13661, 19);
INSERT INTO `option` VALUES (13664, '容县', '容县', 15, 13661, 19);
INSERT INTO `option` VALUES (13665, '博白县', '博白县', 20, 13661, 19);
INSERT INTO `option` VALUES (13666, '陆川县', '陆川县', 25, 13661, 19);
INSERT INTO `option` VALUES (13667, '兴业县', '兴业县', 30, 13661, 19);
INSERT INTO `option` VALUES (13668, '贺州市', '贺州市', 50, 13589, 19);
INSERT INTO `option` VALUES (13669, '八步区', '八步区', 5, 13668, 19);
INSERT INTO `option` VALUES (13670, '钟山县', '钟山县', 10, 13668, 19);
INSERT INTO `option` VALUES (13671, '昭平县', '昭平县', 15, 13668, 19);
INSERT INTO `option` VALUES (13672, '富川县', '富川县', 20, 13668, 19);
INSERT INTO `option` VALUES (13673, '平桂管理区', '平桂管理区', 25, 13668, 19);
INSERT INTO `option` VALUES (13674, '百色市', '百色市', 55, 13589, 19);
INSERT INTO `option` VALUES (13675, '右江区', '右江区', 5, 13674, 19);
INSERT INTO `option` VALUES (13676, '平果县', '平果县', 10, 13674, 19);
INSERT INTO `option` VALUES (13677, '乐业县', '乐业县', 15, 13674, 19);
INSERT INTO `option` VALUES (13678, '田阳县', '田阳县', 20, 13674, 19);
INSERT INTO `option` VALUES (13679, '西林县', '西林县', 25, 13674, 19);
INSERT INTO `option` VALUES (13680, '田林县', '田林县', 30, 13674, 19);
INSERT INTO `option` VALUES (13681, '德保县', '德保县', 35, 13674, 19);
INSERT INTO `option` VALUES (13682, '靖西县', '靖西县', 40, 13674, 19);
INSERT INTO `option` VALUES (13683, '田东县', '田东县', 45, 13674, 19);
INSERT INTO `option` VALUES (13684, '那坡县', '那坡县', 50, 13674, 19);
INSERT INTO `option` VALUES (13685, '隆林县', '隆林县', 55, 13674, 19);
INSERT INTO `option` VALUES (13686, '凌云县', '凌云县', 60, 13674, 19);
INSERT INTO `option` VALUES (13687, '河池市', '河池市', 60, 13589, 19);
INSERT INTO `option` VALUES (13688, '宜州市', '宜州市', 5, 13687, 19);
INSERT INTO `option` VALUES (13689, '天峨县', '天峨县', 10, 13687, 19);
INSERT INTO `option` VALUES (13690, '凤山县', '凤山县', 15, 13687, 19);
INSERT INTO `option` VALUES (13691, '南丹县', '南丹县', 20, 13687, 19);
INSERT INTO `option` VALUES (13692, '东兰县', '东兰县', 25, 13687, 19);
INSERT INTO `option` VALUES (13693, '巴马县', '巴马县', 30, 13687, 19);
INSERT INTO `option` VALUES (13694, '环江县', '环江县', 35, 13687, 19);
INSERT INTO `option` VALUES (13695, '大化县', '大化县', 40, 13687, 19);
INSERT INTO `option` VALUES (13696, '都安县', '都安县', 45, 13687, 19);
INSERT INTO `option` VALUES (13697, '金城江区', '金城江区', 50, 13687, 19);
INSERT INTO `option` VALUES (13698, '罗城县', '罗城县', 55, 13687, 19);
INSERT INTO `option` VALUES (13699, '来宾市', '来宾市', 65, 13589, 19);
INSERT INTO `option` VALUES (13700, '兴宾区', '兴宾区', 5, 13699, 19);
INSERT INTO `option` VALUES (13701, '合山市', '合山市', 10, 13699, 19);
INSERT INTO `option` VALUES (13702, '忻城县', '忻城县', 15, 13699, 19);
INSERT INTO `option` VALUES (13703, '武宣县', '武宣县', 20, 13699, 19);
INSERT INTO `option` VALUES (13704, '象州县', '象州县', 25, 13699, 19);
INSERT INTO `option` VALUES (13705, '金秀县', '金秀县', 30, 13699, 19);
INSERT INTO `option` VALUES (13706, '崇左市', '崇左市', 70, 13589, 19);
INSERT INTO `option` VALUES (13707, '江州区', '江州区', 5, 13706, 19);
INSERT INTO `option` VALUES (13708, '凭祥市', '凭祥市', 10, 13706, 19);
INSERT INTO `option` VALUES (13709, '扶绥县', '扶绥县', 15, 13706, 19);
INSERT INTO `option` VALUES (13710, '大新县', '大新县', 20, 13706, 19);
INSERT INTO `option` VALUES (13711, '天等县', '天等县', 25, 13706, 19);
INSERT INTO `option` VALUES (13712, '宁明县', '宁明县', 30, 13706, 19);
INSERT INTO `option` VALUES (13713, '龙州县', '龙州县', 35, 13706, 19);
INSERT INTO `option` VALUES (13714, '江西省', '江西省', 105, 0, 19);
INSERT INTO `option` VALUES (13715, '南昌市', '南昌市', 5, 13714, 19);
INSERT INTO `option` VALUES (13716, '青云谱区', '青云谱区', 5, 13715, 19);
INSERT INTO `option` VALUES (13717, '西湖区', '西湖区', 10, 13715, 19);
INSERT INTO `option` VALUES (13718, '东湖区', '东湖区', 15, 13715, 19);
INSERT INTO `option` VALUES (13719, '昌北区', '昌北区', 20, 13715, 19);
INSERT INTO `option` VALUES (13720, '南昌县', '南昌县', 25, 13715, 19);
INSERT INTO `option` VALUES (13721, '进贤县', '进贤县', 30, 13715, 19);
INSERT INTO `option` VALUES (13722, '安义县', '安义县', 35, 13715, 19);
INSERT INTO `option` VALUES (13723, '青山湖区', '青山湖区', 40, 13715, 19);
INSERT INTO `option` VALUES (13724, '红谷滩新区', '红谷滩新区', 45, 13715, 19);
INSERT INTO `option` VALUES (13725, '新建县', '新建县', 50, 13715, 19);
INSERT INTO `option` VALUES (13726, '湾里区', '湾里区', 55, 13715, 19);
INSERT INTO `option` VALUES (13727, '高新区', '高新区', 60, 13715, 19);
INSERT INTO `option` VALUES (13728, '景德镇市', '景德镇市', 10, 13714, 19);
INSERT INTO `option` VALUES (13729, '珠山区', '珠山区', 5, 13728, 19);
INSERT INTO `option` VALUES (13730, '乐平市', '乐平市', 10, 13728, 19);
INSERT INTO `option` VALUES (13731, '浮梁县', '浮梁县', 15, 13728, 19);
INSERT INTO `option` VALUES (13732, '昌江区', '昌江区', 20, 13728, 19);
INSERT INTO `option` VALUES (13733, '萍乡市', '萍乡市', 15, 13714, 19);
INSERT INTO `option` VALUES (13734, '湘东区', '湘东区', 5, 13733, 19);
INSERT INTO `option` VALUES (13735, '莲花县', '莲花县', 10, 13733, 19);
INSERT INTO `option` VALUES (13736, '上栗县', '上栗县', 15, 13733, 19);
INSERT INTO `option` VALUES (13737, '芦溪县', '芦溪县', 20, 13733, 19);
INSERT INTO `option` VALUES (13738, '安源区', '安源区', 25, 13733, 19);
INSERT INTO `option` VALUES (13739, '新余市', '新余市', 20, 13714, 19);
INSERT INTO `option` VALUES (13740, '分宜县', '分宜县', 5, 13739, 19);
INSERT INTO `option` VALUES (13741, '渝水区', '渝水区', 10, 13739, 19);
INSERT INTO `option` VALUES (13742, '九江市', '九江市', 25, 13714, 19);
INSERT INTO `option` VALUES (13743, '九江县', '九江县', 5, 13742, 19);
INSERT INTO `option` VALUES (13744, '瑞昌市', '瑞昌市', 10, 13742, 19);
INSERT INTO `option` VALUES (13745, '星子县', '星子县', 15, 13742, 19);
INSERT INTO `option` VALUES (13746, '武宁县', '武宁县', 20, 13742, 19);
INSERT INTO `option` VALUES (13747, '彭泽县', '彭泽县', 25, 13742, 19);
INSERT INTO `option` VALUES (13748, '永修县', '永修县', 30, 13742, 19);
INSERT INTO `option` VALUES (13749, '修水县', '修水县', 35, 13742, 19);
INSERT INTO `option` VALUES (13750, '湖口县', '湖口县', 40, 13742, 19);
INSERT INTO `option` VALUES (13751, '德安县', '德安县', 45, 13742, 19);
INSERT INTO `option` VALUES (13752, '都昌县', '都昌县', 50, 13742, 19);
INSERT INTO `option` VALUES (13753, '共青城市', '共青城市', 55, 13742, 19);
INSERT INTO `option` VALUES (13754, '经济技术开发区', '经济技术开发区', 60, 13742, 19);
INSERT INTO `option` VALUES (13755, '八里湖新区', '八里湖新区', 65, 13742, 19);
INSERT INTO `option` VALUES (13756, '庐山风景名胜区', '庐山风景名胜区', 70, 13742, 19);
INSERT INTO `option` VALUES (13757, '庐山区', '庐山区', 75, 13742, 19);
INSERT INTO `option` VALUES (13758, '浔阳区', '浔阳区', 80, 13742, 19);
INSERT INTO `option` VALUES (13759, '鹰潭市', '鹰潭市', 30, 13714, 19);
INSERT INTO `option` VALUES (13760, '龙虎山风景旅游区', '龙虎山风景旅游区', 5, 13759, 19);
INSERT INTO `option` VALUES (13761, '余江县', '余江县', 10, 13759, 19);
INSERT INTO `option` VALUES (13762, '贵溪市', '贵溪市', 15, 13759, 19);
INSERT INTO `option` VALUES (13763, '月湖区', '月湖区', 20, 13759, 19);
INSERT INTO `option` VALUES (13764, '上饶市', '上饶市', 35, 13714, 19);
INSERT INTO `option` VALUES (13765, '德兴市', '德兴市', 5, 13764, 19);
INSERT INTO `option` VALUES (13766, '广丰县', '广丰县', 10, 13764, 19);
INSERT INTO `option` VALUES (13767, '鄱阳县', '鄱阳县', 15, 13764, 19);
INSERT INTO `option` VALUES (13768, '婺源县', '婺源县', 20, 13764, 19);
INSERT INTO `option` VALUES (13769, '余干县', '余干县', 25, 13764, 19);
INSERT INTO `option` VALUES (13770, '横峰县', '横峰县', 30, 13764, 19);
INSERT INTO `option` VALUES (13771, '弋阳县', '弋阳县', 35, 13764, 19);
INSERT INTO `option` VALUES (13772, '铅山县', '铅山县', 40, 13764, 19);
INSERT INTO `option` VALUES (13773, '玉山县', '玉山县', 45, 13764, 19);
INSERT INTO `option` VALUES (13774, '万年县', '万年县', 50, 13764, 19);
INSERT INTO `option` VALUES (13775, '信州区', '信州区', 55, 13764, 19);
INSERT INTO `option` VALUES (13776, '上饶县', '上饶县', 60, 13764, 19);
INSERT INTO `option` VALUES (13777, '宜春市', '宜春市', 40, 13714, 19);
INSERT INTO `option` VALUES (13778, '丰城市', '丰城市', 5, 13777, 19);
INSERT INTO `option` VALUES (13779, '樟树市', '樟树市', 10, 13777, 19);
INSERT INTO `option` VALUES (13780, '袁州区', '袁州区', 15, 13777, 19);
INSERT INTO `option` VALUES (13781, '高安市', '高安市', 20, 13777, 19);
INSERT INTO `option` VALUES (13782, '铜鼓县', '铜鼓县', 25, 13777, 19);
INSERT INTO `option` VALUES (13783, '靖安县', '靖安县', 30, 13777, 19);
INSERT INTO `option` VALUES (13784, '宜丰县', '宜丰县', 35, 13777, 19);
INSERT INTO `option` VALUES (13785, '奉新县', '奉新县', 40, 13777, 19);
INSERT INTO `option` VALUES (13786, '万载县', '万载县', 45, 13777, 19);
INSERT INTO `option` VALUES (13787, '上高县', '上高县', 50, 13777, 19);
INSERT INTO `option` VALUES (13788, '抚州市', '抚州市', 45, 13714, 19);
INSERT INTO `option` VALUES (13789, '南丰县', '南丰县', 5, 13788, 19);
INSERT INTO `option` VALUES (13790, '乐安县', '乐安县', 10, 13788, 19);
INSERT INTO `option` VALUES (13791, '金溪县', '金溪县', 15, 13788, 19);
INSERT INTO `option` VALUES (13792, '南城县', '南城县', 20, 13788, 19);
INSERT INTO `option` VALUES (13793, '东乡县', '东乡县', 25, 13788, 19);
INSERT INTO `option` VALUES (13794, '资溪县', '资溪县', 30, 13788, 19);
INSERT INTO `option` VALUES (13795, '宜黄县', '宜黄县', 35, 13788, 19);
INSERT INTO `option` VALUES (13796, '崇仁县', '崇仁县', 40, 13788, 19);
INSERT INTO `option` VALUES (13797, '黎川县', '黎川县', 45, 13788, 19);
INSERT INTO `option` VALUES (13798, '广昌县', '广昌县', 50, 13788, 19);
INSERT INTO `option` VALUES (13799, '临川区', '临川区', 55, 13788, 19);
INSERT INTO `option` VALUES (13800, '吉安市', '吉安市', 50, 13714, 19);
INSERT INTO `option` VALUES (13801, '青原区', '青原区', 5, 13800, 19);
INSERT INTO `option` VALUES (13802, '吉州区', '吉州区', 10, 13800, 19);
INSERT INTO `option` VALUES (13803, '井冈山市', '井冈山市', 15, 13800, 19);
INSERT INTO `option` VALUES (13804, '吉安县', '吉安县', 20, 13800, 19);
INSERT INTO `option` VALUES (13805, '永丰县', '永丰县', 25, 13800, 19);
INSERT INTO `option` VALUES (13806, '永新县', '永新县', 30, 13800, 19);
INSERT INTO `option` VALUES (13807, '新干县', '新干县', 35, 13800, 19);
INSERT INTO `option` VALUES (13808, '泰和县', '泰和县', 40, 13800, 19);
INSERT INTO `option` VALUES (13809, '峡江县', '峡江县', 45, 13800, 19);
INSERT INTO `option` VALUES (13810, '遂川县', '遂川县', 50, 13800, 19);
INSERT INTO `option` VALUES (13811, '安福县', '安福县', 55, 13800, 19);
INSERT INTO `option` VALUES (13812, '吉水县', '吉水县', 60, 13800, 19);
INSERT INTO `option` VALUES (13813, '万安县', '万安县', 65, 13800, 19);
INSERT INTO `option` VALUES (13814, '赣州市', '赣州市', 55, 13714, 19);
INSERT INTO `option` VALUES (13815, '章贡区', '章贡区', 5, 13814, 19);
INSERT INTO `option` VALUES (13816, '南康市', '南康市', 10, 13814, 19);
INSERT INTO `option` VALUES (13817, '瑞金市', '瑞金市', 15, 13814, 19);
INSERT INTO `option` VALUES (13818, '石城县', '石城县', 20, 13814, 19);
INSERT INTO `option` VALUES (13819, '安远县', '安远县', 25, 13814, 19);
INSERT INTO `option` VALUES (13820, '赣县', '赣县', 30, 13814, 19);
INSERT INTO `option` VALUES (13821, '宁都县', '宁都县', 35, 13814, 19);
INSERT INTO `option` VALUES (13822, '寻乌县', '寻乌县', 40, 13814, 19);
INSERT INTO `option` VALUES (13823, '兴国县', '兴国县', 45, 13814, 19);
INSERT INTO `option` VALUES (13824, '定南县', '定南县', 50, 13814, 19);
INSERT INTO `option` VALUES (13825, '上犹县', '上犹县', 55, 13814, 19);
INSERT INTO `option` VALUES (13826, '于都县', '于都县', 60, 13814, 19);
INSERT INTO `option` VALUES (13827, '龙南县', '龙南县', 65, 13814, 19);
INSERT INTO `option` VALUES (13828, '崇义县', '崇义县', 70, 13814, 19);
INSERT INTO `option` VALUES (13829, '大余县', '大余县', 75, 13814, 19);
INSERT INTO `option` VALUES (13830, '信丰县', '信丰县', 80, 13814, 19);
INSERT INTO `option` VALUES (13831, '全南县', '全南县', 85, 13814, 19);
INSERT INTO `option` VALUES (13832, '会昌县', '会昌县', 90, 13814, 19);
INSERT INTO `option` VALUES (13833, '四川省', '四川省', 110, 0, 19);
INSERT INTO `option` VALUES (13834, '成都市', '成都市', 5, 13833, 19);
INSERT INTO `option` VALUES (13835, '武侯区', '武侯区', 5, 13834, 19);
INSERT INTO `option` VALUES (13836, '金牛区', '金牛区', 10, 13834, 19);
INSERT INTO `option` VALUES (13837, '青羊区', '青羊区', 15, 13834, 19);
INSERT INTO `option` VALUES (13838, '成华区', '成华区', 20, 13834, 19);
INSERT INTO `option` VALUES (13839, '高新区', '高新区', 25, 13834, 19);
INSERT INTO `option` VALUES (13840, '锦江区', '锦江区', 30, 13834, 19);
INSERT INTO `option` VALUES (13841, '郫县', '郫县', 35, 13834, 19);
INSERT INTO `option` VALUES (13842, '双流县', '双流县', 40, 13834, 19);
INSERT INTO `option` VALUES (13843, '高新西区', '高新西区', 45, 13834, 19);
INSERT INTO `option` VALUES (13844, '龙泉驿区', '龙泉驿区', 50, 13834, 19);
INSERT INTO `option` VALUES (13845, '新都区', '新都区', 55, 13834, 19);
INSERT INTO `option` VALUES (13846, '温江区', '温江区', 60, 13834, 19);
INSERT INTO `option` VALUES (13847, '都江堰市', '都江堰市', 65, 13834, 19);
INSERT INTO `option` VALUES (13848, '彭州市', '彭州市', 70, 13834, 19);
INSERT INTO `option` VALUES (13849, '青白江区', '青白江区', 75, 13834, 19);
INSERT INTO `option` VALUES (13850, '崇州市', '崇州市', 80, 13834, 19);
INSERT INTO `option` VALUES (13851, '金堂县', '金堂县', 85, 13834, 19);
INSERT INTO `option` VALUES (13852, '新津县', '新津县', 90, 13834, 19);
INSERT INTO `option` VALUES (13853, '邛崃市', '邛崃市', 95, 13834, 19);
INSERT INTO `option` VALUES (13854, '大邑县', '大邑县', 100, 13834, 19);
INSERT INTO `option` VALUES (13855, '蒲江县', '蒲江县', 105, 13834, 19);
INSERT INTO `option` VALUES (13856, '自贡市', '自贡市', 10, 13833, 19);
INSERT INTO `option` VALUES (13857, '自流井区', '自流井区', 5, 13856, 19);
INSERT INTO `option` VALUES (13858, '沿滩区', '沿滩区', 10, 13856, 19);
INSERT INTO `option` VALUES (13859, '荣县', '荣县', 15, 13856, 19);
INSERT INTO `option` VALUES (13860, '富顺县', '富顺县', 20, 13856, 19);
INSERT INTO `option` VALUES (13861, '大安区', '大安区', 25, 13856, 19);
INSERT INTO `option` VALUES (13862, '贡井区', '贡井区', 30, 13856, 19);
INSERT INTO `option` VALUES (13863, '攀枝花市', '攀枝花市', 15, 13833, 19);
INSERT INTO `option` VALUES (13864, '仁和区', '仁和区', 5, 13863, 19);
INSERT INTO `option` VALUES (13865, '西区', '西区', 10, 13863, 19);
INSERT INTO `option` VALUES (13866, '东区', '东区', 15, 13863, 19);
INSERT INTO `option` VALUES (13867, '米易县', '米易县', 20, 13863, 19);
INSERT INTO `option` VALUES (13868, '盐边县', '盐边县', 25, 13863, 19);
INSERT INTO `option` VALUES (13869, '泸州市', '泸州市', 20, 13833, 19);
INSERT INTO `option` VALUES (13870, '纳溪区', '纳溪区', 5, 13869, 19);
INSERT INTO `option` VALUES (13871, '江阳区', '江阳区', 10, 13869, 19);
INSERT INTO `option` VALUES (13872, '龙马潭区', '龙马潭区', 15, 13869, 19);
INSERT INTO `option` VALUES (13873, '泸县', '泸县', 20, 13869, 19);
INSERT INTO `option` VALUES (13874, '合江县', '合江县', 25, 13869, 19);
INSERT INTO `option` VALUES (13875, '叙永县', '叙永县', 30, 13869, 19);
INSERT INTO `option` VALUES (13876, '古蔺县', '古蔺县', 35, 13869, 19);
INSERT INTO `option` VALUES (13877, '绵阳市', '绵阳市', 25, 13833, 19);
INSERT INTO `option` VALUES (13878, '江油市', '江油市', 5, 13877, 19);
INSERT INTO `option` VALUES (13879, '涪城区', '涪城区', 10, 13877, 19);
INSERT INTO `option` VALUES (13880, '游仙区', '游仙区', 15, 13877, 19);
INSERT INTO `option` VALUES (13881, '高新区', '高新区', 20, 13877, 19);
INSERT INTO `option` VALUES (13882, '经开区', '经开区', 25, 13877, 19);
INSERT INTO `option` VALUES (13883, '盐亭县', '盐亭县', 30, 13877, 19);
INSERT INTO `option` VALUES (13884, '三台县', '三台县', 35, 13877, 19);
INSERT INTO `option` VALUES (13885, '平武县', '平武县', 40, 13877, 19);
INSERT INTO `option` VALUES (13886, '北川县', '北川县', 45, 13877, 19);
INSERT INTO `option` VALUES (13887, '安县', '安县', 50, 13877, 19);
INSERT INTO `option` VALUES (13888, '梓潼县', '梓潼县', 55, 13877, 19);
INSERT INTO `option` VALUES (13889, '德阳市', '德阳市', 30, 13833, 19);
INSERT INTO `option` VALUES (13890, '广汉市', '广汉市', 5, 13889, 19);
INSERT INTO `option` VALUES (13891, '什邡市', '什邡市', 10, 13889, 19);
INSERT INTO `option` VALUES (13892, '旌阳区', '旌阳区', 15, 13889, 19);
INSERT INTO `option` VALUES (13893, '绵竹市', '绵竹市', 20, 13889, 19);
INSERT INTO `option` VALUES (13894, '罗江县', '罗江县', 25, 13889, 19);
INSERT INTO `option` VALUES (13895, '中江县', '中江县', 30, 13889, 19);
INSERT INTO `option` VALUES (13896, '广元市', '广元市', 35, 13833, 19);
INSERT INTO `option` VALUES (13897, '元坝区', '元坝区', 5, 13896, 19);
INSERT INTO `option` VALUES (13898, '朝天区', '朝天区', 10, 13896, 19);
INSERT INTO `option` VALUES (13899, '利州区', '利州区', 15, 13896, 19);
INSERT INTO `option` VALUES (13900, '青川县', '青川县', 20, 13896, 19);
INSERT INTO `option` VALUES (13901, '旺苍县', '旺苍县', 25, 13896, 19);
INSERT INTO `option` VALUES (13902, '剑阁县', '剑阁县', 30, 13896, 19);
INSERT INTO `option` VALUES (13903, '苍溪县', '苍溪县', 35, 13896, 19);
INSERT INTO `option` VALUES (13904, '遂宁市', '遂宁市', 40, 13833, 19);
INSERT INTO `option` VALUES (13905, '船山区', '船山区', 5, 13904, 19);
INSERT INTO `option` VALUES (13906, '射洪县', '射洪县', 10, 13904, 19);
INSERT INTO `option` VALUES (13907, '蓬溪县', '蓬溪县', 15, 13904, 19);
INSERT INTO `option` VALUES (13908, '大英县', '大英县', 20, 13904, 19);
INSERT INTO `option` VALUES (13909, '安居区', '安居区', 25, 13904, 19);
INSERT INTO `option` VALUES (13910, '内江市', '内江市', 45, 13833, 19);
INSERT INTO `option` VALUES (13911, '东兴区', '东兴区', 5, 13910, 19);
INSERT INTO `option` VALUES (13912, '资中县', '资中县', 10, 13910, 19);
INSERT INTO `option` VALUES (13913, '隆昌县', '隆昌县', 15, 13910, 19);
INSERT INTO `option` VALUES (13914, '威远县', '威远县', 20, 13910, 19);
INSERT INTO `option` VALUES (13915, '市中区', '市中区', 25, 13910, 19);
INSERT INTO `option` VALUES (13916, '乐山市', '乐山市', 50, 13833, 19);
INSERT INTO `option` VALUES (13917, '市中区', '市中区', 5, 13916, 19);
INSERT INTO `option` VALUES (13918, '峨眉山市', '峨眉山市', 10, 13916, 19);
INSERT INTO `option` VALUES (13919, '五通桥区', '五通桥区', 15, 13916, 19);
INSERT INTO `option` VALUES (13920, '沙湾区', '沙湾区', 20, 13916, 19);
INSERT INTO `option` VALUES (13921, '金口河区', '金口河区', 25, 13916, 19);
INSERT INTO `option` VALUES (13922, '夹江县', '夹江县', 30, 13916, 19);
INSERT INTO `option` VALUES (13923, '井研县', '井研县', 35, 13916, 19);
INSERT INTO `option` VALUES (13924, '犍为县', '犍为县', 40, 13916, 19);
INSERT INTO `option` VALUES (13925, '沐川县', '沐川县', 45, 13916, 19);
INSERT INTO `option` VALUES (13926, '峨边县', '峨边县', 50, 13916, 19);
INSERT INTO `option` VALUES (13927, '马边县', '马边县', 55, 13916, 19);
INSERT INTO `option` VALUES (13928, '宜宾市', '宜宾市', 55, 13833, 19);
INSERT INTO `option` VALUES (13929, '宜宾县', '宜宾县', 5, 13928, 19);
INSERT INTO `option` VALUES (13930, '南溪区', '南溪区', 10, 13928, 19);
INSERT INTO `option` VALUES (13931, '江安县', '江安县', 15, 13928, 19);
INSERT INTO `option` VALUES (13932, '长宁县', '长宁县', 20, 13928, 19);
INSERT INTO `option` VALUES (13933, '兴文县', '兴文县', 25, 13928, 19);
INSERT INTO `option` VALUES (13934, '珙县', '珙县', 30, 13928, 19);
INSERT INTO `option` VALUES (13935, '翠屏区', '翠屏区', 35, 13928, 19);
INSERT INTO `option` VALUES (13936, '高县', '高县', 40, 13928, 19);
INSERT INTO `option` VALUES (13937, '屏山县', '屏山县', 45, 13928, 19);
INSERT INTO `option` VALUES (13938, '筠连县', '筠连县', 50, 13928, 19);
INSERT INTO `option` VALUES (13939, '广安市', '广安市', 60, 13833, 19);
INSERT INTO `option` VALUES (13940, '前锋区', '前锋区', 5, 13939, 19);
INSERT INTO `option` VALUES (13941, '岳池县', '岳池县', 10, 13939, 19);
INSERT INTO `option` VALUES (13942, '武胜县', '武胜县', 15, 13939, 19);
INSERT INTO `option` VALUES (13943, '邻水县', '邻水县', 20, 13939, 19);
INSERT INTO `option` VALUES (13944, '广安区', '广安区', 25, 13939, 19);
INSERT INTO `option` VALUES (13945, '华蓥市', '华蓥市', 30, 13939, 19);
INSERT INTO `option` VALUES (13946, '南充市', '南充市', 65, 13833, 19);
INSERT INTO `option` VALUES (13947, '顺庆区', '顺庆区', 5, 13946, 19);
INSERT INTO `option` VALUES (13948, '高坪区', '高坪区', 10, 13946, 19);
INSERT INTO `option` VALUES (13949, '嘉陵区', '嘉陵区', 15, 13946, 19);
INSERT INTO `option` VALUES (13950, '西充县', '西充县', 20, 13946, 19);
INSERT INTO `option` VALUES (13951, '阆中市', '阆中市', 25, 13946, 19);
INSERT INTO `option` VALUES (13952, '南部县', '南部县', 30, 13946, 19);
INSERT INTO `option` VALUES (13953, '仪陇县', '仪陇县', 35, 13946, 19);
INSERT INTO `option` VALUES (13954, '蓬安县', '蓬安县', 40, 13946, 19);
INSERT INTO `option` VALUES (13955, '营山县', '营山县', 45, 13946, 19);
INSERT INTO `option` VALUES (13956, '达州市', '达州市', 70, 13833, 19);
INSERT INTO `option` VALUES (13957, '通川区', '通川区', 5, 13956, 19);
INSERT INTO `option` VALUES (13958, '达县', '达县', 10, 13956, 19);
INSERT INTO `option` VALUES (13959, '大竹县', '大竹县', 15, 13956, 19);
INSERT INTO `option` VALUES (13960, '渠县', '渠县', 20, 13956, 19);
INSERT INTO `option` VALUES (13961, '万源市', '万源市', 25, 13956, 19);
INSERT INTO `option` VALUES (13962, '宣汉县', '宣汉县', 30, 13956, 19);
INSERT INTO `option` VALUES (13963, '开江县', '开江县', 35, 13956, 19);
INSERT INTO `option` VALUES (13964, '巴中市', '巴中市', 75, 13833, 19);
INSERT INTO `option` VALUES (13965, '巴州区', '巴州区', 5, 13964, 19);
INSERT INTO `option` VALUES (13966, '恩阳区', '恩阳区', 10, 13964, 19);
INSERT INTO `option` VALUES (13967, '南江县', '南江县', 15, 13964, 19);
INSERT INTO `option` VALUES (13968, '平昌县', '平昌县', 20, 13964, 19);
INSERT INTO `option` VALUES (13969, '通江县', '通江县', 25, 13964, 19);
INSERT INTO `option` VALUES (13970, '雅安市', '雅安市', 80, 13833, 19);
INSERT INTO `option` VALUES (13971, '芦山县', '芦山县', 5, 13970, 19);
INSERT INTO `option` VALUES (13972, '石棉县', '石棉县', 10, 13970, 19);
INSERT INTO `option` VALUES (13973, '名山区', '名山区', 15, 13970, 19);
INSERT INTO `option` VALUES (13974, '天全县', '天全县', 20, 13970, 19);
INSERT INTO `option` VALUES (13975, '荥经县', '荥经县', 25, 13970, 19);
INSERT INTO `option` VALUES (13976, '汉源县', '汉源县', 30, 13970, 19);
INSERT INTO `option` VALUES (13977, '宝兴县', '宝兴县', 35, 13970, 19);
INSERT INTO `option` VALUES (13978, '雨城区', '雨城区', 40, 13970, 19);
INSERT INTO `option` VALUES (13979, '眉山市', '眉山市', 85, 13833, 19);
INSERT INTO `option` VALUES (13980, '仁寿县', '仁寿县', 5, 13979, 19);
INSERT INTO `option` VALUES (13981, '彭山县', '彭山县', 10, 13979, 19);
INSERT INTO `option` VALUES (13982, '洪雅县', '洪雅县', 15, 13979, 19);
INSERT INTO `option` VALUES (13983, '丹棱县', '丹棱县', 20, 13979, 19);
INSERT INTO `option` VALUES (13984, '青神县', '青神县', 25, 13979, 19);
INSERT INTO `option` VALUES (13985, '东坡区', '东坡区', 30, 13979, 19);
INSERT INTO `option` VALUES (13986, '资阳市', '资阳市', 90, 13833, 19);
INSERT INTO `option` VALUES (13987, '雁江区', '雁江区', 5, 13986, 19);
INSERT INTO `option` VALUES (13988, '安岳县', '安岳县', 10, 13986, 19);
INSERT INTO `option` VALUES (13989, '乐至县', '乐至县', 15, 13986, 19);
INSERT INTO `option` VALUES (13990, '简阳市', '简阳市', 20, 13986, 19);
INSERT INTO `option` VALUES (13991, '阿坝州', '阿坝州', 95, 13833, 19);
INSERT INTO `option` VALUES (13992, '马尔康县', '马尔康县', 5, 13991, 19);
INSERT INTO `option` VALUES (13993, '九寨沟县', '九寨沟县', 10, 13991, 19);
INSERT INTO `option` VALUES (13994, '红原县', '红原县', 15, 13991, 19);
INSERT INTO `option` VALUES (13995, '阿坝县', '阿坝县', 20, 13991, 19);
INSERT INTO `option` VALUES (13996, '理县', '理县', 25, 13991, 19);
INSERT INTO `option` VALUES (13997, '若尔盖县', '若尔盖县', 30, 13991, 19);
INSERT INTO `option` VALUES (13998, '金川县', '金川县', 35, 13991, 19);
INSERT INTO `option` VALUES (13999, '小金县', '小金县', 40, 13991, 19);
INSERT INTO `option` VALUES (14000, '黑水县', '黑水县', 45, 13991, 19);
INSERT INTO `option` VALUES (14001, '松潘县', '松潘县', 50, 13991, 19);
INSERT INTO `option` VALUES (14002, '壤塘县', '壤塘县', 55, 13991, 19);
INSERT INTO `option` VALUES (14003, '茂县', '茂县', 60, 13991, 19);
INSERT INTO `option` VALUES (14004, '汶川县', '汶川县', 65, 13991, 19);
INSERT INTO `option` VALUES (14005, '甘孜州', '甘孜州', 100, 13833, 19);
INSERT INTO `option` VALUES (14006, '康定县', '康定县', 5, 14005, 19);
INSERT INTO `option` VALUES (14007, '泸定县', '泸定县', 10, 14005, 19);
INSERT INTO `option` VALUES (14008, '九龙县', '九龙县', 15, 14005, 19);
INSERT INTO `option` VALUES (14009, '丹巴县', '丹巴县', 20, 14005, 19);
INSERT INTO `option` VALUES (14010, '道孚县', '道孚县', 25, 14005, 19);
INSERT INTO `option` VALUES (14011, '炉霍县', '炉霍县', 30, 14005, 19);
INSERT INTO `option` VALUES (14012, '色达县', '色达县', 35, 14005, 19);
INSERT INTO `option` VALUES (14013, '甘孜县', '甘孜县', 40, 14005, 19);
INSERT INTO `option` VALUES (14014, '新龙县', '新龙县', 45, 14005, 19);
INSERT INTO `option` VALUES (14015, '白玉县', '白玉县', 50, 14005, 19);
INSERT INTO `option` VALUES (14016, '德格县', '德格县', 55, 14005, 19);
INSERT INTO `option` VALUES (14017, '石渠县', '石渠县', 60, 14005, 19);
INSERT INTO `option` VALUES (14018, '雅江县', '雅江县', 65, 14005, 19);
INSERT INTO `option` VALUES (14019, '理塘县', '理塘县', 70, 14005, 19);
INSERT INTO `option` VALUES (14020, '巴塘县', '巴塘县', 75, 14005, 19);
INSERT INTO `option` VALUES (14021, '稻城县', '稻城县', 80, 14005, 19);
INSERT INTO `option` VALUES (14022, '乡城县', '乡城县', 85, 14005, 19);
INSERT INTO `option` VALUES (14023, '得荣县', '得荣县', 90, 14005, 19);
INSERT INTO `option` VALUES (14024, '凉山州', '凉山州', 105, 13833, 19);
INSERT INTO `option` VALUES (14025, '美姑县', '美姑县', 5, 14024, 19);
INSERT INTO `option` VALUES (14026, '昭觉县', '昭觉县', 10, 14024, 19);
INSERT INTO `option` VALUES (14027, '会理县', '会理县', 15, 14024, 19);
INSERT INTO `option` VALUES (14028, '会东县', '会东县', 20, 14024, 19);
INSERT INTO `option` VALUES (14029, '普格县', '普格县', 25, 14024, 19);
INSERT INTO `option` VALUES (14030, '宁南县', '宁南县', 30, 14024, 19);
INSERT INTO `option` VALUES (14031, '德昌县', '德昌县', 35, 14024, 19);
INSERT INTO `option` VALUES (14032, '冕宁县', '冕宁县', 40, 14024, 19);
INSERT INTO `option` VALUES (14033, '盐源县', '盐源县', 45, 14024, 19);
INSERT INTO `option` VALUES (14034, '金阳县', '金阳县', 50, 14024, 19);
INSERT INTO `option` VALUES (14035, '布拖县', '布拖县', 55, 14024, 19);
INSERT INTO `option` VALUES (14036, '雷波县', '雷波县', 60, 14024, 19);
INSERT INTO `option` VALUES (14037, '越西县', '越西县', 65, 14024, 19);
INSERT INTO `option` VALUES (14038, '喜德县', '喜德县', 70, 14024, 19);
INSERT INTO `option` VALUES (14039, '甘洛县', '甘洛县', 75, 14024, 19);
INSERT INTO `option` VALUES (14040, '木里县', '木里县', 80, 14024, 19);
INSERT INTO `option` VALUES (14041, '西昌市', '西昌市', 85, 14024, 19);
INSERT INTO `option` VALUES (14042, '海南省', '海南省', 115, 0, 19);
INSERT INTO `option` VALUES (14043, '海口市', '海口市', 5, 14042, 19);
INSERT INTO `option` VALUES (14044, '秀英区', '秀英区', 5, 14043, 19);
INSERT INTO `option` VALUES (14045, '龙华区', '龙华区', 10, 14043, 19);
INSERT INTO `option` VALUES (14046, '琼山区', '琼山区', 15, 14043, 19);
INSERT INTO `option` VALUES (14047, '美兰区', '美兰区', 20, 14043, 19);
INSERT INTO `option` VALUES (14048, '儋州市', '儋州市', 10, 14042, 19);
INSERT INTO `option` VALUES (14049, '热作学院', '热作学院', 5, 14048, 19);
INSERT INTO `option` VALUES (14050, '那大镇', '那大镇', 10, 14048, 19);
INSERT INTO `option` VALUES (14051, '富克镇', '富克镇', 15, 14048, 19);
INSERT INTO `option` VALUES (14052, '和庆镇', '和庆镇', 20, 14048, 19);
INSERT INTO `option` VALUES (14053, '南丰镇', '南丰镇', 25, 14048, 19);
INSERT INTO `option` VALUES (14054, '大成镇', '大成镇', 30, 14048, 19);
INSERT INTO `option` VALUES (14055, '雅星镇', '雅星镇', 35, 14048, 19);
INSERT INTO `option` VALUES (14056, '兰洋镇', '兰洋镇', 40, 14048, 19);
INSERT INTO `option` VALUES (14057, '光村镇', '光村镇', 45, 14048, 19);
INSERT INTO `option` VALUES (14058, '木棠镇', '木棠镇', 50, 14048, 19);
INSERT INTO `option` VALUES (14059, '海头镇', '海头镇', 55, 14048, 19);
INSERT INTO `option` VALUES (14060, '峨蔓镇', '峨蔓镇', 60, 14048, 19);
INSERT INTO `option` VALUES (14061, '三都镇', '三都镇', 65, 14048, 19);
INSERT INTO `option` VALUES (14062, '王五镇', '王五镇', 70, 14048, 19);
INSERT INTO `option` VALUES (14063, '白马井镇', '白马井镇', 75, 14048, 19);
INSERT INTO `option` VALUES (14064, '中和镇', '中和镇', 80, 14048, 19);
INSERT INTO `option` VALUES (14065, '排浦镇', '排浦镇', 85, 14048, 19);
INSERT INTO `option` VALUES (14066, '东成镇', '东成镇', 90, 14048, 19);
INSERT INTO `option` VALUES (14067, '新州镇', '新州镇', 95, 14048, 19);
INSERT INTO `option` VALUES (14068, '洋浦经济开发区', '洋浦经济开发区', 100, 14048, 19);
INSERT INTO `option` VALUES (14069, '西培农场', '西培农场', 105, 14048, 19);
INSERT INTO `option` VALUES (14070, '西联农场', '西联农场', 110, 14048, 19);
INSERT INTO `option` VALUES (14071, '蓝洋农场', '蓝洋农场', 115, 14048, 19);
INSERT INTO `option` VALUES (14072, '八一农场', '八一农场', 120, 14048, 19);
INSERT INTO `option` VALUES (14073, '西华农场', '西华农场', 125, 14048, 19);
INSERT INTO `option` VALUES (14074, '西庆农场', '西庆农场', 130, 14048, 19);
INSERT INTO `option` VALUES (14075, '西流农场', '西流农场', 135, 14048, 19);
INSERT INTO `option` VALUES (14076, '新盈农场', '新盈农场', 140, 14048, 19);
INSERT INTO `option` VALUES (14077, '龙山农场', '龙山农场', 145, 14048, 19);
INSERT INTO `option` VALUES (14078, '红岭农场', '红岭农场', 150, 14048, 19);
INSERT INTO `option` VALUES (14079, '琼海市', '琼海市', 15, 14042, 19);
INSERT INTO `option` VALUES (14080, '嘉积镇', '嘉积镇', 5, 14079, 19);
INSERT INTO `option` VALUES (14081, '万泉镇', '万泉镇', 10, 14079, 19);
INSERT INTO `option` VALUES (14082, '石壁镇', '石壁镇', 15, 14079, 19);
INSERT INTO `option` VALUES (14083, '中原镇', '中原镇', 20, 14079, 19);
INSERT INTO `option` VALUES (14084, '博鳌镇', '博鳌镇', 25, 14079, 19);
INSERT INTO `option` VALUES (14085, '阳江镇', '阳江镇', 30, 14079, 19);
INSERT INTO `option` VALUES (14086, '龙江镇', '龙江镇', 35, 14079, 19);
INSERT INTO `option` VALUES (14087, '潭门镇', '潭门镇', 40, 14079, 19);
INSERT INTO `option` VALUES (14088, '塔洋镇', '塔洋镇', 45, 14079, 19);
INSERT INTO `option` VALUES (14089, '长坡镇', '长坡镇', 50, 14079, 19);
INSERT INTO `option` VALUES (14090, '大路镇', '大路镇', 55, 14079, 19);
INSERT INTO `option` VALUES (14091, '会山镇', '会山镇', 60, 14079, 19);
INSERT INTO `option` VALUES (14092, '彬村山华侨农场', '彬村山华侨农场', 65, 14079, 19);
INSERT INTO `option` VALUES (14093, '东太农场', '东太农场', 70, 14079, 19);
INSERT INTO `option` VALUES (14094, '东红农场', '东红农场', 75, 14079, 19);
INSERT INTO `option` VALUES (14095, '东升农场', '东升农场', 80, 14079, 19);
INSERT INTO `option` VALUES (14096, '南俸农场', '南俸农场', 85, 14079, 19);
INSERT INTO `option` VALUES (14097, '万宁市', '万宁市', 20, 14042, 19);
INSERT INTO `option` VALUES (14098, '万城镇', '万城镇', 5, 14097, 19);
INSERT INTO `option` VALUES (14099, '龙滚镇', '龙滚镇', 10, 14097, 19);
INSERT INTO `option` VALUES (14100, '和乐镇', '和乐镇', 15, 14097, 19);
INSERT INTO `option` VALUES (14101, '后安镇', '后安镇', 20, 14097, 19);
INSERT INTO `option` VALUES (14102, '大茂镇', '大茂镇', 25, 14097, 19);
INSERT INTO `option` VALUES (14103, '东澳镇', '东澳镇', 30, 14097, 19);
INSERT INTO `option` VALUES (14104, '礼纪镇', '礼纪镇', 35, 14097, 19);
INSERT INTO `option` VALUES (14105, '长丰镇', '长丰镇', 40, 14097, 19);
INSERT INTO `option` VALUES (14106, '山根镇', '山根镇', 45, 14097, 19);
INSERT INTO `option` VALUES (14107, '北大镇', '北大镇', 50, 14097, 19);
INSERT INTO `option` VALUES (14108, '南桥镇', '南桥镇', 55, 14097, 19);
INSERT INTO `option` VALUES (14109, '三更罗镇', '三更罗镇', 60, 14097, 19);
INSERT INTO `option` VALUES (14110, '六连林场', '六连林场', 65, 14097, 19);
INSERT INTO `option` VALUES (14111, '东兴农场', '东兴农场', 70, 14097, 19);
INSERT INTO `option` VALUES (14112, '东和农场', '东和农场', 75, 14097, 19);
INSERT INTO `option` VALUES (14113, '新中农场', '新中农场', 80, 14097, 19);
INSERT INTO `option` VALUES (14114, '兴隆华侨农场', '兴隆华侨农场', 85, 14097, 19);
INSERT INTO `option` VALUES (14115, '东方市', '东方市', 25, 14042, 19);
INSERT INTO `option` VALUES (14116, '八所镇', '八所镇', 5, 14115, 19);
INSERT INTO `option` VALUES (14117, '东河镇', '东河镇', 10, 14115, 19);
INSERT INTO `option` VALUES (14118, '大田镇', '大田镇', 15, 14115, 19);
INSERT INTO `option` VALUES (14119, '感城镇', '感城镇', 20, 14115, 19);
INSERT INTO `option` VALUES (14120, '板桥镇', '板桥镇', 25, 14115, 19);
INSERT INTO `option` VALUES (14121, '三家镇', '三家镇', 30, 14115, 19);
INSERT INTO `option` VALUES (14122, '四更镇', '四更镇', 35, 14115, 19);
INSERT INTO `option` VALUES (14123, '新龙镇', '新龙镇', 40, 14115, 19);
INSERT INTO `option` VALUES (14124, '天安乡', '天安乡', 45, 14115, 19);
INSERT INTO `option` VALUES (14125, '江边乡', '江边乡', 50, 14115, 19);
INSERT INTO `option` VALUES (14126, '广坝农场', '广坝农场', 55, 14115, 19);
INSERT INTO `option` VALUES (14127, '东方华侨农场', '东方华侨农场', 60, 14115, 19);
INSERT INTO `option` VALUES (14128, '三亚市', '三亚市', 30, 14042, 19);
INSERT INTO `option` VALUES (14129, '崖城镇', '崖城镇', 5, 14128, 19);
INSERT INTO `option` VALUES (14130, '海棠湾镇', '海棠湾镇', 10, 14128, 19);
INSERT INTO `option` VALUES (14131, '吉阳镇', '吉阳镇', 15, 14128, 19);
INSERT INTO `option` VALUES (14132, '凤凰镇', '凤凰镇', 20, 14128, 19);
INSERT INTO `option` VALUES (14133, '天涯镇', '天涯镇', 25, 14128, 19);
INSERT INTO `option` VALUES (14134, '育才镇', '育才镇', 30, 14128, 19);
INSERT INTO `option` VALUES (14135, '河西区', '河西区', 35, 14128, 19);
INSERT INTO `option` VALUES (14136, '河东区', '河东区', 40, 14128, 19);
INSERT INTO `option` VALUES (14137, '南田农场', '南田农场', 45, 14128, 19);
INSERT INTO `option` VALUES (14138, '南新农场', '南新农场', 50, 14128, 19);
INSERT INTO `option` VALUES (14139, '南岛农场', '南岛农场', 55, 14128, 19);
INSERT INTO `option` VALUES (14140, '立才农场', '立才农场', 60, 14128, 19);
INSERT INTO `option` VALUES (14141, '南滨农场', '南滨农场', 65, 14128, 19);
INSERT INTO `option` VALUES (14142, '文昌市', '文昌市', 35, 14042, 19);
INSERT INTO `option` VALUES (14143, '文城镇', '文城镇', 5, 14142, 19);
INSERT INTO `option` VALUES (14144, '重兴镇', '重兴镇', 10, 14142, 19);
INSERT INTO `option` VALUES (14145, '蓬莱镇', '蓬莱镇', 15, 14142, 19);
INSERT INTO `option` VALUES (14146, '会文镇', '会文镇', 20, 14142, 19);
INSERT INTO `option` VALUES (14147, '东路镇', '东路镇', 25, 14142, 19);
INSERT INTO `option` VALUES (14148, '潭牛镇', '潭牛镇', 30, 14142, 19);
INSERT INTO `option` VALUES (14149, '东阁镇', '东阁镇', 35, 14142, 19);
INSERT INTO `option` VALUES (14150, '文教镇', '文教镇', 40, 14142, 19);
INSERT INTO `option` VALUES (14151, '东郊镇', '东郊镇', 45, 14142, 19);
INSERT INTO `option` VALUES (14152, '龙楼镇', '龙楼镇', 50, 14142, 19);
INSERT INTO `option` VALUES (14153, '昌洒镇', '昌洒镇', 55, 14142, 19);
INSERT INTO `option` VALUES (14154, '翁田镇', '翁田镇', 60, 14142, 19);
INSERT INTO `option` VALUES (14155, '抱罗镇', '抱罗镇', 65, 14142, 19);
INSERT INTO `option` VALUES (14156, '冯坡镇', '冯坡镇', 70, 14142, 19);
INSERT INTO `option` VALUES (14157, '锦山镇', '锦山镇', 75, 14142, 19);
INSERT INTO `option` VALUES (14158, '铺前镇', '铺前镇', 80, 14142, 19);
INSERT INTO `option` VALUES (14159, '公坡镇', '公坡镇', 85, 14142, 19);
INSERT INTO `option` VALUES (14160, '迈号镇', '迈号镇', 90, 14142, 19);
INSERT INTO `option` VALUES (14161, '清谰镇', '清谰镇', 95, 14142, 19);
INSERT INTO `option` VALUES (14162, '南阳镇', '南阳镇', 100, 14142, 19);
INSERT INTO `option` VALUES (14163, '新桥镇', '新桥镇', 105, 14142, 19);
INSERT INTO `option` VALUES (14164, '头苑镇', '头苑镇', 110, 14142, 19);
INSERT INTO `option` VALUES (14165, '宝芳乡', '宝芳乡', 115, 14142, 19);
INSERT INTO `option` VALUES (14166, '龙马乡', '龙马乡', 120, 14142, 19);
INSERT INTO `option` VALUES (14167, '湖山乡', '湖山乡', 125, 14142, 19);
INSERT INTO `option` VALUES (14168, '东路农场', '东路农场', 130, 14142, 19);
INSERT INTO `option` VALUES (14169, '南阳农场', '南阳农场', 135, 14142, 19);
INSERT INTO `option` VALUES (14170, '罗豆农场', '罗豆农场', 140, 14142, 19);
INSERT INTO `option` VALUES (14171, '橡胶研究所', '橡胶研究所', 145, 14142, 19);
INSERT INTO `option` VALUES (14172, '五指山市', '五指山市', 40, 14042, 19);
INSERT INTO `option` VALUES (14173, '通什镇', '通什镇', 5, 14172, 19);
INSERT INTO `option` VALUES (14174, '南圣镇', '南圣镇', 10, 14172, 19);
INSERT INTO `option` VALUES (14175, '毛阳镇', '毛阳镇', 15, 14172, 19);
INSERT INTO `option` VALUES (14176, '番阳镇', '番阳镇', 20, 14172, 19);
INSERT INTO `option` VALUES (14177, '畅好乡', '畅好乡', 25, 14172, 19);
INSERT INTO `option` VALUES (14178, '毛道乡', '毛道乡', 30, 14172, 19);
INSERT INTO `option` VALUES (14179, '水满乡', '水满乡', 35, 14172, 19);
INSERT INTO `option` VALUES (14180, '畅好农场', '畅好农场', 40, 14172, 19);
INSERT INTO `option` VALUES (14181, '临高县', '临高县', 45, 14042, 19);
INSERT INTO `option` VALUES (14182, '城区', '城区', 5, 14181, 19);
INSERT INTO `option` VALUES (14183, '临城镇', '临城镇', 10, 14181, 19);
INSERT INTO `option` VALUES (14184, '波莲镇', '波莲镇', 15, 14181, 19);
INSERT INTO `option` VALUES (14185, '东英镇', '东英镇', 20, 14181, 19);
INSERT INTO `option` VALUES (14186, '博厚镇', '博厚镇', 25, 14181, 19);
INSERT INTO `option` VALUES (14187, '皇桐镇', '皇桐镇', 30, 14181, 19);
INSERT INTO `option` VALUES (14188, '多文镇', '多文镇', 35, 14181, 19);
INSERT INTO `option` VALUES (14189, '和舍镇', '和舍镇', 40, 14181, 19);
INSERT INTO `option` VALUES (14190, '南宝镇', '南宝镇', 45, 14181, 19);
INSERT INTO `option` VALUES (14191, '新盈镇', '新盈镇', 50, 14181, 19);
INSERT INTO `option` VALUES (14192, '调楼镇', '调楼镇', 55, 14181, 19);
INSERT INTO `option` VALUES (14193, '加来镇', '加来镇', 60, 14181, 19);
INSERT INTO `option` VALUES (14194, '红华农场', '红华农场', 65, 14181, 19);
INSERT INTO `option` VALUES (14195, '加来农场', '加来农场', 70, 14181, 19);
INSERT INTO `option` VALUES (14196, '澄迈县', '澄迈县', 50, 14042, 19);
INSERT INTO `option` VALUES (14197, '城区', '城区', 5, 14196, 19);
INSERT INTO `option` VALUES (14198, '金江镇', '金江镇', 10, 14196, 19);
INSERT INTO `option` VALUES (14199, '老城镇', '老城镇', 15, 14196, 19);
INSERT INTO `option` VALUES (14200, '瑞溪镇', '瑞溪镇', 20, 14196, 19);
INSERT INTO `option` VALUES (14201, '永发镇', '永发镇', 25, 14196, 19);
INSERT INTO `option` VALUES (14202, '加乐镇', '加乐镇', 30, 14196, 19);
INSERT INTO `option` VALUES (14203, '文儒镇', '文儒镇', 35, 14196, 19);
INSERT INTO `option` VALUES (14204, '中兴镇', '中兴镇', 40, 14196, 19);
INSERT INTO `option` VALUES (14205, '仁兴镇', '仁兴镇', 45, 14196, 19);
INSERT INTO `option` VALUES (14206, '福山镇', '福山镇', 50, 14196, 19);
INSERT INTO `option` VALUES (14207, '桥头镇', '桥头镇', 55, 14196, 19);
INSERT INTO `option` VALUES (14208, '大丰镇', '大丰镇', 60, 14196, 19);
INSERT INTO `option` VALUES (14209, '红光农场', '红光农场', 65, 14196, 19);
INSERT INTO `option` VALUES (14210, '西达农场', '西达农场', 70, 14196, 19);
INSERT INTO `option` VALUES (14211, '金安农场', '金安农场', 75, 14196, 19);
INSERT INTO `option` VALUES (14212, '定安县', '定安县', 55, 14042, 19);
INSERT INTO `option` VALUES (14213, '黄竹镇', '黄竹镇', 5, 14212, 19);
INSERT INTO `option` VALUES (14214, '城区', '城区', 10, 14212, 19);
INSERT INTO `option` VALUES (14215, '定城镇', '定城镇', 15, 14212, 19);
INSERT INTO `option` VALUES (14216, '新竹镇', '新竹镇', 20, 14212, 19);
INSERT INTO `option` VALUES (14217, '龙湖镇', '龙湖镇', 25, 14212, 19);
INSERT INTO `option` VALUES (14218, '雷鸣镇', '雷鸣镇', 30, 14212, 19);
INSERT INTO `option` VALUES (14219, '龙门镇', '龙门镇', 35, 14212, 19);
INSERT INTO `option` VALUES (14220, '龙河镇', '龙河镇', 40, 14212, 19);
INSERT INTO `option` VALUES (14221, '岭口镇', '岭口镇', 45, 14212, 19);
INSERT INTO `option` VALUES (14222, '翰林镇', '翰林镇', 50, 14212, 19);
INSERT INTO `option` VALUES (14223, '富文镇', '富文镇', 55, 14212, 19);
INSERT INTO `option` VALUES (14224, '金鸡岭农场', '金鸡岭农场', 60, 14212, 19);
INSERT INTO `option` VALUES (14225, '中瑞农场', '中瑞农场', 65, 14212, 19);
INSERT INTO `option` VALUES (14226, '南海农场', '南海农场', 70, 14212, 19);
INSERT INTO `option` VALUES (14227, '屯昌县', '屯昌县', 60, 14042, 19);
INSERT INTO `option` VALUES (14228, '县城内', '县城内', 5, 14227, 19);
INSERT INTO `option` VALUES (14229, '屯城镇', '屯城镇', 10, 14227, 19);
INSERT INTO `option` VALUES (14230, '新兴镇', '新兴镇', 15, 14227, 19);
INSERT INTO `option` VALUES (14231, '枫木镇', '枫木镇', 20, 14227, 19);
INSERT INTO `option` VALUES (14232, '乌坡镇', '乌坡镇', 25, 14227, 19);
INSERT INTO `option` VALUES (14233, '南吕镇', '南吕镇', 30, 14227, 19);
INSERT INTO `option` VALUES (14234, '南坤镇', '南坤镇', 35, 14227, 19);
INSERT INTO `option` VALUES (14235, '中建农场', '中建农场', 40, 14227, 19);
INSERT INTO `option` VALUES (14236, '坡心镇', '坡心镇', 45, 14227, 19);
INSERT INTO `option` VALUES (14237, '中坤农场', '中坤农场', 50, 14227, 19);
INSERT INTO `option` VALUES (14238, '西昌镇', '西昌镇', 55, 14227, 19);
INSERT INTO `option` VALUES (14239, '昌江县', '昌江县', 65, 14042, 19);
INSERT INTO `option` VALUES (14240, '红林农场', '红林农场', 5, 14239, 19);
INSERT INTO `option` VALUES (14241, '城区', '城区', 10, 14239, 19);
INSERT INTO `option` VALUES (14242, '石碌镇', '石碌镇', 15, 14239, 19);
INSERT INTO `option` VALUES (14243, '叉河镇', '叉河镇', 20, 14239, 19);
INSERT INTO `option` VALUES (14244, '十月田镇', '十月田镇', 25, 14239, 19);
INSERT INTO `option` VALUES (14245, '乌烈镇', '乌烈镇', 30, 14239, 19);
INSERT INTO `option` VALUES (14246, '昌化镇', '昌化镇', 35, 14239, 19);
INSERT INTO `option` VALUES (14247, '海尾镇', '海尾镇', 40, 14239, 19);
INSERT INTO `option` VALUES (14248, '七叉镇', '七叉镇', 45, 14239, 19);
INSERT INTO `option` VALUES (14249, '王下乡', '王下乡', 50, 14239, 19);
INSERT INTO `option` VALUES (14250, '海南矿业公司', '海南矿业公司', 55, 14239, 19);
INSERT INTO `option` VALUES (14251, '霸王岭林场', '霸王岭林场', 60, 14239, 19);
INSERT INTO `option` VALUES (14252, '白沙县', '白沙县', 70, 14042, 19);
INSERT INTO `option` VALUES (14253, '南开乡', '南开乡', 5, 14252, 19);
INSERT INTO `option` VALUES (14254, '阜龙乡', '阜龙乡', 10, 14252, 19);
INSERT INTO `option` VALUES (14255, '青松乡', '青松乡', 15, 14252, 19);
INSERT INTO `option` VALUES (14256, '金波乡', '金波乡', 20, 14252, 19);
INSERT INTO `option` VALUES (14257, '荣邦乡', '荣邦乡', 25, 14252, 19);
INSERT INTO `option` VALUES (14258, '城区', '城区', 30, 14252, 19);
INSERT INTO `option` VALUES (14259, '白沙农场', '白沙农场', 35, 14252, 19);
INSERT INTO `option` VALUES (14260, '牙叉镇', '牙叉镇', 40, 14252, 19);
INSERT INTO `option` VALUES (14261, '龙江农场', '龙江农场', 45, 14252, 19);
INSERT INTO `option` VALUES (14262, '七坊镇', '七坊镇', 50, 14252, 19);
INSERT INTO `option` VALUES (14263, '邦溪农场', '邦溪农场', 55, 14252, 19);
INSERT INTO `option` VALUES (14264, '邦溪镇', '邦溪镇', 60, 14252, 19);
INSERT INTO `option` VALUES (14265, '打安镇', '打安镇', 65, 14252, 19);
INSERT INTO `option` VALUES (14266, '细水乡', '细水乡', 70, 14252, 19);
INSERT INTO `option` VALUES (14267, '元门乡', '元门乡', 75, 14252, 19);
INSERT INTO `option` VALUES (14268, '琼中县', '琼中县', 75, 14042, 19);
INSERT INTO `option` VALUES (14269, '吊罗山乡', '吊罗山乡', 5, 14268, 19);
INSERT INTO `option` VALUES (14270, '黎母山林业公司', '黎母山林业公司', 10, 14268, 19);
INSERT INTO `option` VALUES (14271, '阳江农场', '阳江农场', 15, 14268, 19);
INSERT INTO `option` VALUES (14272, '乌石农场', '乌石农场', 20, 14268, 19);
INSERT INTO `option` VALUES (14273, '加钗农场', '加钗农场', 25, 14268, 19);
INSERT INTO `option` VALUES (14274, '长征农场', '长征农场', 30, 14268, 19);
INSERT INTO `option` VALUES (14275, '营根镇', '营根镇', 35, 14268, 19);
INSERT INTO `option` VALUES (14276, '湾岭镇', '湾岭镇', 40, 14268, 19);
INSERT INTO `option` VALUES (14277, '黎母山镇', '黎母山镇', 45, 14268, 19);
INSERT INTO `option` VALUES (14278, '和平镇', '和平镇', 50, 14268, 19);
INSERT INTO `option` VALUES (14279, '长征镇', '长征镇', 55, 14268, 19);
INSERT INTO `option` VALUES (14280, '红毛镇', '红毛镇', 60, 14268, 19);
INSERT INTO `option` VALUES (14281, '中平镇', '中平镇', 65, 14268, 19);
INSERT INTO `option` VALUES (14282, '上安乡', '上安乡', 70, 14268, 19);
INSERT INTO `option` VALUES (14283, '什运乡', '什运乡', 75, 14268, 19);
INSERT INTO `option` VALUES (14284, '城区', '城区', 80, 14268, 19);
INSERT INTO `option` VALUES (14285, '陵水县', '陵水县', 80, 14042, 19);
INSERT INTO `option` VALUES (14286, '吊罗山林业公司', '吊罗山林业公司', 5, 14285, 19);
INSERT INTO `option` VALUES (14287, '岭门农场', '岭门农场', 10, 14285, 19);
INSERT INTO `option` VALUES (14288, '南平农场', '南平农场', 15, 14285, 19);
INSERT INTO `option` VALUES (14289, '椰林镇', '椰林镇', 20, 14285, 19);
INSERT INTO `option` VALUES (14290, '光坡镇', '光坡镇', 25, 14285, 19);
INSERT INTO `option` VALUES (14291, '三才镇', '三才镇', 30, 14285, 19);
INSERT INTO `option` VALUES (14292, '英州镇', '英州镇', 35, 14285, 19);
INSERT INTO `option` VALUES (14293, '隆广镇', '隆广镇', 40, 14285, 19);
INSERT INTO `option` VALUES (14294, '文罗镇', '文罗镇', 45, 14285, 19);
INSERT INTO `option` VALUES (14295, '本号镇', '本号镇', 50, 14285, 19);
INSERT INTO `option` VALUES (14296, '新村镇', '新村镇', 55, 14285, 19);
INSERT INTO `option` VALUES (14297, '黎安镇', '黎安镇', 60, 14285, 19);
INSERT INTO `option` VALUES (14298, '提蒙乡', '提蒙乡', 65, 14285, 19);
INSERT INTO `option` VALUES (14299, '群英乡', '群英乡', 70, 14285, 19);
INSERT INTO `option` VALUES (14300, '城区', '城区', 75, 14285, 19);
INSERT INTO `option` VALUES (14301, '保亭县', '保亭县', 85, 14042, 19);
INSERT INTO `option` VALUES (14302, '保亭研究所', '保亭研究所', 5, 14301, 19);
INSERT INTO `option` VALUES (14303, '新星农场', '新星农场', 10, 14301, 19);
INSERT INTO `option` VALUES (14304, '金江农场', '金江农场', 15, 14301, 19);
INSERT INTO `option` VALUES (14305, '三道农场', '三道农场', 20, 14301, 19);
INSERT INTO `option` VALUES (14306, '保城镇', '保城镇', 25, 14301, 19);
INSERT INTO `option` VALUES (14307, '什玲镇', '什玲镇', 30, 14301, 19);
INSERT INTO `option` VALUES (14308, '加茂镇', '加茂镇', 35, 14301, 19);
INSERT INTO `option` VALUES (14309, '响水镇', '响水镇', 40, 14301, 19);
INSERT INTO `option` VALUES (14310, '新政镇', '新政镇', 45, 14301, 19);
INSERT INTO `option` VALUES (14311, '三道镇', '三道镇', 50, 14301, 19);
INSERT INTO `option` VALUES (14312, '六弓乡', '六弓乡', 55, 14301, 19);
INSERT INTO `option` VALUES (14313, '南林乡', '南林乡', 60, 14301, 19);
INSERT INTO `option` VALUES (14314, '毛感乡', '毛感乡', 65, 14301, 19);
INSERT INTO `option` VALUES (14315, '乐东县', '乐东县', 90, 14042, 19);
INSERT INTO `option` VALUES (14316, '尖峰岭林业公司', '尖峰岭林业公司', 5, 14315, 19);
INSERT INTO `option` VALUES (14317, '莺歌海盐场', '莺歌海盐场', 10, 14315, 19);
INSERT INTO `option` VALUES (14318, '山荣农场', '山荣农场', 15, 14315, 19);
INSERT INTO `option` VALUES (14319, '乐光农场', '乐光农场', 20, 14315, 19);
INSERT INTO `option` VALUES (14320, '抱由镇', '抱由镇', 25, 14315, 19);
INSERT INTO `option` VALUES (14321, '保国农场', '保国农场', 30, 14315, 19);
INSERT INTO `option` VALUES (14322, '万冲镇', '万冲镇', 35, 14315, 19);
INSERT INTO `option` VALUES (14323, '大安镇', '大安镇', 40, 14315, 19);
INSERT INTO `option` VALUES (14324, '志仲镇', '志仲镇', 45, 14315, 19);
INSERT INTO `option` VALUES (14325, '千家镇', '千家镇', 50, 14315, 19);
INSERT INTO `option` VALUES (14326, '九所镇', '九所镇', 55, 14315, 19);
INSERT INTO `option` VALUES (14327, '利国镇', '利国镇', 60, 14315, 19);
INSERT INTO `option` VALUES (14328, '黄流镇', '黄流镇', 65, 14315, 19);
INSERT INTO `option` VALUES (14329, '佛罗镇', '佛罗镇', 70, 14315, 19);
INSERT INTO `option` VALUES (14330, '尖峰镇', '尖峰镇', 75, 14315, 19);
INSERT INTO `option` VALUES (14331, '莺歌海镇', '莺歌海镇', 80, 14315, 19);
INSERT INTO `option` VALUES (14332, '城区', '城区', 85, 14315, 19);
INSERT INTO `option` VALUES (14333, '三沙市', '三沙市', 95, 14042, 19);
INSERT INTO `option` VALUES (14334, '中沙群岛', '中沙群岛', 5, 14333, 19);
INSERT INTO `option` VALUES (14335, '西沙群岛', '西沙群岛', 10, 14333, 19);
INSERT INTO `option` VALUES (14336, '南沙群岛', '南沙群岛', 15, 14333, 19);
INSERT INTO `option` VALUES (14337, '贵州省', '贵州省', 120, 0, 19);
INSERT INTO `option` VALUES (14338, '贵阳市', '贵阳市', 5, 14337, 19);
INSERT INTO `option` VALUES (14339, '南明区', '南明区', 5, 14338, 19);
INSERT INTO `option` VALUES (14340, '云岩区', '云岩区', 10, 14338, 19);
INSERT INTO `option` VALUES (14341, '花溪区', '花溪区', 15, 14338, 19);
INSERT INTO `option` VALUES (14342, '小河区', '小河区', 20, 14338, 19);
INSERT INTO `option` VALUES (14343, '白云区', '白云区', 25, 14338, 19);
INSERT INTO `option` VALUES (14344, '清镇市', '清镇市', 30, 14338, 19);
INSERT INTO `option` VALUES (14345, '开阳县', '开阳县', 35, 14338, 19);
INSERT INTO `option` VALUES (14346, '修文县', '修文县', 40, 14338, 19);
INSERT INTO `option` VALUES (14347, '息烽县', '息烽县', 45, 14338, 19);
INSERT INTO `option` VALUES (14348, '乌当区', '乌当区', 50, 14338, 19);
INSERT INTO `option` VALUES (14349, '观山湖区', '观山湖区', 55, 14338, 19);
INSERT INTO `option` VALUES (14350, '六盘水市', '六盘水市', 10, 14337, 19);
INSERT INTO `option` VALUES (14351, '盘县', '盘县', 5, 14350, 19);
INSERT INTO `option` VALUES (14352, '六枝特区', '六枝特区', 10, 14350, 19);
INSERT INTO `option` VALUES (14353, '水城县', '水城县', 15, 14350, 19);
INSERT INTO `option` VALUES (14354, '钟山区', '钟山区', 20, 14350, 19);
INSERT INTO `option` VALUES (14355, '遵义市', '遵义市', 15, 14337, 19);
INSERT INTO `option` VALUES (14356, '红花岗区', '红花岗区', 5, 14355, 19);
INSERT INTO `option` VALUES (14357, '汇川区', '汇川区', 10, 14355, 19);
INSERT INTO `option` VALUES (14358, '赤水市', '赤水市', 15, 14355, 19);
INSERT INTO `option` VALUES (14359, '仁怀市', '仁怀市', 20, 14355, 19);
INSERT INTO `option` VALUES (14360, '遵义县', '遵义县', 25, 14355, 19);
INSERT INTO `option` VALUES (14361, '桐梓县', '桐梓县', 30, 14355, 19);
INSERT INTO `option` VALUES (14362, '绥阳县', '绥阳县', 35, 14355, 19);
INSERT INTO `option` VALUES (14363, '习水县', '习水县', 40, 14355, 19);
INSERT INTO `option` VALUES (14364, '凤冈县', '凤冈县', 45, 14355, 19);
INSERT INTO `option` VALUES (14365, '正安县', '正安县', 50, 14355, 19);
INSERT INTO `option` VALUES (14366, '湄潭县', '湄潭县', 55, 14355, 19);
INSERT INTO `option` VALUES (14367, '余庆县', '余庆县', 60, 14355, 19);
INSERT INTO `option` VALUES (14368, '道真县', '道真县', 65, 14355, 19);
INSERT INTO `option` VALUES (14369, '务川县', '务川县', 70, 14355, 19);
INSERT INTO `option` VALUES (14370, '铜仁市', '铜仁市', 20, 14337, 19);
INSERT INTO `option` VALUES (14371, '碧江区', '碧江区', 5, 14370, 19);
INSERT INTO `option` VALUES (14372, '德江县', '德江县', 10, 14370, 19);
INSERT INTO `option` VALUES (14373, '江口县', '江口县', 15, 14370, 19);
INSERT INTO `option` VALUES (14374, '思南县', '思南县', 20, 14370, 19);
INSERT INTO `option` VALUES (14375, '万山区', '万山区', 25, 14370, 19);
INSERT INTO `option` VALUES (14376, '石阡县', '石阡县', 30, 14370, 19);
INSERT INTO `option` VALUES (14377, '玉屏侗族自治县', '玉屏侗族自治县', 35, 14370, 19);
INSERT INTO `option` VALUES (14378, '松桃苗族自治县', '松桃苗族自治县', 40, 14370, 19);
INSERT INTO `option` VALUES (14379, '印江土家族苗族自治县', '印江土家族苗族自治县', 45, 14370, 19);
INSERT INTO `option` VALUES (14380, '沿河土家族自治县', '沿河土家族自治县', 50, 14370, 19);
INSERT INTO `option` VALUES (14381, '毕节市', '毕节市', 25, 14337, 19);
INSERT INTO `option` VALUES (14382, '七星关区', '七星关区', 5, 14381, 19);
INSERT INTO `option` VALUES (14383, '黔西县', '黔西县', 10, 14381, 19);
INSERT INTO `option` VALUES (14384, '大方县', '大方县', 15, 14381, 19);
INSERT INTO `option` VALUES (14385, '织金县', '织金县', 20, 14381, 19);
INSERT INTO `option` VALUES (14386, '金沙县', '金沙县', 25, 14381, 19);
INSERT INTO `option` VALUES (14387, '赫章县', '赫章县', 30, 14381, 19);
INSERT INTO `option` VALUES (14388, '纳雍县', '纳雍县', 35, 14381, 19);
INSERT INTO `option` VALUES (14389, '威宁彝族回族苗族自治县', '威宁彝族回族苗族自治县', 40, 14381, 19);
INSERT INTO `option` VALUES (14390, '安顺市', '安顺市', 30, 14337, 19);
INSERT INTO `option` VALUES (14391, '西秀区', '西秀区', 5, 14390, 19);
INSERT INTO `option` VALUES (14392, '普定县', '普定县', 10, 14390, 19);
INSERT INTO `option` VALUES (14393, '平坝县', '平坝县', 15, 14390, 19);
INSERT INTO `option` VALUES (14394, '镇宁布依族苗族自治县', '镇宁布依族苗族自治县', 20, 14390, 19);
INSERT INTO `option` VALUES (14395, '关岭布依族苗族自治县', '关岭布依族苗族自治县', 25, 14390, 19);
INSERT INTO `option` VALUES (14396, '紫云苗族布依族自治县', '紫云苗族布依族自治县', 30, 14390, 19);
INSERT INTO `option` VALUES (14397, '黔西南州', '黔西南州', 35, 14337, 19);
INSERT INTO `option` VALUES (14398, '兴义市', '兴义市', 5, 14397, 19);
INSERT INTO `option` VALUES (14399, '望谟县', '望谟县', 10, 14397, 19);
INSERT INTO `option` VALUES (14400, '兴仁县', '兴仁县', 15, 14397, 19);
INSERT INTO `option` VALUES (14401, '普安县', '普安县', 20, 14397, 19);
INSERT INTO `option` VALUES (14402, '册亨县', '册亨县', 25, 14397, 19);
INSERT INTO `option` VALUES (14403, '晴隆县', '晴隆县', 30, 14397, 19);
INSERT INTO `option` VALUES (14404, '贞丰县', '贞丰县', 35, 14397, 19);
INSERT INTO `option` VALUES (14405, '安龙县', '安龙县', 40, 14397, 19);
INSERT INTO `option` VALUES (14406, '黔东南州', '黔东南州', 40, 14337, 19);
INSERT INTO `option` VALUES (14407, '凯里市', '凯里市', 5, 14406, 19);
INSERT INTO `option` VALUES (14408, '施秉市', '施秉市', 10, 14406, 19);
INSERT INTO `option` VALUES (14409, '从江县', '从江县', 15, 14406, 19);
INSERT INTO `option` VALUES (14410, '锦屏县', '锦屏县', 20, 14406, 19);
INSERT INTO `option` VALUES (14411, '镇远县', '镇远县', 25, 14406, 19);
INSERT INTO `option` VALUES (14412, '麻江县', '麻江县', 30, 14406, 19);
INSERT INTO `option` VALUES (14413, '台江县', '台江县', 35, 14406, 19);
INSERT INTO `option` VALUES (14414, '天柱县', '天柱县', 40, 14406, 19);
INSERT INTO `option` VALUES (14415, '黄平县', '黄平县', 45, 14406, 19);
INSERT INTO `option` VALUES (14416, '榕江县', '榕江县', 50, 14406, 19);
INSERT INTO `option` VALUES (14417, '剑河县', '剑河县', 55, 14406, 19);
INSERT INTO `option` VALUES (14418, '三穗县', '三穗县', 60, 14406, 19);
INSERT INTO `option` VALUES (14419, '雷山县', '雷山县', 65, 14406, 19);
INSERT INTO `option` VALUES (14420, '黎平县', '黎平县', 70, 14406, 19);
INSERT INTO `option` VALUES (14421, '岑巩县', '岑巩县', 75, 14406, 19);
INSERT INTO `option` VALUES (14422, '丹寨县', '丹寨县', 80, 14406, 19);
INSERT INTO `option` VALUES (14423, '黔南州', '黔南州', 45, 14337, 19);
INSERT INTO `option` VALUES (14424, '都匀市', '都匀市', 5, 14423, 19);
INSERT INTO `option` VALUES (14425, '福泉市', '福泉市', 10, 14423, 19);
INSERT INTO `option` VALUES (14426, '贵定县', '贵定县', 15, 14423, 19);
INSERT INTO `option` VALUES (14427, '惠水县', '惠水县', 20, 14423, 19);
INSERT INTO `option` VALUES (14428, '罗甸县', '罗甸县', 25, 14423, 19);
INSERT INTO `option` VALUES (14429, '瓮安县', '瓮安县', 30, 14423, 19);
INSERT INTO `option` VALUES (14430, '荔波县', '荔波县', 35, 14423, 19);
INSERT INTO `option` VALUES (14431, '龙里县', '龙里县', 40, 14423, 19);
INSERT INTO `option` VALUES (14432, '平塘县', '平塘县', 45, 14423, 19);
INSERT INTO `option` VALUES (14433, '长顺县', '长顺县', 50, 14423, 19);
INSERT INTO `option` VALUES (14434, '独山县', '独山县', 55, 14423, 19);
INSERT INTO `option` VALUES (14435, '三都县', '三都县', 60, 14423, 19);
INSERT INTO `option` VALUES (14436, '云南省', '云南省', 125, 0, 19);
INSERT INTO `option` VALUES (14437, '昆明市', '昆明市', 5, 14436, 19);
INSERT INTO `option` VALUES (14438, '盘龙区', '盘龙区', 5, 14437, 19);
INSERT INTO `option` VALUES (14439, '五华区', '五华区', 10, 14437, 19);
INSERT INTO `option` VALUES (14440, '西山区', '西山区', 15, 14437, 19);
INSERT INTO `option` VALUES (14441, '官渡区', '官渡区', 20, 14437, 19);
INSERT INTO `option` VALUES (14442, '呈贡区', '呈贡区', 25, 14437, 19);
INSERT INTO `option` VALUES (14443, '东川区', '东川区', 30, 14437, 19);
INSERT INTO `option` VALUES (14444, '安宁市', '安宁市', 35, 14437, 19);
INSERT INTO `option` VALUES (14445, '富民县', '富民县', 40, 14437, 19);
INSERT INTO `option` VALUES (14446, '嵩明县', '嵩明县', 45, 14437, 19);
INSERT INTO `option` VALUES (14447, '晋宁县', '晋宁县', 50, 14437, 19);
INSERT INTO `option` VALUES (14448, '宜良县', '宜良县', 55, 14437, 19);
INSERT INTO `option` VALUES (14449, '禄劝县', '禄劝县', 60, 14437, 19);
INSERT INTO `option` VALUES (14450, '石林县', '石林县', 65, 14437, 19);
INSERT INTO `option` VALUES (14451, '寻甸县', '寻甸县', 70, 14437, 19);
INSERT INTO `option` VALUES (14452, '曲靖市', '曲靖市', 10, 14436, 19);
INSERT INTO `option` VALUES (14453, '麒麟区', '麒麟区', 5, 14452, 19);
INSERT INTO `option` VALUES (14454, '马龙县', '马龙县', 10, 14452, 19);
INSERT INTO `option` VALUES (14455, '宣威市', '宣威市', 15, 14452, 19);
INSERT INTO `option` VALUES (14456, '富源县', '富源县', 20, 14452, 19);
INSERT INTO `option` VALUES (14457, '会泽县', '会泽县', 25, 14452, 19);
INSERT INTO `option` VALUES (14458, '陆良县', '陆良县', 30, 14452, 19);
INSERT INTO `option` VALUES (14459, '师宗县', '师宗县', 35, 14452, 19);
INSERT INTO `option` VALUES (14460, '罗平县', '罗平县', 40, 14452, 19);
INSERT INTO `option` VALUES (14461, '沾益县', '沾益县', 45, 14452, 19);
INSERT INTO `option` VALUES (14462, '玉溪市', '玉溪市', 15, 14436, 19);
INSERT INTO `option` VALUES (14463, '红塔区', '红塔区', 5, 14462, 19);
INSERT INTO `option` VALUES (14464, '华宁县', '华宁县', 10, 14462, 19);
INSERT INTO `option` VALUES (14465, '澄江县', '澄江县', 15, 14462, 19);
INSERT INTO `option` VALUES (14466, '易门县', '易门县', 20, 14462, 19);
INSERT INTO `option` VALUES (14467, '通海县', '通海县', 25, 14462, 19);
INSERT INTO `option` VALUES (14468, '江川县', '江川县', 30, 14462, 19);
INSERT INTO `option` VALUES (14469, '元江县', '元江县', 35, 14462, 19);
INSERT INTO `option` VALUES (14470, '新平县', '新平县', 40, 14462, 19);
INSERT INTO `option` VALUES (14471, '峨山县', '峨山县', 45, 14462, 19);
INSERT INTO `option` VALUES (14472, '昭通市', '昭通市', 20, 14436, 19);
INSERT INTO `option` VALUES (14473, '鲁甸县', '鲁甸县', 5, 14472, 19);
INSERT INTO `option` VALUES (14474, '绥江县', '绥江县', 10, 14472, 19);
INSERT INTO `option` VALUES (14475, '昭阳区', '昭阳区', 15, 14472, 19);
INSERT INTO `option` VALUES (14476, '镇雄县', '镇雄县', 20, 14472, 19);
INSERT INTO `option` VALUES (14477, '永善县', '永善县', 25, 14472, 19);
INSERT INTO `option` VALUES (14478, '大关县', '大关县', 30, 14472, 19);
INSERT INTO `option` VALUES (14479, '盐津县', '盐津县', 35, 14472, 19);
INSERT INTO `option` VALUES (14480, '彝良县', '彝良县', 40, 14472, 19);
INSERT INTO `option` VALUES (14481, '水富县', '水富县', 45, 14472, 19);
INSERT INTO `option` VALUES (14482, '巧家县', '巧家县', 50, 14472, 19);
INSERT INTO `option` VALUES (14483, '威信县', '威信县', 55, 14472, 19);
INSERT INTO `option` VALUES (14484, '普洱市', '普洱市', 25, 14436, 19);
INSERT INTO `option` VALUES (14485, '孟连县', '孟连县', 5, 14484, 19);
INSERT INTO `option` VALUES (14486, '思茅区', '思茅区', 10, 14484, 19);
INSERT INTO `option` VALUES (14487, '宁洱县', '宁洱县', 15, 14484, 19);
INSERT INTO `option` VALUES (14488, '景东县', '景东县', 20, 14484, 19);
INSERT INTO `option` VALUES (14489, '镇沅县', '镇沅县', 25, 14484, 19);
INSERT INTO `option` VALUES (14490, '景谷县', '景谷县', 30, 14484, 19);
INSERT INTO `option` VALUES (14491, '墨江县', '墨江县', 35, 14484, 19);
INSERT INTO `option` VALUES (14492, '澜沧县', '澜沧县', 40, 14484, 19);
INSERT INTO `option` VALUES (14493, '西盟县', '西盟县', 45, 14484, 19);
INSERT INTO `option` VALUES (14494, '江城县', '江城县', 50, 14484, 19);
INSERT INTO `option` VALUES (14495, '临沧市', '临沧市', 30, 14436, 19);
INSERT INTO `option` VALUES (14496, '双江县', '双江县', 5, 14495, 19);
INSERT INTO `option` VALUES (14497, '沧源县', '沧源县', 10, 14495, 19);
INSERT INTO `option` VALUES (14498, '临翔区', '临翔区', 15, 14495, 19);
INSERT INTO `option` VALUES (14499, '镇康县', '镇康县', 20, 14495, 19);
INSERT INTO `option` VALUES (14500, '凤庆县', '凤庆县', 25, 14495, 19);
INSERT INTO `option` VALUES (14501, '云县', '云县', 30, 14495, 19);
INSERT INTO `option` VALUES (14502, '永德县', '永德县', 35, 14495, 19);
INSERT INTO `option` VALUES (14503, '耿马县', '耿马县', 40, 14495, 19);
INSERT INTO `option` VALUES (14504, '保山市', '保山市', 35, 14436, 19);
INSERT INTO `option` VALUES (14505, '隆阳区', '隆阳区', 5, 14504, 19);
INSERT INTO `option` VALUES (14506, '施甸县', '施甸县', 10, 14504, 19);
INSERT INTO `option` VALUES (14507, '昌宁县', '昌宁县', 15, 14504, 19);
INSERT INTO `option` VALUES (14508, '龙陵县', '龙陵县', 20, 14504, 19);
INSERT INTO `option` VALUES (14509, '腾冲县', '腾冲县', 25, 14504, 19);
INSERT INTO `option` VALUES (14510, '丽江市', '丽江市', 40, 14436, 19);
INSERT INTO `option` VALUES (14511, '玉龙县', '玉龙县', 5, 14510, 19);
INSERT INTO `option` VALUES (14512, '华坪县', '华坪县', 10, 14510, 19);
INSERT INTO `option` VALUES (14513, '永胜县', '永胜县', 15, 14510, 19);
INSERT INTO `option` VALUES (14514, '宁蒗县', '宁蒗县', 20, 14510, 19);
INSERT INTO `option` VALUES (14515, '古城区', '古城区', 25, 14510, 19);
INSERT INTO `option` VALUES (14516, '文山州', '文山州', 45, 14436, 19);
INSERT INTO `option` VALUES (14517, '文山市', '文山市', 5, 14516, 19);
INSERT INTO `option` VALUES (14518, '麻栗坡县', '麻栗坡县', 10, 14516, 19);
INSERT INTO `option` VALUES (14519, '砚山县', '砚山县', 15, 14516, 19);
INSERT INTO `option` VALUES (14520, '广南县', '广南县', 20, 14516, 19);
INSERT INTO `option` VALUES (14521, '马关县', '马关县', 25, 14516, 19);
INSERT INTO `option` VALUES (14522, '富宁县', '富宁县', 30, 14516, 19);
INSERT INTO `option` VALUES (14523, '西畴县', '西畴县', 35, 14516, 19);
INSERT INTO `option` VALUES (14524, '丘北县', '丘北县', 40, 14516, 19);
INSERT INTO `option` VALUES (14525, '红河州', '红河州', 50, 14436, 19);
INSERT INTO `option` VALUES (14526, '个旧市', '个旧市', 5, 14525, 19);
INSERT INTO `option` VALUES (14527, '开远市', '开远市', 10, 14525, 19);
INSERT INTO `option` VALUES (14528, '弥勒县', '弥勒县', 15, 14525, 19);
INSERT INTO `option` VALUES (14529, '红河县', '红河县', 20, 14525, 19);
INSERT INTO `option` VALUES (14530, '绿春县', '绿春县', 25, 14525, 19);
INSERT INTO `option` VALUES (14531, '蒙自市', '蒙自市', 30, 14525, 19);
INSERT INTO `option` VALUES (14532, '泸西县', '泸西县', 35, 14525, 19);
INSERT INTO `option` VALUES (14533, '建水县', '建水县', 40, 14525, 19);
INSERT INTO `option` VALUES (14534, '元阳县', '元阳县', 45, 14525, 19);
INSERT INTO `option` VALUES (14535, '石屏县', '石屏县', 50, 14525, 19);
INSERT INTO `option` VALUES (14536, '金平县', '金平县', 55, 14525, 19);
INSERT INTO `option` VALUES (14537, '屏边县', '屏边县', 60, 14525, 19);
INSERT INTO `option` VALUES (14538, '河口县', '河口县', 65, 14525, 19);
INSERT INTO `option` VALUES (14539, '西双版纳州', '西双版纳州', 55, 14436, 19);
INSERT INTO `option` VALUES (14540, '景洪市', '景洪市', 5, 14539, 19);
INSERT INTO `option` VALUES (14541, '勐海县', '勐海县', 10, 14539, 19);
INSERT INTO `option` VALUES (14542, '勐腊县', '勐腊县', 15, 14539, 19);
INSERT INTO `option` VALUES (14543, '楚雄州', '楚雄州', 60, 14436, 19);
INSERT INTO `option` VALUES (14544, '元谋县', '元谋县', 5, 14543, 19);
INSERT INTO `option` VALUES (14545, '南华县', '南华县', 10, 14543, 19);
INSERT INTO `option` VALUES (14546, '牟定县', '牟定县', 15, 14543, 19);
INSERT INTO `option` VALUES (14547, '武定县', '武定县', 20, 14543, 19);
INSERT INTO `option` VALUES (14548, '大姚县', '大姚县', 25, 14543, 19);
INSERT INTO `option` VALUES (14549, '双柏县', '双柏县', 30, 14543, 19);
INSERT INTO `option` VALUES (14550, '禄丰县', '禄丰县', 35, 14543, 19);
INSERT INTO `option` VALUES (14551, '永仁县', '永仁县', 40, 14543, 19);
INSERT INTO `option` VALUES (14552, '姚安县', '姚安县', 45, 14543, 19);
INSERT INTO `option` VALUES (14553, '楚雄市', '楚雄市', 50, 14543, 19);
INSERT INTO `option` VALUES (14554, '大理州', '大理州', 65, 14436, 19);
INSERT INTO `option` VALUES (14555, '剑川县', '剑川县', 5, 14554, 19);
INSERT INTO `option` VALUES (14556, '弥渡县', '弥渡县', 10, 14554, 19);
INSERT INTO `option` VALUES (14557, '云龙县', '云龙县', 15, 14554, 19);
INSERT INTO `option` VALUES (14558, '洱源县', '洱源县', 20, 14554, 19);
INSERT INTO `option` VALUES (14559, '鹤庆县', '鹤庆县', 25, 14554, 19);
INSERT INTO `option` VALUES (14560, '宾川县', '宾川县', 30, 14554, 19);
INSERT INTO `option` VALUES (14561, '祥云县', '祥云县', 35, 14554, 19);
INSERT INTO `option` VALUES (14562, '永平县', '永平县', 40, 14554, 19);
INSERT INTO `option` VALUES (14563, '巍山县', '巍山县', 45, 14554, 19);
INSERT INTO `option` VALUES (14564, '漾濞县', '漾濞县', 50, 14554, 19);
INSERT INTO `option` VALUES (14565, '南涧县', '南涧县', 55, 14554, 19);
INSERT INTO `option` VALUES (14566, '大理市', '大理市', 60, 14554, 19);
INSERT INTO `option` VALUES (14567, '德宏州', '德宏州', 70, 14436, 19);
INSERT INTO `option` VALUES (14568, '芒市', '芒市', 5, 14567, 19);
INSERT INTO `option` VALUES (14569, '瑞丽市', '瑞丽市', 10, 14567, 19);
INSERT INTO `option` VALUES (14570, '盈江县', '盈江县', 15, 14567, 19);
INSERT INTO `option` VALUES (14571, '梁河县', '梁河县', 20, 14567, 19);
INSERT INTO `option` VALUES (14572, '陇川县', '陇川县', 25, 14567, 19);
INSERT INTO `option` VALUES (14573, '怒江州', '怒江州', 75, 14436, 19);
INSERT INTO `option` VALUES (14574, '泸水县', '泸水县', 5, 14573, 19);
INSERT INTO `option` VALUES (14575, '福贡县', '福贡县', 10, 14573, 19);
INSERT INTO `option` VALUES (14576, '兰坪县', '兰坪县', 15, 14573, 19);
INSERT INTO `option` VALUES (14577, '贡山县', '贡山县', 20, 14573, 19);
INSERT INTO `option` VALUES (14578, '迪庆州', '迪庆州', 80, 14436, 19);
INSERT INTO `option` VALUES (14579, '香格里拉县', '香格里拉县', 5, 14578, 19);
INSERT INTO `option` VALUES (14580, '德钦县', '德钦县', 10, 14578, 19);
INSERT INTO `option` VALUES (14581, '维西县', '维西县', 15, 14578, 19);
INSERT INTO `option` VALUES (14582, '西藏自治区', '西藏自治区', 130, 0, 19);
INSERT INTO `option` VALUES (14583, '拉萨市', '拉萨市', 5, 14582, 19);
INSERT INTO `option` VALUES (14584, '城关区', '城关区', 5, 14583, 19);
INSERT INTO `option` VALUES (14585, '林周县', '林周县', 10, 14583, 19);
INSERT INTO `option` VALUES (14586, '当雄县', '当雄县', 15, 14583, 19);
INSERT INTO `option` VALUES (14587, '尼木县', '尼木县', 20, 14583, 19);
INSERT INTO `option` VALUES (14588, '曲水县', '曲水县', 25, 14583, 19);
INSERT INTO `option` VALUES (14589, '堆龙德庆县', '堆龙德庆县', 30, 14583, 19);
INSERT INTO `option` VALUES (14590, '达孜县', '达孜县', 35, 14583, 19);
INSERT INTO `option` VALUES (14591, '墨竹工卡县', '墨竹工卡县', 40, 14583, 19);
INSERT INTO `option` VALUES (14592, '那曲地区', '那曲地区', 10, 14582, 19);
INSERT INTO `option` VALUES (14593, '索县', '索县', 5, 14592, 19);
INSERT INTO `option` VALUES (14594, '那曲县', '那曲县', 10, 14592, 19);
INSERT INTO `option` VALUES (14595, '嘉黎县', '嘉黎县', 15, 14592, 19);
INSERT INTO `option` VALUES (14596, '比如县', '比如县', 20, 14592, 19);
INSERT INTO `option` VALUES (14597, '聂荣县', '聂荣县', 25, 14592, 19);
INSERT INTO `option` VALUES (14598, '安多县', '安多县', 30, 14592, 19);
INSERT INTO `option` VALUES (14599, '申扎县', '申扎县', 35, 14592, 19);
INSERT INTO `option` VALUES (14600, '班戈县', '班戈县', 40, 14592, 19);
INSERT INTO `option` VALUES (14601, '巴青县', '巴青县', 45, 14592, 19);
INSERT INTO `option` VALUES (14602, '尼玛县', '尼玛县', 50, 14592, 19);
INSERT INTO `option` VALUES (14603, '山南地区', '山南地区', 15, 14582, 19);
INSERT INTO `option` VALUES (14604, '贡嘎县', '贡嘎县', 5, 14603, 19);
INSERT INTO `option` VALUES (14605, '扎囊县', '扎囊县', 10, 14603, 19);
INSERT INTO `option` VALUES (14606, '乃东县', '乃东县', 15, 14603, 19);
INSERT INTO `option` VALUES (14607, '桑日县', '桑日县', 20, 14603, 19);
INSERT INTO `option` VALUES (14608, '琼结县', '琼结县', 25, 14603, 19);
INSERT INTO `option` VALUES (14609, '曲松县', '曲松县', 30, 14603, 19);
INSERT INTO `option` VALUES (14610, '措美县', '措美县', 35, 14603, 19);
INSERT INTO `option` VALUES (14611, '洛扎县', '洛扎县', 40, 14603, 19);
INSERT INTO `option` VALUES (14612, '加查县', '加查县', 45, 14603, 19);
INSERT INTO `option` VALUES (14613, '隆子县', '隆子县', 50, 14603, 19);
INSERT INTO `option` VALUES (14614, '错那县', '错那县', 55, 14603, 19);
INSERT INTO `option` VALUES (14615, '浪卡子县', '浪卡子县', 60, 14603, 19);
INSERT INTO `option` VALUES (14616, '昌都地区', '昌都地区', 20, 14582, 19);
INSERT INTO `option` VALUES (14617, '昌都县', '昌都县', 5, 14616, 19);
INSERT INTO `option` VALUES (14618, '江达县', '江达县', 10, 14616, 19);
INSERT INTO `option` VALUES (14619, '贡觉县', '贡觉县', 15, 14616, 19);
INSERT INTO `option` VALUES (14620, '类乌齐县', '类乌齐县', 20, 14616, 19);
INSERT INTO `option` VALUES (14621, '丁青县', '丁青县', 25, 14616, 19);
INSERT INTO `option` VALUES (14622, '察雅县', '察雅县', 30, 14616, 19);
INSERT INTO `option` VALUES (14623, '八宿县', '八宿县', 35, 14616, 19);
INSERT INTO `option` VALUES (14624, '左贡县', '左贡县', 40, 14616, 19);
INSERT INTO `option` VALUES (14625, '芒康县', '芒康县', 45, 14616, 19);
INSERT INTO `option` VALUES (14626, '洛隆县', '洛隆县', 50, 14616, 19);
INSERT INTO `option` VALUES (14627, '边坝县', '边坝县', 55, 14616, 19);
INSERT INTO `option` VALUES (14628, '日喀则地区', '日喀则地区', 25, 14582, 19);
INSERT INTO `option` VALUES (14629, '聂拉木县', '聂拉木县', 5, 14628, 19);
INSERT INTO `option` VALUES (14630, '昂仁县', '昂仁县', 10, 14628, 19);
INSERT INTO `option` VALUES (14631, '日喀则市', '日喀则市', 15, 14628, 19);
INSERT INTO `option` VALUES (14632, '南木林县', '南木林县', 20, 14628, 19);
INSERT INTO `option` VALUES (14633, '江孜县', '江孜县', 25, 14628, 19);
INSERT INTO `option` VALUES (14634, '定日县', '定日县', 30, 14628, 19);
INSERT INTO `option` VALUES (14635, '萨迦县　', '萨迦县　', 35, 14628, 19);
INSERT INTO `option` VALUES (14636, '拉孜县', '拉孜县', 40, 14628, 19);
INSERT INTO `option` VALUES (14637, '谢通门县', '谢通门县', 45, 14628, 19);
INSERT INTO `option` VALUES (14638, '白朗县', '白朗县', 50, 14628, 19);
INSERT INTO `option` VALUES (14639, '仁布县', '仁布县', 55, 14628, 19);
INSERT INTO `option` VALUES (14640, '康马县', '康马县', 60, 14628, 19);
INSERT INTO `option` VALUES (14641, '定结县', '定结县', 65, 14628, 19);
INSERT INTO `option` VALUES (14642, '仲巴县', '仲巴县', 70, 14628, 19);
INSERT INTO `option` VALUES (14643, '亚东县', '亚东县', 75, 14628, 19);
INSERT INTO `option` VALUES (14644, '吉隆县', '吉隆县', 80, 14628, 19);
INSERT INTO `option` VALUES (14645, '萨嘎县', '萨嘎县', 85, 14628, 19);
INSERT INTO `option` VALUES (14646, '岗巴县', '岗巴县', 90, 14628, 19);
INSERT INTO `option` VALUES (14647, '阿里地区', '阿里地区', 30, 14582, 19);
INSERT INTO `option` VALUES (14648, '噶尔县', '噶尔县', 5, 14647, 19);
INSERT INTO `option` VALUES (14649, '普兰县', '普兰县', 10, 14647, 19);
INSERT INTO `option` VALUES (14650, '札达县　', '札达县　', 15, 14647, 19);
INSERT INTO `option` VALUES (14651, '日土县', '日土县', 20, 14647, 19);
INSERT INTO `option` VALUES (14652, '革吉县', '革吉县', 25, 14647, 19);
INSERT INTO `option` VALUES (14653, '改则县', '改则县', 30, 14647, 19);
INSERT INTO `option` VALUES (14654, '措勤县', '措勤县', 35, 14647, 19);
INSERT INTO `option` VALUES (14655, '林芝地区', '林芝地区', 35, 14582, 19);
INSERT INTO `option` VALUES (14656, '林芝县', '林芝县', 5, 14655, 19);
INSERT INTO `option` VALUES (14657, '工布江达县', '工布江达县', 10, 14655, 19);
INSERT INTO `option` VALUES (14658, '米林县', '米林县', 15, 14655, 19);
INSERT INTO `option` VALUES (14659, '墨脱县', '墨脱县', 20, 14655, 19);
INSERT INTO `option` VALUES (14660, '波密县', '波密县', 25, 14655, 19);
INSERT INTO `option` VALUES (14661, '察隅县', '察隅县', 30, 14655, 19);
INSERT INTO `option` VALUES (14662, '朗县', '朗县', 35, 14655, 19);
INSERT INTO `option` VALUES (14663, '陕西省', '陕西省', 135, 0, 19);
INSERT INTO `option` VALUES (14664, '西安市', '西安市', 5, 14663, 19);
INSERT INTO `option` VALUES (14665, '新城区', '新城区', 5, 14664, 19);
INSERT INTO `option` VALUES (14666, '雁塔区', '雁塔区', 10, 14664, 19);
INSERT INTO `option` VALUES (14667, '未央区', '未央区', 15, 14664, 19);
INSERT INTO `option` VALUES (14668, '长安区', '长安区', 20, 14664, 19);
INSERT INTO `option` VALUES (14669, '灞桥区', '灞桥区', 25, 14664, 19);
INSERT INTO `option` VALUES (14670, '碑林区', '碑林区', 30, 14664, 19);
INSERT INTO `option` VALUES (14671, '莲湖区', '莲湖区', 35, 14664, 19);
INSERT INTO `option` VALUES (14672, '临潼区', '临潼区', 40, 14664, 19);
INSERT INTO `option` VALUES (14673, '阎良区', '阎良区', 45, 14664, 19);
INSERT INTO `option` VALUES (14674, '杨凌农业示范区', '杨凌农业示范区', 50, 14664, 19);
INSERT INTO `option` VALUES (14675, '西安武警工程学院', '西安武警工程学院', 55, 14664, 19);
INSERT INTO `option` VALUES (14676, '高陵县', '高陵县', 60, 14664, 19);
INSERT INTO `option` VALUES (14677, '蓝田县', '蓝田县', 65, 14664, 19);
INSERT INTO `option` VALUES (14678, '户县', '户县', 70, 14664, 19);
INSERT INTO `option` VALUES (14679, '周至县', '周至县', 75, 14664, 19);
INSERT INTO `option` VALUES (14680, '铜川市', '铜川市', 10, 14663, 19);
INSERT INTO `option` VALUES (14681, '印台区', '印台区', 5, 14680, 19);
INSERT INTO `option` VALUES (14682, '宜君县', '宜君县', 10, 14680, 19);
INSERT INTO `option` VALUES (14683, '王益区', '王益区', 15, 14680, 19);
INSERT INTO `option` VALUES (14684, '耀州区', '耀州区', 20, 14680, 19);
INSERT INTO `option` VALUES (14685, '宝鸡市', '宝鸡市', 15, 14663, 19);
INSERT INTO `option` VALUES (14686, '渭滨区', '渭滨区', 5, 14685, 19);
INSERT INTO `option` VALUES (14687, '金台区', '金台区', 10, 14685, 19);
INSERT INTO `option` VALUES (14688, '岐山县', '岐山县', 15, 14685, 19);
INSERT INTO `option` VALUES (14689, '太白县', '太白县', 20, 14685, 19);
INSERT INTO `option` VALUES (14690, '凤翔县', '凤翔县', 25, 14685, 19);
INSERT INTO `option` VALUES (14691, '陇县', '陇县', 30, 14685, 19);
INSERT INTO `option` VALUES (14692, '麟游县', '麟游县', 35, 14685, 19);
INSERT INTO `option` VALUES (14693, '千阳县', '千阳县', 40, 14685, 19);
INSERT INTO `option` VALUES (14694, '扶风县', '扶风县', 45, 14685, 19);
INSERT INTO `option` VALUES (14695, '凤县', '凤县', 50, 14685, 19);
INSERT INTO `option` VALUES (14696, '眉县', '眉县', 55, 14685, 19);
INSERT INTO `option` VALUES (14697, '陈仓区', '陈仓区', 60, 14685, 19);
INSERT INTO `option` VALUES (14698, '咸阳市', '咸阳市', 20, 14663, 19);
INSERT INTO `option` VALUES (14699, '秦都区', '秦都区', 5, 14698, 19);
INSERT INTO `option` VALUES (14700, '渭城区', '渭城区', 10, 14698, 19);
INSERT INTO `option` VALUES (14701, '兴平市', '兴平市', 15, 14698, 19);
INSERT INTO `option` VALUES (14702, '礼泉县', '礼泉县', 20, 14698, 19);
INSERT INTO `option` VALUES (14703, '泾阳县', '泾阳县', 25, 14698, 19);
INSERT INTO `option` VALUES (14704, '永寿县', '永寿县', 30, 14698, 19);
INSERT INTO `option` VALUES (14705, '三原县', '三原县', 35, 14698, 19);
INSERT INTO `option` VALUES (14706, '彬县', '彬县', 40, 14698, 19);
INSERT INTO `option` VALUES (14707, '旬邑县', '旬邑县', 45, 14698, 19);
INSERT INTO `option` VALUES (14708, '长武县', '长武县', 50, 14698, 19);
INSERT INTO `option` VALUES (14709, '乾县', '乾县', 55, 14698, 19);
INSERT INTO `option` VALUES (14710, '武功县', '武功县', 60, 14698, 19);
INSERT INTO `option` VALUES (14711, '淳化县', '淳化县', 65, 14698, 19);
INSERT INTO `option` VALUES (14712, '杨陵区', '杨陵区', 70, 14698, 19);
INSERT INTO `option` VALUES (14713, '渭南市', '渭南市', 25, 14663, 19);
INSERT INTO `option` VALUES (14714, '韩城市', '韩城市', 5, 14713, 19);
INSERT INTO `option` VALUES (14715, '华阴市', '华阴市', 10, 14713, 19);
INSERT INTO `option` VALUES (14716, '蒲城县', '蒲城县', 15, 14713, 19);
INSERT INTO `option` VALUES (14717, '华县', '华县', 20, 14713, 19);
INSERT INTO `option` VALUES (14718, '潼关县', '潼关县', 25, 14713, 19);
INSERT INTO `option` VALUES (14719, '大荔县', '大荔县', 30, 14713, 19);
INSERT INTO `option` VALUES (14720, '澄城县', '澄城县', 35, 14713, 19);
INSERT INTO `option` VALUES (14721, '合阳县', '合阳县', 40, 14713, 19);
INSERT INTO `option` VALUES (14722, '白水县', '白水县', 45, 14713, 19);
INSERT INTO `option` VALUES (14723, '富平县', '富平县', 50, 14713, 19);
INSERT INTO `option` VALUES (14724, '临渭区', '临渭区', 55, 14713, 19);
INSERT INTO `option` VALUES (14725, '延安市', '延安市', 30, 14663, 19);
INSERT INTO `option` VALUES (14726, '宝塔区', '宝塔区', 5, 14725, 19);
INSERT INTO `option` VALUES (14727, '安塞县', '安塞县', 10, 14725, 19);
INSERT INTO `option` VALUES (14728, '洛川县', '洛川县', 15, 14725, 19);
INSERT INTO `option` VALUES (14729, '子长县', '子长县', 20, 14725, 19);
INSERT INTO `option` VALUES (14730, '黄陵县', '黄陵县', 25, 14725, 19);
INSERT INTO `option` VALUES (14731, '延长县', '延长县', 30, 14725, 19);
INSERT INTO `option` VALUES (14732, '宜川县', '宜川县', 35, 14725, 19);
INSERT INTO `option` VALUES (14733, '延川县', '延川县', 40, 14725, 19);
INSERT INTO `option` VALUES (14734, '甘泉县', '甘泉县', 45, 14725, 19);
INSERT INTO `option` VALUES (14735, '富县', '富县', 50, 14725, 19);
INSERT INTO `option` VALUES (14736, '志丹县', '志丹县', 55, 14725, 19);
INSERT INTO `option` VALUES (14737, '黄龙县', '黄龙县', 60, 14725, 19);
INSERT INTO `option` VALUES (14738, '吴起县', '吴起县', 65, 14725, 19);
INSERT INTO `option` VALUES (14739, '汉中市', '汉中市', 35, 14663, 19);
INSERT INTO `option` VALUES (14740, '汉台区', '汉台区', 5, 14739, 19);
INSERT INTO `option` VALUES (14741, '南郑县', '南郑县', 10, 14739, 19);
INSERT INTO `option` VALUES (14742, '城固县', '城固县', 15, 14739, 19);
INSERT INTO `option` VALUES (14743, '洋县', '洋县', 20, 14739, 19);
INSERT INTO `option` VALUES (14744, '佛坪县', '佛坪县', 25, 14739, 19);
INSERT INTO `option` VALUES (14745, '留坝县', '留坝县', 30, 14739, 19);
INSERT INTO `option` VALUES (14746, '镇巴县', '镇巴县', 35, 14739, 19);
INSERT INTO `option` VALUES (14747, '西乡县', '西乡县', 40, 14739, 19);
INSERT INTO `option` VALUES (14748, '勉县', '勉县', 45, 14739, 19);
INSERT INTO `option` VALUES (14749, '略阳县', '略阳县', 50, 14739, 19);
INSERT INTO `option` VALUES (14750, '宁强县', '宁强县', 55, 14739, 19);
INSERT INTO `option` VALUES (14751, '榆林市', '榆林市', 40, 14663, 19);
INSERT INTO `option` VALUES (14752, '清涧县', '清涧县', 5, 14751, 19);
INSERT INTO `option` VALUES (14753, '绥德县', '绥德县', 10, 14751, 19);
INSERT INTO `option` VALUES (14754, '佳县', '佳县', 15, 14751, 19);
INSERT INTO `option` VALUES (14755, '神木县', '神木县', 20, 14751, 19);
INSERT INTO `option` VALUES (14756, '府谷县', '府谷县', 25, 14751, 19);
INSERT INTO `option` VALUES (14757, '子洲县', '子洲县', 30, 14751, 19);
INSERT INTO `option` VALUES (14758, '横山县', '横山县', 35, 14751, 19);
INSERT INTO `option` VALUES (14759, '米脂县', '米脂县', 40, 14751, 19);
INSERT INTO `option` VALUES (14760, '吴堡县', '吴堡县', 45, 14751, 19);
INSERT INTO `option` VALUES (14761, '定边县', '定边县', 50, 14751, 19);
INSERT INTO `option` VALUES (14762, '榆阳区', '榆阳区', 55, 14751, 19);
INSERT INTO `option` VALUES (14763, '靖边县', '靖边县', 60, 14751, 19);
INSERT INTO `option` VALUES (14764, '商洛市', '商洛市', 45, 14663, 19);
INSERT INTO `option` VALUES (14765, '商州区', '商州区', 5, 14764, 19);
INSERT INTO `option` VALUES (14766, '镇安县', '镇安县', 10, 14764, 19);
INSERT INTO `option` VALUES (14767, '山阳县', '山阳县', 15, 14764, 19);
INSERT INTO `option` VALUES (14768, '洛南县', '洛南县', 20, 14764, 19);
INSERT INTO `option` VALUES (14769, '商南县', '商南县', 25, 14764, 19);
INSERT INTO `option` VALUES (14770, '丹凤县', '丹凤县', 30, 14764, 19);
INSERT INTO `option` VALUES (14771, '柞水县', '柞水县', 35, 14764, 19);
INSERT INTO `option` VALUES (14772, '安康市', '安康市', 50, 14663, 19);
INSERT INTO `option` VALUES (14773, '汉滨区', '汉滨区', 5, 14772, 19);
INSERT INTO `option` VALUES (14774, '紫阳县', '紫阳县', 10, 14772, 19);
INSERT INTO `option` VALUES (14775, '岚皋县', '岚皋县', 15, 14772, 19);
INSERT INTO `option` VALUES (14776, '旬阳县', '旬阳县', 20, 14772, 19);
INSERT INTO `option` VALUES (14777, '镇坪县', '镇坪县', 25, 14772, 19);
INSERT INTO `option` VALUES (14778, '平利县', '平利县', 30, 14772, 19);
INSERT INTO `option` VALUES (14779, '宁陕县', '宁陕县', 35, 14772, 19);
INSERT INTO `option` VALUES (14780, '汉阴县', '汉阴县', 40, 14772, 19);
INSERT INTO `option` VALUES (14781, '石泉县', '石泉县', 45, 14772, 19);
INSERT INTO `option` VALUES (14782, '白河县', '白河县', 50, 14772, 19);
INSERT INTO `option` VALUES (14783, '甘肃省', '甘肃省', 140, 0, 19);
INSERT INTO `option` VALUES (14784, '兰州市', '兰州市', 5, 14783, 19);
INSERT INTO `option` VALUES (14785, '七里河区', '七里河区', 5, 14784, 19);
INSERT INTO `option` VALUES (14786, '安宁区', '安宁区', 10, 14784, 19);
INSERT INTO `option` VALUES (14787, '城关区', '城关区', 15, 14784, 19);
INSERT INTO `option` VALUES (14788, '西固区', '西固区', 20, 14784, 19);
INSERT INTO `option` VALUES (14789, '红古区', '红古区', 25, 14784, 19);
INSERT INTO `option` VALUES (14790, '永登县', '永登县', 30, 14784, 19);
INSERT INTO `option` VALUES (14791, '榆中县', '榆中县', 35, 14784, 19);
INSERT INTO `option` VALUES (14792, '皋兰县', '皋兰县', 40, 14784, 19);
INSERT INTO `option` VALUES (14793, '金昌市', '金昌市', 10, 14783, 19);
INSERT INTO `option` VALUES (14794, '永昌县', '永昌县', 5, 14793, 19);
INSERT INTO `option` VALUES (14795, '金川区', '金川区', 10, 14793, 19);
INSERT INTO `option` VALUES (14796, '白银市', '白银市', 15, 14783, 19);
INSERT INTO `option` VALUES (14797, '白银区', '白银区', 5, 14796, 19);
INSERT INTO `option` VALUES (14798, '平川区', '平川区', 10, 14796, 19);
INSERT INTO `option` VALUES (14799, '靖远县', '靖远县', 15, 14796, 19);
INSERT INTO `option` VALUES (14800, '景泰县', '景泰县', 20, 14796, 19);
INSERT INTO `option` VALUES (14801, '会宁县', '会宁县', 25, 14796, 19);
INSERT INTO `option` VALUES (14802, '天水市', '天水市', 20, 14783, 19);
INSERT INTO `option` VALUES (14803, '麦积区', '麦积区', 5, 14802, 19);
INSERT INTO `option` VALUES (14804, '秦州区', '秦州区', 10, 14802, 19);
INSERT INTO `option` VALUES (14805, '甘谷县', '甘谷县', 15, 14802, 19);
INSERT INTO `option` VALUES (14806, '武山县', '武山县', 20, 14802, 19);
INSERT INTO `option` VALUES (14807, '清水县', '清水县', 25, 14802, 19);
INSERT INTO `option` VALUES (14808, '秦安县', '秦安县', 30, 14802, 19);
INSERT INTO `option` VALUES (14809, '张家川县', '张家川县', 35, 14802, 19);
INSERT INTO `option` VALUES (14810, '嘉峪关市', '嘉峪关市', 25, 14783, 19);
INSERT INTO `option` VALUES (14811, '长城区', '长城区', 5, 14810, 19);
INSERT INTO `option` VALUES (14812, '镜铁区', '镜铁区', 10, 14810, 19);
INSERT INTO `option` VALUES (14813, '雄关区', '雄关区', 15, 14810, 19);
INSERT INTO `option` VALUES (14814, '平凉市', '平凉市', 30, 14783, 19);
INSERT INTO `option` VALUES (14815, '静宁县', '静宁县', 5, 14814, 19);
INSERT INTO `option` VALUES (14816, '崆峒区', '崆峒区', 10, 14814, 19);
INSERT INTO `option` VALUES (14817, '华亭县', '华亭县', 15, 14814, 19);
INSERT INTO `option` VALUES (14818, '崇信县', '崇信县', 20, 14814, 19);
INSERT INTO `option` VALUES (14819, '泾川县', '泾川县', 25, 14814, 19);
INSERT INTO `option` VALUES (14820, '灵台县', '灵台县', 30, 14814, 19);
INSERT INTO `option` VALUES (14821, '镇原县', '镇原县', 35, 14814, 19);
INSERT INTO `option` VALUES (14822, '庄浪县', '庄浪县', 40, 14814, 19);
INSERT INTO `option` VALUES (14823, '庆阳市', '庆阳市', 35, 14783, 19);
INSERT INTO `option` VALUES (14824, '庆城县', '庆城县', 5, 14823, 19);
INSERT INTO `option` VALUES (14825, '西峰区', '西峰区', 10, 14823, 19);
INSERT INTO `option` VALUES (14826, '镇原县', '镇原县', 15, 14823, 19);
INSERT INTO `option` VALUES (14827, '合水县', '合水县', 20, 14823, 19);
INSERT INTO `option` VALUES (14828, '华池县', '华池县', 25, 14823, 19);
INSERT INTO `option` VALUES (14829, '环县', '环县', 30, 14823, 19);
INSERT INTO `option` VALUES (14830, '宁县', '宁县', 35, 14823, 19);
INSERT INTO `option` VALUES (14831, '正宁县', '正宁县', 40, 14823, 19);
INSERT INTO `option` VALUES (14832, '陇南市', '陇南市', 40, 14783, 19);
INSERT INTO `option` VALUES (14833, '成县', '成县', 5, 14832, 19);
INSERT INTO `option` VALUES (14834, '礼县', '礼县', 10, 14832, 19);
INSERT INTO `option` VALUES (14835, '康县', '康县', 15, 14832, 19);
INSERT INTO `option` VALUES (14836, '武都区', '武都区', 20, 14832, 19);
INSERT INTO `option` VALUES (14837, '文县', '文县', 25, 14832, 19);
INSERT INTO `option` VALUES (14838, '两当县', '两当县', 30, 14832, 19);
INSERT INTO `option` VALUES (14839, '徽县', '徽县', 35, 14832, 19);
INSERT INTO `option` VALUES (14840, '宕昌县', '宕昌县', 40, 14832, 19);
INSERT INTO `option` VALUES (14841, '西和县', '西和县', 45, 14832, 19);
INSERT INTO `option` VALUES (14842, '武威市', '武威市', 45, 14783, 19);
INSERT INTO `option` VALUES (14843, '凉州区', '凉州区', 5, 14842, 19);
INSERT INTO `option` VALUES (14844, '古浪县', '古浪县', 10, 14842, 19);
INSERT INTO `option` VALUES (14845, '天祝县', '天祝县', 15, 14842, 19);
INSERT INTO `option` VALUES (14846, '民勤县', '民勤县', 20, 14842, 19);
INSERT INTO `option` VALUES (14847, '张掖市', '张掖市', 50, 14783, 19);
INSERT INTO `option` VALUES (14848, '甘州区', '甘州区', 5, 14847, 19);
INSERT INTO `option` VALUES (14849, '山丹县', '山丹县', 10, 14847, 19);
INSERT INTO `option` VALUES (14850, '临泽县', '临泽县', 15, 14847, 19);
INSERT INTO `option` VALUES (14851, '高台县', '高台县', 20, 14847, 19);
INSERT INTO `option` VALUES (14852, '肃南县', '肃南县', 25, 14847, 19);
INSERT INTO `option` VALUES (14853, '民乐县', '民乐县', 30, 14847, 19);
INSERT INTO `option` VALUES (14854, '酒泉市', '酒泉市', 55, 14783, 19);
INSERT INTO `option` VALUES (14855, '金塔县', '金塔县', 5, 14854, 19);
INSERT INTO `option` VALUES (14856, '阿克塞县', '阿克塞县', 10, 14854, 19);
INSERT INTO `option` VALUES (14857, '肃北县', '肃北县', 15, 14854, 19);
INSERT INTO `option` VALUES (14858, '瓜州县', '瓜州县', 20, 14854, 19);
INSERT INTO `option` VALUES (14859, '肃州区', '肃州区', 25, 14854, 19);
INSERT INTO `option` VALUES (14860, '玉门市', '玉门市', 30, 14854, 19);
INSERT INTO `option` VALUES (14861, '敦煌市', '敦煌市', 35, 14854, 19);
INSERT INTO `option` VALUES (14862, '甘南州', '甘南州', 60, 14783, 19);
INSERT INTO `option` VALUES (14863, '合作市', '合作市', 5, 14862, 19);
INSERT INTO `option` VALUES (14864, '夏河县', '夏河县', 10, 14862, 19);
INSERT INTO `option` VALUES (14865, '碌曲县', '碌曲县', 15, 14862, 19);
INSERT INTO `option` VALUES (14866, '舟曲县', '舟曲县', 20, 14862, 19);
INSERT INTO `option` VALUES (14867, '玛曲县', '玛曲县', 25, 14862, 19);
INSERT INTO `option` VALUES (14868, '迭部县', '迭部县', 30, 14862, 19);
INSERT INTO `option` VALUES (14869, '临潭县', '临潭县', 35, 14862, 19);
INSERT INTO `option` VALUES (14870, '卓尼县', '卓尼县', 40, 14862, 19);
INSERT INTO `option` VALUES (14871, '临夏州', '临夏州', 65, 14783, 19);
INSERT INTO `option` VALUES (14872, '临夏县', '临夏县', 5, 14871, 19);
INSERT INTO `option` VALUES (14873, '康乐县', '康乐县', 10, 14871, 19);
INSERT INTO `option` VALUES (14874, '永靖县', '永靖县', 15, 14871, 19);
INSERT INTO `option` VALUES (14875, '和政县', '和政县', 20, 14871, 19);
INSERT INTO `option` VALUES (14876, '东乡族自治县', '东乡族自治县', 25, 14871, 19);
INSERT INTO `option` VALUES (14877, '积石山县', '积石山县', 30, 14871, 19);
INSERT INTO `option` VALUES (14878, '临夏市', '临夏市', 35, 14871, 19);
INSERT INTO `option` VALUES (14879, '广河县', '广河县', 40, 14871, 19);
INSERT INTO `option` VALUES (14880, '定西市', '定西市', 70, 14783, 19);
INSERT INTO `option` VALUES (14881, '岷县', '岷县', 5, 14880, 19);
INSERT INTO `option` VALUES (14882, '安定区', '安定区', 10, 14880, 19);
INSERT INTO `option` VALUES (14883, '通渭县', '通渭县', 15, 14880, 19);
INSERT INTO `option` VALUES (14884, '临洮县', '临洮县', 20, 14880, 19);
INSERT INTO `option` VALUES (14885, '漳县', '漳县', 25, 14880, 19);
INSERT INTO `option` VALUES (14886, '渭源县', '渭源县', 30, 14880, 19);
INSERT INTO `option` VALUES (14887, '陇西县', '陇西县', 35, 14880, 19);
INSERT INTO `option` VALUES (14888, '青海省', '青海省', 145, 0, 19);
INSERT INTO `option` VALUES (14889, '西宁市', '西宁市', 5, 14888, 19);
INSERT INTO `option` VALUES (14890, '湟中县', '湟中县', 5, 14889, 19);
INSERT INTO `option` VALUES (14891, '湟源县', '湟源县', 10, 14889, 19);
INSERT INTO `option` VALUES (14892, '大通县', '大通县', 15, 14889, 19);
INSERT INTO `option` VALUES (14893, '城中区', '城中区', 20, 14889, 19);
INSERT INTO `option` VALUES (14894, '城东区', '城东区', 25, 14889, 19);
INSERT INTO `option` VALUES (14895, '城西区', '城西区', 30, 14889, 19);
INSERT INTO `option` VALUES (14896, '城北区', '城北区', 35, 14889, 19);
INSERT INTO `option` VALUES (14897, '海东地区', '海东地区', 10, 14888, 19);
INSERT INTO `option` VALUES (14898, '平安县', '平安县', 5, 14897, 19);
INSERT INTO `option` VALUES (14899, '乐都县', '乐都县', 10, 14897, 19);
INSERT INTO `option` VALUES (14900, '民和县', '民和县', 15, 14897, 19);
INSERT INTO `option` VALUES (14901, '互助县', '互助县', 20, 14897, 19);
INSERT INTO `option` VALUES (14902, '化隆县', '化隆县', 25, 14897, 19);
INSERT INTO `option` VALUES (14903, '循化县', '循化县', 30, 14897, 19);
INSERT INTO `option` VALUES (14904, '海北州', '海北州', 15, 14888, 19);
INSERT INTO `option` VALUES (14905, '海晏县', '海晏县', 5, 14904, 19);
INSERT INTO `option` VALUES (14906, '祁连县', '祁连县', 10, 14904, 19);
INSERT INTO `option` VALUES (14907, '刚察县', '刚察县', 15, 14904, 19);
INSERT INTO `option` VALUES (14908, '门源县', '门源县', 20, 14904, 19);
INSERT INTO `option` VALUES (14909, '黄南州', '黄南州', 20, 14888, 19);
INSERT INTO `option` VALUES (14910, '尖扎县', '尖扎县', 5, 14909, 19);
INSERT INTO `option` VALUES (14911, '同仁县', '同仁县', 10, 14909, 19);
INSERT INTO `option` VALUES (14912, '泽库县', '泽库县', 15, 14909, 19);
INSERT INTO `option` VALUES (14913, '河南县', '河南县', 20, 14909, 19);
INSERT INTO `option` VALUES (14914, '海南州', '海南州', 25, 14888, 19);
INSERT INTO `option` VALUES (14915, '共和县', '共和县', 5, 14914, 19);
INSERT INTO `option` VALUES (14916, '同德县', '同德县', 10, 14914, 19);
INSERT INTO `option` VALUES (14917, '贵德县', '贵德县', 15, 14914, 19);
INSERT INTO `option` VALUES (14918, '兴海县', '兴海县', 20, 14914, 19);
INSERT INTO `option` VALUES (14919, '贵南县', '贵南县', 25, 14914, 19);
INSERT INTO `option` VALUES (14920, '果洛州', '果洛州', 30, 14888, 19);
INSERT INTO `option` VALUES (14921, '玛沁县', '玛沁县', 5, 14920, 19);
INSERT INTO `option` VALUES (14922, '甘德县', '甘德县', 10, 14920, 19);
INSERT INTO `option` VALUES (14923, '达日县', '达日县', 15, 14920, 19);
INSERT INTO `option` VALUES (14924, '班玛县', '班玛县', 20, 14920, 19);
INSERT INTO `option` VALUES (14925, '久治县', '久治县', 25, 14920, 19);
INSERT INTO `option` VALUES (14926, '玛多县', '玛多县', 30, 14920, 19);
INSERT INTO `option` VALUES (14927, '玉树州', '玉树州', 35, 14888, 19);
INSERT INTO `option` VALUES (14928, '玉树县', '玉树县', 5, 14927, 19);
INSERT INTO `option` VALUES (14929, '称多县', '称多县', 10, 14927, 19);
INSERT INTO `option` VALUES (14930, '囊谦县', '囊谦县', 15, 14927, 19);
INSERT INTO `option` VALUES (14931, '杂多县', '杂多县', 20, 14927, 19);
INSERT INTO `option` VALUES (14932, '治多县', '治多县', 25, 14927, 19);
INSERT INTO `option` VALUES (14933, '曲麻莱县', '曲麻莱县', 30, 14927, 19);
INSERT INTO `option` VALUES (14934, '海西州', '海西州', 40, 14888, 19);
INSERT INTO `option` VALUES (14935, '德令哈市', '德令哈市', 5, 14934, 19);
INSERT INTO `option` VALUES (14936, '乌兰县', '乌兰县', 10, 14934, 19);
INSERT INTO `option` VALUES (14937, '天峻县', '天峻县', 15, 14934, 19);
INSERT INTO `option` VALUES (14938, '都兰县', '都兰县', 20, 14934, 19);
INSERT INTO `option` VALUES (14939, '大柴旦行委', '大柴旦行委', 25, 14934, 19);
INSERT INTO `option` VALUES (14940, '冷湖行委', '冷湖行委', 30, 14934, 19);
INSERT INTO `option` VALUES (14941, '茫崖行委', '茫崖行委', 35, 14934, 19);
INSERT INTO `option` VALUES (14942, '格尔木市', '格尔木市', 40, 14934, 19);
INSERT INTO `option` VALUES (14943, '宁夏回族自治区', '宁夏回族自治区', 150, 0, 19);
INSERT INTO `option` VALUES (14944, '银川市', '银川市', 5, 14943, 19);
INSERT INTO `option` VALUES (14945, '灵武市', '灵武市', 5, 14944, 19);
INSERT INTO `option` VALUES (14946, '永宁县', '永宁县', 10, 14944, 19);
INSERT INTO `option` VALUES (14947, '贺兰县', '贺兰县', 15, 14944, 19);
INSERT INTO `option` VALUES (14948, '兴庆区', '兴庆区', 20, 14944, 19);
INSERT INTO `option` VALUES (14949, '金凤区', '金凤区', 25, 14944, 19);
INSERT INTO `option` VALUES (14950, '西夏区', '西夏区', 30, 14944, 19);
INSERT INTO `option` VALUES (14951, '石嘴山市', '石嘴山市', 10, 14943, 19);
INSERT INTO `option` VALUES (14952, '平罗县', '平罗县', 5, 14951, 19);
INSERT INTO `option` VALUES (14953, '惠农区', '惠农区', 10, 14951, 19);
INSERT INTO `option` VALUES (14954, '大武口区', '大武口区', 15, 14951, 19);
INSERT INTO `option` VALUES (14955, '吴忠市', '吴忠市', 15, 14943, 19);
INSERT INTO `option` VALUES (14956, '青铜峡市', '青铜峡市', 5, 14955, 19);
INSERT INTO `option` VALUES (14957, '同心县', '同心县', 10, 14955, 19);
INSERT INTO `option` VALUES (14958, '盐池县', '盐池县', 15, 14955, 19);
INSERT INTO `option` VALUES (14959, '红寺堡开发区', '红寺堡开发区', 20, 14955, 19);
INSERT INTO `option` VALUES (14960, '利通区', '利通区', 25, 14955, 19);
INSERT INTO `option` VALUES (14961, '固原市', '固原市', 20, 14943, 19);
INSERT INTO `option` VALUES (14962, '西吉县', '西吉县', 5, 14961, 19);
INSERT INTO `option` VALUES (14963, '隆德县', '隆德县', 10, 14961, 19);
INSERT INTO `option` VALUES (14964, '泾源县', '泾源县', 15, 14961, 19);
INSERT INTO `option` VALUES (14965, '彭阳县', '彭阳县', 20, 14961, 19);
INSERT INTO `option` VALUES (14966, '原州区', '原州区', 25, 14961, 19);
INSERT INTO `option` VALUES (14967, '中卫市', '中卫市', 25, 14943, 19);
INSERT INTO `option` VALUES (14968, '中宁县', '中宁县', 5, 14967, 19);
INSERT INTO `option` VALUES (14969, '海原县', '海原县', 10, 14967, 19);
INSERT INTO `option` VALUES (14970, '沙坡头区', '沙坡头区', 15, 14967, 19);
INSERT INTO `option` VALUES (14971, '新疆维吾尔自治区', '新疆维吾尔自治区', 155, 0, 19);
INSERT INTO `option` VALUES (14972, '乌鲁木齐市', '乌鲁木齐市', 5, 14971, 19);
INSERT INTO `option` VALUES (14973, '天山区', '天山区', 5, 14972, 19);
INSERT INTO `option` VALUES (14974, '头屯河区', '头屯河区', 10, 14972, 19);
INSERT INTO `option` VALUES (14975, '达坂城区', '达坂城区', 15, 14972, 19);
INSERT INTO `option` VALUES (14976, '米东区', '米东区', 20, 14972, 19);
INSERT INTO `option` VALUES (14977, '新市区', '新市区', 25, 14972, 19);
INSERT INTO `option` VALUES (14978, '沙依巴克区', '沙依巴克区', 30, 14972, 19);
INSERT INTO `option` VALUES (14979, '水磨沟区', '水磨沟区', 35, 14972, 19);
INSERT INTO `option` VALUES (14980, '乌鲁木齐县', '乌鲁木齐县', 40, 14972, 19);
INSERT INTO `option` VALUES (14981, '克拉玛依市', '克拉玛依市', 10, 14971, 19);
INSERT INTO `option` VALUES (14982, '克拉玛依区', '克拉玛依区', 5, 14981, 19);
INSERT INTO `option` VALUES (14983, '独山子区', '独山子区', 10, 14981, 19);
INSERT INTO `option` VALUES (14984, '乌尔禾区', '乌尔禾区', 15, 14981, 19);
INSERT INTO `option` VALUES (14985, '白碱滩区', '白碱滩区', 20, 14981, 19);
INSERT INTO `option` VALUES (14986, '石河子市', '石河子市', 15, 14971, 19);
INSERT INTO `option` VALUES (14987, '石河子市', '石河子市', 5, 14986, 19);
INSERT INTO `option` VALUES (14988, '吐鲁番地区', '吐鲁番地区', 20, 14971, 19);
INSERT INTO `option` VALUES (14989, '吐鲁番市', '吐鲁番市', 5, 14988, 19);
INSERT INTO `option` VALUES (14990, '托克逊县', '托克逊县', 10, 14988, 19);
INSERT INTO `option` VALUES (14991, '鄯善县', '鄯善县', 15, 14988, 19);
INSERT INTO `option` VALUES (14992, '哈密地区', '哈密地区', 25, 14971, 19);
INSERT INTO `option` VALUES (14993, '哈密市', '哈密市', 5, 14992, 19);
INSERT INTO `option` VALUES (14994, '巴里坤县', '巴里坤县', 10, 14992, 19);
INSERT INTO `option` VALUES (14995, '伊吾县', '伊吾县', 15, 14992, 19);
INSERT INTO `option` VALUES (14996, '和田地区', '和田地区', 30, 14971, 19);
INSERT INTO `option` VALUES (14997, '和田县', '和田县', 5, 14996, 19);
INSERT INTO `option` VALUES (14998, '和田市', '和田市', 10, 14996, 19);
INSERT INTO `option` VALUES (14999, '墨玉县', '墨玉县', 15, 14996, 19);
INSERT INTO `option` VALUES (15000, '洛浦县', '洛浦县', 20, 14996, 19);
INSERT INTO `option` VALUES (15001, '策勒县', '策勒县', 25, 14996, 19);
INSERT INTO `option` VALUES (15002, '于田县', '于田县', 30, 14996, 19);
INSERT INTO `option` VALUES (15003, '民丰县', '民丰县', 35, 14996, 19);
INSERT INTO `option` VALUES (15004, '皮山县', '皮山县', 40, 14996, 19);
INSERT INTO `option` VALUES (15005, '阿克苏地区', '阿克苏地区', 35, 14971, 19);
INSERT INTO `option` VALUES (15006, '阿拉尔市', '阿拉尔市', 5, 15005, 19);
INSERT INTO `option` VALUES (15007, '阿克苏市', '阿克苏市', 10, 15005, 19);
INSERT INTO `option` VALUES (15008, '温宿县', '温宿县', 15, 15005, 19);
INSERT INTO `option` VALUES (15009, '沙雅县', '沙雅县', 20, 15005, 19);
INSERT INTO `option` VALUES (15010, '拜城县', '拜城县', 25, 15005, 19);
INSERT INTO `option` VALUES (15011, '阿瓦提县', '阿瓦提县', 30, 15005, 19);
INSERT INTO `option` VALUES (15012, '库车县', '库车县', 35, 15005, 19);
INSERT INTO `option` VALUES (15013, '柯坪县', '柯坪县', 40, 15005, 19);
INSERT INTO `option` VALUES (15014, '新和县', '新和县', 45, 15005, 19);
INSERT INTO `option` VALUES (15015, '乌什县', '乌什县', 50, 15005, 19);
INSERT INTO `option` VALUES (15016, '喀什地区', '喀什地区', 40, 14971, 19);
INSERT INTO `option` VALUES (15017, '喀什市', '喀什市', 5, 15016, 19);
INSERT INTO `option` VALUES (15018, '巴楚县', '巴楚县', 10, 15016, 19);
INSERT INTO `option` VALUES (15019, '泽普县', '泽普县', 15, 15016, 19);
INSERT INTO `option` VALUES (15020, '伽师县', '伽师县', 20, 15016, 19);
INSERT INTO `option` VALUES (15021, '叶城县', '叶城县', 25, 15016, 19);
INSERT INTO `option` VALUES (15022, '岳普湖县', '岳普湖县', 30, 15016, 19);
INSERT INTO `option` VALUES (15023, '疏附县', '疏附县', 35, 15016, 19);
INSERT INTO `option` VALUES (15024, '疏勒县', '疏勒县', 40, 15016, 19);
INSERT INTO `option` VALUES (15025, '英吉沙县', '英吉沙县', 45, 15016, 19);
INSERT INTO `option` VALUES (15026, '麦盖提县', '麦盖提县', 50, 15016, 19);
INSERT INTO `option` VALUES (15027, '莎车县', '莎车县', 55, 15016, 19);
INSERT INTO `option` VALUES (15028, '塔什库尔干县', '塔什库尔干县', 60, 15016, 19);
INSERT INTO `option` VALUES (15029, '克孜勒苏州', '克孜勒苏州', 45, 14971, 19);
INSERT INTO `option` VALUES (15030, '阿图什市', '阿图什市', 5, 15029, 19);
INSERT INTO `option` VALUES (15031, '阿合奇县', '阿合奇县', 10, 15029, 19);
INSERT INTO `option` VALUES (15032, '乌恰县', '乌恰县', 15, 15029, 19);
INSERT INTO `option` VALUES (15033, '阿克陶县', '阿克陶县', 20, 15029, 19);
INSERT INTO `option` VALUES (15034, '巴音郭楞州', '巴音郭楞州', 50, 14971, 19);
INSERT INTO `option` VALUES (15035, '库尔勒市', '库尔勒市', 5, 15034, 19);
INSERT INTO `option` VALUES (15036, '尉犁县', '尉犁县', 10, 15034, 19);
INSERT INTO `option` VALUES (15037, '和静县', '和静县', 15, 15034, 19);
INSERT INTO `option` VALUES (15038, '博湖县', '博湖县', 20, 15034, 19);
INSERT INTO `option` VALUES (15039, '和硕县', '和硕县', 25, 15034, 19);
INSERT INTO `option` VALUES (15040, '轮台县', '轮台县', 30, 15034, 19);
INSERT INTO `option` VALUES (15041, '若羌县', '若羌县', 35, 15034, 19);
INSERT INTO `option` VALUES (15042, '且末县', '且末县', 40, 15034, 19);
INSERT INTO `option` VALUES (15043, '焉耆县', '焉耆县', 45, 15034, 19);
INSERT INTO `option` VALUES (15044, '昌吉州', '昌吉州', 55, 14971, 19);
INSERT INTO `option` VALUES (15045, '昌吉市', '昌吉市', 5, 15044, 19);
INSERT INTO `option` VALUES (15046, '阜康市', '阜康市', 10, 15044, 19);
INSERT INTO `option` VALUES (15047, '奇台县', '奇台县', 15, 15044, 19);
INSERT INTO `option` VALUES (15048, '玛纳斯县', '玛纳斯县', 20, 15044, 19);
INSERT INTO `option` VALUES (15049, '吉木萨尔县', '吉木萨尔县', 25, 15044, 19);
INSERT INTO `option` VALUES (15050, '呼图壁县', '呼图壁县', 30, 15044, 19);
INSERT INTO `option` VALUES (15051, '木垒县', '木垒县', 35, 15044, 19);
INSERT INTO `option` VALUES (15052, '博尔塔拉州', '博尔塔拉州', 60, 14971, 19);
INSERT INTO `option` VALUES (15053, '博乐市', '博乐市', 5, 15052, 19);
INSERT INTO `option` VALUES (15054, '精河县', '精河县', 10, 15052, 19);
INSERT INTO `option` VALUES (15055, '温泉县', '温泉县', 15, 15052, 19);
INSERT INTO `option` VALUES (15056, '伊犁州', '伊犁州', 65, 14971, 19);
INSERT INTO `option` VALUES (15057, '伊宁县', '伊宁县', 5, 15056, 19);
INSERT INTO `option` VALUES (15058, '伊宁市', '伊宁市', 10, 15056, 19);
INSERT INTO `option` VALUES (15059, '特克斯县', '特克斯县', 15, 15056, 19);
INSERT INTO `option` VALUES (15060, '尼勒克县', '尼勒克县', 20, 15056, 19);
INSERT INTO `option` VALUES (15061, '昭苏县', '昭苏县', 25, 15056, 19);
INSERT INTO `option` VALUES (15062, '新源县', '新源县', 30, 15056, 19);
INSERT INTO `option` VALUES (15063, '霍城县', '霍城县', 35, 15056, 19);
INSERT INTO `option` VALUES (15064, '察布查尔县', '察布查尔县', 40, 15056, 19);
INSERT INTO `option` VALUES (15065, '巩留县', '巩留县', 45, 15056, 19);
INSERT INTO `option` VALUES (15066, '奎屯市', '奎屯市', 50, 15056, 19);
INSERT INTO `option` VALUES (15067, '塔城地区', '塔城地区', 70, 14971, 19);
INSERT INTO `option` VALUES (15068, '塔城市', '塔城市', 5, 15067, 19);
INSERT INTO `option` VALUES (15069, '乌苏市', '乌苏市', 10, 15067, 19);
INSERT INTO `option` VALUES (15070, '额敏县', '额敏县', 15, 15067, 19);
INSERT INTO `option` VALUES (15071, '裕民县', '裕民县', 20, 15067, 19);
INSERT INTO `option` VALUES (15072, '沙湾县', '沙湾县', 25, 15067, 19);
INSERT INTO `option` VALUES (15073, '托里县', '托里县', 30, 15067, 19);
INSERT INTO `option` VALUES (15074, '和布克赛尔县', '和布克赛尔县', 35, 15067, 19);
INSERT INTO `option` VALUES (15075, '阿勒泰地区', '阿勒泰地区', 75, 14971, 19);
INSERT INTO `option` VALUES (15076, '北屯市', '北屯市', 5, 15075, 19);
INSERT INTO `option` VALUES (15077, '阿勒泰市', '阿勒泰市', 10, 15075, 19);
INSERT INTO `option` VALUES (15078, '富蕴县', '富蕴县', 15, 15075, 19);
INSERT INTO `option` VALUES (15079, '青河县', '青河县', 20, 15075, 19);
INSERT INTO `option` VALUES (15080, '吉木乃县', '吉木乃县', 25, 15075, 19);
INSERT INTO `option` VALUES (15081, '布尔津县', '布尔津县', 30, 15075, 19);
INSERT INTO `option` VALUES (15082, '福海县', '福海县', 35, 15075, 19);
INSERT INTO `option` VALUES (15083, '哈巴河县', '哈巴河县', 40, 15075, 19);
INSERT INTO `option` VALUES (15084, '五家渠市', '五家渠市', 80, 14971, 19);
INSERT INTO `option` VALUES (15085, '五家渠市', '五家渠市', 5, 15084, 19);
INSERT INTO `option` VALUES (15086, '阿拉尔市', '阿拉尔市', 85, 14971, 19);
INSERT INTO `option` VALUES (15087, '阿拉尔市', '阿拉尔市', 5, 15086, 19);
INSERT INTO `option` VALUES (15088, '图木舒克市', '图木舒克市', 90, 14971, 19);
INSERT INTO `option` VALUES (15089, '图木舒克市', '图木舒克市', 5, 15088, 19);
INSERT INTO `option` VALUES (15090, '台湾省', '台湾省', 160, 0, 19);
INSERT INTO `option` VALUES (15091, '台北', '台北', 5, 15090, 19);
INSERT INTO `option` VALUES (15092, '台北县', '台北县', 5, 15091, 19);
INSERT INTO `option` VALUES (15093, '台北市', '台北市', 10, 15091, 19);
INSERT INTO `option` VALUES (15094, '高雄', '高雄', 10, 15090, 19);
INSERT INTO `option` VALUES (15095, '市区', '市区', 5, 15094, 19);
INSERT INTO `option` VALUES (15096, '东港', '东港', 10, 15094, 19);
INSERT INTO `option` VALUES (15097, '大武', '大武', 15, 15094, 19);
INSERT INTO `option` VALUES (15098, '恒春', '恒春', 20, 15094, 19);
INSERT INTO `option` VALUES (15099, '兰屿', '兰屿', 25, 15094, 19);
INSERT INTO `option` VALUES (15100, '台南', '台南', 15, 15090, 19);
INSERT INTO `option` VALUES (15101, '台中', '台中', 20, 15090, 19);
INSERT INTO `option` VALUES (15102, '桃园', '桃园', 25, 15090, 19);
INSERT INTO `option` VALUES (15103, '新竹', '新竹', 30, 15090, 19);
INSERT INTO `option` VALUES (15104, '新竹县', '新竹县', 5, 15103, 19);
INSERT INTO `option` VALUES (15105, '新竹市', '新竹市', 10, 15103, 19);
INSERT INTO `option` VALUES (15106, '公馆', '公馆', 15, 15103, 19);
INSERT INTO `option` VALUES (15107, '宜兰', '宜兰', 35, 15090, 19);
INSERT INTO `option` VALUES (15108, '澎湖', '澎湖', 40, 15090, 19);
INSERT INTO `option` VALUES (15109, '马公', '马公', 5, 15108, 19);
INSERT INTO `option` VALUES (15110, '东吉屿', '东吉屿', 10, 15108, 19);
INSERT INTO `option` VALUES (15111, '嘉义', '嘉义', 45, 15090, 19);
INSERT INTO `option` VALUES (15112, '嘉义', '嘉义', 5, 15111, 19);
INSERT INTO `option` VALUES (15113, '阿里山', '阿里山', 10, 15111, 19);
INSERT INTO `option` VALUES (15114, '玉山', '玉山', 15, 15111, 19);
INSERT INTO `option` VALUES (15115, '新港', '新港', 20, 15111, 19);
INSERT INTO `option` VALUES (15116, '花莲', '花莲', 50, 15090, 19);
INSERT INTO `option` VALUES (15117, '台东', '台东', 55, 15090, 19);
INSERT INTO `option` VALUES (15118, '基隆', '基隆', 60, 15090, 19);
INSERT INTO `option` VALUES (15119, '彭佳屿', '彭佳屿', 5, 15118, 19);
INSERT INTO `option` VALUES (15120, '香港特别行政区', '香港特别行政区', 165, 0, 19);
INSERT INTO `option` VALUES (15121, '市区', '市区', 5, 15120, 19);
INSERT INTO `option` VALUES (15122, '九龙', '九龙', 10, 15120, 19);
INSERT INTO `option` VALUES (15123, '新界', '新界', 15, 15120, 19);
INSERT INTO `option` VALUES (15124, '中环', '中环', 20, 15120, 19);
INSERT INTO `option` VALUES (15125, '铜锣湾', '铜锣湾', 25, 15120, 19);
INSERT INTO `option` VALUES (15126, '澳门特别行政区', '澳门特别行政区', 170, 0, 19);
INSERT INTO `option` VALUES (15127, '市区内', '市区内', 5, 15126, 19);
INSERT INTO `option` VALUES (15128, '女', '2', 20, 0, 1);
INSERT INTO `option` VALUES (15129, '一分钟', '60', 5, 0, 13);
INSERT INTO `option` VALUES (15130, '十分钟', '600', 30, 0, 13);
INSERT INTO `option` VALUES (15131, '三十分钟', '1800', 40, 0, 13);
INSERT INTO `option` VALUES (15132, 'QQ客服', 'qq', 10, 0, 20);
INSERT INTO `option` VALUES (15133, '微信客服', 'weixin', 20, 0, 20);

-- ----------------------------
-- Table structure for option_group
-- ----------------------------
DROP TABLE IF EXISTS `option_group`;
CREATE TABLE `option_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称，用于后台管理',
  `linkSymbol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '连接字符，未设置使用英文竖线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option_group
-- ----------------------------
INSERT INTO `option_group` VALUES (1, '性别', '');
INSERT INTO `option_group` VALUES (4, '是与否', '');
INSERT INTO `option_group` VALUES (6, '窗口打开方式', '');
INSERT INTO `option_group` VALUES (7, '注册', '');
INSERT INTO `option_group` VALUES (8, '邮件编码', '');
INSERT INTO `option_group` VALUES (12, '置顶属性', '');
INSERT INTO `option_group` VALUES (13, '等候时间', '');
INSERT INTO `option_group` VALUES (14, '微信菜单类型', '');
INSERT INTO `option_group` VALUES (19, '中国省市县信息', '|');
INSERT INTO `option_group` VALUES (20, '客服类型', '');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatorId` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `points` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_9e91e6a24261b66f53971d3f96b`(`creatorId`) USING BTREE,
  CONSTRAINT `FK_9e91e6a24261b66f53971d3f96b` FOREIGN KEY (`creatorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (160, 1, '助力企业复工-助力学校开学', '<p>正文内容正文内容正文内容正文内容 正文内容正文内容正文内容正文内容 正文内容正文内容正文内容正文内容 正文内容正文内容正文内容正文内容 正文内容正文内容............</p>', '2021-05-04 05:31:33.430000', '2021-05-08 01:56:25.000000', 0);
INSERT INTO `post` VALUES (161, 1, '助力企业复工-助力学校开学', '<p>正文内容正文内容正文内容正文内容 正文内容正文内容正文内容正文内容 正文内容正文内容正文内容正文内容 正文内容正文内容正文内容正文内容 正文内容正文内容............</p>', '2021-05-08 02:07:52.196000', '2021-05-08 02:09:00.000000', 0);
INSERT INTO `post` VALUES (162, 1, 'te\'s', '<p>te<img src=\"/upload/images/lhztKBO4DVXk.png\" width=\"1920\" height=\"800\" /></p>', '2021-05-17 19:59:01.558000', '2021-05-17 20:39:09.000000', 0);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID，也是应用ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `moduleId` int(11) NULL DEFAULT NULL COMMENT '指定模型ID，为0表页面空白',
  `categoryId` int(11) NOT NULL DEFAULT 0 COMMENT '绑定根分类ID',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `aliasTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '后台别称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序，值越小越往前靠',
  `listFields` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表读取长度，如为空读全部',
  `tplIndex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面页',
  `tplList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页',
  `tplContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细页',
  `postTpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布页模板',
  `ico` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `isIdentifier` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否自定义标识',
  `themeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题别名',
  `themeNote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题备注',
  `psize` int(11) NOT NULL DEFAULT 10 COMMENT '0表示不限制，每页显示数量',
  `userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员维护',
  `isSeo` int(11) NOT NULL DEFAULT 0 COMMENT '是否使用seo,类型 0不使用 1启用非必填默认隐藏，2启用非必填默认显示，3启用必填',
  `subTopics` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否启用子主题功能',
  `isSearch` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持搜索',
  `isTag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '必填Tag',
  `isBiz` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0不启用电商，1启用电商',
  `isUserid` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否绑定会员',
  `isTplContent` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否自定义内容模板',
  `currencyId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认货币ID',
  `adminNote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员备注，给编辑人员使用的',
  `hidden` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0显示1隐藏',
  `postStatus` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发布模式，0不启用1启用',
  `commentStatus` tinyint(4) NOT NULL DEFAULT 0 COMMENT '启用评论功能',
  `etplAdmin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '通知管理员邮件模板',
  `etplUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布邮件通知会员模板',
  `etplComment_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论邮件通知管理员模板',
  `etplComment_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论邮件通知会员',
  `isAttr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '1启用主题属性0不启用',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自身Tag设置',
  `cateMultiple` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '0分类单选1分类支持多选',
  `bizAttr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品属性，0不使用1使用',
  `freight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运费模板ID',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站ID',
  `isApi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '0接口不可访问，1可访问',
  `psizeApi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'API接口读取的数量',
  `limitTimes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布时间间隔限制，0表示不限制',
  `limitSimilar` int(11) NOT NULL DEFAULT 0 COMMENT '相似度值限制，0表示不限制',
  `isStock` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1启用库存，0禁用库存',
  `worldLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品全球价格设置',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0不使用1使用',
  `isFront` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否直接访问前台',
  `orderBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_5ec112135d6b9f2f6661f5da2f`(`identifier`) USING BTREE,
  INDEX `FK_954c22430f34ced5fcb0eec8ae4`(`moduleId`) USING BTREE,
  CONSTRAINT `FK_954c22430f34ced5fcb0eec8ae4` FOREIGN KEY (`moduleId`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (64, '产品中心', 'product', '', '', '', 46, 49, '', '', 10, 'note,thumb,application', '', '', '', '', '', 1, '', '', 10, '0', 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 1, 0, '');
INSERT INTO `project` VALUES (65, '新闻中心', 'news', '', '', '', 47, 47, '', '', 0, 'hits,publishTime,sort,subTitle,note,thumb,content', '', '', '', '', '', 1, '', '', 10, '0', 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 1, 0, 'publishTime DESC');
INSERT INTO `project` VALUES (66, '加入我们', 'joinus', '', '', '', 51, 0, '', '', 50, 'area,duty,qualifications,contact', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 1, 0, '');
INSERT INTO `project` VALUES (67, '商务合作', 'message', '', '', '', 50, 0, '', '', 40, 'publishTime,username,email,tel,note', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 1, 1, 'publishTime DESC');
INSERT INTO `project` VALUES (69, '平台应用', 'application', '', '', '', 53, 0, '', '', 255, 'thumb', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 0, 0, '');
INSERT INTO `project` VALUES (70, '落地能力', 'ability', '', '', '', 55, 0, '', '', 255, '', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 0, 0, '');
INSERT INTO `project` VALUES (71, '经典案例', 'classicCase', '', '', '', 54, 0, '', '', 255, 'subTitle,thumb,note', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 0, 0, '');
INSERT INTO `project` VALUES (72, '解决方案', 'solution', '', '', '', 52, 55, '', '', 30, 'thumb,note', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 1, 0, '');
INSERT INTO `project` VALUES (73, '联系我们', 'contact', '', '', '', 56, 0, '', '', 60, '', '', '', '', '', '', 1, '', '', 10, '0', 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 1, 0, '');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `creatorId` int(11) NOT NULL,
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '3', NULL, 0, NULL, 1, 'image/jpeg', 'UGLEWaQn6iLL.jpg', '.jpg', '/upload/images/UGLEWaQn6iLL.jpg');
INSERT INTO `resource` VALUES (2, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'JdDO7l6KJzHp.png', '.png', '/upload/images/JdDO7l6KJzHp.png');
INSERT INTO `resource` VALUES (3, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'lhztKBO4DVXk.png', '.png', '/upload/images/lhztKBO4DVXk.png');
INSERT INTO `resource` VALUES (4, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'BOjt25vHLUNY.png', '.png', '/upload/images/BOjt25vHLUNY.png');
INSERT INTO `resource` VALUES (5, '5f8161f7c188b', NULL, 0, NULL, 1, 'image/jpeg', 'KYn6mFsD2Ms4.jpg', '.jpg', '/upload/images/KYn6mFsD2Ms4.jpg');
INSERT INTO `resource` VALUES (6, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', '5EbPFBKpea9u.png', '.png', '/upload/images/5EbPFBKpea9u.png');
INSERT INTO `resource` VALUES (7, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', '6VHRyEc8ZAgl.png', '.png', '/upload/images/6VHRyEc8ZAgl.png');
INSERT INTO `resource` VALUES (8, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'Y6RhIB8KR10k.png', '.png', '/upload/images/Y6RhIB8KR10k.png');
INSERT INTO `resource` VALUES (9, 'logo_hover.2bd68a45', NULL, 0, NULL, 1, 'image/png', '2T1AKLFRizsp.png', '.png', '/upload/images/2T1AKLFRizsp.png');
INSERT INTO `resource` VALUES (10, '5f8161f7c188b', NULL, 0, NULL, 1, 'image/jpeg', 'zuXAwMG6TBUX.jpg', '.jpg', '/upload/images/zuXAwMG6TBUX.jpg');
INSERT INTO `resource` VALUES (11, 'logo_hover.2bd68a45', NULL, 0, NULL, 1, 'image/png', 'dFEvVxhpLysk.png', '.png', '/upload/images/dFEvVxhpLysk.png');
INSERT INTO `resource` VALUES (12, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'x0xFKXEsLoFO.png', '.png', '/upload/images/x0xFKXEsLoFO.png');
INSERT INTO `resource` VALUES (13, 'logo_hover.2bd68a45', NULL, 0, NULL, 1, 'image/png', 'IdUpDYOVfG7m.png', '.png', '/upload/images/IdUpDYOVfG7m.png');
INSERT INTO `resource` VALUES (14, '5f8161f7c188b', NULL, 0, NULL, 1, 'image/jpeg', 'sELVIZbMyxyr.jpg', '.jpg', '/upload/images/sELVIZbMyxyr.jpg');
INSERT INTO `resource` VALUES (15, '5f8161f7c188b', NULL, 0, NULL, 1, 'image/jpeg', '27LplbdzK5Y0.jpg', '.jpg', '/upload/images/27LplbdzK5Y0.jpg');
INSERT INTO `resource` VALUES (16, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'z0rOvxzouggn.png', '.png', '/upload/images/z0rOvxzouggn.png');
INSERT INTO `resource` VALUES (17, '校园魔力 6.0.0 [牧羊] 2019-10-12 20-38-07', NULL, 0, NULL, 1, 'video/mp4', 'niyTpK0EayT6.mp4', '.mp4', '/upload/images/niyTpK0EayT6.mp4');
INSERT INTO `resource` VALUES (18, '校园魔力 6.0.0 [牧羊] 2019-10-12 20-38-07', NULL, 0, NULL, 1, 'video/mp4', 'MH905hi8deTi.mp4', '.mp4', '/upload/images/MH905hi8deTi.mp4');
INSERT INTO `resource` VALUES (19, '校园魔力 6.0.0 [牧羊] 2019-10-12 20-38-07', NULL, 0, NULL, 1, 'video/mp4', 'vvs59GtfecwX.mp4', '.mp4', '/upload/images/vvs59GtfecwX.mp4');
INSERT INTO `resource` VALUES (20, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'Eq8IljDzrOKl.png', '.png', '/upload/images/Eq8IljDzrOKl.png');
INSERT INTO `resource` VALUES (21, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'brDBiMHhB1TU.png', '.png', '/upload/images/brDBiMHhB1TU.png');
INSERT INTO `resource` VALUES (22, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'H1a4EIQq2NST.png', '.png', '/upload/images/H1a4EIQq2NST.png');
INSERT INTO `resource` VALUES (23, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'FQZQosDrnpLe.png', '.png', '/upload/images/FQZQosDrnpLe.png');
INSERT INTO `resource` VALUES (24, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'rDuhz5FtClJd.png', '.png', '/upload/images/rDuhz5FtClJd.png');
INSERT INTO `resource` VALUES (25, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', '9JNgo9S7RZgn.png', '.png', '/upload/images/9JNgo9S7RZgn.png');
INSERT INTO `resource` VALUES (26, '校园魔力 6.0.0 [牧羊] 2019-10-12 20-38-07', NULL, 0, NULL, 1, 'video/mp4', '4OXyZQL3EeSy.mp4', '.mp4', '/upload/images/4OXyZQL3EeSy.mp4');
INSERT INTO `resource` VALUES (27, '5f8161f7c188b', NULL, 0, NULL, 1, 'image/jpeg', '75BWlPGw9DCl.jpg', '.jpg', '/upload/images/75BWlPGw9DCl.jpg');
INSERT INTO `resource` VALUES (28, '校园魔力 6.0.0 [牧羊] 2019-10-12 20-38-07', NULL, 0, NULL, 1, 'video/mp4', 'nVdhLEyhF2Yz.mp4', '.mp4', '/upload/images/nVdhLEyhF2Yz.mp4');
INSERT INTO `resource` VALUES (29, '5f8eabafd7c04', NULL, 0, NULL, 1, 'image/png', 'cWehH7wc7ziY.png', '.png', '/upload/images/cWehH7wc7ziY.png');
INSERT INTO `resource` VALUES (30, '5f8161f7c188b', NULL, 0, NULL, 1, 'image/jpeg', 'l2KhRl8QmYa0.jpg', '.jpg', '/upload/images/l2KhRl8QmYa0.jpg');
INSERT INTO `resource` VALUES (31, 'logo-footer', NULL, 0, NULL, 1, 'image/png', 'f7WCwxbbTJO5.png', '.png', '/upload/images/f7WCwxbbTJO5.png');
INSERT INTO `resource` VALUES (32, 'logo-footer', NULL, 0, NULL, 1, 'image/png', 'dgu5acjTm9jR.png', '.png', '/upload/images/dgu5acjTm9jR.png');
INSERT INTO `resource` VALUES (33, 'logo-footer', NULL, 0, NULL, 1, 'image/png', 'WB7q4mfVAlom.png', '.png', '/upload/images/WB7q4mfVAlom.png');
INSERT INTO `resource` VALUES (34, 'logo-footer', NULL, 0, NULL, 1, 'image/png', 'CtR22etLVQsI.png', '.png', '/upload/images/CtR22etLVQsI.png');
INSERT INTO `resource` VALUES (35, 'logo-footer', NULL, 0, NULL, 1, 'image/png', '6bEBNLphjl9N.png', '.png', '/upload/images/6bEBNLphjl9N.png');
INSERT INTO `resource` VALUES (36, 'logo-footer', NULL, 0, NULL, 1, 'image/png', 'FanDOa1fYoUw.png', '.png', '/upload/images/FanDOa1fYoUw.png');
INSERT INTO `resource` VALUES (37, 'logo-footer', NULL, 0, NULL, 1, 'image/png', 'YTqPIzMoOwBK.png', '.png', '/upload/images/YTqPIzMoOwBK.png');
INSERT INTO `resource` VALUES (38, 'logo-footer', NULL, 0, NULL, 1, 'image/png', '8x0DqmilfAvX.png', '.png', '/upload/images/8x0DqmilfAvX.png');
INSERT INTO `resource` VALUES (39, '校园魔力 6.0.0 [牧羊] 2019-10-12 20-38-07', NULL, 0, NULL, 1, 'video/mp4', 'BdKw1Abgafjb.mp4', '.mp4', '/upload/images/BdKw1Abgafjb.mp4');
INSERT INTO `resource` VALUES (40, '架构图', NULL, 0, NULL, 1, 'image/png', 'rZCPemyzlCYR.png', '.png', '/upload/images/rZCPemyzlCYR.png');
INSERT INTO `resource` VALUES (41, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'TjTFlmAZJSsK.png', '.png', '/upload/images/TjTFlmAZJSsK.png');
INSERT INTO `resource` VALUES (42, '解决方案', NULL, 0, NULL, 1, 'image/jpeg', 'QrtDzrHllmMu.jpg', '.jpg', '/upload/images/QrtDzrHllmMu.jpg');
INSERT INTO `resource` VALUES (43, '解决方案', NULL, 0, NULL, 1, 'image/jpeg', 'e9FD8AjmuZg2.jpg', '.jpg', '/upload/images/e9FD8AjmuZg2.jpg');
INSERT INTO `resource` VALUES (44, '架构图', NULL, 0, NULL, 1, 'image/png', 'CLRcq2hanIFh.png', '.png', '/upload/images/CLRcq2hanIFh.png');
INSERT INTO `resource` VALUES (45, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'ETm7sV1CzHHW.png', '.png', '/upload/images/ETm7sV1CzHHW.png');
INSERT INTO `resource` VALUES (46, '架构图', NULL, 0, NULL, 1, 'image/png', '9tp5gACWA1hd.png', '.png', '/upload/images/9tp5gACWA1hd.png');
INSERT INTO `resource` VALUES (47, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'vKVxRIdpA83E.png', '.png', '/upload/images/vKVxRIdpA83E.png');
INSERT INTO `resource` VALUES (48, '微信图片_20210521104433', NULL, 0, NULL, 1, 'image/png', 'DSymtkTUt5ja.png', '.png', '/upload/images/DSymtkTUt5ja.png');
INSERT INTO `resource` VALUES (49, '微信图片_20210521104433', NULL, 0, NULL, 1, 'image/png', 'frePIdJIJ04g.png', '.png', '/upload/images/frePIdJIJ04g.png');
INSERT INTO `resource` VALUES (50, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'iuuIdpqNvz7B.png', '.png', '/upload/images/iuuIdpqNvz7B.png');
INSERT INTO `resource` VALUES (51, '架构图', NULL, 0, NULL, 1, 'image/png', 'CvPMSHfjcBvR.png', '.png', '/upload/images/CvPMSHfjcBvR.png');
INSERT INTO `resource` VALUES (52, '解决方案', NULL, 0, NULL, 1, 'image/jpeg', 'AdNCbweEeqPj.jpg', '.jpg', '/upload/images/AdNCbweEeqPj.jpg');
INSERT INTO `resource` VALUES (53, '架构图', NULL, 0, NULL, 1, 'image/png', 'dqcSK9d90eDm.png', '.png', '/upload/images/dqcSK9d90eDm.png');
INSERT INTO `resource` VALUES (54, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'lRk6lLe5TaGW.png', '.png', '/upload/images/lRk6lLe5TaGW.png');
INSERT INTO `resource` VALUES (55, '架构图', NULL, 0, NULL, 1, 'image/png', 'bGekMw2q02GD.png', '.png', '/upload/images/bGekMw2q02GD.png');
INSERT INTO `resource` VALUES (56, '微信图片_20210521104433', NULL, 0, NULL, 1, 'image/png', 'jmcKED7GJpwT.png', '.png', '/upload/images/jmcKED7GJpwT.png');
INSERT INTO `resource` VALUES (57, '微信图片_20210521104433', NULL, 0, NULL, 1, 'image/png', '1RqNUAMTnSmR.png', '.png', '/upload/images/1RqNUAMTnSmR.png');
INSERT INTO `resource` VALUES (58, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'xxOQBWPoCc7e.png', '.png', '/upload/images/xxOQBWPoCc7e.png');
INSERT INTO `resource` VALUES (59, '最新架构图', NULL, 0, NULL, 1, 'image/png', '5wz9HA008bWp.png', '.png', '/upload/images/5wz9HA008bWp.png');
INSERT INTO `resource` VALUES (60, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'wcZAEfXrZeEf.png', '.png', '/upload/images/wcZAEfXrZeEf.png');
INSERT INTO `resource` VALUES (61, '最新架构图', NULL, 0, NULL, 1, 'image/png', 'irx8r1PzPfNF.png', '.png', '/upload/images/irx8r1PzPfNF.png');
INSERT INTO `resource` VALUES (62, '1', NULL, 0, NULL, 1, 'image/jpeg', 'DPNLgKCuwvHh.jpg', '.jpg', '/upload/images/DPNLgKCuwvHh.jpg');
INSERT INTO `resource` VALUES (63, '1', NULL, 0, NULL, 1, 'image/jpeg', 'c46muq86wAYU.jpg', '.jpg', '/upload/images/c46muq86wAYU.jpg');
INSERT INTO `resource` VALUES (64, '2', NULL, 0, NULL, 1, 'image/jpeg', 'JjUTkUvenYox.jpg', '.jpg', '/upload/images/JjUTkUvenYox.jpg');
INSERT INTO `resource` VALUES (65, '5', NULL, 0, NULL, 1, 'image/jpeg', 'kFdyWaB5EdJC.jpg', '.jpg', '/upload/images/kFdyWaB5EdJC.jpg');
INSERT INTO `resource` VALUES (66, 'QQ截图20210608163244', NULL, 0, NULL, 1, 'image/png', 'TArVMGkqPgTS.png', '.png', '/upload/images/TArVMGkqPgTS.png');
INSERT INTO `resource` VALUES (67, 'QQ截图20210608163326', NULL, 0, NULL, 1, 'image/png', 'e5IwhT5dBe3J.png', '.png', '/upload/images/e5IwhT5dBe3J.png');
INSERT INTO `resource` VALUES (68, 'QQ截图20210608163410', NULL, 0, NULL, 1, 'image/png', 'hioKztvAzYd5.png', '.png', '/upload/images/hioKztvAzYd5.png');
INSERT INTO `resource` VALUES (69, 'QQ截图20210608163448', NULL, 0, NULL, 1, 'image/png', 'ZEIxAd3Mf9RS.png', '.png', '/upload/images/ZEIxAd3Mf9RS.png');
INSERT INTO `resource` VALUES (70, 'QQ截图20210608163517', NULL, 0, NULL, 1, 'image/png', '1qVo6a8gNZKI.png', '.png', '/upload/images/1qVo6a8gNZKI.png');
INSERT INTO `resource` VALUES (71, 'QQ截图20210608163549', NULL, 0, NULL, 1, 'image/png', 'pj2ZLpLMikIU.png', '.png', '/upload/images/pj2ZLpLMikIU.png');
INSERT INTO `resource` VALUES (72, 'QQ截图20210608163816', NULL, 0, NULL, 1, 'image/png', 'vURA7SQZRFnh.png', '.png', '/upload/images/vURA7SQZRFnh.png');
INSERT INTO `resource` VALUES (73, 'QQ截图20210608163854', NULL, 0, NULL, 1, 'image/png', 'f4u565ZUiabb.png', '.png', '/upload/images/f4u565ZUiabb.png');
INSERT INTO `resource` VALUES (74, 'QQ截图20210608163936', NULL, 0, NULL, 1, 'image/png', '8G8eLa1FYEBS.png', '.png', '/upload/images/8G8eLa1FYEBS.png');
INSERT INTO `resource` VALUES (75, 'QQ截图20210608164021', NULL, 0, NULL, 1, 'image/png', 'jue5M7ktaBq8.png', '.png', '/upload/images/jue5M7ktaBq8.png');
INSERT INTO `resource` VALUES (76, '图标', NULL, 0, NULL, 1, 'image/png', '8RYn5oVuYlC2.png', '.png', '/upload/images/8RYn5oVuYlC2.png');
INSERT INTO `resource` VALUES (77, '矢量智能对象', NULL, 0, NULL, 1, 'image/png', 'rxaEzM6gMy58.png', '.png', '/upload/images/rxaEzM6gMy58.png');
INSERT INTO `resource` VALUES (78, '矢量智能对象', NULL, 0, NULL, 1, 'image/png', 'FotrfaxauWDn.png', '.png', '/upload/images/FotrfaxauWDn.png');
INSERT INTO `resource` VALUES (79, '矢量智能对象', NULL, 0, NULL, 1, 'image/png', 'PqC7RmCEAzN4.png', '.png', '/upload/images/PqC7RmCEAzN4.png');
INSERT INTO `resource` VALUES (80, '矢量智能对象', NULL, 0, NULL, 1, 'image/png', 'ukOEASVZTIlA.png', '.png', '/upload/images/ukOEASVZTIlA.png');
INSERT INTO `resource` VALUES (81, '图标', NULL, 0, NULL, 1, 'image/png', 'vJM2A0jz7i2n.png', '.png', '/upload/images/vJM2A0jz7i2n.png');
INSERT INTO `resource` VALUES (82, '矢量智能对象2', NULL, 0, NULL, 1, 'image/png', 'TnB6b0a0Gc1p.png', '.png', '/upload/images/TnB6b0a0Gc1p.png');
INSERT INTO `resource` VALUES (83, '1', NULL, 0, NULL, 1, 'image/jpeg', 'kNi0GBbHE5vK.jpg', '.jpg', '/upload/images/kNi0GBbHE5vK.jpg');
INSERT INTO `resource` VALUES (84, '2', NULL, 0, NULL, 1, 'image/jpeg', 'eo6kf7UNQ2HS.jpg', '.jpg', '/upload/images/eo6kf7UNQ2HS.jpg');
INSERT INTO `resource` VALUES (85, '3', NULL, 0, NULL, 1, 'image/jpeg', 'N1G9ZOa40EXO.jpg', '.jpg', '/upload/images/N1G9ZOa40EXO.jpg');
INSERT INTO `resource` VALUES (86, '未标题-1', NULL, 0, NULL, 1, 'image/jpeg', 'TEspTgY3KjRs.jpg', '.jpg', '/upload/images/TEspTgY3KjRs.jpg');
INSERT INTO `resource` VALUES (87, '未标题-1', NULL, 0, NULL, 1, 'image/jpeg', 'TAoHMiqtvxwz.jpg', '.jpg', '/upload/images/TAoHMiqtvxwz.jpg');
INSERT INTO `resource` VALUES (88, '3', NULL, 0, NULL, 1, 'image/jpeg', 'SbOIkhwnbDn6.jpg', '.jpg', '/upload/images/SbOIkhwnbDn6.jpg');
INSERT INTO `resource` VALUES (89, '图层 19', NULL, 0, NULL, 1, 'image/png', 'ks8BAKBjWJ33.png', '.png', '/upload/images/ks8BAKBjWJ33.png');
INSERT INTO `resource` VALUES (90, '图层 18', NULL, 0, NULL, 1, 'image/png', 'nBB6NCJHkgQE.png', '.png', '/upload/images/nBB6NCJHkgQE.png');
INSERT INTO `resource` VALUES (91, '矩形 17', NULL, 0, NULL, 1, 'image/png', 'ZqXUQ3yfMKan.png', '.png', '/upload/images/ZqXUQ3yfMKan.png');
INSERT INTO `resource` VALUES (92, '矩形 17', NULL, 0, NULL, 1, 'image/png', '7UyQNa3kWnDq.png', '.png', '/upload/images/7UyQNa3kWnDq.png');
INSERT INTO `resource` VALUES (93, '图层 19', NULL, 0, NULL, 1, 'image/png', 'oZ1NvOtmuZvI.png', '.png', '/upload/images/oZ1NvOtmuZvI.png');
INSERT INTO `resource` VALUES (94, '矩形 17 拷贝 3', NULL, 0, NULL, 1, 'image/png', 'wH708qqz9A9B.png', '.png', '/upload/images/wH708qqz9A9B.png');
INSERT INTO `resource` VALUES (95, '矩形 17 拷贝 2', NULL, 0, NULL, 1, 'image/png', 'cV8Boqr5oeW1.png', '.png', '/upload/images/cV8Boqr5oeW1.png');
INSERT INTO `resource` VALUES (96, '1548900804', NULL, 0, NULL, 1, 'image/jpeg', 'exBWXbTdWZGF.JPG', '.JPG', '/upload/images/exBWXbTdWZGF.JPG');
INSERT INTO `resource` VALUES (97, '1619337030', NULL, 0, NULL, 1, 'image/png', 'lRf6CFlo8JGI.png', '.png', '/upload/images/lRf6CFlo8JGI.png');
INSERT INTO `resource` VALUES (98, '1582962291', NULL, 0, NULL, 1, 'image/png', '5rU4vpEMYzE2.png', '.png', '/upload/images/5rU4vpEMYzE2.png');
INSERT INTO `resource` VALUES (99, '061758dwykoho118hpkkhl.png.icon', NULL, 0, NULL, 1, 'image/x-icon', 'xqMWUTESHsfh.ico', '.ico', '/upload/images/xqMWUTESHsfh.ico');
INSERT INTO `resource` VALUES (100, '屏幕截图 2021-06-15 105327', NULL, 0, NULL, 1, 'image/png', 'kOg589joK3QW.png', '.png', '/upload/images/kOg589joK3QW.png');

-- ----------------------------
-- Table structure for seo
-- ----------------------------
DROP TABLE IF EXISTS `seo`;
CREATE TABLE `seo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seo
-- ----------------------------

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID，也是应用ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '网站状态',
  `closeReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关闭原因',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站logo',
  `seoTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seoDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `copyright` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `isDefault` tinyint(4) NOT NULL DEFAULT 0 COMMENT '默认站点',
  `shortcut` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站图标',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_7258bf76a53f8fec60d9926685`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site
-- ----------------------------
INSERT INTO `site` VALUES (1, '康索特', 'cst', 1, '', '/upload/images/6bEBNLphjl9N.png', '康索特官网', '康索特|aiot|端云协同|人工智能|物联网', '康索特成立于2006年10月，作为业内领先的AIoT产品和解决方案提供商，端云协同应用能力是康索特的核心优势，也是人工智能和物联网产生价值的关键。\n我们专注于通用园区和城市治理领域，连接数据、算法及应用，为客户提供领先的AIoT软硬件产品和智能化应用解决方案.', '<p>Powered By cst.com 版权所有 &copy; 2004-2020, All right reserved.</p>', '2021-06-02 01:40:13.092000', '2021-06-17 12:26:31.000000', 0, '', 1, '/upload/images/xqMWUTESHsfh.ico');
INSERT INTO `site` VALUES (5, '康索特2', 'cst2', 1, '', '', '', '', '', NULL, '2021-06-02 02:06:41.857000', '2021-06-02 02:06:41.857000', 0, '', 0, '');

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system
-- ----------------------------

-- ----------------------------
-- Table structure for updoot
-- ----------------------------
DROP TABLE IF EXISTS `updoot`;
CREATE TABLE `updoot`  (
  `value` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `postId`) USING BTREE,
  INDEX `FK_fd6b77bfdf9eae6691170bc9cb5`(`postId`) USING BTREE,
  CONSTRAINT `FK_9df9e319a273ad45ce509cf2f68` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fd6b77bfdf9eae6691170bc9cb5` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of updoot
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_78a916df40e02a9deb1c4b75ed`(`username`) USING BTREE,
  UNIQUE INDEX `IDX_e12875dfb3b1d92d7d7c5377e2`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'kacoro@qq.com', '$argon2i$v=19$m=4096,t=3,p=1$PqMcRqFh4SHNrGQswViFaw$MkvtEkmK7VjcJBeivNGoSln3c0gPvdElH3dMxDbJeD4', '2021-01-05 21:26:55.357000', '2021-06-20 07:09:10.000000');
INSERT INTO `user` VALUES (2, 'admin2', 'kacor2o@qq.com', '$argon2i$v=19$m=4096,t=3,p=1$7+1uM3G20jJw/lLxARhwWw$Ew5Vzsv5FWoUv+8af6QGjzgYJSQA0/sUok9mQbhSFRc', '2021-01-05 21:26:55.357000', '2021-01-05 21:26:55.357000');
INSERT INTO `user` VALUES (3, 'test', 'test@qq.com', '$argon2i$v=19$m=4096,t=3,p=1$SUZ7Fe7XuvO6FqhogxZYHQ$nqLCa1eFZcZknp7p1m2s+lCOyYM5Pr5oBQXHJ5nFBx0', '2021-01-06 19:29:59.310000', '2021-01-06 19:29:59.310000');
INSERT INTO `user` VALUES (6, 'admin3', 'kacoro3@qq.com', '$argon2i$v=19$m=4096,t=3,p=1$vY7sDFoOc1EQy81Yvx+IYg$XQxOH2Ua/IGkBudBKLPAp3zIIWISo41aYBsQgNw2kBk', '2021-01-10 10:10:41.212000', '2021-01-10 10:10:41.212000');
INSERT INTO `user` VALUES (7, 'ddd', 'ddd@11', '$argon2i$v=19$m=4096,t=3,p=1$V/g/r2iaHAcq+YxfOykkqA$eW2dJ1j0ePJ5M2FJc3GAtF1H5ClBVbl3x8kzYQKn4gQ', '2021-01-10 10:11:15.758000', '2021-01-10 10:11:15.758000');

SET FOREIGN_KEY_CHECKS = 1;
