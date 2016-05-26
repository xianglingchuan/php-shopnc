-- fanwe SQL Dump Program
-- Apache/2.2.17 (Win32) PHP/5.3.3
-- 
-- DATE : 2015-08-13 15:59:45
-- MYSQL SERVER VERSION : 5.5.8-log
-- PHP VERSION : apache2handler
-- Vol : 1


DROP TABLE IF EXISTS `%DB_PREFIX%admin`;
CREATE TABLE `%DB_PREFIX%admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_name` varchar(255) NOT NULL COMMENT '管理员用户名',
  `adm_password` varchar(255) NOT NULL COMMENT '管理员密码',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性控制',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `role_id` int(11) NOT NULL COMMENT '角色ID(权限控制用)',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_adm_name` (`adm_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';
INSERT INTO `%DB_PREFIX%admin` VALUES ('1','admin','21232f297a57a5a743894a0e4a801fc3','1','0','4','1439423724','127.0.0.1');
DROP TABLE IF EXISTS `%DB_PREFIX%adv`;
CREATE TABLE `%DB_PREFIX%adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpl` varchar(255) NOT NULL COMMENT '前台使用模板名称',
  `adv_id` varchar(255) NOT NULL COMMENT '定义在模板文件里的广告位的ID名称，用于动态在模板上调用相应的广告位内容',
  `code` text NOT NULL COMMENT '用于前台展示显示的html广告内容',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性控制标识',
  `name` varchar(255) NOT NULL COMMENT '广告位名称，用于后台管理查询用',
  `city_ids` varchar(255) NOT NULL COMMENT '用于控制广告显示在哪些城市，填入城市ID,用半角逗号分隔',
  `rel_id` int(11) NOT NULL COMMENT '用于动态关联的广告定义，例如首页显示多个商品分类模块，每个分类模块下需要定义一个独立的广告，这种广告一般在商品分类，生活服务分类中单独设置，这里的rel_id指向相关的分类ID',
  `rel_table` varchar(255) NOT NULL COMMENT '同rel_id，这里填的是相关的表名，例如商城分类的推荐广告，这里填入shop_cate',
  PRIMARY KEY (`id`),
  KEY `tmpl` (`tmpl`),
  KEY `adv_id` (`adv_id`),
  KEY `city_ids` (`city_ids`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_table` (`rel_table`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='广告位表';
INSERT INTO `%DB_PREFIX%adv` VALUES ('51','fanwe','名店右侧广告','<img src=\"./public/attachment/201502/26/17/54eee2d489343.jpg\" alt=\"\" border=\"0\" />','1','首页名店右侧广告','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('50','fanwe','商城首页轮播广告2','<img src=\"./public/attachment/201502/25/11/54ed40ac7cb3a.png\" alt=\"\" border=\"0\" />','1','商城首页轮播广告2','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('46','fanwe','首页小轮播广告2','<img src=\"./public/attachment/201502/25/12/54ed559ba1dc1.jpg\" alt=\"\" border=\"0\" />','1','首页小轮播广告2','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('45','fanwe','首页小轮播广告1','<img src=\"./public/attachment/201502/25/12/54ed559176fa9.jpg\" alt=\"\" border=\"0\" />','1','首页小轮播广告1','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('44','fanwe','首页轮播广告2','<img src=\"./public/attachment/201502/25/11/54ed41c0e3216.png\" alt=\"\" border=\"0\" />','1','首页轮播广告2','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('49','fanwe','商城首页轮播广告1','<img src=\"./public/attachment/201502/25/11/54ed406379285.png\" alt=\"\" border=\"0\" />','1','商城首页轮播广告1','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('43','fanwe','首页轮播广告1','<img src=\"./public/attachment/201502/25/11/54ed41b6bfeec.png\" alt=\"\" border=\"0\" /><br />\r\n','1','首页轮播广告1','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('52','fanwe','优惠右侧广告','<img src=\"./public/attachment/201502/26/17/54eee2f10078a.jpg\" alt=\"\" border=\"0\" />','1','首页优惠右侧广告','','0','');
DROP TABLE IF EXISTS `%DB_PREFIX%api_log`;
CREATE TABLE `%DB_PREFIX%api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act` varchar(30) NOT NULL,
  `api` text NOT NULL,
  `param_json` text NOT NULL,
  `param_array` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='移动端的调试日志表';
DROP TABLE IF EXISTS `%DB_PREFIX%api_login`;
CREATE TABLE `%DB_PREFIX%api_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '第三方登录名称',
  `config` text NOT NULL COMMENT '序列化后的配置信息',
  `class_name` varchar(255) NOT NULL COMMENT '接口类名',
  `icon` varchar(255) NOT NULL COMMENT '登录用小图标显示',
  `is_weibo` tinyint(1) NOT NULL COMMENT '是否微博接口，该接口标识可以同步信息到第三方的微博平台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='第三方登录接口的安装表(新浪微博，QQ微博等)';
INSERT INTO `%DB_PREFIX%api_login` VALUES ('11','新浪微博api登录接口','a:3:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";s:7:\"app_url\";s:0:\"\";}','Sina','./public/attachment/201502/26/15/54eec93746fa2.gif','1');
INSERT INTO `%DB_PREFIX%api_login` VALUES ('12','QQv2登录插件','a:2:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";}','Qqv2','./public/attachment/201502/26/15/54eec928c2e12.gif','0');
INSERT INTO `%DB_PREFIX%api_login` VALUES ('13','腾讯微博登录插件','a:3:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";s:7:\"app_url\";s:0:\"\";}','Tencent','./public/attachment/201502/26/15/54eec93f862a1.gif','1');
DROP TABLE IF EXISTS `%DB_PREFIX%apns_device_history`;
CREATE TABLE `%DB_PREFIX%apns_device_history` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `archived` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `appname` (`appname`),
  KEY `appversion` (`appversion`),
  KEY `deviceuid` (`deviceuid`),
  KEY `archived` (`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='弃用';
DROP TABLE IF EXISTS `%DB_PREFIX%apns_devices`;
CREATE TABLE `%DB_PREFIX%apns_devices` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `appname` (`appname`,`appversion`,`deviceuid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ios推送设备列表';
DROP TABLE IF EXISTS `%DB_PREFIX%apns_logs`;
CREATE TABLE `%DB_PREFIX%apns_logs` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` varchar(64) NOT NULL COMMENT '客户ID(会员ID)可为0(未登录的手机端用户)',
  `fk_device` int(9) unsigned NOT NULL COMMENT '客户端信息',
  `message` varchar(255) NOT NULL COMMENT '内容',
  `delivery` datetime NOT NULL COMMENT '返回的发送时间',
  `status` enum('queued','delivered','failed') CHARACTER SET latin1 NOT NULL DEFAULT 'queued' COMMENT '是否已发送',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT '系统内生成的发送时间',
  `modified` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `message_id` int(11) NOT NULL COMMENT '消息ID',
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `fk_device` (`fk_device`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`),
  KEY `message` (`message`),
  KEY `delivery` (`delivery`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='APN推送日志表';
DROP TABLE IF EXISTS `%DB_PREFIX%apns_messages`;
CREATE TABLE `%DB_PREFIX%apns_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '群发内容',
  `send_time` int(11) NOT NULL COMMENT '预设发送时间',
  `user_names` text NOT NULL COMMENT '用户名(用于配匹设备号，逗号分开，如填写的用户未用ios设备登录过，无法发出，不填写为全部发送)',
  `status` tinyint(1) NOT NULL COMMENT '0:未发送 1:发送中 2:已发送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ANPS群发推送消息';
DROP TABLE IF EXISTS `%DB_PREFIX%area`;
CREATE TABLE `%DB_PREFIX%area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `city_id` int(11) NOT NULL COMMENT '所属的城市 ',
  `sort` int(11) NOT NULL COMMENT '排序，前台展示的排序，由大到小',
  `pid` int(11) NOT NULL COMMENT '有pid表示为一级地区（行政区），有值为商圈（二级地区）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='地区商圈表';
INSERT INTO `%DB_PREFIX%area` VALUES ('8','鼓楼区','15','1','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('9','晋安区','15','2','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('10','台江区','15','3','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('11','仓山区','15','4','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('12','马尾区','15','5','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('13','五一广场','15','6','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('14','东街口','15','7','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('15','福州广场','15','8','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('16','省体育中心','15','9','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('17','西禅寺','15','10','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('18','社会主义学院','15','11','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('19','西洪路','15','12','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('20','屏山','15','13','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('21','中亭街','15','14','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('22','六一中路','15','15','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('23','龙华大厦','15','16','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('24','时代名城','15','17','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('25','台江路','15','18','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('26','宝龙城市广场','15','19','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('27','万象城','15','20','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('28','桥亭','15','21','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('29','小桥头','15','22','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('30','交通路','15','23','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('31','中亭街','15','24','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('32','白马河','15','25','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('33','博美诗邦','15','26','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('34','观海路','15','27','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('35','三叉街新村','15','28','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('36','北京金山','15','29','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('37','仓山镇','15','30','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('38','螺洲','15','31','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('39','三高路','15','32','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('40','下渡','15','33','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('41','工农路','15','34','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('42','首山路','15','35','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('43','王庄新村','15','36','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('44','岳峰路','15','37','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('45','融侨东区','15','38','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('46','五里亭','15','39','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('47','五一新村','15','40','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('48','福光路','15','41','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('49','五里亭','15','42','9');
DROP TABLE IF EXISTS `%DB_PREFIX%article`;
CREATE TABLE `%DB_PREFIX%article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `cate_id` int(11) NOT NULL COMMENT '文章分类ID',
  `create_time` int(11) NOT NULL COMMENT '发表时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `add_admin_id` int(11) NOT NULL COMMENT '发布人(管理员ID)',
  `is_effect` tinyint(4) NOT NULL COMMENT '有效性标识',
  `rel_url` varchar(255) NOT NULL COMMENT '自动跳转的外链',
  `update_admin_id` int(11) NOT NULL COMMENT '更新人(管理员ID)',
  `is_delete` tinyint(4) NOT NULL COMMENT '删除标识',
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `sort` int(11) NOT NULL COMMENT '排序 由大到小',
  `seo_title` text NOT NULL COMMENT '自定义seo页面标题',
  `seo_keyword` text NOT NULL COMMENT '自定义seo页面keyword',
  `seo_description` text NOT NULL COMMENT '自定义seo页面标述',
  `uname` varchar(255) NOT NULL,
  `notice_page` tinyint(1) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `click_count` (`click_count`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='文章展示';
INSERT INTO `%DB_PREFIX%article` VALUES ('20','关于我们','关于我们','11','0','1305160934','0','1','','0','0','18','11','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('46','泰宁大金湖','','22','1424828134','1424828158','0','1','u:index|deal|act=65','0','0','0','25','','','','','1','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('47','男士棉服','','18','1424828200','1424828200','0','1','u:index|deal|act=64','0','0','0','26','','','','','2','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('27','免责条款','免责条款','19','1305160898','1305160898','0','1','','0','0','3','18','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('28','隐私保护','隐私保护','7','1305160911','1424803882','0','1','','0','0','4','19','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('29','咨询热点','咨询热点','10','1305160923','1424803868','0','1','','0','0','2','20','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('30','联系我们','联系我们','11','1305160934','1424803859','0','1','','0','0','30','21','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('31','公司简介','公司简介','11','1305160946','1424803850','0','1','','0','0','92','22','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('5','如何抽奖','如何抽奖','7','0','1424803982','0','1','','0','0','3','0','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('6','加入我们','加入我们','11','0','1324319464','0','1','u:index|user#register','0','0','22','2','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('44','RSS订阅','','9','1424804133','1424804133','0','1','u:index|rss','0','0','0','23','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('45','百度烤肉','','22','1424825968','1424828086','0','1','u:index|deal|act=70','0','0','0','24','','','','','1','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('10','友情链接','','10','0','1424804032','0','1','u:index|link','0','0','0','6','','','','','0','','');
DROP TABLE IF EXISTS `%DB_PREFIX%article_cate`;
CREATE TABLE `%DB_PREFIX%article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `brief` varchar(255) NOT NULL COMMENT '分类简介(备用字段)',
  `pid` int(11) NOT NULL COMMENT '父ID，程序分类可分二级',
  `is_effect` tinyint(4) NOT NULL COMMENT '有效性标识',
  `is_delete` tinyint(4) NOT NULL COMMENT '删除标识',
  `type_id` tinyint(1) NOT NULL COMMENT '类型\r\n0:普通文章（可通前台分类列表查找到）\r\n1.帮助文章（用于前台页面底部的站点帮助）\r\n2.公告文章（用于前台页面公告模块的调用）\r\n3.系统文章（自定义的一些文章，需要前台自定义一些入口链接到该文章）\r\n所属该分类的所有文章类型与分类一致',
  `sort` int(11) NOT NULL,
  `iconfont` varchar(15) NOT NULL COMMENT '针对帮助文档分类的图标',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `type_id` (`type_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='文章分类表';
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('11','公司信息','','0','1','0','1','4','&#58899;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('10','商务合作','','0','1','0','1','2','&#58891;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('9','获取更新','','0','1','0','1','3','&#58898;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('7','用户帮助','','0','1','0','1','1','&#58897;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('18','商城公告','','0','1','0','2','5','');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('19','系统文章','','0','1','0','3','6','');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('22','热门推荐','','0','1','0','2','7','');
DROP TABLE IF EXISTS `%DB_PREFIX%attr_stock`;
CREATE TABLE `%DB_PREFIX%attr_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `attr_cfg` text NOT NULL COMMENT '序列化的多维属性配置数据（包含属性ID，属性值）',
  `stock_cfg` int(11) NOT NULL DEFAULT '-1' COMMENT '该属性组合的库存数',
  `attr_str` text NOT NULL COMMENT '字符串展示的属性组合',
  `buy_count` int(11) NOT NULL COMMENT '当前属性组合的已卖的量，用于库存验证',
  `attr_key` varchar(100) NOT NULL COMMENT '属性ID以下划线从小到大排序的key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='规格属性库存表，用于多属性，多套餐商品的多库存定义';
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('121','57','a:2:{i:17;s:11:\"18点以后\";i:18;s:12:\"2-5人套餐\";}','1','18点以后2-5人套餐','1','256_258');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('139','64','a:2:{i:19;s:6:\"黑色\";i:20;s:6:\"小码\";}','499','黑色小码','1','270_273');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('138','64','a:2:{i:19;s:6:\"黑色\";i:20;s:6:\"大码\";}','400','黑色大码','0','270_272');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('137','64','a:2:{i:19;s:6:\"黑色\";i:20;s:6:\"均码\";}','300','黑色均码','0','270_271');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('136','64','a:2:{i:19;s:6:\"棕色\";i:20;s:6:\"小码\";}','200','棕色小码','0','269_273');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('134','64','a:2:{i:19;s:6:\"棕色\";i:20;s:6:\"均码\";}','100','棕色均码','0','269_271');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('135','64','a:2:{i:19;s:6:\"棕色\";i:20;s:6:\"大码\";}','-1','棕色大码','0','269_272');
DROP TABLE IF EXISTS `%DB_PREFIX%auto_cache`;
CREATE TABLE `%DB_PREFIX%auto_cache` (
  `cache_key` varchar(100) NOT NULL COMMENT '程序中识别的缓存唯一ID',
  `cache_type` varchar(100) NOT NULL COMMENT '缓存接口类型',
  `cache_data` text NOT NULL COMMENT '缓存值',
  `cache_time` int(11) NOT NULL COMMENT '缓存时间',
  PRIMARY KEY (`cache_key`,`cache_type`),
  KEY `cache_type` (`cache_type`),
  KEY `cache_key` (`cache_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='程序内置自动缓存引擎的配套数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%brand`;
CREATE TABLE `%DB_PREFIX%brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '品牌名称',
  `logo` varchar(255) NOT NULL COMMENT '品牌logo',
  `brand_promote_logo` varchar(255) NOT NULL COMMENT '用于限时促销模块展示的品牌促销图片',
  `brief` text NOT NULL COMMENT '品牌简介',
  `sort` int(11) NOT NULL COMMENT '排序(由大到小)',
  `shop_cate_id` int(11) NOT NULL COMMENT '所属的商品分类，用于前台分类展示用',
  `brand_promote` tinyint(1) NOT NULL COMMENT '是否参与品牌限时促销的标识',
  `begin_time` int(11) NOT NULL COMMENT '限时促销开始时间',
  `end_time` int(11) NOT NULL COMMENT '限时促销结束时间',
  `time_status` tinyint(1) NOT NULL COMMENT '0:已上线 1:未上线 2:已过期',
  `dy_count` int(11) DEFAULT '0' COMMENT '品牌订阅数量',
  `tag` text NOT NULL COMMENT '检索标签',
  `tag_match` text NOT NULL,
  `tag_match_row` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cate_id` (`shop_cate_id`),
  FULLTEXT KEY `tag_match` (`tag_match`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品品牌配置表';
INSERT INTO `%DB_PREFIX%brand` VALUES ('13','七匹狼','','','','1','31','0','0','0','0','0','男装 服装','ux30007ux35013,ux26381ux35013','男装,服装');
INSERT INTO `%DB_PREFIX%brand` VALUES ('14','耐克','','','','2','25','0','0','0','0','0','男装 鞋帽','ux30007ux35013,ux38795ux24125','男装,鞋帽');
INSERT INTO `%DB_PREFIX%brand` VALUES ('15','阿迪达斯','','','','3','24','0','0','0','0','0','服装 男装 女装 鞋帽','ux26381ux35013,ux30007ux35013,ux22899ux35013,ux38795ux24125,ux23478ux23621ux26381,ux27611ux34915','服装,男装,女装,鞋帽,家居服,毛衣');
INSERT INTO `%DB_PREFIX%brand` VALUES ('16','龙中龙','','','','4','31','0','0','0','0','0','男装 服装','ux30007ux35013,ux26381ux35013','男装,服装');
DROP TABLE IF EXISTS `%DB_PREFIX%brand_dy`;
CREATE TABLE `%DB_PREFIX%brand_dy` (
  `uid` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='移动端品牌订阅功能的数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%conf`;
CREATE TABLE `%DB_PREFIX%conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `input_type` tinyint(1) NOT NULL COMMENT '配置输入的类型 0:文本输入 1:下拉框输入 2:图片上传 3:编辑器',
  `value_scope` text NOT NULL COMMENT '取值范围',
  `is_effect` tinyint(1) NOT NULL,
  `is_conf` tinyint(1) NOT NULL COMMENT '是否可配置 0: 可配置  1:不可配置',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='系统配置表';
INSERT INTO `%DB_PREFIX%conf` VALUES ('1','DEFAULT_ADMIN','admin','1','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('2','URL_MODEL','0','1','1','0,1','1','1','3');
INSERT INTO `%DB_PREFIX%conf` VALUES ('4','TIME_ZONE','8','1','1','0,8','1','1','1');
INSERT INTO `%DB_PREFIX%conf` VALUES ('5','ADMIN_LOG','1','1','1','0,1','0','1','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('6','DB_VERSION','4.0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('7','DB_VOL_MAXSIZE','8000000','1','0','','1','1','11');
INSERT INTO `%DB_PREFIX%conf` VALUES ('8','WATER_MARK','./public/attachment/201011/4cdde85a27105.gif','2','2','','1','1','48');
INSERT INTO `%DB_PREFIX%conf` VALUES ('24','CURRENCY_UNIT','&yen;','3','0','','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('10','BIG_WIDTH','500','2','0','','0','0','49');
INSERT INTO `%DB_PREFIX%conf` VALUES ('11','BIG_HEIGHT','500','2','0','','0','0','50');
INSERT INTO `%DB_PREFIX%conf` VALUES ('12','SMALL_WIDTH','200','2','0','','0','0','51');
INSERT INTO `%DB_PREFIX%conf` VALUES ('13','SMALL_HEIGHT','200','2','0','','0','0','52');
INSERT INTO `%DB_PREFIX%conf` VALUES ('14','WATER_ALPHA','75','2','0','','1','1','53');
INSERT INTO `%DB_PREFIX%conf` VALUES ('15','WATER_POSITION','4','2','1','1,2,3,4,5','1','1','54');
INSERT INTO `%DB_PREFIX%conf` VALUES ('16','MAX_IMAGE_SIZE','3000000','2','0','','1','1','55');
INSERT INTO `%DB_PREFIX%conf` VALUES ('18','MAX_FILE_SIZE','1','1','0','','0','1','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('19','ALLOW_FILE_EXT','1','1','0','','0','1','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('20','BG_COLOR','#ffffff','2','0','','0','0','57');
INSERT INTO `%DB_PREFIX%conf` VALUES ('21','IS_WATER_MARK','1','2','1','0,1','1','1','58');
INSERT INTO `%DB_PREFIX%conf` VALUES ('22','TEMPLATE','fanwe','3','0','','1','1','17');
INSERT INTO `%DB_PREFIX%conf` VALUES ('126','YOUHUI_SEND_LIMIT','5','5','0','','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('25','SCORE_UNIT','积分','3','0','','1','0','22');
INSERT INTO `%DB_PREFIX%conf` VALUES ('26','USER_VERIFY','1','4','1','0,1','1','0','63');
INSERT INTO `%DB_PREFIX%conf` VALUES ('27','SHOP_LOGO','./public/attachment/201011/4cdd501dc023b.png','3','2','','1','1','19');
INSERT INTO `%DB_PREFIX%conf` VALUES ('28','SHOP_LANG','zh-cn','3','1','zh-cn','1','0','18');
INSERT INTO `%DB_PREFIX%conf` VALUES ('29','SHOP_TITLE','方维o2o商业系统','3','0','','1','1','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('30','SHOP_KEYWORD','方维o2o商业系统关键词','3','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('31','SHOP_DESCRIPTION','方维o2o商业系统描述','3','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('32','SHOP_TEL','400-800-8888','3','0','','1','1','23');
INSERT INTO `%DB_PREFIX%conf` VALUES ('33','SIDE_DEAL_COUNT','3','3','0','','1','1','29');
INSERT INTO `%DB_PREFIX%conf` VALUES ('34','SIDE_MESSAGE_COUNT','3','3','0','','1','0','30');
INSERT INTO `%DB_PREFIX%conf` VALUES ('35','INVITE_REFERRALS','20','4','0','','1','1','67');
INSERT INTO `%DB_PREFIX%conf` VALUES ('36','INVITE_REFERRALS_TYPE','0','4','1','0,1','1','1','68');
INSERT INTO `%DB_PREFIX%conf` VALUES ('38','ONLINE_QQ','88888888|9999999','3','0','','1','1','25');
INSERT INTO `%DB_PREFIX%conf` VALUES ('39','ONLINE_TIME','周一至周六 9:00-18:00','3','0','','1','1','26');
INSERT INTO `%DB_PREFIX%conf` VALUES ('40','DEAL_PAGE_SIZE','12','3','0','','1','1','31');
INSERT INTO `%DB_PREFIX%conf` VALUES ('41','PAGE_SIZE','24','3','0','','1','1','32');
INSERT INTO `%DB_PREFIX%conf` VALUES ('42','HELP_CATE_LIMIT','4','3','0','','1','1','34');
INSERT INTO `%DB_PREFIX%conf` VALUES ('43','HELP_ITEM_LIMIT','4','3','0','','1','1','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('44','SHOP_FOOTER','<div style=\"text-align:center;\">[方维o2o商业系统] <a target=\"_blank\" href=\"http://www.fanwe.com\">http://www.fanwe.com</a><br />\n</div>\n','3','3','','1','1','37');
INSERT INTO `%DB_PREFIX%conf` VALUES ('45','USER_MESSAGE_AUTO_EFFECT','1','4','1','0,1','1','0','64');
INSERT INTO `%DB_PREFIX%conf` VALUES ('48','MAIL_SEND_COUPON','0','5','1','0,1','1','1','73');
INSERT INTO `%DB_PREFIX%conf` VALUES ('49','SMS_SEND_COUPON','0','5','1','0,1','1','1','79');
INSERT INTO `%DB_PREFIX%conf` VALUES ('50','MAIL_SEND_PAYMENT','0','5','1','0,1','1','1','75');
INSERT INTO `%DB_PREFIX%conf` VALUES ('51','SMS_SEND_PAYMENT','0','5','1','0,1','1','1','81');
INSERT INTO `%DB_PREFIX%conf` VALUES ('62','REPLY_ADDRESS','info@fanwe.com','5','0','','1','1','77');
INSERT INTO `%DB_PREFIX%conf` VALUES ('54','MAIL_SEND_DELIVERY','0','5','1','0,1','1','1','76');
INSERT INTO `%DB_PREFIX%conf` VALUES ('55','SMS_SEND_DELIVERY','0','5','1','0,1','1','1','82');
INSERT INTO `%DB_PREFIX%conf` VALUES ('56','MAIL_ON','1','5','1','0,1','1','1','72');
INSERT INTO `%DB_PREFIX%conf` VALUES ('57','SMS_ON','1','5','1','0,1','1','1','78');
INSERT INTO `%DB_PREFIX%conf` VALUES ('58','REFERRAL_LIMIT','1','4','0','','1','1','69');
INSERT INTO `%DB_PREFIX%conf` VALUES ('59','SMS_COUPON_LIMIT','3','5','0','','1','1','80');
INSERT INTO `%DB_PREFIX%conf` VALUES ('60','MAIL_COUPON_LIMIT','3','5','0','','1','1','74');
INSERT INTO `%DB_PREFIX%conf` VALUES ('61','COUPON_NAME','方维券','3','0','','1','1','16');
INSERT INTO `%DB_PREFIX%conf` VALUES ('63','BATCH_PAGE_SIZE','500','3','0','','1','0','33');
INSERT INTO `%DB_PREFIX%conf` VALUES ('64','COUPON_PRINT_TPL','<div style=\"border:1px solid #000000;padding:10px;margin:0px auto;width:600px;font-size:14px;\"><table class=\"dataEdit\" cellpadding=\"0\" cellspacing=\"0\">	<tbody><tr>    <td width=\"400\">    	<img src=\"./public/attachment/201011/4cdd505195d40.gif\" alt=\"\" border=\"0\" />     </td>\r\n  <td style=\"font-weight:bolder;font-size:22px;font-family:verdana;\" width=\"43%\">    序列号：{$bond.sn}<br />\r\n    密码：{$bond.password}    </td>\r\n</tr>\r\n<tr><td colspan=\"2\" height=\"1\">  <div style=\"width:100%;border-bottom:1px solid #000000;\">&nbsp;</div>\r\n  </td>\r\n</tr>\r\n<tr><td colspan=\"2\" height=\"8\"><br />\r\n</td>\r\n</tr>\r\n<tr><td style=\"font-weight:bolder;font-size:28px;height:50px;padding:5px;font-family:微软雅黑;\" colspan=\"2\">{$bond.name}</td>\r\n</tr>\r\n<tr><td style=\"line-height:22px;padding-right:20px;\" width=\"400\">{$bond.user_name}<br />\r\n  生效时间:{$bond.begin_time_format}<br />\r\n  过期时间:{$bond.end_time_format}<br />\r\n  商家电话：<br />\r\n  {$bond.tel}<br />\r\n  商家地址:<br />\r\n  {$bond.address}<br />\r\n  交通路线:<br />\r\n  {$bond.route}<br />\r\n  营业时间：<br />\r\n  {$bond.open_time}<br />\r\n  </td>\r\n  <td><div id=\"map_canvas\" style=\"width:255px;height:255px;\"></div>\r\n  <br />\r\n  </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n','3','3','','1','0','40');
INSERT INTO `%DB_PREFIX%conf` VALUES ('65','PUBLIC_DOMAIN_ROOT','','2','0','','1','0','59');
INSERT INTO `%DB_PREFIX%conf` VALUES ('66','SHOW_DEAL_CATE','1','3','1','0,1','1','0','41');
INSERT INTO `%DB_PREFIX%conf` VALUES ('67','REFERRAL_IP_LIMIT','0','4','1','0,1','1','1','71');
INSERT INTO `%DB_PREFIX%conf` VALUES ('69','CART_ON','1','3','1','0,1','1','1','42');
INSERT INTO `%DB_PREFIX%conf` VALUES ('70','REFERRALS_DELAY','1','4','0','','1','1','70');
INSERT INTO `%DB_PREFIX%conf` VALUES ('71','SUBMIT_DELAY','5','1','0','','1','0','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('72','APP_MSG_SENDER_OPEN','1','1','1','0,1','1','1','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('73','ADMIN_MSG_SENDER_OPEN','1','1','1','0,1','1','1','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('74','SHOP_OPEN','1','3','1','0,1','1','1','46');
INSERT INTO `%DB_PREFIX%conf` VALUES ('75','SHOP_CLOSE_HTML','','3','3','','1','1','47');
INSERT INTO `%DB_PREFIX%conf` VALUES ('76','FOOTER_LOGO','./public/attachment/201011/4cdd50ed013ec.png','3','2','','1','1','20');
INSERT INTO `%DB_PREFIX%conf` VALUES ('77','GZIP_ON','0','1','1','0,1','1','1','2');
INSERT INTO `%DB_PREFIX%conf` VALUES ('78','INTEGRATE_CODE','','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('79','INTEGRATE_CFG','','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('80','SHOP_SEO_TITLE','方维o2o商业系统,国内最优秀的PHP开源o2o系统','3','0','','1','1','14');
INSERT INTO `%DB_PREFIX%conf` VALUES ('81','CACHE_ON','1','1','1','0,1','1','0','7');
INSERT INTO `%DB_PREFIX%conf` VALUES ('82','EXPIRED_TIME','0','1','0','','1','0','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('120','FILTER_WORD','','1','0','','1','1','100');
INSERT INTO `%DB_PREFIX%conf` VALUES ('84','STYLE_OPEN','0','3','1','0,1','0','0','44');
INSERT INTO `%DB_PREFIX%conf` VALUES ('85','STYLE_DEFAULT','1','3','1','0,1','0','0','45');
INSERT INTO `%DB_PREFIX%conf` VALUES ('86','TMPL_DOMAIN_ROOT','','2','0','0','0','0','62');
INSERT INTO `%DB_PREFIX%conf` VALUES ('94','ICP_LICENSE','','3','0','','1','1','27');
INSERT INTO `%DB_PREFIX%conf` VALUES ('95','COUNT_CODE','','3','0','','1','1','28');
INSERT INTO `%DB_PREFIX%conf` VALUES ('96','DEAL_MSG_LOCK','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('97','PROMOTE_MSG_LOCK','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('98','LIST_TYPE','1','3','1','0,1','1','0','45');
INSERT INTO `%DB_PREFIX%conf` VALUES ('100','SUPPLIER_DETAIL','1','3','1','0,1','1','0','45');
INSERT INTO `%DB_PREFIX%conf` VALUES ('101','KUAIDI_APP_KEY','','1','0','','1','1','83');
INSERT INTO `%DB_PREFIX%conf` VALUES ('102','KUAIDI_TYPE','2','1','1','1,2,3','1','1','84');
INSERT INTO `%DB_PREFIX%conf` VALUES ('103','SEND_SPAN','2','1','0','','1','1','85');
INSERT INTO `%DB_PREFIX%conf` VALUES ('104','MAIL_USE_COUPON','0','5','1','0,1','1','1','77');
INSERT INTO `%DB_PREFIX%conf` VALUES ('105','SMS_USE_COUPON','0','5','1','0,1','1','1','83');
INSERT INTO `%DB_PREFIX%conf` VALUES ('106','LOTTERY_SMS_VERIFY','0','5','1','0,1','1','1','84');
INSERT INTO `%DB_PREFIX%conf` VALUES ('107','LOTTERY_SN_SMS','0','5','1','0,1','1','1','85');
INSERT INTO `%DB_PREFIX%conf` VALUES ('108','EDM_ON','0','5','1','0,1','1','0','86');
INSERT INTO `%DB_PREFIX%conf` VALUES ('109','EDM_USERNAME','','5','0','','1','0','87');
INSERT INTO `%DB_PREFIX%conf` VALUES ('110','EDM_PASSWORD','','5','4','','1','0','88');
INSERT INTO `%DB_PREFIX%conf` VALUES ('111','SHOP_SEARCH_KEYWORD','','3','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('112','REC_HOT_LIMIT','4','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('113','REC_NEW_LIMIT','4','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('180','BAIDU_MAP_APPKEY','','1','0','','1','1','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('115','REC_CATE_GOODS_LIMIT','4','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('116','SALE_LIST','5','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('117','INDEX_NOTICE_COUNT','8','3','0','','1','1','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('118','RELATE_GOODS_LIMIT','5','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('119','TMPL_CACHE_ON','1','1','1','0,1','1','0','6');
INSERT INTO `%DB_PREFIX%conf` VALUES ('121','USER_LOGIN_SCORE','0','6','0','','1','1','2');
INSERT INTO `%DB_PREFIX%conf` VALUES ('122','USER_LOGIN_MONEY','0','6','0','','1','1','1');
INSERT INTO `%DB_PREFIX%conf` VALUES ('123','USER_REGISTER_SCORE','100','6','0','','1','1','8');
INSERT INTO `%DB_PREFIX%conf` VALUES ('124','USER_REGISTER_MONEY','0','6','0','','1','1','7');
INSERT INTO `%DB_PREFIX%conf` VALUES ('125','DOMAIN_ROOT','','1','0','','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('128','VERIFY_IMAGE','0','1','1','0,1','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('129','TUAN_SHOP_TITLE','方维团购','3','0','','1','0','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('130','MALL_SHOP_TITLE','方维商城','3','0','','1','0','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('131','APNS_MSG_LOCK','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('132','PROMOTE_MSG_PAGE','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('133','APNS_MSG_PAGE','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('134','STORE_SEND_LIMIT','5','5','0','','1','0','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('135','USER_LOGIN_POINT','10','6','0','','1','1','3');
INSERT INTO `%DB_PREFIX%conf` VALUES ('136','USER_REGISTER_POINT','100','6','0','','1','1','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('137','USER_LOGIN_KEEP_MONEY','0','6','0','','1','1','4');
INSERT INTO `%DB_PREFIX%conf` VALUES ('138','USER_LOGIN_KEEP_SCORE','5','6','0','','1','1','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('139','USER_LOGIN_KEEP_POINT','50','6','0','','1','1','6');
INSERT INTO `%DB_PREFIX%conf` VALUES ('140','USER_ACTIVE_MONEY','0','6','0','','1','1','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('141','USER_ACTIVE_SCORE','0','6','0','','1','1','11');
INSERT INTO `%DB_PREFIX%conf` VALUES ('142','USER_ACTIVE_POINT','10','6','0','','1','1','12');
INSERT INTO `%DB_PREFIX%conf` VALUES ('143','USER_ACTIVE_MONEY_MAX','0','6','0','','1','1','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('144','USER_ACTIVE_SCORE_MAX','0','6','0','','1','1','14');
INSERT INTO `%DB_PREFIX%conf` VALUES ('145','USER_ACTIVE_POINT_MAX','100','6','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('146','USER_DELETE_MONEY','0','6','0','','1','1','16');
INSERT INTO `%DB_PREFIX%conf` VALUES ('148','USER_DELETE_POINT','-10','6','0','','1','1','18');
INSERT INTO `%DB_PREFIX%conf` VALUES ('149','USER_ADD_MONEY','0','6','0','','1','1','19');
INSERT INTO `%DB_PREFIX%conf` VALUES ('150','USER_ADD_SCORE','0','6','0','','1','1','20');
INSERT INTO `%DB_PREFIX%conf` VALUES ('151','USER_ADD_POINT','10','6','0','','1','1','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('147','USER_DELETE_SCORE','0','6','0','','1','1','17');
INSERT INTO `%DB_PREFIX%conf` VALUES ('152','BIZ_AGREEMENT','<ul>                                	<li>                                    &nbsp;&nbsp;&nbsp;&nbsp;您确认，在开始\"实名认证\"前，您已详细阅读了本协议所有内容，一旦您开始认证流程，即表示您充分理解并同意接受本协议的全部内容。                                    </li>\n                                    <li>                                    &nbsp;&nbsp;&nbsp;&nbsp;为了提高服务的安全性和我们的商户身份的可信度，我们向您提供认证服务。在您申请认证前，您必须先注册成为用户。商户认证成功后，我们将给予每个商户一个认证标识。本公司有权采取各种其认为必要手段对商户的身份进行识别。但是，作为普通的网络服务提供商，本公司所能采取的方法有限，而且在网络上进行商户身份识别也存在一定的困难，因此，本公司对完成认证的商户身份的准确性和绝对真实性不做任何保证。                                    </li>\n                                    <li>                                    &nbsp;&nbsp;&nbsp;&nbsp;本公司有权记录并保存您提供给本公司的信息和本公司获取的结果信息，亦有权根据本协议的约定向您或第三方提供您是否通过认证的结论以及您的身份信息。                                         </li>\n									<li>										<h3>一、关于认证服务的理解与认同</h3>\n										<ol class=\"decimal\">											<li>认证服务是由本公司提供的一项身份识别服务。除非本协议另有约定，一旦您的账户完成了认证，相应的身份信息和认证结果将不因任何原因被修改或取消；如果您的身份信息在完成认证后发生了变更，您应向本公司提供相应有权部门出具的凭证，由本公司协助您变更账户的对应认证信息。</li>\n											<li>本公司有权单方随时修改或变更本协议内容，并通过网站公告变更后的协议文本，无需单独通知您。本协议进行任何修改或变更后，您还继续使用我们的服务和/或认证服务的，即代表您已阅读、了解并同意接受变更后的协议内容；您如果不同意变更后的协议内容，应立即停用我们的服务和认证服务。</li>\n										</ol>\n																</li>\n<li>										<h3>二、实名认证</h3>\n										<ol class=\"decimal\">											<li>个体工商户类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的个体工商户营业执照或者其他身份证明文件。</li>\n											<li>企业类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的企业营业执照或者其他身份证明文件。</li>\n                                            <li>                                            其他类商户向本公司申请认证服务时，应向本公司提供以下资料：能够证明商户合法身份的证明文件，或者其他本公司认为必要的身份证明文件。                                            </li>\n                                            <li>                                            如商户在认证后变更任何身份信息，则应在变更发生后三个工作日内书面通知本公司变更认证，否则本公司有权随时单方终止提供服务，且因此造成的全部后果，由商户自行承担。                                            </li>\n                                            <li>                                            通过实名认证的商户不能自行修改已经认证的信息，包括但不限于企业名称、姓名以及身份证件号码等。                                            </li>\n										</ol>\n									</li>\n									<li>										<h3>三、特别声明</h3>\n												<ol class=\"decimal\">																						<li>认证信息共享：<br />\n为了使您享有便捷的服务，您经由其它网站向本公司提交认证申请即表示您同意本公司为您核对所提交的全部认证信息，并同意本公司将是否通过认证的结果及相关认证信息提供给该网站。</li>\n											<li>												认证资料的管理：<br />\n     您在认证时提交给本公司的认证资料，即不可撤销的授权由本公司保留。本公司承诺除法定或约定的事由外，不公开或编辑或透露您的认证资料及保存在本公司的非公开内容用于商业目的，但本条第1项规定以及以下情形除外：												<ol class=\"lower-roman\">													<li>您授权本公司透露的相关信息；</li>\n													<li>本公司向国家司法及行政机关提供；</li>\n                                                    <li>本公司向本公司关联企业提供；</li>\n                                                    <li>第三方和本公司一起为商户提供服务时，该第三方向您提供服务所需的相关信息；</li>\n                                                    <li>基于解决您与第三方民事纠纷的需要，本公司有权向该第三方提供您的身份信息。</li>\n												</ol>\n														</li>\n										</ol>\n									</li>\n																<li>										<h3>四、第三方网站的链接</h3>\n                                    </li>\n											<li>&nbsp;&nbsp;&nbsp;&nbsp;为实现认证信息审查，我们网站上可能包含了指向第三方网站的链接（以下简称\"链接网站\"）。\"链接网站\"非由本公司控制，对于任何\"链接网站\"的内容，包含但不限于\"链接网站\"内含的任何链接，或\"链接网站\"的任何改变或更新，本公司均不予负责。自\"链接网站\"接收的网络传播或其它形式之传送，本公司不予负责。</li>\n									<li>										<h3>五、不得为非法或禁止的使用</h3>\n                                    </li>\n                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;接受本协议全部的说明、条款、条件是您申请认证的先决条件。您声明并保证，您不得为任何非法或为本协议、条件及须知所禁止之目的进行认证申请。您不得以任何可能损害、使瘫痪、使过度负荷或损害网站或其他网站的服务、或干扰本公司或他人对于认证申请的使用等方式使用认证服务。您不得经由非本公司许可提供的任何方式取得或试图取得任何资料或信息。									</li>\n									<li>										<h3>六、有关免责</h3>\n                                     </li>\n                                     <li>                                     &nbsp;&nbsp;&nbsp;&nbsp;下列情况时本公司无需承担任何责任：                                     </li>\n                                     <li>											<ol class=\"decimal\">												<li>由于您将账户密码告知他人或未保管好自己的密码或与他人共享账户或任何其他非本公司的过错，导致您的个人资料泄露。</li>\n												<li>													任何由于黑客攻击、计算机病毒侵入或发作、电信部门技术调整导致之影响、因政府管制而造成的暂时性关闭、由于第三方原因(包括不可抗力，例如国际出口的主干线路及国际出口电信提供商一方出现故障、火灾、水灾、雷击、地震、洪水、台风、龙卷风、火山爆发、瘟疫和传染病流行、罢工、战争或暴力行为或类似事件等)及其他非因本公司过错而造成的认证信息泄露、丢失、被盗用或被篡改等。															</li>\n												<li>由于与本公司链接的其它网站所造成的商户身份信息泄露及由此而导致的任何法律争议和后果。</li>\n                                                <li>任何商户向本公司提供错误、不完整、不实信息等造成不能通过认证或遭受任何其他损失，概与本公司无关。</li>\n											</ol>\n									</li>\n																</ul>\n','3','3',' ','1','1','100');
INSERT INTO `%DB_PREFIX%conf` VALUES ('153','INDEX_LEFT_STORE','1','3','0',' ','1','0','1');
INSERT INTO `%DB_PREFIX%conf` VALUES ('154','INDEX_LEFT_TUAN','1','3','0',' ','1','0','2');
INSERT INTO `%DB_PREFIX%conf` VALUES ('155','INDEX_LEFT_YOUHUI','1','3','0',' ','1','0','3');
INSERT INTO `%DB_PREFIX%conf` VALUES ('156','INDEX_LEFT_DAIJIN','1','3','0',' ','1','0','4');
INSERT INTO `%DB_PREFIX%conf` VALUES ('157','INDEX_LEFT_EVENT','1','3','0',' ','1','0','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('158','INDEX_RIGHT_STORE','1','3','0',' ','1','0','6');
INSERT INTO `%DB_PREFIX%conf` VALUES ('159','INDEX_RIGHT_TUAN','1','3','0',' ','1','0','7');
INSERT INTO `%DB_PREFIX%conf` VALUES ('160','INDEX_RIGHT_YOUHUI','1','3','0',' ','1','0','8');
INSERT INTO `%DB_PREFIX%conf` VALUES ('161','INDEX_RIGHT_DAIJIN','1','3','0',' ','1','0','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('162','INDEX_RIGHT_EVENT','1','3','0',' ','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('163','USER_YOUHUI_DOWN_MONEY','0','6','0',' ','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('164','USER_YOUHUI_DOWN_SCORE','0','6','0',' ','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('165','USER_YOUHUI_DOWN_POINT','0','6','0',' ','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('167','APPLE_PATH','ios','3','0',' ','1','0','101');
INSERT INTO `%DB_PREFIX%conf` VALUES ('168','ANDROID_PATH','android','3','0',' ','1','0','102');
INSERT INTO `%DB_PREFIX%conf` VALUES ('171','QRCODE_SIZE','5','3','1','1,3,5','1','1','103');
INSERT INTO `%DB_PREFIX%conf` VALUES ('169','SEND_SCORE_SMS','0','5','1','0,1','1','1','82');
INSERT INTO `%DB_PREFIX%conf` VALUES ('170','SEND_SCORE_MAIL','0','5','1','0,1','1','1','76');
INSERT INTO `%DB_PREFIX%conf` VALUES ('172','YOUHUI_SEND_TEL_LIMIT','2','5','0','','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('173','IP_LIMIT_NUM','0','1','0','','1','1','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('174','INDEX_SUPPLIER_COUNT','8','3','0','','1','1','28');
INSERT INTO `%DB_PREFIX%conf` VALUES ('179','SUPPLIER_ORDER_NOTIFY','1','5','1','0,1','1','1','50');
INSERT INTO `%DB_PREFIX%conf` VALUES ('175','BIZ_APPLE_PATH','','3','0','','1','0','102');
INSERT INTO `%DB_PREFIX%conf` VALUES ('176','BIZ_ANDROID_PATH','','3','0','','1','0','102');
INSERT INTO `%DB_PREFIX%conf` VALUES ('181','BIZ_REGISTER_SMS','0','5','1','0,1','1','1','100');
INSERT INTO `%DB_PREFIX%conf` VALUES ('182','QRCODE_ON','0','3','1','0,1','1','1','41');
INSERT INTO `%DB_PREFIX%conf` VALUES ('183','TENCENT_MAP_APPKEY','','1','0','','1','1','35');
DROP TABLE IF EXISTS `%DB_PREFIX%coupon_log`;
CREATE TABLE `%DB_PREFIX%coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_sn` varchar(255) NOT NULL COMMENT '消费券序列号',
  `create_time` int(11) NOT NULL COMMENT '请求时间',
  `msg` text NOT NULL COMMENT '请求信息（如短信为上行的短信内容）',
  `query_id` varchar(255) NOT NULL COMMENT '第三方验证通道的请求唯一ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方消费券验证(短信上行验证，电话验证)的第三方请求回调日志';
DROP TABLE IF EXISTS `%DB_PREFIX%daren_submit`;
CREATE TABLE `%DB_PREFIX%daren_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '申请达人的会员ID',
  `is_publish` tinyint(1) NOT NULL COMMENT '是否通过标识0:否 1:是',
  `create_time` int(11) NOT NULL COMMENT '提交申请时间',
  `reason` text NOT NULL COMMENT '用户提交的申请理由',
  `daren_title` varchar(255) NOT NULL COMMENT '达人专用名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='达人申请表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal`;
CREATE TABLE `%DB_PREFIX%deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '商品名称',
  `sub_name` varchar(255) NOT NULL COMMENT '短名称，用于短信，邮件等需要节约字符数的地方显示名称用',
  `cate_id` int(11) NOT NULL COMMENT '生活服务分类ID',
  `supplier_id` int(11) NOT NULL COMMENT '所属的商户ID',
  `img` varchar(255) NOT NULL COMMENT '主图',
  `description` text NOT NULL COMMENT '信息描述详情',
  `begin_time` int(11) NOT NULL COMMENT '上线开始时间，可为0为不限时',
  `end_time` int(11) NOT NULL COMMENT '下架时间，可为0为不限时',
  `min_bought` int(11) NOT NULL COMMENT '最小购买量，用于团购产品的成团判断',
  `max_bought` int(11) NOT NULL DEFAULT '-1' COMMENT '最大量，即库存上限(如有属性规格的库存，该值不生效，见attr_stock表)',
  `user_min_bought` int(11) NOT NULL COMMENT '会员下单的最小量',
  `user_max_bought` int(11) NOT NULL COMMENT '每个会员购买的上限',
  `origin_price` decimal(20,4) NOT NULL COMMENT '原价',
  `current_price` decimal(20,4) NOT NULL COMMENT '当前销售价',
  `city_id` int(11) NOT NULL COMMENT '所属的城市',
  `is_coupon` tinyint(1) NOT NULL COMMENT '是否发放消费券',
  `is_delivery` tinyint(1) NOT NULL COMMENT '是否需要配送（实体商品），需要配送的产品前台会出现配送方式的选项，并计算相应运费',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `user_count` int(11) NOT NULL COMMENT '下单量（按单计算,每组商品多件购买算一笔）',
  `buy_count` int(11) NOT NULL COMMENT '销量（购买的件数）',
  `time_status` tinyint(1) NOT NULL COMMENT '时间状态0:未开始1:进行中2:已过期(不上架销售，可以往消费券中查到)',
  `buy_status` tinyint(1) NOT NULL COMMENT '销售状态 0:未成团 1:已成团 2:成团并卖光\r\n0:未成团，购买的用户生成消费券，但不发券\r\n1:成团，购买发券\r\n2:卖光商品不再开放购买，但不下架',
  `deal_type` tinyint(1) NOT NULL COMMENT '发券方式 0:按件发送 1:按单发券(同类商品买多件只发放一张消费券,用于一次性验证)',
  `allow_promote` tinyint(1) NOT NULL COMMENT '是否允许参与促销（系统内安装并配置的促销接口）',
  `return_money` decimal(20,4) NOT NULL COMMENT '购买即返现的金额(该项可填负数，也可作为额外消费的金额)',
  `return_score` int(11) NOT NULL COMMENT '购买返积分(也可以为负数，表示商品购买的积分限制，积分商品的积分也为该项，因此必需为负数)',
  `brief` text NOT NULL COMMENT '商品简介',
  `sort` int(11) NOT NULL COMMENT '前台展示排序 由大到小',
  `deal_goods_type` int(11) NOT NULL COMMENT '商品类型（用于生成相应类型的属性规格配置项）',
  `success_time` int(11) NOT NULL COMMENT '成团时间',
  `coupon_time_type` tinyint(1) NOT NULL COMMENT '0：指定时间过期 1:按下单日起xx天过期',
  `coupon_day` int(11) NOT NULL COMMENT '下单后xx天内失效',
  `coupon_begin_time` int(11) NOT NULL COMMENT '发放消费券的生效时间',
  `coupon_end_time` int(11) NOT NULL COMMENT '发放的消费券的过期时间',
  `code` varchar(255) NOT NULL COMMENT '标识码,可自定义一个标识用于消费券的前缀（用于电话验证的商品只能填数字）',
  `weight` decimal(20,4) NOT NULL COMMENT '商品重量，实体商品填写，用于运费计算',
  `weight_id` int(11) NOT NULL COMMENT '重量单位的配置ID',
  `is_referral` tinyint(1) NOT NULL COMMENT '是否允许购买返利给邀请人',
  `buy_type` tinyint(1) NOT NULL COMMENT '团购商品的类型0：普通 2:订购 3秒杀 (该值仅作为前台展示以及归类用，功能上与团购商品相同) ',
  `discount` decimal(20,4) NOT NULL COMMENT '商品的现价与原价的折扣数，通常会自动生成，在线订购类商品因为付的是订金，该项手动计算原价与卖价的折扣比',
  `icon` varchar(255) NOT NULL COMMENT '小图',
  `notice` tinyint(1) NOT NULL COMMENT '是否参与预告（未到上线期的商品，默认不展示在前台，该项为1表示可以上线展示预告）',
  `free_delivery` tinyint(1) NOT NULL COMMENT '是否开启免运费，可以单独配置针对某个配送方式的免运费规则',
  `define_payment` tinyint(1) NOT NULL COMMENT '是否自定义禁用哪些支付方式',
  `seo_title` text NOT NULL COMMENT '自定义的页面seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义的页面seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义的页面seo描述',
  `is_hot` tinyint(1) NOT NULL COMMENT '商城商品的热卖标识',
  `is_new` tinyint(1) NOT NULL COMMENT '商城商品的新品标识',
  `is_best` tinyint(1) NOT NULL COMMENT '商城商品的精品标识',
  `is_lottery` tinyint(1) NOT NULL COMMENT '是否参与抽奖，为1则生成抽奖号，用于运营中制定相应的抽奖规则',
  `reopen` int(11) NOT NULL COMMENT '重开团的申请，往期团购前台可以申请重新开团，该项用于计数',
  `uname` varchar(255) NOT NULL COMMENT 'url别名，用于重写与seo收录的优化',
  `forbid_sms` tinyint(1) NOT NULL COMMENT '是否禁用短信发送功能，禁用短信则该商品的购物不会短信发券',
  `cart_type` tinyint(1) NOT NULL COMMENT '购物车规则\r\n0:启用购物车(每次可以买多款)\r\n1按商品(同款商品可买多款属性)\r\n2按商家(同个商家可买多款商品)\r\n3禁用购物车(每次只能买一款)',
  `shop_cate_id` int(11) NOT NULL COMMENT '商城商品的分类ID',
  `is_shop` tinyint(1) NOT NULL COMMENT '标识是否为商城商品 0:否 1:是',
  `total_point` int(11) NOT NULL COMMENT '用户评分的总分',
  `avg_point` float(14,4) NOT NULL COMMENT '用户评分的平均分',
  `create_time` int(11) NOT NULL COMMENT '管理员发布时间',
  `update_time` int(11) NOT NULL COMMENT '管理员更新时间',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode编码',
  `name_match_row` text NOT NULL COMMENT '名称的全文索引查询栏',
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引unicode',
  `deal_cate_match_row` text NOT NULL COMMENT '分类的全文索引查询栏',
  `shop_cate_match` text NOT NULL COMMENT '商品分类的全文索引unicode',
  `shop_cate_match_row` text NOT NULL COMMENT '商品分类的全文索引查询栏',
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引unicode',
  `locate_match_row` text NOT NULL COMMENT '地区信息的全文索引查询栏',
  `tag_match` text NOT NULL COMMENT '标签全文索引unicode',
  `tag_match_row` text NOT NULL COMMENT '标签全文索引查询栏',
  `xpoint` varchar(255) NOT NULL COMMENT '经度（第一个分店的经度）',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度（第一个分店的纬度）',
  `brand_id` int(11) NOT NULL COMMENT '所归属的品牌',
  `brand_promote` tinyint(1) NOT NULL COMMENT '是否参与品牌促销，该项与brand表的该项同步',
  `publish_wait` tinyint(1) NOT NULL COMMENT '商家提交的产品 0:已审核 1:等待审核',
  `account_id` int(11) NOT NULL COMMENT '商家提交的商家帐号ID',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到首页展示',
  `balance_price` decimal(20,4) NOT NULL COMMENT '与商家的结算价（即商价提供给平台商的成本价）',
  `is_refund` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可退款',
  `auto_order` tinyint(1) NOT NULL COMMENT '是否打上免预约标识 0:否 1:是',
  `expire_refund` tinyint(1) NOT NULL COMMENT '是否支持过期退款( 过期未消费用户即可提交退款)',
  `any_refund` tinyint(1) NOT NULL COMMENT '是否支持随时退款（未消费用户即可提交退款申请）',
  `multi_attr` tinyint(1) NOT NULL COMMENT '多套餐（自动判断是否有属性规格配置，有则打上该标签）',
  `deal_tag` int(10) NOT NULL COMMENT '商品标签\r\n2^(1-10)\r\n1.0元抽奖\r\n2.免预约\r\n3.多套餐\r\n4.可订座\r\n5.代金券\r\n6.过期退\r\n7.随时退\r\n8.七天退\r\n9.免运费\r\n10.满立减',
  `dp_count` int(11) NOT NULL COMMENT '总参与的点评人数',
  `notes` text NOT NULL COMMENT '购买需知',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `buyin_app` tinyint(1) NOT NULL COMMENT '是否仅展示在app端0否 1是',
`is_pick`  tinyint(1) NOT NULL COMMENT '是否允许上门自提',
`set_meal`  text NOT NULL COMMENT '移动端套餐模板',
`pc_setmeal`  text NOT NULL COMMENT 'PC端套餐模板',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `begin_time` (`begin_time`),
  KEY `end_time` (`end_time`),
  KEY `current_price` (`current_price`),
  KEY `city_id` (`city_id`),
  KEY `buy_count` (`buy_count`),
  KEY `sort` (`sort`),
  KEY `buy_type` (`buy_type`),
  KEY `shop_cate_id` (`shop_cate_id`),
  KEY `is_shop` (`is_shop`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `buyin_app` (`buyin_app`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `tag_match` (`tag_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `all_match` (`name_match`,`deal_cate_match`,`locate_match`,`tag_match`,`shop_cate_match`),
  FULLTEXT KEY `shop_cate_match` (`shop_cate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='产生支付行为的商品、团购、代金券数据表';
INSERT INTO `%DB_PREFIX%deal` VALUES ('57','桥亭活鱼小镇 仅售88元！价值100元的代金券1张','88元桥亭活鱼小镇代金券','8','23','','<div align=\"center\"><p><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/14/54ed69afb8e5a.jpg\" alt=\"\" border=\"0\" /></p>\r\n</div>\r\n','1422745375','1590361380','0','-2','0','2','150.0000','88.0000','15','1','0','1','0','1','1','1','1','0','0','0.0000','10','仅售88元！价值100元的代金券1张，除店内活动时的特价菜外全场通用，可叠加使用，可免费使用包间，提供免费WiFi。健康活鱼入馔，美味丝丝入扣，妙法烹佳肴，鲜满乾坤！。','1','10','1424819057','1','7','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','5','5.0000','1424819057','1424820337','ux26725ux20141,ux20195ux37329ux21048,ux20165ux21806,ux23567ux38215,ux20215ux20540,ux49ux48ux48,ux26725ux20141ux27963ux40060ux23567ux38215ux20165ux21806ux56ux56ux20803ux65281ux20215ux20540ux49ux48ux48ux20803ux30340ux20195ux37329ux21048ux49ux24352','桥亭,代金券,仅售,小镇,价值,100,桥亭活鱼小镇 仅售88元！价值100元的代金券1张','ux39184ux39278ux32654ux39135,ux19996ux21271ux33756,ux24029ux33756,ux26085ux26412ux26009ux29702,ux28903ux28900','餐饮美食,东北菜,川菜,日本料理,烧烤','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux19975ux35937,ux51ux57ux49,ux21488ux27743ux21306ux23453ux40857ux19975ux35937ux22478ux52ux27004ux51ux57ux49ux21495,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478,ux26725ux20141,ux26187ux23433ux21306,ux20845ux27004,ux26032ux24215ux38215,ux20013ux24433,ux24433ux38498,ux26049ux36793,ux24191ux22330,ux30334ux24230,ux38899ux20048,ux75ux84ux86,ux26187ux23433ux21306ux26032ux24215ux38215ux20116ux22235ux21271ux27888ux31166ux24191ux22330ux20845ux27004ux65288ux20013ux24433ux24433ux38498ux26049ux65292ux38899ux20048ux45ux30334ux24230ux75ux84ux86ux26049ux36793ux65289,ux40723ux27004ux21306,ux30465ux20307ux32946ux20013ux24515','福建,福州,台江区,宝龙,万象,391,台江区宝龙万象城4楼391号,宝龙城市广场,万象城,桥亭,晋安区,六楼,新店镇,中影,影院,旁边,广场,百度,音乐,KTV,晋安区新店镇五四北泰禾广场六楼（中影影院旁，音乐-百度KTV旁边）,鼓楼区,省体育中心','ux50ux45ux53ux20154ux22871ux39184,ux24773ux20387ux22871ux39184,ux49ux56ux28857ux20197ux21518,ux57ux28857ux33267ux49ux56ux28857','2-5人套餐,情侣套餐,18点以后,9点至18点','119.3323','26.144803','0','0','0','0','1','50.0000','1','0','0','1','1','80','1','<br />\r\n<br />\r\n亲爱的用户，本次团购有效期延长至2015年03月06日，感谢您的支持，祝消费愉快~<br />\r\n<br />\r\n【2月13日更新】【新增不可用日期】商家2015年2月18日至2月20日，厦门乐都汇店、罗宾森店、五缘湾店、漳州龙海店周六、周日、国庆10.1-10.7不可使用美团券无法接待美团用户，给您带来不便，深表歉意。<br />\r\n<br />\r\n','0','0','0','0','1','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('58','石山水代金券 仅售80元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi。','石山水代金券','8','28','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','<p>石山水美式餐厅是隶属于双福集团旗下的一个全球连锁餐饮品牌，源自于1909年美国加利福尼亚州落杉矶西部小镇的一个阳光乡村牛排馆。他们以连锁经营为拓展模式，从自1998年福州五一广场双福楼门店开业以来，在新老客户的支持下，石山水美式餐厅已在福州繁华的各大商圈拥有六家直营连锁店，同时在宁德、泉州晋江和江苏盐城等相继开出连锁加盟店。秉着铸造美式西餐行业品牌的宏伟目标，石山水坚持将美式西餐的概念融入东方餐饮文化，在东西方的融合中，形成了崭新的适合中国人的西餐，开辟出一片新的天地。&nbsp;</p>\r\n<p><br />\r\n</p>\r\n<p align=\"center\"><img src=\"./public/attachment/201502/25/15/54ed773aeab64.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n','1422746309','1582240711','0','5000','0','0','100.0000','80.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','5','仅售80元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi。','2','0','1424819941','1','7','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','0','0','0','','','','0','0','0','0','0','shiss','0','0','0','0','0','0.0000','1424819941','1424829820','ux20195ux37329ux21048,ux21472ux21152,ux20165ux21806,ux20840ux22330,ux23665ux27700,ux36890ux29992,ux20215ux20540,ux20351ux29992,ux25552ux20379,ux20813ux36153,ux30707ux23665ux27700ux20195ux37329ux21048ux20165ux21806ux56ux48ux20803ux65281ux20215ux20540ux49ux48ux48ux20803ux30340ux20195ux37329ux21048ux49ux24352ux65292ux20840ux22330ux36890ux29992ux65292ux21487ux21472ux21152ux20351ux29992ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','代金券,叠加,仅售,全场,山水,通用,价值,使用,提供,免费,石山水代金券 仅售80元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi。','ux39184ux39278ux32654ux39135,ux21654ux21857','餐饮美食,咖啡','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux19996ux34903,ux24433ux22478,ux28023ux23777,ux22823ux21414,ux27004ux65288,ux40723ux27004ux21306ux19996ux34903ux49ux52ux21495ux38397ux36745ux22823ux21414ux49ux27004ux65288ux36817ux28023ux23777ux24433ux22478ux65289,ux20116ux19968ux24191ux22330,ux19996ux34903ux21475','福建,福州,鼓楼区,东街,影城,海峡,大厦,楼（,鼓楼区东街14号闽辉大厦1楼（近海峡影城）,五一广场,东街口','','','119.307134','26.092442','0','0','0','0','1','50.0000','0','0','0','0','0','16','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('59',' 【万象城/宝龙广场】agogo量贩KTV','agogo量贩KTV','9','29','','<div align=\"center\"><img src=\"./public/attachment/201502/25/15/54ed7b363e1e0.jpg\" alt=\"\" border=\"0\" /></div>\r\n','1422747641','1582587643','0','-1','0','0','336.0000','45.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','5',' 【万象城/宝龙广场】agogo量贩KTV','3','0','1424821293','1','7','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/15/54ed7b363e1e0.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424821293','1424821293','ux23453ux40857,ux19975ux35937,ux37327ux36137,ux24191ux22330,ux97ux103ux111ux103ux111,ux75ux84ux86,ux12304ux19975ux35937ux22478ux47ux23453ux40857ux24191ux22330ux12305ux97ux103ux111ux103ux111ux37327ux36137ux75ux84ux86','宝龙,万象,量贩,广场,agogo,KTV,【万象城/宝龙广场】agogo量贩KTV','ux20241ux38386ux23089ux20048,ux75ux84ux86','休闲娱乐,KTV','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux22235ux27004,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux22235ux27004,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,台江区,宝龙,四楼,广场,工业,城市,193,台江区工业路193号宝龙城市广场四楼,宝龙城市广场','','','119.298093','26.068768','0','0','0','0','1','40.0000','1','0','1','0','0','32','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('61','仅售128元！最高价值392元的贵安温泉休闲一日游套餐，山水怡情，温泉怡身，季节在变，温泉给你的温暖不变','贵安温泉','11','30','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/15/54ed7dcce36b1.jpg\" /></p>\r\n<p align=\"center\">&nbsp;</p>\r\n<ul id=\"yui_3_16_0_1_1424850233122_1924\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424850233122_1923\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>浸香</b><br />\r\n<p style=\"color:#666666;padding-bottom:0px;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:0px;margin:10px 0px;padding-right:0px;\">泡温泉是个慢功夫，浸水也要慢。先用温水淋洗暖身，然后慢慢浸入池中，待泉水到达胸口处时停住，静待3~5分钟，等身体全部暖和起来之后，再泡到肩膀处。浸泡过程中，可尽量呼吸泉水蒸汽（硫磺泉不适用），搭配水果或玫瑰花茶，边喝边泡，让泉水和茶香内外交融渗透，滋养肌肤。</p>\r\n</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>敷面</b><br />\r\n<p style=\"color:#666666;padding-bottom:0px;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:0px;margin:10px 0px;padding-right:0px;\">泡温泉时是护肤的最佳时间，这时的皮肤受热，毛孔张开，最利于养分的吸收，因此泡温泉时携带面膜敷面，可达到事半功倍的美肤效果。面膜功效最好为保湿型，因美白型面膜含酸性成分，使用后可能会造成皮肤泛红。</p>\r\n</li>\r\n<li id=\"yui_3_16_0_1_1424850233122_1930\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>清洁</b><br />\r\n<p id=\"yui_3_16_0_1_1424850233122_1929\" style=\"color:#666666;padding-bottom:0px;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:0px;margin:10px 0px;padding-right:0px;\">温泉清洁包括浸泡前和浸泡后两部分。浸泡前的清洁属于礼貌公德，可以为你的优雅加分；浸泡后的清洁则是由于温泉本身有一定的浓度，如果不及时清洗干净，温泉水会在身上形成结晶，刺激皮肤。</p>\r\n</li>\r\n</ul>\r\n','1424822094','1551052496','0','-1','0','0','392.0000','128.0000','15','1','0','1','0','0','0','1','1','1','1','10.0000','10','山水怡情，温泉怡身，季节在变，温泉给你的温暖不变','4','0','1424822160','0','0','0','0','','0.0000','0','1','0','0.0000','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424822160','1424822160','ux28201ux27849,ux24609ux24773,ux19968ux26085ux28216,ux20165ux21806,ux22871ux39184,ux23665ux27700,ux19981ux21464,ux23395ux33410,ux28201ux26262,ux26368ux39640,ux20165ux21806ux49ux50ux56ux20803ux65281ux26368ux39640ux20215ux20540ux51ux57ux50ux20803ux30340ux36149ux23433ux28201ux27849ux20241ux38386ux19968ux26085ux28216ux22871ux39184ux65292ux23665ux27700ux24609ux24773ux65292ux28201ux27849ux24609ux36523ux65292ux23395ux33410ux22312ux21464ux65292ux28201ux27849ux32473ux20320ux30340ux28201ux26262ux19981ux21464','温泉,怡情,一日游,仅售,套餐,山水,不变,季节,温暖,最高,仅售128元！最高价值392元的贵安温泉休闲一日游套餐，山水怡情，温泉怡身，季节在变，温泉给你的温暖不变','ux37202ux24215ux26053ux28216,ux21608ux36793ux28216','酒店旅游,周边游','','','ux31119ux24314,ux31119ux24030,ux36830ux27743ux21439,ux28504ux28193,ux36830ux27743,ux23433ux26449,ux36830ux27743ux21439ux36830ux27743ux28504ux28193ux20065ux36149ux23433ux26449ux36149ux27915ux36335,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330','福建,福州,连江县,潘渡,连江,安村,连江县连江潘渡乡贵安村贵洋路,鼓楼区,五一广场','','','119.416354','26.227042','0','0','0','0','1','100.0000','1','1','1','1','0','98','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('62','仅售590元！价值748元的国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游，每日发团，不限出团人数。福州国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游！','厦门、永定土楼二日游','11','31','./public/attachment/201502/25/16/54ed832bd819e.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed832bd819e.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424851034114_1516\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424851034114_1515\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">发团时间：每日发团；预约出团人数：不限</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">已包含导游费；包含早餐1次+午餐2次，不包含晚餐</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">包含入住酒店1晚；方案已包含往返车费</li>\r\n<li style=\"list-style-type:none;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">行程安排：</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">集合时间：早上7：10；集合地点：福州火车站（北站）一楼广场大钟下</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>南普陀寺</b><br />\r\n交通方式：步行；游玩时长：50分钟<br />\r\n介绍：参观天王殿、钟鼓楼、大雄宝殿、大悲殿等</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>鼓浪屿</b><br />\r\n交通方式：步行；游玩时长：1.5小时<br />\r\n介绍：步行平等路，欣赏万国建筑博览群</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>菽庄花园</b><br />\r\n交通方式：步行；游玩时长：70分钟<br />\r\n介绍：游览内设中国唯一钢琴博物馆的菽庄花园，园内分为补山园和藏海园两部分，造景有十二洞天、四十四桥、听涛轩等</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>承启楼</b><br />\r\n交通方式：步行；游玩时长：1小时<br />\r\n介绍：该楼于2010年6月12日入选世界吉尼斯记录——世界上环数最多的土楼，其规模宏大，造型奇特，于1981年被收入《中华名胜词典》，同年被列入《世界建筑史》，1986年，国家邮电部发行的一组中国民居系列邮票，其中福建土楼民居邮票就是以承启楼为图案的，该邮票在日本被评为当年最佳邮票</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>侨福楼</b><br />\r\n交通方式：步行；游玩时长：0.5小时<br />\r\n介绍：又名博士楼</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>五云楼</b><br />\r\n交通方式：步行；游玩时长：0.5小时<br />\r\n介绍：俗称不倒楼，特点是没有石砌墙基</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>世泽楼</b><br />\r\n交通方式：步行；游玩时长：0.5小时</li>\r\n</ul>\r\n','1424822690','1519517091','0','-1','0','0','748.0000','590.0000','15','1','0','1','0','0','0','1','1','0','0','10.0000','10','【福州】厦门、永定土楼二日游','5','0','1424822751','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed832bd819e.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424822751','1424822994','ux21271ux26449,ux40723ux28010ux23679,ux27704ux23450,ux20108ux26085,ux22303ux27004,ux21414ux38376,ux26053ux34892ux31038,ux25552ux20379,ux22269ux38469,ux31119ux24030,ux20165ux21806ux53ux57ux48ux20803ux65281ux20215ux20540ux55ux52ux56ux20803ux30340ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux21414ux38376ux65288ux40723ux28010ux23679ux65289ux12289ux27704ux23450ux65288ux39640ux21271ux26449ux65289ux22303ux27004ux21452ux21160ux20108ux26085ux28216ux65292ux27599ux26085ux21457ux22242ux65292ux19981ux38480ux20986ux22242ux20154ux25968ux12290ux31119ux24030ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux21414ux38376ux65288ux40723ux28010ux23679ux65289ux12289ux27704ux23450ux65288ux39640ux21271ux26449ux65289ux22303ux27004ux21452ux21160ux20108ux26085ux28216ux65281','北村,鼓浪屿,永定,二日,土楼,厦门,旅行社,提供,国际,福州,仅售590元！价值748元的国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游，每日发团，不限出团人数。福州国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游！','ux37202ux24215ux26053ux28216,ux22269ux20869ux28216','酒店旅游,国内游','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','','','119.317071','26.081434','0','0','0','0','1','400.0000','1','1','1','0','0','546','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('63','仅售180元！价值308元的国际旅行社提供的天门山度假村漂流一日游（含往返大巴接送），每日发团，不限出团人数。','天门山度假村漂流一日游','11','31','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','<p><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/15/54ed80bf64ba6.jpg\" /></p>\r\n<p style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><p id=\"yui_3_16_0_1_1424851111192_1395\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">&nbsp;</p>\r\n','0','0','0','-1','0','0','308.0000','180.0000','15','1','0','1','0','0','0','1','1','0','0','10.0000','10','【福州】天门山度假村漂流一日游','6','0','1424822930','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424822930','1424827187','ux22825ux38376,ux24230ux20551ux26449,ux25509ux36865,ux22823ux24052,ux19968ux26085ux28216,ux20165ux21806,ux24448ux36820,ux28418ux27969,ux26053ux34892ux31038,ux20154ux25968,ux20165ux21806ux49ux56ux48ux20803ux65281ux20215ux20540ux51ux48ux56ux20803ux30340ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux22825ux38376ux23665ux24230ux20551ux26449ux28418ux27969ux19968ux26085ux28216ux65288ux21547ux24448ux36820ux22823ux24052ux25509ux36865ux65289ux65292ux27599ux26085ux21457ux22242ux65292ux19981ux38480ux20986ux22242ux20154ux25968ux12290','天门,度假村,接送,大巴,一日游,仅售,往返,漂流,旅行社,人数,仅售180元！价值308元的国际旅行社提供的天门山度假村漂流一日游（含往返大巴接送），每日发团，不限出团人数。','ux37202ux24215ux26053ux28216,ux21608ux36793ux28216','酒店旅游,周边游','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','','','119.317071','26.081434','0','0','0','0','1','150.0000','1','1','1','1','0','98','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('71','仅售1元！价值399元的异域风情，提供免费WiFi。','美丽人生','10','35','./public/attachment/201502/25/17/54ed9486611f6.jpg','<p><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/17/54ed9486611f6.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424856148625_1680\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424856148625_1683\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄类型：</b>个人写真</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄背景：</b>纯内景2组（拍摄地点：店内影棚，拍摄时长：3小时）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服装造型：</b>提供服装2套/人，指定部分可选，可选范围：异域风情（美人图 无双艳后）+时尚装，最多可自带服装1套/人，自带服装计入总数内</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>化妆造型：</b>提供整体妆面1次/人，造型2组/人</li>\r\n<li id=\"yui_3_16_0_1_1424856148625_1686\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b id=\"yui_3_16_0_1_1424856148625_1685\">造型用品：</b>免费提供假睫毛1对；不免费提供精华素，如需，店内收费88元/瓶，可自带，不收取服务费；不免费提供隐形内衣，如需，店内收费128元/件，可自带</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服务人员：</b>摄影师1名+化妆师1名</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄精修：</b>拍摄至少40张，精修3张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>底片赠送：</b>不赠送原始底片；赠送至少3张精修底片；赠送方式：美团会员自带U盘拷走</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>其余底片：</b>赠送张数之外如需购买，原始底片20元/张，精修底片30元/张，入册40元/张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>赠品：</b><br />\r\n7寸韩国水晶摆台1个<br />\r\n36寸海报1张</li>\r\n</ul>\r\n','0','0','0','-1','0','0','399.0000','1.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【东街口】美丽人生摄影工作室','13','0','1424827956','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed9486611f6.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424827956','1424827986','ux24322ux22495ux39118ux24773,ux20165ux21806,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux51ux57ux57,ux20165ux21806ux49ux20803ux65281ux20215ux20540ux51ux57ux57ux20803ux30340ux24322ux22495ux39118ux24773ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','异域风情,仅售,价值,提供,免费,WiFi,399,仅售1元！价值399元的异域风情，提供免费WiFi。','ux29983ux27963ux26381ux21153,ux20010ux24615ux20889ux30495','生活服务,个性写真','','','ux31119ux24314,ux31119ux24030,ux26472ux26725,ux40723ux27004ux21306,ux19996ux34903ux21475,ux20132ux27719ux22788,ux20803ux24069,ux24448ux22238,ux20844ux36710,ux36335ux21475,ux32593ux21543,ux19996ux26041,ux40723ux27004ux21306ux19996ux34903ux21475ux26472ux26725ux36335ux19982ux20803ux24069ux36335ux36335ux21475ux20132ux27719ux22788ux50ux27004ux65288ux20844ux36710ux20392ux38596ux31449ux19979ux24448ux22238ux36208ux19996ux26041ux32593ux21543ux19978ux50ux27004ux65289,ux21488ux27743ux21306,ux20013ux20141ux34903,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,杨桥,鼓楼区,东街口,交汇处,元帅,往回,公车,路口,网吧,东方,鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）,台江区,中亭街,晋安区,王庄新村','','','119.300928','26.091942','0','0','0','0','1','10.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('64','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。','龙中龙男士棉服','0','32','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','<p><img src=\"./public/attachment/201502/25/16/54ed83366e824.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/16/54ed834236570.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/16/54ed834a0a82c.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n','0','0','0','-2','0','0','398.0000','69.0000','0','0','1','1','0','1','1','1','1','0','0','0.0000','0','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。','6','11','1424823096','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','0','0','0','','','','0','0','0','0','0','','0','0','31','1','0','0.0000','1424823096','1424824411','ux20013ux40857,ux33073ux21368,ux26825ux26381,ux21152ux21402,ux26825ux34915,ux20445ux26262,ux20165ux21806,ux22806ux22871,ux30007ux22763,ux20215ux20540,ux20165ux21806ux54ux57ux20803ux65281ux20215ux20540ux51ux57ux56ux20803ux30340ux40857ux20013ux40857ux30007ux22763ux26825ux26381ux49ux20214ux65292ux21487ux33073ux21368ux24125ux20445ux26262ux21152ux21402ux26825ux34915ux65292ux38738ux24180ux20241ux38386ux22806ux22871ux12290,ux40857ux20013ux40857','中龙,脱卸,棉服,加厚,棉衣,保暖,仅售,外套,男士,价值,仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。,龙中龙','','','ux26381ux35013,ux30007ux35013','服装,男装','ux40723ux27004ux21306,ux31119ux24030ux24191ux22330','鼓楼区,福州广场','ux40657ux33394,ux26837ux33394,ux23567ux30721,ux22823ux30721,ux22343ux30721','黑色,棕色,小码,大码,均码','','','16','0','0','0','1','50.0000','1','0','0','0','1','64','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('65','仅售758元！价值838元的福建春秋国际旅行社提供的泰宁大金湖+寨下大峡谷+玉华洞+尚书第双动二日游，详询商家，不限出团人数','泰宁大金湖','11','31','./public/attachment/201502/25/16/54ed84087507c.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed84087507c.jpg\" /></p>\r\n<p style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\" align=\"left\"><br />\r\n介绍：参考车次：福州站D2242（07：00/08：43） D6502（08：30/10：20） D2226（08：42/10：39） 早动车站集中后，客人自行前往泰宁动车站，导游泰宁站接团送【泰宁古城】，参观状元文化主题铜雕群，领略泰宁古城的历史变迁，感受“汉唐古镇、两宋名城”之风韵。触摸2200年的风雨沧桑，还可以在红军街上追忆工农红军三进三出的烽火岁月，可以参观明朝兵部尚书李春烨的深宅大院中品味“江南第一民居“【尚书第】。下午适时赴国家5A级景区、世界自然遗产的核心品牌——【大金湖景区】（行程约20分钟，游览约4小时），登岸游览“野趣园水际瀑布”、一柱插地不假片瓦的南方悬空寺“甘露寺”、陆地一线天；船游金湖观大赤壁、“仙”“寿”呈祥天书真迹。游览结束后导游将游客送返酒店。<br />\r\n寨下大峡谷 +玉华洞（第二天）<br />\r\n交通方式：动车；游玩时长：1天<br />\r\n介绍：参考车次：将乐站D6509（16：44/18：27）D2225（20：43/22：29） 早餐后游览世界地质公园的样板景区--【寨下大峡谷62】(游览时间2.5小时左右）（悬天峡、通天峡、倚天峡、天穹岩、问天岩、山崩地裂、堰塞湖）这是万谷归一的地方，可以毫不夸张地说：寨下归来不看谷。联合国教科文组织专家评价其为世界地质公园的样板景区。中餐后国家重点风景名胜区中国四大名洞之一--【玉华洞105】(游览时间2小时左右），誉称形胜甲闽山，人间瑶池景。因洞内岩石洁白如玉，华光四射而得名.体验风声不止的1扇风，观仙人田，硕果累累，擎天柱，鸡冠石，万家灯火，五更天等景点。后 将乐返回泰宁或者三明北站返回，后结束愉快的行程。<br />\r\n请提前电话商家0591-87871567、88999880预约或发预约短信“姓名+手机号人数+游玩日期+验证码”给客服电话13559195537</p>\r\n','0','0','0','-1','0','0','838.0000','758.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【福州】泰宁大金湖','7','0','1424823281','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed84087507c.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424823281','1424826895','ux27888ux23425,ux29577ux21326,ux37329ux28246,ux23578ux20070ux31532,ux20108ux26085,ux31119ux24314,ux22823ux23777ux35895,ux20165ux21806,ux26149ux31179,ux26053ux34892ux31038,ux20165ux21806ux55ux53ux56ux20803ux65281ux20215ux20540ux56ux51ux56ux20803ux30340ux31119ux24314ux26149ux31179ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux27888ux23425ux22823ux37329ux28246ux43ux23528ux19979ux22823ux23777ux35895ux43ux29577ux21326ux27934ux43ux23578ux20070ux31532ux21452ux21160ux20108ux26085ux28216ux65292ux35814ux35810ux21830ux23478ux65292ux19981ux38480ux20986ux22242ux20154ux25968','泰宁,玉华,金湖,尚书第,二日,福建,大峡谷,仅售,春秋,旅行社,仅售758元！价值838元的福建春秋国际旅行社提供的泰宁大金湖+寨下大峡谷+玉华洞+尚书第双动二日游，详询商家，不限出团人数','ux37202ux24215ux26053ux28216,ux33258ux21161ux28216,ux21608ux36793ux28216','酒店旅游,自助游,周边游','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','','','119.317071','26.081434','0','0','0','0','1','700.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('72','仅售1元！价值499元的古装婚纱，提供免费WiFi。','古装婚纱','10','35','./public/attachment/201502/25/17/54ed98ce465fa.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/17/54ed98ce465fa.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424857065793_1468\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424857065793_1467\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄类型：</b>婚纱摄影/古装婚纱摄影</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄背景：</b>纯内景1组（拍摄地点：店内，拍摄时长：约1-2小时）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服装造型：</b>提供服装1套/人，指定部分可选，可选范围：古装任选，最多可自带服装1套/人，自带服装计入总数内</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>化妆造型：</b>提供整体妆面1次/人，造型1组/人</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>造型用品：</b>免费提供假睫毛1对；无精华素服务；无隐形内衣服务</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服务人员：</b>摄影师1名+化妆师1名</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄精修：</b>拍摄至少30张，精修2张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>底片赠送：</b>不赠送原始底片；不赠送精修底片；赠送方式：方维会员自带U盘拷走</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>其余底片：</b>赠送张数之外如需购买，原始底片48元/张，精修底片48元/张，入册58元/张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄成品：</b><br />\r\n3寸精美卡片2张<br />\r\n<font color=\"gray\">※以上成品照片均选自精修</font></li>\r\n</ul>\r\n','1424828591','1488246187','0','-1','0','0','499.0000','1.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【建新镇】经典唐韵','14','0','1424828535','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed98ce465fa.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424828535','1424828633','ux21476ux35013,ux20165ux21806,ux23130ux32433,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux52ux57ux57,ux20165ux21806ux49ux20803ux65281ux20215ux20540ux52ux57ux57ux20803ux30340ux21476ux35013ux23130ux32433ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','古装,仅售,婚纱,价值,提供,免费,WiFi,499,仅售1元！价值499元的古装婚纱，提供免费WiFi。','ux29983ux27963ux26381ux21153,ux23130ux32433ux25668ux24433','生活服务,婚纱摄影','','','ux31119ux24314,ux31119ux24030,ux26472ux26725,ux40723ux27004ux21306,ux19996ux34903ux21475,ux20132ux27719ux22788,ux20803ux24069,ux24448ux22238,ux20844ux36710,ux36335ux21475,ux32593ux21543,ux19996ux26041,ux40723ux27004ux21306ux19996ux34903ux21475ux26472ux26725ux36335ux19982ux20803ux24069ux36335ux36335ux21475ux20132ux27719ux22788ux50ux27004ux65288ux20844ux36710ux20392ux38596ux31449ux19979ux24448ux22238ux36208ux19996ux26041ux32593ux21543ux19978ux50ux27004ux65289,ux21488ux27743ux21306,ux20013ux20141ux34903,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,杨桥,鼓楼区,东街口,交汇处,元帅,往回,公车,路口,网吧,东方,鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）,台江区,中亭街,晋安区,王庄新村','','','119.300928','26.091942','0','0','0','0','1','10.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('66','仅售98元！价值236元的爱丁堡尊贵养生会所单人养生保健套餐，提供免费自助餐+免费上网，男女皆享，节假日通用。','爱丁堡尊贵养生会所','9','33','./public/attachment/201502/25/16/54ed864826695.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed864826695.jpg\" /></p>\r\n','0','0','0','-1','0','0','236.0000','98.0000','15','1','0','1','0','0','0','1','1','0','0','9.0000','9','【紫阳/象园】爱丁堡尊贵养生会所','8','0','1424824020','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed864826695.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824020','1424824051','ux29233ux19969ux22561,ux20813ux36153ux19978ux32593,ux20859ux29983ux20445ux20581,ux33258ux21161ux39184,ux33410ux20551ux26085,ux21333ux20154,ux20165ux21806,ux20250ux25152,ux23562ux36149,ux22871ux39184,ux20165ux21806ux57ux56ux20803ux65281ux20215ux20540ux50ux51ux54ux20803ux30340ux29233ux19969ux22561ux23562ux36149ux20859ux29983ux20250ux25152ux21333ux20154ux20859ux29983ux20445ux20581ux22871ux39184ux65292ux25552ux20379ux20813ux36153ux33258ux21161ux39184ux43ux20813ux36153ux19978ux32593ux65292ux30007ux22899ux30342ux20139ux65292ux33410ux20551ux26085ux36890ux29992ux12290','爱丁堡,免费上网,养生保健,自助餐,节假日,单人,仅售,会所,尊贵,套餐,仅售98元！价值236元的爱丁堡尊贵养生会所单人养生保健套餐，提供免费自助餐+免费上网，男女皆享，节假日通用。','ux20241ux38386ux23089ux20048,ux36275ux30103ux25353ux25705','休闲娱乐,足疗按摩','','','ux31119ux24314,ux31119ux24030,ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','福建,福州,晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','90.0000','0','1','0','0','0','2','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('67','仅售158元！价值236元的精油开背套餐，男女不限，提供免费WiFi。','精油开背套餐','9','33','./public/attachment/201502/25/16/54ed8ec119a62.jpg','<table id=\"yui_3_16_0_1_1424852915047_1346\" class=\"deal-menu\" style=\"border-top:medium none;border-right:medium none;width:702px;white-space:normal;word-spacing:0px;border-collapse:collapse;border-bottom:medium none;text-transform:none;color:#222222;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;border-spacing:0px;border-left:medium none;margin-top:0px;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><tbody id=\"yui_3_16_0_1_1424852915047_1345\"><tr id=\"yui_3_16_0_1_1424852915047_1344\"><th id=\"yui_3_16_0_1_1424852915047_1343\" class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#f0f0f0;\" colspan=\"2\">套餐内容</th>\r\n<th class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">单价</th>\r\n<th class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">数量/规格</th>\r\n<th class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">小计</th>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\" colspan=\"2\">精油开背</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥198</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥198</td>\r\n</tr>\r\n<tr><td class=\"subline subline-left\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px dotted;width:134px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;font-weight:700;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\" rowspan=\"4\"><span class=\"title\" style=\"font-weight:bold;padding-bottom:0px;padding-top:0px;padding-left:0px;padding-right:10px;\">4选1</span></td>\r\n<td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">修脚</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">刮痧</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">拔罐</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">采耳</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"deal-menu-summary\" style=\"white-space:normal;word-spacing:0px;border-bottom:#e8e8e8 1px solid;text-transform:none;color:#666666;padding-bottom:10px;text-align:right;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:10px 0px;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">价值:<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"inline-block worth\" style=\"word-wrap:normal;font-family:arial, sans-serif;min-width:10px;word-break:normal;zoom:1;text-align:left;display:inline-block;padding-right:20px;\">¥236</span>美团价:<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"inline-block worth price\" style=\"word-wrap:normal;font-family:arial, sans-serif;min-width:10px;word-break:normal;zoom:1;font-weight:bold;color:#ea4f01;text-align:left;display:inline-block;padding-right:0px;\">¥158</span></p>\r\n<ul class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">服务流程/时长：精油开背（约70分钟）→修脚/刮痧/拔罐/采耳（4选1）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">提供免费自助餐+免费上网，23:00后过夜需到店另付35元</li>\r\n</ul>\r\n','0','0','0','-1','0','0','236.0000','158.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【五一广场】爱丁堡尊贵养生会所','9','0','1424824226','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed8ed63ee25.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824226','1424825975','ux31934ux27833,ux20165ux21806,ux22871ux39184,ux30007ux22899,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux50ux51ux54,ux49ux53ux56,ux20165ux21806ux49ux53ux56ux20803ux65281ux20215ux20540ux50ux51ux54ux20803ux30340ux31934ux27833ux24320ux32972ux22871ux39184ux65292ux30007ux22899ux19981ux38480ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','精油,仅售,套餐,男女,价值,提供,免费,WiFi,236,158,仅售158元！价值236元的精油开背套餐，男女不限，提供免费WiFi。','ux20241ux38386ux23089ux20048,ux36275ux30103ux25353ux25705','休闲娱乐,足疗按摩','','','ux31119ux24314,ux31119ux24030,ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','福建,福州,晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','100.0000','0','0','0','0','0','4','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('68','仅售228元！最高价值446元的希腊之旅套餐A/希腊之旅套餐B2选1，男女不限，提供免费WiFi。','爱丁堡尊贵养生会所','9','33','./public/attachment/201502/25/16/54ed8e6b70b46.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed864826695.jpg\" /></p>\r\n<br />\r\n<ul class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">希腊之旅套餐B服务流程/时长：全身油推（约100分钟）→修脚/刮痧/拔罐/采耳（4选1）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">提供免费自助餐+免费上网，23:00后过夜需到店另付35元</li>\r\n</ul>\r\n','0','0','0','-1','0','0','446.0000','228.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【五一广场】爱丁堡尊贵养生会所-希腊之旅套餐','10','0','1424824429','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed8e6b70b46.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824429','1424825871','ux24076ux33098,ux22871ux39184,ux20043ux26053,ux20165ux21806,ux30007ux22899,ux26368ux39640,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux20165ux21806ux50ux50ux56ux20803ux65281ux26368ux39640ux20215ux20540ux52ux52ux54ux20803ux30340ux24076ux33098ux20043ux26053ux22871ux39184ux65ux47ux24076ux33098ux20043ux26053ux22871ux39184ux66ux50ux36873ux49ux65292ux30007ux22899ux19981ux38480ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','希腊,套餐,之旅,仅售,男女,最高,价值,提供,免费,WiFi,仅售228元！最高价值446元的希腊之旅套餐A/希腊之旅套餐B2选1，男女不限，提供免费WiFi。','ux20241ux38386ux23089ux20048,ux21654ux21857,ux36275ux30103ux25353ux25705','休闲娱乐,咖啡,足疗按摩','','','ux31119ux24314,ux31119ux24030,ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','福建,福州,晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','200.0000','0','0','0','0','0','4','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('76','仅售24.8元！价值168元的超人新款静音理发器1个，超静音，不夹发，儿童成人皆可用！买就送4个定位梳+润滑油+清洁刷！','超人新款静音理发器','0','33','./public/attachment/201502/26/10/54ee7f7135221.jpg','<p align=\"center\">&nbsp;</p>\r\n<dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">&nbsp;</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">产品咨询</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">商家电话：15922439667；联系时间：09:00-18:00</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送范围</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">全国（除除港澳台、新疆、青海、西藏及偏远地区除外及港澳台地区外）均可配送</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">快递公司</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单使用<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.800bestex.com//\" target=\"_blank\"><b>汇通快运</b></a>（400-956-5656）、<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.zto.cn/\" target=\"_blank\"><b>中通快递</b></a>（400-827-0270）、<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.yundaex.com/\" target=\"_blank\"><b>韵达快递</b></a>（400-821-6789）</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送费用</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单包邮，配送范围内无需再额外支付邮费</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送时间</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">2月10日-25日购买的团购商品会尽全力在3月2日前发出</dd><p align=\"center\"><img alt=\"\" src=\"./public/attachment/201502/26/10/54ee7f7135221.jpg\" border=\"0\" /></p>\r\n','0','0','0','-2','0','0','168.0000','24.8000','0','0','1','1','0','1','1','1','1','0','0','0.0000','0','【包邮】超人新款静音理发器','18','0','1424887626','0','0','0','0','','35.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee7f7135221.jpg','0','1','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424887626','1424893166','ux29702ux21457ux22120,ux38745ux38899,ux28165ux27905ux21047,ux20080ux23601ux36865,ux20165ux21806,ux28070ux28369ux27833,ux36229ux20154,ux26032ux27454,ux21487ux29992,ux25104ux20154,ux20165ux21806ux50ux52ux46ux56ux20803ux65281ux20215ux20540ux49ux54ux56ux20803ux30340ux36229ux20154ux26032ux27454ux38745ux38899ux29702ux21457ux22120ux49ux20010ux65292ux36229ux38745ux38899ux65292ux19981ux22841ux21457ux65292ux20799ux31461ux25104ux20154ux30342ux21487ux29992ux65281ux20080ux23601ux36865ux52ux20010ux23450ux20301ux26803ux43ux28070ux28369ux27833ux43ux28165ux27905ux21047ux65281','理发器,静音,清洁刷,买就送,仅售,润滑油,超人,新款,可用,成人,仅售24.8元！价值168元的超人新款静音理发器1个，超静音，不夹发，儿童成人皆可用！买就送4个定位梳+润滑油+清洁刷！','','','ux25968ux30721ux30005ux22120','数码电器','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','20.0000','1','0','0','0','0','256','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('77','仅售79元！价值299元的大显时尚老人手机1台，钢琴烤漆 锌合金边框 超强震动 3D大喇叭 MP3 收音机 语音王 大字大键大声','大显时尚老人手机','0','33','./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg\" /></p>\r\n','0','0','0','-1','0','0','299.0000','79.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【快递】大显时尚老人手机','19','0','1424890408','0','0','0','0','','1000.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg','0','0','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424890408','1424890408','ux22823ux26174,ux22823ux38190,ux28900ux28422,ux38156ux21512ux37329,ux36793ux26694,ux22823ux23383,ux20165ux21806,ux25910ux38899ux26426,ux38663ux21160,ux21895ux21485,ux20165ux21806ux55ux57ux20803ux65281ux20215ux20540ux50ux57ux57ux20803ux30340ux22823ux26174ux26102ux23578ux32769ux20154ux25163ux26426ux49ux21488ux65292ux38050ux29748ux28900ux28422ux38156ux21512ux37329ux36793ux26694ux36229ux24378ux38663ux21160ux51ux68ux22823ux21895ux21485ux77ux80ux51ux25910ux38899ux26426ux35821ux38899ux29579ux22823ux23383ux22823ux38190ux22823ux22768','大显,大键,烤漆,锌合金,边框,大字,仅售,收音机,震动,喇叭,仅售79元！价值299元的大显时尚老人手机1台，钢琴烤漆 锌合金边框 超强震动 3D大喇叭 MP3 收音机 语音王 大字大键大声','','','ux25968ux30721ux30005ux22120','数码电器','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','50.0000','1','0','0','0','0','128','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('69','仅售102元！价值125元的双人套餐，提供免费WiFi。','双人套餐','8','25','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/14/54ed6f616ffc5.jpg\" /></p>\r\n','1424824851','1488242447','0','-1','0','0','125.0000','102.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【28店通用】盛世经典牛排','11','0','1424824857','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824857','1424826479','ux21452ux20154,ux20165ux21806,ux22871ux39184,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux49ux48ux50,ux49ux50ux53,ux20165ux21806ux49ux48ux50ux20803ux65281ux20215ux20540ux49ux50ux53ux20803ux30340ux21452ux20154ux22871ux39184ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','双人,仅售,套餐,价值,提供,免费,WiFi,102,125,仅售102元！价值125元的双人套餐，提供免费WiFi。','ux39184ux39278ux32654ux39135,ux29980ux28857','餐饮美食,甜点','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux19996ux21306,ux24215ux38754,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux49ux52ux57,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux19996ux21306ux49ux27004ux49ux52ux57ux21495ux24215ux38754,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,台江区,宝龙,东区,店面,广场,工业,城市,193,149,台江区工业路193号宝龙城市广场东区1楼149号店面,宝龙城市广场','','','119.299095','26.068075','0','0','0','0','1','90.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('73','仅售388元！价值899元的福州明视眼镜单人配镜套餐，含全场599元以内镜框1次+全场300元以内镜片1次。','明视眼镜','10','36','./public/attachment/201502/25/17/54ed9b8e44904.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/17/54ed9b8e44904.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424857966175_1421\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">配镜服务包含：镜架/镜片</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">镜架品牌：多品牌；型号：多款；材质：板材等</li>\r\n<li id=\"yui_3_16_0_1_1424857966175_1420\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">镜片品牌：多品牌；型号：多款；材质：树脂；非球面</li>\r\n<li id=\"yui_3_16_0_1_1424857966175_1424\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">适用度数范围：近视800度以内、散光200度以内，不支持老花</li>\r\n</ul>\r\n','1424829400','1519782997','0','-1','0','0','899.0000','388.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【37店通用】明视眼镜','15','0','1424829412','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed9b8e44904.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424829412','1424829463','ux20197ux20869,ux20840ux22330,ux26126ux35270,ux37197ux38236,ux38236ux26694,ux31119ux24030,ux38236ux29255,ux21333ux20154,ux20165ux21806,ux22871ux39184,ux20165ux21806ux51ux56ux56ux20803ux65281ux20215ux20540ux56ux57ux57ux20803ux30340ux31119ux24030ux26126ux35270ux30524ux38236ux21333ux20154ux37197ux38236ux22871ux39184ux65292ux21547ux20840ux22330ux53ux57ux57ux20803ux20197ux20869ux38236ux26694ux49ux27425ux43ux20840ux22330ux51ux48ux48ux20803ux20197ux20869ux38236ux29255ux49ux27425ux12290','以内,全场,明视,配镜,镜框,福州,镜片,单人,仅售,套餐,仅售388元！价值899元的福州明视眼镜单人配镜套餐，含全场599元以内镜框1次+全场300元以内镜片1次。','ux29983ux27963ux26381ux21153,ux37197ux38236','生活服务,配镜','','','ux31119ux24314,ux31119ux24030,ux27743ux36335,ux21488ux27743ux21306,ux19975ux36798,ux37329ux34701ux34903,ux24191ux22330,ux21488ux27743ux21306ux40140ux27743ux36335ux56ux21495ux37329ux34701ux34903ux19975ux36798ux24191ux22330ux19968ux23618ux66ux21306ux51ux55ux21495,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,江路,台江区,万达,金融街,广场,台江区鳌江路8号金融街万达广场一层B区37号,宝龙城市广场','','','119.350423','26.058986','0','0','0','0','1','350.0000','1','0','0','1','0','324','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('74','仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。','镜片代金券','10','36','./public/attachment/201502/25/17/54ed9d05a1020.jpg','<ul id=\"yui_3_16_0_1_1424858312999_1303\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>店内人均消费参考价</b>：200元</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>适用范围</b>：仅适用于镜片</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>店内部分服务价格参考</b>：<br />\r\n品牌镜片（300元/对）</li>\r\n<li id=\"yui_3_16_0_1_1424858312999_1302\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">不限制度数范围</li>\r\n</ul>\r\n','1424829610','1488247208','0','-1','0','0','100.0000','75.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【36店通用】明视眼镜','16','0','1424829616','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed9d05a1020.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424829616','1424829616','ux38236ux29255,ux20195ux37329ux21048,ux21472ux21152,ux20165ux21806,ux29992ux20110,ux20215ux20540,ux20351ux29992,ux24352ux65292ux20165,ux49ux48ux48,ux20165ux21806ux55ux53ux20803ux65281ux20215ux20540ux49ux48ux48ux20803ux30340ux38236ux29255ux20195ux37329ux21048ux49ux24352ux65292ux20165ux36866ux29992ux20110ux38236ux29255ux65292ux21487ux21472ux21152ux20351ux29992ux12290','镜片,代金券,叠加,仅售,用于,价值,使用,张，仅,100,仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。','ux29983ux27963ux26381ux21153,ux37197ux38236','生活服务,配镜','','','ux31119ux24314,ux31119ux24030,ux27743ux36335,ux21488ux27743ux21306,ux19975ux36798,ux37329ux34701ux34903,ux24191ux22330,ux21488ux27743ux21306ux40140ux27743ux36335ux56ux21495ux37329ux34701ux34903ux19975ux36798ux24191ux22330ux19968ux23618ux66ux21306ux51ux55ux21495,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,江路,台江区,万达,金融街,广场,台江区鳌江路8号金融街万达广场一层B区37号,宝龙城市广场','','','119.350423','26.058986','0','0','0','0','1','70.0000','0','1','0','0','0','18','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('75','仅售8.8元！价值38元的色格安卓数据充电线1件，色格 安卓数据充电线 适用于三星等安卓手机！','安卓数据充电线','0','33','./public/attachment/201502/26/09/54ee7e065be04.jpg','<p align=\"center\">&nbsp;</p>\r\n<p align=\"center\">&nbsp;</p>\r\n<dt id=\"yui_3_16_0_1_1424915842939_1873\" style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">商家QQ</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><a title=\"点击这里给我发消息\" style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=915627711&amp;site=qq&amp;menu=yes\" target=\"_blank\">915627711<img style=\"max-width:702px;border-top:0px;border-right:0px;border-bottom:0px;border-left:0px;\" border=\"0\" alt=\"点击这里给我发消息\" src=\"http://wpa.qq.com/pa?p=1:915627711:42\" /></a></dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">产品咨询</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">商家电话：0755-88865446；联系时间：09:00-18:00</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送范围</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">全国（除新疆西藏及港澳台地区外）均可配送</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">快递公司</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单使用<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.sto.cn/\" target=\"_blank\"><b>申通快递</b></a>（400-889-5543）、<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.yto.net.cn/cn/index/index.html\" target=\"_blank\"><b>圆通快递</b></a>（95554/021-69777888）</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送费用</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单邮费5元，购买2件及以上包邮</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送时间</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">2月10日-25日购买的团购商品会尽全力在3月2日前发出</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">售后保障</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">如需退换货，请进入<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.meituan.com/orders\" target=\"_blank\">我的订单</a></dd><p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/09/54ee7e065be04.jpg\" /></p>\r\n','0','0','0','100','0','0','38.0000','8.8000','0','0','1','1','0','0','0','1','1','0','1','0.0000','0','【2件包邮】色格安卓数据充电线','17','0','1424887336','0','0','0','0','','20.0000','1','1','0','0.0000','./public/attachment/201502/26/09/54ee7e065be04.jpg','0','0','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424887336','1424887410','ux23433ux21331,ux30005ux32447,ux26143ux31561,ux25968ux25454,ux20165ux21806,ux29992ux20110,ux20215ux20540,ux25163ux26426,ux56ux46ux56,ux20165ux21806ux56ux46ux56ux20803ux65281ux20215ux20540ux51ux56ux20803ux30340ux33394ux26684ux23433ux21331ux25968ux25454ux20805ux30005ux32447ux49ux20214ux65292ux33394ux26684ux23433ux21331ux25968ux25454ux20805ux30005ux32447ux36866ux29992ux20110ux19977ux26143ux31561ux23433ux21331ux25163ux26426ux65281','安卓,电线,星等,数据,仅售,用于,价值,手机,8.8,仅售8.8元！价值38元的色格安卓数据充电线1件，色格 安卓数据充电线 适用于三星等安卓手机！','','','ux25968ux30721ux30005ux22120','数码电器','','','','','119.339719','26.071564','0','0','0','0','1','5.0000','1','0','0','0','0','256','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('70','仅售49.90元！价值59元的百度烤肉单人自助午餐，提供免费WiFi。全新升级，盛大开业，特价优惠火爆抢购中','百度烤肉','8','26','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg\" /><table id=\"yui_3_16_0_1_1424853702399_1810\" class=\"deal-menu\" style=\"border-top:medium none;border-right:medium none;width:702px;white-space:normal;word-spacing:0px;border-collapse:collapse;border-bottom:medium none;text-transform:none;color:#222222;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;border-spacing:0px;border-left:medium none;margin-top:0px;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><tbody id=\"yui_3_16_0_1_1424853702399_1809\"><tr id=\"yui_3_16_0_1_1424853702399_1808\"><th id=\"yui_3_16_0_1_1424853702399_1807\" class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#f0f0f0;\" colspan=\"2\">套餐内容</th>\r\n<th class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">单价</th>\r\n<th class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">数量/规格</th>\r\n<th class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">小计</th>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\" colspan=\"2\">百度烤肉单人自助午餐</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥59</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1位</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥59</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>\r\n<p class=\"deal-menu-summary\" style=\"white-space:normal;word-spacing:0px;border-bottom:#e8e8e8 1px solid;text-transform:none;color:#666666;padding-bottom:10px;text-align:right;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:10px 0px;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">价值:<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"inline-block worth\" style=\"word-wrap:normal;font-family:arial, sans-serif;min-width:10px;word-break:normal;zoom:1;text-align:left;display:inline-block;padding-right:20px;\">¥59</span>方维价:<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"inline-block worth price\" style=\"word-wrap:normal;font-family:arial, sans-serif;min-width:10px;word-break:normal;zoom:1;font-weight:bold;color:#ea4f01;text-align:left;display:inline-block;padding-right:0px;\">¥49.9</span></p>\r\n<ul class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">百度烤肉单人自助午餐：11:00-14:00</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">最多可用餐1.5小时</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">周六周日需到店另付五元才可使用美团券</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">法定节假日到店另付5元</li>\r\n</ul>\r\n<p align=\"center\">&nbsp;</p>\r\n<p align=\"center\">&nbsp;</p>\r\n','1424824997','1519778598','0','-1','0','0','59.0000','49.9000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【万象城/宝龙广场】百度烤肉','12','0','1424825016','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424825016','1424825016','ux28900ux32905,ux25250ux36141,ux21333ux20154,ux20165ux21806,ux21320ux39184,ux30427ux22823,ux24320ux19994,ux28779ux29190,ux29305ux20215,ux33258ux21161,ux20165ux21806ux52ux57ux46ux57ux48ux20803ux65281ux20215ux20540ux53ux57ux20803ux30340ux30334ux24230ux28900ux32905ux21333ux20154ux33258ux21161ux21320ux39184ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290ux20840ux26032ux21319ux32423ux65292ux30427ux22823ux24320ux19994ux65292ux29305ux20215ux20248ux24800ux28779ux29190ux25250ux36141ux20013','烤肉,抢购,单人,仅售,午餐,盛大,开业,火爆,特价,自助,仅售49.90元！价值59元的百度烤肉单人自助午餐，提供免费WiFi。全新升级，盛大开业，特价优惠火爆抢购中','ux39184ux39278ux32654ux39135,ux28903ux28900','餐饮美食,烧烤','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux19975ux35937,ux35266ux20809ux30005ux26799,ux65ux71ux79ux71ux79ux75ux84ux86,ux27004ux65288,ux21488ux27743ux21306ux19975ux35937ux22478ux53ux27004ux65288ux35266ux20809ux30005ux26799ux30452ux19978ux53ux27004ux65ux71ux79ux71ux79ux75ux84ux86ux26049ux65289,ux23453ux40857ux22478ux24066ux24191ux22330,ux21338ux32654ux35799ux37030','福建,福州,台江区,万象,观光电梯,AGOGOKTV,楼（,台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）,宝龙城市广场,博美诗邦','','','119.296641','26.070661','0','0','0','0','1','40.0000','0','1','0','0','0','6','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('78','仅售299元！价值499元的奥克斯5Ｌ开水瓶1台，奥克斯 HX-8063电热水瓶不锈钢六段保温5l开水瓶','奥克斯5Ｌ开水瓶','0','33','./public/attachment/201502/26/10/54ee8af92fc7a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8af92fc7a.jpg\" /></p>\r\n','0','0','0','-1','0','0','499.0000','299.0000','0','0','0','1','0','0','0','1','1','0','0','0.0000','0','【包邮】奥克斯5Ｌ开水瓶','20','0','1424890516','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8af92fc7a.jpg','0','0','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424890516','1424890533','ux24320ux27700ux29942,ux22885ux20811ux26031,ux20845ux27573,ux28909ux27700ux29942,ux20165ux21806,ux20445ux28201,ux19981ux38152ux38050,ux20215ux20540,ux56ux48ux54ux51,ux50ux57ux57,ux20165ux21806ux50ux57ux57ux20803ux65281ux20215ux20540ux52ux57ux57ux20803ux30340ux22885ux20811ux26031ux53ux65324ux24320ux27700ux29942ux49ux21488ux65292ux22885ux20811ux26031ux72ux88ux45ux56ux48ux54ux51ux30005ux28909ux27700ux29942ux19981ux38152ux38050ux20845ux27573ux20445ux28201ux53ux108ux24320ux27700ux29942','开水瓶,奥克斯,六段,热水瓶,仅售,保温,不锈钢,价值,8063,299,仅售299元！价值499元的奥克斯5Ｌ开水瓶1台，奥克斯 HX-8063电热水瓶不锈钢六段保温5l开水瓶','','','ux25968ux30721ux30005ux22120','数码电器','','','','','119.339719','26.071564','0','0','0','0','1','250.0000','1','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('79','仅售39元！价值69元的梦舒纷高领打底衫1件，2014年新款简约大方，高端定制面料 ，百搭款式，秋冬美女必备打底衫，成就自己的美丽，就从这开始....','梦舒纷高领打底衫','0','33','./public/attachment/201502/26/10/54ee8b9b7587f.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8b9b7587f.jpg\" /></p>\r\n','0','0','0','-1','0','0','69.0000','39.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】梦舒纷高领打底衫','21','0','1424890686','0','0','0','0','','500.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8b9b7587f.jpg','0','1','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1424890686','1424890686','ux25171ux24213,ux39640ux39046,ux20165ux21806,ux31616ux32422,ux31179ux20908,ux38754ux26009,ux39640ux31471,ux27454ux24335,ux23450ux21046,ux26032ux27454,ux20165ux21806ux51ux57ux20803ux65281ux20215ux20540ux54ux57ux20803ux30340ux26790ux33298ux32439ux39640ux39046ux25171ux24213ux34923ux49ux20214ux65292ux50ux48ux49ux52ux24180ux26032ux27454ux31616ux32422ux22823ux26041ux65292ux39640ux31471ux23450ux21046ux38754ux26009ux65292ux30334ux25645ux27454ux24335ux65292ux31179ux20908ux32654ux22899ux24517ux22791ux25171ux24213ux34923ux65292ux25104ux23601ux33258ux24049ux30340ux32654ux20029ux65292ux23601ux20174ux36825ux24320ux22987ux46ux46ux46ux46','打底,高领,仅售,简约,秋冬,面料,高端,款式,定制,新款,仅售39元！价值69元的梦舒纷高领打底衫1件，2014年新款简约大方，高端定制面料 ，百搭款式，秋冬美女必备打底衫，成就自己的美丽，就从这开始....','','','ux26381ux35013,ux22899ux35013','服装,女装','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','30.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('80','仅售125元！价值698元的冰爱长袖针织披肩1件，冰爱长袖针织披肩10-披肩','冰爱长袖针织披肩','0','33','./public/attachment/201502/26/10/54ee8c072cb42.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8c072cb42.jpg\" /></p>\r\n','0','0','0','-1','0','0','698.0000','126.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】冰爱长袖针织披肩','22','0','1424890798','0','0','0','0','','250.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8c072cb42.jpg','0','1','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1424890798','1424890798','ux25259ux32937,ux38271ux34966,ux38024ux32455,ux20165ux21806,ux20215ux20540,ux54ux57ux56,ux49ux50ux53,ux49ux48,ux20165ux21806ux49ux50ux53ux20803ux65281ux20215ux20540ux54ux57ux56ux20803ux30340ux20912ux29233ux38271ux34966ux38024ux32455ux25259ux32937ux49ux20214ux65292ux20912ux29233ux38271ux34966ux38024ux32455ux25259ux32937ux49ux48ux45ux25259ux32937','披肩,长袖,针织,仅售,价值,698,125,10,仅售125元！价值698元的冰爱长袖针织披肩1件，冰爱长袖针织披肩10-披肩','','','ux26381ux35013,ux22899ux35013','服装,女装','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','100.0000','1','0','0','0','0','320','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('81','仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫','魅货莫代尔不规则衫','0','33','./public/attachment/201502/26/11/54ee8c68e932a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8c68e932a.jpg\" /></p>\r\n','0','0','0','-1','0','0','99.0000','39.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】魅货莫代尔不规则衫','23','0','1424890893','0','0','0','0','','190.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8c68e932a.jpg','0','1','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1424890893','1424890893','ux19981ux35268ux21017,ux24320ux34923,ux33707ux20195ux23572,ux20165ux21806,ux20215ux20540,ux20165ux21806ux51ux57ux20803ux65281ux20215ux20540ux57ux57ux20803ux30340ux39749ux36135ux33707ux20195ux23572ux19981ux35268ux21017ux34923ux49ux20214ux65292ux39749ux36135ux33707ux20195ux23572ux19981ux35268ux21017ux24320ux34923','不规则,开衫,莫代尔,仅售,价值,仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫','','','ux26381ux35013,ux22899ux35013','服装,女装','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','30.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('82','仅售59.8元！价值103.2元的影响孩子的四大名著1套，影响孩子的四大名著4册1套、每册155页、16开、每页都有彩图','影响孩子的四大名著','0','33','./public/attachment/201502/26/11/54ee8d61e43bd.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8d61e43bd.jpg\" /></p>\r\n','0','0','0','-1','0','0','103.2000','59.8000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】影响孩子的四大名著','24','0','1424891147','0','0','0','0','','180.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8d61e43bd.jpg','0','0','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891147','1424891147','ux22235ux22823ux21517ux33879,ux23401ux23376,ux24433ux21709,ux24425ux22270,ux20165ux21806,ux20215ux20540,ux49ux48ux51ux46ux50,ux53ux57ux46ux56,ux49ux53ux53,ux20165ux21806ux53ux57ux46ux56ux20803ux65281ux20215ux20540ux49ux48ux51ux46ux50ux20803ux30340ux24433ux21709ux23401ux23376ux30340ux22235ux22823ux21517ux33879ux49ux22871ux65292ux24433ux21709ux23401ux23376ux30340ux22235ux22823ux21517ux33879ux52ux20876ux49ux22871ux12289ux27599ux20876ux49ux53ux53ux39029ux12289ux49ux54ux24320ux12289ux27599ux39029ux37117ux26377ux24425ux22270','四大名著,孩子,影响,彩图,仅售,价值,103.2,59.8,155,仅售59.8元！价值103.2元的影响孩子的四大名著1套，影响孩子的四大名著4册1套、每册155页、16开、每页都有彩图','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','50.0000','1','0','0','0','0','512','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('83','仅售9.9元！价值59元的骥龙免洗宝宝饭兜1件，加厚设计 防止食物吐出掉落 材质安全柔软 贴心舒适人性化弧度 让宝宝感受不到束缚 耐用易清洁 是宝宝吃饭喝汤的好帮手 3色可选 购买4只送1只 赠品颜色随机','骥龙免洗宝宝饭兜','0','33','./public/attachment/201502/26/11/54ee8e0243272.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8e0243272.jpg\" /></p>\r\n','0','0','0','-1','0','0','59.0000','9.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【2件包邮】骥龙免洗宝宝饭兜','25','0','1424891298','0','0','0','0','','200.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8e0243272.jpg','0','0','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891298','1424891298','ux23453ux23453,ux21152ux21402,ux24359ux24230,ux25481ux33853,ux32784ux29992,ux36192ux21697,ux20165ux21806,ux24110ux25163,ux20154ux24615ux21270,ux36148ux24515,ux20165ux21806ux57ux46ux57ux20803ux65281ux20215ux20540ux53ux57ux20803ux30340ux39589ux40857ux20813ux27927ux23453ux23453ux39277ux20828ux49ux20214ux65292ux21152ux21402ux35774ux35745ux38450ux27490ux39135ux29289ux21520ux20986ux25481ux33853ux26448ux36136ux23433ux20840ux26580ux36719ux36148ux24515ux33298ux36866ux20154ux24615ux21270ux24359ux24230ux35753ux23453ux23453ux24863ux21463ux19981ux21040ux26463ux32538ux32784ux29992ux26131ux28165ux27905ux26159ux23453ux23453ux21507ux39277ux21917ux27748ux30340ux22909ux24110ux25163ux51ux33394ux21487ux36873ux36141ux20080ux52ux21482ux36865ux49ux21482ux36192ux21697ux39068ux33394ux38543ux26426','宝宝,加厚,弧度,掉落,耐用,赠品,仅售,帮手,人性化,贴心,仅售9.9元！价值59元的骥龙免洗宝宝饭兜1件，加厚设计 防止食物吐出掉落 材质安全柔软 贴心舒适人性化弧度 让宝宝感受不到束缚 耐用易清洁 是宝宝吃饭喝汤的好帮手 3色可选 购买4只送1只 赠品颜色随机','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','9.0000','1','0','0','0','0','128','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('84','仅售19.9元！价值99元的奥兰奇儿童动物书包1个，可爱卡通书包，让宝宝爱上学习！','奥兰奇儿童动物书包','0','33','./public/attachment/201502/26/11/54ee8e5a53e8a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8e5a53e8a.jpg\" /></p>\r\n','0','0','0','-1','0','0','99.0000','189.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】奥兰奇儿童动物书包','26','0','1424891383','0','0','0','0','','350.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8e5a53e8a.jpg','0','0','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891383','1424891383','ux21345ux36890ux20070,ux20165ux21806,ux20070ux21253,ux21160ux29289,ux29233ux19978,ux20215ux20540,ux21487ux29233,ux23453ux23453,ux20799ux31461,ux23398ux20064,ux20165ux21806ux49ux57ux46ux57ux20803ux65281ux20215ux20540ux57ux57ux20803ux30340ux22885ux20848ux22855ux20799ux31461ux21160ux29289ux20070ux21253ux49ux20010ux65292ux21487ux29233ux21345ux36890ux20070ux21253ux65292ux35753ux23453ux23453ux29233ux19978ux23398ux20064ux65281','卡通书,仅售,书包,动物,爱上,价值,可爱,宝宝,儿童,学习,仅售19.9元！价值99元的奥兰奇儿童动物书包1个，可爱卡通书包，让宝宝爱上学习！','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','15.0000','1','0','0','0','0','192','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('85','仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！','励高早教胎教故事机','0','33','./public/attachment/201502/26/11/54ee8ea70c607.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8ea70c607.jpg\" /></p>\r\n','0','0','0','-1','0','0','268.0000','69.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】励高早教胎教故事机','27','0','1424891461','0','0','0','0','','700.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8ea70c607.jpg','0','1','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891461','1424891461','ux23453ux36523,ux26089ux25945,ux33453ux27604,ux30005ux25239,ux25554ux21345,ux39640ux20445ux30495,ux32974ux25945,ux26126ux28783,ux32858ux21512ux29289,ux29233ux19981ux37322ux25163,ux20165ux21806ux54ux56ux20803ux65281ux20215ux20540ux50ux57ux56ux20803ux30340ux21169ux39640ux26089ux25945ux32974ux25945ux25925ux20107ux26426ux49ux20010ux65292ux20869ux32622ux39640ux28165ux20016ux23500ux26089ux25945ux36164ux28304ux20869ux23481ux65292ux21487ux25554ux21345ux25193ux20805ux20869ux23384ux23481ux37327ux65292ux20805ux30005ux25239ux25684ux65292ux26126ux28783ux23433ux25242ux65292ux39640ux20445ux30495ux72ux73ux70ux73ux21895ux21485ux65292ux32858ux21512ux29289ux30005ux27744ux65292ux20351ux29992ux26102ux38388ux38271ux65292ux21152ux19978ux36229ux33804ux36896ux22411ux65292ux35753ux23401ux23376ux20204ux29233ux19981ux37322ux25163ux12290ux33453ux27604ux22920ux21674ux20204ux36214ux24555ux25226ux22905ux24102ux21040ux23453ux23453ux36523ux36793ux21543ux65281','宝身,早教,芭比,电抗,插卡,高保真,胎教,明灯,聚合物,爱不释手,仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','60.0000','1','0','0','0','0','192','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('86','仅售8.9元！价值39元的下曹吸盘收纳置物架1个，双吸盘设计，瓷砖.不锈钢等光滑平整表面都可放置，可挂浴室墙上，也可挂水槽上','下曹吸盘收纳置物架','0','33','./public/attachment/201502/26/11/54ee903778026.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee903778026.jpg\" /></p>\r\n','0','0','0','-1','0','0','39.0000','8.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【2件包邮】下曹吸盘收纳置物架','28','0','1424891867','0','0','0','0','','100.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee903778026.jpg','0','0','0','','','','0','0','0','0','0','','0','0','27','1','0','0.0000','1424891867','1424891867','ux21560ux30424,ux32622ux29289ux26550,ux27700ux27133,ux25910ux32435,ux24179ux25972,ux29943ux30742,ux20165ux21806,ux20809ux28369,ux25918ux32622,ux28020ux23460,ux20165ux21806ux56ux46ux57ux20803ux65281ux20215ux20540ux51ux57ux20803ux30340ux19979ux26361ux21560ux30424ux25910ux32435ux32622ux29289ux26550ux49ux20010ux65292ux21452ux21560ux30424ux35774ux35745ux65292ux29943ux30742ux46ux19981ux38152ux38050ux31561ux20809ux28369ux24179ux25972ux34920ux38754ux37117ux21487ux25918ux32622ux65292ux21487ux25346ux28020ux23460ux22681ux19978ux65292ux20063ux21487ux25346ux27700ux27133ux19978','吸盘,置物架,水槽,收纳,平整,瓷砖,仅售,光滑,放置,浴室,仅售8.9元！价值39元的下曹吸盘收纳置物架1个，双吸盘设计，瓷砖.不锈钢等光滑平整表面都可放置，可挂浴室墙上，也可挂水槽上','','','ux23478ux23621ux26085ux29992','家居日用','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','8.0000','1','0','0','0','0','192','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('87','仅售14.9元！价值66元的雨含浴室防滑垫1张，透明材质，环保无毒，两色可选，带吸盘，选择它给您的家人多一份关爱','雨含浴室防滑垫','0','33','./public/attachment/201502/26/11/54ee909199d43.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee909199d43.jpg\" /></p>\r\n','0','0','0','-1','0','0','66.0000','14.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【2件包邮】雨含浴室防滑垫','29','0','1424891954','0','0','0','0','','259.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee909199d43.jpg','0','1','0','','','','0','0','0','0','0','','0','0','27','1','0','0.0000','1424891954','1424891954','ux20154ux22810,ux38450ux28369ux22443,ux21560ux30424,ux20165ux21806,ux26080ux27602,ux28020ux23460,ux26448ux36136,ux20851ux29233,ux36879ux26126,ux20215ux20540,ux20165ux21806ux49ux52ux46ux57ux20803ux65281ux20215ux20540ux54ux54ux20803ux30340ux38632ux21547ux28020ux23460ux38450ux28369ux22443ux49ux24352ux65292ux36879ux26126ux26448ux36136ux65292ux29615ux20445ux26080ux27602ux65292ux20004ux33394ux21487ux36873ux65292ux24102ux21560ux30424ux65292ux36873ux25321ux23427ux32473ux24744ux30340ux23478ux20154ux22810ux19968ux20221ux20851ux29233','人多,防滑垫,吸盘,仅售,无毒,浴室,材质,关爱,透明,价值,仅售14.9元！价值66元的雨含浴室防滑垫1张，透明材质，环保无毒，两色可选，带吸盘，选择它给您的家人多一份关爱','','','ux23478ux23621ux26085ux29992','家居日用','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','10.0000','1','0','0','0','0','64','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('88','仅售65元！价值168元的克欧克切菜器刨丝器1套，专注于现代高品质厨房家居用品，爱自己，爱家人，爱厨房','克欧克切菜器刨丝器','0','33','./public/attachment/201502/26/11/54ee90ddeed8a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee90ddeed8a.jpg\" /></p>\r\n','0','0','0','-1','0','0','168.0000','65.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】克欧克切菜器刨丝器','30','0','1424892028','0','0','0','0','','360.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee90ddeed8a.jpg','0','1','0','','','','0','0','0','0','0','','0','0','27','1','0','0.0000','1424892028','1424892028','ux27431ux20811,ux21416ux25151,ux20165ux21806,ux39640ux21697ux36136,ux19987ux27880,ux23478ux23621ux29992ux21697,ux23478ux20154,ux20215ux20540,ux33258ux24049,ux29616ux20195,ux20165ux21806ux54ux53ux20803ux65281ux20215ux20540ux49ux54ux56ux20803ux30340ux20811ux27431ux20811ux20999ux33756ux22120ux21032ux19997ux22120ux49ux22871ux65292ux19987ux27880ux20110ux29616ux20195ux39640ux21697ux36136ux21416ux25151ux23478ux23621ux29992ux21697ux65292ux29233ux33258ux24049ux65292ux29233ux23478ux20154ux65292ux29233ux21416ux25151','欧克,厨房,仅售,高品质,专注,家居用品,家人,价值,自己,现代,仅售65元！价值168元的克欧克切菜器刨丝器1套，专注于现代高品质厨房家居用品，爱自己，爱家人，爱厨房','','','ux23478ux23621ux26085ux29992','家居日用','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','60.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('89','128积分即可兑换价值128元的熙悦益智早教卡通狗1个，可爱的卡通小狗 颜色粉嫩又晶莹剔透，宝宝和妈妈一定会一见钟情的！ 装上电池后，启动开关，美妙的音乐响起，小狗的就会闪光，然后开始摇头晃脑的走路，尾巴摇摇，偶尔还会“旺旺”~~非常非常可爱哦，宝贝肯定超喜欢~','熙悦益智早教卡通狗','0','0','./public/attachment/201502/26/14/54eeb7fc4f10f.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb7fc4f10f.jpg\" /></p>\r\n','0','0','0','100','1','1','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-128','【包邮】熙悦益智早教卡通狗','31','0','1424902051','0','0','0','0','','450.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb7fc4f10f.jpg','0','1','0','','','','0','0','0','0','0','','0','3','29','1','0','0.0000','1424902051','1424902051','ux23567ux29399,ux21345ux36890,ux38750ux24120,ux26106ux26106,ux21487ux29233,ux19978ux30005,ux25671ux22836ux26179ux33041,ux31881ux23273,ux26089ux25945,ux26230ux33721ux21076ux36879,ux49ux50ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux49ux50ux56ux20803ux30340ux29081ux24742ux30410ux26234ux26089ux25945ux21345ux36890ux29399ux49ux20010ux65292ux21487ux29233ux30340ux21345ux36890ux23567ux29399ux39068ux33394ux31881ux23273ux21448ux26230ux33721ux21076ux36879ux65292ux23453ux23453ux21644ux22920ux22920ux19968ux23450ux20250ux19968ux35265ux38047ux24773ux30340ux65281ux35013ux19978ux30005ux27744ux21518ux65292ux21551ux21160ux24320ux20851ux65292ux32654ux22937ux30340ux38899ux20048ux21709ux36215ux65292ux23567ux29399ux30340ux23601ux20250ux38378ux20809ux65292ux28982ux21518ux24320ux22987ux25671ux22836ux26179ux33041ux30340ux36208ux36335ux65292ux23614ux24052ux25671ux25671ux65292ux20598ux23572ux36824ux20250ux8220ux26106ux26106ux8221ux126ux126ux38750ux24120ux38750ux24120ux21487ux29233ux21734ux65292ux23453ux36125ux32943ux23450ux36229ux21916ux27426ux126','小狗,卡通,非常,旺旺,可爱,上电,摇头晃脑,粉嫩,早教,晶莹剔透,128积分即可兑换价值128元的熙悦益智早教卡通狗1个，可爱的卡通小狗 颜色粉嫩又晶莹剔透，宝宝和妈妈一定会一见钟情的！ 装上电池后，启动开关，美妙的音乐响起，小狗的就会闪光，然后开始摇头晃脑的走路，尾巴摇摇，偶尔还会“旺旺”~~非常非常可爱哦，宝贝肯定超喜欢~','','','ux27597ux23156ux29992ux21697','母婴用品','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('90','45积分即可兑换价值199元的韩熙贞气垫BB霜1件，新品首发，裸妆之王，一步到位！1秒定妆，30秒完妆。买一送一（替换装）。','韩熙贞气垫BB霜','0','0','./public/attachment/201502/26/14/54eeb89a12e13.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb89a12e13.jpg\" /></p>\r\n','0','0','0','100','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-45','【包邮】韩熙贞气垫BB霜','32','0','1424902213','0','0','0','0','','350.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb89a12e13.jpg','0','0','0','','','','0','0','0','0','0','','0','3','27','1','0','0.0000','1424902213','1424902213','ux23450ux22918,ux27668ux22443,ux19968ux27493ux21040ux20301,ux25442ux35013,ux20817ux25442,ux39318ux21457,ux26032ux21697,ux21363ux21487,ux31215ux20998,ux20215ux20540,ux52ux53ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux49ux57ux57ux20803ux30340ux38889ux29081ux36126ux27668ux22443ux66ux66ux38684ux49ux20214ux65292ux26032ux21697ux39318ux21457ux65292ux35064ux22918ux20043ux29579ux65292ux19968ux27493ux21040ux20301ux65281ux49ux31186ux23450ux22918ux65292ux51ux48ux31186ux23436ux22918ux12290ux20080ux19968ux36865ux19968ux65288ux26367ux25442ux35013ux65289ux12290','定妆,气垫,一步到位,换装,兑换,首发,新品,即可,积分,价值,45积分即可兑换价值199元的韩熙贞气垫BB霜1件，新品首发，裸妆之王，一步到位！1秒定妆，30秒完妆。买一送一（替换装）。','','','ux23478ux23621ux26085ux29992','家居日用','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('91','19积分即可对话价值19元的媚西蜗牛精华面膜1片，买30片送蜗牛霜1盒！','媚西蜗牛精华面膜','0','0','./public/attachment/201502/26/14/54eeb904b45f9.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb904b45f9.jpg\" /></p>\r\n','0','0','0','100','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-19','【15件包邮】媚西蜗牛精华面膜','33','0','1424902308','0','0','0','0','','10.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb904b45f9.jpg','0','1','0','','','','0','0','0','0','0','','0','3','28','1','0','0.0000','1424902308','1424902308','ux34583ux29275,ux38754ux33180,ux21363ux21487,ux23545ux35805,ux31215ux20998,ux20215ux20540,ux31934ux21326,ux49ux57ux31215ux20998ux21363ux21487ux23545ux35805ux20215ux20540ux49ux57ux20803ux30340ux23194ux35199ux34583ux29275ux31934ux21326ux38754ux33180ux49ux29255ux65292ux20080ux51ux48ux29255ux36865ux34583ux29275ux38684ux49ux30418ux65281','蜗牛,面膜,即可,对话,积分,价值,精华,19积分即可对话价值19元的媚西蜗牛精华面膜1片，买30片送蜗牛霜1盒！','','','ux23621ux23478ux29983ux27963','居家生活','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('92','98积分即可兑换价值519元的如熙甜美蝴蝶结女鞋1双，2色可选！全国包邮！','如熙甜美蝴蝶结女鞋','0','0','./public/attachment/201502/26/14/54eeb973e9527.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb973e9527.jpg\" /></p>\r\n','0','0','0','-1','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-98','【包邮】如熙甜美蝴蝶结女鞋','34','0','1424902413','0','0','0','0','','500.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb973e9527.jpg','0','0','0','','','','0','0','0','0','0','','0','3','25','1','0','0.0000','1424902413','1424902413','ux22899ux38795,ux34676ux34678ux32467,ux20817ux25442,ux29980ux32654,ux21363ux21487,ux31215ux20998,ux20215ux20540,ux20840ux22269,ux21253ux37038ux65281,ux53ux49ux57,ux57ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux53ux49ux57ux20803ux30340ux22914ux29081ux29980ux32654ux34676ux34678ux32467ux22899ux38795ux49ux21452ux65292ux50ux33394ux21487ux36873ux65281ux20840ux22269ux21253ux37038ux65281','女鞋,蝴蝶结,兑换,甜美,即可,积分,价值,全国,包邮！,519,98积分即可兑换价值519元的如熙甜美蝴蝶结女鞋1双，2色可选！全国包邮！','','','ux38795ux24125','鞋帽','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('93','仅598积分即可兑换价值598元的亿巢家纺磨毛四件套1套，精选活性磨毛面料，17款可选。工厂直供，全活性印染无甲醛 ，不起球、不掉色、不缩水！只买对的不买贵的，好品质，不用等待！换个床品过新年吧。','亿巢家纺磨毛四件套','0','0','./public/attachment/201502/26/14/54eeb9e475950.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb9e475950.jpg\" /></p>\r\n','0','0','0','-1','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-598','【包邮】亿巢家纺磨毛四件套','35','0','1424902542','0','0','0','0','','1000.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb9e475950.jpg','0','0','0','','','','0','0','0','0','0','','0','3','27','1','0','0.0000','1424902542','1424902542','ux30952ux27611,ux27963ux24615,ux26080ux30002ux37275,ux36215ux29699,ux25481ux33394,ux23478ux32442,ux32553ux27700,ux20214ux22871,ux20817ux25442,ux21360ux26579,ux20165ux53ux57ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux53ux57ux56ux20803ux30340ux20159ux24034ux23478ux32442ux30952ux27611ux22235ux20214ux22871ux49ux22871ux65292ux31934ux36873ux27963ux24615ux30952ux27611ux38754ux26009ux65292ux49ux55ux27454ux21487ux36873ux12290ux24037ux21378ux30452ux20379ux65292ux20840ux27963ux24615ux21360ux26579ux26080ux30002ux37275ux65292ux19981ux36215ux29699ux12289ux19981ux25481ux33394ux12289ux19981ux32553ux27700ux65281ux21482ux20080ux23545ux30340ux19981ux20080ux36149ux30340ux65292ux22909ux21697ux36136ux65292ux19981ux29992ux31561ux24453ux65281ux25442ux20010ux24202ux21697ux36807ux26032ux24180ux21543ux12290','磨毛,活性,无甲醛,起球,掉色,家纺,缩水,件套,兑换,印染,仅598积分即可兑换价值598元的亿巢家纺磨毛四件套1套，精选活性磨毛面料，17款可选。工厂直供，全活性印染无甲醛 ，不起球、不掉色、不缩水！只买对的不买贵的，好品质，不用等待！换个床品过新年吧。','','','ux23478ux23621ux26085ux29992','家居日用','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
INSERT INTO `%DB_PREFIX%deal` VALUES ('94','仅38积分即可兑换价值38元的灵夕韩版时尚发饰1个，三件起全国包邮！款式大方百搭。送自己送姐妹，时尚百搭，人手必备！','灵夕韩版时尚发饰','0','0','./public/attachment/201502/26/14/54eeba57b9e80.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeba57b9e80.jpg\" /></p>\r\n','0','0','0','-1','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-38','【3件包邮】灵夕韩版时尚发饰','36','0','1424902656','0','0','0','0','','200.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeba57b9e80.jpg','0','0','0','','','','0','0','0','0','0','','0','3','25','1','0','0.0000','1424902656','1424902656','ux26102ux23578,ux21457ux39280,ux20154ux25163,ux20817ux25442,ux27454ux24335,ux24517ux22791,ux22823ux26041,ux21363ux21487,ux22992ux22969,ux31215ux20998,ux20165ux51ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux51ux56ux20803ux30340ux28789ux22805ux38889ux29256ux26102ux23578ux21457ux39280ux49ux20010ux65292ux19977ux20214ux36215ux20840ux22269ux21253ux37038ux65281ux27454ux24335ux22823ux26041ux30334ux25645ux12290ux36865ux33258ux24049ux36865ux22992ux22969ux65292ux26102ux23578ux30334ux25645ux65292ux20154ux25163ux24517ux22791ux65281','时尚,发饰,人手,兑换,款式,必备,大方,即可,姐妹,积分,仅38积分即可兑换价值38元的灵夕韩版时尚发饰1个，三件起全国包邮！款式大方百搭。送自己送姐妹，时尚百搭，人手必备！','','','ux38795ux24125','鞋帽','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0','0','','');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_attr`;
CREATE TABLE `%DB_PREFIX%deal_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品属性名称',
  `goods_type_attr_id` int(11) NOT NULL COMMENT '商品类型ID',
  `price` decimal(20,4) NOT NULL COMMENT '属性增加的额外价格',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `is_checked` tinyint(1) NOT NULL COMMENT '是否配置过该属性的库存',
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_type_attr_id` (`goods_type_attr_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COMMENT='商品属性配置表';
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('258','2-5人套餐','18','20.0000','57','1','10.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('257','情侣套餐','18','0.0000','57','0','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('256','18点以后','17','5.0000','57','1','2.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('255','9点至18点','17','0.0000','57','0','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('273','小码','20','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('272','大码','20','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('271','均码','20','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('270','黑色','19','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('269','棕色','19','0.0000','64','1','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cart`;
CREATE TABLE `%DB_PREFIX%deal_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL COMMENT '当前用户的sessionID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `deal_id` int(11) NOT NULL COMMENT '产品ID',
  `name` text NOT NULL COMMENT '购买的产品显示名称(包含购买的规格)',
  `attr` varchar(255) NOT NULL COMMENT '购买的相关属性的ID，用半角逗号分隔',
  `unit_price` decimal(20,4) NOT NULL COMMENT '单价',
  `number` int(11) NOT NULL COMMENT '数量',
  `total_price` decimal(20,4) NOT NULL COMMENT '总价',
  `verify_code` varchar(255) NOT NULL COMMENT '验证唯一的标识码（由商品ID与属性ID组合加密生成）',
  `create_time` int(11) NOT NULL COMMENT '加入购物车的时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `return_money` decimal(20,4) NOT NULL COMMENT '返现金的单价',
  `return_total_money` decimal(20,4) NOT NULL COMMENT '返现金的总价',
  `return_score` int(11) NOT NULL COMMENT '返积分的单价',
  `return_total_score` int(11) NOT NULL COMMENT '返积分的总价',
  `buy_type` tinyint(1) NOT NULL COMMENT '团购产品的类型（同deal表中的该字段）',
  `sub_name` varchar(255) NOT NULL COMMENT '简短名称',
  `supplier_id` int(11) NOT NULL COMMENT '产品所属的商家ID',
  `attr_str` text NOT NULL COMMENT '属性组合的显示名称',
  `add_balance_price` decimal(20,4) NOT NULL,
`is_pick`  tinyint(1) NOT NULL COMMENT '是否允许上门自提',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM AUTO_INCREMENT=463 DEFAULT CHARSET=utf8 COMMENT='购物车表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate`;
CREATE TABLE `%DB_PREFIX%deal_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `brief` text NOT NULL COMMENT '分类简介',
   `description`  varchar(255) NOT NULL COMMENT '分类描述' ,
  `pid` int(11) NOT NULL COMMENT '父ID，已弃用',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `is_new`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '1为new' ,
  `sort` int(11) NOT NULL COMMENT '排序 由大到小',
  `uname` varchar(255) NOT NULL COMMENT 'url 别名',
  `recommend` tinyint(1) NOT NULL COMMENT '推荐到首页',
  `icon` varchar(255) DEFAULT '' COMMENT '弃用',
  `rec_youhui` tinyint(1) NOT NULL COMMENT '推荐到优惠券首页',
  `rec_daijin` tinyint(1) NOT NULL COMMENT '推荐到代金券首页',
  `iconfont` varchar(15) NOT NULL COMMENT '图标',
  `iconcolor` varchar(15) NOT NULL COMMENT '图标，分类的颜色',
  `icon_img` varchar(255) NOT NULL COMMENT '手机端的分类小图',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='生活服务分类表';
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('8', '餐饮美食', '', '', '0', '0', '1', '0', '1', '', '1', '', '1', '1', '&#58896;', '#a1410d', '');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('9', '亲子游玩', '', '宝贝去哪儿', '0', '0', '1', '0', '2', '', '0', '', '1', '1', '', '#8fc63d', './public/attachment/201602/22/11/56ca8148abf0d.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('10', '婚纱摄影', '', '冬日碧池美食', '0', '0', '1', '0', '3', '', '1', '', '0', '1', '', '#f7941d', './public/attachment/201602/22/11/56ca80ffe5bed.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('11', '温泉', '', '养生好去处', '0', '0', '1', '0', '4', '', '0', '', '0', '1', '', '#00aeef', './public/attachment/201602/22/11/56ca80e00fd7d.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('13', '汽车服务', '', '洗车美容保养', '0', '0', '1', '0', '6', '', '0', '', '0', '1', '', '#004a80', './public/attachment/201602/22/11/56ca80c18b0a4.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('14', '麦霸开唱', '', '嗨歌无极限', '0', '0', '1', '0', '7', '', '0', '', '0', '1', '', '#a763a9', './public/attachment/201602/22/11/56ca80a1f3d10.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('15', '上门洗衣', '', '洗衣9元起', '0', '0', '1', '0', '8', '', '0', '', '0', '1', '', '#9d0a0f', './public/attachment/201602/22/11/56ca808aad159.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('16', '午茶时分', '', '每日满减专区', '0', '0', '1', '0', '9', '', '0', '', '0', '1', '', '#3e6617', './public/attachment/201602/22/11/56ca807411d6d.jpg');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('17', '糖心苹果', '', '精彩不容错过', '0', '0', '1', '0', '10', '', '0', '', '0', '1', '', '#f16522', './public/attachment/201602/22/11/56ca8052b1216.jpg');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type`;
CREATE TABLE `%DB_PREFIX%deal_cate_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '小分类名称',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐标识，推荐到代金券，优惠券首页的相应大分类栏目中',
  `sort` int(11) NOT NULL COMMENT '排序（由大到小）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='生活服务分类子类';
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('1','咖啡','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('2','闽菜','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('3','东北菜','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('4','川菜','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('5','KTV','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('6','自助游','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('7','周边游','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('8','国内游','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('9','海外游','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('10','洗车','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('11','汽车保养','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('12','驾校','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('13','4S店','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('14','音响','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('15','车载导航','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('16','真皮座椅','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('17','打蜡','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('18','男科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('19','妇科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('20','儿科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('21','口腔科','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('22','眼科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('23','体检中心','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('24','心理诊所','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('25','疗养院','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('26','日本料理','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('27','本帮菜','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('28','甜点','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('29','面包','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('30','烧烤','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('31','足疗按摩','0','1');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('32','水上世界','0','2');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('33','运动健身','0','3');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('34','采摘/农家乐','0','4');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('35','婚纱摄影','0','5');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('36','个性写真','0','6');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('37','培训课程','0','7');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('38','西餐','0','8');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('39','配镜','0','9');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_deal_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_deal_link` (
  `deal_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品与生活服务子类的N-N关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('37','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('37','3');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('38','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('39','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('39','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('49','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('50','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('51','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('53','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('55','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('55','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','3');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','26');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('58','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('59','5');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('61','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('62','8');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('63','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('65','6');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('65','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('66','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('67','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('68','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('68','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('69','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('70','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('71','36');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('72','35');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('73','39');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('74','39');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_link` (
  `cate_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生活服务大分类与小分类的关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','3');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','26');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','27');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','38');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','5');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','6');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','32');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','33');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','34');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','35');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','36');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','37');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','39');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','6');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','8');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','9');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','10');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','11');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','12');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','13');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','14');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','15');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','16');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','17');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','18');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','19');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','21');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','22');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','23');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','24');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','25');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_location_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_location_link` (
  `location_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户门店分属哪些生活服务子分类的关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('21','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('21','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('22','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('22','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('23','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('24','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','27');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('26','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('27','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('28','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('29','5');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('30','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('31','8');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('32','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('34','35');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('34','36');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('35','37');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_youhui_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_youhui_link` (
  `deal_cate_type_id` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_cate_type_id`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券与生活服务子类的关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('28','21');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('29','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('30','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','21');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','22');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','23');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_city`;
CREATE TABLE `%DB_PREFIX%deal_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '城市中文名',
  `uname` varchar(255) NOT NULL COMMENT '英文名（用于URL显示）与二级域名显示',
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '父ID，只能指向全国',
  `is_open` tinyint(1) NOT NULL COMMENT '弃用',
  `is_default` tinyint(1) NOT NULL COMMENT '默认城市（当IP定位不到时默认显示的城市）',
  `description` text NOT NULL COMMENT '弃用',
  `notice` text NOT NULL COMMENT '弃用',
  `seo_title` text NOT NULL COMMENT '针对城市定义的城市子站的seo标题前缀',
  `seo_keyword` text NOT NULL COMMENT '针对城市定义的城市子站的seo关键词前缀',
  `seo_description` text NOT NULL COMMENT '针对城市定义的城市子站的seo描述前缀',
  `sort` int(11) NOT NULL COMMENT '显示的排序',
  `is_hot` tinyint(1) NOT NULL COMMENT '热门城市',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='城市表';
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('1','福建','fujianp','1','0','0','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('18','北京','beijing','1','0','16','1','0','','','','','','4','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('19','上海','shanghai','1','0','17','1','0','','','','','','5','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('20','厦门','xiamen','1','0','1','1','0','','','','','','6','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('15','福州','fuzhou','1','0','1','1','1','','','','','','1','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('16','北京','beijingp','1','0','0','1','0','','','','','','2','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('17','上海','shanghaip','1','0','0','1','0','','','','','','3','0');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_collect`;
CREATE TABLE `%DB_PREFIX%deal_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='商品收藏表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_coupon`;
CREATE TABLE `%DB_PREFIX%deal_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL COMMENT ' 消费券序列号',
  `password` varchar(255) NOT NULL COMMENT ' 消费券密码',
  `begin_time` int(11) NOT NULL COMMENT ' 消费券生效时间',
  `end_time` int(11) NOT NULL COMMENT ' 消费券过期时间',
  `is_valid` tinyint(1) NOT NULL COMMENT ' 有效性 0:生成未发放给用户(已下单未成团) 1:已发放给用户 2：退款被禁用',
  `user_id` int(11) NOT NULL COMMENT ' 会员ID',
  `deal_id` int(11) NOT NULL COMMENT ' 商品ID',
  `order_id` int(11) NOT NULL COMMENT ' 订单ID ',
  `order_deal_id` int(11) NOT NULL COMMENT ' 订单商品ID',
  `is_new` tinyint(1) NOT NULL COMMENT ' 新券标识 0:未被会员查看 1：已查看',
  `supplier_id` int(11) NOT NULL COMMENT ' 商户ID',
  `confirm_account` int(11) NOT NULL COMMENT ' 验证消费券的商家帐号ID',
  `location_id` int(11) NOT NULL COMMENT '消费的门店',
  `is_delete` tinyint(1) NOT NULL COMMENT ' 删除标识',
  `confirm_time` int(11) NOT NULL COMMENT ' 验证消费的时间',
  `mail_count` int(11) NOT NULL COMMENT ' 会员手动重发消费券邮件的次数，用于限制恶意重发',
  `sms_count` int(11) NOT NULL COMMENT ' 会员手动重发消费券短信的次数，用于限制恶意重发',
  `is_balance` tinyint(1) NOT NULL COMMENT ' 0:未结算 1:待结算 2:已结算',
  `balance_memo` text NOT NULL COMMENT ' 管理员结算的备注',
  `balance_price` decimal(20,4) NOT NULL COMMENT ' 生成消费券时由商品表中同步生成该值：结算单价',
  `balance_time` int(11) NOT NULL COMMENT ' 结算时间',
  `refund_status` tinyint(1) NOT NULL COMMENT ' 退款状态 0:无 1:用户申请退款 2:已确认 3:拒绝退款',
  `expire_refund` tinyint(1) NOT NULL COMMENT ' 是否支持过期退 0:否 1:是',
  `any_refund` tinyint(1) NOT NULL COMMENT ' 是否支持随时退 0:否 1:是',
  `coupon_price` decimal(20,4) NOT NULL COMMENT ' 消费券的价格，用于退款时的计算，按件为单件价，按单为总价',
  `coupon_score` int(11) NOT NULL COMMENT ' 消费券所产生给用户的积分，用于退款时的计算，按件为单件价，按单为总价',
  `deal_type` tinyint(1) NOT NULL COMMENT ' 消费券的生成方式 0:按件生成 1:按单生成',
  `coupon_money` decimal(20,4) NOT NULL COMMENT ' 消费券所产生给用户的金额（如购买返现之类的），用于退款时的计算，按件为单件价，按单为总价',
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`) USING BTREE,
  UNIQUE KEY `unk_pw` (`password`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT=' 消费券表';
INSERT INTO `%DB_PREFIX%deal_coupon` VALUES ('23','57577301','61323563','1424887216','1425492016','2','71','57','26','79','0','23','8','21','0','1424890988','0','0','1','','50.0000','0','0','0','1','113.0000','10','0','0.0000','12.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_delivery`;
CREATE TABLE `%DB_PREFIX%deal_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `delivery_id` int(11) NOT NULL COMMENT '被禁用的配送方式ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品的禁用配送方式的配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_dp_point_result`;
CREATE TABLE `%DB_PREFIX%deal_dp_point_result` (
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `point` int(11) NOT NULL COMMENT '分数',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `deal_id` (`deal_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每个商品，每条点评针对每个评分分组的点评评分';
INSERT INTO `%DB_PREFIX%deal_dp_point_result` VALUES ('3','5','57','4');
INSERT INTO `%DB_PREFIX%deal_dp_point_result` VALUES ('4','4','57','4');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%deal_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品按预定义的分组打标签的结果表';
INSERT INTO `%DB_PREFIX%deal_dp_tag_result` VALUES ('味道很好','4','6','57');
INSERT INTO `%DB_PREFIX%deal_dp_tag_result` VALUES ('性价比高','4','6','57');
INSERT INTO `%DB_PREFIX%deal_dp_tag_result` VALUES ('上菜慢','4','6','57');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_filter`;
CREATE TABLE `%DB_PREFIX%deal_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter` text NOT NULL COMMENT '关键词列表，用半角逗号分隔',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `filter_group_id` int(11) NOT NULL COMMENT '筛选分组ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='每个商城商品针对每个筛选分组设置关键词的配置表';
INSERT INTO `%DB_PREFIX%deal_filter` VALUES ('129','黑色 棕色','64','10');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_gallery`;
CREATE TABLE `%DB_PREFIX%deal_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `sort` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=739 DEFAULT CHARSET=utf8 COMMENT='商品图集表';
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('674','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','60','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('675','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','61','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('678','./public/attachment/201502/25/16/54ed832bd819e.jpg','62','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('704','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','63','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('690','./public/attachment/201502/25/16/54ed84395452d.jpg','64','1');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('689','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','64','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('702','./public/attachment/201502/25/16/54ed84087507c.jpg','65','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('686','./public/attachment/201502/25/16/54ed864826695.jpg','66','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('697','./public/attachment/201502/25/16/54ed8ec119a62.jpg','67','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('696','./public/attachment/201502/25/16/54ed8e6b70b46.jpg','68','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('698','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','69','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('693','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','70','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('706','./public/attachment/201502/25/17/54ed9486611f6.jpg','71','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('709','./public/attachment/201502/25/17/54ed98ce465fa.jpg','72','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('711','./public/attachment/201502/25/17/54ed9b8e44904.jpg','73','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('712','./public/attachment/201502/25/17/54ed9d05a1020.jpg','74','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('713','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','58','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('715','./public/attachment/201502/26/09/54ee7e065be04.jpg','75','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('732','./public/attachment/201502/26/10/54ee7f7135221.jpg','76','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('719','./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg','77','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('721','./public/attachment/201502/26/10/54ee8af92fc7a.jpg','78','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('722','./public/attachment/201502/26/10/54ee8b9b7587f.jpg','79','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('723','./public/attachment/201502/26/10/54ee8c072cb42.jpg','80','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('724','./public/attachment/201502/26/11/54ee8c68e932a.jpg','81','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('725','./public/attachment/201502/26/11/54ee8d61e43bd.jpg','82','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('726','./public/attachment/201502/26/11/54ee8e0243272.jpg','83','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('727','./public/attachment/201502/26/11/54ee8e5a53e8a.jpg','84','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('728','./public/attachment/201502/26/11/54ee8ea70c607.jpg','85','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('729','./public/attachment/201502/26/11/54ee903778026.jpg','86','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('730','./public/attachment/201502/26/11/54ee909199d43.jpg','87','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('731','./public/attachment/201502/26/11/54ee90ddeed8a.jpg','88','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('733','./public/attachment/201502/26/14/54eeb7fc4f10f.jpg','89','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('734','./public/attachment/201502/26/14/54eeb89a12e13.jpg','90','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('735','./public/attachment/201502/26/14/54eeb904b45f9.jpg','91','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('736','./public/attachment/201502/26/14/54eeb973e9527.jpg','92','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('737','./public/attachment/201502/26/14/54eeb9e475950.jpg','93','0');
INSERT INTO `%DB_PREFIX%deal_gallery` VALUES ('738','./public/attachment/201502/26/14/54eeba57b9e80.jpg','94','0');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_location_link`;
CREATE TABLE `%DB_PREFIX%deal_location_link` (
  `deal_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品支持门店的关联表';
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('57','21');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('57','22');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('58','28');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('59','29');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('61','30');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('62','31');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('63','31');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('64','33');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('65','31');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('66','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('67','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('68','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('69','25');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('70','26');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('71','34');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('72','34');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('73','35');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('74','35');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('76','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('77','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('79','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('80','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('81','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('82','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('83','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('84','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('85','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('86','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('87','32');
INSERT INTO `%DB_PREFIX%deal_location_link` VALUES ('88','32');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_msg_list`;
CREATE TABLE `%DB_PREFIX%deal_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL COMMENT '发送目标（邮件/手机号）',
  `send_type` tinyint(1) NOT NULL COMMENT '发送类型 0:短信 1:邮件;2:微信;3:andoird;4:ios',
  `content` text NOT NULL COMMENT '发送的内容',
  `send_time` int(11) NOT NULL COMMENT '发出的时间',
  `is_send` tinyint(1) NOT NULL COMMENT '是否已发送 0:否 1:等待队列发送',
  `create_time` int(11) NOT NULL COMMENT '生成的时间',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `result` text NOT NULL COMMENT '发送结果（如出错存放服务器或接口返回的错误信息）',
  `is_success` tinyint(1) NOT NULL COMMENT '是否发送成功',
  `is_html` tinyint(1) NOT NULL COMMENT '只针对邮件使用，是否为超文本邮件 0:否 1:是',
  `title` text NOT NULL COMMENT '只针对邮件使用 邮件的标题',
  `is_youhui` tinyint(1) NOT NULL COMMENT '是否为优惠券的下载发送',
  `youhui_id` int(11) NOT NULL COMMENT '关联的优惠券ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COMMENT='业务队列表';
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('283','13955599999','0','你的手机号为13955599999,验证码为135183','1424818290','1','1424818289','0','','0','0','','0','0');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('284','13333333333','0','你的手机号为13333333333,验证码为397454','1424821662','1','1424821661','0','','0','0','','0','0');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('285','13333333333','0','肯德基10元汉堡 - 验证码:32320441','1424886837','1','1424886836','71','','0','0','','1','20');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('286','13344455555','0','桥亭活鱼小镇，您有一笔新的订单2015022610000323，请及时处理。','1424887216','1','1424887216','0','','0','0','','0','0');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('287','15566655555','0','龙中龙，您有一笔新的订单2015022610592583，请及时处理。','1424890767','1','1424890765','0','','0','0','','0','0');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('288','13457890066','0','爱丁堡尊贵养生会所，您有一笔新的订单2015022610592583，请及时处理。','1424890768','1','1424890765','0','','0','0','','0','0');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('289','fanwe@fanwe.com','1','fanwe你好! 你报名的玛格利塔新店开业试吃已确认，序列号284220,有效期为2015-02-01到2021-02-26','1424894338','1','1424894336','71','无法连接SMTP服务器','0','1','','0','0');
INSERT INTO `%DB_PREFIX%deal_msg_list` VALUES ('290','13333333333','0','fanwe你好! 你报名的玛格利塔新店开业试吃已确认，序列号284220,有效期为2015-02-01到2021-02-26','1424894349','1','1424894336','71','','0','0','','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_order`;
CREATE TABLE `%DB_PREFIX%deal_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL COMMENT '订单编号',
  `type` tinyint(1) NOT NULL COMMENT '订单类型(0:商品订单 1:用户充值单)',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '下单时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `pay_status` tinyint(1) NOT NULL COMMENT '支付状态 0:未支付 1:部份付款(先用余额/代金券支付部份) 2:全部付款',
  `total_price` decimal(20,4) NOT NULL COMMENT '应付总额',
  `pay_amount` decimal(20,4) NOT NULL COMMENT '已付总额 当pay_amount = total_price 支付成功',
  `delivery_status` tinyint(1) NOT NULL COMMENT '发货状态 0:未发货 1:部份发货 2:全部发货 5:无需发货的订单',
  `order_status` tinyint(1) NOT NULL COMMENT '订单状态 0:开放状态（可操作不可删除） 1:结单（不可操作可删除）',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `return_total_score` int(11) NOT NULL COMMENT '返给用户的总积分',
  `refund_amount` decimal(20,4) NOT NULL COMMENT '已退款总额',
  `admin_memo` text NOT NULL COMMENT '管理员的备注',
  `memo` text NOT NULL COMMENT '用户下单的备注',
  `region_lv1` int(11) NOT NULL COMMENT '配送地址一级地区ID',
  `region_lv2` int(11) NOT NULL COMMENT '配送地址二级地区ID',
  `region_lv3` int(11) NOT NULL COMMENT '配送地址三级地区ID',
  `region_lv4` int(11) NOT NULL COMMENT '配送地址四级地区ID',
  `address` text NOT NULL COMMENT '配送地址',
  `mobile` varchar(255) NOT NULL COMMENT '联系人手机',
  `zip` varchar(255) NOT NULL COMMENT '联系人邮编',
  `consignee` varchar(255) NOT NULL COMMENT '收货人姓名',
  `deal_total_price` decimal(20,4) NOT NULL COMMENT '订单中的商品总价',
  `discount_price` decimal(20,4) NOT NULL COMMENT '享受的会员折扣价',
  `delivery_fee` decimal(20,4) NOT NULL COMMENT '运费',
  `ecv_id` int(11) NOT NULL COMMENT '支付所用的代金券ID',
  `ecv_money` decimal(20,4) NOT NULL COMMENT '代金券支付部份的金额',
  `account_money` decimal(20,4) NOT NULL COMMENT '余额支付部份的金额',
  `delivery_id` int(11) NOT NULL COMMENT '配送方式',
  `payment_id` int(11) NOT NULL COMMENT '支付方式',
  `payment_fee` decimal(20,4) NOT NULL COMMENT '支付方式所耗的手续费',
  `return_total_money` decimal(20,4) NOT NULL COMMENT '返现给用户的总额',
  `extra_status` tinyint(1) NOT NULL COMMENT '额外的订单标识 0:正常的订单 1.金额超额产生退款的订单（多次支付，重付通知） 2.发货失败退款（下单时库存足够，支付成功后库存不足，自动退款到用户的订单）',
  `after_sale` tinyint(1) NOT NULL COMMENT '售后处理标识 0:正常订单 1:退款处理的订单',
  `refund_money` decimal(20,4) NOT NULL COMMENT '退款的总额',
  `bank_id` varchar(255) NOT NULL COMMENT '银行直连支付的银行编号',
  `referer` varchar(255) NOT NULL COMMENT '订单的来路 url',
  `deal_ids` varchar(255) NOT NULL COMMENT '购买的商品ID，逗号分隔',
  `user_name` varchar(255) NOT NULL COMMENT '下单用户名',
  `refund_status` tinyint(1) NOT NULL COMMENT '0:不需退款 1:有退款申请 2:已处理',
  `retake_status` tinyint(1) NOT NULL COMMENT '弃用',
  `promote_description` text NOT NULL COMMENT '订单享受的促销活动描述',
  `deal_order_item` text NOT NULL COMMENT '同步的订单商品数据集',
  `is_refuse_delivery` tinyint(1) NOT NULL COMMENT '是否有货没有收到',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sn` (`order_sn`),
  KEY `order_sn` (`order_sn`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`),
  KEY `pay_status` (`pay_status`),
  KEY `delivery_status` (`delivery_status`),
  KEY `order_status` (`order_status`),
  KEY `is_delete` (`is_delete`),
  KEY `extra_status` (`extra_status`),
  KEY `after_sale` (`after_sale`),
  KEY `refund_status` (`refund_status`),
  KEY `retake_status` (`retake_status`),
  KEY `is_refuse_delivery` (`is_refuse_delivery`),
  FULLTEXT KEY `deal_ids` (`deal_ids`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='订单表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_order_history`;
CREATE TABLE `%DB_PREFIX%deal_order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL COMMENT '订单编号',
  `type` tinyint(1) NOT NULL COMMENT '订单类型(0:商品订单 1:用户充值单)',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '下单时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `pay_status` tinyint(1) NOT NULL COMMENT '支付状态 0:未支付 1:部份付款(先用余额/代金券支付部份) 2:全部付款',
  `total_price` decimal(20,4) NOT NULL COMMENT '应付总额',
  `pay_amount` decimal(20,4) NOT NULL COMMENT '已付总额 当pay_amount = total_price 支付成功',
  `delivery_status` tinyint(1) NOT NULL COMMENT '发货状态 0:未发货 1:部份发货 2:全部发货 5:无需发货的订单',
  `order_status` tinyint(1) NOT NULL COMMENT '订单状态 0:开放状态（可操作不可删除） 1:结单（不可操作可删除）',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `return_total_score` int(11) NOT NULL COMMENT '返给用户的总积分',
  `refund_amount` decimal(20,4) NOT NULL COMMENT '已退款总额',
  `admin_memo` text NOT NULL COMMENT '管理员的备注',
  `memo` text NOT NULL COMMENT '用户下单的备注',
  `region_lv1` int(11) NOT NULL COMMENT '配送地址一级地区ID',
  `region_lv2` int(11) NOT NULL COMMENT '配送地址二级地区ID',
  `region_lv3` int(11) NOT NULL COMMENT '配送地址三级地区ID',
  `region_lv4` int(11) NOT NULL COMMENT '配送地址四级地区ID',
  `address` text NOT NULL COMMENT '配送地址',
  `mobile` varchar(255) NOT NULL COMMENT '联系人手机',
  `zip` varchar(255) NOT NULL COMMENT '联系人邮编',
  `consignee` varchar(255) NOT NULL COMMENT '收货人姓名',
  `deal_total_price` decimal(20,4) NOT NULL COMMENT '订单中的商品总价',
  `discount_price` decimal(20,4) NOT NULL COMMENT '享受的会员折扣价',
  `delivery_fee` decimal(20,4) NOT NULL COMMENT '运费',
  `ecv_money` decimal(20,4) NOT NULL COMMENT '代金券支付部份的金额',
  `account_money` decimal(20,4) NOT NULL COMMENT '余额支付部份的金额',
  `delivery_id` int(11) NOT NULL COMMENT '配送方式',
  `payment_id` int(11) NOT NULL COMMENT '支付方式',
  `payment_fee` decimal(20,4) NOT NULL COMMENT '支付方式所耗的手续费',
  `return_total_money` decimal(20,4) NOT NULL COMMENT '返现给用户的总额',
  `extra_status` tinyint(1) NOT NULL COMMENT '额外的订单标识 0:正常的订单 1.金额超额产生退款的订单（多次支付，重付通知） 2.发货失败退款（下单时库存足够，支付成功后库存不足，自动退款到用户的订单）',
  `after_sale` tinyint(1) NOT NULL COMMENT '售后处理标识 0:正常订单 1:退款处理的订单',
  `refund_money` decimal(20,4) NOT NULL COMMENT '弃用',
  `bank_id` varchar(255) NOT NULL COMMENT '银行直连支付的银行编号',
  `referer` varchar(255) NOT NULL COMMENT '订单的来路 url',
  `deal_ids` varchar(255) NOT NULL COMMENT '购买的商品ID，逗号分隔',
  `user_name` varchar(255) NOT NULL COMMENT '下单用户名',
  `refund_status` tinyint(1) NOT NULL COMMENT '0:不需退款 1:有退款申请 2:已处理',
  `retake_status` tinyint(1) NOT NULL COMMENT '弃用',
  `promote_description` text NOT NULL COMMENT '订单享受的促销活动描述',
  `history_deal_order_item` text NOT NULL COMMENT '序列化存储的订单产品',
  `history_deal_coupon` text NOT NULL COMMENT '序列化存储的消费券',
  `history_deal_order_log` text NOT NULL COMMENT '订单日志',
  `history_delivery_notice` text NOT NULL COMMENT '发货单日志',
  `history_payment_notice` text NOT NULL COMMENT '付款单',
  `history_message` text NOT NULL COMMENT '订单留言rel_table:deal_order,rel_id:order_id',
  `history_delivery_fee` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sn` (`order_sn`),
  FULLTEXT KEY `deal_ids` (`deal_ids`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='历史订单表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_order_item`;
CREATE TABLE `%DB_PREFIX%deal_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `number` int(11) NOT NULL COMMENT '购买的数量',
  `unit_price` decimal(20,4) NOT NULL COMMENT '单价',
  `total_price` decimal(20,4) NOT NULL COMMENT '总价',
  `delivery_status` tinyint(1) NOT NULL COMMENT '发货状态 0:未发货 1:已发货 5.无需发货',
  `name` text NOT NULL COMMENT '产品名称',
  `return_score` int(11) NOT NULL COMMENT '返积分单价',
  `return_total_score` int(11) NOT NULL COMMENT '返积分总价',
  `attr` varchar(255) NOT NULL COMMENT '属性ID，逗号分开',
  `verify_code` varchar(255) NOT NULL COMMENT '唯一标识码（产品ID+属性ID加密）',
  `order_sn` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '所属的订单ID',
  `return_money` decimal(20,4) NOT NULL COMMENT '返现的单价',
  `return_total_money` decimal(20,4) NOT NULL COMMENT '返现的总价',
  `buy_type` tinyint(1) NOT NULL COMMENT '团购产品的类型（同deal表中的该字段）',
  `sub_name` varchar(255) NOT NULL COMMENT '短名称',
  `attr_str` text NOT NULL COMMENT '属性配置的字符串',
  `is_balance` tinyint(1) NOT NULL COMMENT '0:未结算 1:待结算 2:已结算 3:部份结算',
  `balance_unit_price` decimal(20,4) NOT NULL COMMENT '结算单价',
  `balance_memo` text NOT NULL COMMENT '管理员结算备注',
  `balance_total_price` decimal(20,4) NOT NULL COMMENT '结算总价',
  `balance_time` int(11) NOT NULL COMMENT '结算时间',
  `add_balance_price` decimal(20,4) NOT NULL,
  `add_balance_price_total` decimal(20,4) NOT NULL,
  `refund_status` tinyint(1) NOT NULL COMMENT '退款状态 0:无 1:用户申请退款 2:已确认 3:拒绝退款',
  `dp_id` int(11) NOT NULL COMMENT '为该商品点评的ID',
  `is_arrival` tinyint(1) NOT NULL COMMENT '是否已收货0:未收货1:已收货2:没收到货',
  `is_coupon` tinyint(1) NOT NULL COMMENT '是否发券',
  `deal_icon` varchar(255) NOT NULL COMMENT '商品图',
  `location_id` int(11) NOT NULL COMMENT '发货时的门店ID',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `is_refund` tinyint(1) NOT NULL COMMENT '是否支持退款(由商品表同步而来)',
  `user_id` int(11) NOT NULL COMMENT '所属的用户ID',
  `is_shop` tinyint(1) NOT NULL,
  `consume_count` int(11) NOT NULL COMMENT '成功消费的商品数量(已验证/已收货/已付款)',
`is_pick`  tinyint(1) NOT NULL COMMENT '是否允许上门自提',
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `order_id` (`order_id`),
  KEY `verify_code` (`verify_code`),
  KEY `refund_status` (`refund_status`),
  KEY `buy_type` (`buy_type`),
  KEY `is_coupon` (`is_coupon`),
  KEY `location_id` (`location_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `delivery_status` (`delivery_status`),
  KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `is_shop` (`is_shop`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='订单产品表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_order_log`;
CREATE TABLE `%DB_PREFIX%deal_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='订单操作的日志表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_order_supplier_fee`;
CREATE TABLE `%DB_PREFIX%deal_order_supplier_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `supplier_id` int(11) NOT NULL COMMENT '商户ID',
  `delivery_fee` decimal(20,4) NOT NULL COMMENT '运费',
  `is_arrival` tinyint(1) NOT NULL COMMENT '是否已收货 0未收货 1已收货（收货后将运费结算给商家）',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%deal_payment`;
CREATE TABLE `%DB_PREFIX%deal_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='针对商品配置的禁用某个支付方式的配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal_submit`;
CREATE TABLE `%DB_PREFIX%deal_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '商品名称',
  `sub_name` varchar(255) NOT NULL COMMENT '短名称，用于短信，邮件等需要节约字符数的地方显示名称用',
  `cate_id` int(11) NOT NULL COMMENT '生活服务分类ID',
  `supplier_id` int(11) NOT NULL COMMENT '所属的商户ID',
  `img` varchar(255) NOT NULL COMMENT '主图',
  `description` text NOT NULL COMMENT '信息描述详情',
  `begin_time` int(11) NOT NULL COMMENT '上线开始时间，可为0为不限时',
  `end_time` int(11) NOT NULL COMMENT '下架时间，可为0为不限时',
  `min_bought` int(11) NOT NULL COMMENT '最小购买量，用于团购产品的成团判断',
  `max_bought` int(11) NOT NULL COMMENT '最大量，即库存上限(如有属性规格的库存，该值不生效，见attr_stock表)',
  `user_min_bought` int(11) NOT NULL COMMENT '会员下单的最小量',
  `user_max_bought` int(11) NOT NULL COMMENT '每个会员购买的上限',
  `origin_price` decimal(20,4) NOT NULL COMMENT '原价',
  `current_price` decimal(20,4) NOT NULL COMMENT '当前销售价',
  `city_id` int(11) NOT NULL COMMENT '所属的城市',
  `is_coupon` tinyint(1) NOT NULL COMMENT '是否发放消费券',
  `is_delivery` tinyint(1) NOT NULL COMMENT '是否需要配送（实体商品），需要配送的产品前台会出现配送方式的选项，并计算相应运费',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `user_count` int(11) NOT NULL COMMENT '下单量（按单计算,每组商品多件购买算一笔）',
  `buy_count` int(11) NOT NULL COMMENT '销量（购买的件数）',
  `time_status` tinyint(1) NOT NULL COMMENT '时间状态0:未开始1:进行中2:已过期(不上架销售，可以往消费券中查到)',
  `buy_status` tinyint(1) NOT NULL COMMENT '销售状态 0:未成团 1:已成团 2:成团并卖光\r\n0:未成团，购买的用户生成消费券，但不发券\r\n1:成团，购买发券\r\n2:卖光商品不再开放购买，但不下架',
  `deal_type` tinyint(1) NOT NULL COMMENT '发券方式 0:按件发送 1:按单发券(同类商品买多件只发放一张消费券,用于一次性验证)',
  `allow_promote` tinyint(1) NOT NULL COMMENT '是否允许参与促销（系统内安装并配置的促销接口）',
  `return_money` decimal(20,4) NOT NULL COMMENT '购买即返现的金额(该项可填负数，也可作为额外消费的金额)',
  `return_score` int(11) NOT NULL COMMENT '购买返积分(也可以为负数，表示商品购买的积分限制，积分商品的积分也为该项，因此必需为负数)',
  `brief` text NOT NULL COMMENT '商品简介',
  `sort` int(11) NOT NULL COMMENT '前台展示排序 由大到小',
  `deal_goods_type` int(11) NOT NULL COMMENT '商品类型（用于生成相应类型的属性规格配置项）',
  `success_time` int(11) NOT NULL COMMENT '成团时间',
  `coupon_begin_time` int(11) NOT NULL COMMENT '发放消费券的生效时间',
  `coupon_end_time` int(11) NOT NULL COMMENT '发放的消费券的过期时间',
  `code` varchar(255) NOT NULL COMMENT '标识码,可自定义一个标识用于消费券的前缀（用于电话验证的商品只能填数字）',
  `weight` decimal(20,4) NOT NULL COMMENT '商品重量，实体商品填写，用于运费计算',
  `weight_id` int(11) NOT NULL COMMENT '重量单位的配置ID',
  `is_referral` tinyint(1) NOT NULL COMMENT '是否允许购买返利给邀请人',
  `buy_type` tinyint(1) NOT NULL COMMENT '团购商品的类型0：普通 2:订购 3秒杀 (该值仅作为前台展示以及归类用，功能上与团购商品相同) ',
  `discount` decimal(20,4) NOT NULL COMMENT '商品的现价与原价的折扣数，通常会自动生成，在线订购类商品因为付的是订金，该项手动计算原价与卖价的折扣比',
  `icon` varchar(255) NOT NULL COMMENT '小图',
  `notice` tinyint(1) NOT NULL COMMENT '是否参与预告（未到上线期的商品，默认不展示在前台，该项为1表示可以上线展示预告）',
  `free_delivery` tinyint(1) NOT NULL COMMENT '是否开启免运费，可以单独配置针对某个配送方式的免运费规则',
  `define_payment` tinyint(1) NOT NULL COMMENT '是否自定义禁用哪些支付方式',
  `seo_title` text NOT NULL COMMENT '自定义的页面seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义的页面seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义的页面seo描述',
  `is_hot` tinyint(1) NOT NULL COMMENT '商城商品的热卖标识',
  `is_new` tinyint(1) NOT NULL COMMENT '商城商品的新品标识',
  `is_best` tinyint(1) NOT NULL COMMENT '商城商品的精品标识',
  `is_lottery` tinyint(1) NOT NULL COMMENT '是否参与抽奖，为1则生成抽奖号，用于运营中制定相应的抽奖规则',
  `reopen` int(11) NOT NULL COMMENT '重开团的申请，往期团购前台可以申请重新开团，该项用于计数',
  `uname` varchar(255) NOT NULL COMMENT 'url别名，用于重写与seo收录的优化',
  `forbid_sms` tinyint(1) NOT NULL COMMENT '是否禁用短信发送功能，禁用短信则该商品的购物不会短信发券',
  `cart_type` tinyint(1) NOT NULL COMMENT '购物车规则\r\n0:启用购物车(每次可以买多款)\r\n1按商品(同款商品可买多款属性)\r\n2按商家(同个商家可买多款商品)\r\n3禁用购物车(每次只能买一款)',
  `shop_cate_id` int(11) NOT NULL COMMENT '商城商品的分类ID',
  `is_shop` tinyint(1) NOT NULL COMMENT '标识是否为商城商品 0:否 1:是',
  `total_point` int(11) NOT NULL COMMENT '用户评分的总分',
  `avg_point` float(14,4) NOT NULL COMMENT '用户评分的平均分',
  `create_time` int(11) NOT NULL COMMENT '管理员发布时间',
  `update_time` int(11) NOT NULL COMMENT '管理员更新时间',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode编码',
  `name_match_row` text NOT NULL COMMENT '名称的全文索引查询栏',
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引unicode',
  `deal_cate_match_row` text NOT NULL COMMENT '分类的全文索引查询栏',
  `shop_cate_match` text NOT NULL COMMENT '商品分类的全文索引unicode',
  `shop_cate_match_row` text NOT NULL COMMENT '商品分类的全文索引查询栏',
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引unicode',
  `locate_match_row` text NOT NULL COMMENT '地区信息的全文索引查询栏',
  `tag_match` text NOT NULL COMMENT '标签全文索引unicode',
  `tag_match_row` text NOT NULL COMMENT '标签全文索引查询栏',
  `xpoint` varchar(255) NOT NULL COMMENT '经度（第一个分店的经度）',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度（第一个分店的纬度）',
  `brand_id` int(11) NOT NULL COMMENT '所归属的品牌',
  `brand_promote` tinyint(1) NOT NULL COMMENT '是否参与品牌促销，该项与brand表的该项同步',
  `publish_wait` tinyint(1) NOT NULL COMMENT '商家提交的产品 0:已审核 1:等待审核',
  `account_id` int(11) NOT NULL COMMENT '商家提交的商家帐号ID',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到首页展示',
  `balance_price` decimal(20,4) NOT NULL COMMENT '与商家的结算价（即商价提供给平台商的成本价）',
  `is_refund` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可退款',
  `auto_order` tinyint(1) NOT NULL COMMENT '是否打上免预约标识 0:否 1:是',
  `expire_refund` tinyint(1) NOT NULL COMMENT '是否支持过期退款( 过期未消费用户即可提交退款)',
  `any_refund` tinyint(1) NOT NULL COMMENT '是否支持随时退款（未消费用户即可提交退款申请）',
  `multi_attr` tinyint(1) NOT NULL COMMENT '多套餐（自动判断是否有属性规格配置，有则打上该标签）',
  `deal_tag` int(10) NOT NULL COMMENT '商品标签\r\n2^(1-10)\r\n1.0元抽奖\r\n2.免预约\r\n3.多套餐\r\n4.可订座\r\n5.代金券\r\n6.过期退\r\n7.随时退\r\n8.七天退\r\n9.免运费\r\n10.满立减',
  `dp_count` int(11) NOT NULL COMMENT '总参与的点评人数',
  `notes` text NOT NULL COMMENT '购买需知',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `deal_id` int(11) NOT NULL COMMENT '商品表关联ID',
  `biz_apply_status` tinyint(1) NOT NULL COMMENT '商户申请状态 1.新品上架申请 2:修改 3:下架',
  `admin_check_status` tinyint(1) NOT NULL COMMENT '管理员审核状态 0:待审核 1:通过 2:拒绝',
  `cache_deal_cate_type_id` varchar(255) NOT NULL COMMENT '团购商品:子分类ID缓存',
  `cache_location_id` varchar(255) NOT NULL COMMENT '支持门店ID缓存',
  `cache_focus_imgs` text NOT NULL COMMENT '图集缓存',
  `cache_deal_attr` text NOT NULL COMMENT '属性缓存',
  `cache_stock_data` text NOT NULL COMMENT '属性库存缓存',
  `cache_attr_stock` text NOT NULL COMMENT '对应attr_stock表内容',
  `cache_free_delivery` text NOT NULL COMMENT '商城数据:免运费配置缓存',
  `cache_deal_payment` text NOT NULL COMMENT '商城数据:禁用的支付方式配置缓存',
  `cache_deal_delivery` text NOT NULL COMMENT '商城数据:禁用配送方式配置缓存',
  `cache_deal_filter` text NOT NULL COMMENT '商城数据:筛选关键词配置缓存',
  `cache_relate` text NOT NULL COMMENT '关联商品缓存',
`is_pick`  tinyint(1) NOT NULL COMMENT '是否允许上门自提',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `begin_time` (`begin_time`),
  KEY `end_time` (`end_time`),
  KEY `current_price` (`current_price`),
  KEY `city_id` (`city_id`),
  KEY `buy_count` (`buy_count`),
  KEY `sort` (`sort`),
  KEY `buy_type` (`buy_type`),
  KEY `shop_cate_id` (`shop_cate_id`),
  KEY `is_shop` (`is_shop`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `deal_id` (`deal_id`),
  KEY `account_id` (`account_id`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `tag_match` (`tag_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `all_match` (`name_match`,`deal_cate_match`,`locate_match`,`tag_match`,`shop_cate_match`),
  FULLTEXT KEY `shop_cate_match` (`shop_cate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='商户中心 商品、团购申请临时表';
DROP TABLE IF EXISTS `%DB_PREFIX%delivery`;
CREATE TABLE `%DB_PREFIX%delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '配送方式名称',
  `description` text NOT NULL COMMENT '配送方式描述',
  `first_fee` decimal(20,4) NOT NULL COMMENT '默认的首重价格',
  `allow_default` tinyint(1) NOT NULL COMMENT '启用默认项\r\n0: 当配送地址没有匹配的运费配置时 不支持该配送方式\r\n1： 当配送地址没有匹配的运费配置时 启用默认的运费配置',
  `sort` int(11) NOT NULL COMMENT '展示排序 由大到小',
  `first_weight` decimal(20,4) NOT NULL COMMENT '默认的首重重量 ',
  `continue_weight` decimal(20,4) NOT NULL COMMENT '默认的续重重量',
  `continue_fee` decimal(20,4) NOT NULL COMMENT '默认的续重价格',
  `weight_id` int(11) NOT NULL COMMENT '重量单位ID',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='配送方式配置表';
INSERT INTO `%DB_PREFIX%delivery` VALUES ('8','顺风快递','顺风快递,福州地区2元','5.0000','1','1','0.0000','0.0000','0.0000','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%delivery_fee`;
CREATE TABLE `%DB_PREFIX%delivery_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL COMMENT '配送方式ID',
  `region_ids` text NOT NULL COMMENT '支持的配送地区ID集合，逗号分开',
  `first_fee` decimal(20,4) NOT NULL COMMENT '首重价格',
  `first_weight` decimal(20,4) NOT NULL COMMENT '首重重量',
  `continue_fee` decimal(20,4) NOT NULL COMMENT '续重价格',
  `continue_weight` decimal(20,4) NOT NULL COMMENT '续重重量',
  `supplier_id` int(11) NOT NULL COMMENT '归属于商户的运费配置项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='配送方式的支持地区运费配置表';
INSERT INTO `%DB_PREFIX%delivery_fee` VALUES ('31','8','518,519,520,521,522,523,524,525,526,527,528,529,530,53','2.0000','0.0000','0.0000','0.0000','0');
DROP TABLE IF EXISTS `%DB_PREFIX%delivery_notice`;
CREATE TABLE `%DB_PREFIX%delivery_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL COMMENT '快递单号',
  `delivery_time` int(11) NOT NULL COMMENT '发货时间',
  `is_arrival` tinyint(1) NOT NULL COMMENT '是否已收货0:未收货1:已收货2:没收到货',
  `arrival_time` int(11) NOT NULL COMMENT '收货时间',
  `order_item_id` int(11) NOT NULL COMMENT '发货的订单商品ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `memo` text NOT NULL COMMENT '发货说明备注',
  `express_id` int(11) NOT NULL COMMENT '快递接口ID（用于查询快递与打印快递单）',
  `delivery_supplier_id` int(11) NOT NULL COMMENT '发货的商家账号ID',
  `location_id` int(11) NOT NULL COMMENT '发货的门店点',
  `deal_id` int(11) NOT NULL COMMENT '发货的对应商品ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  PRIMARY KEY (`id`),
  KEY `notice_sn` (`notice_sn`),
  KEY `order_item_id` (`order_item_id`),
  KEY `is_arrival` (`is_arrival`),
  KEY `user_id` (`user_id`),
  KEY `delivery_supplier_id` (`delivery_supplier_id`),
  KEY `location_id` (`location_id`),
  KEY `deal_id` (`deal_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='发货单表';
DROP TABLE IF EXISTS `%DB_PREFIX%delivery_region`;
CREATE TABLE `%DB_PREFIX%delivery_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级地区ID',
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '1:国 2:省 3:市(县) 4:区(镇)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3411 DEFAULT CHARSET=utf8 COMMENT='配送地区表';
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2','1','北京','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3','1','安徽','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('4','1','福建','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('5','1','甘肃','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('6','1','广东','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('7','1','广西','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('8','1','贵州','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('9','1','海南','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('10','1','河北','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('11','1','河南','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('12','1','黑龙江','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('13','1','湖北','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('14','1','湖南','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('15','1','吉林','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('16','1','江苏','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('17','1','江西','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('18','1','辽宁','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('19','1','内蒙古','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('20','1','宁夏','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('21','1','青海','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('22','1','山东','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('23','1','山西','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('24','1','陕西','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('25','1','上海','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('26','1','四川','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('27','1','天津','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('28','1','西藏','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('29','1','新疆','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('30','1','云南','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('31','1','浙江','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('32','1','重庆','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('33','1','香港','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('34','1','澳门','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('35','1','台湾','2');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('36','3','安庆','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('37','3','蚌埠','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('38','3','巢湖','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('39','3','池州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('40','3','滁州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('41','3','阜阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('42','3','淮北','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('43','3','淮南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('44','3','黄山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('45','3','六安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('46','3','马鞍山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('47','3','宿州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('48','3','铜陵','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('49','3','芜湖','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('50','3','宣城','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('51','3','亳州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('52','2','北京','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('53','4','福州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('54','4','龙岩','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('55','4','南平','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('56','4','宁德','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('57','4','莆田','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('58','4','泉州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('59','4','三明','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('60','4','厦门','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('61','4','漳州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('62','5','兰州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('63','5','白银','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('64','5','定西','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('65','5','甘南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('66','5','嘉峪关','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('67','5','金昌','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('68','5','酒泉','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('69','5','临夏','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('70','5','陇南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('71','5','平凉','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('72','5','庆阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('73','5','天水','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('74','5','武威','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('75','5','张掖','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('76','6','广州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('77','6','深圳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('78','6','潮州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('79','6','东莞','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('80','6','佛山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('81','6','河源','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('82','6','惠州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('83','6','江门','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('84','6','揭阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('85','6','茂名','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('86','6','梅州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('87','6','清远','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('88','6','汕头','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('89','6','汕尾','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('90','6','韶关','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('91','6','阳江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('92','6','云浮','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('93','6','湛江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('94','6','肇庆','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('95','6','中山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('96','6','珠海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('97','7','南宁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('98','7','桂林','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('99','7','百色','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('100','7','北海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('101','7','崇左','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('102','7','防城港','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('103','7','贵港','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('104','7','河池','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('105','7','贺州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('106','7','来宾','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('107','7','柳州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('108','7','钦州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('109','7','梧州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('110','7','玉林','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('111','8','贵阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('112','8','安顺','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('113','8','毕节','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('114','8','六盘水','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('115','8','黔东南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('116','8','黔南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('117','8','黔西南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('118','8','铜仁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('119','8','遵义','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('120','9','海口','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('121','9','三亚','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('122','9','白沙','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('123','9','保亭','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('124','9','昌江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('125','9','澄迈县','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('126','9','定安县','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('127','9','东方','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('128','9','乐东','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('129','9','临高县','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('130','9','陵水','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('131','9','琼海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('132','9','琼中','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('133','9','屯昌县','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('134','9','万宁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('135','9','文昌','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('136','9','五指山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('137','9','儋州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('138','10','石家庄','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('139','10','保定','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('140','10','沧州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('141','10','承德','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('142','10','邯郸','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('143','10','衡水','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('144','10','廊坊','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('145','10','秦皇岛','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('146','10','唐山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('147','10','邢台','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('148','10','张家口','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('149','11','郑州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('150','11','洛阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('151','11','开封','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('152','11','安阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('153','11','鹤壁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('154','11','济源','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('155','11','焦作','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('156','11','南阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('157','11','平顶山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('158','11','三门峡','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('159','11','商丘','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('160','11','新乡','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('161','11','信阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('162','11','许昌','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('163','11','周口','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('164','11','驻马店','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('165','11','漯河','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('166','11','濮阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('167','12','哈尔滨','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('168','12','大庆','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('169','12','大兴安岭','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('170','12','鹤岗','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('171','12','黑河','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('172','12','鸡西','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('173','12','佳木斯','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('174','12','牡丹江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('175','12','七台河','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('176','12','齐齐哈尔','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('177','12','双鸭山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('178','12','绥化','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('179','12','伊春','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('180','13','武汉','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('181','13','仙桃','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('182','13','鄂州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('183','13','黄冈','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('184','13','黄石','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('185','13','荆门','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('186','13','荆州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('187','13','潜江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('188','13','神农架林区','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('189','13','十堰','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('190','13','随州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('191','13','天门','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('192','13','咸宁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('193','13','襄樊','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('194','13','孝感','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('195','13','宜昌','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('196','13','恩施','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('197','14','长沙','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('198','14','张家界','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('199','14','常德','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('200','14','郴州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('201','14','衡阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('202','14','怀化','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('203','14','娄底','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('204','14','邵阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('205','14','湘潭','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('206','14','湘西','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('207','14','益阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('208','14','永州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('209','14','岳阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('210','14','株洲','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('211','15','长春','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('212','15','吉林','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('213','15','白城','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('214','15','白山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('215','15','辽源','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('216','15','四平','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('217','15','松原','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('218','15','通化','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('219','15','延边','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('220','16','南京','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('221','16','苏州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('222','16','无锡','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('223','16','常州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('224','16','淮安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('225','16','连云港','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('226','16','南通','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('227','16','宿迁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('228','16','泰州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('229','16','徐州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('230','16','盐城','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('231','16','扬州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('232','16','镇江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('233','17','南昌','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('234','17','抚州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('235','17','赣州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('236','17','吉安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('237','17','景德镇','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('238','17','九江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('239','17','萍乡','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('240','17','上饶','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('241','17','新余','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('242','17','宜春','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('243','17','鹰潭','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('244','18','沈阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('245','18','大连','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('246','18','鞍山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('247','18','本溪','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('248','18','朝阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('249','18','丹东','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('250','18','抚顺','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('251','18','阜新','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('252','18','葫芦岛','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('253','18','锦州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('254','18','辽阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('255','18','盘锦','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('256','18','铁岭','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('257','18','营口','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('258','19','呼和浩特','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('259','19','阿拉善盟','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('260','19','巴彦淖尔盟','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('261','19','包头','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('262','19','赤峰','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('263','19','鄂尔多斯','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('264','19','呼伦贝尔','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('265','19','通辽','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('266','19','乌海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('267','19','乌兰察布市','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('268','19','锡林郭勒盟','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('269','19','兴安盟','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('270','20','银川','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('271','20','固原','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('272','20','石嘴山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('273','20','吴忠','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('274','20','中卫','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('275','21','西宁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('276','21','果洛','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('277','21','海北','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('278','21','海东','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('279','21','海南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('280','21','海西','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('281','21','黄南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('282','21','玉树','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('283','22','济南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('284','22','青岛','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('285','22','滨州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('286','22','德州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('287','22','东营','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('288','22','菏泽','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('289','22','济宁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('290','22','莱芜','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('291','22','聊城','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('292','22','临沂','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('293','22','日照','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('294','22','泰安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('295','22','威海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('296','22','潍坊','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('297','22','烟台','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('298','22','枣庄','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('299','22','淄博','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('300','23','太原','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('301','23','长治','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('302','23','大同','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('303','23','晋城','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('304','23','晋中','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('305','23','临汾','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('306','23','吕梁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('307','23','朔州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('308','23','忻州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('309','23','阳泉','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('310','23','运城','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('311','24','西安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('312','24','安康','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('313','24','宝鸡','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('314','24','汉中','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('315','24','商洛','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('316','24','铜川','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('317','24','渭南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('318','24','咸阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('319','24','延安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('320','24','榆林','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('321','25','上海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('322','26','成都','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('323','26','绵阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('324','26','阿坝','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('325','26','巴中','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('326','26','达州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('327','26','德阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('328','26','甘孜','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('329','26','广安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('330','26','广元','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('331','26','乐山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('332','26','凉山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('333','26','眉山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('334','26','南充','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('335','26','内江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('336','26','攀枝花','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('337','26','遂宁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('338','26','雅安','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('339','26','宜宾','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('340','26','资阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('341','26','自贡','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('342','26','泸州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('343','27','天津','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('344','28','拉萨','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('345','28','阿里','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('346','28','昌都','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('347','28','林芝','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('348','28','那曲','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('349','28','日喀则','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('350','28','山南','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('351','29','乌鲁木齐','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('352','29','阿克苏','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('353','29','阿拉尔','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('354','29','巴音郭楞','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('355','29','博尔塔拉','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('356','29','昌吉','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('357','29','哈密','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('358','29','和田','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('359','29','喀什','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('360','29','克拉玛依','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('361','29','克孜勒苏','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('362','29','石河子','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('363','29','图木舒克','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('364','29','吐鲁番','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('365','29','五家渠','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('366','29','伊犁','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('367','30','昆明','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('368','30','怒江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('369','30','普洱','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('370','30','丽江','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('371','30','保山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('372','30','楚雄','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('373','30','大理','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('374','30','德宏','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('375','30','迪庆','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('376','30','红河','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('377','30','临沧','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('378','30','曲靖','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('379','30','文山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('380','30','西双版纳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('381','30','玉溪','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('382','30','昭通','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('383','31','杭州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('384','31','湖州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('385','31','嘉兴','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('386','31','金华','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('387','31','丽水','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('388','31','宁波','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('389','31','绍兴','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('390','31','台州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('391','31','温州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('392','31','舟山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('393','31','衢州','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('394','32','重庆','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('395','33','香港','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('396','34','澳门','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('397','35','台湾','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('398','36','迎江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('399','36','大观区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('400','36','宜秀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('401','36','桐城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('402','36','怀宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('403','36','枞阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('404','36','潜山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('405','36','太湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('406','36','宿松县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('407','36','望江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('408','36','岳西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('409','37','中市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('410','37','东市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('411','37','西市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('412','37','郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('413','37','怀远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('414','37','五河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('415','37','固镇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('416','38','居巢区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('417','38','庐江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('418','38','无为县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('419','38','含山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('420','38','和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('421','39','贵池区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('422','39','东至县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('423','39','石台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('424','39','青阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('425','40','琅琊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('426','40','南谯区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('427','40','天长市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('428','40','明光市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('429','40','来安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('430','40','全椒县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('431','40','定远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('432','40','凤阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('433','41','蚌山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('434','41','龙子湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('435','41','禹会区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('436','41','淮上区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('437','41','颍州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('438','41','颍东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('439','41','颍泉区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('440','41','界首市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('441','41','临泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('442','41','太和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('443','41','阜南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('444','41','颖上县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('445','42','相山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('446','42','杜集区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('447','42','烈山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('448','42','濉溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('449','43','田家庵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('450','43','大通区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('451','43','谢家集区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('452','43','八公山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('453','43','潘集区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('454','43','凤台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('455','44','屯溪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('456','44','黄山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('457','44','徽州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('458','44','歙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('459','44','休宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('460','44','黟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('461','44','祁门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('462','45','金安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('463','45','裕安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('464','45','寿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('465','45','霍邱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('466','45','舒城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('467','45','金寨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('468','45','霍山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('469','46','雨山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('470','46','花山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('471','46','金家庄区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('472','46','当涂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('473','47','埇桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('474','47','砀山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('475','47','萧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('476','47','灵璧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('477','47','泗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('478','48','铜官山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('479','48','狮子山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('480','48','郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('481','48','铜陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('482','49','镜湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('483','49','弋江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('484','49','鸠江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('485','49','三山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('486','49','芜湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('487','49','繁昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('488','49','南陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('489','50','宣州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('490','50','宁国市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('491','50','郎溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('492','50','广德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('493','50','泾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('494','50','绩溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('495','50','旌德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('496','51','涡阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('497','51','蒙城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('498','51','利辛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('499','51','谯城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('500','52','东城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('501','52','西城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('502','52','海淀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('503','52','朝阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('504','52','崇文区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('505','52','宣武区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('506','52','丰台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('507','52','石景山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('508','52','房山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('509','52','门头沟区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('510','52','通州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('511','52','顺义区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('512','52','昌平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('513','52','怀柔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('514','52','平谷区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('515','52','大兴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('516','52','密云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('517','52','延庆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('518','53','鼓楼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('519','53','台江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('520','53','仓山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('521','53','马尾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('522','53','晋安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('523','53','福清市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('524','53','长乐市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('525','53','闽侯县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('526','53','连江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('527','53','罗源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('528','53','闽清县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('529','53','永泰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('530','53','平潭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('531','54','新罗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('532','54','漳平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('533','54','长汀县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('534','54','永定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('535','54','上杭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('536','54','武平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('537','54','连城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('538','55','延平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('539','55','邵武市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('540','55','武夷山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('541','55','建瓯市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('542','55','建阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('543','55','顺昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('544','55','浦城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('545','55','光泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('546','55','松溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('547','55','政和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('548','56','蕉城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('549','56','福安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('550','56','福鼎市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('551','56','霞浦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('552','56','古田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('553','56','屏南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('554','56','寿宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('555','56','周宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('556','56','柘荣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('557','57','城厢区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('558','57','涵江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('559','57','荔城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('560','57','秀屿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('561','57','仙游县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('562','58','鲤城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('563','58','丰泽区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('564','58','洛江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('565','58','清濛开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('566','58','泉港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('567','58','石狮市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('568','58','晋江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('569','58','南安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('570','58','惠安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('571','58','安溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('572','58','永春县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('573','58','德化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('574','58','金门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('575','59','梅列区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('576','59','三元区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('577','59','永安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('578','59','明溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('579','59','清流县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('580','59','宁化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('581','59','大田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('582','59','尤溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('583','59','沙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('584','59','将乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('585','59','泰宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('586','59','建宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('587','60','思明区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('588','60','海沧区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('589','60','湖里区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('590','60','集美区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('591','60','同安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('592','60','翔安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('593','61','芗城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('594','61','龙文区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('595','61','龙海市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('596','61','云霄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('597','61','漳浦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('598','61','诏安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('599','61','长泰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('600','61','东山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('601','61','南靖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('602','61','平和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('603','61','华安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('604','62','皋兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('605','62','城关区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('606','62','七里河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('607','62','西固区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('608','62','安宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('609','62','红古区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('610','62','永登县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('611','62','榆中县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('612','63','白银区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('613','63','平川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('614','63','会宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('615','63','景泰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('616','63','靖远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('617','64','临洮县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('618','64','陇西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('619','64','通渭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('620','64','渭源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('621','64','漳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('622','64','岷县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('623','64','安定区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('624','64','安定区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('625','65','合作市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('626','65','临潭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('627','65','卓尼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('628','65','舟曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('629','65','迭部县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('630','65','玛曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('631','65','碌曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('632','65','夏河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('633','66','嘉峪关市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('634','67','金川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('635','67','永昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('636','68','肃州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('637','68','玉门市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('638','68','敦煌市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('639','68','金塔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('640','68','瓜州县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('641','68','肃北','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('642','68','阿克塞','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('643','69','临夏市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('644','69','临夏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('645','69','康乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('646','69','永靖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('647','69','广河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('648','69','和政县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('649','69','东乡族自治县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('650','69','积石山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('651','70','成县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('652','70','徽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('653','70','康县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('654','70','礼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('655','70','两当县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('656','70','文县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('657','70','西和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('658','70','宕昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('659','70','武都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('660','71','崇信县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('661','71','华亭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('662','71','静宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('663','71','灵台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('664','71','崆峒区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('665','71','庄浪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('666','71','泾川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('667','72','合水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('668','72','华池县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('669','72','环县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('670','72','宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('671','72','庆城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('672','72','西峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('673','72','镇原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('674','72','正宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('675','73','甘谷县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('676','73','秦安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('677','73','清水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('678','73','秦州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('679','73','麦积区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('680','73','武山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('681','73','张家川','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('682','74','古浪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('683','74','民勤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('684','74','天祝','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('685','74','凉州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('686','75','高台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('687','75','临泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('688','75','民乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('689','75','山丹县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('690','75','肃南','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('691','75','甘州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('692','76','从化市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('693','76','天河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('694','76','东山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('695','76','白云区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('696','76','海珠区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('697','76','荔湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('698','76','越秀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('699','76','黄埔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('700','76','番禺区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('701','76','花都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('702','76','增城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('703','76','从化区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('704','76','市郊','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('705','77','福田区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('706','77','罗湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('707','77','南山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('708','77','宝安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('709','77','龙岗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('710','77','盐田区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('711','78','湘桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('712','78','潮安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('713','78','饶平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('714','79','南城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('715','79','东城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('716','79','万江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('717','79','莞城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('718','79','石龙镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('719','79','虎门镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('720','79','麻涌镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('721','79','道滘镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('722','79','石碣镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('723','79','沙田镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('724','79','望牛墩镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('725','79','洪梅镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('726','79','茶山镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('727','79','寮步镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('728','79','大岭山镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('729','79','大朗镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('730','79','黄江镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('731','79','樟木头','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('732','79','凤岗镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('733','79','塘厦镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('734','79','谢岗镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('735','79','厚街镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('736','79','清溪镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('737','79','常平镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('738','79','桥头镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('739','79','横沥镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('740','79','东坑镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('741','79','企石镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('742','79','石排镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('743','79','长安镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('744','79','中堂镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('745','79','高埗镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('746','80','禅城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('747','80','南海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('748','80','顺德区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('749','80','三水区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('750','80','高明区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('751','81','东源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('752','81','和平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('753','81','源城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('754','81','连平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('755','81','龙川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('756','81','紫金县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('757','82','惠阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('758','82','惠城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('759','82','大亚湾','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('760','82','博罗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('761','82','惠东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('762','82','龙门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('763','83','江海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('764','83','蓬江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('765','83','新会区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('766','83','台山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('767','83','开平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('768','83','鹤山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('769','83','恩平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('770','84','榕城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('771','84','普宁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('772','84','揭东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('773','84','揭西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('774','84','惠来县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('775','85','茂南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('776','85','茂港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('777','85','高州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('778','85','化州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('779','85','信宜市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('780','85','电白县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('781','86','梅县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('782','86','梅江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('783','86','兴宁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('784','86','大埔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('785','86','丰顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('786','86','五华县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('787','86','平远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('788','86','蕉岭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('789','87','清城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('790','87','英德市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('791','87','连州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('792','87','佛冈县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('793','87','阳山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('794','87','清新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('795','87','连山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('796','87','连南','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('797','88','南澳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('798','88','潮阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('799','88','澄海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('800','88','龙湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('801','88','金平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('802','88','濠江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('803','88','潮南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('804','89','城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('805','89','陆丰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('806','89','海丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('807','89','陆河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('808','90','曲江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('809','90','浈江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('810','90','武江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('811','90','曲江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('812','90','乐昌市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('813','90','南雄市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('814','90','始兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('815','90','仁化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('816','90','翁源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('817','90','新丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('818','90','乳源','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('819','91','江城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('820','91','阳春市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('821','91','阳西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('822','91','阳东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('823','92','云城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('824','92','罗定市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('825','92','新兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('826','92','郁南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('827','92','云安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('828','93','赤坎区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('829','93','霞山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('830','93','坡头区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('831','93','麻章区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('832','93','廉江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('833','93','雷州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('834','93','吴川市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('835','93','遂溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('836','93','徐闻县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('837','94','肇庆市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('838','94','高要市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('839','94','四会市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('840','94','广宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('841','94','怀集县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('842','94','封开县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('843','94','德庆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('844','95','石岐街道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('845','95','东区街道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('846','95','西区街道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('847','95','环城街道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('848','95','中山港街道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('849','95','五桂山街道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('850','96','香洲区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('851','96','斗门区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('852','96','金湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('853','97','邕宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('854','97','青秀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('855','97','兴宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('856','97','良庆区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('857','97','西乡塘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('858','97','江南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('859','97','武鸣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('860','97','隆安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('861','97','马山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('862','97','上林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('863','97','宾阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('864','97','横县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('865','98','秀峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('866','98','叠彩区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('867','98','象山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('868','98','七星区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('869','98','雁山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('870','98','阳朔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('871','98','临桂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('872','98','灵川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('873','98','全州县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('874','98','平乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('875','98','兴安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('876','98','灌阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('877','98','荔浦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('878','98','资源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('879','98','永福县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('880','98','龙胜','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('881','98','恭城','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('882','99','右江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('883','99','凌云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('884','99','平果县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('885','99','西林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('886','99','乐业县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('887','99','德保县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('888','99','田林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('889','99','田阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('890','99','靖西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('891','99','田东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('892','99','那坡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('893','99','隆林','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('894','100','海城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('895','100','银海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('896','100','铁山港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('897','100','合浦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('898','101','江州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('899','101','凭祥市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('900','101','宁明县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('901','101','扶绥县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('902','101','龙州县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('903','101','大新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('904','101','天等县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('905','102','港口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('906','102','防城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('907','102','东兴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('908','102','上思县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('909','103','港北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('910','103','港南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('911','103','覃塘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('912','103','桂平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('913','103','平南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('914','104','金城江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('915','104','宜州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('916','104','天峨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('917','104','凤山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('918','104','南丹县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('919','104','东兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('920','104','都安','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('921','104','罗城','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('922','104','巴马','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('923','104','环江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('924','104','大化','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('925','105','八步区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('926','105','钟山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('927','105','昭平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('928','105','富川','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('929','106','兴宾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('930','106','合山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('931','106','象州县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('932','106','武宣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('933','106','忻城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('934','106','金秀','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('935','107','城中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('936','107','鱼峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('937','107','柳北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('938','107','柳南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('939','107','柳江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('940','107','柳城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('941','107','鹿寨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('942','107','融安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('943','107','融水','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('944','107','三江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('945','108','钦南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('946','108','钦北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('947','108','灵山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('948','108','浦北县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('949','109','万秀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('950','109','蝶山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('951','109','长洲区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('952','109','岑溪市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('953','109','苍梧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('954','109','藤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('955','109','蒙山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('956','110','玉州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('957','110','北流市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('958','110','容县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('959','110','陆川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('960','110','博白县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('961','110','兴业县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('962','111','南明区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('963','111','云岩区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('964','111','花溪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('965','111','乌当区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('966','111','白云区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('967','111','小河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('968','111','金阳新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('969','111','新天园区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('970','111','清镇市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('971','111','开阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('972','111','修文县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('973','111','息烽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('974','112','西秀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('975','112','关岭','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('976','112','镇宁','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('977','112','紫云','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('978','112','平坝县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('979','112','普定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('980','113','毕节市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('981','113','大方县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('982','113','黔西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('983','113','金沙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('984','113','织金县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('985','113','纳雍县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('986','113','赫章县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('987','113','威宁','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('988','114','钟山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('989','114','六枝特区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('990','114','水城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('991','114','盘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('992','115','凯里市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('993','115','黄平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('994','115','施秉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('995','115','三穗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('996','115','镇远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('997','115','岑巩县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('998','115','天柱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('999','115','锦屏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1000','115','剑河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1001','115','台江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1002','115','黎平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1003','115','榕江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1004','115','从江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1005','115','雷山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1006','115','麻江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1007','115','丹寨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1008','116','都匀市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1009','116','福泉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1010','116','荔波县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1011','116','贵定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1012','116','瓮安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1013','116','独山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1014','116','平塘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1015','116','罗甸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1016','116','长顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1017','116','龙里县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1018','116','惠水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1019','116','三都','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1020','117','兴义市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1021','117','兴仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1022','117','普安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1023','117','晴隆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1024','117','贞丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1025','117','望谟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1026','117','册亨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1027','117','安龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1028','118','铜仁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1029','118','江口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1030','118','石阡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1031','118','思南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1032','118','德江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1033','118','玉屏','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1034','118','印江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1035','118','沿河','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1036','118','松桃','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1037','118','万山特区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1038','119','红花岗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1039','119','务川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1040','119','道真县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1041','119','汇川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1042','119','赤水市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1043','119','仁怀市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1044','119','遵义县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1045','119','桐梓县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1046','119','绥阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1047','119','正安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1048','119','凤冈县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1049','119','湄潭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1050','119','余庆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1051','119','习水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1052','119','道真','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1053','119','务川','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1054','120','秀英区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1055','120','龙华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1056','120','琼山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1057','120','美兰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1058','137','市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1059','137','洋浦开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1060','137','那大镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1061','137','王五镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1062','137','雅星镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1063','137','大成镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1064','137','中和镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1065','137','峨蔓镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1066','137','南丰镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1067','137','白马井镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1068','137','兰洋镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1069','137','和庆镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1070','137','海头镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1071','137','排浦镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1072','137','东成镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1073','137','光村镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1074','137','木棠镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1075','137','新州镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1076','137','三都镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1077','137','其他','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1078','138','长安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1079','138','桥东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1080','138','桥西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1081','138','新华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1082','138','裕华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1083','138','井陉矿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1084','138','高新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1085','138','辛集市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1086','138','藁城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1087','138','晋州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1088','138','新乐市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1089','138','鹿泉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1090','138','井陉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1091','138','正定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1092','138','栾城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1093','138','行唐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1094','138','灵寿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1095','138','高邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1096','138','深泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1097','138','赞皇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1098','138','无极县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1099','138','平山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1100','138','元氏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1101','138','赵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1102','139','新市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1103','139','南市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1104','139','北市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1105','139','涿州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1106','139','定州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1107','139','安国市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1108','139','高碑店市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1109','139','满城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1110','139','清苑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1111','139','涞水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1112','139','阜平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1113','139','徐水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1114','139','定兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1115','139','唐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1116','139','高阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1117','139','容城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1118','139','涞源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1119','139','望都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1120','139','安新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1121','139','易县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1122','139','曲阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1123','139','蠡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1124','139','顺平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1125','139','博野县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1126','139','雄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1127','140','运河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1128','140','新华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1129','140','泊头市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1130','140','任丘市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1131','140','黄骅市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1132','140','河间市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1133','140','沧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1134','140','青县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1135','140','东光县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1136','140','海兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1137','140','盐山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1138','140','肃宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1139','140','南皮县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1140','140','吴桥县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1141','140','献县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1142','140','孟村','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1143','141','双桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1144','141','双滦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1145','141','鹰手营子矿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1146','141','承德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1147','141','兴隆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1148','141','平泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1149','141','滦平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1150','141','隆化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1151','141','丰宁','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1152','141','宽城','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1153','141','围场','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1154','142','从台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1155','142','复兴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1156','142','邯山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1157','142','峰峰矿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1158','142','武安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1159','142','邯郸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1160','142','临漳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1161','142','成安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1162','142','大名县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1163','142','涉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1164','142','磁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1165','142','肥乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1166','142','永年县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1167','142','邱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1168','142','鸡泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1169','142','广平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1170','142','馆陶县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1171','142','魏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1172','142','曲周县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1173','143','桃城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1174','143','冀州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1175','143','深州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1176','143','枣强县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1177','143','武邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1178','143','武强县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1179','143','饶阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1180','143','安平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1181','143','故城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1182','143','景县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1183','143','阜城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1184','144','安次区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1185','144','广阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1186','144','霸州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1187','144','三河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1188','144','固安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1189','144','永清县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1190','144','香河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1191','144','大城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1192','144','文安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1193','144','大厂','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1194','145','海港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1195','145','山海关区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1196','145','北戴河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1197','145','昌黎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1198','145','抚宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1199','145','卢龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1200','145','青龙','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1201','146','路北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1202','146','路南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1203','146','古冶区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1204','146','开平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1205','146','丰南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1206','146','丰润区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1207','146','遵化市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1208','146','迁安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1209','146','滦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1210','146','滦南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1211','146','乐亭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1212','146','迁西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1213','146','玉田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1214','146','唐海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1215','147','桥东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1216','147','桥西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1217','147','南宫市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1218','147','沙河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1219','147','邢台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1220','147','临城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1221','147','内丘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1222','147','柏乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1223','147','隆尧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1224','147','任县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1225','147','南和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1226','147','宁晋县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1227','147','巨鹿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1228','147','新河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1229','147','广宗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1230','147','平乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1231','147','威县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1232','147','清河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1233','147','临西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1234','148','桥西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1235','148','桥东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1236','148','宣化区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1237','148','下花园区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1238','148','宣化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1239','148','张北县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1240','148','康保县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1241','148','沽源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1242','148','尚义县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1243','148','蔚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1244','148','阳原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1245','148','怀安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1246','148','万全县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1247','148','怀来县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1248','148','涿鹿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1249','148','赤城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1250','148','崇礼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1251','149','金水区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1252','149','邙山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1253','149','二七区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1254','149','管城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1255','149','中原区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1256','149','上街区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1257','149','惠济区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1258','149','郑东新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1259','149','经济技术开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1260','149','高新开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1261','149','出口加工区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1262','149','巩义市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1263','149','荥阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1264','149','新密市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1265','149','新郑市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1266','149','登封市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1267','149','中牟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1268','150','西工区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1269','150','老城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1270','150','涧西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1271','150','瀍河回族区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1272','150','洛龙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1273','150','吉利区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1274','150','偃师市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1275','150','孟津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1276','150','新安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1277','150','栾川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1278','150','嵩县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1279','150','汝阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1280','150','宜阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1281','150','洛宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1282','150','伊川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1283','151','鼓楼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1284','151','龙亭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1285','151','顺河回族区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1286','151','金明区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1287','151','禹王台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1288','151','杞县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1289','151','通许县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1290','151','尉氏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1291','151','开封县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1292','151','兰考县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1293','152','北关区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1294','152','文峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1295','152','殷都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1296','152','龙安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1297','152','林州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1298','152','安阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1299','152','汤阴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1300','152','滑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1301','152','内黄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1302','153','淇滨区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1303','153','山城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1304','153','鹤山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1305','153','浚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1306','153','淇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1307','154','济源市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1308','155','解放区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1309','155','中站区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1310','155','马村区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1311','155','山阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1312','155','沁阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1313','155','孟州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1314','155','修武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1315','155','博爱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1316','155','武陟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1317','155','温县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1318','156','卧龙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1319','156','宛城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1320','156','邓州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1321','156','南召县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1322','156','方城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1323','156','西峡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1324','156','镇平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1325','156','内乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1326','156','淅川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1327','156','社旗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1328','156','唐河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1329','156','新野县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1330','156','桐柏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1331','157','新华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1332','157','卫东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1333','157','湛河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1334','157','石龙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1335','157','舞钢市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1336','157','汝州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1337','157','宝丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1338','157','叶县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1339','157','鲁山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1340','157','郏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1341','158','湖滨区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1342','158','义马市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1343','158','灵宝市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1344','158','渑池县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1345','158','陕县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1346','158','卢氏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1347','159','梁园区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1348','159','睢阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1349','159','永城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1350','159','民权县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1351','159','睢县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1352','159','宁陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1353','159','虞城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1354','159','柘城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1355','159','夏邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1356','160','卫滨区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1357','160','红旗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1358','160','凤泉区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1359','160','牧野区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1360','160','卫辉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1361','160','辉县市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1362','160','新乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1363','160','获嘉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1364','160','原阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1365','160','延津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1366','160','封丘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1367','160','长垣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1368','161','浉河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1369','161','平桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1370','161','罗山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1371','161','光山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1372','161','新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1373','161','商城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1374','161','固始县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1375','161','潢川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1376','161','淮滨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1377','161','息县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1378','162','魏都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1379','162','禹州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1380','162','长葛市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1381','162','许昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1382','162','鄢陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1383','162','襄城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1384','163','川汇区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1385','163','项城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1386','163','扶沟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1387','163','西华县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1388','163','商水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1389','163','沈丘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1390','163','郸城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1391','163','淮阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1392','163','太康县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1393','163','鹿邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1394','164','驿城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1395','164','西平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1396','164','上蔡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1397','164','平舆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1398','164','正阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1399','164','确山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1400','164','泌阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1401','164','汝南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1402','164','遂平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1403','164','新蔡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1404','165','郾城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1405','165','源汇区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1406','165','召陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1407','165','舞阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1408','165','临颍县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1409','166','华龙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1410','166','清丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1411','166','南乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1412','166','范县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1413','166','台前县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1414','166','濮阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1415','167','道里区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1416','167','南岗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1417','167','动力区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1418','167','平房区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1419','167','香坊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1420','167','太平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1421','167','道外区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1422','167','阿城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1423','167','呼兰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1424','167','松北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1425','167','尚志市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1426','167','双城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1427','167','五常市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1428','167','方正县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1429','167','宾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1430','167','依兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1431','167','巴彦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1432','167','通河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1433','167','木兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1434','167','延寿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1435','168','萨尔图区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1436','168','红岗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1437','168','龙凤区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1438','168','让胡路区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1439','168','大同区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1440','168','肇州县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1441','168','肇源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1442','168','林甸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1443','168','杜尔伯特','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1444','169','呼玛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1445','169','漠河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1446','169','塔河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1447','170','兴山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1448','170','工农区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1449','170','南山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1450','170','兴安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1451','170','向阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1452','170','东山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1453','170','萝北县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1454','170','绥滨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1455','171','爱辉区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1456','171','五大连池市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1457','171','北安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1458','171','嫩江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1459','171','逊克县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1460','171','孙吴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1461','172','鸡冠区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1462','172','恒山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1463','172','城子河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1464','172','滴道区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1465','172','梨树区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1466','172','虎林市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1467','172','密山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1468','172','鸡东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1469','173','前进区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1470','173','郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1471','173','向阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1472','173','东风区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1473','173','同江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1474','173','富锦市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1475','173','桦南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1476','173','桦川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1477','173','汤原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1478','173','抚远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1479','174','爱民区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1480','174','东安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1481','174','阳明区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1482','174','西安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1483','174','绥芬河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1484','174','海林市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1485','174','宁安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1486','174','穆棱市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1487','174','东宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1488','174','林口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1489','175','桃山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1490','175','新兴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1491','175','茄子河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1492','175','勃利县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1493','176','龙沙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1494','176','昂昂溪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1495','176','铁峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1496','176','建华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1497','176','富拉尔基区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1498','176','碾子山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1499','176','梅里斯达斡尔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1500','176','讷河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1501','176','龙江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1502','176','依安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1503','176','泰来县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1504','176','甘南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1505','176','富裕县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1506','176','克山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1507','176','克东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1508','176','拜泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1509','177','尖山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1510','177','岭东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1511','177','四方台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1512','177','宝山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1513','177','集贤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1514','177','友谊县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1515','177','宝清县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1516','177','饶河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1517','178','北林区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1518','178','安达市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1519','178','肇东市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1520','178','海伦市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1521','178','望奎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1522','178','兰西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1523','178','青冈县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1524','178','庆安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1525','178','明水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1526','178','绥棱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1527','179','伊春区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1528','179','带岭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1529','179','南岔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1530','179','金山屯区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1531','179','西林区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1532','179','美溪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1533','179','乌马河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1534','179','翠峦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1535','179','友好区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1536','179','上甘岭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1537','179','五营区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1538','179','红星区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1539','179','新青区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1540','179','汤旺河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1541','179','乌伊岭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1542','179','铁力市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1543','179','嘉荫县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1544','180','江岸区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1545','180','武昌区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1546','180','江汉区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1547','180','硚口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1548','180','汉阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1549','180','青山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1550','180','洪山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1551','180','东西湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1552','180','汉南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1553','180','蔡甸区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1554','180','江夏区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1555','180','黄陂区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1556','180','新洲区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1557','180','经济开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1558','181','仙桃市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1559','182','鄂城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1560','182','华容区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1561','182','梁子湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1562','183','黄州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1563','183','麻城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1564','183','武穴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1565','183','团风县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1566','183','红安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1567','183','罗田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1568','183','英山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1569','183','浠水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1570','183','蕲春县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1571','183','黄梅县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1572','184','黄石港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1573','184','西塞山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1574','184','下陆区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1575','184','铁山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1576','184','大冶市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1577','184','阳新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1578','185','东宝区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1579','185','掇刀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1580','185','钟祥市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1581','185','京山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1582','185','沙洋县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1583','186','沙市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1584','186','荆州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1585','186','石首市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1586','186','洪湖市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1587','186','松滋市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1588','186','公安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1589','186','监利县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1590','186','江陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1591','187','潜江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1592','188','神农架林区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1593','189','张湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1594','189','茅箭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1595','189','丹江口市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1596','189','郧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1597','189','郧西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1598','189','竹山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1599','189','竹溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1600','189','房县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1601','190','曾都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1602','190','广水市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1603','191','天门市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1604','192','咸安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1605','192','赤壁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1606','192','嘉鱼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1607','192','通城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1608','192','崇阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1609','192','通山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1610','193','襄城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1611','193','樊城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1612','193','襄阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1613','193','老河口市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1614','193','枣阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1615','193','宜城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1616','193','南漳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1617','193','谷城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1618','193','保康县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1619','194','孝南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1620','194','应城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1621','194','安陆市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1622','194','汉川市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1623','194','孝昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1624','194','大悟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1625','194','云梦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1626','195','长阳','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1627','195','五峰','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1628','195','西陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1629','195','伍家岗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1630','195','点军区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1631','195','猇亭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1632','195','夷陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1633','195','宜都市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1634','195','当阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1635','195','枝江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1636','195','远安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1637','195','兴山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1638','195','秭归县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1639','196','恩施市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1640','196','利川市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1641','196','建始县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1642','196','巴东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1643','196','宣恩县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1644','196','咸丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1645','196','来凤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1646','196','鹤峰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1647','197','岳麓区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1648','197','芙蓉区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1649','197','天心区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1650','197','开福区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1651','197','雨花区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1652','197','开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1653','197','浏阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1654','197','长沙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1655','197','望城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1656','197','宁乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1657','198','永定区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1658','198','武陵源区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1659','198','慈利县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1660','198','桑植县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1661','199','武陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1662','199','鼎城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1663','199','津市市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1664','199','安乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1665','199','汉寿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1666','199','澧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1667','199','临澧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1668','199','桃源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1669','199','石门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1670','200','北湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1671','200','苏仙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1672','200','资兴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1673','200','桂阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1674','200','宜章县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1675','200','永兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1676','200','嘉禾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1677','200','临武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1678','200','汝城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1679','200','桂东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1680','200','安仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1681','201','雁峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1682','201','珠晖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1683','201','石鼓区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1684','201','蒸湘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1685','201','南岳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1686','201','耒阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1687','201','常宁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1688','201','衡阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1689','201','衡南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1690','201','衡山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1691','201','衡东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1692','201','祁东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1693','202','鹤城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1694','202','靖州','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1695','202','麻阳','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1696','202','通道','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1697','202','新晃','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1698','202','芷江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1699','202','沅陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1700','202','辰溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1701','202','溆浦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1702','202','中方县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1703','202','会同县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1704','202','洪江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1705','203','娄星区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1706','203','冷水江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1707','203','涟源市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1708','203','双峰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1709','203','新化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1710','204','城步','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1711','204','双清区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1712','204','大祥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1713','204','北塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1714','204','武冈市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1715','204','邵东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1716','204','新邵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1717','204','邵阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1718','204','隆回县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1719','204','洞口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1720','204','绥宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1721','204','新宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1722','205','岳塘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1723','205','雨湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1724','205','湘乡市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1725','205','韶山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1726','205','湘潭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1727','206','吉首市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1728','206','泸溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1729','206','凤凰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1730','206','花垣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1731','206','保靖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1732','206','古丈县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1733','206','永顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1734','206','龙山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1735','207','赫山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1736','207','资阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1737','207','沅江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1738','207','南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1739','207','桃江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1740','207','安化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1741','208','江华','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1742','208','冷水滩区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1743','208','零陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1744','208','祁阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1745','208','东安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1746','208','双牌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1747','208','道县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1748','208','江永县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1749','208','宁远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1750','208','蓝山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1751','208','新田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1752','209','岳阳楼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1753','209','君山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1754','209','云溪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1755','209','汨罗市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1756','209','临湘市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1757','209','岳阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1758','209','华容县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1759','209','湘阴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1760','209','平江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1761','210','天元区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1762','210','荷塘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1763','210','芦淞区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1764','210','石峰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1765','210','醴陵市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1766','210','株洲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1767','210','攸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1768','210','茶陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1769','210','炎陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1770','211','朝阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1771','211','宽城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1772','211','二道区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1773','211','南关区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1774','211','绿园区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1775','211','双阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1776','211','净月潭开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1777','211','高新技术开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1778','211','经济技术开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1779','211','汽车产业开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1780','211','德惠市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1781','211','九台市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1782','211','榆树市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1783','211','农安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1784','212','船营区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1785','212','昌邑区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1786','212','龙潭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1787','212','丰满区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1788','212','蛟河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1789','212','桦甸市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1790','212','舒兰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1791','212','磐石市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1792','212','永吉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1793','213','洮北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1794','213','洮南市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1795','213','大安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1796','213','镇赉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1797','213','通榆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1798','214','江源区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1799','214','八道江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1800','214','长白','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1801','214','临江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1802','214','抚松县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1803','214','靖宇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1804','215','龙山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1805','215','西安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1806','215','东丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1807','215','东辽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1808','216','铁西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1809','216','铁东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1810','216','伊通','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1811','216','公主岭市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1812','216','双辽市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1813','216','梨树县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1814','217','前郭尔罗斯','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1815','217','宁江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1816','217','长岭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1817','217','乾安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1818','217','扶余县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1819','218','东昌区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1820','218','二道江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1821','218','梅河口市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1822','218','集安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1823','218','通化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1824','218','辉南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1825','218','柳河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1826','219','延吉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1827','219','图们市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1828','219','敦化市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1829','219','珲春市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1830','219','龙井市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1831','219','和龙市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1832','219','安图县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1833','219','汪清县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1834','220','玄武区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1835','220','鼓楼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1836','220','白下区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1837','220','建邺区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1838','220','秦淮区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1839','220','雨花台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1840','220','下关区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1841','220','栖霞区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1842','220','浦口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1843','220','江宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1844','220','六合区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1845','220','溧水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1846','220','高淳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1847','221','沧浪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1848','221','金阊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1849','221','平江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1850','221','虎丘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1851','221','吴中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1852','221','相城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1853','221','园区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1854','221','新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1855','221','常熟市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1856','221','张家港市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1857','221','玉山镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1858','221','巴城镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1859','221','周市镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1860','221','陆家镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1861','221','花桥镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1862','221','淀山湖镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1863','221','张浦镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1864','221','周庄镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1865','221','千灯镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1866','221','锦溪镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1867','221','开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1868','221','吴江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1869','221','太仓市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1870','222','崇安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1871','222','北塘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1872','222','南长区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1873','222','锡山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1874','222','惠山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1875','222','滨湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1876','222','新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1877','222','江阴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1878','222','宜兴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1879','223','天宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1880','223','钟楼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1881','223','戚墅堰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1882','223','郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1883','223','新北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1884','223','武进区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1885','223','溧阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1886','223','金坛市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1887','224','清河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1888','224','清浦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1889','224','楚州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1890','224','淮阴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1891','224','涟水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1892','224','洪泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1893','224','盱眙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1894','224','金湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1895','225','新浦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1896','225','连云区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1897','225','海州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1898','225','赣榆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1899','225','东海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1900','225','灌云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1901','225','灌南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1902','226','崇川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1903','226','港闸区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1904','226','经济开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1905','226','启东市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1906','226','如皋市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1907','226','通州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1908','226','海门市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1909','226','海安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1910','226','如东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1911','227','宿城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1912','227','宿豫区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1913','227','宿豫县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1914','227','沭阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1915','227','泗阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1916','227','泗洪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1917','228','海陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1918','228','高港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1919','228','兴化市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1920','228','靖江市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1921','228','泰兴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1922','228','姜堰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1923','229','云龙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1924','229','鼓楼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1925','229','九里区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1926','229','贾汪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1927','229','泉山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1928','229','新沂市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1929','229','邳州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1930','229','丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1931','229','沛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1932','229','铜山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1933','229','睢宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1934','230','城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1935','230','亭湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1936','230','盐都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1937','230','盐都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1938','230','东台市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1939','230','大丰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1940','230','响水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1941','230','滨海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1942','230','阜宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1943','230','射阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1944','230','建湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1945','231','广陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1946','231','维扬区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1947','231','邗江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1948','231','仪征市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1949','231','高邮市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1950','231','江都市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1951','231','宝应县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1952','232','京口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1953','232','润州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1954','232','丹徒区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1955','232','丹阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1956','232','扬中市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1957','232','句容市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1958','233','东湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1959','233','西湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1960','233','青云谱区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1961','233','湾里区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1962','233','青山湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1963','233','红谷滩新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1964','233','昌北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1965','233','高新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1966','233','南昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1967','233','新建县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1968','233','安义县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1969','233','进贤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1970','234','临川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1971','234','南城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1972','234','黎川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1973','234','南丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1974','234','崇仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1975','234','乐安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1976','234','宜黄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1977','234','金溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1978','234','资溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1979','234','东乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1980','234','广昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1981','235','章贡区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1982','235','于都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1983','235','瑞金市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1984','235','南康市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1985','235','赣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1986','235','信丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1987','235','大余县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1988','235','上犹县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1989','235','崇义县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1990','235','安远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1991','235','龙南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1992','235','定南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1993','235','全南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1994','235','宁都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1995','235','兴国县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1996','235','会昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1997','235','寻乌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1998','235','石城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1999','236','安福县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2000','236','吉州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2001','236','青原区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2002','236','井冈山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2003','236','吉安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2004','236','吉水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2005','236','峡江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2006','236','新干县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2007','236','永丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2008','236','泰和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2009','236','遂川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2010','236','万安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2011','236','永新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2012','237','珠山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2013','237','昌江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2014','237','乐平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2015','237','浮梁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2016','238','浔阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2017','238','庐山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2018','238','瑞昌市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2019','238','九江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2020','238','武宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2021','238','修水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2022','238','永修县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2023','238','德安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2024','238','星子县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2025','238','都昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2026','238','湖口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2027','238','彭泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2028','239','安源区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2029','239','湘东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2030','239','莲花县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2031','239','芦溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2032','239','上栗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2033','240','信州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2034','240','德兴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2035','240','上饶县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2036','240','广丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2037','240','玉山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2038','240','铅山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2039','240','横峰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2040','240','弋阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2041','240','余干县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2042','240','波阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2043','240','万年县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2044','240','婺源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2045','241','渝水区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2046','241','分宜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2047','242','袁州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2048','242','丰城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2049','242','樟树市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2050','242','高安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2051','242','奉新县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2052','242','万载县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2053','242','上高县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2054','242','宜丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2055','242','靖安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2056','242','铜鼓县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2057','243','月湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2058','243','贵溪市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2059','243','余江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2060','244','沈河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2061','244','皇姑区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2062','244','和平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2063','244','大东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2064','244','铁西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2065','244','苏家屯区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2066','244','东陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2067','244','沈北新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2068','244','于洪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2069','244','浑南新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2070','244','新民市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2071','244','辽中县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2072','244','康平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2073','244','法库县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2074','245','西岗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2075','245','中山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2076','245','沙河口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2077','245','甘井子区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2078','245','旅顺口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2079','245','金州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2080','245','开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2081','245','瓦房店市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2082','245','普兰店市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2083','245','庄河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2084','245','长海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2085','246','铁东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2086','246','铁西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2087','246','立山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2088','246','千山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2089','246','岫岩','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2090','246','海城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2091','246','台安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2092','247','本溪','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2093','247','平山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2094','247','明山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2095','247','溪湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2096','247','南芬区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2097','247','桓仁','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2098','248','双塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2099','248','龙城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2100','248','喀喇沁左翼蒙古族自治','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2101','248','北票市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2102','248','凌源市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2103','248','朝阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2104','248','建平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2105','249','振兴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2106','249','元宝区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2107','249','振安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2108','249','宽甸','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2109','249','东港市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2110','249','凤城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2111','250','顺城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2112','250','新抚区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2113','250','东洲区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2114','250','望花区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2115','250','清原','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2116','250','新宾','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2117','250','抚顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2118','251','阜新','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2119','251','海州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2120','251','新邱区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2121','251','太平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2122','251','清河门区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2123','251','细河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2124','251','彰武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2125','252','龙港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2126','252','南票区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2127','252','连山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2128','252','兴城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2129','252','绥中县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2130','252','建昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2131','253','太和区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2132','253','古塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2133','253','凌河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2134','253','凌海市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2135','253','北镇市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2136','253','黑山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2137','253','义县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2138','254','白塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2139','254','文圣区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2140','254','宏伟区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2141','254','太子河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2142','254','弓长岭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2143','254','灯塔市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2144','254','辽阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2145','255','双台子区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2146','255','兴隆台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2147','255','大洼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2148','255','盘山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2149','256','银州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2150','256','清河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2151','256','调兵山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2152','256','开原市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2153','256','铁岭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2154','256','西丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2155','256','昌图县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2156','257','站前区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2157','257','西市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2158','257','鲅鱼圈区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2159','257','老边区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2160','257','盖州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2161','257','大石桥市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2162','258','回民区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2163','258','玉泉区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2164','258','新城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2165','258','赛罕区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2166','258','清水河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2167','258','土默特左旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2168','258','托克托县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2169','258','和林格尔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2170','258','武川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2171','259','阿拉善左旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2172','259','阿拉善右旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2173','259','额济纳旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2174','260','临河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2175','260','五原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2176','260','磴口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2177','260','乌拉特前旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2178','260','乌拉特中旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2179','260','乌拉特后旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2180','260','杭锦后旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2181','261','昆都仑区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2182','261','青山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2183','261','东河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2184','261','九原区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2185','261','石拐区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2186','261','白云矿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2187','261','土默特右旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2188','261','固阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2189','261','达尔罕茂明安联合旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2190','262','红山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2191','262','元宝山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2192','262','松山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2193','262','阿鲁科尔沁旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2194','262','巴林左旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2195','262','巴林右旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2196','262','林西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2197','262','克什克腾旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2198','262','翁牛特旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2199','262','喀喇沁旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2200','262','宁城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2201','262','敖汉旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2202','263','东胜区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2203','263','达拉特旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2204','263','准格尔旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2205','263','鄂托克前旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2206','263','鄂托克旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2207','263','杭锦旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2208','263','乌审旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2209','263','伊金霍洛旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2210','264','海拉尔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2211','264','莫力达瓦','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2212','264','满洲里市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2213','264','牙克石市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2214','264','扎兰屯市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2215','264','额尔古纳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2216','264','根河市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2217','264','阿荣旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2218','264','鄂伦春自治旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2219','264','鄂温克族自治旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2220','264','陈巴尔虎旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2221','264','新巴尔虎左旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2222','264','新巴尔虎右旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2223','265','科尔沁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2224','265','霍林郭勒市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2225','265','科尔沁左翼中旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2226','265','科尔沁左翼后旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2227','265','开鲁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2228','265','库伦旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2229','265','奈曼旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2230','265','扎鲁特旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2231','266','海勃湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2232','266','乌达区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2233','266','海南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2234','267','化德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2235','267','集宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2236','267','丰镇市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2237','267','卓资县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2238','267','商都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2239','267','兴和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2240','267','凉城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2241','267','察哈尔右翼前旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2242','267','察哈尔右翼中旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2243','267','察哈尔右翼后旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2244','267','四子王旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2245','268','二连浩特市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2246','268','锡林浩特市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2247','268','阿巴嘎旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2248','268','苏尼特左旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2249','268','苏尼特右旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2250','268','东乌珠穆沁旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2251','268','西乌珠穆沁旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2252','268','太仆寺旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2253','268','镶黄旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2254','268','正镶白旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2255','268','正蓝旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2256','268','多伦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2257','269','乌兰浩特市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2258','269','阿尔山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2259','269','科尔沁右翼前旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2260','269','科尔沁右翼中旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2261','269','扎赉特旗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2262','269','突泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2263','270','西夏区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2264','270','金凤区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2265','270','兴庆区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2266','270','灵武市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2267','270','永宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2268','270','贺兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2269','271','原州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2270','271','海原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2271','271','西吉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2272','271','隆德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2273','271','泾源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2274','271','彭阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2275','272','惠农县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2276','272','大武口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2277','272','惠农区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2278','272','陶乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2279','272','平罗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2280','273','利通区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2281','273','中卫县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2282','273','青铜峡市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2283','273','中宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2284','273','盐池县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2285','273','同心县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2286','274','沙坡头区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2287','274','海原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2288','274','中宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2289','275','城中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2290','275','城东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2291','275','城西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2292','275','城北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2293','275','湟中县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2294','275','湟源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2295','275','大通','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2296','276','玛沁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2297','276','班玛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2298','276','甘德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2299','276','达日县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2300','276','久治县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2301','276','玛多县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2302','277','海晏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2303','277','祁连县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2304','277','刚察县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2305','277','门源','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2306','278','平安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2307','278','乐都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2308','278','民和','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2309','278','互助','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2310','278','化隆','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2311','278','循化','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2312','279','共和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2313','279','同德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2314','279','贵德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2315','279','兴海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2316','279','贵南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2317','280','德令哈市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2318','280','格尔木市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2319','280','乌兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2320','280','都兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2321','280','天峻县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2322','281','同仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2323','281','尖扎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2324','281','泽库县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2325','281','河南蒙古族自治县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2326','282','玉树县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2327','282','杂多县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2328','282','称多县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2329','282','治多县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2330','282','囊谦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2331','282','曲麻莱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2332','283','市中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2333','283','历下区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2334','283','天桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2335','283','槐荫区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2336','283','历城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2337','283','长清区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2338','283','章丘市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2339','283','平阴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2340','283','济阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2341','283','商河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2342','284','市南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2343','284','市北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2344','284','城阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2345','284','四方区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2346','284','李沧区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2347','284','黄岛区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2348','284','崂山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2349','284','胶州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2350','284','即墨市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2351','284','平度市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2352','284','胶南市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2353','284','莱西市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2354','285','滨城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2355','285','惠民县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2356','285','阳信县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2357','285','无棣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2358','285','沾化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2359','285','博兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2360','285','邹平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2361','286','德城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2362','286','陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2363','286','乐陵市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2364','286','禹城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2365','286','宁津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2366','286','庆云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2367','286','临邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2368','286','齐河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2369','286','平原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2370','286','夏津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2371','286','武城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2372','287','东营区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2373','287','河口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2374','287','垦利县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2375','287','利津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2376','287','广饶县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2377','288','牡丹区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2378','288','曹县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2379','288','单县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2380','288','成武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2381','288','巨野县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2382','288','郓城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2383','288','鄄城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2384','288','定陶县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2385','288','东明县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2386','289','市中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2387','289','任城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2388','289','曲阜市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2389','289','兖州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2390','289','邹城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2391','289','微山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2392','289','鱼台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2393','289','金乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2394','289','嘉祥县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2395','289','汶上县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2396','289','泗水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2397','289','梁山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2398','290','莱城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2399','290','钢城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2400','291','东昌府区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2401','291','临清市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2402','291','阳谷县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2403','291','莘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2404','291','茌平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2405','291','东阿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2406','291','冠县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2407','291','高唐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2408','292','兰山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2409','292','罗庄区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2410','292','河东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2411','292','沂南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2412','292','郯城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2413','292','沂水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2414','292','苍山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2415','292','费县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2416','292','平邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2417','292','莒南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2418','292','蒙阴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2419','292','临沭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2420','293','东港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2421','293','岚山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2422','293','五莲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2423','293','莒县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2424','294','泰山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2425','294','岱岳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2426','294','新泰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2427','294','肥城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2428','294','宁阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2429','294','东平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2430','295','荣成市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2431','295','乳山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2432','295','环翠区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2433','295','文登市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2434','296','潍城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2435','296','寒亭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2436','296','坊子区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2437','296','奎文区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2438','296','青州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2439','296','诸城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2440','296','寿光市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2441','296','安丘市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2442','296','高密市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2443','296','昌邑市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2444','296','临朐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2445','296','昌乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2446','297','芝罘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2447','297','福山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2448','297','牟平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2449','297','莱山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2450','297','开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2451','297','龙口市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2452','297','莱阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2453','297','莱州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2454','297','蓬莱市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2455','297','招远市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2456','297','栖霞市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2457','297','海阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2458','297','长岛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2459','298','市中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2460','298','山亭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2461','298','峄城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2462','298','台儿庄区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2463','298','薛城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2464','298','滕州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2465','299','张店区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2466','299','临淄区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2467','299','淄川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2468','299','博山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2469','299','周村区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2470','299','桓台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2471','299','高青县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2472','299','沂源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2473','300','杏花岭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2474','300','小店区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2475','300','迎泽区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2476','300','尖草坪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2477','300','万柏林区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2478','300','晋源区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2479','300','高新开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2480','300','民营经济开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2481','300','经济技术开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2482','300','清徐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2483','300','阳曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2484','300','娄烦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2485','300','古交市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2486','301','城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2487','301','郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2488','301','沁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2489','301','潞城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2490','301','长治县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2491','301','襄垣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2492','301','屯留县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2493','301','平顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2494','301','黎城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2495','301','壶关县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2496','301','长子县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2497','301','武乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2498','301','沁源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2499','302','城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2500','302','矿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2501','302','南郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2502','302','新荣区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2503','302','阳高县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2504','302','天镇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2505','302','广灵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2506','302','灵丘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2507','302','浑源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2508','302','左云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2509','302','大同县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2510','303','城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2511','303','高平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2512','303','沁水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2513','303','阳城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2514','303','陵川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2515','303','泽州县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2516','304','榆次区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2517','304','介休市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2518','304','榆社县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2519','304','左权县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2520','304','和顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2521','304','昔阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2522','304','寿阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2523','304','太谷县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2524','304','祁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2525','304','平遥县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2526','304','灵石县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2527','305','尧都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2528','305','侯马市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2529','305','霍州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2530','305','曲沃县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2531','305','翼城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2532','305','襄汾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2533','305','洪洞县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2534','305','吉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2535','305','安泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2536','305','浮山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2537','305','古县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2538','305','乡宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2539','305','大宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2540','305','隰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2541','305','永和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2542','305','蒲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2543','305','汾西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2544','306','离石市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2545','306','离石区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2546','306','孝义市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2547','306','汾阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2548','306','文水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2549','306','交城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2550','306','兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2551','306','临县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2552','306','柳林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2553','306','石楼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2554','306','岚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2555','306','方山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2556','306','中阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2557','306','交口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2558','307','朔城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2559','307','平鲁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2560','307','山阴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2561','307','应县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2562','307','右玉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2563','307','怀仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2564','308','忻府区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2565','308','原平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2566','308','定襄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2567','308','五台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2568','308','代县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2569','308','繁峙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2570','308','宁武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2571','308','静乐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2572','308','神池县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2573','308','五寨县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2574','308','岢岚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2575','308','河曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2576','308','保德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2577','308','偏关县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2578','309','城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2579','309','矿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2580','309','郊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2581','309','平定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2582','309','盂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2583','310','盐湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2584','310','永济市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2585','310','河津市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2586','310','临猗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2587','310','万荣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2588','310','闻喜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2589','310','稷山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2590','310','新绛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2591','310','绛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2592','310','垣曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2593','310','夏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2594','310','平陆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2595','310','芮城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2596','311','莲湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2597','311','新城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2598','311','碑林区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2599','311','雁塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2600','311','灞桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2601','311','未央区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2602','311','阎良区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2603','311','临潼区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2604','311','长安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2605','311','蓝田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2606','311','周至县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2607','311','户县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2608','311','高陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2609','312','汉滨区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2610','312','汉阴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2611','312','石泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2612','312','宁陕县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2613','312','紫阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2614','312','岚皋县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2615','312','平利县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2616','312','镇坪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2617','312','旬阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2618','312','白河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2619','313','陈仓区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2620','313','渭滨区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2621','313','金台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2622','313','凤翔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2623','313','岐山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2624','313','扶风县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2625','313','眉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2626','313','陇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2627','313','千阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2628','313','麟游县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2629','313','凤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2630','313','太白县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2631','314','汉台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2632','314','南郑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2633','314','城固县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2634','314','洋县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2635','314','西乡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2636','314','勉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2637','314','宁强县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2638','314','略阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2639','314','镇巴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2640','314','留坝县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2641','314','佛坪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2642','315','商州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2643','315','洛南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2644','315','丹凤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2645','315','商南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2646','315','山阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2647','315','镇安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2648','315','柞水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2649','316','耀州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2650','316','王益区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2651','316','印台区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2652','316','宜君县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2653','317','临渭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2654','317','韩城市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2655','317','华阴市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2656','317','华县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2657','317','潼关县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2658','317','大荔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2659','317','合阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2660','317','澄城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2661','317','蒲城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2662','317','白水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2663','317','富平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2664','318','秦都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2665','318','渭城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2666','318','杨陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2667','318','兴平市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2668','318','三原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2669','318','泾阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2670','318','乾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2671','318','礼泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2672','318','永寿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2673','318','彬县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2674','318','长武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2675','318','旬邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2676','318','淳化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2677','318','武功县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2678','319','吴起县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2679','319','宝塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2680','319','延长县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2681','319','延川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2682','319','子长县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2683','319','安塞县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2684','319','志丹县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2685','319','甘泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2686','319','富县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2687','319','洛川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2688','319','宜川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2689','319','黄龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2690','319','黄陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2691','320','榆阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2692','320','神木县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2693','320','府谷县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2694','320','横山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2695','320','靖边县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2696','320','定边县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2697','320','绥德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2698','320','米脂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2699','320','佳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2700','320','吴堡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2701','320','清涧县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2702','320','子洲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2703','321','长宁区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2704','321','闸北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2705','321','闵行区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2706','321','徐汇区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2707','321','浦东新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2708','321','杨浦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2709','321','普陀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2710','321','静安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2711','321','卢湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2712','321','虹口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2713','321','黄浦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2714','321','南汇区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2715','321','松江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2716','321','嘉定区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2717','321','宝山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2718','321','青浦区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2719','321','金山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2720','321','奉贤区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2721','321','崇明县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2722','322','青羊区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2723','322','锦江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2724','322','金牛区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2725','322','武侯区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2726','322','成华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2727','322','龙泉驿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2728','322','青白江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2729','322','新都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2730','322','温江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2731','322','高新区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2732','322','高新西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2733','322','都江堰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2734','322','彭州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2735','322','邛崃市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2736','322','崇州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2737','322','金堂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2738','322','双流县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2739','322','郫县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2740','322','大邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2741','322','蒲江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2742','322','新津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2743','322','都江堰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2744','322','彭州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2745','322','邛崃市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2746','322','崇州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2747','322','金堂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2748','322','双流县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2749','322','郫县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2750','322','大邑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2751','322','蒲江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2752','322','新津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2753','323','涪城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2754','323','游仙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2755','323','江油市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2756','323','盐亭县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2757','323','三台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2758','323','平武县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2759','323','安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2760','323','梓潼县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2761','323','北川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2762','324','马尔康县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2763','324','汶川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2764','324','理县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2765','324','茂县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2766','324','松潘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2767','324','九寨沟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2768','324','金川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2769','324','小金县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2770','324','黑水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2771','324','壤塘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2772','324','阿坝县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2773','324','若尔盖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2774','324','红原县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2775','325','巴州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2776','325','通江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2777','325','南江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2778','325','平昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2779','326','通川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2780','326','万源市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2781','326','达县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2782','326','宣汉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2783','326','开江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2784','326','大竹县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2785','326','渠县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2786','327','旌阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2787','327','广汉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2788','327','什邡市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2789','327','绵竹市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2790','327','罗江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2791','327','中江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2792','328','康定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2793','328','丹巴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2794','328','泸定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2795','328','炉霍县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2796','328','九龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2797','328','甘孜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2798','328','雅江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2799','328','新龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2800','328','道孚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2801','328','白玉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2802','328','理塘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2803','328','德格县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2804','328','乡城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2805','328','石渠县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2806','328','稻城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2807','328','色达县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2808','328','巴塘县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2809','328','得荣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2810','329','广安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2811','329','华蓥市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2812','329','岳池县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2813','329','武胜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2814','329','邻水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2815','330','利州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2816','330','元坝区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2817','330','朝天区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2818','330','旺苍县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2819','330','青川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2820','330','剑阁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2821','330','苍溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2822','331','峨眉山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2823','331','乐山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2824','331','犍为县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2825','331','井研县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2826','331','夹江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2827','331','沐川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2828','331','峨边','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2829','331','马边','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2830','332','西昌市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2831','332','盐源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2832','332','德昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2833','332','会理县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2834','332','会东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2835','332','宁南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2836','332','普格县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2837','332','布拖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2838','332','金阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2839','332','昭觉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2840','332','喜德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2841','332','冕宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2842','332','越西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2843','332','甘洛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2844','332','美姑县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2845','332','雷波县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2846','332','木里','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2847','333','东坡区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2848','333','仁寿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2849','333','彭山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2850','333','洪雅县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2851','333','丹棱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2852','333','青神县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2853','334','阆中市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2854','334','南部县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2855','334','营山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2856','334','蓬安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2857','334','仪陇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2858','334','顺庆区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2859','334','高坪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2860','334','嘉陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2861','334','西充县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2862','335','市中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2863','335','东兴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2864','335','威远县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2865','335','资中县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2866','335','隆昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2867','336','东  区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2868','336','西  区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2869','336','仁和区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2870','336','米易县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2871','336','盐边县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2872','337','船山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2873','337','安居区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2874','337','蓬溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2875','337','射洪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2876','337','大英县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2877','338','雨城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2878','338','名山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2879','338','荥经县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2880','338','汉源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2881','338','石棉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2882','338','天全县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2883','338','芦山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2884','338','宝兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2885','339','翠屏区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2886','339','宜宾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2887','339','南溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2888','339','江安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2889','339','长宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2890','339','高县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2891','339','珙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2892','339','筠连县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2893','339','兴文县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2894','339','屏山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2895','340','雁江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2896','340','简阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2897','340','安岳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2898','340','乐至县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2899','341','大安区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2900','341','自流井区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2901','341','贡井区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2902','341','沿滩区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2903','341','荣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2904','341','富顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2905','342','江阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2906','342','纳溪区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2907','342','龙马潭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2908','342','泸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2909','342','合江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2910','342','叙永县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2911','342','古蔺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2912','343','和平区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2913','343','河西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2914','343','南开区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2915','343','河北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2916','343','河东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2917','343','红桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2918','343','东丽区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2919','343','津南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2920','343','西青区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2921','343','北辰区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2922','343','塘沽区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2923','343','汉沽区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2924','343','大港区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2925','343','武清区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2926','343','宝坻区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2927','343','经济开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2928','343','宁河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2929','343','静海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2930','343','蓟县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2931','344','城关区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2932','344','林周县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2933','344','当雄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2934','344','尼木县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2935','344','曲水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2936','344','堆龙德庆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2937','344','达孜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2938','344','墨竹工卡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2939','345','噶尔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2940','345','普兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2941','345','札达县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2942','345','日土县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2943','345','革吉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2944','345','改则县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2945','345','措勤县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2946','346','昌都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2947','346','江达县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2948','346','贡觉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2949','346','类乌齐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2950','346','丁青县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2951','346','察雅县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2952','346','八宿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2953','346','左贡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2954','346','芒康县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2955','346','洛隆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2956','346','边坝县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2957','347','林芝县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2958','347','工布江达县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2959','347','米林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2960','347','墨脱县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2961','347','波密县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2962','347','察隅县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2963','347','朗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2964','348','那曲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2965','348','嘉黎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2966','348','比如县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2967','348','聂荣县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2968','348','安多县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2969','348','申扎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2970','348','索县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2971','348','班戈县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2972','348','巴青县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2973','348','尼玛县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2974','349','日喀则市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2975','349','南木林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2976','349','江孜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2977','349','定日县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2978','349','萨迦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2979','349','拉孜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2980','349','昂仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2981','349','谢通门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2982','349','白朗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2983','349','仁布县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2984','349','康马县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2985','349','定结县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2986','349','仲巴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2987','349','亚东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2988','349','吉隆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2989','349','聂拉木县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2990','349','萨嘎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2991','349','岗巴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2992','350','乃东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2993','350','扎囊县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2994','350','贡嘎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2995','350','桑日县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2996','350','琼结县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2997','350','曲松县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2998','350','措美县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('2999','350','洛扎县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3000','350','加查县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3001','350','隆子县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3002','350','错那县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3003','350','浪卡子县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3004','351','天山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3005','351','沙依巴克区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3006','351','新市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3007','351','水磨沟区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3008','351','头屯河区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3009','351','达坂城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3010','351','米东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3011','351','乌鲁木齐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3012','352','阿克苏市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3013','352','温宿县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3014','352','库车县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3015','352','沙雅县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3016','352','新和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3017','352','拜城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3018','352','乌什县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3019','352','阿瓦提县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3020','352','柯坪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3021','353','阿拉尔市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3022','354','库尔勒市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3023','354','轮台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3024','354','尉犁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3025','354','若羌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3026','354','且末县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3027','354','焉耆','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3028','354','和静县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3029','354','和硕县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3030','354','博湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3031','355','博乐市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3032','355','精河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3033','355','温泉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3034','356','呼图壁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3035','356','米泉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3036','356','昌吉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3037','356','阜康市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3038','356','玛纳斯县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3039','356','奇台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3040','356','吉木萨尔县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3041','356','木垒','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3042','357','哈密市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3043','357','伊吾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3044','357','巴里坤','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3045','358','和田市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3046','358','和田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3047','358','墨玉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3048','358','皮山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3049','358','洛浦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3050','358','策勒县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3051','358','于田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3052','358','民丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3053','359','喀什市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3054','359','疏附县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3055','359','疏勒县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3056','359','英吉沙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3057','359','泽普县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3058','359','莎车县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3059','359','叶城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3060','359','麦盖提县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3061','359','岳普湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3062','359','伽师县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3063','359','巴楚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3064','359','塔什库尔干','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3065','360','克拉玛依市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3066','361','阿图什市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3067','361','阿克陶县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3068','361','阿合奇县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3069','361','乌恰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3070','362','石河子市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3071','363','图木舒克市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3072','364','吐鲁番市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3073','364','鄯善县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3074','364','托克逊县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3075','365','五家渠市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3076','366','阿勒泰市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3077','366','布克赛尔','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3078','366','伊宁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3079','366','布尔津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3080','366','奎屯市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3081','366','乌苏市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3082','366','额敏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3083','366','富蕴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3084','366','伊宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3085','366','福海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3086','366','霍城县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3087','366','沙湾县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3088','366','巩留县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3089','366','哈巴河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3090','366','托里县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3091','366','青河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3092','366','新源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3093','366','裕民县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3094','366','和布克赛尔','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3095','366','吉木乃县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3096','366','昭苏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3097','366','特克斯县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3098','366','尼勒克县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3099','366','察布查尔','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3100','367','盘龙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3101','367','五华区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3102','367','官渡区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3103','367','西山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3104','367','东川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3105','367','安宁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3106','367','呈贡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3107','367','晋宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3108','367','富民县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3109','367','宜良县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3110','367','嵩明县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3111','367','石林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3112','367','禄劝','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3113','367','寻甸','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3114','368','兰坪','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3115','368','泸水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3116','368','福贡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3117','368','贡山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3118','369','宁洱','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3119','369','思茅区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3120','369','墨江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3121','369','景东','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3122','369','景谷','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3123','369','镇沅','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3124','369','江城','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3125','369','孟连','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3126','369','澜沧','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3127','369','西盟','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3128','370','古城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3129','370','宁蒗','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3130','370','玉龙','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3131','370','永胜县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3132','370','华坪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3133','371','隆阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3134','371','施甸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3135','371','腾冲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3136','371','龙陵县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3137','371','昌宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3138','372','楚雄市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3139','372','双柏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3140','372','牟定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3141','372','南华县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3142','372','姚安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3143','372','大姚县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3144','372','永仁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3145','372','元谋县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3146','372','武定县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3147','372','禄丰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3148','373','大理市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3149','373','祥云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3150','373','宾川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3151','373','弥渡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3152','373','永平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3153','373','云龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3154','373','洱源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3155','373','剑川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3156','373','鹤庆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3157','373','漾濞','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3158','373','南涧','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3159','373','巍山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3160','374','潞西市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3161','374','瑞丽市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3162','374','梁河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3163','374','盈江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3164','374','陇川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3165','375','香格里拉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3166','375','德钦县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3167','375','维西','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3168','376','泸西县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3169','376','蒙自县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3170','376','个旧市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3171','376','开远市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3172','376','绿春县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3173','376','建水县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3174','376','石屏县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3175','376','弥勒县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3176','376','元阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3177','376','红河县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3178','376','金平','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3179','376','河口','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3180','376','屏边','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3181','377','临翔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3182','377','凤庆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3183','377','云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3184','377','永德县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3185','377','镇康县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3186','377','双江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3187','377','耿马','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3188','377','沧源','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3189','378','麒麟区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3190','378','宣威市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3191','378','马龙县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3192','378','陆良县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3193','378','师宗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3194','378','罗平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3195','378','富源县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3196','378','会泽县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3197','378','沾益县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3198','379','文山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3199','379','砚山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3200','379','西畴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3201','379','麻栗坡县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3202','379','马关县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3203','379','丘北县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3204','379','广南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3205','379','富宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3206','380','景洪市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3207','380','勐海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3208','380','勐腊县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3209','381','红塔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3210','381','江川县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3211','381','澄江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3212','381','通海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3213','381','华宁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3214','381','易门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3215','381','峨山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3216','381','新平','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3217','381','元江','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3218','382','昭阳区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3219','382','鲁甸县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3220','382','巧家县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3221','382','盐津县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3222','382','大关县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3223','382','永善县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3224','382','绥江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3225','382','镇雄县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3226','382','彝良县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3227','382','威信县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3228','382','水富县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3229','383','西湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3230','383','上城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3231','383','下城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3232','383','拱墅区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3233','383','滨江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3234','383','江干区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3235','383','萧山区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3236','383','余杭区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3237','383','市郊','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3238','383','建德市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3239','383','富阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3240','383','临安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3241','383','桐庐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3242','383','淳安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3243','384','吴兴区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3244','384','南浔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3245','384','德清县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3246','384','长兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3247','384','安吉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3248','385','南湖区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3249','385','秀洲区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3250','385','海宁市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3251','385','嘉善县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3252','385','平湖市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3253','385','桐乡市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3254','385','海盐县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3255','386','婺城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3256','386','金东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3257','386','兰溪市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3258','386','市区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3259','386','佛堂镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3260','386','上溪镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3261','386','义亭镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3262','386','大陈镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3263','386','苏溪镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3264','386','赤岸镇','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3265','386','东阳市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3266','386','永康市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3267','386','武义县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3268','386','浦江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3269','386','磐安县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3270','387','莲都区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3271','387','龙泉市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3272','387','青田县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3273','387','缙云县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3274','387','遂昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3275','387','松阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3276','387','云和县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3277','387','庆元县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3278','387','景宁','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3279','388','海曙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3280','388','江东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3281','388','江北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3282','388','镇海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3283','388','北仑区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3284','388','鄞州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3285','388','余姚市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3286','388','慈溪市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3287','388','奉化市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3288','388','象山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3289','388','宁海县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3290','389','越城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3291','389','上虞市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3292','389','嵊州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3293','389','绍兴县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3294','389','新昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3295','389','诸暨市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3296','390','椒江区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3297','390','黄岩区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3298','390','路桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3299','390','温岭市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3300','390','临海市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3301','390','玉环县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3302','390','三门县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3303','390','天台县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3304','390','仙居县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3305','391','鹿城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3306','391','龙湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3307','391','瓯海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3308','391','瑞安市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3309','391','乐清市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3310','391','洞头县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3311','391','永嘉县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3312','391','平阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3313','391','苍南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3314','391','文成县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3315','391','泰顺县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3316','392','定海区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3317','392','普陀区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3318','392','岱山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3319','392','嵊泗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3320','393','衢州市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3321','393','江山市','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3322','393','常山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3323','393','开化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3324','393','龙游县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3325','394','合川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3326','394','江津区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3327','394','南川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3328','394','永川区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3329','394','南岸区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3330','394','渝北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3331','394','万盛区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3332','394','大渡口区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3333','394','万州区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3334','394','北碚区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3335','394','沙坪坝区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3336','394','巴南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3337','394','涪陵区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3338','394','江北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3339','394','九龙坡区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3340','394','渝中区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3341','394','黔江开发区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3342','394','长寿区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3343','394','双桥区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3344','394','綦江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3345','394','潼南县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3346','394','铜梁县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3347','394','大足县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3348','394','荣昌县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3349','394','璧山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3350','394','垫江县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3351','394','武隆县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3352','394','丰都县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3353','394','城口县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3354','394','梁平县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3355','394','开县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3356','394','巫溪县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3357','394','巫山县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3358','394','奉节县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3359','394','云阳县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3360','394','忠县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3361','394','石柱','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3362','394','彭水','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3363','394','酉阳','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3364','394','秀山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3365','395','沙田区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3366','395','东区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3367','395','观塘区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3368','395','黄大仙区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3369','395','九龙城区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3370','395','屯门区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3371','395','葵青区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3372','395','元朗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3373','395','深水埗区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3374','395','西贡区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3375','395','大埔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3376','395','湾仔区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3377','395','油尖旺区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3378','395','北区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3379','395','南区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3380','395','荃湾区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3381','395','中西区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3382','395','离岛区','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3383','396','澳门','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3384','397','台北','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3385','397','高雄','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3386','397','基隆','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3387','397','台中','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3388','397','台南','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3389','397','新竹','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3390','397','嘉义','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3391','397','宜兰县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3392','397','桃园县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3393','397','苗栗县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3394','397','彰化县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3395','397','南投县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3396','397','云林县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3397','397','屏东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3398','397','台东县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3399','397','花莲县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3400','397','澎湖县','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('1','0','中国','1');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3401','3','合肥','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3402','3401','瑶海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3403','3401','庐阳','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3404','3401','蜀山','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3405','3401','包河','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3406','3401','长丰','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3407','3401','肥东','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3408','3401','肥西','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3409','3401','巢湖','4');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3410','3401','庐江','4');
DROP TABLE IF EXISTS `%DB_PREFIX%ecv`;
CREATE TABLE `%DB_PREFIX%ecv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL COMMENT '序列号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `use_limit` int(11) NOT NULL COMMENT '代金券的使用次数,0表示无限次数使用',
  `use_count` int(11) NOT NULL COMMENT '已用次数',
  `user_id` int(11) NOT NULL COMMENT '会员ID ',
  `begin_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `money` decimal(20,4) NOT NULL COMMENT '代金券面额',
  `ecv_type_id` int(11) NOT NULL COMMENT '代金额类型ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='代金券表';
DROP TABLE IF EXISTS `%DB_PREFIX%ecv_type`;
CREATE TABLE `%DB_PREFIX%ecv_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '代金券类型名称',
  `money` decimal(20,4) NOT NULL COMMENT '面额',
  `use_limit` int(11) NOT NULL COMMENT '可用次数, 0表示无限次数',
  `begin_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `gen_count` int(11) NOT NULL COMMENT '已发放的数量',
  `send_type` tinyint(1) NOT NULL COMMENT '发放方式 0:管理员手动发放 1:会员积分兑换 2:序列号兑换',
  `exchange_score` int(11) NOT NULL COMMENT '兑换所需的积分',
  `exchange_limit` int(11) NOT NULL COMMENT '每个会员限兑换的数量',
  `exchange_sn` varchar(20) DEFAULT NULL COMMENT '红包兑换的序列号',
  `share_url` varchar(255) NOT NULL COMMENT '分享连接',
  `memo` varchar(255) NOT NULL COMMENT '红包备注',
  `tpl` varchar(255) NOT NULL COMMENT '红包模版',
  `total_limit`  int(11) NOT NULL COMMENT '发放总量限制',
  PRIMARY KEY (`id`),
  UNIQUE KEY `exchange_sn` (`exchange_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='代金券类型表';
INSERT INTO `%DB_PREFIX%ecv_type` VALUES ('3','百元代金券','100.0000','1','1422756034','1645754439','0','1','1000','1','','','','','');
DROP TABLE IF EXISTS `%DB_PREFIX%event`;
CREATE TABLE `%DB_PREFIX%event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `icon` varchar(255) NOT NULL COMMENT '活动的小图',
  `event_begin_time` int(11) NOT NULL COMMENT '活动开始时间',
  `event_end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `submit_begin_time` int(11) NOT NULL COMMENT '活动报名开始时间',
  `submit_end_time` int(11) NOT NULL COMMENT '活动报名结束时间',
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '活动内容',
  `cate_id` int(11) NOT NULL COMMENT '所属的活动分类ID',
  `city_id` int(11) NOT NULL COMMENT '所属的城市 ID',
  `address` varchar(255) NOT NULL COMMENT '活动地址',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `locate_match` text NOT NULL COMMENT '地址的全文索引unicode',
  `locate_match_row` text NOT NULL COMMENT '地址的全文索引查询用',
  `cate_match` text NOT NULL COMMENT '分类的全文索引unicode',
  `cate_match_row` text NOT NULL COMMENT '分类的全文索引查询用',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode',
  `name_match_row` text NOT NULL COMMENT '名称的全文索引查询用',
  `submit_count` int(11) NOT NULL COMMENT '报名总数',
  `reply_count` int(11) NOT NULL COMMENT '回贴数量',
  `brief` text NOT NULL COMMENT '简介',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到首页',
  `supplier_id` int(11) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL COMMENT '商家提交 1:待审核 0：通过',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `total_count` int(11) NOT NULL COMMENT '活动名额',
  `is_auto_verify` tinyint(1) NOT NULL COMMENT '自动审核，审核报名结果后不可以再修改',
  `return_score` int(11) NOT NULL,
  `return_point` int(11) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `score_limit` int(11) NOT NULL,
  `point_limit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`locate_match`,`cate_match`,`name_match`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商家活动表';
INSERT INTO `%DB_PREFIX%event` VALUES ('2','玛格利塔新店开业试吃','./public/attachment/201502/26/11/54ee9942024d3.jpg','1422734147','1614282900','1422734155','1582660558','0','<img src=\"./public/attachment/201502/26/11/54ee9942024d3.jpg\" alt=\"\" border=\"0\" />','3','15','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','119.296641','26.070661','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux19975ux35937,ux35266ux20809ux30005ux26799,ux65ux71ux79ux71ux79ux75ux84ux86,ux27004ux65288,ux21488ux27743ux21306ux19975ux35937ux22478ux53ux27004ux65288ux35266ux20809ux30005ux26799ux30452ux19978ux53ux27004ux65ux71ux79ux71ux79ux75ux84ux86ux26049ux65289,ux20013ux20141ux34903,ux20845ux19968ux20013ux36335,ux40857ux21326ux22823ux21414,ux26102ux20195ux21517ux22478,ux21488ux27743ux36335,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478,ux26725ux20141,ux23567ux26725ux22836,ux20132ux36890ux36335,ux30333ux39532ux27827,ux21338ux32654ux35799ux37030','福建,福州,台江区,万象,观光电梯,AGOGOKTV,楼（,台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）,中亭街,六一中路,龙华大厦,时代名城,台江路,宝龙城市广场,万象城,桥亭,小桥头,交通路,白马河,博美诗邦','ux35797ux21507','试吃','ux21033ux22612,ux26032ux24215,ux29595ux26684,ux24320ux19994,ux29595ux26684ux21033ux22612ux26032ux24215ux24320ux19994ux35797ux21507','利塔,新店,玛格,开业,玛格利塔新店开业试吃','1','0','玛格利塔新店开业试吃','1','1','0','1','23','0','0','0','0','0','0','0','0.0000','0','10','1','10','100','0.0000','10','100');
INSERT INTO `%DB_PREFIX%event` VALUES ('3','旗山森林温泉度假村自助游','./public/attachment/201502/26/12/54ee9bcfde839.jpg','1422734800','1582661160','1422734808','1582661210','0','<p>旗山森林温泉度假村自助游</p>\r\n','5','15','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','119.296641','26.070661','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux19975ux35937,ux35266ux20809ux30005ux26799,ux65ux71ux79ux71ux79ux75ux84ux86,ux27004ux65288,ux21488ux27743ux21306ux19975ux35937ux22478ux53ux27004ux65288ux35266ux20809ux30005ux26799ux30452ux19978ux53ux27004ux65ux71ux79ux71ux79ux75ux84ux86ux26049ux65289,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330,ux19996ux34903ux21475,ux31119ux24030ux24191ux22330,ux30465ux20307ux32946ux20013ux24515,ux35199ux31109ux23546,ux31038ux20250ux20027ux20041ux23398ux38498,ux35199ux27946ux36335,ux23631ux23665','福建,福州,台江区,万象,观光电梯,AGOGOKTV,楼（,台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）,鼓楼区,五一广场,东街口,福州广场,省体育中心,西禅寺,社会主义学院,西洪路,屏山','ux26053ux28216','旅游','ux26071ux23665,ux24230ux20551ux26449,ux33258ux21161ux28216,ux28201ux27849,ux26862ux26519,ux26071ux23665ux26862ux26519ux28201ux27849ux24230ux20551ux26449ux33258ux21161ux28216,ux26071ux23665ux26862ux26519ux28201ux27849ux24230ux20551ux26449ux33258ux21161ux28216','旗山,度假村,自助游,温泉,森林,旗山森林温泉度假村自助游,旗山森林温泉度假村自助游','0','0','旗山森林温泉度假村自助游','2','1','0','1','30','0','0','0','0','0','0','0','0.0000','0','50','0','0','0','0.0000','0','1000');
INSERT INTO `%DB_PREFIX%event` VALUES ('4','贵安温泉自驾游','./public/attachment/201502/26/14/54eec33c40e99.jpg','1422744893','1582671295','1422744899','1582671301','0','','4','15','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','119.296641','26.070661','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux19975ux35937,ux35266ux20809ux30005ux26799,ux65ux71ux79ux71ux79ux75ux84ux86,ux27004ux65288,ux21488ux27743ux21306ux19975ux35937ux22478ux53ux27004ux65288ux35266ux20809ux30005ux26799ux30452ux19978ux53ux27004ux65ux71ux79ux71ux79ux75ux84ux86ux26049ux65289,ux20013ux20141ux34903,ux20845ux19968ux20013ux36335,ux40857ux21326ux22823ux21414,ux26102ux20195ux21517ux22478,ux21488ux27743ux36335,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478,ux26725ux20141,ux23567ux26725ux22836,ux20132ux36890ux36335,ux30333ux39532ux27827,ux21338ux32654ux35799ux37030','福建,福州,台江区,万象,观光电梯,AGOGOKTV,楼（,台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）,中亭街,六一中路,龙华大厦,时代名城,台江路,宝龙城市广场,万象城,桥亭,小桥头,交通路,白马河,博美诗邦','ux20132ux21451','交友','ux33258ux39550ux28216,ux28201ux27849,ux36149ux23433ux28201ux27849ux33258ux39550ux28216','自驾游,温泉,贵安温泉自驾游','0','0','','3','1','0','1','30','0','0','0','0','0','0','0','0.0000','0','10','0','0','0','0.0000','10','0');
DROP TABLE IF EXISTS `%DB_PREFIX%event_area_link`;
CREATE TABLE `%DB_PREFIX%event_area_link` (
  `event_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动的商圈地区关联表';
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','10');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','21');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','22');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','23');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','24');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','25');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','26');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','27');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','28');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','29');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','30');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','31');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','32');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('2','33');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','8');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','13');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','14');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','15');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','16');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','17');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','18');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','19');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('3','20');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','10');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','21');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','22');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','23');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','24');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','25');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','26');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','27');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','28');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','29');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','30');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','31');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','32');
INSERT INTO `%DB_PREFIX%event_area_link` VALUES ('4','33');
DROP TABLE IF EXISTS `%DB_PREFIX%event_biz_submit`;
CREATE TABLE `%DB_PREFIX%event_biz_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `icon` varchar(255) NOT NULL COMMENT '活动的小图',
  `event_begin_time` int(11) NOT NULL COMMENT '活动开始时间',
  `event_end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `submit_begin_time` int(11) NOT NULL COMMENT '活动报名开始时间',
  `submit_end_time` int(11) NOT NULL COMMENT '活动报名结束时间',
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '活动内容',
  `cate_id` int(11) NOT NULL COMMENT '所属的活动分类ID',
  `city_id` int(11) NOT NULL COMMENT '所属的城市 ID',
  `address` varchar(255) NOT NULL COMMENT '活动地址',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `locate_match` text NOT NULL COMMENT '地址的全文索引unicode',
  `locate_match_row` text NOT NULL COMMENT '地址的全文索引查询用',
  `cate_match` text NOT NULL COMMENT '分类的全文索引unicode',
  `cate_match_row` text NOT NULL COMMENT '分类的全文索引查询用',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode',
  `name_match_row` text NOT NULL COMMENT '名称的全文索引查询用',
  `submit_count` int(11) NOT NULL COMMENT '报名总数',
  `reply_count` int(11) NOT NULL COMMENT '回贴数量',
  `brief` text NOT NULL COMMENT '简介',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到首页',
  `supplier_id` int(11) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL COMMENT '商家提交 1:待审核 0：通过',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `total_count` int(11) NOT NULL COMMENT '活动名额',
  `is_auto_verify` tinyint(1) NOT NULL COMMENT '自动审核，审核报名结果后不可以再修改',
  `return_score` int(11) NOT NULL,
  `return_point` int(11) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `score_limit` int(11) NOT NULL,
  `point_limit` int(11) NOT NULL,
  `cache_event_area_link` text NOT NULL COMMENT '序列化缓存地区列表',
  `cache_event_location_link` text NOT NULL COMMENT '序列化缓存支持的门店',
  `cache_event_field` text NOT NULL COMMENT '序列化缓存报名项配置',
  `account_id` int(11) NOT NULL COMMENT '提交数据的商户帐号关联ID',
  `event_id` int(11) NOT NULL COMMENT '关联活动主表的数据ID',
  `biz_apply_status` tinyint(1) NOT NULL COMMENT '商户申请状态 1.新品上架申请 2:修改 3:下架',
  `admin_check_status` tinyint(1) NOT NULL COMMENT '管理员审核状态 0 待审核 1 通过 2 拒绝',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`locate_match`,`cate_match`,`name_match`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商家中心发布活动临时表';
DROP TABLE IF EXISTS `%DB_PREFIX%event_cate`;
CREATE TABLE `%DB_PREFIX%event_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='活动的分类表';
INSERT INTO `%DB_PREFIX%event_cate` VALUES ('1','电影','1','1','0');
INSERT INTO `%DB_PREFIX%event_cate` VALUES ('2','讲座','1','2','0');
INSERT INTO `%DB_PREFIX%event_cate` VALUES ('3','试吃','1','3','1');
INSERT INTO `%DB_PREFIX%event_cate` VALUES ('4','交友','1','4','1');
INSERT INTO `%DB_PREFIX%event_cate` VALUES ('5','旅游','1','5','1');
DROP TABLE IF EXISTS `%DB_PREFIX%event_dp_point_result`;
CREATE TABLE `%DB_PREFIX%event_dp_point_result` (
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `point` int(11) NOT NULL COMMENT '分数',
  `event_id` int(11) NOT NULL COMMENT '活动ID',
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `youhui_id` (`event_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每个活动，每条点评针对每个评分分组的点评评分';
DROP TABLE IF EXISTS `%DB_PREFIX%event_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%event_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `event_id` int(11) NOT NULL COMMENT '活动ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `youhui_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动按预定义的分组打标签的结果表';
DROP TABLE IF EXISTS `%DB_PREFIX%event_field`;
CREATE TABLE `%DB_PREFIX%event_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `field_show_name` varchar(255) NOT NULL COMMENT '报名选项显示名称',
  `field_type` tinyint(1) NOT NULL COMMENT '报名项报名方式 0:手动输入 1:预选下拉',
  `value_scope` varchar(255) NOT NULL COMMENT '下拉的预选范围 用空格分隔',
  `sort` int(11) NOT NULL COMMENT '排序 由小到大，自动生成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='活动报名选项';
INSERT INTO `%DB_PREFIX%event_field` VALUES ('9','2','姓名','0','','0');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('10','2','手机号','0','','1');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('11','2','性别','1','男 女','2');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('12','2','年龄','1','18岁以下 18岁-30岁 30岁-40岁 40岁以上','3');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('13','3','联系人','0','','0');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('14','3','报名人数','0','','1');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('15','4','手机号','0','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%event_location_link`;
CREATE TABLE `%DB_PREFIX%event_location_link` (
  `event_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动支持的门店关联表';
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('2','21');
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('2','22');
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('3','30');
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('4','30');
DROP TABLE IF EXISTS `%DB_PREFIX%event_sc`;
CREATE TABLE `%DB_PREFIX%event_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inx_youhui_sc` (`uid`,`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动收藏';
INSERT INTO `%DB_PREFIX%event_sc` VALUES ('1','71','3','1424894966');
DROP TABLE IF EXISTS `%DB_PREFIX%event_submit`;
CREATE TABLE `%DB_PREFIX%event_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `event_begin_time` int(11) NOT NULL COMMENT '活动开始时间，报名时同步自event表。',
  `event_end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `dp_id` int(11) NOT NULL COMMENT '为已报名的活动点评的ID',
  `sn` varchar(255) DEFAULT NULL,
  `location_id` int(11) NOT NULL COMMENT '验证的门店ID',
  `confirm_id` int(11) NOT NULL COMMENT '操作的商家账户ID',
  `confirm_time` int(11) NOT NULL,
  `is_verify` tinyint(1) NOT NULL COMMENT '是否已审核，已审核才扣名额',
  `return_score` int(11) NOT NULL,
  `return_point` int(11) NOT NULL,
  `sms_count` int(11) NOT NULL COMMENT '报名结果短信发送次数',
  `mail_count` int(11) NOT NULL COMMENT '报名结果邮件发送次数',
  `return_money` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动报名表';
INSERT INTO `%DB_PREFIX%event_submit` VALUES ('2','71','1424894336','2','1422734147','1614282900','0','284220','0','0','0','1','10','100','0','0','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%event_submit_field`;
CREATE TABLE `%DB_PREFIX%event_submit_field` (
  `submit_id` int(11) NOT NULL COMMENT '报名的主表ID',
  `field_id` int(11) NOT NULL COMMENT '选项ID',
  `result` varchar(255) NOT NULL COMMENT '报名结果',
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`submit_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动报名，自定义报名项的报名结果';
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','9','张三','2');
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','10','13566677777','2');
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','11','男','2');
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','12','30岁-40岁','2');
DROP TABLE IF EXISTS `%DB_PREFIX%express`;
CREATE TABLE `%DB_PREFIX%express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '快递接口类名',
  `name` varchar(255) NOT NULL COMMENT '快递接口名称',
  `print_tmpl` text NOT NULL COMMENT '快递单打印模板',
  `is_effect` tinyint(1) NOT NULL,
  `config` text NOT NULL COMMENT '相关的配置(序列化的结果)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='快递接口配置表';
INSERT INTO `%DB_PREFIX%express` VALUES ('3','Ems','EMS','<table width=\"1024px\" background=\"system/express/images/Ems_express.jpg\" height=\"566px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:566px;\"><div style=\"position:absolute;left:153px;top:140px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:90px;top:182px;width:437px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:93px;top:224px;width:438px;height:68px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:334px;top:141px;width:253px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:88px;top:366px;width:336px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:334px;top:371px;width:194px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:181px;top:452px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:380px;top:278px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:307px;top:99px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:362px;top:100px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:399px;top:99px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:432px;top:97px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_h\">%T%</div>\r\n<div style=\"position:absolute;left:770px;top:133px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:571px;top:133px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:792px;top:279px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:562px;top:284px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:509px;top:222px;width:423px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:6:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:8:\"app_code\";s:3:\"ems\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('4','Fedex','联邦快递','<table width=\"1024px\" background=\"system/express/images/Fedex_express.jpg\" height=\"568px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:568px;\"><div style=\"position:absolute;left:155px;top:108px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:329px;top:110px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_account\">%SENDER_ACCOUNT%</div>\r\n<div style=\"position:absolute;left:149px;top:172px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:141px;top:197px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:138px;top:141px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:346px;top:223px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:152px;top:483px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:577px;top:431px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:135px;top:301px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:167px;top:274px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:343px;top:385px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:141px;top:358px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:9:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:14:\"sender_account\";s:0:\"\";s:8:\"app_code\";s:5:\"fedex\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('5','Sf','顺丰快递','<table width=\"1024px\" background=\"system/express/images/Sf_express.jpg\" height=\"670px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:670px;\"><div style=\"position:absolute;left:725px;top:148px;width:35px;height:35px;line-height:35px;text-align:left;\" id=\"payment_method\">√</div>\r\n<div style=\"position:absolute;left:720px;top:270px;width:135px;height:35px;line-height:35px;text-align:left;letter-spacing:15px;\" id=\"payment_account\">%PAYMENT_ACCOUNT%</div>\r\n<div style=\"position:absolute;left:366px;top:146px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:122px;top:149px;width:437px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:112px;top:185px;width:438px;height:68px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:280px;top:265px;width:253px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:66px;top:545px;width:336px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:376px;top:548px;width:194px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:803px;top:394px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:744px;top:443px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:803px;top:444px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:852px;top:445px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_h\">%T%</div>\r\n<div style=\"position:absolute;left:278px;top:467px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:360px;top:311px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:714px;top:90px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:67px;top:382px;width:423px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:6:{s:11:\"sender_name\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:15:\"payment_account\";s:0:\"\";s:8:\"app_code\";s:8:\"shunfeng\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('6','Sto','申通快递','<table width=\"1349px\" background=\"system/express/images/Sto_express.jpg\" height=\"743px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1349px;height:743px;\"><div style=\"position:absolute;left:202px;top:165px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:424px;top:168px;width:193px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:182px;top:225px;width:437px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:187px;top:275px;width:438px;height:93px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:226px;top:379px;width:253px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:91px;top:538px;width:336px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:432px;top:538px;width:194px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:208px;top:579px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:115px;top:620px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:189px;top:621px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:245px;top:621px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:288px;top:622px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_h\">%T%</div>\r\n<div style=\"position:absolute;left:996px;top:171px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:758px;top:171px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:747px;top:226px;width:423px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_company\"></div>\r\n<div style=\"position:absolute;left:744px;top:277px;width:423px;height:94px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:787px;top:381px;width:390px;height:34px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:7:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:8:\"app_code\";s:8:\"shentong\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('7','Ttkd','天天快递','<table width=\"1024px\" background=\"system/express/images/Ttkd_express.jpg\" height=\"572px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:572px;\"><div style=\"position:absolute;left:360px;top:250px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:341px;top:106px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:136px;top:104px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_account\">%SENDER_ACCOUNT%</div>\r\n<div style=\"position:absolute;left:139px;top:141px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:141px;top:181px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:182px;top:246px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:76px;top:367px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:333px;top:367px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:160px;top:435px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:134px;top:467px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:180px;top:468px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:225px;top:466px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:94px;top:468px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:618px;top:250px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:559px;top:124px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:746px;top:123px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:567px;top:185px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:9:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:14:\"sender_account\";s:0:\"\";s:8:\"app_code\";s:8:\"tiantian\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('8','Yto','圆通快递','<table width=\"1024px\" background=\"system/express/images/Yto_express.jpg\" height=\"574px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:574px;\"><div id=\"sender_name\" style=\"position:absolute;left:112px;top:122px;width:156px;height:35px;line-height:35px;text-align:left;\">%SENDER_NAME%</div>\r\n<div id=\"sender_from\" style=\"position:absolute;left:273px;top:125px;width:156px;height:35px;line-height:35px;text-align:left;\">%SENDER_FROM%</div>\r\n<div id=\"sender_company\" style=\"position:absolute;left:80px;top:289px;width:300px;height:23px;line-height:35px;text-align:left;\">%SENDER_COMPANY%</div>\r\n<div id=\"sender_address\" style=\"position:absolute;left:81px;top:222px;width:300px;height:24px;line-height:35px;text-align:left;\">%SENDER_ADDRESS%</div>\r\n<div id=\"sender_tel\" style=\"position:absolute;left:102px;top:334px;width:253px;height:28px;line-height:35px;text-align:left;\">%SENDER_TEL%</div>\r\n<div id=\"sender_y\" style=\"position:absolute;left:256px;top:439px;width:60px;height:25px;line-height:35px;text-align:left;\">%Y%</div>\r\n<div id=\"sender_m\" style=\"position:absolute;left:313px;top:439px;width:28px;height:25px;line-height:35px;text-align:left;\">%M%</div>\r\n<div id=\"sender_d\" style=\"position:absolute;left:352px;top:441px;width:28px;height:25px;line-height:35px;text-align:left;\">%D%</div>\r\n<div id=\"sender_sign\" style=\"position:absolute;left:158px;top:436px;width:160px;height:25px;line-height:35px;text-align:left;\">%SENDER_SIGN%</div>\r\n<div id=\"reciever_tel\" style=\"position:absolute;left:421px;top:396px;width:156px;height:35px;line-height:35px;text-align:left;\">%RECIEVER_TEL%</div>\r\n<div id=\"reciever_name\" style=\"position:absolute;left:398px;top:181px;width:156px;height:35px;line-height:35px;text-align:left;\">%RECIEVER_NAME%</div>\r\n<div id=\"reciever_to\" style=\"position:absolute;left:725px;top:93px;width:223px;height:35px;line-height:35px;text-align:left;\">%RECIEVER_TO%</div>\r\n<div id=\"reciever_address\" style=\"position:absolute;left:396px;top:271px;width:300px;height:58px;line-height:35px;text-align:left;\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:7:{s:11:\"sender_name\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:8:\"yuantong\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('9','Yunda','韵达快递','<table width=\"1024px\" background=\"system/express/images/Yunda_express.jpg\" height=\"574px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:574px;\"><div style=\"position:absolute;left:161px;top:120px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:355px;top:118px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:185px;top:158px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:145px;top:192px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:219px;top:306px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:398px;top:305px;width:153px;height:28px;line-height:35px;text-align:left;letter-spacing:14px;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:92px;top:409px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:316px;top:411px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:96px;top:485px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:96px;top:514px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:144px;top:513px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:185px;top:513px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:213px;top:513px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:885px;top:123px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:618px;top:295px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:881px;top:304px;width:156px;height:35px;line-height:35px;text-align:left;letter-spacing:14px;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:610px;top:121px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:609px;top:193px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:8:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:5:\"yunda\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('10','Zjs','宅急送快递','<table width=\"1024px\" background=\"system/express/images/Zjs_express.jpg\" height=\"619px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:619px;\"><div style=\"position:absolute;left:149px;top:144px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:320px;top:142px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:127px;top:251px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:123px;top:186px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:124px;top:285px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:104px;top:319px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:114px;top:350px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:84px;top:457px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:109px;top:526px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:151px;top:527px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:180px;top:527px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:547px;top:285px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:574px;top:145px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:749px;top:144px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:553px;top:184px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:8:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:10:\"zhaijisong\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('11','Zto','中通快递','<table width=\"1024px\" background=\"system/express/images/Zto_express.jpg\" height=\"574px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:574px;\"><div style=\"position:absolute;left:161px;top:120px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:332px;top:119px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:143px;top:235px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:164px;top:163px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:157px;top:285px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:352px;top:282px;width:153px;height:28px;line-height:35px;text-align:left;letter-spacing:9px;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:276px;top:355px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:648px;top:326px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:153px;top:393px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:100px;top:444px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:154px;top:436px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:193px;top:435px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:227px;top:434px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:560px;top:278px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:566px;top:123px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:765px;top:279px;width:156px;height:35px;line-height:35px;text-align:left;letter-spacing:9px;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:748px;top:121px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:570px;top:164px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:8:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:9:\"zhongtong\";}');
DROP TABLE IF EXISTS `%DB_PREFIX%expression`;
CREATE TABLE `%DB_PREFIX%expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'tusiji',
  `emotion` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='表情配置表';
INSERT INTO `%DB_PREFIX%expression` VALUES ('19','傲慢','qq','[傲慢]','aoman.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('20','白眼','qq','[白眼]','baiyan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('21','鄙视','qq','[鄙视]','bishi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('22','闭嘴','qq','[闭嘴]','bizui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('23','擦汗','qq','[擦汗]','cahan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('24','菜刀','qq','[菜刀]','caidao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('25','差劲','qq','[差劲]','chajin.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('26','欢庆','qq','[欢庆]','cheer.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('27','虫子','qq','[虫子]','chong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('28','呲牙','qq','[呲牙]','ciya.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('29','捶打','qq','[捶打]','da.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('30','大便','qq','[大便]','dabian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('31','大兵','qq','[大兵]','dabing.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('32','大叫','qq','[大叫]','dajiao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('33','大哭','qq','[大哭]','daku.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('34','蛋糕','qq','[蛋糕]','dangao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('35','发怒','qq','[发怒]','fanu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('36','刀','qq','[刀]','dao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('37','得意','qq','[得意]','deyi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('38','凋谢','qq','[凋谢]','diaoxie.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('39','饿','qq','[饿]','er.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('40','发呆','qq','[发呆]','fadai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('41','发抖','qq','[发抖]','fadou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('42','饭','qq','[饭]','fan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('43','飞吻','qq','[飞吻]','feiwen.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('44','奋斗','qq','[奋斗]','fendou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('45','尴尬','qq','[尴尬]','gangga.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('46','给力','qq','[给力]','geili.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('47','勾引','qq','[勾引]','gouyin.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('48','鼓掌','qq','[鼓掌]','guzhang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('49','哈哈','qq','[哈哈]','haha.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('50','害羞','qq','[害羞]','haixiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('51','哈欠','qq','[哈欠]','haqian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('52','花','qq','[花]','hua.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('53','坏笑','qq','[坏笑]','huaixiao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('54','挥手','qq','[挥手]','huishou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('55','回头','qq','[回头]','huitou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('56','激动','qq','[激动]','jidong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('57','惊恐','qq','[惊恐]','jingkong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('58','惊讶','qq','[惊讶]','jingya.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('59','咖啡','qq','[咖啡]','kafei.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('60','可爱','qq','[可爱]','keai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('61','可怜','qq','[可怜]','kelian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('62','磕头','qq','[磕头]','ketou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('63','示爱','qq','[示爱]','kiss.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('64','酷','qq','[酷]','ku.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('65','难过','qq','[难过]','kuaikule.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('66','骷髅','qq','[骷髅]','kulou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('67','困','qq','[困]','kun.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('68','篮球','qq','[篮球]','lanqiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('69','冷汗','qq','[冷汗]','lenghan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('70','流汗','qq','[流汗]','liuhan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('71','流泪','qq','[流泪]','liulei.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('72','礼物','qq','[礼物]','liwu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('73','爱心','qq','[爱心]','love.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('74','骂人','qq','[骂人]','ma.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('75','不开心','qq','[不开心]','nanguo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('76','不好','qq','[不好]','no.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('77','很好','qq','[很好]','ok.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('78','佩服','qq','[佩服]','peifu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('79','啤酒','qq','[啤酒]','pijiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('80','乒乓','qq','[乒乓]','pingpang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('81','撇嘴','qq','[撇嘴]','pizui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('82','强','qq','[强]','qiang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('83','亲亲','qq','[亲亲]','qinqin.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('84','出丑','qq','[出丑]','qioudale.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('85','足球','qq','[足球]','qiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('86','拳头','qq','[拳头]','quantou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('87','弱','qq','[弱]','ruo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('88','色','qq','[色]','se.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('89','闪电','qq','[闪电]','shandian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('90','胜利','qq','[胜利]','shengli.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('91','衰','qq','[衰]','shuai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('92','睡觉','qq','[睡觉]','shuijiao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('93','太阳','qq','[太阳]','taiyang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('96','啊','tusiji','[啊]','aa.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('97','暗爽','tusiji','[暗爽]','anshuang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('98','byebye','tusiji','[byebye]','baibai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('99','不行','tusiji','[不行]','buxing.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('100','戳眼','tusiji','[戳眼]','chuoyan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('101','很得意','tusiji','[很得意]','deyi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('102','顶','tusiji','[顶]','ding.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('103','抖抖','tusiji','[抖抖]','douxiong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('104','哼','tusiji','[哼]','heng.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('105','挥汗','tusiji','[挥汗]','huihan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('106','昏迷','tusiji','[昏迷]','hunmi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('107','互拍','tusiji','[互拍]','hupai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('108','瞌睡','tusiji','[瞌睡]','keshui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('109','笼子','tusiji','[笼子]','longzi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('110','听歌','tusiji','[听歌]','music.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('111','奶瓶','tusiji','[奶瓶]','naiping.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('112','扭背','tusiji','[扭背]','niubei.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('113','拍砖','tusiji','[拍砖]','paizhuan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('114','飘过','tusiji','[飘过]','piaoguo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('115','揉脸','tusiji','[揉脸]','roulian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('116','闪闪','tusiji','[闪闪]','shanshan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('117','生日','tusiji','[生日]','shengri.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('118','摊手','tusiji','[摊手]','tanshou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('119','躺坐','tusiji','[躺坐]','tanzuo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('120','歪头','tusiji','[歪头]','waitou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('121','我踢','tusiji','[我踢]','woti.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('122','无聊','tusiji','[无聊]','wuliao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('123','醒醒','tusiji','[醒醒]','xingxing.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('124','睡了','tusiji','[睡了]','xixishui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('125','旋转','tusiji','[旋转]','xuanzhuan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('126','摇晃','tusiji','[摇晃]','yaohuang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('127','耶','tusiji','[耶]','yeah.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('128','郁闷','tusiji','[郁闷]','yumen.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('129','晕厥','tusiji','[晕厥]','yunjue.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('130','砸','tusiji','[砸]','za.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('131','震荡','tusiji','[震荡]','zhendang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('132','撞墙','tusiji','[撞墙]','zhuangqiang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('133','转头','tusiji','[转头]','zhuantou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('134','抓墙','tusiji','[抓墙]','zhuaqiang.gif');
DROP TABLE IF EXISTS `%DB_PREFIX%fetch_topic`;
CREATE TABLE `%DB_PREFIX%fetch_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '接口名称',
  `show_name` varchar(255) NOT NULL COMMENT '接口显示的名称',
  `class_name` varchar(255) NOT NULL COMMENT '类名',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `config` text NOT NULL COMMENT '配置信息',
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分享采集接口配置表';
INSERT INTO `%DB_PREFIX%fetch_topic` VALUES ('1','方维oso内部数据分享接口','站内分享','Fanwe','','N;','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%filter`;
CREATE TABLE `%DB_PREFIX%filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '关键词',
  `filter_group_id` int(11) NOT NULL COMMENT '商城商品筛选分组ID',
  PRIMARY KEY (`id`),
  KEY `filter_name_idx` (`name`),
  KEY `filter_group_id` (`filter_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='商品筛选关键词表';
INSERT INTO `%DB_PREFIX%filter` VALUES ('38','棕色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('39','蓝色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('40','黑色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('41','红色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('42','紫色','10');
DROP TABLE IF EXISTS `%DB_PREFIX%filter_group`;
CREATE TABLE `%DB_PREFIX%filter_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '筛选分组名称',
  `cate_id` int(11) NOT NULL COMMENT '所属商城分类ID',
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL COMMENT '是否生效用于检索分组显示于分类页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商城商品筛选分组配置表';
INSERT INTO `%DB_PREFIX%filter_group` VALUES ('10','颜色','31','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%flower_log`;
CREATE TABLE `%DB_PREFIX%flower_log` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` enum('good_count','bad_count') NOT NULL COMMENT 'good_count表示鲜花',
  `rec_id` int(11) NOT NULL COMMENT '相关的ID，如点评的ID，图片ID',
  `rec_module` enum('image','dp') NOT NULL,
  `memo` varchar(20) NOT NULL COMMENT '投票的文字显示',
  `create_time` int(11) NOT NULL COMMENT '投票的时间',
  PRIMARY KEY (`user_id`,`rec_id`,`rec_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评的鲜花投标记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%free_delivery`;
CREATE TABLE `%DB_PREFIX%free_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL COMMENT '配送方式ID',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `free_count` int(11) NOT NULL COMMENT '免运费的件数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='每个商品针对每个配置方式设置的免运费规则表';
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('25','8','76','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('19','8','79','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('20','8','80','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('21','8','81','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('22','8','85','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('23','8','87','2');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('24','8','88','2');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('26','8','89','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('27','8','91','15');
DROP TABLE IF EXISTS `%DB_PREFIX%goods_type`;
CREATE TABLE `%DB_PREFIX%goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='商品的类型(属性规格的分组标准)';
INSERT INTO `%DB_PREFIX%goods_type` VALUES ('10','餐饮套餐','0');
INSERT INTO `%DB_PREFIX%goods_type` VALUES ('11','服装','0');
DROP TABLE IF EXISTS `%DB_PREFIX%goods_type_attr`;
CREATE TABLE `%DB_PREFIX%goods_type_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '属性名称',
  `input_type` tinyint(1) NOT NULL COMMENT '输入的方式 0手动输入 1预选下拉',
  `preset_value` text NOT NULL COMMENT '预选下拉时的预设值，半角逗号分隔',
  `goods_type_id` int(11) NOT NULL COMMENT '商品类型ID',
  `supplier_id` int(11) NOT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='每个商品类型的属性预设表';
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('17','时段','0','','10','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('18','人数','0','','10','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('19','颜色','0','','11','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('20','尺码','0','','11','0');
DROP TABLE IF EXISTS `%DB_PREFIX%images_group`;
CREATE TABLE `%DB_PREFIX%images_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商家图片分组表';
DROP TABLE IF EXISTS `%DB_PREFIX%images_group_link`;
CREATE TABLE `%DB_PREFIX%images_group_link` (
  `images_group_id` int(11) NOT NULL COMMENT '图片分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `images_group_id` (`images_group_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家图片分组与生活服务分类的关联表(属于某个分类的商家图片拥有哪些图片分组的配置)';
DROP TABLE IF EXISTS `%DB_PREFIX%link`;
CREATE TABLE `%DB_PREFIX%link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接显示名称',
  `group_id` int(11) NOT NULL COMMENT '友情链接分组ID',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `img` varchar(255) NOT NULL COMMENT '链接图片',
  `description` text NOT NULL COMMENT '描述说明',
  `count` int(11) NOT NULL COMMENT '点击量',
  `show_index` tinyint(1) NOT NULL COMMENT '是否显示到首页底部 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='友情链接表';
INSERT INTO `%DB_PREFIX%link` VALUES ('3','方维o2o商业系统','6','http://www.fanwe.com','1','1','','方维o2o商业系统','0','1');
DROP TABLE IF EXISTS `%DB_PREFIX%link_group`;
CREATE TABLE `%DB_PREFIX%link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接分组名称',
  `sort` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='友情链接分组表';
INSERT INTO `%DB_PREFIX%link_group` VALUES ('6','友情链接','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%log`;
CREATE TABLE `%DB_PREFIX%log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '日志描述内容',
  `log_time` int(11) NOT NULL COMMENT '发生时间',
  `log_admin` int(11) NOT NULL COMMENT '操作的管理员ID',
  `log_ip` varchar(255) NOT NULL COMMENT '操作者IP',
  `log_status` tinyint(1) NOT NULL COMMENT '操作结果 1:操作成功 0:操作失败',
  `module` varchar(255) NOT NULL COMMENT '操作的模块module',
  `action` varchar(255) NOT NULL COMMENT '操作的命令action',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2678 DEFAULT CHARSET=utf8 COMMENT='后台操作日志表';
DROP TABLE IF EXISTS `%DB_PREFIX%lottery`;
CREATE TABLE `%DB_PREFIX%lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_sn` varchar(255) NOT NULL COMMENT '抽奖券序列号（顺序生成）',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '抽奖券所属会员ID',
  `mobile` varchar(255) NOT NULL COMMENT '参与抽奖的手机号',
  `create_time` int(11) NOT NULL COMMENT '抽奖时间',
  `buyer_id` int(11) NOT NULL COMMENT '购买人ID(产生抽奖行为的会员ID，当抽奖券由被推荐人购买时该 ID与user_id不相等)',
  `sms_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='抽奖券表';
DROP TABLE IF EXISTS `%DB_PREFIX%m_adv`;
CREATE TABLE `%DB_PREFIX%m_adv` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '广告名称',
  `img` varchar(255) DEFAULT '' COMMENT '广告图片',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  `type` tinyint(1) DEFAULT '0' COMMENT '1分类标签广告\r\n2URL广告\r\n3分类排行\r\n4达人页\r\n5搜索页\r\n6拍照\r\n7热门\r\n8分享详细\r\n9团购列表\r\n10商品列表\r\n11活动列表\r\n12优惠列表\r\n13代金券列表\r\n14团购明细\r\n15商品明细\r\n16活动明细\r\n17优惠明细\r\n18代金券明细\r\n19关于我们\r\n20优惠券主页面\r\n21公告列表			',
  `position` tinyint(1) NOT NULL COMMENT '显示的位置 0:首页 1:启动页 2:专题位',
  `data` text COMMENT '配置的序列化数据（根据不同的type存放不同的结果）',
  `sort` smallint(5) DEFAULT '10' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0:无效1:有效',
  `city_id` int(11) DEFAULT '0' COMMENT '所属城市',
  `ctl` varchar(255) DEFAULT NULL,
  `zt_id` int(11) NOT NULL COMMENT '手机端专题组的ID',
  `zt_position` varchar(255) NOT NULL COMMENT '专题模板的位置显示(广告位ID)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='手机端广告配置表';
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('10', '支付宝广告', './public/attachment/sjmapi/4f5176077b5e6.jpg', '0', '0', '0', 'a:1:{s:3:\"url\";s:37:\"http://bizpartner.alipay.com/fangwei/\";}', '3', '1', '0', 'url', '0', '');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('12', '方维o2o', './public/attachment/sjmapi/4f2ce3d1827e4.jpg', '0', '0', '0', 'a:1:{s:3:\"url\";s:20:\"http://www.fanwe.com\";}', '5', '1', '0', 'url', '0', '');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('20', '方维o2o', './public/attachment/sjmapi/4f2ce3d1827e4.jpg', '1', '0', '0', 'a:1:{s:3:\"url\";s:20:\"http://www.fanwe.com\";}', '9', '1', '0', 'url', '0', '');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('19', '支付宝', './public/attachment/sjmapi/5451eb7862ae7.jpg', '1', '0', '0', 'a:1:{s:3:\"url\";s:37:\"http://bizpartner.alipay.com/fangwei/\";}', '8', '1', '0', 'url', '0', '');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('43', 'wap_index_zt2_p1', './public/attachment/201602/22/11/56ca826c4c484.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '30', '1', '0', 'url', '24', 'index_zt2_p1');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('42', '首页轮播2', './public/attachment/201602/22/11/56ca821c3e4a1.png', '1', '0', '3', 'a:1:{s:3:\"url\";s:0:\"\";}', '29', '1', '0', 'url', '0', '');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('41', 'wap_index_zt1_p5', './public/attachment/201602/20/17/56c83382730a4.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '28', '1', '0', 'url', '23', 'index_zt1_p5');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('40', 'wap_index_zt1_p4', './public/attachment/201602/20/17/56c8336f2175c.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '27', '1', '0', 'url', '23', 'index_zt1_p4');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('39', 'wap_index_zt1_p3', './public/attachment/201602/20/17/56c8335c50d12.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '26', '1', '0', 'url', '23', 'index_zt1_p3');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('38', 'wap_index_zt1_p2', './public/attachment/201602/20/17/56c83347ced6b.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '25', '1', '0', 'url', '23', 'index_zt1_p2');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('37', 'wap_index_zt1_p1', './public/attachment/201602/20/17/56c83328938d7.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '24', '1', '0', 'url', '23', 'index_zt1_p1');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('28', 'app专题位1p1', './public/attachment/201507/04/10/5597453b30d51.png', '0', '21', '2', 'a:1:{s:7:\"data_id\";s:2:\"74\";}', '17', '1', '0', 'deal', '21', 'index_zt1_p1');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('29', 'app专题位1p2', './public/attachment/201507/04/10/559745893dfe8.png', '0', '0', '2', 'a:1:{s:3:\"url\";s:20:\"http://www.fanwe.com\";}', '18', '1', '0', 'url', '21', 'index_zt1_p2');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('30', 'app专题位1p3', './public/attachment/201507/04/10/559745b5c786d.png', '0', '21', '2', 'a:1:{s:7:\"data_id\";s:2:\"73\";}', '19', '1', '0', 'deal', '21', 'index_zt1_p3');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('31', 'app专题位2p1', './public/attachment/201507/04/10/55974622111e8.png', '0', '11', '2', 'a:1:{s:7:\"cate_id\";s:0:\"\";}', '20', '1', '0', 'tuan', '22', 'index_zt2_p1');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('32', 'app专题位2p2', './public/attachment/201507/04/10/559746443a7a0.png', '0', '16', '2', 'a:1:{s:7:\"cate_id\";s:0:\"\";}', '21', '1', '0', 'stores', '22', 'index_zt2_p2');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('33', 'app专题位2p3', './public/attachment/201507/04/10/559746657cac4.png', '0', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '22', '1', '0', 'url', '22', 'index_zt2_p3');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('34', 'app专题位2p4', './public/attachment/201507/04/10/5597468849542.png', '0', '27', '2', 'a:1:{s:7:\"data_id\";s:1:\"1\";}', '23', '1', '0', 'notice', '22', 'index_zt2_p4');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('44', 'wap_index_zt2_p2', './public/attachment/201602/22/11/56ca8279b0b05.jpg', '1', '0', '2', 'a:1:{s:3:\"url\";s:0:\"\";}', '31', '1', '0', 'url', '24', 'index_zt2_p2');

DROP TABLE IF EXISTS `%DB_PREFIX%m_config`;
CREATE TABLE `%DB_PREFIX%m_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `val` text,
  `type` tinyint(1) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '基础配置' COMMENT '分组显示',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='手机端的后台配置表';
INSERT INTO `%DB_PREFIX%m_config` VALUES ('19','index_logo','首页logo','./public/attachment/201202/04/16/4f2ce8336d784.png','2','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('3','has_ecv','有优惠券','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('6','has_message','有留言框','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('7','has_region','有配送地区选择项','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('8','region_version','配送地区版本','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('9','only_one_delivery','只有一个配送地区','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('10','kf_phone','客服电话','400-000-0000','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('11','kf_email','客服邮箱','qq@fanwe.com','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('16','page_size','分页大小','10','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('18','program_title','程序标题名称','方维O2O','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('22','sina_app_key','新浪App Key','','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('23','sina_app_secret','新浪App Secret','','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('24','sina_bind_url','新浪回调地址','http://sns.whalecloud.com/sina2/callback','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('68','wx_app_secret','微信(开放)appSecret','','0','基础配置','19');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('67','wx_app_key','微信(开放)AppID','','0','基础配置','18');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('61','ios_biz_forced_upgrade','商家ios是否强制升级(0:否;1:是)','0','0','商家手机端升级设置','12');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('62','android_biz_version','商家android版本号(yyyymmddnn)','','0','商家手机端升级设置','13');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('63','android_biz_filename','商家android下载包名','http://o2o.fanwe.net/o2ofanwe_biz.apk','0','商家手机端升级设置','14');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('65','android_biz_forced_upgrade','商家android是否强制升级(0:否;1:是)','0','0','商家手机端升级设置','16');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('64','android_biz_upgrade','商家android版本升级内容','商家android升级测试','3','商家手机端升级设置','15');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('50','ios_version','ios版本号(yyyymmddnn)','','0','手机端升级设置','1');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('51','ios_down_url','ios下载地址(appstore连接地址)','http://o2o.fanwe.net/o2ofanwe_app.ipa','0','手机端升级设置','2');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('52','ios_upgrade','ios版本升级内容','ios升级测试','3','手机端升级设置','3');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('53','ios_forced_upgrade','ios是否强制升级(0:否;1:是)','0','0','手机端升级设置','4');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('54','android_version','android版本号(yyyymmddnn)','2015021001','0','手机端升级设置','5');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('55','android_filename','android下载包名','http://o2o.fanwe.net/o2ofanwe_app.apk','0','手机端升级设置','6');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('56','android_upgrade','android版本升级内容','android升级测试','3','手机端升级设置','7');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('57','android_forced_upgrade','android是否强制升级(0:否;1:是)','0','0','手机端升级设置','8');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('58','ios_biz_version','商家ios版本号(yyyymmddnn)','','0','商家手机端升级设置','9');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('59','ios_biz_down_url','商家ios下载地址(appstore连接地址)','http://o2o.fanwe.net/o2ofanwe_biz.ipa','0','商家手机端升级设置','10');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('60','ios_biz_upgrade','商家ios版本升级内容','商家ios升级测试','3','商家手机端升级设置','11');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('29','qq_app_secret','腾讯开放平台APP KEY','','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('28','qq_app_key','腾讯开放平台APP ID','','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('69','about_info','关于我们(文章ID)','','0','基础配置','20');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('72','wx_appid','微信(公众)APPID','','0','基础配置','67');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('73','wx_secrit','微信(公众)SECRIT','','0','基础配置','68');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('74','android_biz_master_secret','商家android推送友盟AppMasterSecret','','0','手机推送配置','18');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('75','android_biz_app_key','商家android推送友盟AppKey','','0','手机推送配置','17');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('76','ios_biz_app_key','商家ios推送友盟AppKey','','0','手机推送配置','19');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('77','ios_biz_master_secret','商家ios推送友盟AppMasterSecret','','0','手机推送配置','20');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('78','android_master_secret','android推送友盟AppMasterSecret','','0','手机推送配置','24');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('79','android_app_key','android推送友盟AppKey','','0','手机推送配置','23');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('80','ios_app_key','ios推送友盟AppKey','','0','手机推送配置','25');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('81','ios_master_secret','ios推送友盟AppMasterSecret','','0','手机推送配置','26');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('82','close_index_tuan','是否关闭首页团购','0','4','基础配置','101');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('83','close_index_shop','是否关闭首页商品','0','4','基础配置','102');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('84','close_index_youhui','是否关闭首页优惠','0','4','基础配置','103');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('85','close_index_event','是否关闭首页活动','0','4','基础配置','104');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('86','close_index_supplier','是否关闭首页商户','0','4','基础配置','105');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('87','close_index_cate','是否关闭首页分类位','0','4','基础配置','106');
DROP TABLE IF EXISTS `%DB_PREFIX%m_config_list`;
CREATE TABLE `%DB_PREFIX%m_config_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(50) DEFAULT NULL,
  `group` int(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `has_calc` int(1) DEFAULT NULL,
  `money` float(10,2) DEFAULT NULL,
  `is_verify` int(1) DEFAULT '0' COMMENT '0:无效；1:有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='手机端支付时用到一些额外配置，包括支付接口等';
DROP TABLE IF EXISTS `%DB_PREFIX%m_index`;
CREATE TABLE `%DB_PREFIX%m_index` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `vice_name` varchar(100) DEFAULT NULL,
  `desc` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  `ctl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%m_index` VALUES ('85','公告','&#58891;','#005824','','17','a:1:{s:0:\"\";N;}','14','1','0','0','0','1','notices');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('84','公告','','','./public/attachment/sjmapi/5461d5d7a6e54.png','17','a:1:{s:0:\"\";N;}','13','1','0','0','0','0','notices');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('83','积分商城','&#58892;','#00aeef','','13','a:1:{s:7:\"cate_id\";s:0:\"\";}','12','1','0','0','0','1','scores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('82','积分商城','','','./public/attachment/sjmapi/544753bc5bd98.png','13','a:1:{s:7:\"cate_id\";s:0:\"\";}','11','1','0','0','0','0','scores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('81','活动','&#58887;','#91278f','','14','a:1:{s:7:\"cate_id\";s:0:\"\";}','10','1','0','0','0','1','events');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('79','优惠券','&#58899;','#a36209','','15','a:1:{s:7:\"cate_id\";s:0:\"\";}','8','1','0','0','0','1','youhuis');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('80','活动','','','./public/attachment/sjmapi/546c644653000.png','14','a:1:{s:7:\"cate_id\";s:0:\"\";}','9','1','0','0','0','0','events');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('78','优惠券','','','./public/attachment/sjmapi/546c651d83c20.png','15','a:1:{s:7:\"cate_id\";s:0:\"\";}','7','1','0','0','0','0','youhuis');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('77','商家','&#58898;','#9d0a0f','','16','a:1:{s:7:\"cate_id\";s:0:\"\";}','6','1','0','0','0','1','stores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('76','商家','','','./public/attachment/sjmapi/546c65928f3fd.png','16','a:1:{s:7:\"cate_id\";s:0:\"\";}','5','1','0','0','0','0','stores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('75','亲子母婴','&#58886;','#00a650','','12','a:1:{s:7:\"cate_id\";s:2:\"29\";}','4','1','0','0','0','1','goods');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('74','亲子母婴','','','./public/attachment/sjmapi/54475407206cd.png','12','a:1:{s:7:\"cate_id\";s:2:\"29\";}','3','1','0','0','0','0','goods');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('73','餐饮美食','&#58896;','#f16522','','11','a:1:{s:7:\"cate_id\";s:1:\"8\";}','2','1','0','0','0','1','tuan');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('72','餐饮美食','','','./public/attachment/sjmapi/546c651d83c20.png','11','a:1:{s:7:\"cate_id\";s:1:\"8\";}','1','1','0','0','0','0','tuan');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('86','扫一扫','','','./public/attachment/sjmapi/544753eebe38c.png','31','a:1:{s:0:\"\";N;}','15','1','0','0','0','0','scan');
DROP TABLE IF EXISTS `%DB_PREFIX%m_notice`;
CREATE TABLE `%DB_PREFIX%m_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '文章内容',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='手机端公告列表';
INSERT INTO `%DB_PREFIX%m_notice` VALUES ('1','方维o2o_V3.0新版发布','方维o2o_V3.0新版发布','1431285171','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%m_zt`;
CREATE TABLE `%DB_PREFIX%m_zt` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '名称',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  `type` tinyint(1) DEFAULT '0' COMMENT '1分类标签广告\r\n2URL广告\r\n3分类排行\r\n4达人页\r\n5搜索页\r\n6拍照\r\n7热门\r\n8分享详细\r\n9团购列表\r\n10商品列表\r\n11活动列表\r\n12优惠列表\r\n13代金券列表\r\n14团购明细\r\n15商品明细\r\n16活动明细\r\n17优惠明细\r\n18代金券明细\r\n19关于我们\r\n20优惠券主页面\r\n21公告列表			',
  `data` text COMMENT '配置的序列化数据（根据不同的type存放不同的结果）',
  `sort` smallint(5) DEFAULT '10' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0:无效1:有效',
  `city_id` int(11) DEFAULT '0' COMMENT '所属城市',
  `ctl` varchar(255) DEFAULT NULL,
  `zt_moban` varchar(255) NOT NULL COMMENT '专题模板文件路径',
  `zt_title` varchar(255) NOT NULL COMMENT '专题显示的标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='手机端首页专题位';
INSERT INTO `%DB_PREFIX%m_zt` VALUES ('21','app专题位1','0','12','a:1:{s:7:\"cate_id\";s:0:\"\";}','1','1','0','goods','index_zt1.html','精品热卖');
INSERT INTO `%DB_PREFIX%m_zt` VALUES ('22','app专题位2','0','11','a:1:{s:7:\"cate_id\";s:0:\"\";}','2','1','0','tuan','index_zt2.html','最新优惠');
INSERT INTO `%DB_PREFIX%m_zt` VALUES ('23','wap专题位1','1','12','a:1:{s:7:\"cate_id\";s:0:\"\";}','3','1','0','goods','index_zt1.html','精品热卖');
INSERT INTO `%DB_PREFIX%m_zt` VALUES ('24','wap专题位2','1','11','a:1:{s:7:\"cate_id\";s:0:\"\";}','4','1','0','tuan','index_zt2.html','最新优惠');
DROP TABLE IF EXISTS `%DB_PREFIX%mail_list`;
CREATE TABLE `%DB_PREFIX%mail_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_address` varchar(255) NOT NULL COMMENT '邮件的地址',
  `city_id` int(11) NOT NULL COMMENT '订阅的城市ID，用于按地区群发时匹配',
  `code` varchar(255) NOT NULL COMMENT '弃用',
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_address_idx` (`mail_address`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='邮件订阅表';
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('20','fanwe@fanwe.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('21','fanwe1@fanwe.com','15','','1');
DROP TABLE IF EXISTS `%DB_PREFIX%mail_server`;
CREATE TABLE `%DB_PREFIX%mail_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_server` varchar(255) NOT NULL COMMENT 'smtp服务器地址IP或域名',
  `smtp_name` varchar(255) NOT NULL COMMENT 'smtp发件帐号名',
  `smtp_pwd` varchar(255) NOT NULL COMMENT 'smtp密码',
  `is_ssl` tinyint(1) NOT NULL COMMENT '是否ssl加密连接（参考具体smtp服务商的要求，如gmail要求ssl连接）',
  `smtp_port` varchar(255) NOT NULL COMMENT 'smtp端口',
  `use_limit` int(11) NOT NULL COMMENT '可用次数为0时表示无限次数使用, 次数满后轮到下一个配置的邮件服务器发件，直到没有可发的邮件服务器为止',
  `is_reset` tinyint(1) NOT NULL COMMENT '是否自动清零，1:次数达到上限后自动清零，等待下一个轮回继续使用该邮箱发送',
  `is_effect` tinyint(1) NOT NULL,
  `total_use` int(11) NOT NULL COMMENT '当前已用次数',
  `is_verify` tinyint(1) NOT NULL COMMENT '是否需要身份验证,通常为1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='发件用邮件服务器列表';
DROP TABLE IF EXISTS `%DB_PREFIX%medal`;
CREATE TABLE `%DB_PREFIX%medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '勋章接口名',
  `name` varchar(255) NOT NULL COMMENT '显示名称',
  `description` text NOT NULL COMMENT '勋章的描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `config` text NOT NULL COMMENT '不同勋章接口功能的配置信息',
  `icon` varchar(255) NOT NULL COMMENT '勋章图片',
  `image` varchar(255) NOT NULL COMMENT '备用',
  `route` text NOT NULL COMMENT '勋章获取规则的描述文字',
  `allow_check` tinyint(1) NOT NULL COMMENT '是否会被系统回收 0:不会 1:会',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统内勋章体系配置表';
INSERT INTO `%DB_PREFIX%medal` VALUES ('1','Groupuser','组长勋章','点亮表示您为组长','1','N;','./public/attachment/201203/17/15/4f6438e27aa65.png','','申请成为小组组长即可点亮该勋章','1');
INSERT INTO `%DB_PREFIX%medal` VALUES ('2','Keepsign','忠实网友勋章','点亮为忠实的网友会员','1','a:1:{s:9:\"day_count\";s:2:\"10\";}','./public/attachment/201203/17/15/4f6438f0af2c6.png','','连续签到10天以上将获得该勋章','1');
INSERT INTO `%DB_PREFIX%medal` VALUES ('3','Newuser','新手勋章','点亮您为新手，让更多的朋友找到你','1','N;','./public/attachment/201203/17/15/4f643902cd067.png','','完善用户的所有资料，即可获取该勋章','1');
INSERT INTO `%DB_PREFIX%medal` VALUES ('4','Sinabind','新浪微博勋章','新浪微博认证勋章，点亮为新浪微博用户','1','N;','./public/attachment/201203/17/15/4f64391478be2.png','','绑定新浪微博即可获得该勋章','0');
INSERT INTO `%DB_PREFIX%medal` VALUES ('5','Tencentbind','腾讯微博勋章','腾讯微博认证勋章，点亮为腾讯微博用户','1','N;','./public/attachment/201203/17/15/4f6439210f17b.png','','绑定腾讯微博即可获得该勋章','0');
DROP TABLE IF EXISTS `%DB_PREFIX%message`;
CREATE TABLE `%DB_PREFIX%message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '留言标题',
  `content` text NOT NULL COMMENT '留言内容',
  `create_time` int(11) NOT NULL COMMENT '留言时间',
  `update_time` int(11) NOT NULL COMMENT '回复时间',
  `admin_reply` text NOT NULL COMMENT '管理员回复内容',
  `admin_id` int(11) NOT NULL COMMENT '回复管理员ID',
  `rel_table` varchar(255) NOT NULL COMMENT '相关的数据表/模块（如活动留言event，商品留言deal）',
  `rel_id` int(11) NOT NULL COMMENT '相关留言的数据ID',
  `user_id` int(11) NOT NULL COMMENT '留言会员ID',
  `pid` int(11) NOT NULL COMMENT '弃用',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识（自动生效的留言自动为1），审核生效的留言为0',
  `city_id` int(11) NOT NULL COMMENT '提交商务合作留言的城市ID（基本弃用，商务合作由商家入驻取代）',
  `is_buy` tinyint(1) NOT NULL COMMENT '是否为消费后留言（即点评） ',
  `contact_name` varchar(255) NOT NULL COMMENT '商务合作提交时的联系人姓名',
  `contact` varchar(255) NOT NULL COMMENT '商务合作提交时的联系方式',
  `point` int(11) NOT NULL COMMENT '部份留言功能需要的评分',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:商家未阅读;1:商家已阅读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='留言表';
INSERT INTO `%DB_PREFIX%message` VALUES ('98','退款申请','退款申请：不合适要求退款','1424891043','0','','0','deal_order','27','71','0','0','0','0','','','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%message_type`;
CREATE TABLE `%DB_PREFIX%message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '预设的代码用于留言表中的rel_table',
  `is_fix` tinyint(1) NOT NULL COMMENT '系统内置类型，1:不可删除该类型 0:可删除',
  `show_name` varchar(255) NOT NULL COMMENT '类型显示名称 主要在留言板页面显示',
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='留言类型';
INSERT INTO `%DB_PREFIX%message_type` VALUES ('1','deal','1','商品评论','1','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('2','deal_order','1','订单留言','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('3','feedback','1','意见反馈','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('4','seller','1','商务合作','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('6','tx','1','提现申请','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('10','faq','1','问题答疑','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%mobile_list`;
CREATE TABLE `%DB_PREFIX%mobile_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `city_id` int(11) NOT NULL COMMENT '订阅城市ID（按地区群发时匹配）',
  `verify_code` varchar(255) NOT NULL COMMENT '验证码',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  PRIMARY KEY (`id`),
  KEY `mobile_idx` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='手机订阅表';
DROP TABLE IF EXISTS `%DB_PREFIX%msg_box`;
CREATE TABLE `%DB_PREFIX%msg_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  `user_id` int(11) NOT NULL COMMENT '消息所属的会员',
  `create_time` int(11) NOT NULL COMMENT '发信时间',
  `is_read` tinyint(1) NOT NULL COMMENT '是否已读 0:未读 1:已读',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否被用户删除',
  `type` varchar(200) NOT NULL COMMENT '消息接口类型:SystemMsg/OrderMsg等，实现来源于接口调用',
  `data` text NOT NULL COMMENT '消息相关数据集，序列化后用于接口调用',
  `data_id` int(11) NOT NULL COMMENT '相关数据的ID,可为0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_read` (`is_read`),
  KEY `is_delete` (`is_delete`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='新的会员站内信表';
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('29','恭喜您，您已经成为幼儿园。','71','1424821575','1','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('30','成功充值&yen;10000','71','1424886396','1','0','notify','','25');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('31','订单2015022610000323付款成功','71','1424887216','1','0','orderitem','','79');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('37','很好分享被置顶+10经验','71','1424907966','0','0','topic','','221');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('32','订单2015022610592583付款成功','71','1424890765','1','0','orderitem','','80');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('33','消费券验证成功','71','1424890988','1','0','orderitem','','79');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('34','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]退款成功 &yen;69 ','71','1424891134','1','0','orderitem','','80');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('35','仅售24.8元！价值168元的超人新款静音理发器1个，超静音，不夹发，儿童成人皆可用！买就送4个定位梳+润滑油+清洁刷！发货了，发货单号：556644525','71','1424893196','1','0','orderitem','','81');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('36','恭喜您，您已经成为幼儿园。','72','1424906529','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('38','分享被推荐+10经验','71','1424908015','0','0','topic','','216');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('39','您的新手勋章已过期了，被系统回收','71','1427481377','0','0','notify','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%msg_system`;
CREATE TABLE `%DB_PREFIX%msg_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '发放时间点',
  `user_names` text NOT NULL COMMENT '群发的用户名列表，逗号分隔(为空表示发给所有人)',
  `user_ids` text NOT NULL COMMENT 'user_id的全文索引',
  `end_time` int(11) NOT NULL COMMENT '过期时间点',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `user_ids` (`user_ids`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内信群发数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%msg_template`;
CREATE TABLE `%DB_PREFIX%msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称标识',
  `content` text NOT NULL COMMENT '模板内容',
  `type` tinyint(1) NOT NULL COMMENT '类型 0:短信 1:邮件',
  `is_html` tinyint(1) NOT NULL COMMENT '针对邮件设置的是否超文本标识',
  `is_allow_app` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不允许发给app;1:允许发给app',
  `is_allow_wx` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不允许发给wx;1:允许发给wx',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='系统邮件、短信模板';
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('1','TPL_MAIL_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_name}已购买成功，消费券序列号{$coupon.password},有效期为{$coupon.begin_time_format}到{$coupon.end_time_format}','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('2','TPL_SMS_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_sub_name}已购买成功，消费券序列号{$coupon.password},有效期为{$coupon.begin_time_format}到{$coupon.end_time_format}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('3','TPL_MAIL_USER_VERIFY','{$user.user_name}你好，请点击以下链接验证你的会员身份\r\n</p>\r\n<a href=\'{$user.verify_url}\'>{$user.verify_url}</a>','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('4','TPL_MAIL_USER_PASSWORD','{$user.user_name}你好，请点击以下链接修改您的密码\r\n</p>\r\n<a href=\'{$user.password_url}\'>{$user.password_url}</a>','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('5','TPL_SMS_PAYMENT','{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('6','TPL_MAIL_PAYMENT','{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('7','TPL_SMS_DELIVERY','{$delivery_notice.user_name}你好,你所下订单{$delivery_notice.order_sn}的商品{$delivery_notice.deal_names}于{$delivery_notice.delivery_time_format}发货成功,发货单号{$delivery_notice.notice_sn}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('8','TPL_MAIL_DELIVERY','{$delivery_notice.user_name}你好,你所下订单{$delivery_notice.order_sn}的商品{$delivery_notice.deal_names}于{$delivery_notice.delivery_time_format}发货成功,发货单号{$delivery_notice.notice_sn}','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('9','TPL_SMS_VERIFY_CODE','你的手机号为{$verify.mobile},验证码为{$verify.code}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('10','TPL_DEAL_NOTICE_SMS','{$notice.site_name}又有新团购啦!{$notice.deal_name},欢迎来抢团{$notice.site_url}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('11','TPL_MAIL_UNSUBSCRIBE','您好，您确定要退订{$mail.mail_address}吗？要退订请点击<a href=\"{$mail.url}\">完成退订</a>','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('12','TPL_SMS_USE_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_sub_name}，消费券{$coupon.password}，已于{$coupon.confirm_time_format}使用','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('13','TPL_MAIL_USE_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_name}，消费券{$coupon.password}，已于{$coupon.confirm_time_format}使用','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('14','TPL_SMS_LOTTERY','{$lottery.user_name}你好! 你参加的{$lottery.deal_sub_name}，抽奖号为{$lottery.lottery_sn}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('15','TPL_SMS_SCORE','{$username}你好! 你支付的订单{$order_sn}{$score_value}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('16','TPL_MAIL_SCORE','{$username}你好! 你支付的订单{$order_sn}{$score_value}','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('17','TPL_SMS_EVENT_SN','{$event.user_name}你好! 你报名的{$event.name}已确认，序列号{$event.sn},有效期为{$event.begin_time_format}到{$event.end_time_format}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('18','TPL_MAIL_EVENT_SN','{$event.user_name}你好! 你报名的{$event.name}已确认，序列号{$event.sn},有效期为{$event.begin_time_format}到{$event.end_time_format}','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('19','TPL_SMS_SUPPLIER_ORDER','{$supplier_name}，您有一笔新的订单{$order_sn}，请及时处理。','0','0','1','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('20','TPL_USER_WITHDRAW_SMS','{$user_name}您好，你的提现申请已通过，{$money_format}已经转入您指定账户。','0','0','1','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('21','TPL_USER_WITHDRAW_MAIL','{$user_name}您好，你的提现申请已通过，{$money_format}已经转入您指定账户。','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('22','TPL_SUPPLIER_WITHDRAW_SMS','{$supplier_name}您好，{$money_format}已经转入您指定账户。','0','0','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%nav`;
CREATE TABLE `%DB_PREFIX%nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '跳转的外链URL',
  `blank` tinyint(1) NOT NULL COMMENT '是否在新窗口打开',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `u_module` varchar(255) NOT NULL COMMENT '指向的前台module',
  `u_action` varchar(255) NOT NULL COMMENT '指向的前台action',
  `u_id` int(11) NOT NULL COMMENT '弃用',
  `u_param` varchar(255) NOT NULL COMMENT 'url的参数，以原始的url传参方式填入 如：id=1&cid=2&pid=3',
  `is_shop` tinyint(1) NOT NULL COMMENT '菜单显示的频道 0:全部显示 1:团购频道 2:商城频道 3:优惠券频道',
  `app_index` varchar(255) NOT NULL COMMENT '指向的前台app应用入口',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='前台导航菜单配置表';
INSERT INTO `%DB_PREFIX%nav` VALUES ('32','团购','','0','0','1','tuan','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('20','首页','','0','5','1','index','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('31','商城','','0','0','1','mall','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('33','活动','','0','0','1','events','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('34','商家','','0','0','1','stores','index','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('35','达人秀','','0','0','1','daren','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('36','小组','','0','0','1','group','index','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('37','发现','','0','0','1','discover','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('39','优惠券','','0','0','1','youhuis','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('42','积分商城','','0','0','1','scores','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('43','身边团购','','0','0','1','position','','0','','0','index');
DROP TABLE IF EXISTS `%DB_PREFIX%payment`;
CREATE TABLE `%DB_PREFIX%payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '支付接口类名',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `online_pay` tinyint(1) NOT NULL COMMENT '是否为在线支付的接口',
  `fee_amount` double(20,4) NOT NULL COMMENT '手续费用的计费值',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `total_amount` double(20,4) NOT NULL,
  `config` text NOT NULL COMMENT '相关的配置信息',
  `logo` varchar(255) NOT NULL COMMENT '显示的图标',
  `sort` int(11) NOT NULL,
  `fee_type` tinyint(1) NOT NULL COMMENT '手续费的计费标准 0:定额 1:支付总额的比率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='支付接口表';
INSERT INTO `%DB_PREFIX%payment` VALUES ('17','Account','1','1','0.0000','余额支付','','95.8000','N;','','1','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('18','AlipayBank','1','1','0.0000','支付宝银行直连支付','','10113.0000','a:4:{s:14:\"alipay_partner\";s:0:\"\";s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_gateway\";a:17:{s:7:\"ICBCB2C\";s:1:\"1\";s:3:\"CMB\";s:1:\"1\";s:3:\"CCB\";s:1:\"1\";s:3:\"ABC\";s:1:\"1\";s:4:\"SPDB\";s:1:\"1\";s:3:\"SDB\";s:1:\"1\";s:3:\"CIB\";s:1:\"1\";s:6:\"BJBANK\";s:1:\"1\";s:7:\"CEBBANK\";s:1:\"1\";s:4:\"CMBC\";s:1:\"1\";s:5:\"CITIC\";s:1:\"1\";s:3:\"GDB\";s:1:\"1\";s:7:\"SPABANK\";s:1:\"1\";s:6:\"BOCB2C\";s:1:\"1\";s:4:\"COMM\";s:1:\"1\";s:7:\"ICBCBTB\";s:1:\"1\";s:10:\"PSBC-DEBIT\";s:1:\"1\";}}','','2','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('19','Voucher','1','1','0.0000','代金券支付','','0.0000','N;','','3','0');
DROP TABLE IF EXISTS `%DB_PREFIX%payment_notice`;
CREATE TABLE `%DB_PREFIX%payment_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL COMMENT '支付单号',
  `create_time` int(11) NOT NULL COMMENT '下单时间',
  `pay_time` int(11) NOT NULL COMMENT '付款时间',
  `order_id` int(11) NOT NULL COMMENT '关联的订单号ID',
  `is_paid` tinyint(1) NOT NULL COMMENT '是否已支付',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `payment_id` int(11) NOT NULL COMMENT '支付接口ID',
  `memo` text NOT NULL COMMENT '付款单备注',
  `money` decimal(20,4) NOT NULL COMMENT '应付金额',
  `outer_notice_sn` varchar(255) NOT NULL COMMENT '第三方支付平台的对帐号',
  `ecv_id` int(11) NOT NULL COMMENT '代金券ID',
`order_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:全部订单 ,1:外卖预定订单,2:商户订单,3:普通订单,4:会员买单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_sn_unk` (`notice_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='支付单表';
DROP TABLE IF EXISTS `%DB_PREFIX%point_group`;
CREATE TABLE `%DB_PREFIX%point_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='点评评分分组配置表';
INSERT INTO `%DB_PREFIX%point_group` VALUES ('3','口味','100');
INSERT INTO `%DB_PREFIX%point_group` VALUES ('4','服务','100');
INSERT INTO `%DB_PREFIX%point_group` VALUES ('5','质量','100');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_elink`;
CREATE TABLE `%DB_PREFIX%point_group_elink` (
  `point_group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评评分分组与活动大分类的关联表';
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('3','3');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','1');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','2');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','3');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','4');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','5');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_link`;
CREATE TABLE `%DB_PREFIX%point_group_link` (
  `point_group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评评分分组与生活分服大分类的关联表';
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('3','8');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','17');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','16');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','15');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','14');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','13');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','11');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','10');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','9');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','8');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_slink`;
CREATE TABLE `%DB_PREFIX%point_group_slink` (
  `point_group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评评分分组与商城大分类的关联表';
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','29');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','28');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','27');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','26');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','25');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','24');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','30');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','31');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','32');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','33');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','35');
DROP TABLE IF EXISTS `%DB_PREFIX%promote`;
CREATE TABLE `%DB_PREFIX%promote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '促销活动接口类名',
  `sort` int(11) NOT NULL COMMENT '促销活动的优先级 小到大(多个促销活动生效时，由排序较小的先开始计算，优先生效)',
  `config` text NOT NULL COMMENT '促销活动的配置信息',
  `description` text NOT NULL COMMENT '活动描述（用于订单中记录当前所享受的促销优惠的描述）',
 `type`  tinyint(1) NOT NULL COMMENT '促销规则类型0：默认全站  1：商户促销',
 `supplier_id`  int(11) NOT NULL COMMENT '商户ID',
 `name`  varchar(255) NOT NULL COMMENT '促销活动的名称' ,
 `supplier_or_platform`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0平台，1商户' ,

  PRIMARY KEY (`id`),
UNIQUE KEY `class_name_supplier_id_unique` (`class_name`, `supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='促销活动接口安装表';
DROP TABLE IF EXISTS `%DB_PREFIX%promote_msg`;
CREATE TABLE `%DB_PREFIX%promote_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '群发推广信息类型(0:短信 1:邮件)',
  `title` varchar(255) NOT NULL COMMENT '群发信息（邮件标题）',
  `content` text NOT NULL COMMENT '群发的内容',
  `send_time` int(11) NOT NULL COMMENT '设置的自动发送的时间',
  `send_status` tinyint(1) NOT NULL COMMENT '发送状态 0:未发送 1:发送中 2:已发送',
  `deal_id` int(11) NOT NULL COMMENT '针对某个商品发送的推广信息',
  `send_type` tinyint(1) NOT NULL COMMENT '发送方式（0:按会员组 1:按订阅地区发送 2:自定义发送，即指定邮箱、手机发送）',
  `send_type_id` int(11) NOT NULL COMMENT '发送类型为按会员组时：会员组ID，发送类型为按地区时：城市ID',
  `send_define_data` text NOT NULL COMMENT '自定义发送时存放指定的邮箱地址、手机号，用半角逗号分隔',
  `is_html` tinyint(1) NOT NULL COMMENT '群发为邮件时的邮件类型，是否为超文本邮件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='群发推广信息';
DROP TABLE IF EXISTS `%DB_PREFIX%promote_msg_list`;
CREATE TABLE `%DB_PREFIX%promote_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL COMMENT '发送的目标(邮件地址/手机号)',
  `send_type` tinyint(1) NOT NULL COMMENT '发送类型 0:短信 1:邮件',
  `content` text NOT NULL COMMENT '信息内容',
  `title` varchar(255) NOT NULL COMMENT '邮件的标题',
  `send_time` int(11) NOT NULL COMMENT '发送的时间',
  `is_send` tinyint(1) NOT NULL COMMENT '是否已发送 0:否 1:等待队列发送',
  `create_time` int(11) NOT NULL COMMENT '生成的时间',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `result` text NOT NULL COMMENT '发送结果（如出错存放服务器或接口返回的错误信息）',
  `is_success` tinyint(1) NOT NULL COMMENT '是否发送成功',
  `is_html` tinyint(1) NOT NULL COMMENT '只针对邮件使用，是否为超文本邮件 0:否 1:是',
  `msg_id` int(11) NOT NULL COMMENT '群发信息的原消息ID promote_msg表的数据ID',
  PRIMARY KEY (`id`),
  KEY `dest_idx` (`dest`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='推广群发的发送队列表';
DROP TABLE IF EXISTS `%DB_PREFIX%referrals`;
CREATE TABLE `%DB_PREFIX%referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '邀请人ID（即需要返利的会员ID）',
  `rel_user_id` int(11) NOT NULL COMMENT '被邀请人ID',
  `money` double(20,4) NOT NULL COMMENT '返利的现金',
  `create_time` int(11) NOT NULL COMMENT '返利生成的时间',
  `pay_time` int(11) NOT NULL COMMENT '返利发放的时间',
  `order_id` int(11) NOT NULL COMMENT '关联的订单ID',
  `score` int(11) NOT NULL COMMENT '返利的积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='邀请返利记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%region_conf`;
CREATE TABLE `%DB_PREFIX%region_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级地区ID',
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '2:省 3:市(县)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3411 DEFAULT CHARSET=utf8 COMMENT='地区信息表（会员资料修改中用到的地区信息）';
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3','1','安徽','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('4','1','福建','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('5','1','甘肃','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('6','1','广东','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('7','1','广西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('8','1','贵州','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('9','1','海南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('10','1','河北','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('11','1','河南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('12','1','黑龙江','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('13','1','湖北','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('14','1','湖南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('15','1','吉林','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('16','1','江苏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('17','1','江西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('18','1','辽宁','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('19','1','内蒙古','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('20','1','宁夏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('21','1','青海','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('22','1','山东','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('23','1','山西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('24','1','陕西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('26','1','四川','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('28','1','西藏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('29','1','新疆','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('30','1','云南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('31','1','浙江','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('36','3','安庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('37','3','蚌埠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('38','3','巢湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('39','3','池州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('40','3','滁州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('41','3','阜阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('42','3','淮北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('43','3','淮南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('44','3','黄山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('45','3','六安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('46','3','马鞍山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('47','3','宿州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('48','3','铜陵','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('49','3','芜湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('50','3','宣城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('51','3','亳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('52','2','北京','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('53','4','福州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('54','4','龙岩','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('55','4','南平','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('56','4','宁德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('57','4','莆田','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('58','4','泉州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('59','4','三明','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('60','4','厦门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('61','4','漳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('62','5','兰州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('63','5','白银','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('64','5','定西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('65','5','甘南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('66','5','嘉峪关','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('67','5','金昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('68','5','酒泉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('69','5','临夏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('70','5','陇南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('71','5','平凉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('72','5','庆阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('73','5','天水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('74','5','武威','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('75','5','张掖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('76','6','广州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('77','6','深圳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('78','6','潮州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('79','6','东莞','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('80','6','佛山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('81','6','河源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('82','6','惠州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('83','6','江门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('84','6','揭阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('85','6','茂名','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('86','6','梅州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('87','6','清远','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('88','6','汕头','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('89','6','汕尾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('90','6','韶关','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('91','6','阳江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('92','6','云浮','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('93','6','湛江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('94','6','肇庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('95','6','中山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('96','6','珠海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('97','7','南宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('98','7','桂林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('99','7','百色','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('100','7','北海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('101','7','崇左','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('102','7','防城港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('103','7','贵港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('104','7','河池','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('105','7','贺州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('106','7','来宾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('107','7','柳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('108','7','钦州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('109','7','梧州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('110','7','玉林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('111','8','贵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('112','8','安顺','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('113','8','毕节','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('114','8','六盘水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('115','8','黔东南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('116','8','黔南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('117','8','黔西南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('118','8','铜仁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('119','8','遵义','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('120','9','海口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('121','9','三亚','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('122','9','白沙','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('123','9','保亭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('124','9','昌江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('125','9','澄迈县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('126','9','定安县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('127','9','东方','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('128','9','乐东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('129','9','临高县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('130','9','陵水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('131','9','琼海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('132','9','琼中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('133','9','屯昌县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('134','9','万宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('135','9','文昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('136','9','五指山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('137','9','儋州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('138','10','石家庄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('139','10','保定','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('140','10','沧州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('141','10','承德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('142','10','邯郸','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('143','10','衡水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('144','10','廊坊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('145','10','秦皇岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('146','10','唐山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('147','10','邢台','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('148','10','张家口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('149','11','郑州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('150','11','洛阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('151','11','开封','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('152','11','安阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('153','11','鹤壁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('154','11','济源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('155','11','焦作','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('156','11','南阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('157','11','平顶山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('158','11','三门峡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('159','11','商丘','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('160','11','新乡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('161','11','信阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('162','11','许昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('163','11','周口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('164','11','驻马店','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('165','11','漯河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('166','11','濮阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('167','12','哈尔滨','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('168','12','大庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('169','12','大兴安岭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('170','12','鹤岗','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('171','12','黑河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('172','12','鸡西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('173','12','佳木斯','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('174','12','牡丹江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('175','12','七台河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('176','12','齐齐哈尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('177','12','双鸭山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('178','12','绥化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('179','12','伊春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('180','13','武汉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('181','13','仙桃','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('182','13','鄂州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('183','13','黄冈','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('184','13','黄石','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('185','13','荆门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('186','13','荆州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('187','13','潜江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('188','13','神农架林区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('189','13','十堰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('190','13','随州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('191','13','天门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('192','13','咸宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('193','13','襄樊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('194','13','孝感','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('195','13','宜昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('196','13','恩施','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('197','14','长沙','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('198','14','张家界','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('199','14','常德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('200','14','郴州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('201','14','衡阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('202','14','怀化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('203','14','娄底','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('204','14','邵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('205','14','湘潭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('206','14','湘西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('207','14','益阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('208','14','永州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('209','14','岳阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('210','14','株洲','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('211','15','长春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('212','15','吉林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('213','15','白城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('214','15','白山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('215','15','辽源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('216','15','四平','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('217','15','松原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('218','15','通化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('219','15','延边','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('220','16','南京','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('221','16','苏州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('222','16','无锡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('223','16','常州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('224','16','淮安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('225','16','连云港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('226','16','南通','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('227','16','宿迁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('228','16','泰州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('229','16','徐州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('230','16','盐城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('231','16','扬州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('232','16','镇江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('233','17','南昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('234','17','抚州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('235','17','赣州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('236','17','吉安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('237','17','景德镇','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('238','17','九江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('239','17','萍乡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('240','17','上饶','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('241','17','新余','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('242','17','宜春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('243','17','鹰潭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('244','18','沈阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('245','18','大连','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('246','18','鞍山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('247','18','本溪','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('248','18','朝阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('249','18','丹东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('250','18','抚顺','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('251','18','阜新','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('252','18','葫芦岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('253','18','锦州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('254','18','辽阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('255','18','盘锦','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('256','18','铁岭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('257','18','营口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('258','19','呼和浩特','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('259','19','阿拉善盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('260','19','巴彦淖尔盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('261','19','包头','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('262','19','赤峰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('263','19','鄂尔多斯','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('264','19','呼伦贝尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('265','19','通辽','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('266','19','乌海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('267','19','乌兰察布市','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('268','19','锡林郭勒盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('269','19','兴安盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('270','20','银川','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('271','20','固原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('272','20','石嘴山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('273','20','吴忠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('274','20','中卫','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('275','21','西宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('276','21','果洛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('277','21','海北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('278','21','海东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('279','21','海南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('280','21','海西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('281','21','黄南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('282','21','玉树','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('283','22','济南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('284','22','青岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('285','22','滨州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('286','22','德州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('287','22','东营','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('288','22','菏泽','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('289','22','济宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('290','22','莱芜','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('291','22','聊城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('292','22','临沂','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('293','22','日照','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('294','22','泰安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('295','22','威海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('296','22','潍坊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('297','22','烟台','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('298','22','枣庄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('299','22','淄博','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('300','23','太原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('301','23','长治','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('302','23','大同','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('303','23','晋城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('304','23','晋中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('305','23','临汾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('306','23','吕梁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('307','23','朔州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('308','23','忻州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('309','23','阳泉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('310','23','运城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('311','24','西安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('312','24','安康','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('313','24','宝鸡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('314','24','汉中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('315','24','商洛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('316','24','铜川','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('317','24','渭南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('318','24','咸阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('319','24','延安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('320','24','榆林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('321','25','上海','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('322','26','成都','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('323','26','绵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('324','26','阿坝','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('325','26','巴中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('326','26','达州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('327','26','德阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('328','26','甘孜','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('329','26','广安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('330','26','广元','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('331','26','乐山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('332','26','凉山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('333','26','眉山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('334','26','南充','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('335','26','内江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('336','26','攀枝花','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('337','26','遂宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('338','26','雅安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('339','26','宜宾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('340','26','资阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('341','26','自贡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('342','26','泸州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('343','27','天津','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('344','28','拉萨','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('345','28','阿里','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('346','28','昌都','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('347','28','林芝','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('348','28','那曲','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('349','28','日喀则','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('350','28','山南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('351','29','乌鲁木齐','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('352','29','阿克苏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('353','29','阿拉尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('354','29','巴音郭楞','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('355','29','博尔塔拉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('356','29','昌吉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('357','29','哈密','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('358','29','和田','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('359','29','喀什','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('360','29','克拉玛依','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('361','29','克孜勒苏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('362','29','石河子','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('363','29','图木舒克','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('364','29','吐鲁番','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('365','29','五家渠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('366','29','伊犁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('367','30','昆明','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('368','30','怒江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('369','30','普洱','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('370','30','丽江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('371','30','保山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('372','30','楚雄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('373','30','大理','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('374','30','德宏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('375','30','迪庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('376','30','红河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('377','30','临沧','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('378','30','曲靖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('379','30','文山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('380','30','西双版纳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('381','30','玉溪','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('382','30','昭通','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('383','31','杭州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('384','31','湖州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('385','31','嘉兴','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('386','31','金华','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('387','31','丽水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('388','31','宁波','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('389','31','绍兴','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('390','31','台州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('391','31','温州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('392','31','舟山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('393','31','衢州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('394','32','重庆','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('395','33','香港','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('396','34','澳门','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('397','35','台湾','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('500','52','东城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('501','52','西城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('502','52','海淀区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('503','52','朝阳区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('504','52','崇文区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('505','52','宣武区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('506','52','丰台区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('507','52','石景山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('508','52','房山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('509','52','门头沟区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('510','52','通州区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('511','52','顺义区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('512','52','昌平区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('513','52','怀柔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('514','52','平谷区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('515','52','大兴区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('516','52','密云县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('517','52','延庆县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2703','321','长宁区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2704','321','闸北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2705','321','闵行区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2706','321','徐汇区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2707','321','浦东新区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2708','321','杨浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2709','321','普陀区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2710','321','静安区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2711','321','卢湾区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2712','321','虹口区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2713','321','黄浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2714','321','南汇区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2715','321','松江区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2716','321','嘉定区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2717','321','宝山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2718','321','青浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2719','321','金山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2720','321','奉贤区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2721','321','崇明县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2912','343','和平区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2913','343','河西区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2914','343','南开区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2915','343','河北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2916','343','河东区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2917','343','红桥区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2918','343','东丽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2919','343','津南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2920','343','西青区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2921','343','北辰区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2922','343','塘沽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2923','343','汉沽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2924','343','大港区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2925','343','武清区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2926','343','宝坻区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2927','343','经济开发区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2928','343','宁河县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2929','343','静海县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2930','343','蓟县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3325','394','合川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3326','394','江津区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3327','394','南川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3328','394','永川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3329','394','南岸区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3330','394','渝北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3331','394','万盛区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3332','394','大渡口区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3333','394','万州区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3334','394','北碚区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3335','394','沙坪坝区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3336','394','巴南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3337','394','涪陵区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3338','394','江北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3339','394','九龙坡区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3340','394','渝中区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3341','394','黔江开发区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3342','394','长寿区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3343','394','双桥区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3344','394','綦江县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3345','394','潼南县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3346','394','铜梁县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3347','394','大足县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3348','394','荣昌县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3349','394','璧山县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3350','394','垫江县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3351','394','武隆县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3352','394','丰都县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3353','394','城口县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3354','394','梁平县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3355','394','开县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3356','394','巫溪县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3357','394','巫山县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3358','394','奉节县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3359','394','云阳县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3360','394','忠县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3361','394','石柱','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3362','394','彭水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3363','394','酉阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3364','394','秀山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3365','395','沙田区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3366','395','东区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3367','395','观塘区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3368','395','黄大仙区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3369','395','九龙城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3370','395','屯门区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3371','395','葵青区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3372','395','元朗区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3373','395','深水埗区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3374','395','西贡区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3375','395','大埔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3376','395','湾仔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3377','395','油尖旺区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3378','395','北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3379','395','南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3380','395','荃湾区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3381','395','中西区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3382','395','离岛区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3383','396','澳门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3384','397','台北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3385','397','高雄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3386','397','基隆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3387','397','台中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3388','397','台南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3389','397','新竹','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3390','397','嘉义','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3391','397','宜兰县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3392','397','桃园县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3393','397','苗栗县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3394','397','彰化县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3395','397','南投县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3396','397','云林县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3397','397','屏东县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3398','397','台东县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3399','397','花莲县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3400','397','澎湖县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3401','3','合肥','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3402','3401','瑶海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3403','3401','庐阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3404','3401','蜀山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3405','3401','包河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3406','3401','长丰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3407','3401','肥东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3408','3401','肥西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3409','3401','巢湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3410','3401','庐江','3');
DROP TABLE IF EXISTS `%DB_PREFIX%relate_goods`;
CREATE TABLE `%DB_PREFIX%relate_goods` (
  `good_id` int(11) NOT NULL COMMENT '商品/团购id',
  `relate_ids` text NOT NULL COMMENT '关联的商品/团购id',
  `is_shop` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=团购、1=商品',
  UNIQUE KEY `good_id` (`good_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品关联购买';
DROP TABLE IF EXISTS `%DB_PREFIX%remind_count`;
CREATE TABLE `%DB_PREFIX%remind_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_count` int(11) NOT NULL COMMENT '分享统计',
  `topic_count_time` int(11) NOT NULL COMMENT '最后一次分享统计的时间',
  `dp_count` int(11) NOT NULL COMMENT '点评统计',
  `dp_count_time` int(11) NOT NULL COMMENT '最后一次点评统计的时间',
  `msg_count` int(11) NOT NULL COMMENT '留言统计',
  `msg_count_time` int(11) NOT NULL COMMENT '最后一次留言统计的时间',
  `buy_msg_count` int(11) NOT NULL COMMENT '购物点评统计',
  `buy_msg_count_time` int(11) NOT NULL COMMENT '最后一次购物点评统计的时间',
  `order_count` int(11) NOT NULL COMMENT '订单统计',
  `order_count_time` int(11) NOT NULL COMMENT '最后一次订单统计的时间',
  `refund_count` int(11) NOT NULL COMMENT '退款统计',
  `refund_count_time` int(11) NOT NULL COMMENT '最后一次退款统计的时间',
  `retake_count` int(11) NOT NULL COMMENT '弃用',
  `retake_count_time` int(11) NOT NULL COMMENT '弃用',
  `incharge_count` int(11) NOT NULL COMMENT '充值统计',
  `incharge_count_time` int(11) NOT NULL COMMENT '最后一次充值统计的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台首页新进数据统计的记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%role`;
CREATE TABLE `%DB_PREFIX%role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表';
DROP TABLE IF EXISTS `%DB_PREFIX%role_access`;
CREATE TABLE `%DB_PREFIX%role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `node` varchar(255) NOT NULL COMMENT '节点action名',
  `module` varchar(255) NOT NULL COMMENT '模块名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='后台角色权限配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%session`;
CREATE TABLE `%DB_PREFIX%session` (
  `session_id` varchar(255) NOT NULL,
  `session_data` text NOT NULL,
  `session_time` int(11) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%shop_cate`;
CREATE TABLE `%DB_PREFIX%shop_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `brief` text NOT NULL COMMENT '分类描述',
  `pid` int(11) NOT NULL COMMENT '所属父类ID',
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `uname` varchar(255) NOT NULL COMMENT 'url别名',
  `recommend` tinyint(1) NOT NULL COMMENT '是否将该分类推荐为商城首页的分类产品模块 0:否 1:是',
  `iconfont` varchar(15) NOT NULL,
  `iconcolor` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='商城分类表';
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('24','服装','','0','0','1','1','cloth','1','','#438ccb');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('25','鞋帽','','0','0','1','14','','0','&#58892;','#00736a');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('26','手表眼镜','','0','0','1','13','','0','&#58884;','#a1410d');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('27','家居日用','','0','0','1','12','','0','','#37b44a');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('28','居家生活','','0','0','1','17','','0','&#58893;','#855fa8');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('29','母婴用品','','0','0','1','6','','1','','#f16522');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('30','女装','','24','0','1','7','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('31','男装','','24','0','1','8','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('32','家居服','','24','0','1','9','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('33','毛衣','','24','0','1','10','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('35','数码电器','','0','0','1','11','','0','&#58898;','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('36','书包','','29','0','1','15','','0','&#58891;','#790000');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('37','玩具','','29','0','1','16','','0','&#58896;','#acd372');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('38','手机','','35','0','1','18','','0','&#58887;','#7ca6d8');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('39','小家电','','35','0','1','19','','0','&#58883;','#6ccff7');
DROP TABLE IF EXISTS `%DB_PREFIX%sms`;
CREATE TABLE `%DB_PREFIX%sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '短信接口显示名称',
  `description` text NOT NULL COMMENT '描述',
  `class_name` varchar(255) NOT NULL COMMENT '类名',
  `server_url` text NOT NULL COMMENT '接口的服务器通讯地址',
  `user_name` varchar(255) NOT NULL COMMENT '接口商验证用用户名',
  `password` varchar(255) NOT NULL COMMENT '接口商验证用密码',
  `config` text NOT NULL COMMENT '额外的配置信息',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='短信接口配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%sms_mobile_verify`;
CREATE TABLE `%DB_PREFIX%sms_mobile_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_phone` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `ip` varchar(100) NOT NULL COMMENT '发送短信人的IP',
  `send_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%statements`;
CREATE TABLE `%DB_PREFIX%statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income_money` decimal(20,4) NOT NULL COMMENT '收入',
  `income_order` decimal(20,4) NOT NULL COMMENT '收入中用于订单支付',
  `income_incharge` decimal(20,4) NOT NULL COMMENT '收入用于会员充值(含超额充值)',
  `out_money` decimal(20,4) NOT NULL COMMENT '支出',
  `out_uwd_money` decimal(20,4) NOT NULL COMMENT '会员提现支出',
  `out_swd_money` decimal(20,4) NOT NULL COMMENT '商户提现支出',
  `refund_money` decimal(20,4) NOT NULL COMMENT '退款金额',
  `refund_cost_money` decimal(20,4) NOT NULL,
  `sale_money` decimal(20,4) NOT NULL COMMENT '销售额,所有支付成功的订单面额(不含在线充值)',
  `sale_cost_money` decimal(20,4) NOT NULL COMMENT '销售额中成本(即将结算给商家的部份)',
  `balance_money` decimal(20,4) NOT NULL COMMENT '商家结算额',
  `verify_money` decimal(20,4) NOT NULL COMMENT '消费的数量',
  `verify_cost_money` decimal(20,4) NOT NULL COMMENT '消费额中的成本',
  `stat_time` date NOT NULL COMMENT '日报时间',
  `stat_month` varchar(10) NOT NULL COMMENT '月份',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_time` (`stat_time`) USING BTREE,
  KEY `stat_month` (`stat_month`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='平台财务日报表\r\n';
INSERT INTO `%DB_PREFIX%statements` VALUES ('1','10208.8000','208.8000','10000.0000','0.0000','0.0000','0.0000','69.0000','50.0000','208.8000','132.0000','62.0000','113.0000','62.0000','2015-02-26','2015-02');
DROP TABLE IF EXISTS `%DB_PREFIX%statements_log`;
CREATE TABLE `%DB_PREFIX%statements_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0.收入 1.订单支付收入 2.会员充值收入 3.支出 4.会员提现支出 5.商户提现支出 6.退款金额 7.退款中的成本 8.销售额,所有支付成功的订单面额(不含在线充值) 9.销售额中成本(即将结算给商家的部份) 10.商家结算额 11.消费额 12.消费额中的成本',
  `money` decimal(20,4) NOT NULL,
  `log_info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='财务报表日志';
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('1','1424886396','0','10000.0000','20150226094620767订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('2','1424886396','1','10000.0000','20150226094620767订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('3','1424886396','1','-10000.0000','20150226094620767会员充值');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('4','1424886396','2','10000.0000','20150226094620767会员充值，含手续费');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('5','1424887216','0','113.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('6','1424887216','1','113.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('7','1424887216','8','113.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('8','1424887216','9','62.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('9','1424890765','0','95.8000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('10','1424890765','1','95.8000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('11','1424890765','8','95.8000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('12','1424890765','9','70.0000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('13','1424890988','10','62.0000','订单号2015022610000323 61323563消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('14','1424890988','11','113.0000','订单号2015022610000323 61323563消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('15','1424890988','12','62.0000','订单号2015022610000323 61323563消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('16','1424891134','6','69.0000','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('17','1424891134','7','50.0000','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier`;
CREATE TABLE `%DB_PREFIX%supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商户名称',
  `preview` varchar(255) NOT NULL COMMENT '商家logo',
  `content` text NOT NULL COMMENT '商家描述信息',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_effect` tinyint(1) NOT NULL,
  `city_id` int(11) NOT NULL COMMENT '所属城市',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode',
  `name_match_row` text NOT NULL COMMENT '名称全文索引查询用',
  `bank_info` text NOT NULL COMMENT '提现银行帐号',
  `money` decimal(20,4) NOT NULL COMMENT '商户余额(可提现余额,已结算金额，结算后，待结算减少，已结算增加)',
  `sale_money` decimal(20,4) NOT NULL COMMENT '销售总额',
  `lock_money` decimal(20,4) NOT NULL COMMENT '冻结资金(即已销售，未验证，未收货的金额)',
  `balance_money` decimal(20,4) NOT NULL COMMENT '待结算金额（即每验证，收货一个，增加此金额，同时扣除冻结金额）',
  `refund_money` decimal(20,4) NOT NULL COMMENT '已退款金额（退款后增加此金额，同时减少lock_money冻结金额）',
  `wd_money` decimal(20,4) NOT NULL COMMENT '已提现金额：（已提走的金额,提现成功后，增加，同时减少money）',
  `bank_name` varchar(255) NOT NULL COMMENT '提现的开户行名称',
  `bank_user` varchar(255) NOT NULL COMMENT '提现的开户行户名',
  `dp_count_1` int(11) NOT NULL,
  `dp_count_2` int(11) NOT NULL,
  `dp_count_3` int(11) NOT NULL,
  `dp_count_4` int(11) NOT NULL,
  `dp_count_5` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `total_point_1` int(11) NOT NULL,
  `avg_point_1` float(14,4) NOT NULL,
  `total_point_2` int(11) NOT NULL,
  `avg_point_2` float(14,4) NOT NULL,
  `total_point_3` int(11) NOT NULL,
  `avg_point_3` float(14,4) NOT NULL,
  `total_point_4` int(11) NOT NULL,
  `avg_point_4` float(14,4) NOT NULL,
  `total_point_5` int(11) NOT NULL,
  `avg_point_5` float(14,4) NOT NULL,
  `h_name` varchar(255) NOT NULL COMMENT '公司名称',
  `h_faren` varchar(255) NOT NULL COMMENT '法人名称',
  `h_tel` varchar(255) NOT NULL COMMENT '法人联系电话',
  `allow_refund` tinyint(1) NOT NULL COMMENT '是否支持退款审核',
  `allow_publish_verify` tinyint(1) NOT NULL COMMENT '是否支持自动发布',
  `publish_verify_balance` decimal(20,4) NOT NULL COMMENT '自动审核时的结算费用率',
  `weishop_name` varchar(255) NOT NULL COMMENT '微店店名',
  `weishop_logo` varchar(255) NOT NULL COMMENT '微店logo',
  `weishop_banner` text NOT NULL COMMENT '微店banner位(多个)',
  `platform_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否支持公众平台功能 0否 1是',
`is_store_payment`  tinyint(1) NOT NULL COMMENT '商户是否支持到店支付',
  `store_payment_rate`  decimal(8,4) NOT NULL COMMENT '到店支付费率',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `is_effect` (`is_effect`),
  KEY `sort` (`sort`),
  KEY `city_id` (`city_id`),
  FULLTEXT KEY `name_match` (`name_match`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='商户表';
INSERT INTO `%DB_PREFIX%supplier` VALUES ('23','桥亭活鱼小镇','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','','0','0','0','ux26725ux20141,ux23567ux38215,ux26725ux20141ux27963ux40060ux23567ux38215','桥亭,小镇,桥亭活鱼小镇','622255554444771','62.0000','62.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张三','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','桥亭活鱼小镇','张三','0591-88558855','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('24','福州肯德基','./public/attachment/201502/25/14/54ed6b92110bc.jpg','','0','0','0','ux32943ux24503ux22522,ux31119ux24030,ux31119ux24030ux32943ux24503ux22522','肯德基,福州,福州肯德基','622255554444761','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','福州肯德基','王五','0591-88558856','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('25','盛世经典牛排','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','','0','0','0','ux29275ux25490,ux30427ux19990,ux32463ux20856,ux30427ux19990ux32463ux20856ux29275ux25490','牛排,盛世,经典,盛世经典牛排','622255554444771','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','','','','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('26','百度烤肉','./public/attachment/201502/25/14/e7742d7b2aa5e3477382608672802f2614.jpg','','0','0','0','','','5566998785158446562','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国工商银行福州市分行','王一','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','百度烧烤','王一','0591-88558855','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('27','韩悦风尚烤肉','./public/attachment/201502/25/14/54ed724a9d6b5.jpg','','0','0','0','ux28900ux32905,ux39118ux23578,ux38889ux24742,ux38889ux24742ux39118ux23578ux28900ux32905','烤肉,风尚,韩悦,韩悦风尚烤肉','622255554444771','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','韩悦风尚烤肉','张三','0591-88558855','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('28','石山水美式餐厅','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','','0','0','0','ux32654ux24335,ux23665ux27700,ux39184ux21381,ux30707ux23665ux27700ux32654ux24335ux39184ux21381','美式,山水,餐厅,石山水美式餐厅','622255554444771','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','石山水美式餐厅','王五','0591-88558856','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('29','agogo量贩KTV','./public/attachment/201502/25/15/54ed7b363e1e0.jpg','','0','0','0','ux37327ux36137,ux97ux103ux111ux103ux111,ux75ux84ux86,ux97ux103ux111ux103ux111ux37327ux36137ux75ux84ux86','量贩,agogo,KTV,agogo量贩KTV','622255554444761','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','agogo量贩KTV','王五','0591-88558855','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('30','贵安温泉','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','','0','0','0','ux28201ux27849,ux36149ux23433ux28201ux27849','温泉,贵安温泉','6228480063042965416','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','福州上海新村支行 ','农业银行','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','贵安温泉','小贵安','13422200993','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('31','国际旅行社','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','','0','0','0','ux26053ux34892ux31038,ux22269ux38469,ux22269ux38469ux26053ux34892ux31038','旅行社,国际,国际旅行社','6228 4800 6304 2965 416','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','农业银行福州分行','陈福权','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','国际旅行社','陈福权','0591-88600831','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('32','龙中龙','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','','0','0','0','ux20013ux40857,ux40857ux20013ux40857','中龙,龙中龙','622255554444771','0.0000','50.0000','0.0000','0.0000','50.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','龙中龙','王五','0591-88558855','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('33','爱丁堡尊贵养生会所','','','0','0','0','ux29233ux19969ux22561,ux20250ux25152,ux23562ux36149,ux20859ux29983,ux29233ux19969ux22561ux23562ux36149ux20859ux29983ux20250ux25152','爱丁堡,会所,尊贵,养生,爱丁堡尊贵养生会所','6228 4800 6304 2965 416','0.0000','20.0000','20.0000','0.0000','0.0000','0.0000','中国银行福州分行','爱丁堡','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','爱丁堡尊贵养生会所','爱丁堡','13478790998','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('36','明视眼镜','./public/attachment/201502/25/17/54ed9b8e44904.jpg','','0','0','0','ux26126ux35270,ux30524ux38236,ux26126ux35270ux30524ux38236','明视,眼镜,明视眼镜','6222 6007 2000 7040 794','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','招商银行福州分行','小明','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','明视眼镜','小明','0591-789665767','0','0','0.0000','','','','1','0','');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('35','美丽人生摄影工作室','./public/attachment/201502/25/17/54ed9486611f6.jpg','','0','0','0','ux32654ux20029ux20154ux29983,ux24037ux20316ux23460,ux25668ux24433,ux32654ux20029ux20154ux29983ux25668ux24433ux24037ux20316ux23460','美丽人生,工作室,摄影,美丽人生摄影工作室','6222 6007 2000 7040 794','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','工商银行福州分行','张美丽','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','美丽人生摄影工作室','张美丽','0591-88977601','0','0','0.0000','','','','1','0','');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_account`;
CREATE TABLE `%DB_PREFIX%supplier_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL COMMENT '商家帐号名',
  `account_password` varchar(255) NOT NULL COMMENT '商家帐号密码',
  `supplier_id` int(11) NOT NULL COMMENT '所属商家ID',
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `description` text NOT NULL COMMENT '帐号说明（管理员备注用）',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `update_time` int(11) NOT NULL COMMENT '最后更新时间',
  `allow_delivery` tinyint(1) NOT NULL COMMENT '是否允许对订单进行发货操作',
  `allow_charge` tinyint(1) NOT NULL COMMENT '是否允许提现',
  `is_main` tinyint(1) NOT NULL COMMENT '是否为默认总管理员',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `dev_type` varchar(20) DEFAULT 'android' COMMENT 'android,ios 客户手机类型,一个客户只绑定一个最新的手机',
  `device_token` varchar(255) DEFAULT NULL COMMENT '推送device_token一个客户只绑定一个最新的手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_account_name` (`account_name`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `is_main` (`is_main`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商家帐号表';
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('8','fanwe','6714ccb93be0fda4e51f206b91b46358','23','1','0','','127.0.0.1','1424887838','0','0','0','1','13344455555','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('9','fanwek','6a514dded382281a560aa05e994c5cc1','24','1','0','','','0','0','0','0','1','13355566666','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('10','fanwes','4192eb75e54d4f51267e42106f0afcc2','25','1','0','','127.0.0.1','1424885838','0','0','0','1','15555544444','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('11','fanwebaidu','27cb989dfaec51641a0f3b0064808419','26','1','0','百度烧烤 法人：王一 电话：0591-88558855','127.0.0.1','1424818564','1424818410','1','1','1','13955599999','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('12','fanwekr','9566ad968383b14b6b529ae6ea8bb377','27','1','0','','','0','0','0','0','1','16655555444','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('13','fanwesss','fdfa2e513b7b4fe69bde4ddc5ad4b923','28','1','0','','','0','0','0','0','1','16655544444','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('14','fanweagg','b8193ee030cd0dea479994c20f6b5814','29','1','0','','','0','0','0','0','1','15555555555','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('15','guian','98886e110d9d8f6bbeac35163d6788cd','30','1','0','','','0','0','0','0','1','13600920332','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('16','guoji','dab8c15b54ef06ce6eb222b5ae209a26','31','1','0','','','0','0','0','0','1','13809098876','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('17','fanwelzl','468fe920c5c2583b079c5913ca472361','32','1','0','','127.0.0.1','1424911104','0','0','0','1','15566655555','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('18','aidingbao','a58e71be843e7cd399b3d7a54b2b964b','33','1','0','','127.0.0.1','1424892920','0','0','0','1','13457890066','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('19','meilirensheng','18602086be1f03dd9e1f3e980e4b24be','35','1','0','','','0','0','0','0','1','13677890998','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('20','mingshi','4870999e94b519b179eaa8387b712931','36','1','0','','','0','0','0','0','1','1345567788','android','');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_account_auth`;
CREATE TABLE `%DB_PREFIX%supplier_account_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_account_id` int(11) NOT NULL COMMENT '管理员帐号ID',
  `module` varchar(20) NOT NULL COMMENT '授权模块',
  `node` varchar(20) NOT NULL COMMENT '授权节点',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk` (`supplier_account_id`,`module`,`node`),
  KEY `supplier_account_id` (`supplier_account_id`),
  KEY `module` (`module`),
  KEY `node` (`node`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家账号的授权表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_account_location_link`;
CREATE TABLE `%DB_PREFIX%supplier_account_location_link` (
  `account_id` int(11) NOT NULL COMMENT '帐号ID',
  `location_id` int(11) NOT NULL COMMENT '门店ID',
  PRIMARY KEY (`account_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帐号可管理的门店';
INSERT INTO `%DB_PREFIX%supplier_account_location_link` VALUES ('11','26');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_dy`;
CREATE TABLE `%DB_PREFIX%supplier_dy` (
  `uid` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端商家订阅功能';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location`;
CREATE TABLE `%DB_PREFIX%supplier_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '门店名称',
  `route` text NOT NULL COMMENT '公交线路',
  `address` text NOT NULL COMMENT '门店地址',
  `tel` varchar(255) NOT NULL COMMENT '门店电话',
  `contact` varchar(255) NOT NULL COMMENT '联系人',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `supplier_id` int(11) NOT NULL COMMENT '所属商家ID',
  `open_time` varchar(255) NOT NULL COMMENT '营业时间',
  `brief` text NOT NULL COMMENT '商家简介',
  `is_main` tinyint(1) NOT NULL COMMENT '是否为默认门店(总店)',
  `api_address` text NOT NULL COMMENT '用于地图定位的地址',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `deal_cate_match` text NOT NULL COMMENT '生活服务分类全文索引',
  `deal_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地址全文索引',
  `locate_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '门店名称全文索引',
  `name_match_row` text NOT NULL,
  `deal_cate_id` int(11) NOT NULL COMMENT '所属生活服务大分类ID',
  `preview` varchar(255) NOT NULL COMMENT '列表图',
  `is_recommend` tinyint(1) NOT NULL COMMENT '标识为推荐门店',
  `is_verify` tinyint(1) NOT NULL COMMENT '认证门店',
  `tags` varchar(255) NOT NULL COMMENT '标签列表 多个标签以空格分隔',
  `tags_match` text NOT NULL COMMENT '标签的全文索引',
  `tags_match_row` text NOT NULL,
  `avg_point` float(14,4) NOT NULL COMMENT '总评平均分，后台可操作更改',
  `good_dp_count` int(11) NOT NULL COMMENT '好评数',
  `bad_dp_count` int(11) NOT NULL COMMENT '差评数',
  `common_dp_count` int(11) NOT NULL COMMENT '中评数',
  `total_point` int(11) NOT NULL COMMENT '点评总分',
  `dp_count` int(11) NOT NULL COMMENT '点评总数',
  `image_count` int(11) NOT NULL COMMENT '门店图片数',
  `ref_avg_price` float(14,4) NOT NULL COMMENT '人均消费',
  `good_rate` float(14,4) NOT NULL COMMENT '好评率',
  `common_rate` float(14,4) NOT NULL COMMENT '中评率',
  `sms_content` varchar(255) NOT NULL DEFAULT '' COMMENT '用户短信下载的商家信息',
  `index_img` varchar(255) NOT NULL DEFAULT '' COMMENT '首页用图',
  `tuan_count` int(11) NOT NULL COMMENT '团购数',
  `event_count` int(11) NOT NULL COMMENT '活动数',
  `youhui_count` int(11) NOT NULL COMMENT '优惠券数',
  `daijin_count` int(11) NOT NULL COMMENT '代金券数',
  `seo_title` text NOT NULL COMMENT '自定义门店页的seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义门店页的seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义门店页的seo描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `biz_license` varchar(255) NOT NULL COMMENT '商家营业执照',
  `biz_other_license` varchar(255) NOT NULL COMMENT '商家的其他资质',
  `new_dp_count` int(11) NOT NULL COMMENT '最新点评数量',
  `new_dp_count_time` int(11) NOT NULL COMMENT '最新点评的更新时间',
  `shop_count` int(11) NOT NULL COMMENT '商品数量',
  `mobile_brief` text NOT NULL COMMENT '手机端列表简介',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `dp_group_point` text NOT NULL COMMENT '门店的分组点评数据的平均分',
  `tuan_youhui_cache` text NOT NULL COMMENT '商家列表页团购与优惠券第一条的展示',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `adv_img_1` text NOT NULL COMMENT '门店顶部广告位',
  `adv_img_2` text NOT NULL COMMENT '门店侧边广告位',
  `location_qq` varchar(20) NOT NULL COMMENT '门店客服QQ',
`open_store_payment`  tinyint(1) NULL COMMENT '针对门店开启到店支付',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `is_verify` (`is_verify`),
  KEY `is_effect` (`is_effect`),
  KEY `is_recommend` (`is_recommend`),
  KEY `avg_point` (`avg_point`),
  KEY `good_dp_count` (`good_dp_count`),
  KEY `bad_dp_count` (`bad_dp_count`),
  KEY `common_dp_count` (`common_dp_count`),
  KEY `total_point` (`total_point`),
  KEY `dp_count` (`dp_count`),
  KEY `good_rate` (`good_rate`),
  KEY `common_rate` (`common_rate`),
  KEY `tuan_count` (`tuan_count`),
  KEY `event_count` (`event_count`),
  KEY `youhui_count` (`youhui_count`),
  KEY `daijin_count` (`daijin_count`),
  KEY `new_dp_count` (`new_dp_count`),
  KEY `is_main` (`is_main`),
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `search_idx1` (`city_id`,`is_recommend`,`is_effect`,`is_verify`) USING BTREE,
  KEY `search_idx2` (`city_id`,`avg_point`,`is_effect`) USING BTREE,
  KEY `search_idx3` (`supplier_id`,`is_main`) USING BTREE,
  KEY `search_idx4` (`city_id`,`deal_cate_id`,`is_verify`,`is_effect`,`is_recommend`) USING BTREE,
  KEY `search_idx5` (`city_id`,`deal_cate_id`,`dp_count`,`avg_point`,`ref_avg_price`,`is_effect`,`is_recommend`,`is_verify`) USING BTREE,
  KEY `search_idx6` (`good_rate`,`is_verify`,`is_effect`) USING BTREE,
  KEY `sort_default` (`is_recommend`,`is_verify`,`dp_count`) USING BTREE,
  KEY `ref_avg_price` (`ref_avg_price`),
  KEY `shop_count` (`shop_count`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `all_match` (`deal_cate_match`,`locate_match`,`name_match`,`tags_match`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='商家门店表';
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('21','桥亭活鱼小镇（万象城店）','','台江区宝龙万象城4楼391号','059188855588','李四','119.296641','26.070661','23','9:00-22:00','<p align=\"center\"><br />\r\n</p>\r\n<p align=\"center\"><img src=\"./public/attachment/201502/25/14/54ed69afb8e5a.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n<p align=\"center\"><br />\r\n</p>\r\n<p align=\"center\"><strong>桥亭泡菜鱼（大份）</strong></p>\r\n<p align=\"center\"><br />\r\n</p>\r\n<p align=\"center\"><strong><img src=\"./public/attachment/201502/25/14/54ed69bd31679.jpg\" alt=\"\" border=\"0\" /><br />\r\n</strong></p>\r\n','0','','15','ux39184ux39278ux32654ux39135,ux38397ux33756,ux24029ux33756','餐饮美食,闽菜,川菜','ux21488ux27743ux21306,ux23453ux40857,ux19975ux35937,ux51ux57ux49,ux21488ux27743ux21306ux23453ux40857ux19975ux35937ux22478ux52ux27004ux51ux57ux49ux21495,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478,ux26725ux20141','台江区,宝龙,万象,391,台江区宝龙万象城4楼391号,宝龙城市广场,万象城,桥亭','ux26725ux20141,ux19975ux35937,ux23567ux38215,ux26725ux20141ux27963ux40060ux23567ux38215ux65288ux19975ux35937ux22478ux24215ux65289','桥亭,万象,小镇,桥亭活鱼小镇（万象城店）','8','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','1','0','水煮活鱼 火锅 川菜','ux27700ux29038ux27963ux40060,ux28779ux38149,ux24029ux33756,ux21619ux36947ux24456ux22909,ux24615ux20215ux27604ux39640,ux19978ux33756ux24930','水煮活鱼,火锅,川菜,味道很好,性价比高,上菜慢','5.0000','1','0','0','5','1','5','113.0000','1.0000','0.0000','','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','1','1','0','0','','','','1','','','1','0','0','','0','','','0','0','0','0','1','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('22','桥亭活鱼小镇（泰禾广场店）','','晋安区新店镇五四北泰禾广场六楼（中影影院旁，音乐-百度KTV旁边）','059188855588','李四','119.3323','26.144803','23','9:00-22:00','','1','','15','ux39184ux39278ux32654ux39135,ux38754ux21253,ux28903ux28900','餐饮美食,面包,烧烤','ux26187ux23433ux21306,ux20845ux27004,ux26032ux24215ux38215,ux20013ux24433,ux24433ux38498,ux26049ux36793,ux24191ux22330,ux30334ux24230,ux38899ux20048,ux75ux84ux86,ux26187ux23433ux21306ux26032ux24215ux38215ux20116ux22235ux21271ux27888ux31166ux24191ux22330ux20845ux27004ux65288ux20013ux24433ux24433ux38498ux26049ux65292ux38899ux20048ux45ux30334ux24230ux75ux84ux86ux26049ux36793ux65289,ux40723ux27004ux21306,ux30465ux20307ux32946ux20013ux24515','晋安区,六楼,新店镇,中影,影院,旁边,广场,百度,音乐,KTV,晋安区新店镇五四北泰禾广场六楼（中影影院旁，音乐-百度KTV旁边）,鼓楼区,省体育中心','ux26725ux20141,ux23567ux38215,ux24191ux22330,ux26725ux20141ux27963ux40060ux23567ux38215ux65288ux27888ux31166ux24191ux22330ux24215ux65289','桥亭,小镇,广场,桥亭活鱼小镇（泰禾广场店）','8','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','0','0','水煮活鱼 火锅 川菜','ux27700ux29038ux27963ux40060,ux28779ux38149,ux24029ux33756','水煮活鱼,火锅,川菜','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','1','1','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('23','肯德基（省府店）','','鼓楼区八一七北路68号福建供销大厦二楼','059188855566','李四','119.304968','26.093466','24','9:00-22:00','','0','鼓楼区八一七北路68号福建供销大厦二楼','15','ux39184ux39278ux32654ux39135,ux38754ux21253','餐饮美食,面包','ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux31119ux24314,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475','鼓楼区,八一七北路,福建,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口','ux32943ux24503ux22522,ux30465ux24220,ux32943ux24503ux22522ux65288ux30465ux24220ux24215ux65289','肯德基,省府,肯德基（省府店）','8','./public/attachment/201502/25/14/54ed6b92110bc.jpg','1','0','汉堡 炸鸡 快餐 肯德基 KFC','ux27721ux22561,ux28856ux40481,ux24555ux39184,ux32943ux24503ux22522,ux75ux70ux67,ux21619ux36947ux24456ux22909','汉堡,炸鸡,快餐,肯德基,KFC,味道很好','4.0000','0','0','0','0','0','0','0.0000','0.9000','0.0000','','./public/attachment/201502/25/14/54ed6b92110bc.jpg','0','0','3','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('24','肯德基（万象店）','','台江区工业路378号万象城1楼','','','119.296591','26.070573','24','','','1','台江区工业路378号万象城1楼','15','ux39184ux39278ux32654ux39135,ux38754ux21253','餐饮美食,面包','ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux19975ux35937,ux32943ux24503ux22522,ux32943ux24503ux22522ux65288ux19975ux35937ux24215ux65289','万象,肯德基,肯德基（万象店）','8','./public/attachment/201502/25/14/54ed6e8ca0d12.jpg','0','0','汉堡 炸鸡 快餐 肯德基 KFC','ux27721ux22561,ux28856ux40481,ux24555ux39184,ux32943ux24503ux22522,ux75ux70ux67','汉堡,炸鸡,快餐,肯德基,KFC','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','./public/attachment/201502/25/14/54ed6e8ca0d12.jpg','0','0','3','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('25','盛世经典牛排（宝龙店）','','台江区工业路193号宝龙城市广场东区1楼149号店面','059188855566','李四','119.299095','26.068075','25','9:00-22:00','','1','','15','ux39184ux39278ux32654ux39135,ux26412ux24110ux33756,ux29980ux28857,ux38754ux21253,ux28903ux28900','餐饮美食,本帮菜,甜点,面包,烧烤','ux21488ux27743ux21306,ux23453ux40857,ux19996ux21306,ux24215ux38754,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux49ux52ux57,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux19996ux21306ux49ux27004ux49ux52ux57ux21495ux24215ux38754,ux23453ux40857ux22478ux24066ux24191ux22330','台江区,宝龙,东区,店面,广场,工业,城市,193,149,台江区工业路193号宝龙城市广场东区1楼149号店面,宝龙城市广场','ux23453ux40857,ux29275ux25490,ux30427ux19990,ux32463ux20856,ux30427ux19990ux32463ux20856ux29275ux25490ux65288ux23453ux40857ux24215ux65289','宝龙,牛排,盛世,经典,盛世经典牛排（宝龙店）','8','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','1','0','牛排','ux29275ux25490','牛排','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','1','0','1','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('26','百度烤肉','','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','059188855588','','119.296641','26.070661','26','9:00-22:00','','1','','15','ux39184ux39278ux32654ux39135,ux28903ux28900','餐饮美食,烧烤','ux21488ux27743ux21306,ux19975ux35937,ux35266ux20809ux30005ux26799,ux65ux71ux79ux71ux79ux75ux84ux86,ux27004ux65288,ux21488ux27743ux21306ux19975ux35937ux22478ux53ux27004ux65288ux35266ux20809ux30005ux26799ux30452ux19978ux53ux27004ux65ux71ux79ux71ux79ux75ux84ux86ux26049ux65289,ux23453ux40857ux22478ux24066ux24191ux22330,ux21338ux32654ux35799ux37030','台江区,万象,观光电梯,AGOGOKTV,楼（,台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）,宝龙城市广场,博美诗邦','ux28900ux32905,ux30334ux24230,ux30334ux24230ux28900ux32905','烤肉,百度,百度烤肉','8','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','1','1','烧烤','ux28903ux28900','烧烤','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','0','0','0','','','','1','./public/attachment/201502/25/14/13abf2842afa3e34a15c71b58a02d10858.jpg','./public/attachment/201502/25/14/aefbd6725f2bed28e9cc252d7bcd02fc52.jpg','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('27','韩悦风尚烤肉（浦江大道店）','','仓山区浦上大道276号仓山万达广场3楼','059188855588','李四','119.28142','26.042355','27','9:00-22:00','','1','仓山区浦上大道276号仓山万达广场3楼','15','ux39184ux39278ux32654ux39135,ux28903ux28900','餐饮美食,烧烤','ux20179ux23665,ux20179ux23665ux21306,ux19975ux36798,ux22823ux36947,ux24191ux22330,ux28006ux19978,ux50ux55ux54,ux20179ux23665ux21306ux28006ux19978ux22823ux36947ux50ux55ux54ux21495ux20179ux23665ux19975ux36798ux24191ux22330ux51ux27004,ux19977ux21449ux34903ux26032ux26449,ux19977ux39640ux36335','仓山,仓山区,万达,大道,广场,浦上,276,仓山区浦上大道276号仓山万达广场3楼,三叉街新村,三高路','ux28006ux27743,ux28900ux32905,ux39118ux23578,ux22823ux36947,ux38889ux24742,ux38889ux24742ux39118ux23578ux28900ux32905ux65288ux28006ux27743ux22823ux36947ux24215ux65289','浦江,烤肉,风尚,大道,韩悦,韩悦风尚烤肉（浦江大道店）','8','./public/attachment/201502/25/14/54ed724a9d6b5.jpg','1','1','烧烤','ux28903ux28900','烧烤','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('28','石山水美式餐厅（东街店）','','鼓楼区东街14号闽辉大厦1楼（近海峡影城）','059188855588','李四','119.307134','26.092442','28','9:00-22:00','','1','鼓楼区东街14号闽辉大厦1楼（近海峡影城）','15','ux39184ux39278ux32654ux39135,ux21654ux21857','餐饮美食,咖啡','ux40723ux27004ux21306,ux19996ux34903,ux24433ux22478,ux28023ux23777,ux22823ux21414,ux27004ux65288,ux40723ux27004ux21306ux19996ux34903ux49ux52ux21495ux38397ux36745ux22823ux21414ux49ux27004ux65288ux36817ux28023ux23777ux24433ux22478ux65289,ux20116ux19968ux24191ux22330,ux19996ux34903ux21475','鼓楼区,东街,影城,海峡,大厦,楼（,鼓楼区东街14号闽辉大厦1楼（近海峡影城）,五一广场,东街口','ux34903ux24215,ux32654ux24335,ux23665ux27700,ux39184ux21381,ux30707ux23665ux27700ux32654ux24335ux39184ux21381ux65288ux19996ux34903ux24215ux65289','街店,美式,山水,餐厅,石山水美式餐厅（东街店）','8','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','1','1','牛排 西餐','ux29275ux25490,ux35199ux39184','牛排,西餐','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('29',' 【万象城/宝龙广场】 agogo量贩KTV','','台江区工业路193号宝龙城市广场四楼','059188855588','李四','119.298093','26.068768','29','9:00-22:00','','1','台江区工业路193号宝龙城市广场四楼','15','ux20241ux38386ux23089ux20048,ux75ux84ux86','休闲娱乐,KTV','ux21488ux27743ux21306,ux23453ux40857,ux22235ux27004,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux22235ux27004,ux23453ux40857ux22478ux24066ux24191ux22330','台江区,宝龙,四楼,广场,工业,城市,193,台江区工业路193号宝龙城市广场四楼,宝龙城市广场','ux23453ux40857,ux19975ux35937,ux37327ux36137,ux24191ux22330,ux97ux103ux111ux103ux111,ux75ux84ux86,ux12304ux19975ux35937ux22478ux47ux23453ux40857ux24191ux22330ux12305ux97ux103ux111ux103ux111ux37327ux36137ux75ux84ux86','宝龙,万象,量贩,广场,agogo,KTV,【万象城/宝龙广场】 agogo量贩KTV','9','./public/attachment/201502/25/15/54ed7b363e1e0.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('30','贵安温泉','直通车时间：冬季10.1-5.31福州发车：早上9：30 下午15：00，贵安发车：下午14：00 晚上20：30，夏季6.1-9.31福州发车：福州早上9：30 下午17：00 贵安发车：下午14：00 晚上22：30，车位33座，先到先得','连江县连江潘渡乡贵安村贵洋路','0591-26298388','小贵安','119.416354','26.227042','30','09:00-24:00','<span style=\"white-space:normal;word-spacing:0px;text-transform:none;float:none;color:#666666;font:12px/18px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">贵安温泉项目包括精品温泉酒店、天趣温泉乐园、香屿温泉花田、西溪森林公园。建有各式客房165间、各种规格的会议厅7间、水岸七星温泉别墅7栋（含有温馨浪漫的木制汤屋30套）、各具特色的温泉泡池80多个、花浴组合泉、药浴组合泉、情侣泉、儿童泡泡泉、溶洞泉、四季泉、鱼疗、高空三彩滑梯、人造冲浪池、人造冷热瀑布、石板保健理疗、香薰蒸气理疗生机盎然的果园花田100多亩、还配套中餐厅、西餐厅、美容、足浴、湖畔烧烤、高尔夫练习场、露天游泳池、网球场、羽毛球场，台球室，棋牌室等康体健身设施。最高水温达82℃，最低水温63℃，现日合理开采温泉量可达6700吨，居全国前五名。度假村的各个温泉池水都是直接取自泉眼的原脉温泉，并且采用的是非稀释的降温方式，可以让您感受到原脉温泉，是福州少有的综合型温泉度假村，也是距离福建省会城市最近的度假村，度假村同山结盟，与溪为邻，水木清华，碧翠嫣然，宁静悠远，犹如人间仙境</span>','1','连江县连江潘渡乡贵安村贵洋路','15','ux37202ux24215ux26053ux28216,ux21608ux36793ux28216','酒店旅游,周边游','ux36830ux27743ux21439,ux28504ux28193,ux36830ux27743,ux23433ux26449,ux36830ux27743ux21439ux36830ux27743ux28504ux28193ux20065ux36149ux23433ux26449ux36149ux27915ux36335,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330','连江县,潘渡,连江,安村,连江县连江潘渡乡贵安村贵洋路,鼓楼区,五一广场','ux28201ux27849,ux36149ux23433ux28201ux27849','温泉,贵安温泉','11','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','1','1','温泉 贵安 ','ux28201ux27849,ux36149ux23433','温泉,贵安','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','2','0','0','','','','1','','','0','0','0','贵安温泉项目包括精品温泉酒店、天趣温泉乐园、香屿温泉花田、西溪森林公园。建有各式客房165间、各种规格的会议厅7间、水岸七星温泉别墅7栋（含有温馨浪漫的木制汤屋30套）、各具特色的温泉泡池80多个、花浴组合泉、药浴组合泉、情侣泉、儿童泡泡泉、溶洞泉、四季泉、鱼疗、高空三彩滑梯、人造冲浪池、人造冷热瀑布、石板保健理疗、香薰蒸气理疗生机盎然的果园花田100多亩、还配套中餐厅、西餐厅、美容、足浴、湖畔烧烤、高尔夫练习场、露天游泳池、网球场、羽毛球场，台球室，棋牌室等康体健身设施。最高水温达82℃，最低水温63℃，现日合理开采温泉量可达6700吨，居全国前五名。度假村的各个温泉池水都是直接取自泉眼的原脉温泉，并且采用的是非稀释的降温方式，可以让您感受到原脉温泉，是福州少有的综合型温泉度假村，也是距离福建省会城市最近的度假村，度假村同山结盟，与溪为邻，水木清华，碧翠嫣然，宁静悠远，犹如人间仙境','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('31','国际旅游社','','鼓楼区五一中路18号正大广场御景台1623','0591-88592106/88592109','小陈','119.317071','26.081434','31','24小时在线','<span style=\"white-space:pre-wrap;word-spacing:0px;text-transform:none;float:none;color:#666666;text-align:left;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><span style=\"white-space:normal;word-spacing:0px;text-transform:none;float:none;color:#666666;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">广东省广弘中旅国际旅行社是省政府三大国有资产经营公司之一，全国500强企业。拥有资产近亿元，净资产5000万元，注册资金3000万元（广州注册资金最雄厚的旅行社）。属下的全资、控股企业有：广东广弘中旅酒店管理公司、珠海华侨宾馆、广东省拱北口岸中国旅行社有限公司（全国双百强旅行社）、清远市 中旅国际旅行社有限公司（出国游组团社）、四会市中国旅行社有限公司。目前在仍保持旅游部门投诉率最低记录，具有极高品牌美誉度。</span></span>','1','鼓楼区五一中路18号正大广场御景台1623','15','ux37202ux24215ux26053ux28216,ux22269ux20869ux28216','酒店旅游,国内游','ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','ux22269ux38469ux26053ux28216,ux22269ux38469ux26053ux28216ux31038','国际旅游,国际旅游社','11','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','1','1','旅游 国际 省内','ux26053ux28216,ux22269ux38469,ux30465ux20869','旅游,国际,省内','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','3','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('32','爱丁堡尊贵养生会所（福祥店)','','晋安区国货东路298号','13899087678','爱丁堡','119.339719','26.071564','33','9:00-23:00','<span style=\"white-space:normal;word-spacing:0px;text-transform:none;float:none;color:#666666;font:12px/18px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">爱丁堡尊贵养生会所是一家全国性连锁企业，地处黄金地段。会所为独幢楼层，有45个豪华包间，共3000平米，拥有300多个停车泊位。会所内部装饰格调以西欧风格为主，集保健、休闲、餐饮为一体，独树一旗，别具一格。</span>','1','晋安区国货东路298号','15','ux20241ux38386ux23089ux20048,ux36275ux30103ux25353ux25705','休闲娱乐,足疗按摩','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','ux29233ux19969ux22561,ux20250ux25152,ux23562ux36149,ux20859ux29983,ux31119ux31077ux24215,ux29233ux19969ux22561ux23562ux36149ux20859ux29983ux20250ux25152ux65288ux31119ux31077ux24215ux41','爱丁堡,会所,尊贵,养生,福祥店,爱丁堡尊贵养生会所（福祥店)','9','./public/attachment/201502/25/16/54ed864826695.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','3','0','0','0','','','','1','','','0','0','0','爱丁堡尊贵养生会所是一家全国性连锁企业，地处黄金地段。会所为独幢楼层，有45个豪华包间，共3000平米，拥有300多个停车泊位。会所内部装饰格调以西欧风格为主，集保健、休闲、餐饮为一体，独树一旗，别具一格。','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('33','龙中龙','','','','','','','32','','','1','','15','','','ux40723ux27004ux21306,ux31119ux24030ux24191ux22330','鼓楼区,福州广场','ux20013ux40857,ux40857ux20013ux40857','中龙,龙中龙','0','','0','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('34','美丽人生摄影工作室','','鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）','0591-88699440','张美丽','119.300928','26.091942','35','10:00-22:00','','1','鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）','15','ux29983ux27963ux26381ux21153,ux23130ux32433ux25668ux24433,ux20010ux24615ux20889ux30495','生活服务,婚纱摄影,个性写真','ux26472ux26725,ux40723ux27004ux21306,ux19996ux34903ux21475,ux20132ux27719ux22788,ux20803ux24069,ux24448ux22238,ux20844ux36710,ux36335ux21475,ux32593ux21543,ux19996ux26041,ux40723ux27004ux21306ux19996ux34903ux21475ux26472ux26725ux36335ux19982ux20803ux24069ux36335ux36335ux21475ux20132ux27719ux22788ux50ux27004ux65288ux20844ux36710ux20392ux38596ux31449ux19979ux24448ux22238ux36208ux19996ux26041ux32593ux21543ux19978ux50ux27004ux65289,ux21488ux27743ux21306,ux20013ux20141ux34903,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','杨桥,鼓楼区,东街口,交汇处,元帅,往回,公车,路口,网吧,东方,鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）,台江区,中亭街,晋安区,王庄新村','ux32654ux20029ux20154ux29983,ux24037ux20316ux23460,ux25668ux24433,ux32654ux20029ux20154ux29983ux25668ux24433ux24037ux20316ux23460','美丽人生,工作室,摄影,美丽人生摄影工作室','10','./public/attachment/201502/25/17/54ed9486611f6.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','2','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('35','明视眼镜（台江万达店）','','台江区鳌江路8号金融街万达广场一层B区37号','0591-89800987','小明','119.350423','26.058986','36','10:00-23:00','','1','台江区鳌江路8号金融街万达广场一层B区37号','15','ux29983ux27963ux26381ux21153,ux22521ux35757ux35838ux31243','生活服务,培训课程','ux27743ux36335,ux21488ux27743ux21306,ux19975ux36798,ux37329ux34701ux34903,ux24191ux22330,ux21488ux27743ux21306ux40140ux27743ux36335ux56ux21495ux37329ux34701ux34903ux19975ux36798ux24191ux22330ux19968ux23618ux66ux21306ux51ux55ux21495,ux23453ux40857ux22478ux24066ux24191ux22330','江路,台江区,万达,金融街,广场,台江区鳌江路8号金融街万达广场一层B区37号,宝龙城市广场','ux21488ux27743,ux19975ux36798,ux26126ux35270,ux30524ux38236,ux26126ux35270ux30524ux38236ux65288ux21488ux27743ux19975ux36798ux24215ux65289','台江,万达,明视,眼镜,明视眼镜（台江万达店）','10','./public/attachment/201502/25/17/54ed9b8e44904.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_area_link`;
CREATE TABLE `%DB_PREFIX%supplier_location_area_link` (
  `location_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家门店的商圈关联表';
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('21','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('21','27');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('21','28');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('22','16');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('23','14');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('24','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('24','27');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('25','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('26','10');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('26','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('26','33');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('27','35');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('27','39');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('28','8');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('28','13');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('28','14');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('29','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('30','13');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('31','22');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('31','43');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('32','23');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('32','43');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('33','15');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('34','21');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('34','43');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('35','26');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_biz_submit`;
CREATE TABLE `%DB_PREFIX%supplier_location_biz_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '门店名称',
  `route` text NOT NULL COMMENT '公交线路',
  `address` text NOT NULL COMMENT '门店地址',
  `tel` varchar(255) NOT NULL COMMENT '门店电话',
  `contact` varchar(255) NOT NULL COMMENT '联系人',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `supplier_id` int(11) NOT NULL COMMENT '所属商家ID',
  `open_time` varchar(255) NOT NULL COMMENT '营业时间',
  `brief` text NOT NULL COMMENT '商家简介',
  `is_main` tinyint(1) NOT NULL COMMENT '是否为默认门店(总店)',
  `api_address` text NOT NULL COMMENT '用于地图定位的地址',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `deal_cate_match` text NOT NULL COMMENT '生活服务分类全文索引',
  `deal_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地址全文索引',
  `locate_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '门店名称全文索引',
  `name_match_row` text NOT NULL,
  `deal_cate_id` int(11) NOT NULL COMMENT '所属生活服务大分类ID',
  `preview` varchar(255) NOT NULL COMMENT '列表图',
  `is_recommend` tinyint(1) NOT NULL COMMENT '标识为推荐门店',
  `is_verify` tinyint(1) NOT NULL COMMENT '认证门店',
  `tags` varchar(255) NOT NULL COMMENT '标签列表 多个标签以空格分隔',
  `tags_match` text NOT NULL COMMENT '标签的全文索引',
  `tags_match_row` text NOT NULL,
  `avg_point` float(14,4) NOT NULL COMMENT '总评平均分，后台可操作更改',
  `good_dp_count` int(11) NOT NULL COMMENT '好评数',
  `bad_dp_count` int(11) NOT NULL COMMENT '差评数',
  `common_dp_count` int(11) NOT NULL COMMENT '中评数',
  `total_point` int(11) NOT NULL COMMENT '点评总分',
  `dp_count` int(11) NOT NULL COMMENT '点评总数',
  `image_count` int(11) NOT NULL COMMENT '门店图片数',
  `ref_avg_price` float(14,4) NOT NULL COMMENT '真实的总评分的平均分',
  `good_rate` float(14,4) NOT NULL COMMENT '好评率',
  `common_rate` float(14,4) NOT NULL COMMENT '中评率',
  `sms_content` varchar(255) NOT NULL DEFAULT '' COMMENT '用户短信下载的商家信息',
  `index_img` varchar(255) NOT NULL DEFAULT '' COMMENT '首页用图',
  `tuan_count` int(11) NOT NULL COMMENT '团购数',
  `event_count` int(11) NOT NULL COMMENT '活动数',
  `youhui_count` int(11) NOT NULL COMMENT '优惠券数',
  `daijin_count` int(11) NOT NULL COMMENT '代金券数',
  `seo_title` text NOT NULL COMMENT '自定义门店页的seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义门店页的seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义门店页的seo描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `biz_license` varchar(255) NOT NULL COMMENT '商家营业执照',
  `biz_other_license` varchar(255) NOT NULL COMMENT '商家的其他资质',
  `new_dp_count` int(11) NOT NULL COMMENT '最新点评数量',
  `new_dp_count_time` int(11) NOT NULL COMMENT '最新点评的更新时间',
  `shop_count` int(11) NOT NULL COMMENT '商品数量',
  `mobile_brief` text NOT NULL COMMENT '手机端列表简介',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `dp_group_point` text NOT NULL COMMENT '门店的分组点评数据的平均分',
  `tuan_youhui_cache` text NOT NULL COMMENT '商家列表页团购与优惠券第一条的展示',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `account_id` int(11) NOT NULL COMMENT '提交数据的商户帐号关联ID',
  `location_id` int(11) NOT NULL COMMENT '关联活动主表的数据ID',
  `cache_supplier_location_area_link` text NOT NULL COMMENT '序列化地区列表配置',
  `cache_deal_cate_type_location_link` text NOT NULL COMMENT '序列化子分类列表配置',
  `cache_supplier_tag` text NOT NULL COMMENT '序列化子商户标签设置配置',
  `cache_supplier_location_images` text NOT NULL COMMENT '门店图库序列化缓存',
  `biz_apply_status` tinyint(1) NOT NULL COMMENT '商户申请状态 1.新品上架申请 2:修改 3:下架',
  `admin_check_status` tinyint(1) NOT NULL COMMENT '管理员审核状态 0 待审核 1 通过 2 拒绝',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `is_verify` (`is_verify`),
  KEY `is_effect` (`is_effect`),
  KEY `is_recommend` (`is_recommend`),
  KEY `avg_point` (`avg_point`),
  KEY `good_dp_count` (`good_dp_count`),
  KEY `bad_dp_count` (`bad_dp_count`),
  KEY `common_dp_count` (`common_dp_count`),
  KEY `total_point` (`total_point`),
  KEY `dp_count` (`dp_count`),
  KEY `good_rate` (`good_rate`),
  KEY `common_rate` (`common_rate`),
  KEY `tuan_count` (`tuan_count`),
  KEY `event_count` (`event_count`),
  KEY `youhui_count` (`youhui_count`),
  KEY `daijin_count` (`daijin_count`),
  KEY `new_dp_count` (`new_dp_count`),
  KEY `is_main` (`is_main`),
  KEY `supplier_id` (`supplier_id`),
  KEY `search_idx1` (`city_id`,`is_recommend`,`is_effect`,`is_verify`),
  KEY `search_idx2` (`city_id`,`avg_point`,`is_effect`),
  KEY `search_idx3` (`supplier_id`,`is_main`),
  KEY `search_idx4` (`city_id`,`deal_cate_id`,`is_verify`,`is_effect`,`is_recommend`),
  KEY `search_idx5` (`city_id`,`deal_cate_id`,`dp_count`,`avg_point`,`ref_avg_price`,`is_effect`,`is_recommend`,`is_verify`),
  KEY `search_idx6` (`good_rate`,`is_verify`,`is_effect`),
  KEY `sort_default` (`is_recommend`,`is_verify`,`dp_count`),
  KEY `ref_avg_price` (`ref_avg_price`),
  KEY `shop_count` (`shop_count`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `all_match` (`deal_cate_match`,`locate_match`,`name_match`,`tags_match`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='商户平台提交商家门店临时表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_brand_link`;
CREATE TABLE `%DB_PREFIX%supplier_location_brand_link` (
  `brand_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家门店的品牌关联表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '点评时间',
  `point` int(11) NOT NULL COMMENT '评分',
  `user_id` int(11) NOT NULL COMMENT '点评会员ID',
  `is_img` tinyint(1) NOT NULL COMMENT '弃用',
  `is_content` tinyint(1) NOT NULL COMMENT '是否有内容',
  `is_best` tinyint(1) NOT NULL COMMENT '推荐点评',
  `is_top` tinyint(1) NOT NULL COMMENT '弃用',
  `status` tinyint(1) NOT NULL COMMENT '状态 0:无效 1:有效',
  `good_count` int(11) NOT NULL COMMENT '有用数',
  `bad_count` int(11) NOT NULL COMMENT '没用数',
  `reply_count` int(11) NOT NULL COMMENT '回复数',
  `supplier_location_id` int(11) NOT NULL COMMENT '点评的门店ID',
  `avg_price` float(14,4) NOT NULL COMMENT '平均价',
  `kb_user_id` varchar(50) NOT NULL COMMENT '弃用',
  `kb_create_time` varchar(20) DEFAULT '' COMMENT '弃用',
  `kb_tags` varchar(255) DEFAULT '' COMMENT '弃用',
  `is_index` tinyint(1) NOT NULL COMMENT '是否置顶',
  `is_buy` tinyint(1) NOT NULL COMMENT '弃用',
  `from_data` varchar(255) NOT NULL COMMENT '弃用',
  `rel_app_index` varchar(255) NOT NULL COMMENT '弃用',
  `rel_route` varchar(255) NOT NULL COMMENT '弃用',
  `rel_param` varchar(255) NOT NULL COMMENT '弃用',
  `message_id` int(11) NOT NULL COMMENT '弃用',
  `deal_id` int(11) NOT NULL COMMENT '关联到的商品ID，对商品的点评',
  `youhui_id` int(11) NOT NULL COMMENT '关联的优惠券ID',
  `reply_content` text NOT NULL COMMENT '管理员或商家回复',
  `reply_supplier_account_id` int(11) NOT NULL COMMENT '商家回复的帐号',
  `reply_time` int(11) NOT NULL COMMENT '回复时间',
  `images_cache` text NOT NULL COMMENT '点评图片的冗余',
  `supplier_id` int(11) NOT NULL COMMENT '点评所针对的商家ID',
  `event_id` int(11) NOT NULL COMMENT '活动ID',
  `dp_type` tinyint(1) NOT NULL COMMENT '已弃用',
  `tags_match` text NOT NULL,
  `tags_match_row` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `is_img` (`is_img`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `good_count` (`good_count`) USING BTREE,
  KEY `bad_count` (`bad_count`) USING BTREE,
  KEY `reply_count` (`reply_count`) USING BTREE,
  KEY `avg_price` (`avg_price`) USING BTREE,
  KEY `deal_id` (`deal_id`),
  KEY `youhui_id` (`youhui_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `dp_type` (`dp_type`),
  KEY `is_content` (`is_content`),
  FULLTEXT KEY `tags_match` (`tags_match`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商家门店点评数据表';
INSERT INTO `%DB_PREFIX%supplier_location_dp` VALUES ('4','','上菜太慢，其他的都很好。','1424891284','5','71','1','1','0','0','1','0','0','0','21','113.0000','','','','0','0','','','','','0','57','0','','0','0','a:3:{i:0;s:68:\"./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg\";i:1;s:68:\"./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg\";i:2;s:68:\"./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg\";}','23','0','0','ux21619ux36947ux24456ux22909,ux24615ux20215ux27604ux39640,ux19978ux33756ux24930','味道很好,性价比高,上菜慢');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_images`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL COMMENT '图片地址',
  `dp_id` int(11) NOT NULL COMMENT '所属的点评ID',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dp_id` (`dp_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='点评图库';
INSERT INTO `%DB_PREFIX%supplier_location_dp_images` VALUES ('1','./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg','4','23','1424891284','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_images` VALUES ('2','./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg','4','23','1424891284','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_images` VALUES ('3','./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg','4','23','1424891284','21');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_point_result`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_point_result` (
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `point` int(11) NOT NULL COMMENT '分数',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每个门店，每条点评针对每个评分分组的点评评分';
INSERT INTO `%DB_PREFIX%supplier_location_dp_point_result` VALUES ('3','5','21','4');
INSERT INTO `%DB_PREFIX%supplier_location_dp_point_result` VALUES ('4','4','21','4');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_reply`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  `content` text NOT NULL COMMENT '回应内容',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '回应时间',
  `parent_id` int(11) NOT NULL COMMENT '弃用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评数据的回应表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `supplier_location_id` (`supplier_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家门店按预定义的分组打标签的结果表';
INSERT INTO `%DB_PREFIX%supplier_location_dp_tag_result` VALUES ('味道很好','4','6','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_tag_result` VALUES ('性价比高','4','6','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_tag_result` VALUES ('上菜慢','4','6','21');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_images`;
CREATE TABLE `%DB_PREFIX%supplier_location_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL COMMENT '图片',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID(关联的商家会员ID)',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `dp_id` int(11) NOT NULL COMMENT '弃用',
  `good_count` int(11) NOT NULL COMMENT '弃用',
  `bad_count` int(11) NOT NULL COMMENT '弃用',
  `brief` varchar(255) NOT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态 0:未审核  1:已审核 ',
  `click_count` int(11) NOT NULL COMMENT '浏览数',
  `images_group_id` int(11) NOT NULL COMMENT '图片的分组ID',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='门店图集表';
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('1','./public/attachment/201502/25/14/54ed6a9a856ba.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('2','./public/attachment/201502/25/14/54ed6a9aa2fe0.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('3','./public/attachment/201502/25/14/54ed6a9ab8e58.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('4','./public/attachment/201502/25/14/54ed6a9acf0d1.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('5','./public/attachment/201502/25/14/54ed6a9ae65a6.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_point_result`;
CREATE TABLE `%DB_PREFIX%supplier_location_point_result` (
  `group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `avg_point` float(14,4) NOT NULL COMMENT '平均分',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `total_point` int(11) NOT NULL COMMENT '总分',
  PRIMARY KEY (`group_id`,`supplier_location_id`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `dp_id` (`total_point`) USING BTREE,
  KEY `avg_point` (`avg_point`) USING BTREE,
  KEY `total_point` (`total_point`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店的分组评分的评分结果';
INSERT INTO `%DB_PREFIX%supplier_location_point_result` VALUES ('3','5.0000','21','5');
INSERT INTO `%DB_PREFIX%supplier_location_point_result` VALUES ('4','4.0000','21','4');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_sign_log`;
CREATE TABLE `%DB_PREFIX%supplier_location_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `location_id` int(11) NOT NULL COMMENT '门店ID',
  `sign_time` int(11) NOT NULL COMMENT '签到时间',
  `point` int(11) NOT NULL COMMENT '签到打分',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `sign_time` (`sign_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店签到数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_money_log`;
CREATE TABLE `%DB_PREFIX%supplier_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '资金变更记录',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` int(11) NOT NULL COMMENT '变更时间',
  `money` decimal(20,4) NOT NULL COMMENT '资金变更数额',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:销售额增加 1:资金冻结 2.待结算增加 3.已结算增加 4.退款增加 5.提现增加',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商家财务明细表';
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('1','ID:57 88元桥亭活鱼小镇代金券 订单：2015022610000323','23','1424887216','62.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('2','ID:57 88元桥亭活鱼小镇代金券 订单：2015022610000323','23','1424887216','62.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('3','ID:64 龙中龙男士棉服 订单：2015022610592583','32','1424890765','50.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('4','ID:64 龙中龙男士棉服 订单：2015022610592583','32','1424890765','50.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('5','ID:76 超人新款静音理发器 订单：2015022610592583','33','1424890765','20.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('6','ID:76 超人新款静音理发器 订单：2015022610592583','33','1424890765','20.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('7','订单号2015022610000323 61323563消费券验证成功','23','1424890988','-62.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('8','订单号2015022610000323 61323563消费券验证成功','23','1424890988','62.0000','3');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('9','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款','32','1424891134','-50.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('10','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款','32','1424891134','50.0000','4');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_money_submit`;
CREATE TABLE `%DB_PREFIX%supplier_money_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,4) NOT NULL COMMENT '提现金额',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` int(11) NOT NULL COMMENT '提现申请时间',
  `status` tinyint(1) NOT NULL COMMENT '状态 0:待审核 1:已确认提现 2:拒绝',
  `reason` text NOT NULL COMMENT '拒绝的理由',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家提现表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_statements`;
CREATE TABLE `%DB_PREFIX%supplier_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `money` decimal(20,4) NOT NULL COMMENT '本日消费（提现不减）',
  `sale_money` decimal(20,4) NOT NULL COMMENT '本日销售额',
  `refund_money` decimal(20,4) NOT NULL COMMENT '本日退款',
  `wd_money` decimal(20,4) NOT NULL COMMENT '本日提现',
  `stat_time` date NOT NULL COMMENT '报表日期',
  `stat_month` varchar(10) NOT NULL COMMENT '月份',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `stat_time` (`stat_time`),
  KEY `stat_month` (`stat_month`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商家日报表';
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('4','23','62.0000','62.0000','0.0000','0.0000','2015-02-26','2015-02');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('5','32','0.0000','50.0000','50.0000','0.0000','2015-02-26','2015-02');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('6','33','0.0000','20.0000','0.0000','0.0000','2015-02-26','2015-02');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_submit`;
CREATE TABLE `%DB_PREFIX%supplier_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商家名称',
  `cate_config` text NOT NULL COMMENT '所属分类配置',
  `location_config` text NOT NULL COMMENT '所属地区商券配置',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `tel` varchar(255) NOT NULL COMMENT '电话',
  `open_time` varchar(255) NOT NULL COMMENT '营业时间',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `location_id` int(11) NOT NULL COMMENT '认领的门店ID',
  `is_publish` tinyint(1) NOT NULL COMMENT '0:未审核 1:已审核',
  `user_id` int(1) NOT NULL COMMENT '入驻申请的会员ID',
  `create_time` int(11) NOT NULL COMMENT '申请时间',
  `h_name` varchar(255) NOT NULL COMMENT '企业名称',
  `h_faren` varchar(255) NOT NULL COMMENT '法人',
  `h_license` varchar(255) NOT NULL COMMENT '营业执照',
  `h_other_license` varchar(255) NOT NULL COMMENT '其他资质上传',
  `h_user_name` varchar(255) NOT NULL COMMENT '店铺管理员姓名',
  `h_tel` varchar(255) NOT NULL COMMENT '存档的联系人电话',
  `h_supplier_logo` varchar(255) NOT NULL COMMENT '商户商标图',
  `h_supplier_image` varchar(255) NOT NULL COMMENT '门店图片',
  `city_id` int(11) NOT NULL COMMENT '所在城市',
  `h_bank_info` text NOT NULL COMMENT '提现银行帐号',
  `h_bank_user` varchar(255) NOT NULL COMMENT '提现银行户名',
  `h_bank_name` varchar(255) NOT NULL COMMENT '提现银行名称',
  `account_name` varchar(255) NOT NULL COMMENT '商户登录账户',
  `account_password` varchar(255) NOT NULL COMMENT '登录密码',
  `account_mobile` varchar(255) DEFAULT NULL COMMENT '账户绑定手机号，用于验证，提现等功能',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家入驻申请表';
INSERT INTO `%DB_PREFIX%supplier_submit` VALUES ('1','百度烤肉','a:2:{s:12:\"deal_cate_id\";i:8;s:17:\"deal_cate_type_id\";a:1:{i:0;i:30;}}','a:3:{i:0;i:10;i:1;i:33;i:2;i:26;}','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','059188855588','9:00-22:00','119.296641','26.070661','0','1','0','1424818382','百度烧烤','王一','./public/attachment/201502/25/14/13abf2842afa3e34a15c71b58a02d10858.jpg','./public/attachment/201502/25/14/aefbd6725f2bed28e9cc252d7bcd02fc52.jpg','','0591-88558855','./public/attachment/201502/25/14/e7742d7b2aa5e3477382608672802f2614.jpg','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','15','5566998785158446562','王一','中国工商银行福州市分行','fanwebaidu','27cb989dfaec51641a0f3b0064808419','13955599999');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_tag`;
CREATE TABLE `%DB_PREFIX%supplier_tag` (
  `tag_name` varchar(255) NOT NULL COMMENT '标签',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `group_id` int(11) NOT NULL COMMENT '关联商户子类标签分组的ID(可为前台会员点评的分组标签，也可为后台管理员编辑的分组标签), 为0时为主显标签',
  `total_count` int(11) NOT NULL COMMENT '同商户，同类分组提交的次数。 用于表示该标签的热门度',
  KEY `merchant_id` (`supplier_location_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店分组标签的点评数据统计表';
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('味道很好','23','6','1');
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('味道很好','21','6','1');
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('性价比高','21','6','1');
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('上菜慢','21','6','1');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_tag_group_preset`;
CREATE TABLE `%DB_PREFIX%supplier_tag_group_preset` (
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `preset` text NOT NULL COMMENT '预选标签 空格分开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店分组点评标签的预选标签配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group`;
CREATE TABLE `%DB_PREFIX%tag_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `preset` text NOT NULL COMMENT '公用的预设标签，如门店没有单独配置预选标签，以此为准',
  `sort` int(11) NOT NULL COMMENT '排序 小到大',
  `memo` varchar(255) NOT NULL COMMENT '弃用',
  `tags` text NOT NULL COMMENT '弃用',
  `allow_dp` tinyint(1) NOT NULL COMMENT '该分组标签是否可用于用户自主填写（0:否 1:是）',
  `allow_search` tinyint(1) NOT NULL COMMENT '该分组内的标签是否用于商家搜索使用',
  `allow_vote` tinyint(1) NOT NULL COMMENT '是否允许对标签进行直接投票点评(0:否 1:是)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='供门店点评的标签分组配置';
INSERT INTO `%DB_PREFIX%tag_group` VALUES ('6','口碑','味道很好 环境不错 性价比高 服务很周到 上菜快','100','餐饮口碑','','0','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group_elink`;
CREATE TABLE `%DB_PREFIX%tag_group_elink` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分组与活动大分类关联表';
INSERT INTO `%DB_PREFIX%tag_group_elink` VALUES ('6','3');
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group_link`;
CREATE TABLE `%DB_PREFIX%tag_group_link` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分组与生活服务大分类关联表';
INSERT INTO `%DB_PREFIX%tag_group_link` VALUES ('6','8');
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group_slink`;
CREATE TABLE `%DB_PREFIX%tag_group_slink` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分组与商城大分类关联表';
DROP TABLE IF EXISTS `%DB_PREFIX%tag_user_vote`;
CREATE TABLE `%DB_PREFIX%tag_user_vote` (
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `tag_name` varchar(255) NOT NULL COMMENT '投票的标签',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `location_id` int(11) NOT NULL COMMENT '所属门店ID',
  PRIMARY KEY (`user_id`,`tag_name`,`group_id`,`location_id`),
  KEY `user_id` (`user_id`),
  KEY `tag_name` (`tag_name`),
  KEY `location_id` (`location_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用于投票的标签的投票结果';
DROP TABLE IF EXISTS `%DB_PREFIX%topic`;
CREATE TABLE `%DB_PREFIX%topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `forum_title` varchar(255) NOT NULL COMMENT '来源于小组的分享的贴子标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '发表时间',
  `type` varchar(255) NOT NULL COMMENT 'share 分享\r\ndealcomment 商品点评	\r\nyouhuicomment 优惠券购物点评\r\neventcomment 活动点评\r\nslocationcomment  门店点评\r\neventsubmit  活动报名	\r\nsharedeal  分享商品\r\nshareyouhui 分享优惠券	\r\nshareevent分享活劝',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `user_name` varchar(255) NOT NULL COMMENT '会员名',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `relay_id` int(11) NOT NULL COMMENT '0:原创 1:转发来源的贴子ID',
  `origin_id` int(11) NOT NULL COMMENT '原创贴子ID',
  `reply_count` int(11) NOT NULL COMMENT '回复数',
  `relay_count` int(11) NOT NULL COMMENT '转发数',
  `good_count` int(11) NOT NULL COMMENT '弃用',
  `bad_count` int(11) NOT NULL COMMENT '弃用',
  `click_count` int(11) NOT NULL COMMENT '查看数量',
  `rel_app_index` varchar(255) NOT NULL COMMENT '相关链接的app名',
  `rel_route` varchar(255) NOT NULL COMMENT '相关链接的url的route名',
  `rel_param` varchar(255) NOT NULL COMMENT '相关链接的url参数',
  `message_id` int(11) NOT NULL COMMENT '弃用',
  `topic_group` varchar(255) NOT NULL DEFAULT 'share' COMMENT '一键分享的插件名称（默认为share）',
  `fav_id` int(11) NOT NULL COMMENT '喜欢XX分享的分享ID',
  `fav_count` int(11) NOT NULL COMMENT '被喜欢的数量',
  `user_name_match` text NOT NULL COMMENT '用于全文索引的用户名(名括@会员的相关名称)',
  `user_name_match_row` text NOT NULL,
  `keyword_match` text NOT NULL COMMENT '分词后与标签的相关关键词全文索引',
  `keyword_match_row` text NOT NULL,
  `xpoint` varchar(255) NOT NULL COMMENT '手机发表的经度',
  `ypoint` varchar(255) NOT NULL COMMENT '手机发表的纬度',
  `tags` text NOT NULL COMMENT '标签，空格分开',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到达人秀页面',
  `has_image` tinyint(1) NOT NULL COMMENT '是否含图',
  `source_type` tinyint(1) NOT NULL COMMENT '0:本站 1:外站',
  `source_name` varchar(255) NOT NULL COMMENT '发表的来源（如网站/手机端）',
  `source_url` varchar(255) NOT NULL,
  `group_data` text NOT NULL COMMENT 'group插件采集同步的序列化数据',
  `daren_page` varchar(255) NOT NULL COMMENT '达人秀页面的专用图',
  `group_id` int(11) NOT NULL COMMENT '小组ID',
  `is_top` tinyint(1) NOT NULL COMMENT '置顶',
  `is_best` tinyint(1) NOT NULL COMMENT '精华',
  `op_memo` text NOT NULL COMMENT '前台操作员操作日志',
  `last_time` int(11) NOT NULL COMMENT '最后操作时间',
  `last_user_id` int(11) NOT NULL COMMENT '最后操作人ID',
  `cate_match` text NOT NULL COMMENT '所属的主题分类的全文索引(分类可由后台分配，也可由分类预设标签自动匹配)',
  `cate_match_row` text NOT NULL,
  `origin_topic_data` text NOT NULL COMMENT '原贴数据缓存',
  `images_count` int(11) NOT NULL COMMENT '图片数',
  `image_list` text NOT NULL COMMENT '图片列表缓存',
  `is_cached` tinyint(1) NOT NULL COMMENT '标识相关的数据是否已缓存（包括原贴数据，图片集，小组数据等）',
  `topic_group_data` text NOT NULL COMMENT '小组数据缓存',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `user_id` (`user_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `group_id` (`group_id`),
  KEY `is_top` (`is_top`),
  KEY `is_best` (`is_best`),
  KEY `has_image` (`has_image`),
  KEY `fav_id` (`fav_id`),
  KEY `relay_id` (`relay_id`),
  KEY `origin_id` (`origin_id`),
  KEY `type` (`type`),
  KEY `is_effect` (`is_effect`),
  KEY `is_delete` (`is_delete`),
  KEY `click_count` (`click_count`),
  KEY `last_time` (`last_time`),
  KEY `ordery_sort` (`create_time`,`is_top`),
  KEY `last_time_sort` (`last_time`,`is_top`),
  KEY `multi_key` (`is_effect`,`is_delete`,`last_time`,`is_recommend`,`group_id`,`is_top`,`is_best`,`create_time`),
  FULLTEXT KEY `user_name_match` (`user_name_match`),
  FULLTEXT KEY `keyword_match` (`keyword_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`keyword_match`,`cate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COMMENT='会员分享数据表';
INSERT INTO `%DB_PREFIX%topic` VALUES ('203','','','团购推荐：泰宁大金湖[【福州】泰宁大金湖]','1424825541','sharedeal','71','fanwe','1','0','0','203','0','1','0','0','0','index','deal#65','','0','Fanwe','0','0','','','ux27888ux23425,ux29577ux21326,ux37329ux28246,ux23578ux20070ux31532,ux20108ux26085,ux31119ux24314,ux22823ux23777ux35895,ux20165ux21806,ux26149ux31179,ux26053ux34892ux31038,ux31119ux24030,ux22242ux36141,ux25512ux33616','泰宁,玉华,金湖,尚书第,二日,福建,大峡谷,仅售,春秋,旅行社,福州,团购,推荐','','','泰宁 玉华 金湖 尚书第 二日 福建 大峡谷 仅售 春秋 旅行社','0','1','0','网站','','YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo1OiJpbmRleCI7czo1OiJyb3V0ZSI7czo3OiJkZWFsIzY1IjtzOjU6InBhcmFtIjtzOjA6IiI7fXM6NDoiZGF0YSI7YToxMTI6e3M6MjoiaWQiO3M6MjoiNjUiO3M6NDoibmFtZSI7czoxNjg6IuS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czo4OiJzdWJfbmFtZSI7czoxNToi5rOw5a6B5aSn6YeR5rmWIjtzOjc6ImNhdGVfaWQiO3M6MjoiMTEiO3M6MTE6InN1cHBsaWVyX2lkIjtzOjI6IjMxIjtzOjM6ImltZyI7czo1MDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDg0MDg3NTA3Yy5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjYzNDg6IjxwIGFsaWduPSJjZW50ZXIiPjxpbWcgYm9yZGVyPSIwIiBhbHQ9IiIgc3JjPSIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODQwODc1MDdjLmpwZyIgLz48L3A+DQo8dWwgaWQ9Inl1aV8zXzE2XzBfMV8xNDI0ODUxOTA5OTgzXzEzNjUiIGNsYXNzPSJsaXN0IiBzdHlsZT0id2hpdGUtc3BhY2U6bm9ybWFsO3dvcmQtc3BhY2luZzowcHg7dGV4dC10cmFuc2Zvcm06bm9uZTtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7Zm9udDoxNHB4LzIxcHggJ2hpcmFnaW5vIHNhbnMgZ2InLCAnd2VucXVhbnlpIG1pY3JvIGhlaScsIHRhaG9tYSwgc2Fucy1zZXJpZjtwYWRkaW5nLWxlZnQ6MThweDttYXJnaW46MTBweCAwcHggMTVweDtsZXR0ZXItc3BhY2luZzpub3JtYWw7cGFkZGluZy1yaWdodDowcHg7YmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO3RleHQtaW5kZW50OjBweDstd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOjBweDsiPjxsaSBpZD0ieXVpXzNfMTZfMF8xXzE0MjQ4NTE5MDk5ODNfMTM2NCIgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5Y+R5Zui5pe26Ze077ya6K+m6K+i5ZWG5a6277yb6aKE57qm5Ye65Zui5Lq65pWw77ya5LiN6ZmQPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7lt7LljIXlkKvlr7zmuLjotLnvvJvljIXlkKvml6nppJAx5qyhK+WNiOmkkDHmrKEr5pma6aSQMeasoTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5YyF5ZCr5YWl5L2P6YWS5bqXMeaZmu+8m+aWueahiOW3suWMheWQq+W+gOi/lOi9pui0uTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpub25lO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+6KGM56iL5a6J5o6S77yaPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7pm4blkIjml7bpl7TvvJowN++8mjAw77yb6ZuG5ZCI5Zyw54K577ya56aP5bee54Gr6L2m56uZPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48Yj7lpKfph5HmuZbvvIjnrKzkuIDlpKnvvIk8L2I+PGJyIC8+DQrkuqTpgJrmlrnlvI/vvJrliqjovabvvJvmuLjnjqnml7bplb/vvJox5aSpPGJyIC8+DQrku4vnu43vvJrlj4LogIPovabmrKHvvJrnpo/lt57nq5lEMjI0Mu+8iDA377yaMDAvMDjvvJo0M++8iSBENjUwMu+8iDA477yaMzAvMTDvvJoyMO+8iSBEMjIyNu+8iDA477yaNDIvMTDvvJozOe+8iSDml6nliqjovabnq5npm4bkuK3lkI7vvIzlrqLkurroh6rooYzliY3lvoDms7DlroHliqjovabnq5nvvIzlr7zmuLjms7DlroHnq5nmjqXlm6LpgIHjgJDms7DlroHlj6Tln47jgJHvvIzlj4Lop4LnirblhYPmlofljJbkuLvpopjpk5zpm5XnvqTvvIzpoobnlaXms7DlroHlj6Tln47nmoTljoblj7Llj5jov4HvvIzmhJ/lj5figJzmsYnllJDlj6TplYfjgIHkuKTlrovlkI3ln47igJ3kuYvpo47pn7XjgILop6bmkbgyMjAw5bm055qE6aOO6Zuo5rKn5qGR77yM6L+Y5Y+v5Lul5Zyo57qi5Yab6KGX5LiK6L+95b+G5bel5Yac57qi5Yab5LiJ6L+b5LiJ5Ye655qE54O954Gr5bKB5pyI77yM5Y+v5Lul5Y+C6KeC5piO5pyd5YW16YOo5bCa5Lmm5p2O5pil54Oo55qE5rex5a6F5aSn6Zmi5Lit5ZOB5ZGz4oCc5rGf5Y2X56ys5LiA5rCR5bGF4oCc44CQ5bCa5Lmm56ys44CR44CC5LiL5Y2I6YCC5pe26LW05Zu95a62NUHnuqfmma/ljLrjgIHkuJbnlYzoh6rnhLbpgZfkuqfnmoTmoLjlv4Plk4HniYzigJTigJTjgJDlpKfph5HmuZbmma/ljLrjgJHvvIjooYznqIvnuqYyMOWIhumSn++8jOa4uOiniOe6pjTlsI/ml7bvvInvvIznmbvlsrjmuLjop4jigJzph47otqPlm63msLTpmYXngJHluIPigJ3jgIHkuIDmn7Hmj5LlnLDkuI3lgYfniYfnk6bnmoTljZfmlrnmgqznqbrlr7rigJznlJjpnLLlr7rigJ3jgIHpmYblnLDkuIDnur/lpKnvvJvoiLnmuLjph5HmuZbop4LlpKfotaTlo4HjgIHigJzku5nigJ3igJzlr7/igJ3lkYjnpaXlpKnkuabnnJ/ov7njgILmuLjop4jnu5PmnZ/lkI7lr7zmuLjlsIbmuLjlrqLpgIHov5TphZLlupfjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjxiPuWvqOS4i+Wkp+WzoeiwtyAr546J5Y2O5rSe77yI56ys5LqM5aSp77yJPC9iPjxiciAvPg0K5Lqk6YCa5pa55byP77ya5Yqo6L2m77yb5ri4546p5pe26ZW/77yaMeWkqTxiciAvPg0K5LuL57uN77ya5Y+C6ICD6L2m5qyh77ya5bCG5LmQ56uZRDY1MDnvvIgxNu+8mjQ0LzE477yaMjfvvIlEMjIyNe+8iDIw77yaNDMvMjLvvJoyOe+8iSDml6nppJDlkI7muLjop4jkuJbnlYzlnLDotKjlhazlm63nmoTmoLfmnb/mma/ljLotLeOAkOWvqOS4i+Wkp+WzoeiwtzYy44CRKOa4uOiniOaXtumXtDIuNeWwj+aXtuW3puWPs++8ie+8iOaCrOWkqeWzoeOAgemAmuWkqeWzoeOAgeWAmuWkqeWzoeOAgeWkqeepueWyqeOAgemXruWkqeWyqeOAgeWxseW0qeWcsOijguOAgeWgsOWhnua5lu+8iei/meaYr+S4h+iwt+W9kuS4gOeahOWcsOaWue+8jOWPr+S7peavq+S4jeWkuOW8oOWcsOivtO+8muWvqOS4i+W9kuadpeS4jeeci+iwt+OAguiBlOWQiOWbveaVmeenkeaWh+e7hOe7h+S4k+WutuivhOS7t+WFtuS4uuS4lueVjOWcsOi0qOWFrOWbreeahOagt+adv+aZr+WMuuOAguS4remkkOWQjuWbveWutumHjeeCuemjjuaZr+WQjeiDnOWMuuS4reWbveWbm+Wkp+WQjea0nuS5i+S4gC0t44CQ546J5Y2O5rSeMTA144CRKOa4uOiniOaXtumXtDLlsI/ml7blt6blj7PvvInvvIzoqonnp7DlvaLog5znlLLpl73lsbHvvIzkurrpl7TnkbbmsaDmma/jgILlm6DmtJ7lhoXlsqnnn7PmtIHnmb3lpoLnjonvvIzljY7lhYnlm5vlsITogIzlvpflkI0u5L2T6aqM6aOO5aOw5LiN5q2i55qEMeaJh+mjju+8jOinguS7meS6uueUsO+8jOehleaenOe0r+e0r++8jOaTjuWkqeafse+8jOm4oeWGoOefs++8jOS4h+WutueBr+eBq++8jOS6lOabtOWkqeetieaZr+eCueOAguWQjiDlsIbkuZDov5Tlm57ms7DlroHmiJbogIXkuInmmI7ljJfnq5nov5Tlm57vvIzlkI7nu5PmnZ/mhInlv6vnmoTooYznqIvjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuivt+aPkOWJjeeUteivneWVhuWutjA1OTEtODc4NzE1NjfjgIE4ODk5OTg4MOmihOe6puaIluWPkemihOe6puefreS/oeKAnOWnk+WQjSvmiYvmnLrlj7fkurrmlbAr5ri4546p5pel5pyfK+e+juWboumqjOivgeeggeKAnee7meWuouacjeeUteivnTEzNTU5MTk1NTM3PC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuOAkOacjeWKoeagh+WHhuOAkTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+MeOAgeS9j+Wuv++8muWutuW6remFkuW6l+agh+WHhuWPjOagh+mXtO+8iOWPguiAg+mFkuW6l++8mueIseW/g+WuvummhuOAgeaWsOWMl+a0suWuvummhuOAgeS4i+WdiuS4gOacn++8jOS4i+WdiuS4ieacn++8jOWNl+iwtyDlt7fjgIHph5Hls7Dlt7fvvIk8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjLjgIHpl6jnpajvvJrooYznqIvmiYDliJfmma/ngrnlpKfpl6jnpajlj4roiLnnpajvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjPjgIHkuqTpgJrvvJrnpo/lt57nq5noh7Pms7DlroHjgIHlsIbkuZDnq5nlvoDov5TliqjovabkuoznrYnluqfnpajvvIzmma/ljLrpl7Tlvqrnjq/nlKjovabvvIjlpZfovabvvIzmjInkurrmlbDmjpLovabvvIzkuI3mj5Dkvpvnq5nluqfvvIzpnIDnrYnlvoU0MOWIhumSn+KAlDHlsI/ml7bvvInvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjTjgIHppJDppa7vvJrlhajnqIvlkKvkuIDml6nkuozmraPvvIjmraPppJAyMOWFg+i1t++8jOWFq+iPnOS6jOaxpO+8jOWNgeS6uuS4gOahjO+8jOS6uuaVsOWHj+Wwke+8jOiPnOmHj+ebuOWvueWHj+Wwke+8iTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NeOAgeWvvOa4uO+8muazsOWugeW9k+WcsOaMgeivgeWvvOa4uOacjeWKoe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NuOAgeS/nemZqe+8muWQq+W9k+WcsOaXheihjOekvui0o+S7u+mZqeOAgeivt+e7hOWbouekvuW4ruWuouS6uuS5sOWlveaXhea4uOaEj+WklumZqe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+N+OAgeWEv+erpeaVo+aLvOaKpeS7t++8mjEuNE3ku6XkuIvvvIzlkKvovabkvY3jgIHppJDjgIHlr7zmnI3jgIHkv53pmanvvIzkuI3ljaDluorjgIHkuI3lkKvpl6jnpajjgIHliqjovabnpajotoXpq5joh6rnkIbvvIk8L2xpPg0KPC91bD4NCiI7czoxMDoiYmVnaW5fdGltZSI7czoxOiIwIjtzOjg6ImVuZF90aW1lIjtzOjE6IjAiO3M6MTA6Im1pbl9ib3VnaHQiO3M6MToiMCI7czoxMDoibWF4X2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21pbl9ib3VnaHQiO3M6MToiMCI7czoxNToidXNlcl9tYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTI6Im9yaWdpbl9wcmljZSI7czo4OiI4MzguMDAwMCI7czoxMzoiY3VycmVudF9wcmljZSI7czo4OiI3NTguMDAwMCI7czo3OiJjaXR5X2lkIjtzOjI6IjE1IjtzOjk6ImlzX2NvdXBvbiI7czoxOiIxIjtzOjExOiJpc19kZWxpdmVyeSI7czoxOiIwIjtzOjk6ImlzX2VmZmVjdCI7czoxOiIxIjtzOjk6ImlzX2RlbGV0ZSI7czoxOiIwIjtzOjEwOiJ1c2VyX2NvdW50IjtzOjE6IjAiO3M6OToiYnV5X2NvdW50IjtzOjE6IjAiO3M6MTE6InRpbWVfc3RhdHVzIjtpOjE7czoxMDoiYnV5X3N0YXR1cyI7aToxO3M6OToiZGVhbF90eXBlIjtzOjE6IjAiO3M6MTM6ImFsbG93X3Byb21vdGUiO3M6MToiMCI7czoxMjoicmV0dXJuX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmV0dXJuX3Njb3JlIjtzOjE6IjAiO3M6NToiYnJpZWYiO3M6Mjc6IuOAkOemj+W3nuOAkeazsOWugeWkp+mHkea5liI7czo0OiJzb3J0IjtzOjE6IjciO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiIwIjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTY6ImNvdXBvbl90aW1lX3R5cGUiO3M6MToiMCI7czoxMDoiY291cG9uX2RheSI7czoxOiIwIjtzOjE3OiJjb3Vwb25fYmVnaW5fdGltZSI7czoxOiIwIjtzOjE1OiJjb3Vwb25fZW5kX3RpbWUiO3M6MToiMCI7czo0OiJjb2RlIjtzOjA6IiI7czo2OiJ3ZWlnaHQiO3M6NjoiMC4wMDAwIjtzOjk6IndlaWdodF9pZCI7czoxOiIwIjtzOjExOiJpc19yZWZlcnJhbCI7czoxOiIwIjtzOjg6ImJ1eV90eXBlIjtzOjE6IjAiO3M6ODoiZGlzY291bnQiO2Q6OTtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4NDA4NzUwN2MuanBnIjtzOjY6Im5vdGljZSI7czoxOiIwIjtzOjEzOiJmcmVlX2RlbGl2ZXJ5IjtzOjE6IjAiO3M6MTQ6ImRlZmluZV9wYXltZW50IjtzOjE6IjAiO3M6OToic2VvX3RpdGxlIjtzOjA6IiI7czoxMToic2VvX2tleXdvcmQiO3M6MDoiIjtzOjE1OiJzZW9fZGVzY3JpcHRpb24iO3M6MDoiIjtzOjY6ImlzX2hvdCI7czoxOiIwIjtzOjY6ImlzX25ldyI7czoxOiIwIjtzOjc6ImlzX2Jlc3QiO3M6MToiMCI7czoxMDoiaXNfbG90dGVyeSI7czoxOiIwIjtzOjY6InJlb3BlbiI7czoxOiIwIjtzOjU6InVuYW1lIjtzOjA6IiI7czoxMDoiZm9yYmlkX3NtcyI7czoxOiIwIjtzOjk6ImNhcnRfdHlwZSI7czoxOiIwIjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MToiMCI7czo3OiJpc19zaG9wIjtzOjE6IjAiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjAiO3M6OToiYXZnX3BvaW50IjtzOjY6IjAuMDAwMCI7czoxMToiY3JlYXRlX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTE6InVwZGF0ZV90aW1lIjtzOjEwOiIxNDI0ODIzMjgxIjtzOjEwOiJuYW1lX21hdGNoIjtzOjU3ODoidXgyNzg4OHV4MjM0MjUsdXgyOTU3N3V4MjEzMjYsdXgzNzMyOXV4MjgyNDYsdXgyMzU3OHV4MjAwNzB1eDMxNTMyLHV4MjAxMDh1eDI2MDg1LHV4MzExMTl1eDI0MzE0LHV4MjI4MjN1eDIzNzc3dXgzNTg5NSx1eDIwMTY1dXgyMTgwNix1eDI2MTQ5dXgzMTE3OSx1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMDE2NXV4MjE4MDZ1eDU1dXg1M3V4NTZ1eDIwODAzdXg2NTI4MXV4MjAyMTV1eDIwNTQwdXg1NnV4NTF1eDU2dXgyMDgwM3V4MzAzNDB1eDMxMTE5dXgyNDMxNHV4MjYxNDl1eDMxMTc5dXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzh1eDI1NTUydXgyMDM3OXV4MzAzNDB1eDI3ODg4dXgyMzQyNXV4MjI4MjN1eDM3MzI5dXgyODI0NnV4NDN1eDIzNTI4dXgxOTk3OXV4MjI4MjN1eDIzNzc3dXgzNTg5NXV4NDN1eDI5NTc3dXgyMTMyNnV4Mjc5MzR1eDQzdXgyMzU3OHV4MjAwNzB1eDMxNTMydXgyMTQ1MnV4MjExNjB1eDIwMTA4dXgyNjA4NXV4MjgyMTZ1eDY1MjkydXgzNTgxNHV4MzU4MTB1eDIxODMwdXgyMzQ3OHV4NjUyOTJ1eDE5OTgxdXgzODQ4MHV4MjA5ODZ1eDIyMjQydXgyMDE1NHV4MjU5NjgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjI0Nzoi5rOw5a6BLOeOieWNjizph5HmuZYs5bCa5Lmm56ysLOS6jOaXpSznpo/lu7os5aSn5bOh6LC3LOS7heWUrizmmKXnp4ss5peF6KGM56S+LOS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjcyOiJ1eDM3MjAydXgyNDIxNXV4MjYwNTN1eDI4MjE2LHV4MzMyNTh1eDIxMTYxdXgyODIxNix1eDIxNjA4dXgzNjc5M3V4MjgyMTYiO3M6MTk6ImRlYWxfY2F0ZV9tYXRjaF9yb3ciO3M6MzI6IumFkuW6l+aXhea4uCzoh6rliqnmuLgs5ZGo6L655ri4IjtzOjE1OiJzaG9wX2NhdGVfbWF0Y2giO3M6MDoiIjtzOjE5OiJzaG9wX2NhdGVfbWF0Y2hfcm93IjtzOjA6IiI7czoxMjoibG9jYXRlX21hdGNoIjtzOjM0NToidXgzMTExOXV4MjQzMTQsdXgzMTExOXV4MjQwMzAsdXg0MDcyM3V4MjcwMDR1eDIxMzA2LHV4Mjc0OTF1eDIyODIzLHV4MjAwMTN1eDM2MzM1LHV4MjQxOTF1eDIyMzMwLHV4NDl1eDU0dXg1MHV4NTEsdXg0MDcyM3V4MjcwMDR1eDIxMzA2dXgyMDExNnV4MTk5Njh1eDIwMDEzdXgzNjMzNXV4NDl1eDU2dXgyMTQ5NXV4Mjc0OTF1eDIyODIzdXgyNDE5MXV4MjIzMzB1eDI0NDgxdXgyNjIyM3V4MjE0ODh1eDQ5dXg1NHV4NTB1eDUxLHV4MjE0ODh1eDI3NzQzdXgyMTMwNix1eDIwODQ1dXgxOTk2OHV4MjAwMTN1eDM2MzM1LHV4MjYxODd1eDIzNDMzdXgyMTMwNix1eDI5NTc5dXgyNDE5NnV4MjYwMzJ1eDI2NDQ5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjE0Nzoi56aP5bu6LOemj+W3nizpvJPmpbzljLos5q2j5aSnLOS4rei3ryzlub/lnLosMTYyMyzpvJPmpbzljLrkupTkuIDkuK3ot68xOOWPt+ato+Wkp+W5v+WcuuW+oeaZr+WPsDE2MjMs5Y+w5rGf5Yy6LOWFreS4gOS4rei3ryzmmYvlronljLos546L5bqE5paw5p2RIjtzOjk6InRhZ19tYXRjaCI7czowOiIiO3M6MTM6InRhZ19tYXRjaF9yb3ciO3M6MDoiIjtzOjY6Inhwb2ludCI7czoxMDoiMTE5LjMxNzA3MSI7czo2OiJ5cG9pbnQiO3M6OToiMjYuMDgxNDM0IjtzOjg6ImJyYW5kX2lkIjtzOjE6IjAiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMjoicHVibGlzaF93YWl0IjtzOjE6IjAiO3M6MTA6ImFjY291bnRfaWQiO3M6MToiMCI7czoxMjoiaXNfcmVjb21tZW5kIjtzOjE6IjEiO3M6MTM6ImJhbGFuY2VfcHJpY2UiO3M6ODoiNzAwLjAwMDAiO3M6OToiaXNfcmVmdW5kIjtzOjE6IjEiO3M6MTA6ImF1dG9fb3JkZXIiO3M6MToiMCI7czoxMzoiZXhwaXJlX3JlZnVuZCI7czoxOiIxIjtzOjEwOiJhbnlfcmVmdW5kIjtzOjE6IjEiO3M6MTA6Im11bHRpX2F0dHIiO3M6MToiMCI7czo4OiJkZWFsX3RhZyI7czoyOiI5NiI7czo4OiJkcF9jb3VudCI7czoxOiIwIjtzOjU6Im5vdGVzIjtzOjI1NToiPGR0IGlkPSJ5dWlfM18xNl8wXzFfMTQyNDg1MTkwOTk4M18xMzkwIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQ7Ym9yZGVyLXRvcDojZWVlZWVlIDFweCBzb2xpZDt3aWR0aDoxNDBweDt3aGl0ZS1zcGFjZTpwcmUtd3JhcDt3b3JkLXNwYWNpbmc6MHB4O3RleHQtdHJhbnNmb3JtOm5vbmU7d29yZC1icmVhazpicmVhay1hbGw7ZmxvYXQ6bGVmdDtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjhweDt0ZXh0LWFsaWduOmxlZnQ7cGFkZGluIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czozOiJ1cmwiO3M6MzM6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1kZWFsJmFjdD02NSI7czoxNzoiYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjE1OiJlbmRfdGltZV9mb3JtYXQiO3M6MDoiIjtzOjI0OiJjb3Vwb25fYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjIyOiJjb3Vwb25fZW5kX3RpbWVfZm9ybWF0IjtzOjA6IiI7czoxOToib3JpZ2luX3ByaWNlX2Zvcm1hdCI7czo4OiImeWVuOzgzOCI7czoyMDoiY3VycmVudF9wcmljZV9mb3JtYXQiO3M6ODoiJnllbjs3NTgiO3M6MTk6InN1Y2Nlc3NfdGltZV9mb3JtYXQiO3M6MTk6IjIwMTUtMDItMjUgMTY6MTQ6NDEiO3M6MTA6InNhdmVfcHJpY2UiO2Q6ODA7czoxNzoic2F2ZV9wcmljZV9mb3JtYXQiO3M6NzoiJnllbjs4MCI7czoxNjoiZGVhbF9zdWNjZXNzX251bSI7czozMDoiPHN0cm9uZz4wPC9zdHJvbmc+5Lq65bey6LSt5LmwIjtzOjE0OiJjdXJyZW50X2JvdWdodCI7czoxOiIwIjtzOjEzOiJzdXBwbGllcl9pbmZvIjthOjM5OntzOjI6ImlkIjtzOjI6IjMxIjtzOjQ6Im5hbWUiO3M6MTU6IuWbvemZheaXheihjOekviI7czo3OiJwcmV2aWV3IjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNS81NGVkODBiZjY0YmE2LmpwZyI7czo3OiJjb250ZW50IjtzOjA6IiI7czo0OiJzb3J0IjtzOjE6IjAiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjAiO3M6NzoiY2l0eV9pZCI7czoxOiIwIjtzOjEwOiJuYW1lX21hdGNoIjtzOjcyOiJ1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMjI2OXV4Mzg0NjksdXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjMyOiLml4XooYznpL4s5Zu96ZmFLOWbvemZheaXheihjOekviI7czo5OiJiYW5rX2luZm8iO3M6MjM6IjYyMjggNDgwMCA2MzA0IDI5NjUgNDE2IjtzOjU6Im1vbmV5IjtzOjY6IjAuMDAwMCI7czoxMDoic2FsZV9tb25leSI7czo2OiIwLjAwMDAiO3M6MTA6ImxvY2tfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEzOiJiYWxhbmNlX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmVmdW5kX21vbmV5IjtzOjY6IjAuMDAwMCI7czo4OiJ3ZF9tb25leSI7czo2OiIwLjAwMDAiO3M6OToiYmFua19uYW1lIjtzOjI0OiLlhpzkuJrpk7booYznpo/lt57liIbooYwiO3M6OToiYmFua191c2VyIjtzOjk6IumZiOemj+adgyI7czoxMDoiZHBfY291bnRfMSI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF8yIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzMiO3M6MToiMCI7czoxMDoiZHBfY291bnRfNCI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF81IjtzOjE6IjAiO3M6ODoiZHBfY291bnQiO3M6MToiMCI7czo5OiJhdmdfcG9pbnQiO3M6NjoiMC4wMDAwIjtzOjExOiJ0b3RhbF9wb2ludCI7czoxOiIwIjtzOjEzOiJ0b3RhbF9wb2ludF8xIjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF8xIjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfMiI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfMiI7czo2OiIwLjAwMDAiO3M6MTM6InRvdGFsX3BvaW50XzMiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzMiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF80IjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF80IjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfNSI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfNSI7czo2OiIwLjAwMDAiO3M6NjoiaF9uYW1lIjtzOjE1OiLlm73pmYXml4XooYznpL4iO3M6NzoiaF9mYXJlbiI7czo5OiLpmYjnpo/mnYMiO3M6NToiaF90ZWwiO3M6MTM6IjA1OTEtODg2MDA4MzEiO31zOjIzOiJzdXBwbGllcl9sb2NhdGlvbl9jb3VudCI7czoxOiIxIjtzOjk6ImRlYWxfYXR0ciI7YTowOnt9czoyMDoiZGVhbF9hdHRyX3N0b2NrX2pzb24iO3M6MjoiW10iO3M6OToic2hhcmVfdXJsIjtzOjU3OiJodHRwOi8vd3d3LmZhbndldG91ci5jb20vbzJvbmV3L2luZGV4LnBocD9jdGw9ZGVhbCZhY3Q9NjUiO3M6OToiZGVhbF90YWdzIjthOjI6e2k6MDtpOjU7aToxO2k6Njt9fX0=','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"144\";s:4:\"name\";s:38:\"a09bc02d6b7e791f31c69b78b337abba33.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('204','','','商品推荐：龙中龙男士棉服[仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。]','1424825604','sharedeal','71','fanwe','1','0','0','204','0','0','0','0','0','index','deal#64','','0','Fanwe','0','0','','','ux20013ux40857,ux33073ux21368,ux26825ux26381,ux21152ux21402,ux26825ux34915,ux20445ux26262,ux20165ux21806,ux22806ux22871,ux30007ux22763,ux20215ux20540','中龙,脱卸,棉服,加厚,棉衣,保暖,仅售,外套,男士,价值','','','中龙 脱卸 棉服 加厚 棉衣 保暖 仅售 外套 男士 价值','0','1','0','网站','','YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo1OiJpbmRleCI7czo1OiJyb3V0ZSI7czo3OiJkZWFsIzY0IjtzOjU6InBhcmFtIjtzOjA6IiI7fXM6NDoiZGF0YSI7YToxMTQ6e3M6MjoiaWQiO3M6MjoiNjQiO3M6NDoibmFtZSI7czoxMTE6IuS7heWUrjY55YWD77yB5Lu35YC8Mzk45YWD55qE6b6Z5Lit6b6Z55S35aOr5qOJ5pyNMeS7tu+8jOWPr+iEseWNuOW4veS/neaaluWKoOWOmuajieiho++8jOmdkuW5tOS8kemXsuWkluWll+OAgiI7czo4OiJzdWJfbmFtZSI7czoyMToi6b6Z5Lit6b6Z55S35aOr5qOJ5pyNIjtzOjc6ImNhdGVfaWQiO3M6MToiMCI7czoxMToic3VwcGxpZXJfaWQiO3M6MjoiMzIiO3M6MzoiaW1nIjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODJjYTQyZGRkLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6Mjk3OiI8cD48aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDgzMzY2ZTgyNC5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+PGJyIC8+DQo8L3A+DQo8cD48aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDgzNDIzNjU3MC5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+PGJyIC8+DQo8L3A+DQo8cD48aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDgzNGEwYTgyYy5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+PGJyIC8+DQo8L3A+DQoiO3M6MTA6ImJlZ2luX3RpbWUiO3M6MToiMCI7czo4OiJlbmRfdGltZSI7czoxOiIwIjtzOjEwOiJtaW5fYm91Z2h0IjtzOjE6IjAiO3M6MTA6Im1heF9ib3VnaHQiO3M6MToiMCI7czoxNToidXNlcl9taW5fYm91Z2h0IjtzOjE6IjAiO3M6MTU6InVzZXJfbWF4X2JvdWdodCI7czoxOiIwIjtzOjEyOiJvcmlnaW5fcHJpY2UiO3M6ODoiMzk4LjAwMDAiO3M6MTM6ImN1cnJlbnRfcHJpY2UiO3M6NzoiNjkuMDAwMCI7czo3OiJjaXR5X2lkIjtzOjE6IjAiO3M6OToiaXNfY291cG9uIjtzOjE6IjAiO3M6MTE6ImlzX2RlbGl2ZXJ5IjtzOjE6IjEiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjEiO3M6OToiaXNfZGVsZXRlIjtzOjE6IjAiO3M6MTA6InVzZXJfY291bnQiO3M6MToiMCI7czo5OiJidXlfY291bnQiO3M6MToiMCI7czoxMToidGltZV9zdGF0dXMiO2k6MTtzOjEwOiJidXlfc3RhdHVzIjtpOjE7czo5OiJkZWFsX3R5cGUiO3M6MToiMCI7czoxMzoiYWxsb3dfcHJvbW90ZSI7czoxOiIwIjtzOjEyOiJyZXR1cm5fbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEyOiJyZXR1cm5fc2NvcmUiO3M6MToiMCI7czo1OiJicmllZiI7czoxMTE6IuS7heWUrjY55YWD77yB5Lu35YC8Mzk45YWD55qE6b6Z5Lit6b6Z55S35aOr5qOJ5pyNMeS7tu+8jOWPr+iEseWNuOW4veS/neaaluWKoOWOmuajieiho++8jOmdkuW5tOS8kemXsuWkluWll+OAgiI7czo0OiJzb3J0IjtzOjE6IjYiO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoyOiIxMSI7czoxMjoic3VjY2Vzc190aW1lIjtzOjEwOiIxNDI0ODIzMDk2IjtzOjE2OiJjb3Vwb25fdGltZV90eXBlIjtzOjE6IjAiO3M6MTA6ImNvdXBvbl9kYXkiO3M6MToiMCI7czoxNzoiY291cG9uX2JlZ2luX3RpbWUiO3M6MToiMCI7czoxNToiY291cG9uX2VuZF90aW1lIjtzOjE6IjAiO3M6NDoiY29kZSI7czowOiIiO3M6Njoid2VpZ2h0IjtzOjY6IjAuMDAwMCI7czo5OiJ3ZWlnaHRfaWQiO3M6MToiMSI7czoxMToiaXNfcmVmZXJyYWwiO3M6MToiMCI7czo4OiJidXlfdHlwZSI7czoxOiIwIjtzOjg6ImRpc2NvdW50IjtkOjEuNjk5OTk5OTk5OTk5OTk5OTU1NTkxMDc5MDE0OTkzNzM4MzgzMDU0NzMzMjc2MzY3MTg3NTtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4MmNhNDJkZGQuanBnIjtzOjY6Im5vdGljZSI7czoxOiIwIjtzOjEzOiJmcmVlX2RlbGl2ZXJ5IjtzOjE6IjAiO3M6MTQ6ImRlZmluZV9wYXltZW50IjtzOjE6IjAiO3M6OToic2VvX3RpdGxlIjtzOjA6IiI7czoxMToic2VvX2tleXdvcmQiO3M6MDoiIjtzOjE1OiJzZW9fZGVzY3JpcHRpb24iO3M6MDoiIjtzOjY6ImlzX2hvdCI7czoxOiIwIjtzOjY6ImlzX25ldyI7czoxOiIwIjtzOjc6ImlzX2Jlc3QiO3M6MToiMCI7czoxMDoiaXNfbG90dGVyeSI7czoxOiIwIjtzOjY6InJlb3BlbiI7czoxOiIwIjtzOjU6InVuYW1lIjtzOjA6IiI7czoxMDoiZm9yYmlkX3NtcyI7czoxOiIwIjtzOjk6ImNhcnRfdHlwZSI7czoxOiIwIjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MjoiMzEiO3M6NzoiaXNfc2hvcCI7czoxOiIxIjtzOjExOiJ0b3RhbF9wb2ludCI7czoxOiIwIjtzOjk6ImF2Z19wb2ludCI7czo2OiIwLjAwMDAiO3M6MTE6ImNyZWF0ZV90aW1lIjtzOjEwOiIxNDI0ODIzMDk2IjtzOjExOiJ1cGRhdGVfdGltZSI7czoxMDoiMTQyNDgyNDQxMSI7czoxMDoibmFtZV9tYXRjaCI7czo0NDE6InV4MjAwMTN1eDQwODU3LHV4MzMwNzN1eDIxMzY4LHV4MjY4MjV1eDI2MzgxLHV4MjExNTJ1eDIxNDAyLHV4MjY4MjV1eDM0OTE1LHV4MjA0NDV1eDI2MjYyLHV4MjAxNjV1eDIxODA2LHV4MjI4MDZ1eDIyODcxLHV4MzAwMDd1eDIyNzYzLHV4MjAyMTV1eDIwNTQwLHV4MjAxNjV1eDIxODA2dXg1NHV4NTd1eDIwODAzdXg2NTI4MXV4MjAyMTV1eDIwNTQwdXg1MXV4NTd1eDU2dXgyMDgwM3V4MzAzNDB1eDQwODU3dXgyMDAxM3V4NDA4NTd1eDMwMDA3dXgyMjc2M3V4MjY4MjV1eDI2MzgxdXg0OXV4MjAyMTR1eDY1MjkydXgyMTQ4N3V4MzMwNzN1eDIxMzY4dXgyNDEyNXV4MjA0NDV1eDI2MjYydXgyMTE1MnV4MjE0MDJ1eDI2ODI1dXgzNDkxNXV4NjUyOTJ1eDM4NzM4dXgyNDE4MHV4MjAyNDF1eDM4Mzg2dXgyMjgwNnV4MjI4NzF1eDEyMjkwLHV4NDA4NTd1eDIwMDEzdXg0MDg1NyI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MTkxOiLkuK3pvpks6ISx5Y24LOajieacjSzliqDljpos5qOJ6KGjLOS/neaalizku4XllK4s5aSW5aWXLOeUt+Wjqyzku7flgLws5LuF5ZSuNjnlhYPvvIHku7flgLwzOTjlhYPnmoTpvpnkuK3pvpnnlLflo6vmo4nmnI0x5Lu277yM5Y+v6ISx5Y245bi95L+d5pqW5Yqg5Y6a5qOJ6KGj77yM6Z2S5bm05LyR6Zey5aSW5aWX44CCLOm+meS4rem+mSI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjA6IiI7czoxOToiZGVhbF9jYXRlX21hdGNoX3JvdyI7czowOiIiO3M6MTU6InNob3BfY2F0ZV9tYXRjaCI7czoyOToidXgyNjM4MXV4MzUwMTMsdXgzMDAwN3V4MzUwMTMiO3M6MTk6InNob3BfY2F0ZV9tYXRjaF9yb3ciO3M6MTM6IuacjeijhSznlLfoo4UiO3M6MTI6ImxvY2F0ZV9tYXRjaCI7czo1MDoidXg0MDcyM3V4MjcwMDR1eDIxMzA2LHV4MzExMTl1eDI0MDMwdXgyNDE5MXV4MjIzMzAiO3M6MTY6ImxvY2F0ZV9tYXRjaF9yb3ciO3M6MjI6Ium8k+alvOWMuiznpo/lt57lub/lnLoiO3M6OToidGFnX21hdGNoIjtzOjc0OiJ1eDQwNjU3dXgzMzM5NCx1eDI2ODM3dXgzMzM5NCx1eDIzNTY3dXgzMDcyMSx1eDIyODIzdXgzMDcyMSx1eDIyMzQzdXgzMDcyMSI7czoxMzoidGFnX21hdGNoX3JvdyI7czozNDoi6buR6ImyLOajleiJsizlsI/noIEs5aSn56CBLOWdh+eggSI7czo2OiJ4cG9pbnQiO3M6MDoiIjtzOjY6Inlwb2ludCI7czowOiIiO3M6ODoiYnJhbmRfaWQiO3M6MjoiMTYiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMjoicHVibGlzaF93YWl0IjtzOjE6IjAiO3M6MTA6ImFjY291bnRfaWQiO3M6MToiMCI7czoxMjoiaXNfcmVjb21tZW5kIjtzOjE6IjEiO3M6MTM6ImJhbGFuY2VfcHJpY2UiO3M6NzoiNTAuMDAwMCI7czo5OiJpc19yZWZ1bmQiO3M6MToiMSI7czoxMDoiYXV0b19vcmRlciI7czoxOiIwIjtzOjEzOiJleHBpcmVfcmVmdW5kIjtzOjE6IjAiO3M6MTA6ImFueV9yZWZ1bmQiO3M6MToiMCI7czoxMDoibXVsdGlfYXR0ciI7czoxOiIxIjtzOjg6ImRlYWxfdGFnIjtzOjI6IjY0IjtzOjg6ImRwX2NvdW50IjtzOjE6IjAiO3M6NToibm90ZXMiO3M6MDoiIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czozOiJ1cmwiO3M6MzM6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1kZWFsJmFjdD02NCI7czoxNzoiYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjE1OiJlbmRfdGltZV9mb3JtYXQiO3M6MDoiIjtzOjI0OiJjb3Vwb25fYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjIyOiJjb3Vwb25fZW5kX3RpbWVfZm9ybWF0IjtzOjA6IiI7czoxOToib3JpZ2luX3ByaWNlX2Zvcm1hdCI7czo4OiImeWVuOzM5OCI7czoyMDoiY3VycmVudF9wcmljZV9mb3JtYXQiO3M6NzoiJnllbjs2OSI7czoxOToic3VjY2Vzc190aW1lX2Zvcm1hdCI7czoxOToiMjAxNS0wMi0yNSAxNjoxMTozNiI7czoxMDoic2F2ZV9wcmljZSI7ZDozMjk7czoxNzoic2F2ZV9wcmljZV9mb3JtYXQiO3M6ODoiJnllbjszMjkiO3M6MTY6ImRlYWxfc3VjY2Vzc19udW0iO3M6MzA6IjxzdHJvbmc+MDwvc3Ryb25nPuS6uuW3sui0reS5sCI7czoxNDoiY3VycmVudF9ib3VnaHQiO3M6MToiMCI7czoxMDoiaW1hZ2VfbGlzdCI7YToyOntpOjA7YTo1OntzOjI6ImlkIjtzOjM6IjY4OSI7czozOiJpbWciO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4MmNhNDJkZGQuanBnIjtzOjc6ImRlYWxfaWQiO3M6MjoiNjQiO3M6NDoic29ydCI7czoxOiIwIjtzOjc6ImN1cnJlbnQiO2k6MTt9aToxO2E6NDp7czoyOiJpZCI7czozOiI2OTAiO3M6MzoiaW1nIjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODQzOTU0NTJkLmpwZyI7czo3OiJkZWFsX2lkIjtzOjI6IjY0IjtzOjQ6InNvcnQiO3M6MToiMSI7fX1zOjEzOiJzdXBwbGllcl9pbmZvIjthOjM5OntzOjI6ImlkIjtzOjI6IjMyIjtzOjQ6Im5hbWUiO3M6OToi6b6Z5Lit6b6ZIjtzOjc6InByZXZpZXciO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4MmNhNDJkZGQuanBnIjtzOjc6ImNvbnRlbnQiO3M6MDoiIjtzOjQ6InNvcnQiO3M6MToiMCI7czo5OiJpc19lZmZlY3QiO3M6MToiMCI7czo3OiJjaXR5X2lkIjtzOjE6IjAiO3M6MTA6Im5hbWVfbWF0Y2giO3M6MzY6InV4MjAwMTN1eDQwODU3LHV4NDA4NTd1eDIwMDEzdXg0MDg1NyI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MTY6IuS4rem+mSzpvpnkuK3pvpkiO3M6OToiYmFua19pbmZvIjtzOjE1OiI2MjIyNTU1NTQ0NDQ3NzEiO3M6NToibW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEwOiJzYWxlX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMDoibG9ja19tb25leSI7czo2OiIwLjAwMDAiO3M6MTM6ImJhbGFuY2VfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEyOiJyZWZ1bmRfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjg6IndkX21vbmV5IjtzOjY6IjAuMDAwMCI7czo5OiJiYW5rX25hbWUiO3M6MzM6IuS4reWbveW7uuiuvumTtuihjOemj+W7uuecgeWIhuihjCI7czo5OiJiYW5rX3VzZXIiO3M6Njoi5byg5LqUIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czo4OiJkcF9jb3VudCI7czoxOiIwIjtzOjk6ImF2Z19wb2ludCI7czo2OiIwLjAwMDAiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjAiO3M6MTM6InRvdGFsX3BvaW50XzEiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzEiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF8yIjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF8yIjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfMyI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfMyI7czo2OiIwLjAwMDAiO3M6MTM6InRvdGFsX3BvaW50XzQiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzQiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF81IjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF81IjtzOjY6IjAuMDAwMCI7czo2OiJoX25hbWUiO3M6OToi6b6Z5Lit6b6ZIjtzOjc6ImhfZmFyZW4iO3M6Njoi546L5LqUIjtzOjU6ImhfdGVsIjtzOjEzOiIwNTkxLTg4NTU4ODU1Ijt9czoyMzoic3VwcGxpZXJfbG9jYXRpb25fY291bnQiO3M6MToiMSI7czoxMDoiYnJhbmRfaW5mbyI7YToxNjp7czoyOiJpZCI7czoyOiIxNiI7czo0OiJuYW1lIjtzOjk6Ium+meS4rem+mSI7czo0OiJsb2dvIjtzOjA6IiI7czoxODoiYnJhbmRfcHJvbW90ZV9sb2dvIjtzOjA6IiI7czo1OiJicmllZiI7czowOiIiO3M6NDoic29ydCI7czoxOiI0IjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MjoiMzEiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMDoiYmVnaW5fdGltZSI7czoxOiIwIjtzOjg6ImVuZF90aW1lIjtzOjE6IjAiO3M6MTE6InRpbWVfc3RhdHVzIjtzOjE6IjAiO3M6ODoiZHlfY291bnQiO3M6MToiMCI7czozOiJ0YWciO3M6MTM6IueUt+ijhSDmnI3oo4UiO3M6OToidGFnX21hdGNoIjtzOjI5OiJ1eDMwMDA3dXgzNTAxMyx1eDI2MzgxdXgzNTAxMyI7czoxMzoidGFnX21hdGNoX3JvdyI7czoxMzoi55S36KOFLOacjeijhSI7czozOiJ1cmwiO3M6MzQ6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1icmFuZCZhY3Q9MTYiO31zOjk6ImRlYWxfYXR0ciI7YToyOntpOjA7YTozOntzOjI6ImlkIjtzOjI6IjE5IjtzOjQ6Im5hbWUiO3M6Njoi6aKc6ImyIjtzOjk6ImF0dHJfbGlzdCI7YToyOntpOjA7YTozOntzOjI6ImlkIjtzOjM6IjI3MCI7czo0OiJuYW1lIjtzOjY6Ium7keiJsiI7czo1OiJwcmljZSI7czo2OiIwLjAwMDAiO31pOjE7YTozOntzOjI6ImlkIjtzOjM6IjI2OSI7czo0OiJuYW1lIjtzOjY6IuajleiJsiI7czo1OiJwcmljZSI7czo2OiIwLjAwMDAiO319fWk6MTthOjM6e3M6MjoiaWQiO3M6MjoiMjAiO3M6NDoibmFtZSI7czo2OiLlsLrnoIEiO3M6OToiYXR0cl9saXN0IjthOjM6e2k6MDthOjM6e3M6MjoiaWQiO3M6MzoiMjczIjtzOjQ6Im5hbWUiO3M6Njoi5bCP56CBIjtzOjU6InByaWNlIjtzOjY6IjAuMDAwMCI7fWk6MTthOjM6e3M6MjoiaWQiO3M6MzoiMjcyIjtzOjQ6Im5hbWUiO3M6Njoi5aSn56CBIjtzOjU6InByaWNlIjtzOjY6IjAuMDAwMCI7fWk6MjthOjM6e3M6MjoiaWQiO3M6MzoiMjcxIjtzOjQ6Im5hbWUiO3M6Njoi5Z2H56CBIjtzOjU6InByaWNlIjtzOjY6IjAuMDAwMCI7fX19fXM6MjA6ImRlYWxfYXR0cl9zdG9ja19qc29uIjtzOjExMDM6InsiMjcwXzI3MyI6eyJpZCI6IjEzOSIsImRlYWxfaWQiOiI2NCIsImF0dHJfY2ZnIjp7IjE5IjoiXHU5ZWQxXHU4MjcyIiwiMjAiOiJcdTVjMGZcdTc4MDEifSwic3RvY2tfY2ZnIjoiNTAwIiwiYXR0cl9zdHIiOiJcdTllZDFcdTgyNzJcdTVjMGZcdTc4MDEiLCJidXlfY291bnQiOiIwIiwiYXR0cl9rZXkiOiIyNzBfMjczIn0sIjI3MF8yNzIiOnsiaWQiOiIxMzgiLCJkZWFsX2lkIjoiNjQiLCJhdHRyX2NmZyI6eyIxOSI6Ilx1OWVkMVx1ODI3MiIsIjIwIjoiXHU1OTI3XHU3ODAxIn0sInN0b2NrX2NmZyI6IjQwMCIsImF0dHJfc3RyIjoiXHU5ZWQxXHU4MjcyXHU1OTI3XHU3ODAxIiwiYnV5X2NvdW50IjoiMCIsImF0dHJfa2V5IjoiMjcwXzI3MiJ9LCIyNzBfMjcxIjp7ImlkIjoiMTM3IiwiZGVhbF9pZCI6IjY0IiwiYXR0cl9jZmciOnsiMTkiOiJcdTllZDFcdTgyNzIiLCIyMCI6Ilx1NTc0N1x1NzgwMSJ9LCJzdG9ja19jZmciOiIzMDAiLCJhdHRyX3N0ciI6Ilx1OWVkMVx1ODI3Mlx1NTc0N1x1NzgwMSIsImJ1eV9jb3VudCI6IjAiLCJhdHRyX2tleSI6IjI3MF8yNzEifSwiMjY5XzI3MyI6eyJpZCI6IjEzNiIsImRlYWxfaWQiOiI2NCIsImF0dHJfY2ZnIjp7IjE5IjoiXHU2OGQ1XHU4MjcyIiwiMjAiOiJcdTVjMGZcdTc4MDEifSwic3RvY2tfY2ZnIjoiMjAwIiwiYXR0cl9zdHIiOiJcdTY4ZDVcdTgyNzJcdTVjMGZcdTc4MDEiLCJidXlfY291bnQiOiIwIiwiYXR0cl9rZXkiOiIyNjlfMjczIn0sIjI2OV8yNzEiOnsiaWQiOiIxMzQiLCJkZWFsX2lkIjoiNjQiLCJhdHRyX2NmZyI6eyIxOSI6Ilx1NjhkNVx1ODI3MiIsIjIwIjoiXHU1NzQ3XHU3ODAxIn0sInN0b2NrX2NmZyI6IjEwMCIsImF0dHJfc3RyIjoiXHU2OGQ1XHU4MjcyXHU1NzQ3XHU3ODAxIiwiYnV5X2NvdW50IjoiMCIsImF0dHJfa2V5IjoiMjY5XzI3MSJ9LCIyNjlfMjcyIjp7ImlkIjoiMTM1IiwiZGVhbF9pZCI6IjY0IiwiYXR0cl9jZmciOnsiMTkiOiJcdTY4ZDVcdTgyNzIiLCIyMCI6Ilx1NTkyN1x1NzgwMSJ9LCJzdG9ja19jZmciOiIwIiwiYXR0cl9zdHIiOiJcdTY4ZDVcdTgyNzJcdTU5MjdcdTc4MDEiLCJidXlfY291bnQiOiIwIiwiYXR0cl9rZXkiOiIyNjlfMjcyIn19IjtzOjk6InNoYXJlX3VybCI7czo1NzoiaHR0cDovL3d3dy5mYW53ZXRvdXIuY29tL28yb25ldy9pbmRleC5waHA/Y3RsPWRlYWwmYWN0PTY0IjtzOjk6ImRlYWxfdGFncyI7YToxOntpOjA7aTo2O319fQ==','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"145\";s:4:\"name\";s:38:\"35d92374d0e80b9e1cd01242fa2741f228.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('205','','','','1424831278','share','71','fanwe','1','0','203','203','0','0','0','0','0','','','','0','share','0','0','','','','','','','','0','0','0','网站','','','','0','0','0','','0','0','','','a:52:{s:2:\"id\";s:3:\"203\";s:5:\"title\";s:0:\"\";s:11:\"forum_title\";s:0:\"\";s:7:\"content\";s:59:\"团购推荐：泰宁大金湖[【福州】泰宁大金湖]\";s:11:\"create_time\";s:10:\"1424825541\";s:4:\"type\";s:9:\"sharedeal\";s:7:\"user_id\";s:2:\"71\";s:9:\"user_name\";s:5:\"fanwe\";s:9:\"is_effect\";s:1:\"1\";s:9:\"is_delete\";s:1:\"0\";s:8:\"relay_id\";s:1:\"0\";s:9:\"origin_id\";s:3:\"203\";s:11:\"reply_count\";s:1:\"0\";s:11:\"relay_count\";s:1:\"1\";s:10:\"good_count\";s:1:\"0\";s:9:\"bad_count\";s:1:\"0\";s:11:\"click_count\";s:1:\"0\";s:13:\"rel_app_index\";s:5:\"index\";s:9:\"rel_route\";s:7:\"deal#65\";s:9:\"rel_param\";s:0:\"\";s:10:\"message_id\";s:1:\"0\";s:11:\"topic_group\";s:5:\"Fanwe\";s:6:\"fav_id\";s:1:\"0\";s:9:\"fav_count\";s:1:\"0\";s:15:\"user_name_match\";s:0:\"\";s:19:\"user_name_match_row\";s:0:\"\";s:13:\"keyword_match\";s:215:\"ux27888ux23425,ux29577ux21326,ux37329ux28246,ux23578ux20070ux31532,ux20108ux26085,ux31119ux24314,ux22823ux23777ux35895,ux20165ux21806,ux26149ux31179,ux26053ux34892ux31038,ux31119ux24030,ux22242ux36141,ux25512ux33616\";s:17:\"keyword_match_row\";s:99:\"泰宁,玉华,金湖,尚书第,二日,福建,大峡谷,仅售,春秋,旅行社,福州,团购,推荐\";s:6:\"xpoint\";s:0:\"\";s:6:\"ypoint\";s:0:\"\";s:4:\"tags\";s:78:\"泰宁 玉华 金湖 尚书第 二日 福建 大峡谷 仅售 春秋 旅行社\";s:12:\"is_recommend\";s:1:\"0\";s:9:\"has_image\";s:1:\"1\";s:11:\"source_type\";s:1:\"0\";s:11:\"source_name\";s:6:\"网站\";s:10:\"source_url\";s:0:\"\";s:10:\"group_data\";s:17276:\"YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo1OiJpbmRleCI7czo1OiJyb3V0ZSI7czo3OiJkZWFsIzY1IjtzOjU6InBhcmFtIjtzOjA6IiI7fXM6NDoiZGF0YSI7YToxMTI6e3M6MjoiaWQiO3M6MjoiNjUiO3M6NDoibmFtZSI7czoxNjg6IuS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czo4OiJzdWJfbmFtZSI7czoxNToi5rOw5a6B5aSn6YeR5rmWIjtzOjc6ImNhdGVfaWQiO3M6MjoiMTEiO3M6MTE6InN1cHBsaWVyX2lkIjtzOjI6IjMxIjtzOjM6ImltZyI7czo1MDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDg0MDg3NTA3Yy5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjYzNDg6IjxwIGFsaWduPSJjZW50ZXIiPjxpbWcgYm9yZGVyPSIwIiBhbHQ9IiIgc3JjPSIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODQwODc1MDdjLmpwZyIgLz48L3A+DQo8dWwgaWQ9Inl1aV8zXzE2XzBfMV8xNDI0ODUxOTA5OTgzXzEzNjUiIGNsYXNzPSJsaXN0IiBzdHlsZT0id2hpdGUtc3BhY2U6bm9ybWFsO3dvcmQtc3BhY2luZzowcHg7dGV4dC10cmFuc2Zvcm06bm9uZTtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7Zm9udDoxNHB4LzIxcHggJ2hpcmFnaW5vIHNhbnMgZ2InLCAnd2VucXVhbnlpIG1pY3JvIGhlaScsIHRhaG9tYSwgc2Fucy1zZXJpZjtwYWRkaW5nLWxlZnQ6MThweDttYXJnaW46MTBweCAwcHggMTVweDtsZXR0ZXItc3BhY2luZzpub3JtYWw7cGFkZGluZy1yaWdodDowcHg7YmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO3RleHQtaW5kZW50OjBweDstd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOjBweDsiPjxsaSBpZD0ieXVpXzNfMTZfMF8xXzE0MjQ4NTE5MDk5ODNfMTM2NCIgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5Y+R5Zui5pe26Ze077ya6K+m6K+i5ZWG5a6277yb6aKE57qm5Ye65Zui5Lq65pWw77ya5LiN6ZmQPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7lt7LljIXlkKvlr7zmuLjotLnvvJvljIXlkKvml6nppJAx5qyhK+WNiOmkkDHmrKEr5pma6aSQMeasoTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5YyF5ZCr5YWl5L2P6YWS5bqXMeaZmu+8m+aWueahiOW3suWMheWQq+W+gOi/lOi9pui0uTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpub25lO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+6KGM56iL5a6J5o6S77yaPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7pm4blkIjml7bpl7TvvJowN++8mjAw77yb6ZuG5ZCI5Zyw54K577ya56aP5bee54Gr6L2m56uZPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48Yj7lpKfph5HmuZbvvIjnrKzkuIDlpKnvvIk8L2I+PGJyIC8+DQrkuqTpgJrmlrnlvI/vvJrliqjovabvvJvmuLjnjqnml7bplb/vvJox5aSpPGJyIC8+DQrku4vnu43vvJrlj4LogIPovabmrKHvvJrnpo/lt57nq5lEMjI0Mu+8iDA377yaMDAvMDjvvJo0M++8iSBENjUwMu+8iDA477yaMzAvMTDvvJoyMO+8iSBEMjIyNu+8iDA477yaNDIvMTDvvJozOe+8iSDml6nliqjovabnq5npm4bkuK3lkI7vvIzlrqLkurroh6rooYzliY3lvoDms7DlroHliqjovabnq5nvvIzlr7zmuLjms7DlroHnq5nmjqXlm6LpgIHjgJDms7DlroHlj6Tln47jgJHvvIzlj4Lop4LnirblhYPmlofljJbkuLvpopjpk5zpm5XnvqTvvIzpoobnlaXms7DlroHlj6Tln47nmoTljoblj7Llj5jov4HvvIzmhJ/lj5figJzmsYnllJDlj6TplYfjgIHkuKTlrovlkI3ln47igJ3kuYvpo47pn7XjgILop6bmkbgyMjAw5bm055qE6aOO6Zuo5rKn5qGR77yM6L+Y5Y+v5Lul5Zyo57qi5Yab6KGX5LiK6L+95b+G5bel5Yac57qi5Yab5LiJ6L+b5LiJ5Ye655qE54O954Gr5bKB5pyI77yM5Y+v5Lul5Y+C6KeC5piO5pyd5YW16YOo5bCa5Lmm5p2O5pil54Oo55qE5rex5a6F5aSn6Zmi5Lit5ZOB5ZGz4oCc5rGf5Y2X56ys5LiA5rCR5bGF4oCc44CQ5bCa5Lmm56ys44CR44CC5LiL5Y2I6YCC5pe26LW05Zu95a62NUHnuqfmma/ljLrjgIHkuJbnlYzoh6rnhLbpgZfkuqfnmoTmoLjlv4Plk4HniYzigJTigJTjgJDlpKfph5HmuZbmma/ljLrjgJHvvIjooYznqIvnuqYyMOWIhumSn++8jOa4uOiniOe6pjTlsI/ml7bvvInvvIznmbvlsrjmuLjop4jigJzph47otqPlm63msLTpmYXngJHluIPigJ3jgIHkuIDmn7Hmj5LlnLDkuI3lgYfniYfnk6bnmoTljZfmlrnmgqznqbrlr7rigJznlJjpnLLlr7rigJ3jgIHpmYblnLDkuIDnur/lpKnvvJvoiLnmuLjph5HmuZbop4LlpKfotaTlo4HjgIHigJzku5nigJ3igJzlr7/igJ3lkYjnpaXlpKnkuabnnJ/ov7njgILmuLjop4jnu5PmnZ/lkI7lr7zmuLjlsIbmuLjlrqLpgIHov5TphZLlupfjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjxiPuWvqOS4i+Wkp+WzoeiwtyAr546J5Y2O5rSe77yI56ys5LqM5aSp77yJPC9iPjxiciAvPg0K5Lqk6YCa5pa55byP77ya5Yqo6L2m77yb5ri4546p5pe26ZW/77yaMeWkqTxiciAvPg0K5LuL57uN77ya5Y+C6ICD6L2m5qyh77ya5bCG5LmQ56uZRDY1MDnvvIgxNu+8mjQ0LzE477yaMjfvvIlEMjIyNe+8iDIw77yaNDMvMjLvvJoyOe+8iSDml6nppJDlkI7muLjop4jkuJbnlYzlnLDotKjlhazlm63nmoTmoLfmnb/mma/ljLotLeOAkOWvqOS4i+Wkp+WzoeiwtzYy44CRKOa4uOiniOaXtumXtDIuNeWwj+aXtuW3puWPs++8ie+8iOaCrOWkqeWzoeOAgemAmuWkqeWzoeOAgeWAmuWkqeWzoeOAgeWkqeepueWyqeOAgemXruWkqeWyqeOAgeWxseW0qeWcsOijguOAgeWgsOWhnua5lu+8iei/meaYr+S4h+iwt+W9kuS4gOeahOWcsOaWue+8jOWPr+S7peavq+S4jeWkuOW8oOWcsOivtO+8muWvqOS4i+W9kuadpeS4jeeci+iwt+OAguiBlOWQiOWbveaVmeenkeaWh+e7hOe7h+S4k+WutuivhOS7t+WFtuS4uuS4lueVjOWcsOi0qOWFrOWbreeahOagt+adv+aZr+WMuuOAguS4remkkOWQjuWbveWutumHjeeCuemjjuaZr+WQjeiDnOWMuuS4reWbveWbm+Wkp+WQjea0nuS5i+S4gC0t44CQ546J5Y2O5rSeMTA144CRKOa4uOiniOaXtumXtDLlsI/ml7blt6blj7PvvInvvIzoqonnp7DlvaLog5znlLLpl73lsbHvvIzkurrpl7TnkbbmsaDmma/jgILlm6DmtJ7lhoXlsqnnn7PmtIHnmb3lpoLnjonvvIzljY7lhYnlm5vlsITogIzlvpflkI0u5L2T6aqM6aOO5aOw5LiN5q2i55qEMeaJh+mjju+8jOinguS7meS6uueUsO+8jOehleaenOe0r+e0r++8jOaTjuWkqeafse+8jOm4oeWGoOefs++8jOS4h+WutueBr+eBq++8jOS6lOabtOWkqeetieaZr+eCueOAguWQjiDlsIbkuZDov5Tlm57ms7DlroHmiJbogIXkuInmmI7ljJfnq5nov5Tlm57vvIzlkI7nu5PmnZ/mhInlv6vnmoTooYznqIvjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuivt+aPkOWJjeeUteivneWVhuWutjA1OTEtODc4NzE1NjfjgIE4ODk5OTg4MOmihOe6puaIluWPkemihOe6puefreS/oeKAnOWnk+WQjSvmiYvmnLrlj7fkurrmlbAr5ri4546p5pel5pyfK+e+juWboumqjOivgeeggeKAnee7meWuouacjeeUteivnTEzNTU5MTk1NTM3PC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuOAkOacjeWKoeagh+WHhuOAkTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+MeOAgeS9j+Wuv++8muWutuW6remFkuW6l+agh+WHhuWPjOagh+mXtO+8iOWPguiAg+mFkuW6l++8mueIseW/g+WuvummhuOAgeaWsOWMl+a0suWuvummhuOAgeS4i+WdiuS4gOacn++8jOS4i+WdiuS4ieacn++8jOWNl+iwtyDlt7fjgIHph5Hls7Dlt7fvvIk8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjLjgIHpl6jnpajvvJrooYznqIvmiYDliJfmma/ngrnlpKfpl6jnpajlj4roiLnnpajvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjPjgIHkuqTpgJrvvJrnpo/lt57nq5noh7Pms7DlroHjgIHlsIbkuZDnq5nlvoDov5TliqjovabkuoznrYnluqfnpajvvIzmma/ljLrpl7Tlvqrnjq/nlKjovabvvIjlpZfovabvvIzmjInkurrmlbDmjpLovabvvIzkuI3mj5Dkvpvnq5nluqfvvIzpnIDnrYnlvoU0MOWIhumSn+KAlDHlsI/ml7bvvInvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjTjgIHppJDppa7vvJrlhajnqIvlkKvkuIDml6nkuozmraPvvIjmraPppJAyMOWFg+i1t++8jOWFq+iPnOS6jOaxpO+8jOWNgeS6uuS4gOahjO+8jOS6uuaVsOWHj+Wwke+8jOiPnOmHj+ebuOWvueWHj+Wwke+8iTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NeOAgeWvvOa4uO+8muazsOWugeW9k+WcsOaMgeivgeWvvOa4uOacjeWKoe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NuOAgeS/nemZqe+8muWQq+W9k+WcsOaXheihjOekvui0o+S7u+mZqeOAgeivt+e7hOWbouekvuW4ruWuouS6uuS5sOWlveaXhea4uOaEj+WklumZqe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+N+OAgeWEv+erpeaVo+aLvOaKpeS7t++8mjEuNE3ku6XkuIvvvIzlkKvovabkvY3jgIHppJDjgIHlr7zmnI3jgIHkv53pmanvvIzkuI3ljaDluorjgIHkuI3lkKvpl6jnpajjgIHliqjovabnpajotoXpq5joh6rnkIbvvIk8L2xpPg0KPC91bD4NCiI7czoxMDoiYmVnaW5fdGltZSI7czoxOiIwIjtzOjg6ImVuZF90aW1lIjtzOjE6IjAiO3M6MTA6Im1pbl9ib3VnaHQiO3M6MToiMCI7czoxMDoibWF4X2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21pbl9ib3VnaHQiO3M6MToiMCI7czoxNToidXNlcl9tYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTI6Im9yaWdpbl9wcmljZSI7czo4OiI4MzguMDAwMCI7czoxMzoiY3VycmVudF9wcmljZSI7czo4OiI3NTguMDAwMCI7czo3OiJjaXR5X2lkIjtzOjI6IjE1IjtzOjk6ImlzX2NvdXBvbiI7czoxOiIxIjtzOjExOiJpc19kZWxpdmVyeSI7czoxOiIwIjtzOjk6ImlzX2VmZmVjdCI7czoxOiIxIjtzOjk6ImlzX2RlbGV0ZSI7czoxOiIwIjtzOjEwOiJ1c2VyX2NvdW50IjtzOjE6IjAiO3M6OToiYnV5X2NvdW50IjtzOjE6IjAiO3M6MTE6InRpbWVfc3RhdHVzIjtpOjE7czoxMDoiYnV5X3N0YXR1cyI7aToxO3M6OToiZGVhbF90eXBlIjtzOjE6IjAiO3M6MTM6ImFsbG93X3Byb21vdGUiO3M6MToiMCI7czoxMjoicmV0dXJuX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmV0dXJuX3Njb3JlIjtzOjE6IjAiO3M6NToiYnJpZWYiO3M6Mjc6IuOAkOemj+W3nuOAkeazsOWugeWkp+mHkea5liI7czo0OiJzb3J0IjtzOjE6IjciO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiIwIjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTY6ImNvdXBvbl90aW1lX3R5cGUiO3M6MToiMCI7czoxMDoiY291cG9uX2RheSI7czoxOiIwIjtzOjE3OiJjb3Vwb25fYmVnaW5fdGltZSI7czoxOiIwIjtzOjE1OiJjb3Vwb25fZW5kX3RpbWUiO3M6MToiMCI7czo0OiJjb2RlIjtzOjA6IiI7czo2OiJ3ZWlnaHQiO3M6NjoiMC4wMDAwIjtzOjk6IndlaWdodF9pZCI7czoxOiIwIjtzOjExOiJpc19yZWZlcnJhbCI7czoxOiIwIjtzOjg6ImJ1eV90eXBlIjtzOjE6IjAiO3M6ODoiZGlzY291bnQiO2Q6OTtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4NDA4NzUwN2MuanBnIjtzOjY6Im5vdGljZSI7czoxOiIwIjtzOjEzOiJmcmVlX2RlbGl2ZXJ5IjtzOjE6IjAiO3M6MTQ6ImRlZmluZV9wYXltZW50IjtzOjE6IjAiO3M6OToic2VvX3RpdGxlIjtzOjA6IiI7czoxMToic2VvX2tleXdvcmQiO3M6MDoiIjtzOjE1OiJzZW9fZGVzY3JpcHRpb24iO3M6MDoiIjtzOjY6ImlzX2hvdCI7czoxOiIwIjtzOjY6ImlzX25ldyI7czoxOiIwIjtzOjc6ImlzX2Jlc3QiO3M6MToiMCI7czoxMDoiaXNfbG90dGVyeSI7czoxOiIwIjtzOjY6InJlb3BlbiI7czoxOiIwIjtzOjU6InVuYW1lIjtzOjA6IiI7czoxMDoiZm9yYmlkX3NtcyI7czoxOiIwIjtzOjk6ImNhcnRfdHlwZSI7czoxOiIwIjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MToiMCI7czo3OiJpc19zaG9wIjtzOjE6IjAiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjAiO3M6OToiYXZnX3BvaW50IjtzOjY6IjAuMDAwMCI7czoxMToiY3JlYXRlX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTE6InVwZGF0ZV90aW1lIjtzOjEwOiIxNDI0ODIzMjgxIjtzOjEwOiJuYW1lX21hdGNoIjtzOjU3ODoidXgyNzg4OHV4MjM0MjUsdXgyOTU3N3V4MjEzMjYsdXgzNzMyOXV4MjgyNDYsdXgyMzU3OHV4MjAwNzB1eDMxNTMyLHV4MjAxMDh1eDI2MDg1LHV4MzExMTl1eDI0MzE0LHV4MjI4MjN1eDIzNzc3dXgzNTg5NSx1eDIwMTY1dXgyMTgwNix1eDI2MTQ5dXgzMTE3OSx1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMDE2NXV4MjE4MDZ1eDU1dXg1M3V4NTZ1eDIwODAzdXg2NTI4MXV4MjAyMTV1eDIwNTQwdXg1NnV4NTF1eDU2dXgyMDgwM3V4MzAzNDB1eDMxMTE5dXgyNDMxNHV4MjYxNDl1eDMxMTc5dXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzh1eDI1NTUydXgyMDM3OXV4MzAzNDB1eDI3ODg4dXgyMzQyNXV4MjI4MjN1eDM3MzI5dXgyODI0NnV4NDN1eDIzNTI4dXgxOTk3OXV4MjI4MjN1eDIzNzc3dXgzNTg5NXV4NDN1eDI5NTc3dXgyMTMyNnV4Mjc5MzR1eDQzdXgyMzU3OHV4MjAwNzB1eDMxNTMydXgyMTQ1MnV4MjExNjB1eDIwMTA4dXgyNjA4NXV4MjgyMTZ1eDY1MjkydXgzNTgxNHV4MzU4MTB1eDIxODMwdXgyMzQ3OHV4NjUyOTJ1eDE5OTgxdXgzODQ4MHV4MjA5ODZ1eDIyMjQydXgyMDE1NHV4MjU5NjgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjI0Nzoi5rOw5a6BLOeOieWNjizph5HmuZYs5bCa5Lmm56ysLOS6jOaXpSznpo/lu7os5aSn5bOh6LC3LOS7heWUrizmmKXnp4ss5peF6KGM56S+LOS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjcyOiJ1eDM3MjAydXgyNDIxNXV4MjYwNTN1eDI4MjE2LHV4MzMyNTh1eDIxMTYxdXgyODIxNix1eDIxNjA4dXgzNjc5M3V4MjgyMTYiO3M6MTk6ImRlYWxfY2F0ZV9tYXRjaF9yb3ciO3M6MzI6IumFkuW6l+aXhea4uCzoh6rliqnmuLgs5ZGo6L655ri4IjtzOjE1OiJzaG9wX2NhdGVfbWF0Y2giO3M6MDoiIjtzOjE5OiJzaG9wX2NhdGVfbWF0Y2hfcm93IjtzOjA6IiI7czoxMjoibG9jYXRlX21hdGNoIjtzOjM0NToidXgzMTExOXV4MjQzMTQsdXgzMTExOXV4MjQwMzAsdXg0MDcyM3V4MjcwMDR1eDIxMzA2LHV4Mjc0OTF1eDIyODIzLHV4MjAwMTN1eDM2MzM1LHV4MjQxOTF1eDIyMzMwLHV4NDl1eDU0dXg1MHV4NTEsdXg0MDcyM3V4MjcwMDR1eDIxMzA2dXgyMDExNnV4MTk5Njh1eDIwMDEzdXgzNjMzNXV4NDl1eDU2dXgyMTQ5NXV4Mjc0OTF1eDIyODIzdXgyNDE5MXV4MjIzMzB1eDI0NDgxdXgyNjIyM3V4MjE0ODh1eDQ5dXg1NHV4NTB1eDUxLHV4MjE0ODh1eDI3NzQzdXgyMTMwNix1eDIwODQ1dXgxOTk2OHV4MjAwMTN1eDM2MzM1LHV4MjYxODd1eDIzNDMzdXgyMTMwNix1eDI5NTc5dXgyNDE5NnV4MjYwMzJ1eDI2NDQ5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjE0Nzoi56aP5bu6LOemj+W3nizpvJPmpbzljLos5q2j5aSnLOS4rei3ryzlub/lnLosMTYyMyzpvJPmpbzljLrkupTkuIDkuK3ot68xOOWPt+ato+Wkp+W5v+WcuuW+oeaZr+WPsDE2MjMs5Y+w5rGf5Yy6LOWFreS4gOS4rei3ryzmmYvlronljLos546L5bqE5paw5p2RIjtzOjk6InRhZ19tYXRjaCI7czowOiIiO3M6MTM6InRhZ19tYXRjaF9yb3ciO3M6MDoiIjtzOjY6Inhwb2ludCI7czoxMDoiMTE5LjMxNzA3MSI7czo2OiJ5cG9pbnQiO3M6OToiMjYuMDgxNDM0IjtzOjg6ImJyYW5kX2lkIjtzOjE6IjAiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMjoicHVibGlzaF93YWl0IjtzOjE6IjAiO3M6MTA6ImFjY291bnRfaWQiO3M6MToiMCI7czoxMjoiaXNfcmVjb21tZW5kIjtzOjE6IjEiO3M6MTM6ImJhbGFuY2VfcHJpY2UiO3M6ODoiNzAwLjAwMDAiO3M6OToiaXNfcmVmdW5kIjtzOjE6IjEiO3M6MTA6ImF1dG9fb3JkZXIiO3M6MToiMCI7czoxMzoiZXhwaXJlX3JlZnVuZCI7czoxOiIxIjtzOjEwOiJhbnlfcmVmdW5kIjtzOjE6IjEiO3M6MTA6Im11bHRpX2F0dHIiO3M6MToiMCI7czo4OiJkZWFsX3RhZyI7czoyOiI5NiI7czo4OiJkcF9jb3VudCI7czoxOiIwIjtzOjU6Im5vdGVzIjtzOjI1NToiPGR0IGlkPSJ5dWlfM18xNl8wXzFfMTQyNDg1MTkwOTk4M18xMzkwIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQ7Ym9yZGVyLXRvcDojZWVlZWVlIDFweCBzb2xpZDt3aWR0aDoxNDBweDt3aGl0ZS1zcGFjZTpwcmUtd3JhcDt3b3JkLXNwYWNpbmc6MHB4O3RleHQtdHJhbnNmb3JtOm5vbmU7d29yZC1icmVhazpicmVhay1hbGw7ZmxvYXQ6bGVmdDtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjhweDt0ZXh0LWFsaWduOmxlZnQ7cGFkZGluIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czozOiJ1cmwiO3M6MzM6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1kZWFsJmFjdD02NSI7czoxNzoiYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjE1OiJlbmRfdGltZV9mb3JtYXQiO3M6MDoiIjtzOjI0OiJjb3Vwb25fYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjIyOiJjb3Vwb25fZW5kX3RpbWVfZm9ybWF0IjtzOjA6IiI7czoxOToib3JpZ2luX3ByaWNlX2Zvcm1hdCI7czo4OiImeWVuOzgzOCI7czoyMDoiY3VycmVudF9wcmljZV9mb3JtYXQiO3M6ODoiJnllbjs3NTgiO3M6MTk6InN1Y2Nlc3NfdGltZV9mb3JtYXQiO3M6MTk6IjIwMTUtMDItMjUgMTY6MTQ6NDEiO3M6MTA6InNhdmVfcHJpY2UiO2Q6ODA7czoxNzoic2F2ZV9wcmljZV9mb3JtYXQiO3M6NzoiJnllbjs4MCI7czoxNjoiZGVhbF9zdWNjZXNzX251bSI7czozMDoiPHN0cm9uZz4wPC9zdHJvbmc+5Lq65bey6LSt5LmwIjtzOjE0OiJjdXJyZW50X2JvdWdodCI7czoxOiIwIjtzOjEzOiJzdXBwbGllcl9pbmZvIjthOjM5OntzOjI6ImlkIjtzOjI6IjMxIjtzOjQ6Im5hbWUiO3M6MTU6IuWbvemZheaXheihjOekviI7czo3OiJwcmV2aWV3IjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNS81NGVkODBiZjY0YmE2LmpwZyI7czo3OiJjb250ZW50IjtzOjA6IiI7czo0OiJzb3J0IjtzOjE6IjAiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjAiO3M6NzoiY2l0eV9pZCI7czoxOiIwIjtzOjEwOiJuYW1lX21hdGNoIjtzOjcyOiJ1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMjI2OXV4Mzg0NjksdXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjMyOiLml4XooYznpL4s5Zu96ZmFLOWbvemZheaXheihjOekviI7czo5OiJiYW5rX2luZm8iO3M6MjM6IjYyMjggNDgwMCA2MzA0IDI5NjUgNDE2IjtzOjU6Im1vbmV5IjtzOjY6IjAuMDAwMCI7czoxMDoic2FsZV9tb25leSI7czo2OiIwLjAwMDAiO3M6MTA6ImxvY2tfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEzOiJiYWxhbmNlX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmVmdW5kX21vbmV5IjtzOjY6IjAuMDAwMCI7czo4OiJ3ZF9tb25leSI7czo2OiIwLjAwMDAiO3M6OToiYmFua19uYW1lIjtzOjI0OiLlhpzkuJrpk7booYznpo/lt57liIbooYwiO3M6OToiYmFua191c2VyIjtzOjk6IumZiOemj+adgyI7czoxMDoiZHBfY291bnRfMSI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF8yIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzMiO3M6MToiMCI7czoxMDoiZHBfY291bnRfNCI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF81IjtzOjE6IjAiO3M6ODoiZHBfY291bnQiO3M6MToiMCI7czo5OiJhdmdfcG9pbnQiO3M6NjoiMC4wMDAwIjtzOjExOiJ0b3RhbF9wb2ludCI7czoxOiIwIjtzOjEzOiJ0b3RhbF9wb2ludF8xIjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF8xIjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfMiI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfMiI7czo2OiIwLjAwMDAiO3M6MTM6InRvdGFsX3BvaW50XzMiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzMiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF80IjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF80IjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfNSI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfNSI7czo2OiIwLjAwMDAiO3M6NjoiaF9uYW1lIjtzOjE1OiLlm73pmYXml4XooYznpL4iO3M6NzoiaF9mYXJlbiI7czo5OiLpmYjnpo/mnYMiO3M6NToiaF90ZWwiO3M6MTM6IjA1OTEtODg2MDA4MzEiO31zOjIzOiJzdXBwbGllcl9sb2NhdGlvbl9jb3VudCI7czoxOiIxIjtzOjk6ImRlYWxfYXR0ciI7YTowOnt9czoyMDoiZGVhbF9hdHRyX3N0b2NrX2pzb24iO3M6MjoiW10iO3M6OToic2hhcmVfdXJsIjtzOjU3OiJodHRwOi8vd3d3LmZhbndldG91ci5jb20vbzJvbmV3L2luZGV4LnBocD9jdGw9ZGVhbCZhY3Q9NjUiO3M6OToiZGVhbF90YWdzIjthOjI6e2k6MDtpOjU7aToxO2k6Njt9fX0=\";s:10:\"daren_page\";s:0:\"\";s:8:\"group_id\";s:1:\"0\";s:6:\"is_top\";s:1:\"0\";s:7:\"is_best\";s:1:\"0\";s:7:\"op_memo\";s:0:\"\";s:9:\"last_time\";s:1:\"0\";s:12:\"last_user_id\";s:1:\"0\";s:10:\"cate_match\";s:0:\"\";s:14:\"cate_match_row\";s:0:\"\";s:17:\"origin_topic_data\";s:0:\"\";s:12:\"images_count\";s:1:\"1\";s:10:\"image_list\";s:321:\"a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"144\";s:4:\"name\";s:38:\"a09bc02d6b7e791f31c69b78b337abba33.jpg\";}}\";s:9:\"is_cached\";s:1:\"0\";s:16:\"topic_group_data\";s:4:\"b:0;\";s:6:\"images\";a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"144\";s:4:\"name\";s:38:\"a09bc02d6b7e791f31c69b78b337abba33.jpg\";}}}','0','a:0:{}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('206','','','【经典回顾】：奇幻精灵历险记','1424831452','share','71','fanwe','1','0','0','206','0','0','0','0','0','','','','0','share','0','0','','','ux32463ux20856ux22238ux39038,ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789','经典回顾,历险记,奇幻,精灵','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"251\";s:2:\"id\";s:3:\"155\";s:4:\"name\";s:38:\"52ffbe9fa4d1d960db5ed6fb4dd41ec676.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563.jpg\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:3:\"852\";s:2:\"id\";s:3:\"154\";s:4:\"name\";s:38:\"4c5971b0370e739c71ea9d0f5e2e35e257.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"891\";s:2:\"id\";s:3:\"153\";s:4:\"name\";s:38:\"2bb1fba7bd9e10b01fea8a248d15129213.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('207','','','【经典回顾】：电影星尘','1424831511','share','71','fanwe','1','0','0','207','0','0','0','0','0','','','','0','share','0','0','','','ux32463ux20856ux22238ux39038,ux24433ux26143','经典回顾,影星','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"885\";s:2:\"id\";s:3:\"156\";s:4:\"name\";s:38:\"a69a84427dd071df105eeb4bdf3f537a69.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('208','','','电影-奇幻精灵历险记','1424831593','share','71','fanwe','1','0','0','208','1','1','0','0','0','','','','0','share','0','0','','','ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789,ux30005ux24433','历险记,奇幻,精灵,电影','','','','0','1','0','网站','','','','0','0','0','','1424892621','71','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"400\";s:2:\"id\";s:3:\"157\";s:4:\"name\";s:38:\"347ba3d76c8cd114c26edd0097f657f168.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('209','','','上菜太慢，其他的都很好。','1424891284','dealcomment','71','fanwe','1','0','0','209','0','0','0','0','0','index','deal#57','','0','share','0','0','','','ux19978ux33756,ux20854ux20182','上菜,其他','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','4','a:4:{i:0;a:6:{s:4:\"path\";s:50:\"./public/attachment/201502/25/14/54ed67b2cd14b.jpg\";s:6:\"o_path\";s:50:\"./public/attachment/201502/25/14/54ed67b2cd14b.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"161\";s:4:\"name\";s:32:\"88元桥亭活鱼小镇代金券\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"160\";s:4:\"name\";s:23:\"__49606321__2635650.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg\";s:5:\"width\";s:3:\"640\";s:6:\"height\";s:3:\"426\";s:2:\"id\";s:3:\"159\";s:4:\"name\";s:23:\"__49606066__3756642.jpg\";}i:3;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg\";s:5:\"width\";s:3:\"640\";s:6:\"height\";s:3:\"961\";s:2:\"id\";s:3:\"158\";s:4:\"name\";s:23:\"__49606066__3081862.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('210','','边境牧羊幼犬寻找主人','小狗照.jpg 边境牧羊幼犬寻找主人  本窝出于2014年12月27号出生，现剩1母接受预定，小狗带出生纸，支持淘宝交易。小狗妈妈：蓝妹妹（父系：兰登为金牧阳光犬业的当家种公，体内含有丰富的颜色基因，曾繁殖出黄白，丁香，蓝白等颜色。曾在幼年时期获BBIS4 ，成年后获得 NGKC 最佳公犬 的赏励；蓝妹妹母亲：Quintina（丁香色）系出名门，为美国、墨西哥，两国登陆冠军 至尊红魔直女，其外公为美国登陆冠军陨石神话。Quintina NGKC南宁站--后备最佳母犬。） 狗爸爸：盖德 （泰戈儿子）广东省潮州市龙翔犬舍 ：专注边境牧羊犬繁殖 ， 所售幼犬都已注射疫苗，经过驱虫处理，保证小狗健康成长。欢迎周边朋友实地看狗，交流心得。','1424893353','share','71','fanwe','1','0','0','210','0','0','0','0','0','','','','0','share','0','0','','','ux29287ux32650,ux36793ux22659,ux20027ux20154,ux23547ux25214,ux36793ux22659ux29287ux32650ux24188ux29356ux23547ux25214ux20027ux20154,ux23567ux29399,ux21335ux23425ux31449,ux20848ux30331,ux32654ux22269,ux32321ux27542,ux34013ux30333,ux40857ux32724,ux19969ux39321,ux28526ux24030ux24066','牧羊,边境,主人,寻找,边境牧羊幼犬寻找主人,小狗,南宁站,兰登,美国,繁殖,蓝白,龙翔,丁香,潮州市','','','牧羊 边境 主人 寻找 边境牧羊幼犬寻找主人','1','0','0','网站','','','','3','0','0','','0','0','','','','0','a:0:{}','0','a:12:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:12:\"跳蚤市场\";s:4:\"memo\";s:54:\"有钱的，没钱的，路过，瞧一瞧，看一看\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893197\";s:7:\"cate_id\";s:1:\"6\";s:10:\"user_count\";s:1:\"0\";s:11:\"topic_count\";s:1:\"2\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/d57ae1aedaf872522f76516c339d6f2665.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/11/54ee96519f63a.gif\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('211','','搬家空调转手','因为年后要搬家，原来的租的房间没有装空调，空调用了2个夏天还很新，没有故障维修过，发票保修卡等证件都在，小天鹅的老牌子，单冷1.25匹，对于十来平的房间非常好用，晚上也没有噪音，但是拆装费需要自理，特价转手，有意者请联系我，最低价格议价勿扰，谢谢。','1424893442','share','71','fanwe','1','0','0','211','0','0','0','0','0','','','','0','share','0','0','','','ux36716ux25163,ux25644ux23478,ux31354ux35843,ux25644ux23478ux31354ux35843ux36716ux25163,ux27809ux26377,ux23567ux22825ux40517,ux21333ux20919,ux21313ux26469,ux32769ux29260ux23376,ux25151ux38388,ux22909ux29992,ux20445ux20462ux21345,ux35758ux20215','转手,搬家,空调,搬家空调转手,没有,小天鹅,单冷,十来,老牌子,房间,好用,保修卡,议价','','','转手 搬家 空调 搬家空调转手','1','0','0','网站','','','','3','0','0','','0','0','','','','0','a:0:{}','0','a:12:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:12:\"跳蚤市场\";s:4:\"memo\";s:54:\"有钱的，没钱的，路过，瞧一瞧，看一看\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893197\";s:7:\"cate_id\";s:1:\"6\";s:10:\"user_count\";s:1:\"0\";s:11:\"topic_count\";s:1:\"2\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/d57ae1aedaf872522f76516c339d6f2665.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/11/54ee96519f63a.gif\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('212','报名参加了玛格利塔新店开业试吃','','报名参加了玛格利塔新店开业试吃 - 玛格利塔新店开业试吃','1424894337','eventsubmit','71','fanwe','1','0','0','212','0','0','0','0','0','index','event#2','','0','share','0','0','','','ux21033ux22612,ux26032ux24215,ux29595ux26684,ux24320ux19994,ux21442ux21152,ux25253ux21517,ux25253ux21517ux21442ux21152ux20102ux29595ux26684ux21033ux22612ux26032ux24215ux24320ux19994ux35797ux21507','利塔,新店,玛格,开业,参加,报名,报名参加了玛格利塔新店开业试吃','','','','0','0','0','网站','','','','0','0','0','','0','0','','','','0','a:0:{}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('213','','','','1424906566','share','72','fz云淡风轻','1','0','208','208','0','0','0','0','0','','','','0','share','0','0','','','','','','','','0','0','0','网站','','','','0','0','0','','0','0','','','a:52:{s:2:\"id\";s:3:\"208\";s:5:\"title\";s:0:\"\";s:11:\"forum_title\";s:0:\"\";s:7:\"content\";s:28:\"电影-奇幻精灵历险记\";s:11:\"create_time\";s:10:\"1424831593\";s:4:\"type\";s:5:\"share\";s:7:\"user_id\";s:2:\"71\";s:9:\"user_name\";s:5:\"fanwe\";s:9:\"is_effect\";s:1:\"1\";s:9:\"is_delete\";s:1:\"0\";s:8:\"relay_id\";s:1:\"0\";s:9:\"origin_id\";s:3:\"208\";s:11:\"reply_count\";s:1:\"1\";s:11:\"relay_count\";s:1:\"1\";s:10:\"good_count\";s:1:\"0\";s:9:\"bad_count\";s:1:\"0\";s:11:\"click_count\";s:1:\"0\";s:13:\"rel_app_index\";s:0:\"\";s:9:\"rel_route\";s:0:\"\";s:9:\"rel_param\";s:0:\"\";s:10:\"message_id\";s:1:\"0\";s:11:\"topic_group\";s:5:\"share\";s:6:\"fav_id\";s:1:\"0\";s:9:\"fav_count\";s:1:\"0\";s:15:\"user_name_match\";s:0:\"\";s:19:\"user_name_match_row\";s:0:\"\";s:13:\"keyword_match\";s:66:\"ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789,ux30005ux24433\";s:17:\"keyword_match_row\";s:30:\"历险记,奇幻,精灵,电影\";s:6:\"xpoint\";s:0:\"\";s:6:\"ypoint\";s:0:\"\";s:4:\"tags\";s:0:\"\";s:12:\"is_recommend\";s:1:\"0\";s:9:\"has_image\";s:1:\"1\";s:11:\"source_type\";s:1:\"0\";s:11:\"source_name\";s:6:\"网站\";s:10:\"source_url\";s:0:\"\";s:10:\"group_data\";s:0:\"\";s:10:\"daren_page\";s:0:\"\";s:8:\"group_id\";s:1:\"0\";s:6:\"is_top\";s:1:\"0\";s:7:\"is_best\";s:1:\"0\";s:7:\"op_memo\";s:0:\"\";s:9:\"last_time\";s:10:\"1424892621\";s:12:\"last_user_id\";s:2:\"71\";s:10:\"cate_match\";s:0:\"\";s:14:\"cate_match_row\";s:0:\"\";s:17:\"origin_topic_data\";s:0:\"\";s:12:\"images_count\";s:1:\"1\";s:10:\"image_list\";s:319:\"a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"400\";s:2:\"id\";s:3:\"157\";s:4:\"name\";s:38:\"347ba3d76c8cd114c26edd0097f657f168.jpg\";}}\";s:9:\"is_cached\";s:1:\"1\";s:16:\"topic_group_data\";s:4:\"b:0;\";s:6:\"images\";a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"400\";s:2:\"id\";s:3:\"157\";s:4:\"name\";s:38:\"347ba3d76c8cd114c26edd0097f657f168.jpg\";}}}','0','a:0:{}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('214','','恶犬BRONSON复刻L2B空军飞行员夹克MA1男士军款短装休闲夹克L-2B','[url]8[/url]','1424906767','share','72','fz云淡风轻','1','0','0','214','0','0','0','0','0','','','','0','share','0','0','','','ux22841ux20811,ux30701ux35013,ux39134ux34892ux21592,ux31354ux20891,ux117ux114ux108','夹克,短装,飞行员,空军,url','','','夹克 短装 飞行员 空军','1','1','0','网站','','','','5','0','0','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539.jpg\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"398\";s:2:\"id\";s:3:\"164\";s:4:\"name\";s:44:\"TB23zijaFXXXXbvXpXXXXXXXXXX_!!1795832420.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62.jpg\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"405\";s:2:\"id\";s:3:\"163\";s:4:\"name\";s:44:\"TB23jGwaFXXXXabXXXXXXXXXXXX_!!1795832420.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81.jpg\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"379\";s:2:\"id\";s:3:\"162\";s:4:\"name\";s:44:\"TB2mq1oaFXXXXXhXpXXXXXXXXXX_!!1795832420.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"1\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('215','','风光无限好','[哈哈]','1424906940','share','72','fz云淡风轻','1','0','0','215','0','0','0','0','0','','','','0','share','0','0','','','ux39118ux20809ux26080ux38480,ux39118ux20809ux26080ux38480ux22909,ux21704ux21704','风光无限,风光无限好,哈哈','','','风光无限 风光无限好','1','1','0','网站','','','','4','0','0','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85.jpg\";s:5:\"width\";s:4:\"2560\";s:6:\"height\";s:4:\"1600\";s:2:\"id\";s:3:\"167\";s:4:\"name\";s:19:\"201292116218453.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968.jpg\";s:5:\"width\";s:4:\"2560\";s:6:\"height\";s:4:\"1600\";s:2:\"id\";s:3:\"166\";s:4:\"name\";s:26:\"12116408_1340605908112.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32.jpg\";s:5:\"width\";s:3:\"650\";s:6:\"height\";s:3:\"487\";s:2:\"id\";s:3:\"165\";s:4:\"name\";s:16:\"29b1OOOPIC90.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"1\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('216','','黄山行','自助游-黄山','1424907077','share','71','fanwe','1','0','0','216','0','0','0','0','0','','','','0','share','0','0','','','ux23665ux34892,ux40644ux23665ux34892,ux40644ux23665,ux33258ux21161ux28216','山行,黄山行,黄山,自助游','','','山行 黄山行','1','1','0','网站','','','','4','0','1','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15.jpg\";s:5:\"width\";s:4:\"2126\";s:6:\"height\";s:4:\"1253\";s:2:\"id\";s:3:\"170\";s:4:\"name\";s:34:\"userid329500time20120523234840.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231.jpg\";s:5:\"width\";s:4:\"1000\";s:6:\"height\";s:3:\"667\";s:2:\"id\";s:3:\"169\";s:4:\"name\";s:34:\"userid220060time20130305031808.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42.jpg\";s:5:\"width\";s:4:\"1600\";s:6:\"height\";s:4:\"1200\";s:2:\"id\";s:3:\"168\";s:4:\"name\";s:36:\"f45930c0226d0d1380b1e408db196a02.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"2\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('217','','','范冰冰同款黑色大檐羊毛礼帽','1424907181','share','71','fanwe','1','0','0','217','0','0','0','0','0','','','','0','share','0','0','','','ux31036ux24125,ux32650ux27611,ux33539ux20912ux20912,ux40657ux33394','礼帽,羊毛,范冰冰,黑色','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24.jpg\";s:5:\"width\";s:3:\"468\";s:6:\"height\";s:3:\"702\";s:2:\"id\";s:3:\"171\";s:4:\"name\";s:59:\"90b11_ieydanbrmi3geylemmytambqgyyde_640x960.jpg_468x468.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('218','','','韩系浅浅的马卡龙色系搭配赫本感的半身裙，怎么穿都很经典','1424907247','share','71','fanwe','1','0','0','218','0','0','0','0','0','','','','0','share','0','0','','','ux33394ux31995,ux21322ux36523,ux27973ux27973,ux25645ux37197,ux32463ux20856,ux24590ux20040,ux39532ux21345ux40857,ux36203ux26412ux24863,ux38889ux31995','色系,半身,浅浅,搭配,经典,怎么,马卡龙,赫本感,韩系','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"172\";s:4:\"name\";s:47:\"by27i_ieydenrqgaywemtdmqytambqmmyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('219','','','韩系牛仔衣，包包鞋子也是打造帅气的必备单品哦','1424907366','share','71','fanwe','1','0','0','219','0','0','0','0','0','','','','0','share','0','0','','','ux21253ux21253,ux24069ux27668,ux38795ux23376,ux24517ux22791,ux29275ux20180,ux25171ux36896,ux38889ux31995','包包,帅气,鞋子,必备,牛仔,打造,韩系','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"173\";s:4:\"name\";s:48:\"151lem_ieydkmrxgm4dcnjvmqytambqmeyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('220','','','电影-博物馆奇妙夜3','1424907447','share','71','fanwe','1','0','0','220','0','0','0','0','0','','','','0','share','0','0','','','ux21338ux29289ux39302,ux22855ux22937,ux30005ux24433','博物馆,奇妙,电影','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161.jpg\";s:5:\"width\";s:3:\"416\";s:6:\"height\";s:3:\"600\";s:2:\"id\";s:3:\"174\";s:4:\"name\";s:10:\"medish.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('221','','2015年杨子姗陈柏霖爱情电影《重返20岁》','2015年杨子姗陈柏霖爱情电影《重返20岁》','1424907522','share','71','fanwe','1','0','0','221','0','0','0','0','0','','','','0','share','0','0','','','ux26472ux23376,ux38472ux26575,ux37325ux36820,ux29233ux24773,ux30005ux24433,ux50ux48ux49ux53','杨子,陈柏,重返,爱情,电影,2015','','','杨子 陈柏 重返 爱情','1','1','0','网站','','','','5','1','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259.jpg\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"600\";s:2:\"id\";s:3:\"175\";s:4:\"name\";s:21:\"a41fbe2f275be88es.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"2\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('222','','摄影作品分享','摄影作品分享','1424908951','share','71','fanwe','1','0','0','222','0','0','0','0','0','','','','0','share','0','0','','','ux25668ux24433ux20316ux21697,ux20998ux20139,ux25668ux24433ux20316ux21697ux20998ux20139','摄影作品,分享,摄影作品分享','','','摄影作品 分享 摄影作品分享','1','1','0','网站','','','','5','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677.jpg\";s:5:\"width\";s:3:\"580\";s:6:\"height\";s:3:\"870\";s:2:\"id\";s:3:\"176\";s:4:\"name\";s:36:\"20120411165042_8jJYr.thumb.600_0.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"3\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('223','','摄影作品分享','摄影作品分享','1424909033','share','71','fanwe','1','0','0','223','0','0','0','0','0','','','','0','share','0','0','','','ux25668ux24433ux20316ux21697,ux20998ux20139,ux25668ux24433ux20316ux21697ux20998ux20139','摄影作品,分享,摄影作品分享','','','摄影作品 分享 摄影作品分享','1','1','0','网站','','','','4','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31.jpg\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";s:2:\"id\";s:3:\"177\";s:4:\"name\";s:12:\"Penguins.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"3\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('224','','水母','水母','1424909053','share','71','fanwe','1','0','0','224','0','0','0','0','0','','','','0','share','0','0','','','ux27700ux27597','水母','','','水母 水母','1','1','0','网站','','','','4','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797.jpg\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";s:2:\"id\";s:3:\"178\";s:4:\"name\";s:13:\"Jellyfish.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"4\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('225','','清新文艺范格子来袭，一款百搭甜美的长袖连衣裙，清新的格子元素，素雅干净。单穿打底都适合','清新文艺范格子来袭，一款百搭甜美的长袖连衣裙，清新的格子元素，素雅干净。单穿打底都适合','1424909140','share','71','fanwe','1','0','0','225','0','0','0','0','0','','','','0','share','0','0','','','ux23376ux26469,ux28165ux26032,ux25171ux24213,ux32654ux30340,ux32032ux38597,ux36830ux34915ux35033,ux38271ux34966,ux26684ux23376,ux25991ux33402,ux20803ux32032','子来,清新,打底,美的,素雅,连衣裙,长袖,格子,文艺,元素','','','子来 清新 打底 美的','1','1','0','网站','','','','5','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"179\";s:4:\"name\";s:48:\"1cikuu_ieydszrxgjrdozjxmmytambqgiyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"4\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('226','','格子总能体现复古情怀，姜黄色外套和橘红的帽子呼应了整体的温暖大地色调～','格子总能体现复古情怀，姜黄色外套和橘红的帽子呼应了整体的温暖大地色调～','1424909177','share','71','fanwe','1','0','0','226','0','0','0','0','0','','','','0','share','0','0','','','ux27224ux32418,ux21628ux24212,ux26684ux23376,ux33394ux35843,ux22797ux21476,ux22806ux22871,ux24635ux33021,ux24125ux23376,ux24773ux24576,ux40644ux33394','橘红,呼应,格子,色调,复古,外套,总能,帽子,情怀,黄色','','','橘红 呼应 格子 色调','1','1','0','网站','','','','5','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"180\";s:4:\"name\";s:48:\"151lem_ieydozbxhbrwiztdmmytambqmeyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('227','','撞色撞出鲜亮活泼style～','撞色撞出鲜亮活泼style～','1424909207','share','71','fanwe','1','0','0','227','0','0','0','0','0','','','','0','share','0','0','','','ux40092ux20142,ux27963ux27900,ux115ux116ux121ux108ux101,ux25758ux33394ux25758ux20986ux40092ux20142ux27963ux27900ux115ux116ux121ux108ux101ux65374,ux25758ux33394ux25758ux20986ux40092ux20142ux27963ux27900ux115ux116ux121ux108ux101ux65374,ux25758ux33394ux25758ux20986ux40092ux20142ux27963ux27900ux115ux116ux121ux108ux101ux65374','鲜亮,活泼,style,撞色撞出鲜亮活泼style～,撞色撞出鲜亮活泼style～,撞色撞出鲜亮活泼style～','','','鲜亮 活泼 style 撞色撞出鲜亮活泼style～','1','1','0','网站','','','./public/attachment/201502/26/16/54eed629217dc.jpg','5','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/f71f019325289d8e091671964724687a67_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/f71f019325289d8e091671964724687a67.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"181\";s:4:\"name\";s:48:\"151lem_ieydimjshftgmnrymmytambqmeyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"6\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('228','','经典的黑白条纹套装，搭配出都市上班族的利落来吧','经典的黑白条纹套装，搭配出都市上班族的利落来吧','1424909240','share','71','fanwe','1','0','0','228','0','0','0','0','0','','','','0','share','0','0','','','ux21033ux33853,ux26465ux32441,ux19978ux29677ux26063,ux26469ux21543,ux22871ux35013,ux40657ux30333,ux25645ux37197,ux32463ux20856,ux37117ux24066','利落,条纹,上班族,来吧,套装,黑白,搭配,经典,都市','','','利落 条纹 上班族 来吧','1','1','0','网站','','','','5','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"182\";s:4:\"name\";s:48:\"151zqx_ieygcolbha3demzwmmytambqgyyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"7\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('229','','沙漠风光','沙漠风光','1424909588','share','72','fz云淡风轻','1','0','0','229','0','0','0','0','0','','','','0','share','0','1','','','ux27801ux28448,ux39118ux20809,ux27801ux28448ux39118ux20809','沙漠,风光,沙漠风光','','','沙漠 风光 沙漠风光','1','1','0','网站','','','','4','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979.jpg\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";s:2:\"id\";s:3:\"183\";s:4:\"name\";s:10:\"Desert.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('230','','','','1424909630','share','71','fanwe','1','0','0','229','0','0','0','0','0','','','','0','share','229','0','','','','','','','','0','0','0','网站','','','','0','0','0','','0','0','','','','0','','0','');
INSERT INTO `%DB_PREFIX%topic` VALUES ('231','','','美食-牛排','1424910181','share','71','fanwe','1','0','0','231','0','0','0','0','0','','','','0','share','0','0','','','ux29275ux25490,ux32654ux39135','牛排,美食','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86.jpg\";s:5:\"width\";s:3:\"640\";s:6:\"height\";s:3:\"427\";s:2:\"id\";s:3:\"184\";s:4:\"name\";s:23:\"__36578586__4587290.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('232','','','格纹韩系连衣裙＋气质毛呢外套，优雅复古不言而喻','1424910321','share','71','fanwe','1','0','0','232','0','0','0','0','0','','','','0','share','0','0','','','ux27611ux21602,ux19981ux35328ux32780ux21947,ux36830ux34915ux35033,ux22797ux21476,ux22806ux22871,ux20248ux38597,ux27668ux36136,ux38889ux31995','毛呢,不言而喻,连衣裙,复古,外套,优雅,气质,韩系','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"185\";s:4:\"name\";s:48:\"1a24yv_ieydkzbsmzsgiyjvmmytambqgiyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('233','','','韩系-运动风也能很Chic！运动卫衣搭配波点包裙，谁说不能有小小女人味呢~','1424910378','share','71','fanwe','1','0','0','233','0','0','0','0','0','','','','0','share','0','0','','','ux22899ux20154ux21619,ux36816ux21160,ux25645ux37197,ux23567ux23567,ux19981ux33021,ux21253ux35033ux65292,ux21355ux34915,ux38889ux31995,ux67ux104ux105ux99','女人味,运动,搭配,小小,不能,包裙，,卫衣,韩系,Chic','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"186\";s:4:\"name\";s:48:\"18eokr_ieydgmdemi4gkojtmmytambqmmyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('234','','','韩系-宝蓝色的欧美简约风衣＋千鸟格打底裤，很率性的一套搭配。','1424910847','share','71','fanwe','1','0','0','234','0','0','0','0','0','','','','0','share','0','0','','','ux23453ux34013ux33394,ux25171ux24213,ux29575ux24615,ux39118ux34915,ux31616ux32422,ux25645ux37197,ux27431ux32654,ux38889ux31995','宝蓝色,打底,率性,风衣,简约,搭配,欧美,韩系','','','宝蓝色 打底 率性 风衣','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"187\";s:4:\"name\";s:48:\"1a24yv_ieygiyrsgi2tsyrtmmytambqgyyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('235','','','韩系看似old-fashioned的【背带裤】，在初秋又成为流行单品。轻松打造出或犀利叛逆或随性自由的街头形象，充满了年轻和浪漫的情致。','1424911387','share','71','fanwe','1','0','0','235','0','0','0','0','0','','','','0','share','0','0','','','ux32972ux24102ux35044,ux24773ux33268,ux21021ux31179,ux29312ux21033,ux21467ux36870,ux102ux97ux115ux104ux105ux111ux110ux101ux100,ux30475ux20284,ux20805ux28385,ux34903ux22836,ux24418ux35937','背带裤,情致,初秋,犀利,叛逆,fashioned,看似,充满,街头,形象','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"188\";s:4:\"name\";s:48:\"1cikuv_ieydcobzha2genbtmmytambqgiyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('236','','','韩系-卖萌减龄背带裤，甜美有范半身牛仔裙，个性十足牛仔裤，帅气百搭牛仔外套，应有尽有，简单又不失潮范儿，总有一款适合菇凉你','1424911476','share','71','fanwe','1','0','0','236','0','0','0','0','0','','','','0','share','0','0','','','ux32972ux24102ux35044,ux29275ux20180ux35033,ux24212ux26377ux23613ux26377,ux21322ux36523,ux29275ux20180ux35044,ux19981ux22833,ux24069ux27668,ux22806ux22871,ux29980ux32654,ux29275ux20180','背带裤,牛仔裙,应有尽有,半身,牛仔裤,不失,帅气,外套,甜美,牛仔','','','','0','1','0','网站','','','','0','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"189\";s:4:\"name\";s:48:\"1cikuv_ieydozdfgy4genbtmmytambqgyyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('237','','','清新文艺复古范儿，秋款连衣裙搭配短靴就可以了','1424911632','share','71','fanwe','1','0','0','237','0','0','0','0','0','','','','0','share','0','0','','','ux30701ux38772,ux36830ux34915ux35033,ux22797ux21476,ux25991ux33402,ux28165ux26032,ux25645ux37197,ux21487ux20197,ux33539ux20799ux65292','短靴,连衣裙,复古,文艺,清新,搭配,可以,范儿，','','','','0','1','0','网站','','','','0','0','0','','0','0','ux20241ux38386ux23089ux20048,ux37117ux24066ux36141ux29289','休闲娱乐,都市购物','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"190\";s:4:\"name\";s:48:\"151lem_ieydaojqgm3wmzbvmmytambqgyyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('238','','','独特的纯色设计风衣，低调内涵，是今秋流行款。','1424912286','share','71','fanwe','1','0','0','238','0','0','0','0','0','','','','0','share','0','0','','','ux20170ux31179,ux32431ux33394,ux39118ux34915,ux20302ux35843,ux20869ux28085,ux29420ux29305,ux27969ux34892,ux35774ux35745','今秋,纯色,风衣,低调,内涵,独特,流行,设计','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"191\";s:4:\"name\";s:48:\"1527j2_ieydcztega2ggzrsmmytambqmmyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('239','','','水蓝×暖橘，绚丽的配色绝对吸引人们的眼球，却显得不落俗套很有品。','1424912308','share','71','fanwe','1','0','0','239','0','0','0','0','0','','','','0','share','0','0','','','ux19981ux33853ux20439ux22871,ux37197ux33394,ux30524ux29699,ux32474ux20029,ux26174ux24471,ux20154ux20204,ux21560ux24341,ux32477ux23545,ux34013ux215ux26262','不落俗套,配色,眼球,绚丽,显得,人们,吸引,绝对,蓝×暖','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"192\";s:4:\"name\";s:48:\"1527j2_ieygeztfgyygezrsmmytambqhayde_550x620.jpg\";}}','0','b:0;');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_cate_link`;
CREATE TABLE `%DB_PREFIX%topic_cate_link` (
  `topic_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享与分享分类的关联表';
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('237','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('237','4');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_group`;
CREATE TABLE `%DB_PREFIX%topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '小组名称',
  `memo` text NOT NULL COMMENT '小组说明',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `cate_id` int(11) NOT NULL COMMENT '所属小组分类ID',
  `user_count` int(11) NOT NULL COMMENT '组员数量',
  `topic_count` int(11) NOT NULL COMMENT '贴子总数',
  `icon` varchar(255) NOT NULL COMMENT '小组图标',
  `image` varchar(255) NOT NULL COMMENT '小组大图',
  `is_effect` tinyint(1) NOT NULL COMMENT '是否验证通过',
  `user_id` int(11) NOT NULL COMMENT '组长ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='小组（论坛）版块表';
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('3','跳蚤市场','有钱的，没钱的，路过，瞧一瞧，看一看','0','1424893197','6','1','2','./public/attachment/201502/26/11/d57ae1aedaf872522f76516c339d6f2665.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('4','摄影爱好者','切磋摄影技巧，晒晒片子','0','1424893817','7','2','5','./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('5','时尚消费','分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得','0','1424893958','7','2','7','./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('6','求职招聘','免费、可靠的招聘求职论坛','0','1424894081','6','1','0','./public/attachment/201502/26/11/c578ea62933a6016a3ce05fd576715f570.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_group_cate`;
CREATE TABLE `%DB_PREFIX%topic_group_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL COMMENT '排序大到小',
  `icon` varchar(255) NOT NULL COMMENT '弃用',
  `group_count` int(11) NOT NULL COMMENT '分类下的小组量数',
  `is_effect` tinyint(1) NOT NULL COMMENT '分类是否显示 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='小组分类表';
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('4','跳蚤市场','1','','0','1');
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('5','摄影','2','','0','1');
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('6','推荐小组','3','','0','1');
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('7','热门小组','4','','0','1');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_image`;
CREATE TABLE `%DB_PREFIX%topic_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL COMMENT '主题ID',
  `name` varchar(255) NOT NULL COMMENT '文件名',
  `filesize` int(11) NOT NULL COMMENT '文件大小',
  `create_time` int(11) NOT NULL COMMENT '上传时间',
  `user_id` int(11) NOT NULL COMMENT '所属会员ID',
  `user_name` varchar(255) NOT NULL COMMENT '所属会员名',
  `path` varchar(255) NOT NULL COMMENT '小图路径',
  `topic_table` varchar(255) NOT NULL COMMENT '主题表名',
  `o_path` varchar(255) NOT NULL COMMENT '原图路径',
  `width` int(11) NOT NULL COMMENT '图片宽px',
  `height` int(11) NOT NULL COMMENT '图片高px',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COMMENT='分享主题的相关图片数据表';
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('144','203','a09bc02d6b7e791f31c69b78b337abba33.jpg','40230','1424825537','0','','./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg','topic','./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('145','204','35d92374d0e80b9e1cd01242fa2741f228.jpg','35946','1424825598','0','','./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228_100x100.jpg','topic','./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('153','206','2bb1fba7bd9e10b01fea8a248d15129213.jpg','246083','1424831448','71','fanwe','./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817_50x50.jpg','topic','./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817.jpg','600','891');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('154','206','4c5971b0370e739c71ea9d0f5e2e35e257.jpg','561576','1424831448','71','fanwe','./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563_50x50.jpg','topic','./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563.jpg','1280','852');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('155','206','52ffbe9fa4d1d960db5ed6fb4dd41ec676.jpg','117505','1424831449','71','fanwe','./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768_50x50.jpg','topic','./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768.jpg','600','251');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('156','207','a69a84427dd071df105eeb4bdf3f537a69.jpg','373531','1424831504','71','fanwe','./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242_50x50.jpg','topic','./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242.jpg','600','885');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('157','208','347ba3d76c8cd114c26edd0097f657f168.jpg','173458','1424831584','71','fanwe','./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg','topic','./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg','600','400');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('158','209','__49606066__3081862.jpg','338630','1424891241','71','fanwe','./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162_50x50.jpg','topic','./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg','640','961');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('159','209','__49606066__3756642.jpg','143773','1424891242','71','fanwe','./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018_50x50.jpg','topic','./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg','640','426');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('160','209','__49606321__2635650.jpg','136851','1424891242','71','fanwe','./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257_50x50.jpg','topic','./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('161','209','88元桥亭活鱼小镇代金券','69825','1424891284','71','fanwe','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','topic','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('162','214','TB2mq1oaFXXXXXhXpXXXXXXXXXX_!!1795832420.jpg','254235','1424906747','72','fz云淡风轻','./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81_50x50.jpg','topic','./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81.jpg','700','379');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('163','214','TB23jGwaFXXXXabXXXXXXXXXXXX_!!1795832420.jpg','255807','1424906748','72','fz云淡风轻','./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62_50x50.jpg','topic','./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62.jpg','700','405');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('164','214','TB23zijaFXXXXbvXpXXXXXXXXXX_!!1795832420.jpg','245411','1424906748','72','fz云淡风轻','./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539_50x50.jpg','topic','./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539.jpg','700','398');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('165','215','29b1OOOPIC90.jpg','235449','1424906933','72','fz云淡风轻','./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32_50x50.jpg','topic','./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32.jpg','650','487');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('166','215','12116408_1340605908112.jpg','1059675','1424906933','72','fz云淡风轻','./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968_50x50.jpg','topic','./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968.jpg','2560','1600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('167','215','201292116218453.jpg','1441146','1424906934','72','fz云淡风轻','./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85_50x50.jpg','topic','./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85.jpg','2560','1600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('168','216','f45930c0226d0d1380b1e408db196a02.jpg','1015409','1424907074','71','fanwe','./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42_50x50.jpg','topic','./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42.jpg','1600','1200');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('169','216','userid220060time20130305031808.jpg','371459','1424907075','71','fanwe','./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231_50x50.jpg','topic','./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231.jpg','1000','667');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('170','216','userid329500time20120523234840.jpg','1050840','1424907075','71','fanwe','./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15_50x50.jpg','topic','./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15.jpg','2126','1253');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('171','217','90b11_ieydanbrmi3geylemmytambqgyyde_640x960.jpg_468x468.jpg','193548','1424907160','71','fanwe','./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24_50x50.jpg','topic','./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24.jpg','468','702');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('172','218','by27i_ieydenrqgaywemtdmqytambqmmyde_550x620.jpg','176713','1424907233','71','fanwe','./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771_50x50.jpg','topic','./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('173','219','151lem_ieydkmrxgm4dcnjvmqytambqmeyde_550x620.jpg','144253','1424907348','71','fanwe','./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739_50x50.jpg','topic','./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('174','220','medish.jpg','248795','1424907440','71','fanwe','./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161_50x50.jpg','topic','./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161.jpg','416','600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('175','221','a41fbe2f275be88es.jpg','253182','1424907518','71','fanwe','./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259_50x50.jpg','topic','./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259.jpg','411','600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('176','222','20120411165042_8jJYr.thumb.600_0.jpg','177713','1424908944','71','fanwe','./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677_50x50.jpg','topic','./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677.jpg','580','870');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('177','223','Penguins.jpg','615655','1424909032','71','fanwe','./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31_50x50.jpg','topic','./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31.jpg','1024','768');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('178','224','Jellyfish.jpg','548678','1424909045','71','fanwe','./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797_50x50.jpg','topic','./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797.jpg','1024','768');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('179','225','1cikuu_ieydszrxgjrdozjxmmytambqgiyde_550x620.jpg','159140','1424909131','71','fanwe','./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13_50x50.jpg','topic','./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('180','226','151lem_ieydozbxhbrwiztdmmytambqmeyde_550x620.jpg','145478','1424909175','71','fanwe','./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450_50x50.jpg','topic','./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('181','227','151lem_ieydimjshftgmnrymmytambqmeyde_550x620.jpg','189511','1424909206','71','fanwe','./public/comment/201502/26/16/f71f019325289d8e091671964724687a67_50x50.jpg','topic','./public/comment/201502/26/16/f71f019325289d8e091671964724687a67.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('182','228','151zqx_ieygcolbha3demzwmmytambqgyyde_550x620.jpg','188072','1424909239','71','fanwe','./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43_50x50.jpg','topic','./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('183','229','Desert.jpg','671434','1424909580','72','fz云淡风轻','./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979_50x50.jpg','topic','./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979.jpg','1024','768');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('184','231','__36578586__4587290.jpg','159074','1424910173','71','fanwe','./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86_50x50.jpg','topic','./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86.jpg','640','427');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('185','232','1a24yv_ieydkzbsmzsgiyjvmmytambqgiyde_550x620.jpg','151552','1424910314','71','fanwe','./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260_50x50.jpg','topic','./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('186','233','18eokr_ieydgmdemi4gkojtmmytambqmmyde_550x620.jpg','164670','1424910372','71','fanwe','./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613_50x50.jpg','topic','./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('187','234','1a24yv_ieygiyrsgi2tsyrtmmytambqgyyde_550x620.jpg','132373','1424910834','71','fanwe','./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142_50x50.jpg','topic','./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('188','235','1cikuv_ieydcobzha2genbtmmytambqgiyde_550x620.jpg','220495','1424911376','71','fanwe','./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291_50x50.jpg','topic','./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('189','236','1cikuv_ieydozdfgy4genbtmmytambqgyyde_550x620.jpg','203149','1424911472','71','fanwe','./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367_50x50.jpg','topic','./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('190','237','151lem_ieydaojqgm3wmzbvmmytambqgyyde_550x620.jpg','181753','1424911629','71','fanwe','./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771_50x50.jpg','topic','./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('191','238','1527j2_ieydcztega2ggzrsmmytambqmmyde_550x620.jpg','145127','1424912284','71','fanwe','./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45_50x50.jpg','topic','./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('192','239','1527j2_ieygeztfgyygezrsmmytambqhayde_550x620.jpg','172187','1424912307','71','fanwe','./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19_50x50.jpg','topic','./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19.jpg','550','620');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_reply`;
CREATE TABLE `%DB_PREFIX%topic_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL COMMENT '主题ID',
  `content` text NOT NULL COMMENT '回复内容',
  `user_id` int(11) NOT NULL COMMENT '回复人ID',
  `user_name` varchar(255) NOT NULL COMMENT '回复人用户名',
  `reply_id` int(11) NOT NULL COMMENT '被回应的回复的ID',
  `reply_user_id` int(11) NOT NULL COMMENT '被回应的回复的用户ID',
  `reply_user_name` varchar(255) NOT NULL COMMENT '被回应的回复的用户名',
  `create_time` int(11) NOT NULL COMMENT '回复时间',
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_id` (`reply_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='主题回复表';
INSERT INTO `%DB_PREFIX%topic_reply` VALUES ('42','208','很不错啊。','71','fanwe','0','0','','1424892621','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_tag`;
CREATE TABLE `%DB_PREFIX%topic_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否推荐, 标为推荐将默认显示在发现栏目的全部分类的标签中',
  `count` int(11) NOT NULL COMMENT '与该标签相关的分享主题数',
  `is_preset` tinyint(1) NOT NULL COMMENT '是否为预设标签(预选标签在会员中心发分享时可提供给用户选取)',
  `color` varchar(10) NOT NULL COMMENT '发现栏目显示标签的颜色',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='主题检索用的标签集';
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('1','电影','1','2','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('2','自助游','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('3','闽菜','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('4','川菜','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('5','咖啡','1','0','0','#fff100','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('6','牛排','1','0','0','#a1410d','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('7','包包','1','0','0','#ed008c','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('8','复古','1','0','0','#a36209','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('9','甜美','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('10','韩系','1','0','0','#a4d49d','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('11','欧美','1','0','0','#ee1d24','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('12','美食','1','0','0','#a1410d','1');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_tag_cate`;
CREATE TABLE `%DB_PREFIX%topic_tag_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名',
  `sub_name` varchar(255) NOT NULL COMMENT '附标题(手机端使用)',
  `mobile_title_bg` varchar(255) NOT NULL COMMENT '手机分类背景图',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `showin_mobile` tinyint(1) NOT NULL COMMENT '是否显示在网站',
  `showin_web` tinyint(1) NOT NULL COMMENT '是否显示在手机端',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分享标签的分类表';
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('1','休闲娱乐','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('2','乐享美食','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('3','旅游酒店','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('4','都市购物','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('5','幸福居家','','','1','0','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('6','浪漫婚恋','','','2','0','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('7','玩乐帮派','','','3','0','1');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_tag_cate_link`;
CREATE TABLE `%DB_PREFIX%topic_tag_cate_link` (
  `cate_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类与预设标签的关联表，主题的自动分类依据该表';
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','8');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','10');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','12');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','8');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','10');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','11');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_title`;
CREATE TABLE `%DB_PREFIX%topic_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '话题名称',
  `type` tinyint(1) NOT NULL COMMENT '0:主题1:活动',
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否为推荐',
  `count` int(11) NOT NULL COMMENT '话题中的主题数量',
  `color` varchar(10) NOT NULL COMMENT '显示的颜色',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分享主题的话题列表';
INSERT INTO `%DB_PREFIX%topic_title` VALUES ('4','报名参加了玛格利塔新店开业试吃','0','0','1','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_title_cate_link`;
CREATE TABLE `%DB_PREFIX%topic_title_cate_link` (
  `title_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`title_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题与分类的关联表，也用于分享的自动分类用';
DROP TABLE IF EXISTS `%DB_PREFIX%topic_vote_log`;
CREATE TABLE `%DB_PREFIX%topic_vote_log` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享的投票表';
DROP TABLE IF EXISTS `%DB_PREFIX%urls`;
CREATE TABLE `%DB_PREFIX%urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL COMMENT '外链的url',
  `count` int(11) NOT NULL COMMENT '该链接被点击的次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='分享中关于外链的加密存储表';
INSERT INTO `%DB_PREFIX%urls` VALUES ('8','http://www.fanwe.com','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user`;
CREATE TABLE `%DB_PREFIX%user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '会员名',
  `user_pwd` varchar(255) NOT NULL COMMENT '会员密码',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  `group_id` int(11) NOT NULL COMMENT '会员组ID',
  `is_effect` tinyint(1) NOT NULL COMMENT '是否被禁用（未验证）',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除',
  `email` varchar(255) DEFAULT NULL COMMENT '会员邮件',
  `mobile` varchar(255) DEFAULT NULL COMMENT '会员手机号',
  `score` int(11) NOT NULL COMMENT '会员积分',
  `total_score` int(11) NOT NULL COMMENT '累积积分：用于会员组升级',
  `money` double(20,4) NOT NULL COMMENT '会员余额',
  `verify` varchar(255) NOT NULL COMMENT '验证注册生效时生成的验证码',
  `code` varchar(255) NOT NULL COMMENT '登录用的标识码(md5加密前缀)',
  `pid` int(11) NOT NULL COMMENT '推荐人ID',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `referral_count` int(11) NOT NULL COMMENT '返利数量',
  `password_verify` varchar(255) NOT NULL COMMENT '取回密码的验证码',
  `integrate_id` int(11) NOT NULL COMMENT '会员整合的用户ID（如uc中的会员ID）',
  `sina_id` varchar(255) NOT NULL COMMENT '新浪同步的会员ID',
  `renren_id` varchar(255) NOT NULL COMMENT '预留',
  `kaixin_id` varchar(255) NOT NULL COMMENT '预留',
  `sohu_id` varchar(255) NOT NULL COMMENT '预留',
  `lottery_mobile` varchar(255) NOT NULL COMMENT '抽奖时用的手机号',
  `lottery_verify` varchar(255) NOT NULL COMMENT '抽奖手机的验证码',
  `verify_create_time` int(11) NOT NULL COMMENT '抽奖手机验证码生成时间',
  `tencent_id` varchar(255) NOT NULL COMMENT '腾讯微博ID',
  `referer` varchar(255) NOT NULL COMMENT '会员来路',
  `login_pay_time` int(11) NOT NULL COMMENT '弃用',
  `focus_count` int(11) NOT NULL COMMENT '关注别人的数量',
  `focused_count` int(11) NOT NULL COMMENT '粉丝数',
  `province_id` int(11) NOT NULL COMMENT '所属省份ID',
  `city_id` int(11) NOT NULL COMMENT '所属城市 ID',
  `sex` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '性别',
  `my_intro` varchar(255) NOT NULL COMMENT '个人简介',
  `is_merchant` tinyint(1) NOT NULL COMMENT '是否绑定商家',
  `merchant_name` varchar(255) NOT NULL COMMENT '商家帐号名',
  `is_daren` tinyint(1) NOT NULL COMMENT '达人标识 ',
  `daren_title` varchar(255) NOT NULL COMMENT '达人称号',
  `step` tinyint(1) NOT NULL COMMENT '新手已完成步骤',
  `byear` int(4) NOT NULL COMMENT '生日年',
  `bmonth` int(2) NOT NULL COMMENT '生日月',
  `bday` int(2) NOT NULL COMMENT '生日日',
  `locate_time` int(11) DEFAULT '0' COMMENT '用户最后登陆时间',
  `xpoint` float(10,6) DEFAULT '0.000000' COMMENT '用户最后登陆x座标',
  `ypoint` float(10,6) DEFAULT '0.000000' COMMENT '用户最后登陆y座标',
  `topic_count` int(11) NOT NULL COMMENT '主题数',
  `fav_count` int(11) NOT NULL COMMENT '喜欢数',
  `faved_count` int(11) NOT NULL COMMENT '被喜欢数',
  `dp_count` int(11) NOT NULL COMMENT '点评总数',
  `insite_count` int(11) NOT NULL COMMENT '站点分享数总（本站的商品等数据）',
  `outsite_count` int(11) NOT NULL COMMENT '外站的分享数（如有实现的淘宝分享等）',
  `level_id` int(11) NOT NULL COMMENT '等级ID',
  `point` int(11) NOT NULL COMMENT '经验值',
  `sina_app_key` varchar(255) NOT NULL COMMENT '新浪的同步验证key',
  `sina_app_secret` varchar(255) NOT NULL COMMENT '新浪的同步验证密码',
  `is_syn_sina` tinyint(1) NOT NULL COMMENT '是否同步发微博到新浪',
  `tencent_app_key` varchar(255) NOT NULL COMMENT '腾讯的同步验证key',
  `tencent_app_secret` varchar(255) NOT NULL COMMENT '腾讯的同步验证密码',
  `is_syn_tencent` tinyint(1) NOT NULL COMMENT '是否同步发微博到腾讯',
  `sina_token` varchar(255) NOT NULL COMMENT '新浪的授权码',
  `t_access_token` varchar(255) NOT NULL COMMENT '腾讯微博授权码',
  `t_openkey` varchar(255) NOT NULL COMMENT '腾讯微博的openkey',
  `t_openid` varchar(255) NOT NULL COMMENT '腾讯微博OPENID',
  `avatar` varchar(255) NOT NULL DEFAULT './public/avatar/noavatar.gif',
  `is_tmp` tinyint(1) NOT NULL COMMENT '表示是否为临时用户（如手机注册）',
  `qqv2_id` varchar(255) NOT NULL,
  `qq_token` varchar(255) NOT NULL,
  `t_name` varchar(255) NOT NULL,
  `dev_type` varchar(20) DEFAULT 'android' COMMENT 'android,ios 客户手机类型,一个客户只绑定一个最新的手机',
  `device_token` varchar(255) DEFAULT NULL COMMENT '推送device_token一个客户只绑定一个最新的手机',
  `wx_openid` varchar(255) NOT NULL COMMENT '微信OPENID',
`real_name`  varchar(255) NOT NULL COMMENT '会员真实姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_user_name` (`user_name`),
  UNIQUE KEY `unk_email` (`email`),
  UNIQUE KEY `unk_mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='会员表';
INSERT INTO `%DB_PREFIX%user` VALUES ('71','fanwe','6714ccb93be0fda4e51f206b91b46358','1424909528','1424909528','192.168.1.75','1','1','0','fanwe@fanwe.com','13333333333','90','110','9973.2000','','','0','1435949115','0','','0','','','','','','','0','','','0','0','1','4','53','1','','0','','1','方维o2o达人','0','1970','1','1','0','0.000000','0.000000','33','1','0','1','2','0','1','430','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('72','fz云淡风轻','6714ccb93be0fda4e51f206b91b46358','1424909518','1424909518','127.0.0.1','1','1','0','fanwe1@fanwe.com','','100','100','0.0000','','','71','1424909561','0','','0','','','','','','','0','','','0','1','0','0','0','-1','','0','','1','分享达人','0','0','0','0','0','0.000000','0.000000','4','0','1','0','0','0','1','180','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','','');
DROP TABLE IF EXISTS `%DB_PREFIX%user_active_log`;
CREATE TABLE `%DB_PREFIX%user_active_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '发生时间',
  `point` int(11) NOT NULL COMMENT '经验',
  `score` int(11) NOT NULL COMMENT '积分',
  `money` double(11,4) NOT NULL COMMENT '钱',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='关于会员活跃度的帐号变更日志';
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('34','71','1424825541','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('35','71','1424825604','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('36','71','1424831278','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('37','71','1424831452','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('38','71','1424831511','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('39','71','1424831593','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('40','71','1424891284','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('41','71','1424892621','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('42','71','1424893353','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('43','71','1424893442','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('44','72','1424906566','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('45','72','1424906767','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('46','72','1424906940','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('47','71','1424907077','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('48','71','1424907181','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('49','71','1424907246','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('50','71','1424907366','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('51','71','1424907447','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('52','71','1424907522','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('53','72','1424909588','10','0','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%user_auth`;
CREATE TABLE `%DB_PREFIX%user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='会员前台操作权限的配置表';
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('135','71','group','setmemo','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('134','71','group','setbest','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('130','71','group','setmemo','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('129','71','group','setbest','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('128','71','group','settop','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('127','71','group','replydel','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('126','71','group','del','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('133','71','group','settop','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('132','71','group','replydel','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('131','71','group','del','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('116','71','group','del','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('119','71','group','setbest','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('118','71','group','settop','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('115','71','group','setmemo','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('112','71','group','replydel','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('113','71','group','settop','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('117','71','group','replydel','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('114','71','group','setbest','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('111','71','group','del','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('120','71','group','setmemo','5');
DROP TABLE IF EXISTS `%DB_PREFIX%user_cate_link`;
CREATE TABLE `%DB_PREFIX%user_cate_link` (
  `user_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='达人会员所属的分类';
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','1');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','2');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','3');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','4');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','5');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','6');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','7');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','1');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','2');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','3');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','4');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','5');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','6');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','7');
DROP TABLE IF EXISTS `%DB_PREFIX%user_consignee`;
CREATE TABLE `%DB_PREFIX%user_consignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `region_lv1` int(11) NOT NULL COMMENT '国',
  `region_lv2` int(11) NOT NULL COMMENT '省',
  `region_lv3` int(11) NOT NULL COMMENT '市',
  `region_lv4` int(11) NOT NULL COMMENT '地区',
  `address` text NOT NULL COMMENT '地址',
  `mobile` varchar(255) NOT NULL COMMENT '手机',
  `zip` varchar(255) NOT NULL COMMENT '邮编',
  `consignee` varchar(255) NOT NULL COMMENT '收货人',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认配送地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='会员的收货地址';
INSERT INTO `%DB_PREFIX%user_consignee` VALUES ('19','71','1','4','53','519','群升国际','13555566666','350001','李四','1');
INSERT INTO `%DB_PREFIX%user_consignee` VALUES ('20','71','1','4','53','519','宝龙万象','15544433333','350000','张三','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_extend`;
CREATE TABLE `%DB_PREFIX%user_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '扩展字段ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `value` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='会员扩展字段的资料';
DROP TABLE IF EXISTS `%DB_PREFIX%user_field`;
CREATE TABLE `%DB_PREFIX%user_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL COMMENT '字段名（代码）',
  `field_show_name` varchar(255) NOT NULL COMMENT '字段显示用的名称',
  `input_type` tinyint(1) NOT NULL COMMENT '0:手动输入 1：预选下拉',
  `value_scope` text NOT NULL COMMENT '预选下拉的预选值,以逗号分隔',
  `is_must` tinyint(1) NOT NULL COMMENT '是否必填',
  `sort` int(11) NOT NULL COMMENT '排序大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_field_name` (`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员的扩展字段';
DROP TABLE IF EXISTS `%DB_PREFIX%user_focus`;
CREATE TABLE `%DB_PREFIX%user_focus` (
  `focus_user_id` int(11) NOT NULL COMMENT '关注人ID',
  `focused_user_id` int(11) NOT NULL COMMENT '被关注人ID',
  `focus_user_name` varchar(255) NOT NULL COMMENT '关注人用户名',
  `focused_user_name` varchar(255) NOT NULL COMMENT '被关注人用户名',
  `to_focus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`focus_user_id`,`focused_user_id`),
  KEY `focus_user_id` (`focus_user_id`),
  KEY `focused_user_id` (`focused_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员关注、被关注表';
INSERT INTO `%DB_PREFIX%user_focus` VALUES ('72','71','fz云淡风轻','fanwe','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_frequented`;
CREATE TABLE `%DB_PREFIX%user_frequented` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '员会ID',
  `title` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `xpoint` float(12,6) DEFAULT '0.000000' COMMENT 'longitude',
  `ypoint` float(12,6) DEFAULT '0.000000' COMMENT 'latitude',
  `latitude_top` float(12,6) DEFAULT NULL,
  `latitude_bottom` float(12,6) DEFAULT NULL,
  `longitude_left` float(12,6) DEFAULT NULL,
  `longitude_right` float(12,6) DEFAULT NULL,
  `zoom_level` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端附近会员的记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%user_group`;
CREATE TABLE `%DB_PREFIX%user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '会员组名',
  `score` int(11) NOT NULL COMMENT '所需积分',
  `discount` double(20,4) NOT NULL COMMENT '享受的折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员组配置表';
INSERT INTO `%DB_PREFIX%user_group` VALUES ('1','普通会员','0','1.0000');
INSERT INTO `%DB_PREFIX%user_group` VALUES ('2','VIP会员','8888','0.8000');
DROP TABLE IF EXISTS `%DB_PREFIX%user_level`;
CREATE TABLE `%DB_PREFIX%user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '等级名称',
  `point` int(11) NOT NULL COMMENT '所需经验值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`point`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员等级表';
INSERT INTO `%DB_PREFIX%user_level` VALUES ('1','幼儿园','0');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('2','小学生','1000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('3','中学生','2000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('4','大学生','5000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('5','研究生','10000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('6','博士生','50000');
DROP TABLE IF EXISTS `%DB_PREFIX%user_log`;
CREATE TABLE `%DB_PREFIX%user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '日志内容',
  `log_time` int(11) NOT NULL COMMENT '发生时间',
  `log_admin_id` int(11) NOT NULL COMMENT '操作管理员的ID',
  `log_user_id` int(11) NOT NULL COMMENT '操作的前台会员ID',
  `money` double(20,4) NOT NULL COMMENT '相关的钱',
  `score` int(11) NOT NULL COMMENT '相关的积分',
  `point` int(11) NOT NULL COMMENT '相关的经验',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='会员的资金、积分、经验日志';
INSERT INTO `%DB_PREFIX%user_log` VALUES ('109','在2015-02-25 15:46:15注册成功','1424821575','1','0','0.0000','100','100','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('110','您在2015-02-25 15:46:15签到成功','1424821575','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('111','发表了一则分享','1424825541','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('112','发表了一则分享','1424825604','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('113','转载了一则分享','1424831278','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('114','发表了一则分享','1424831452','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('115','发表了一则分享','1424831511','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('116','发表了一则分享','1424831593','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('117','您在2015-02-26 09:46:03签到成功','1424886363','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('139','发表了一则分享','1424907366','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('119','充值单20150226094620767支付成功','1424886396','1','0','10000.0000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('120','下载优惠券肯德基10元汉堡','1424886836','1','0','0.0000','-5','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('122','2015022610592583订单付款,付款单号2015022610592524','1424890765','1','0','-95.8000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('123','订单号2015022610000323 61323563消费券验证成功','1424890988','1','0','0.0000','10','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('124','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]退款成功','1424891134','1','0','69.0000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('125','发表了一则点评','1424891284','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('126','下载优惠券华莱士30元抵用券','1424891808','1','0','0.0000','-5','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('127','回应了一则分享','1424892621','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('128','发表了一则分享','1424893353','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('129','发表了一则分享','1424893442','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('130','活动报名：玛格利塔新店开业试吃','1424894336','1','0','0.0000','-10','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('131','在2015-02-26 15:22:09注册成功','1424906529','1','0','0.0000','100','100','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('132','您在2015-02-26 15:22:09签到成功','1424906529','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('133','转载了一则分享','1424906566','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('134','发表了一则分享','1424906767','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('135','发表了一则分享','1424906940','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('136','发表了一则分享','1424907077','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('137','发表了一则分享','1424907181','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('138','发表了一则分享','1424907246','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('140','发表了一则分享','1424907447','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('141','发表了一则分享','1424907522','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('142','很好分享被置顶','1424907966','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('143','分享被推荐','1424908015','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('144','管理员操作推荐','1424908239','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('145','管理员操作推荐','1424908284','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('146','管理员操作推荐','1424908286','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('147','管理员操作推荐','1424908700','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('148','管理员操作推荐','1424908703','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('149','管理员操作推荐','1424908703','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('150','管理员操作推荐','1424908706','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('151','管理员操作推荐','1424908710','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('152','管理员操作推荐','1424908712','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('153','管理员操作取消推荐','1424908714','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('154','管理员操作取消推荐','1424908715','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('155','管理员操作取消推荐','1424908719','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('156','管理员操作推荐','1424908720','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('157','管理员操作推荐','1424908722','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('158','管理员操作取消推荐','1424908860','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('159','管理员操作取消推荐','1424908861','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('160','管理员操作推荐','1424908960','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('161','管理员操作推荐','1424909060','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('162','管理员操作推荐','1424909061','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('163','管理员操作推荐','1424909153','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('164','管理员操作推荐','1424909247','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('165','管理员操作推荐','1424909248','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('166','管理员操作推荐','1424909249','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('167','发表了一则分享','1424909588','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('168','管理员操作推荐','1424909609','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('169','您在2015-03-28 10:36:17签到成功','1427481377','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('170','您在2015-07-04 10:33:11签到成功','1435948391','0','71','0.0000','0','10','71');
DROP TABLE IF EXISTS `%DB_PREFIX%user_medal`;
CREATE TABLE `%DB_PREFIX%user_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `medal_id` int(11) NOT NULL COMMENT '勋章ID',
  `name` varchar(255) NOT NULL COMMENT '勋章名称',
  `create_time` int(11) NOT NULL COMMENT '获取时间',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否被删除',
  `icon` varchar(255) NOT NULL COMMENT '勋章图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员勋章表';
INSERT INTO `%DB_PREFIX%user_medal` VALUES ('2','71','3','新手勋章','1424821804','1','./public/attachment/201203/17/15/4f643902cd067.png');
DROP TABLE IF EXISTS `%DB_PREFIX%user_sign_log`;
CREATE TABLE `%DB_PREFIX%user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `sign_date` int(11) NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会员签到日志';
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('7','71','1435948391');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('5','72','1424906529');
DROP TABLE IF EXISTS `%DB_PREFIX%user_topic_group`;
CREATE TABLE `%DB_PREFIX%user_topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '加入小组的时间',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '加入的时间',
  `type` tinyint(1) NOT NULL COMMENT '0:普通组员 1:管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`group_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员加入的小组表';
INSERT INTO `%DB_PREFIX%user_topic_group` VALUES ('3','5','72','1424906623','0');
INSERT INTO `%DB_PREFIX%user_topic_group` VALUES ('4','4','72','1424906823','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_x_y_point`;
CREATE TABLE `%DB_PREFIX%user_x_y_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `xpoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `ypoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `locate_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员手机端地理定位记录';
DROP TABLE IF EXISTS `%DB_PREFIX%vote`;
CREATE TABLE `%DB_PREFIX%vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '调查的项目名称',
  `begin_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sort` int(11) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='在线调查表';
DROP TABLE IF EXISTS `%DB_PREFIX%vote_ask`;
CREATE TABLE `%DB_PREFIX%vote_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '投票项名称',
  `type` tinyint(1) NOT NULL COMMENT '投票类型，单选多选/自定义可叠加 1:单选 2:多选 3:自定义',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `vote_id` int(11) NOT NULL COMMENT '调查ID',
  `val_scope` text NOT NULL COMMENT '预选范围 逗号分开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='在线调查投票项设置';
DROP TABLE IF EXISTS `%DB_PREFIX%vote_result`;
CREATE TABLE `%DB_PREFIX%vote_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '投票的名称',
  `count` int(11) NOT NULL COMMENT '计数',
  `vote_id` int(11) NOT NULL COMMENT '调查项ID',
  `vote_ask_id` int(11) NOT NULL COMMENT '投票项（问题）ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='投票结果表';
DROP TABLE IF EXISTS `%DB_PREFIX%weight_unit`;
CREATE TABLE `%DB_PREFIX%weight_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '重量名称',
  `rate` decimal(20,4) NOT NULL COMMENT '换算比率(标准为1)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='重量单位配置表';
INSERT INTO `%DB_PREFIX%weight_unit` VALUES ('1','克','1.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_account`;
CREATE TABLE `%DB_PREFIX%weixin_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) NOT NULL COMMENT 'AppID(应用ID)-第三方平台指 授权方appid',
  `appsecret` varchar(255) NOT NULL COMMENT 'AppSecret(应用密钥)-第三方平台无用',
  `app_url` varchar(255) NOT NULL COMMENT 'URL(服务器地址)-第三方平台无用',
  `app_token` varchar(255) NOT NULL COMMENT 'Token(令牌)-第三方平台无用',
  `app_encodingAESKey` varchar(255) NOT NULL COMMENT 'EncodingAESKey(消息加解密密钥)-第三方平台无用',
  `authorizer_appid` varchar(255) NOT NULL COMMENT '授权方appid',
  `authorizer_access_token` varchar(255) NOT NULL COMMENT '授权方令牌-第三方平台无用',
  `expires_in` int(11) NOT NULL COMMENT '授权方令牌 有效时间-第三方平台无用',
  `authorizer_refresh_token` varchar(255) NOT NULL COMMENT '刷新令牌-第三方平台',
  `func_info` text NOT NULL COMMENT '公众号授权给开发者的权限集列表',
  `verify_type_info` tinyint(1) NOT NULL COMMENT '授权方认证类型，-1代表未认证，0代表微信认证，1代表新浪微博认证，2代表腾讯微博认证，3代表已资质认证通过但还未通过名称认证，4代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证，5代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证',
  `service_type_info` tinyint(1) NOT NULL COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  `nick_name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL COMMENT '授权方公众号的原始ID',
  `authorizer_info` varchar(255) NOT NULL COMMENT '授权方昵称',
  `head_img` varchar(255) NOT NULL COMMENT '授权方头像',
  `alias` varchar(255) NOT NULL COMMENT '授权方公众号所设置的微信号，可能为空',
  `qrcode_url` varchar(255) NOT NULL COMMENT '二维码图片的URL，开发者最好自行也进行保存',
  `location_report` tinyint(1) NOT NULL COMMENT '地理位置上报选项 0 无上报 1 进入会话时上报 2 每5s上报',
  `voice_recognize` tinyint(1) NOT NULL COMMENT '语音识别开关选项 0 关闭语音识别 1 开启语音识别',
  `customer_service` tinyint(1) NOT NULL COMMENT '客服开关选项 0 关闭多客服 1 开启多客服',
  `is_authorized` tinyint(1) NOT NULL DEFAULT '0' COMMENT '授权方是否取消授权 0表示取消授权 1表示授权',
  `user_id` int(11) NOT NULL COMMENT '商户ID ，诺type为1，user_id 为空',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 表示前台商户会员 1 表示后台管理员',
  `industry_1` int(11) NOT NULL,
  `industry_1_status` tinyint(1) NOT NULL,
  `industry_2` int(11) NOT NULL,
  `industry_2_status` tinyint(1) NOT NULL,
  `test_user` varchar(255) DEFAULT NULL COMMENT '测试微信号',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorizer_appid` (`authorizer_appid`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='//微信公众号列表';
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_api_get_record`;
CREATE TABLE `%DB_PREFIX%weixin_api_get_record` (
  `openid` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`openid`),
  KEY `account_id` (`account_id`),
  KEY `idx_0` (`account_id`,`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='请求的用户记录';
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_conf`;
CREATE TABLE `%DB_PREFIX%weixin_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '配置输入的类型 0:文本输入 1:下拉框输入 2:图片上传 3:编辑器',
  `value_scope` text NOT NULL COMMENT '取值范围',
  `is_require` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_conf` tinyint(1) NOT NULL COMMENT '是否可配置 0: 可配置  1:不可配置',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='微信配置选项';
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('1','第三方平台appid','platform_appid','','0','0','','0','1','1','1');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('2','公众号消息校验Token','platform_token','','0','0','','0','1','1','2');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('3','公众号消息加解密Key','platform_encodingAesKey','','0','0','','0','1','1','3');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('4','是否开启第三方平台','platform_status','0','0','4','0,1','0','1','1','4');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('5','第三方平台AppSecret','platform_appsecret','','0','0','','0','1','1','1');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('6','component_verify_ticket','platform_component_verify_ticket','0','0','0','','0','1','0','6');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('7','第三方平台access_token','platform_component_access_token','0','0','0','','0','1','0','7');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('8','第三方平台预授权码','platform_pre_auth_code','0','0','0','','0','1','0','8');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('9','第三方平台access_token有效期','platform_component_access_token_expire','0','0','0','','0','1','0','9');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('10','第三方平台预授权码有效期','platform_pre_auth_code_expire','0','0','0','','0','1','0','10');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('11','是否已全网发布','platform_all_publish','0','0','4','0,1','0','1','1','11');
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_nav`;
CREATE TABLE `%DB_PREFIX%weixin_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '菜单名称',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序 大->小',
  `event_type` enum('click') DEFAULT 'click' COMMENT '按钮的事件，目前微信只支持click',
  `account_id` int(11) DEFAULT '0' COMMENT '商户ID,0表示平台',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否已推送到微信(0:未推送或失败 1:成功)，该列同一个商家全部相同，菜单为一次性推送,对菜单本地修改时，批量更新该值为0',
  `pid` int(11) DEFAULT '0',
  `ctl` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `event_type` (`event_type`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='为微信自定义的菜单设置';
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_reply`;
CREATE TABLE `%DB_PREFIX%weixin_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `i_msg_type` enum('event','link','location','image','text') DEFAULT 'text' COMMENT '接收到的微信的推送到本系统api中的MsgType',
  `o_msg_type` enum('news','music','text') DEFAULT 'text' COMMENT '用于响应并回复给微信推送的消息类型 news:图文 music:音乐 text:纯文本',
  `keywords` varchar(300) DEFAULT NULL COMMENT '用于响应文本(i_msg_type:text或者i_event:click时对key的响应)类型的回复时进行匹配的关键词',
  `keywords_match` text COMMENT 'keywords的全文索引列',
  `keywords_match_row` text COMMENT 'keywords全文索引的未作unicode编码的原文，用于开发者查看',
  `address` text COMMENT '用于显示的地理地址',
  `api_address` text COMMENT '用于地理定位的API地址',
  `x_point` varchar(100) DEFAULT '' COMMENT '用于lbs消息,i_msg_type:location 匹配的经度',
  `y_point` varchar(100) DEFAULT '' COMMENT '用于lbs消息,i_msg_type:location 匹配的纬度',
  `scale_meter` int(11) DEFAULT '0' COMMENT '用于lbs消息,i_msg_type:location 匹配的距离范围(米)',
  `i_event` enum('subscribe','unsubscribe','click','empty') DEFAULT 'empty' COMMENT '用于响应i_msg_type为event时的对应事件',
  `reply_content` text COMMENT '回复的文本消息',
  `reply_music` varchar(255) DEFAULT '' COMMENT '回复的音乐链接',
  `reply_news_title` text COMMENT '图文回复的标题',
  `reply_news_description` text COMMENT '图文回复的描述',
  `reply_news_picurl` varchar(255) DEFAULT '' COMMENT '图文回复的图片链接',
  `reply_news_url` varchar(255) DEFAULT '' COMMENT '图文回复的跳转链接',
  `reply_news_content` text,
  `type` tinyint(1) DEFAULT '0' COMMENT '回复归类 \r\n0:普通的回复 \r\n1:默认回复(只能一条文本或图文) \r\n4.关注时回复(只能有一条文本或图文) ',
  `account_id` int(11) DEFAULT '0' COMMENT '所属的商家ID',
  `default_close` tinyint(1) DEFAULT '1' COMMENT '默认回复是否关闭 0：关闭 1：开启',
  `match_type` tinyint(1) NOT NULL DEFAULT '0',
  `ctl` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_msg_type` (`i_msg_type`),
  KEY `o_msg_type` (`o_msg_type`),
  KEY `i_event` (`i_event`),
  KEY `type` (`type`),
  KEY `account_id` (`account_id`),
  KEY `match_type` (`account_id`,`match_type`,`keywords`),
  FULLTEXT KEY `keywords_match` (`keywords_match`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商家回复设置表';
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_reply_relate`;
CREATE TABLE `%DB_PREFIX%weixin_reply_relate` (
  `main_reply_id` int(11) DEFAULT '0' COMMENT '主回复ID',
  `relate_reply_id` int(11) DEFAULT '0' COMMENT '关联的多图文用的子回复ID',
  `sort` tinyint(1) DEFAULT '0',
  KEY `main_reply_id` (`main_reply_id`),
  KEY `relate_reply_id` (`relate_reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多图文回复的关联配置';
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_tmpl`;
CREATE TABLE `%DB_PREFIX%weixin_tmpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '模板名称',
  `msg` text COMMENT '模板内容',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板ID',
  `template_id_short` varchar(255) DEFAULT NULL COMMENT '模板编号',
  `account_id` int(11) DEFAULT '0' COMMENT '所属的商家ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='微信模板';
DROP TABLE IF EXISTS `%DB_PREFIX%weixin_user`;
CREATE TABLE `%DB_PREFIX%weixin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL COMMENT '商家ID,平台级为0',
  `subscribe` tinyint(1) NOT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。',
  `nickname` varchar(255) NOT NULL,
  `sex` tinyint(1) NOT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `subscribe_time` varchar(255) DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `unionid` varchar(255) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。',
  `remark` varchar(255) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(11) DEFAULT NULL COMMENT '用户所在的分组ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='//微信公众号会员列表';
DROP TABLE IF EXISTS `%DB_PREFIX%withdraw`;
CREATE TABLE `%DB_PREFIX%withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `money` decimal(20,4) NOT NULL COMMENT '提现金额',
  `create_time` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL COMMENT '是否已确认',
  `pay_time` int(11) NOT NULL COMMENT '确认支付时间',
  `bank_name` varchar(255) NOT NULL COMMENT '开户行名称',
  `bank_account` varchar(255) NOT NULL COMMENT '开户行账号',
  `bank_user` varchar(255) NOT NULL COMMENT '开户行会员名',
  `is_delete` tinyint(1) NOT NULL,
  `bank_mobile`  varchar(255) NOT NULL COMMENT '银行预留手机号' ,
  `is_bind`  tinyint(1) NOT NULL  COMMENT '是否绑定',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%youhui`;
CREATE TABLE `%DB_PREFIX%youhui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `icon` varchar(255) NOT NULL COMMENT '列表展示用图',
  `image` varchar(255) NOT NULL COMMENT '大图',
  `deal_cate_id` int(11) NOT NULL COMMENT '所属的生活服务大分类ID',
  `begin_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `expire_day` int(11) NOT NULL COMMENT '领取后的过期时间(0表示以优惠券结束时间为依据)，如优惠券结束时间也为0则不过期',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `send_type` tinyint(1) NOT NULL COMMENT '弃用',
  `total_num` int(11) NOT NULL COMMENT '总条数(限制下载用（针对验证类型的优惠券）)',
  `sms_count` int(11) NOT NULL COMMENT '弃用',
  `print_count` int(11) NOT NULL COMMENT '弃用',
  `view_count` int(11) NOT NULL COMMENT '弃用',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sms_content` varchar(255) NOT NULL COMMENT '短信下载优惠券的短信内容',
  `is_sms` tinyint(1) NOT NULL COMMENT '是否支持短信下载',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '弃用',
  `brief` text NOT NULL COMMENT '内容、条款',
  `youhui_type` tinyint(1) NOT NULL COMMENT '减免0/折扣1',
  `total_fee` int(11) NOT NULL COMMENT '消费的总金额（由商家验证时填写累加）',
  `deal_cate_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引',
  `locate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引',
  `name_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '名称的全文索引',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `user_id` int(11) NOT NULL COMMENT '用户发布的',
  `supplier_id` int(11) NOT NULL COMMENT '商户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `brand_id` int(11) NOT NULL COMMENT '弃用',
  `pub_by` tinyint(1) NOT NULL COMMENT '0:管理员 1:会员 2:商家',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐',
  `list_brief` text NOT NULL COMMENT '优惠券列表简介',
  `description` text NOT NULL COMMENT '详情描述',
  `index_img` varchar(255) NOT NULL COMMENT '弃用',
  `image_3` varchar(255) NOT NULL COMMENT '手机端用图',
  `image_3_w` int(11) NOT NULL COMMENT '手机端用图宽',
  `image_3_h` int(11) NOT NULL COMMENT '手机端用图高',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `publish_wait` tinyint(1) NOT NULL COMMENT '0:待审核  1:已审核 ',
  `return_money` decimal(11,4) NOT NULL COMMENT '备用',
  `return_score` int(11) NOT NULL COMMENT '备用',
  `return_point` int(11) NOT NULL COMMENT '备用',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `use_notice` text NOT NULL COMMENT '使用需知',
  `user_count` int(11) NOT NULL COMMENT '总下载次数',
  `user_limit` int(11) NOT NULL COMMENT '每个会员的下载限制',
  `score_limit` int(11) NOT NULL COMMENT '下载优惠券所消耗的积分',
  `point_limit` int(11) NOT NULL COMMENT '下载优惠券所需的经验，不扣除',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`deal_cate_id`) USING BTREE,
  FULLTEXT KEY `f_t` (`deal_cate_match`,`name_match`,`locate_match`),
  FULLTEXT KEY `cate_match` (`deal_cate_match`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='优惠券表';
INSERT INTO `%DB_PREFIX%youhui` VALUES ('20','肯德基10元汉堡','./public/attachment/201502/26/09/54ee79ed82c2b.jpg','./public/attachment/201502/26/09/54ee79ed82c2b.jpg','8','1422726137','1614274939','10','15','1','100','0','1','0','1','1','肯德基10元汉堡','1','0','','1','0','餐饮美食,面包,烧烤,西餐','ux39184ux39278ux32654ux39135,ux38754ux21253,ux28903ux28900,ux35199ux39184','福建,福州,鼓楼区,八一七北路,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口,台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475,ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','汉堡,肯德基,肯德基10元汉堡','ux27721ux22561,ux32943ux24503ux22522,ux32943ux24503ux22522ux49ux48ux20803ux27721ux22561','119.304968','26.093466','0','24','1424886275','0','0','1','','<div align=\"center\"><p><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/14/54ed6e8ca0d12.jpg\" alt=\"\" border=\"0\" /></p>\r\n</div>\r\n','','./public/attachment/201502/26/09/54ee79ed82c2b.jpg','702','487','鼓楼区八一七北路68号福建供销大厦二楼','0','0.0000','10','100','0','0','0','0','0','0','0.0000','0','','1','1','5','0');
INSERT INTO `%DB_PREFIX%youhui` VALUES ('21','盛世经典牛排50元代金券','./public/attachment/201502/26/10/54ee8ae7cb6a2.jpg','./public/attachment/201502/26/10/54ee8aee438cc.jpg','8','1422730490','1614279292','10','15','1','500','0','0','0','2','1','盛世经典牛排50元代金券','1','0','','1','0','餐饮美食,甜点,西餐','ux39184ux39278ux32654ux39135,ux29980ux28857,ux35199ux39184','福建,福州,台江区,宝龙,东区,店面,广场,工业,城市,193,149,台江区工业路193号宝龙城市广场东区1楼149号店面,宝龙城市广场','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux19996ux21306,ux24215ux38754,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux49ux52ux57,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux19996ux21306ux49ux27004ux49ux52ux57ux21495ux24215ux38754,ux23453ux40857ux22478ux24066ux24191ux22330','元代,牛排,盛世,经典,金券,盛世经典牛排50元代金券','ux20803ux20195,ux29275ux25490,ux30427ux19990,ux32463ux20856,ux37329ux21048,ux30427ux19990ux32463ux20856ux29275ux25490ux53ux48ux20803ux20195ux37329ux21048','119.299095','26.068075','0','25','1424890637','0','0','1','盛世经典牛排50元代金券','<div align=\"center\"><p><img src=\"./public/attachment/201502/26/10/54ee8aee438cc.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p><img src=\"./public/attachment/201502/26/10/54ee8b6215a0c.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p><img src=\"./public/attachment/201502/26/10/54ee8b6d37663.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n</div>\r\n','','./public/attachment/201502/26/10/54ee8aee438cc.jpg','640','427','台江区工业路193号宝龙城市广场东区1楼149号店面','0','1.0000','10','100','0','0','0','0','0','0','0.0000','0','每名消费者每天只能使用一张','0','2','5','1000');
INSERT INTO `%DB_PREFIX%youhui` VALUES ('22','一元吃肯德基','./public/attachment/201502/26/11/54ee8eb6c0e75.jpg','./public/attachment/201502/26/11/54ee8eb6c0e75.jpg','8','0','0','30','15','1','0','0','0','0','3','1','一元吃肯德基','1','0','','0','0','餐饮美食,西餐','ux39184ux39278ux32654ux39135,ux35199ux39184','福建,福州,鼓楼区,八一七北路,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口,台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475,ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','肯德基,一元,一元吃肯德基','ux32943ux24503ux22522,ux19968ux20803,ux19968ux20803ux21507ux32943ux24503ux22522','119.304968','26.093466','0','24','1424891541','0','0','1','一元吃肯德基','<img src=\"./public/attachment/201502/26/11/54ee8f12288b3.jpg\" alt=\"\" border=\"0\" />','','./public/attachment/201502/26/11/54ee8eb6c0e75.jpg','649','441','鼓楼区八一七北路68号福建供销大厦二楼','0','0.0000','0','0','0','0','0','0','0','0','0.0000','0','','0','5','0','0');
INSERT INTO `%DB_PREFIX%youhui` VALUES ('23','华莱士30元抵用券','./public/attachment/201502/26/11/54ee8fc5497f9.jpg','./public/attachment/201502/26/11/54ee8fc5497f9.jpg','8','1422731727','1582658131','50','15','1','30','0','1','0','4','1','','0','0','','0','0','餐饮美食,西餐','ux39184ux39278ux32654ux39135,ux35199ux39184','福建,福州,鼓楼区,八一七北路,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口,台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475,ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','华莱士,华莱士30元抵用券','ux21326ux33713ux22763,ux21326ux33713ux22763ux51ux48ux20803ux25269ux29992ux21048','119.304968','26.093466','0','24','1424891792','0','0','1','华莱士30元抵用券','','','./public/attachment/201502/26/11/54ee8fc5497f9.jpg','460','279','鼓楼区八一七北路68号福建供销大厦二楼','0','0.0000','10','100','0','0','0','0','0','0','0.0000','0','','1','1','5','0');
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_biz_submit`;
CREATE TABLE `%DB_PREFIX%youhui_biz_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `icon` varchar(255) NOT NULL COMMENT '列表展示用图',
  `image` varchar(255) NOT NULL COMMENT '大图',
  `deal_cate_id` int(11) NOT NULL COMMENT '所属的生活服务大分类ID',
  `begin_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `expire_day` int(11) NOT NULL COMMENT '领取后的过期时间(0表示以优惠券结束时间为依据)，如优惠券结束时间也为0则不过期',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `send_type` tinyint(1) NOT NULL COMMENT '弃用',
  `total_num` int(11) NOT NULL COMMENT '总条数(限制下载用（针对验证类型的优惠券）)',
  `sms_count` int(11) NOT NULL COMMENT '弃用',
  `print_count` int(11) NOT NULL COMMENT '弃用',
  `view_count` int(11) NOT NULL COMMENT '弃用',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sms_content` varchar(255) NOT NULL COMMENT '短信下载优惠券的短信内容',
  `is_sms` tinyint(1) NOT NULL COMMENT '是否支持短信下载',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '弃用',
  `brief` text NOT NULL COMMENT '内容、条款',
  `youhui_type` tinyint(1) NOT NULL COMMENT '减免0/折扣1',
  `total_fee` int(11) NOT NULL COMMENT '消费的总金额（由商家验证时填写累加）',
  `deal_cate_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引',
  `locate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引',
  `name_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '名称的全文索引',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `user_id` int(11) NOT NULL COMMENT '用户发布的',
  `supplier_id` int(11) NOT NULL COMMENT '商户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `brand_id` int(11) NOT NULL COMMENT '弃用',
  `pub_by` tinyint(1) NOT NULL COMMENT '0:管理员 1:会员 2:商家',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐',
  `list_brief` text NOT NULL COMMENT '优惠券列表简介',
  `description` text NOT NULL COMMENT '详情描述',
  `index_img` varchar(255) NOT NULL COMMENT '弃用',
  `image_3` varchar(255) NOT NULL COMMENT '手机端用图',
  `image_3_w` int(11) NOT NULL COMMENT '手机端用图宽',
  `image_3_h` int(11) NOT NULL COMMENT '手机端用图高',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `publish_wait` tinyint(1) NOT NULL COMMENT '0:待审核  1:已审核 ',
  `return_money` decimal(11,4) NOT NULL COMMENT '备用',
  `return_score` int(11) NOT NULL COMMENT '备用',
  `return_point` int(11) NOT NULL COMMENT '备用',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `use_notice` text NOT NULL COMMENT '使用需知',
  `user_count` int(11) NOT NULL COMMENT '总下载次数',
  `user_limit` int(11) NOT NULL COMMENT '每个会员的下载限制',
  `score_limit` int(11) NOT NULL COMMENT '下载优惠券所消耗的积分',
  `point_limit` int(11) NOT NULL COMMENT '下载优惠券所需的经验，不扣除',
  `cache_deal_cate_type_youhui_link` text NOT NULL COMMENT '序列化子分类列表',
  `cache_youhui_location_link` text NOT NULL COMMENT '序列化支持的门店',
  `account_id` int(11) NOT NULL COMMENT '提交数据的商户帐号关联ID',
  `youhui_id` int(11) NOT NULL COMMENT '关联优惠主表的数据ID',
  `biz_apply_status` tinyint(1) NOT NULL COMMENT '商户申请状态 1.新品上架申请 2:修改 3:下架',
  `admin_check_status` tinyint(1) NOT NULL COMMENT '管理员审核状态 0 待审核 1 通过 2 拒绝',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`deal_cate_id`),
  FULLTEXT KEY `f_t` (`deal_cate_match`,`name_match`,`locate_match`),
  FULLTEXT KEY `cate_match` (`deal_cate_match`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商户中心发布优惠券临时表';
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_dp_point_result`;
CREATE TABLE `%DB_PREFIX%youhui_dp_point_result` (
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `point` int(11) NOT NULL COMMENT '分数',
  `youhui_id` int(11) NOT NULL COMMENT '优惠券ID',
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `youhui_id` (`youhui_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每个优惠券，每条点评针对每个评分分组的点评评分';
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%youhui_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `youhui_id` int(11) NOT NULL COMMENT '优惠券ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `youhui_id` (`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券按预定义的分组打标签的结果表';
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_location_link`;
CREATE TABLE `%DB_PREFIX%youhui_location_link` (
  `youhui_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`youhui_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券支持的门店关联表';
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('20','23');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('20','24');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('21','25');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('22','23');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('22','24');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('23','23');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('23','24');
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_log`;
CREATE TABLE `%DB_PREFIX%youhui_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youhui_id` int(11) NOT NULL COMMENT '优惠券ID',
  `youhui_sn` varchar(255) NOT NULL COMMENT '短信生成的优惠券序列号',
  `user_id` int(11) NOT NULL COMMENT '下载的会员ID',
  `order_count` int(5) NOT NULL COMMENT '订餐人数',
  `is_private_room` tinyint(1) NOT NULL COMMENT '是否包间',
  `mobile` varchar(255) NOT NULL COMMENT '下载的手机号',
  `date_time` int(11) NOT NULL COMMENT '预订时间',
  `confirm_id` int(11) NOT NULL COMMENT '确认使用的商家ID',
  `total_fee` int(11) NOT NULL COMMENT '消费金额',
  `create_time` int(11) NOT NULL COMMENT '下载时间',
  `confirm_time` int(11) NOT NULL COMMENT '确认时间',
  `dp_id` int(11) NOT NULL COMMENT '为优惠券点评的ID',
  `location_id` int(11) NOT NULL COMMENT '优惠券消费门店ID',
  `return_money` decimal(20,4) NOT NULL COMMENT '验证返现',
  `return_score` int(11) NOT NULL COMMENT '验证返积分',
  `return_point` int(11) NOT NULL COMMENT '验证返经验',
  `expire_time` int(11) NOT NULL COMMENT '优惠券验证的过期时间0为无限期',
  `sms_count` int(11) NOT NULL COMMENT '短信通知的次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`youhui_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='优惠券短信下载记录';
INSERT INTO `%DB_PREFIX%youhui_log` VALUES ('52','20','32320441','71','0','0','13333333333','0','0','0','1424886836','0','0','0','0.0000','10','100','1425750836','0');
INSERT INTO `%DB_PREFIX%youhui_log` VALUES ('53','23','91723490','71','0','0','13333333333','0','0','0','1424891808','0','0','0','0.0000','10','100','1429211808','0');
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_sc`;
CREATE TABLE `%DB_PREFIX%youhui_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inx_youhui_sc` (`uid`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端优惠券收藏表';

CREATE TABLE `%DB_PREFIX%deal_stock` (
  `deal_id` int(11) NOT NULL,
  `buy_count` int(11) NOT NULL,
  `stock_cfg` int(11) NOT NULL,
  `time_status` tinyint(1) NOT NULL,
  `buy_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`deal_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库存事务表';
insert into `%DB_PREFIX%deal_stock` (deal_id,buy_count,stock_cfg,time_status,buy_status) select id,buy_count,max_bought,time_status,buy_status from %DB_PREFIX%deal;

CREATE TABLE `%DB_PREFIX%user_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_account` varchar(255) NOT NULL,
  `bank_user` varchar(255) NOT NULL,
  `bank_mobile` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `%DB_PREFIX%store_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '默认为 0 到店买单支付',
  `supplier_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pay_status` tinyint(1) NOT NULL COMMENT '支付状态 0:未支付 2:全部付款',
  `total_price` decimal(20,4) NOT NULL COMMENT '消费金额',
  `pay_amount` decimal(20,4) NOT NULL COMMENT '实付金额 当pay_amount+discount_price = total_price 支付成功',
  `discount_price` decimal(20,4) NOT NULL COMMENT '优惠金额',
  `promote_ids` varchar(100) NOT NULL COMMENT '促销规则编号',
  `promote_data` text NOT NULL COMMENT '存储优惠的信息',
  `after_sale` tinyint(1) NOT NULL COMMENT '售后处理标识 0:正常订单 1:退款处理的订单',
  `order_status` tinyint(1) NOT NULL COMMENT '订单状态 0:开放状态（可操作不可删除） 1:结单（不可操作可删除）',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `payment_id` int(11) NOT NULL COMMENT '支付方式',
  `bank_id` varchar(255) NOT NULL COMMENT '银行直连支付的银行编号',
  `location_id` int(11) NOT NULL COMMENT '消费门店ID',
  `monery` int(11) NOT NULL COMMENT '购买的积分数',
  `extra_status` tinyint(1) NOT NULL COMMENT '额外的订单标识 0:正常的订单 1.金额超额产生退款的订单（多次支付，重付通知） ,自动退款到用户的订单）',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `user_mobile` varchar(11) NOT NULL COMMENT '用户手机号',
`payment_fee`  decimal(20,4) NOT NULL COMMENT '手续费',
`promote`  text NOT NULL COMMENT '该订单享受的优惠的详细数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sn` (`order_sn`),
  KEY `order_sn` (`order_sn`),
  KEY `type` (`type`),
  KEY `supplier_id` (`supplier_id`),
  KEY `pay_status` (`pay_status`),
  KEY `order_status` (`order_status`),
  KEY `is_delete` (`is_delete`),
  KEY `promote_id` (`promote_ids`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户订单表';

CREATE TABLE `%DB_PREFIX%store_pay_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户订单操作的日志表';