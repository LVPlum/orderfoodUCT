-- -----------------------------
-- 表结构 `uctoo_shop_attr_field`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_attr_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_attr_group`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_attr_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_attr_info`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_attr_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_cart`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '顾客id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sku_id` varchar(128) NOT NULL COMMENT '格式 pruduct_id;尺寸:X;颜色:红色',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '件数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `us` (`user_id`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='购物车';


-- -----------------------------
-- 表结构 `uctoo_shop_coupon`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `duration` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期, 单位为秒, 0表示长期有效',
  `publish_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总发放数量',
  `used_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已发放数量',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券图片',
  `brief` varchar(256) NOT NULL DEFAULT '' COMMENT '优惠券说明',
  `valuation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型, 0 现金券, 1 折扣券',
  `rule` text NOT NULL COMMENT '计费json {discount: 1000}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='优惠券';


-- -----------------------------
-- 表结构 `uctoo_shop_delivery`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模板名称',
  `brief` varchar(256) NOT NULL DEFAULT '' COMMENT '模板说明',
  `valuation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '计费方式, 0 固定邮费, 1 计件',
  `rule` text NOT NULL COMMENT '计费json {express: {normal:{start:2,start_fee:10,add:1, add_fee:12}, custom:{location:[{}],}}}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_messages`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `reply_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id, 0表示商户回复',
  `extra_info` varchar(255) NOT NULL DEFAULT '' COMMENT '其他信息',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '留言',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 待审核, 1 审核成功,  2 审核失败',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_nature_field`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_nature_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_nature_group`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_nature_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_nature_info`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_nature_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_order`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '顾客id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `paid_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `recv_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `paid_fee` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最终支付的总价, 单位为分',
  `discount_fee` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已优惠的价格, 是会员折扣, 现金券,积分抵用 之和',
  `delivery_fee` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邮费',
  `use_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用了多少积分',
  `back_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '返了多少积分',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '12' COMMENT '12 待沟通, 1 待付款, 2 待发货, 3 已发货, 4 已收货, 5 维权完成, 8 维权中, 10 已取消',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 未设置, 1 免费无需付款 , 2 货到付款, 10 支付宝, 11 微信支付',
  `pay_info` varchar(512) NOT NULL DEFAULT '' COMMENT '根据pay_type有不同的数据',
  `address` varchar(512) NOT NULL DEFAULT '' COMMENT '收货信息json {province:广东,city:深圳,town:南山区,address:工业六路,name:猴子,phone:15822222222, delivery:express}',
  `delivery_info` varchar(512) NOT NULL DEFAULT '' COMMENT '发货信息 {name:顺丰快递, order:12333333}',
  `info` text NOT NULL COMMENT '信息 {remark: 买家留言, fapiao: 发票抬头}',
  `products` text NOT NULL COMMENT '商品信息[{sku_id:"pruduct_id;尺寸:X;颜色:红色", paid_price:100, quantity:2, title:iphone,main_img:xxxxxx}]',
  `reply_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='订单';


-- -----------------------------
-- 表结构 `uctoo_shop_product`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cat_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '商品标题',
  `content` text NOT NULL COMMENT '商品详情',
  `main_img` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `images` text NOT NULL COMMENT '商品图片,分号分开多张图片',
  `like_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `fav_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `comment_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `sell_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总销量',
  `score_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评分次数',
  `score_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总评分',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格,单位为分',
  `ori_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '原价,单位为分',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `product_code` varchar(64) NOT NULL DEFAULT '' COMMENT '商家编码,可用于搜索',
  `info` varchar(32) NOT NULL DEFAULT '0' COMMENT '从低到高默认 0 不货到付款, 1不包邮 2不开发票 3不保修 4不退换货 5不是新品 6不是热销 7不是推荐',
  `back_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买返还积分',
  `point_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分换购所需分数',
  `buy_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限购数,0不限购',
  `sku_table` text NOT NULL COMMENT 'sku表json字符串,空表示没有sku, 如{table:[{尺寸:[X,M,L]}], info: }',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '货物所在地址json {country:中国,province:广东,city:深圳,town:南山区,address:工业六路}',
  `delivery_id` int(11) NOT NULL DEFAULT '0' COMMENT '运费模板id, 不设置将免运费',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序,从大到小',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 正常, 1 下架',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_product_cats`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_product_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父分类id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `title_en` varchar(128) NOT NULL DEFAULT '' COMMENT '分类名称英文',
  `image` int(11) NOT NULL DEFAULT '0' COMMENT '图片id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序,从大到小',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 正常, 1 隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_product_comment`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_product_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 未审核, 1 审核成功, 20 审核失败',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `images` varchar(256) NOT NULL DEFAULT '' COMMENT '晒图,分号分开多张图片',
  `score` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '用户打分, 1 ~ 5 星',
  `brief` varchar(256) NOT NULL DEFAULT '' COMMENT '回复内容',
  `sku_id` varchar(64) NOT NULL DEFAULT '' COMMENT '商品 sku_id',
  PRIMARY KEY (`id`),
  KEY `po` (`product_id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='评论';


-- -----------------------------
-- 表结构 `uctoo_shop_product_extra_info`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_product_extra_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序,从大到小',
  `ukey` varchar(32) NOT NULL COMMENT '键',
  `data` varchar(512) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品更多信息表';


-- -----------------------------
-- 表结构 `uctoo_shop_product_sell`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_product_sell` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '交易id',
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `paid_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单价格',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '下单数目',
  `detail` text NOT NULL COMMENT '商品信息{sku_id:"pruduct_id;尺寸:X;颜色:红色"}',
  PRIMARY KEY (`id`),
  KEY `po` (`product_id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='交易记录';


-- -----------------------------
-- 表结构 `uctoo_shop_quick_order`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_quick_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `check_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家确认时间',
  `content` text NOT NULL COMMENT '规格和要求',
  `connection` bigint(20) NOT NULL COMMENT '收货信息json {province:广东,city:深圳,town:南山区,address:工业六路,name:猴子,phone:15822222222, delivery:express}',
  `quantity` varchar(255) NOT NULL COMMENT '采购数量',
  `unit` tinyint(3) unsigned NOT NULL COMMENT '数量单位',
  `images` text NOT NULL COMMENT '图片附件',
  `typeid` tinyint(3) unsigned NOT NULL COMMENT '采购类型id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='快捷订单';


-- -----------------------------
-- 表结构 `uctoo_shop_remark`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_remark` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id, 0表示商户回复',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '回复信息',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 已删除',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='回复信息表';


-- -----------------------------
-- 表结构 `uctoo_shop_slides`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_slides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '幻灯片id',
  `image` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片图片',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '图片说明',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序,从大到小',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 正常, 1 隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- -----------------------------
-- 表结构 `uctoo_shop_user_address`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '顾客id',
  `modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后使用时间',
  `name` varchar(64) NOT NULL COMMENT '收货人姓名',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '市',
  `town` varchar(16) NOT NULL DEFAULT '' COMMENT '县',
  `address` varchar(64) NOT NULL DEFAULT '' COMMENT '详细地址',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='收货地址';


-- -----------------------------
-- 表结构 `uctoo_shop_user_coupon`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_user_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户优惠券id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间,0表示永不过期',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '使用的订单id, 0表示未使用',
  `read_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领取时间 或 阅读时间',
  `coupon_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `info` text NOT NULL COMMENT '计费json {title: 10元, img: xxx, valuation: 0, rule{discount: 1000}}',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='优惠券';

-- -----------------------------
-- 表内记录 `uctoo_shop_attr_group`
-- -----------------------------
INSERT INTO `uctoo_shop_attr_group` VALUES ('1', '实物商品attr', '1', '1403847366', '1', '1');
INSERT INTO `uctoo_shop_attr_group` VALUES ('2', '虚拟商品attr', '1', '1423537648', '2', '0');
INSERT INTO `uctoo_shop_attr_group` VALUES ('3', '其他商品', '1', '1423538446', '3', '0');
INSERT INTO `uctoo_shop_attr_group` VALUES ('4', '123', '-1', '1466385045', '1', '1');
INSERT INTO `uctoo_shop_attr_group` VALUES ('5', '热二位', '-1', '1466405067', '0', '0');
INSERT INTO `uctoo_shop_attr_group` VALUES ('6', '123', '-1', '1466566059', '0', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_attr_info`
-- -----------------------------
INSERT INTO `uctoo_shop_attr_info` VALUES ('1', '1', '1', '156124198attr', '1455555555', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('13', '1', '6', '0', '1466472399', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('12', '1', '5', '测试简介内容啊attr', '1466472399', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('11', '1', '4', '0', '1466472399', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('10', '1', '3', '0', '1466472399', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('9', '1', '2', '1464747000', '1466472399', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('24', '1', '9', '测试测试attr', '1466490289', '1466566191');
INSERT INTO `uctoo_shop_attr_info` VALUES ('23', '1', '7', '电饭煲电饭煲attr', '1466490289', '1466566191');
-- -----------------------------
-- 表内记录 `uctoo_shop_cart`
-- -----------------------------
INSERT INTO `uctoo_shop_cart` VALUES ('18', '100', '1467360712', '3', '1');
-- -----------------------------
-- 表内记录 `uctoo_shop_coupon`
-- -----------------------------
INSERT INTO `uctoo_shop_coupon` VALUES ('1', '1466658122', '2592000', '100', '6', '满100减99', '4', '<p>测试优惠券说明，很优惠很优惠，满100减99</p>', '0', '{\"max_cnt\":123,\"max_cnt_day\":12,\"min_price\":10000,\"discount\":9900}');
INSERT INTO `uctoo_shop_coupon` VALUES ('2', '1467012969', '0', '333', '5', '节日优惠', '13', '<p>士大夫撒旦法撒旦发的鬼地方个地方水电费水电费水电费水电费</p>', '0', '{\"max_cnt\":33,\"max_cnt_day\":3,\"min_price\":223,\"discount\":222}');
-- -----------------------------
-- 表内记录 `uctoo_shop_delivery`
-- -----------------------------
INSERT INTO `uctoo_shop_delivery` VALUES ('1', '1466989259', '运费模板一', '<p>通用模板<br/></p>', '0', '{\"express\":\"123123\",\"mail\":\"131\",\"ems\":\"123123123\"}');
-- -----------------------------
-- 表内记录 `uctoo_shop_messages`
-- -----------------------------
INSERT INTO `uctoo_shop_messages` VALUES ('1', '0', '0', '1', '', 'sdfsdf', '1467096142', '1');
INSERT INTO `uctoo_shop_messages` VALUES ('2', '0', '0', '1', '', '建议网站速度快一点', '1467513437', '0');
INSERT INTO `uctoo_shop_messages` VALUES ('3', '0', '0', '1', '', '是电饭锅电饭锅', '1467770927', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_nature_field`
-- -----------------------------
INSERT INTO `uctoo_shop_nature_field` VALUES ('1', 'qq', '1', '1', '1', '0', 'input', '', '', '1', '1409045825', 'string', '');
INSERT INTO `uctoo_shop_nature_field` VALUES ('2', '生日', '1', '1', '1', '0', 'time', '', '', '1', '1423537409', '', '请按年-月-日的格式输入');
INSERT INTO `uctoo_shop_nature_field` VALUES ('3', '擅长语言', '2', '1', '1', '0', 'select', 'Java|C++|Python|php|object c|ruby', '', '1', '1423537693', '', '');
INSERT INTO `uctoo_shop_nature_field` VALUES ('4', '承接项目', '2', '1', '1', '0', 'radio', '是|否', '', '1', '1423537733', '', '');
INSERT INTO `uctoo_shop_nature_field` VALUES ('5', '简介', '2', '1', '1', '0', 'textarea', '', '', '1', '1423537770', '', '简单介绍入行以来的工作经验，项目经验');
INSERT INTO `uctoo_shop_nature_field` VALUES ('6', '其他技能', '2', '1', '1', '0', 'checkbox', 'PhotoShop|Flash', '', '1', '1423537834', '', '');
INSERT INTO `uctoo_shop_nature_field` VALUES ('7', '昵称', '3', '1', '1', '0', 'input', '', '', '1', '1423704462', 'string', 'OSC账号昵称');
INSERT INTO `uctoo_shop_nature_field` VALUES ('9', 'test', '1', '1', '1', '0', 'input', '测试默认值', '', '1', '1466407632', 'string', '');
-- -----------------------------
-- 表内记录 `uctoo_shop_nature_group`
-- -----------------------------
INSERT INTO `uctoo_shop_nature_group` VALUES ('1', '实物商品', '1', '1403847366', '2', '1');
INSERT INTO `uctoo_shop_nature_group` VALUES ('2', '虚拟商品', '1', '1423537648', '3', '0');
INSERT INTO `uctoo_shop_nature_group` VALUES ('3', '其他商品', '1', '1423538446', '4', '0');
INSERT INTO `uctoo_shop_nature_group` VALUES ('4', '123', '-1', '1466385045', '1', '1');
INSERT INTO `uctoo_shop_nature_group` VALUES ('5', '热二位', '-1', '1466405067', '0', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_nature_info`
-- -----------------------------
INSERT INTO `uctoo_shop_nature_info` VALUES ('1', '1', '1', '156124198', '1455555555', '1466496147');
INSERT INTO `uctoo_shop_nature_info` VALUES ('13', '1', '6', '0,1', '1466472399', '1466496147');
INSERT INTO `uctoo_shop_nature_info` VALUES ('12', '1', '5', '测试简介内容啊', '1466472399', '1466496390');
INSERT INTO `uctoo_shop_nature_info` VALUES ('11', '1', '4', '1', '1466472399', '1466496147');
INSERT INTO `uctoo_shop_nature_info` VALUES ('10', '1', '3', '3', '1466472399', '1466496147');
INSERT INTO `uctoo_shop_nature_info` VALUES ('9', '1', '2', '1465472384', '1466472399', '1466496147');
INSERT INTO `uctoo_shop_nature_info` VALUES ('38', '3', '6', '0', '1466501639', '1466566251');
INSERT INTO `uctoo_shop_nature_info` VALUES ('39', '3', '7', '衬衫的昵称', '1466501639', '0');
INSERT INTO `uctoo_shop_nature_info` VALUES ('24', '1', '9', '测试测试', '1466490289', '1466496147');
INSERT INTO `uctoo_shop_nature_info` VALUES ('23', '1', '7', '电饭煲电饭煲1', '1466490289', '1466496352');
INSERT INTO `uctoo_shop_nature_info` VALUES ('37', '3', '5', '衬衫的简介', '1466501639', '0');
INSERT INTO `uctoo_shop_nature_info` VALUES ('36', '3', '4', '0', '1466501638', '0');
INSERT INTO `uctoo_shop_nature_info` VALUES ('35', '3', '3', '1', '1466501638', '0');
INSERT INTO `uctoo_shop_nature_info` VALUES ('34', '3', '2', '1466501598', '1466501638', '0');
INSERT INTO `uctoo_shop_nature_info` VALUES ('33', '3', '1', '123123123435', '1466501638', '0');
INSERT INTO `uctoo_shop_nature_info` VALUES ('40', '3', '9', '衬衫test', '1466501639', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_order`
-- -----------------------------
INSERT INTO `uctoo_shop_order` VALUES ('18', '1', '1466664240', '0', '0', '0', '11', '0', '0', '0', '0', '12', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"20\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"0\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('19', '1', '1466670304', '0', '1467251721', '1467251739', '2', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"567\",\"courier_name\":\"567567\",\"courier_phone\":567567567}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"2\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('20', '1', '1466670315', '0', '1467107839', '1467107845', '2', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"12312\",\"courier_name\":\"32131231\",\"courier_phone\":323123132}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"2\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('21', '1', '1466670315', '0', '1467108092', '1467108097', '2', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"231213\",\"courier_name\":\"41231231\",\"courier_phone\":342424}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"2\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('22', '1', '1466670316', '0', '0', '0', '2', '0', '0', '0', '0', '9', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"2\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('23', '1', '1466733986', '0', '1466759922', '1467103986', '121', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"2342342\",\"courier_name\":\"\\u800c\\u594b\\u6597\\u542c\\u6b4c\\u7684\",\"courier_phone\":2147483647}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"2\",\"main_img\":\"8\"},{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"20\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('24', '1', '1466734528', '0', '1467106956', '1467107679', '0', '0', '0', '0', '0', '5', '1', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"4524\",\"courier_name\":\"4546\",\"courier_phone\":45646}', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"10\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('25', '1', '1466737184', '0', '0', '0', '0', '0', '0', '0', '0', '12', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"10\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('26', '1', '1466737187', '0', '0', '0', '0', '0', '0', '0', '0', '12', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"10\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('27', '1', '1466737188', '0', '1467280180', '1467280198', '30000', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"423234\",\"courier_name\":\"342432\",\"courier_phone\":4235252}', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"10\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('28', '1', '1466757776', '0', '1467106577', '1467106595', '50000', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"\\u6309\\u65f6\\u5927\\u5927\",\"courier_name\":\"\\u963f\\u4e09\\u5927\\u58f0\\u9053\",\"courier_phone\":0}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34\",\"main_img\":\"8\"},{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"10\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('29', '1', '1467096928', '0', '0', '0', '8', '0', '0', '0', '0', '12', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"4\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('30', '1', '1467096931', '0', '1467281558', '1467281566', '8', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"23123\",\"courier_name\":\"23423\",\"courier_phone\":34234}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"4\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('31', '1', '1467097081', '0', '1467106791', '1467106798', '500000', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"87979\",\"courier_name\":\"7897897\",\"courier_phone\":879789}', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"14\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('32', '1', '1467099108', '0', '1467353930', '1467354439', '0', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"weasd\",\"courier_name\":\"sda\",\"courier_phone\":0}', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"0\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"14\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('33', '1', '1467104151', '0', '1467104427', '1467104441', '100000', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"12313\",\"courier_name\":\"123123\",\"courier_phone\":12312}', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"20\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('34', '1', '1467107019', '0', '1467107105', '1467107112', '60000', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"courier_no\":\"32432\",\"courier_name\":\"23424\",\"courier_phone\":23424}', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"10\",\"paid_price\":\"1\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"14\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('35', '100', '1467360740', '0', '1467360931', '1467361592', '90000000', '0', '0', '0', '0', '5', '0', '', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"\"}', '{\"courier_no\":\"fgyfsh\",\"courier_name\":\"sfhgfhc\",\"courier_phone\":0}', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"20\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('36', '1', '1467513051', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467512962\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"123123\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('37', '1', '1467513233', '0', '0', '0', '20', '0', '0', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467512962\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"20\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('38', '1', '1467600987', '1467683608', '0', '0', '500', '0', '0', '0', '0', '2', '9', '{\"info\":\"this is test pay\"}', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"1\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\",\"main_img\":\"14\"},{\"sku_id\":\"1\",\"quantity\":\"1\",\"paid_price\":\"12\",\"title\":\"T\\u6064\",\"main_img\":\"9\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('39', '1', '1467601129', '1467683452', '1467689352', '1467689374', '60000000', '0', '123123', '0', '0', '5', '9', '{\"info\":\"this is test pay\"}', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '{\"courier_no\":\"123123\",\"courier_name\":\"34234\",\"courier_phone\":456456456}', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('40', '1', '1467680634', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('41', '1', '1467685561', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"dfd\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('42', '1', '1467685564', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"dfd\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('43', '1', '1467685721', '0', '0', '0', '445555', '0', '0', '0', '0', '1', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"50000\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('44', '1', '1467686534', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('45', '1', '1467686663', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('46', '1', '1467776155', '0', '0', '0', '172903', '222', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467706832\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"50000\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"},{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('47', '101', '1467957506', '1467958907', '0', '0', '1', '0', '0', '0', '0', '2', '11', '{\"callback_time\":1467959116,\"transaction_id\":\"4007022001201607088581256626\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"11\",\"user_id\":\"101\",\"modify_time\":\"1467957479\",\"name\":\"\\u597d\\u597d\\u8bf4\",\"phone\":\"13345678901\",\"province\":\"\\u8fbd\\u5b81\\u7701\",\"city\":\"\\u5bbd\\u7538\\u6ee1\\u65cf\\u81ea\\u6cbb\\u53bf\",\"town\":\"\\u4e39\\u4e1c\\u5e02\",\"address\":\"\\u597d\\u9ad8\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"1\",\"quantity\":\"1\",\"paid_price\":\"12\",\"title\":\"T\\u6064\",\"main_img\":\"9\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('48', '101', '1467959165', '1467959264', '0', '0', '1', '0', '0', '0', '0', '2', '11', '{\"callback_time\":1467960848,\"transaction_id\":\"4007022001201607088581390740\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"11\",\"user_id\":\"101\",\"modify_time\":\"1467957479\",\"name\":\"\\u597d\\u597d\\u8bf4\",\"phone\":\"13345678901\",\"province\":\"\\u8fbd\\u5b81\\u7701\",\"city\":\"\\u5bbd\\u7538\\u6ee1\\u65cf\\u81ea\\u6cbb\\u53bf\",\"town\":\"\\u4e39\\u4e1c\\u5e02\",\"address\":\"\\u597d\\u9ad8\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"50000\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('49', '101', '1467961161', '1467961206', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1467961884,\"transaction_id\":\"4007022001201607088583363735\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"11\",\"user_id\":\"101\",\"modify_time\":\"1467957479\",\"name\":\"\\u597d\\u597d\\u8bf4\",\"phone\":\"13345678901\",\"province\":\"\\u8fbd\\u5b81\\u7701\",\"city\":\"\\u5bbd\\u7538\\u6ee1\\u65cf\\u81ea\\u6cbb\\u53bf\",\"town\":\"\\u4e39\\u4e1c\\u5e02\",\"address\":\"\\u597d\\u9ad8\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"},{\"sku_id\":\"3\",\"quantity\":\"2\",\"paid_price\":\"50000\",\"title\":\"\\u886c\\u886b\",\"main_img\":\"6\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('50', '101', '1467962110', '1467962158', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1467962157,\"transaction_id\":\"4007022001201607088584716020\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"11\",\"user_id\":\"101\",\"modify_time\":\"1467957479\",\"name\":\"\\u597d\\u597d\\u8bf4\",\"phone\":\"13345678901\",\"province\":\"\\u8fbd\\u5b81\\u7701\",\"city\":\"\\u5bbd\\u7538\\u6ee1\\u65cf\\u81ea\\u6cbb\\u53bf\",\"town\":\"\\u4e39\\u4e1c\\u5e02\",\"address\":\"\\u597d\\u9ad8\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
INSERT INTO `uctoo_shop_order` VALUES ('51', '102', '1468046739', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"12\",\"user_id\":\"102\",\"modify_time\":\"1468046727\",\"name\":\"\\u7b80\\u5355\\u5c31\\u662f\\u4f60\",\"phone\":\"17102827177393\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u66f2\\u6c5f\\u533a\",\"town\":\"\\u97f6\\u5173\\u5e02\",\"address\":\"\\u5484\\u5484\\u602a\\u4e8b\\u5e38\\u5e38\\u8fdf\\u5230\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u9ad8\\u7ea7\\u9732\\u6c34....\\u8fd9\\u91cc\\u662f\\u6d4b\\u8bd5\\u540d\\u5b57\\u8fc7\\u957f\\u4f1a\\u4e0d\\u4f1a\\u6ea2\\u51fa\\u7684\\u95ee\\u9898....222222222222222222222222\",\"main_img\":\"8\"}]', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_product`
-- -----------------------------
INSERT INTO `uctoo_shop_product` VALUES ('1', '1', 'T恤', '', '9', '', '0', '0', '0', '0', '2', '0', '0', '12', '23', '20', '', '', '0', '0', '0', '', '', '0', '1466392655', '1466667444', '0', '0');
INSERT INTO `uctoo_shop_product` VALUES ('2', '1', '高级露水....这里是测试名字过长会不会溢出的问题....222222222222222222222222', '<p>高级露水，美容养颜....</p>', '8', '6,9', '0', '0', '7', '0', '20', '7', '31', '2', '20', '196', '', '', '0', '0', '0', '', '', '1', '1466493907', '1467189162', '2', '0');
INSERT INTO `uctoo_shop_product` VALUES ('3', '1', '衬衫', '<p>商品详情测试</p>', '6', '', '0', '0', '3', '0', '11', '3', '15', '50000', '200000000', '210', '', '', '0', '0', '0', '', '', '0', '1466493935', '1467535961', '2', '0');
INSERT INTO `uctoo_shop_product` VALUES ('5', '2', '免费商品', '<p>测试免费商品</p>', '14', '', '0', '0', '6', '0', '9', '6', '23', '1', '2', '104', '', '7', '0', '0', '0', '', '', '0', '1466734485', '1467183759', '0', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_product_cats`
-- -----------------------------
INSERT INTO `uctoo_shop_product_cats` VALUES ('1', '0', '衣服', 'dress', '15', '1466392604', '0', '1');
INSERT INTO `uctoo_shop_product_cats` VALUES ('2', '0', '裤子', 'jeans', '16', '1466497448', '0', '1');
INSERT INTO `uctoo_shop_product_cats` VALUES ('3', '1', '测试下级分类', 'sdf', '9', '1466754953', '0', '1');
-- -----------------------------
-- 表内记录 `uctoo_shop_product_comment`
-- -----------------------------
INSERT INTO `uctoo_shop_product_comment` VALUES ('4', '2', '23', '0', '1', '1', '1467106314', '', '5', '小   啊啊实打实大', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('5', '3', '23', '0', '1', '1', '1467106314', '', '5', '三到四个范德萨但萨嘎地方', '3');
INSERT INTO `uctoo_shop_product_comment` VALUES ('6', '3', '33', '0', '1', '1', '1467106419', '', '5', '亲，谢谢惠顾，摸摸大', '3');
INSERT INTO `uctoo_shop_product_comment` VALUES ('7', '2', '28', '0', '1', '1', '1467106626', '', '3', '蹦蹦蹦', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('8', '5', '28', '0', '1', '1', '1467106626', '', '4', '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('9', '5', '31', '0', '1', '1', '1467106857', '', '2', '342432432413442423', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('10', '5', '34', '0', '1', '1', '1467107238', '', '2', '小鸟飞呀飞', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('11', '5', '24', '0', '1', '1', '1467107699', '', '5', '········改过了', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('12', '2', '20', '0', '1', '1', '1467107858', '', '3', 'TEse打算大声道', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('13', '2', '21', '0', '1', '1', '1467108112', '', '5', 'successful  ！！！！', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('14', '2', '19', '0', '1', '1', '1467279160', '', '5', 'sdfsdf', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('15', '5', '27', '0', '1', '1', '1467280239', '', '5', '这里是测试评价上传图片功能', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('16', '2', '30', '0', '1', '1', '1467281691', '/Uploads/Picture/2016-06-30/5774f0b11f79d.jpg', '5', '1231', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('17', '5', '32', '0', '1', '1', '1467355574', '/Uploads/Picture/2016-06-30/5774e3053084e.jpg;/Uploads/Picture/2016-06-30/5774f0b11f79d.jpg', '5', '图片测试', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('18', '3', '35', '0', '100', '1', '1467361857', '/Uploads/Picture/2016-07-01/57762a4119887.jpg', '5', '41231', '3');
INSERT INTO `uctoo_shop_product_comment` VALUES ('19', '2', '39', '0', '1', '1', '1468314468', '/Uploads/Picture/2016-07-05/577b3a122a61a.jpg', '5', '看看看看你', '2');
-- -----------------------------
-- 表内记录 `uctoo_shop_product_sell`
-- -----------------------------
INSERT INTO `uctoo_shop_product_sell` VALUES ('4', '2', '23', '1', '1467103986', '2', '1', '{\"sku_id\":\"2\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('5', '3', '23', '1', '1467103986', '20', '1', '{\"sku_id\":\"3\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('6', '3', '33', '1', '1467104441', '20', '1', '{\"sku_id\":\"3\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('7', '2', '28', '1', '1467106595', '2', '1', '{\"sku_id\":\"2\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('8', '5', '28', '1', '1467106595', '0', '1', '{\"sku_id\":\"5\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('9', '5', '31', '1', '1467106798', '1', '1', '{\"sku_id\":\"5\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('10', '5', '34', '1', '1467107112', '1', '10', '{\"sku_id\":\"5\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('11', '5', '24', '1', '1467107679', '1', '1', '{\"sku_id\":\"5\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('12', '2', '20', '1', '1467107845', '2', '1', '{\"sku_id\":\"2\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('13', '2', '21', '1', '1467108097', '2', '1', '{\"sku_id\":\"2\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('14', '2', '19', '1', '1467251739', '2', '1', '{\"sku_id\":\"2\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('15', '5', '27', '1', '1467280198', '1', '1', '{\"sku_id\":\"5\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('16', '2', '30', '1', '1467281566', '2', '4', '{\"sku_id\":\"2\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('17', '5', '32', '1', '1467354439', '1', '1', '{\"sku_id\":\"5\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('18', '3', '35', '100', '1467361592', '20', '1', '{\"sku_id\":\"3\"}');
INSERT INTO `uctoo_shop_product_sell` VALUES ('19', '2', '39', '1', '1467689374', '2', '1', '{\"sku_id\":\"2\"}');
-- -----------------------------
-- 表内记录 `uctoo_shop_quick_order`
-- -----------------------------
INSERT INTO `uctoo_shop_quick_order` VALUES ('19', '1', '1466670304', '1467251739', '', '0', '{\"remark\":\"\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('36', '1', '1467513051', '0', '', '0', '{\"remark\":\"123123\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('38', '1', '1467600987', '0', '{\"info\":\"this is test pay\"}', '0', '{\"remark\":\"\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('39', '1', '1467601129', '1467689374', '{\"info\":\"this is test pay\"}', '0', '{\"remark\":\"\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('40', '1', '1468317679', '0', '斯蒂芬森古典风格', '13345678903', '1212', '0', '/Uploads/Picture/2016-07-12/5784bfe5e87f2.jpg', '1');
INSERT INTO `uctoo_shop_quick_order` VALUES ('41', '1', '1468317822', '0', '斯蒂芬斯蒂芬斯蒂芬斯蒂芬', '13345678663', '345345', '0', '/Uploads/Picture/2016-07-12/5784c0650954a.jpg;/Uploads/Picture/2016-07-12/5784bfe5e87f2.jpg', '1');
INSERT INTO `uctoo_shop_quick_order` VALUES ('42', '1', '1468319421', '0', '斯蒂芬斯蒂芬斯蒂芬斯蒂芬', '13345678663', '345345', '0', '/Uploads/Picture/2016-06-23/576b918816dd3.png', '1');
INSERT INTO `uctoo_shop_quick_order` VALUES ('43', '1', '1468378390', '0', 'sdfsadf', '13345678888', '234234', '0', '/Uploads/Picture/2016-06-23/576b918816dd3.png', '1');
-- -----------------------------
-- 表内记录 `uctoo_shop_remark`
-- -----------------------------
INSERT INTO `uctoo_shop_remark` VALUES ('5', '38', '1', 'saewdasd', '1467769316', '0');
INSERT INTO `uctoo_shop_remark` VALUES ('6', '38', '1', 'saewdasd', '1467770779', '0');
INSERT INTO `uctoo_shop_remark` VALUES ('7', '43', '1', 'dfgdfg', '1467941691', '0');
INSERT INTO `uctoo_shop_remark` VALUES ('8', '43', '1', 'sdfsdf', '1467941754', '0');
INSERT INTO `uctoo_shop_remark` VALUES ('9', '43', '1', 'sdfsdf', '1467941772', '0');
INSERT INTO `uctoo_shop_remark` VALUES ('10', '43', '1', 'sdfsdfsdfsdf', '1467941819', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_slides`
-- -----------------------------
INSERT INTO `uctoo_shop_slides` VALUES ('1', '5', '商品推荐', 'http://m.baidu.com', '1466660316', '0', '0');
INSERT INTO `uctoo_shop_slides` VALUES ('2', '6', '节日活动', 'http://m.baidu.com', '1466667182', '0', '0');
INSERT INTO `uctoo_shop_slides` VALUES ('3', '8', '水电费', 'http://m.baidu.com', '1466668005', '0', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_user_address`
-- -----------------------------
INSERT INTO `uctoo_shop_user_address` VALUES ('7', '100', '1467360735', 'dasd', 'asdas', '天津市', '河东区', '', 'dasd');
INSERT INTO `uctoo_shop_user_address` VALUES ('8', '1', '1467706832', '李及基', '13345678901', '广东省', '南山区', '深圳市', '创新谷');
INSERT INTO `uctoo_shop_user_address` VALUES ('9', '1', '1467704350', '123', '12312312312', '广东省', '龙岗区', '深圳市', '尔特人');
INSERT INTO `uctoo_shop_user_address` VALUES ('10', '1', '1467704412', '1231', '12312312312', '山西省', '泽州县', '晋城市', '123123');
INSERT INTO `uctoo_shop_user_address` VALUES ('11', '101', '1467957479', '好好说', '13345678901', '辽宁省', '宽甸满族自治县', '丹东市', '好高');
INSERT INTO `uctoo_shop_user_address` VALUES ('12', '102', '1468046727', '简单就是你', '17102827177393', '广东省', '曲江区', '韶关市', '咄咄怪事常常迟到');
-- -----------------------------
-- 表内记录 `uctoo_shop_user_coupon`
-- -----------------------------
INSERT INTO `uctoo_shop_user_coupon` VALUES ('9', '1', '1467517017', '0', '0', '0', '2', '{\"title\":\"\\u8282\\u65e5\\u4f18\\u60e0\",\"img\":\"13\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":33,\"max_cnt_day\":3,\"min_price\":223,\"discount\":222}}');
INSERT INTO `uctoo_shop_user_coupon` VALUES ('10', '1', '1467517063', '1470109063', '0', '0', '1', '{\"title\":\"\\u6ee1100\\u51cf99\",\"img\":\"4\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":123,\"max_cnt_day\":12,\"min_price\":10000,\"discount\":9900}}');
INSERT INTO `uctoo_shop_user_coupon` VALUES ('11', '1', '1467517301', '0', '46', '0', '2', '{\"title\":\"\\u8282\\u65e5\\u4f18\\u60e0\",\"img\":\"13\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":33,\"max_cnt_day\":3,\"min_price\":223,\"discount\":222}}');
