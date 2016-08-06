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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='购物车';


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
-- 表结构 `uctoo_shop_distribution`
-- -----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_shop_distribution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `top_user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '上级用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `level` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '分销等级',
  `total_person` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下线人数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '1启用，2禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `us` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='分销用户表';


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
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='订单';


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='评论';


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
  `address` varchar(512) NOT NULL DEFAULT '' COMMENT '收货信息json {province:广东,city:深圳,town:南山区,address:工业六路,name:猴子,phone:15822222222, delivery:express}',
  `quantity` varchar(255) NOT NULL COMMENT '采购数量',
  `unit` tinyint(3) unsigned NOT NULL COMMENT '数量单位',
  `images` text NOT NULL COMMENT '图片附件',
  `typeid` tinyint(3) unsigned NOT NULL COMMENT '采购类型id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='快捷订单';


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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='收货地址';


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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='优惠券';

-- -----------------------------
-- 表内记录 `uctoo_shop_attr_field`
-- -----------------------------
INSERT INTO `uctoo_shop_attr_field` VALUES ('1', 'qq', '1', '1', '1', '0', 'input', '', '', '1', '1409045825', 'string', '');
INSERT INTO `uctoo_shop_attr_field` VALUES ('2', '生日attr', '1', '1', '1', '0', 'time', '', '', '1', '1423537409', '', '请按年-月-日的格式输入');
INSERT INTO `uctoo_shop_attr_field` VALUES ('3', '擅长语言', '2', '1', '1', '0', 'select', 'Java|C++|Python|php|object c|ruby', '', '1', '1423537693', '', '');
INSERT INTO `uctoo_shop_attr_field` VALUES ('4', '承接项目', '2', '1', '1', '0', 'radio', '是|否', '', '1', '1423537733', '', '');
INSERT INTO `uctoo_shop_attr_field` VALUES ('5', '简介attr', '2', '1', '1', '0', 'textarea', '', '', '1', '1423537770', '', '简单介绍入行以来的工作经验，项目经验');
INSERT INTO `uctoo_shop_attr_field` VALUES ('6', '其他技能', '2', '1', '1', '0', 'checkbox', 'PhotoShop|Flash', '', '1', '1423537834', '', '');
INSERT INTO `uctoo_shop_attr_field` VALUES ('7', '昵称', '3', '1', '1', '0', 'input', '', '', '1', '1423704462', 'string', 'OSC账号昵称');
INSERT INTO `uctoo_shop_attr_field` VALUES ('9', 'test', '1', '1', '1', '0', 'input', '测试默认值', '', '1', '1466407632', 'string', '');
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
INSERT INTO `uctoo_shop_cart` VALUES ('19', '1', '1467963651', '2', '2');
INSERT INTO `uctoo_shop_cart` VALUES ('20', '0', '1467965492', '2', '1');
INSERT INTO `uctoo_shop_cart` VALUES ('21', '0', '1468418426', '6', '1');
-- -----------------------------
-- 表内记录 `uctoo_shop_coupon`
-- -----------------------------
INSERT INTO `uctoo_shop_coupon` VALUES ('1', '1466658122', '2592000', '100', '7', '满100减99', '4', '<p>测试优惠券说明，很优惠很优惠，满100减99</p>', '0', '{\"max_cnt\":123,\"max_cnt_day\":12,\"min_price\":10000,\"discount\":9900}');
INSERT INTO `uctoo_shop_coupon` VALUES ('2', '1467012969', '0', '333', '5', '节日优惠', '13', '<p>士大夫撒旦法撒旦发的鬼地方个地方水电费水电费水电费水电费</p>', '0', '{\"max_cnt\":33,\"max_cnt_day\":3,\"min_price\":223,\"discount\":222}');
-- -----------------------------
-- 表内记录 `uctoo_shop_delivery`
-- -----------------------------
INSERT INTO `uctoo_shop_delivery` VALUES ('1', '1466989259', '运费模板一', '<p>通用模板<br/></p>', '0', '{\"express\":\"123123\",\"mail\":\"131\",\"ems\":\"123123123\"}');
-- -----------------------------
-- 表内记录 `uctoo_shop_distribution`
-- -----------------------------
INSERT INTO `uctoo_shop_distribution` VALUES ('8', '1', '13', '1469762942', '4', '1', '1');
INSERT INTO `uctoo_shop_distribution` VALUES ('9', '52', '12', '1468376700', '3', '3', '2');
INSERT INTO `uctoo_shop_distribution` VALUES ('10', '12', '11', '1469763059', '2', '0', '1');
INSERT INTO `uctoo_shop_distribution` VALUES ('11', '11', '0', '1469762942', '1', '1', '1');
INSERT INTO `uctoo_shop_distribution` VALUES ('12', '100', '12', '1470449986', '3', '2', '1');
INSERT INTO `uctoo_shop_distribution` VALUES ('14', '105', '100', '1470450487', '4', '0', '1');
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
INSERT INTO `uctoo_shop_order` VALUES ('47', '0', '1467966322', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"8\",\"user_id\":\"0\",\"modify_time\":\"1467966320\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('48', '1', '1469757421', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"10\",\"user_id\":\"1\",\"modify_time\":\"1467704412\",\"name\":\"1231\",\"phone\":\"12312312312\",\"province\":\"\\u5c71\\u897f\\u7701\",\"city\":\"\\u6cfd\\u5dde\\u53bf\",\"town\":\"\\u664b\\u57ce\\u5e02\",\"address\":\"123123\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('49', '1', '1470379384', '0', '0', '0', '11', '0', '123123', '0', '0', '1', '0', '', '{\"id\":\"10\",\"user_id\":\"1\",\"modify_time\":\"1467704412\",\"name\":\"1231\",\"phone\":\"12312312312\",\"province\":\"\\u5c71\\u897f\\u7701\",\"city\":\"\\u6cfd\\u5dde\\u53bf\",\"town\":\"\\u664b\\u57ce\\u5e02\",\"address\":\"123123\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('50', '105', '1470379759', '0', '0', '0', '0', '0', '123123', '0', '0', '1', '0', '', '{\"id\":\"11\",\"user_id\":\"105\",\"modify_time\":\"1470379752\",\"name\":\"\\u6768\\u6d66\",\"phone\":\"15512536548\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u56db\\u65b9\\u53f0\\u533a\",\"town\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"address\":\"\\u56de\\u6765\\u4e86\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('51', '105', '1470379981', '1470383416', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470383416,\"transaction_id\":\"4009552001201608050633485050\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjkZKRvNz7ANk40w7NTuaW08\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"11\",\"user_id\":\"105\",\"modify_time\":\"1470379752\",\"name\":\"\\u6768\\u6d66\",\"phone\":\"15512536548\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u56db\\u65b9\\u53f0\\u533a\",\"town\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"address\":\"\\u56de\\u6765\\u4e86\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('52', '100', '1470449352', '1470450868', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470450868,\"transaction_id\":\"4007022001201608060688551920\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\\u6d4b\\u8bd5\\u8ba2\\u5355\"}', '[{\"sku_id\":\"1\",\"quantity\":\"1\",\"paid_price\":\"12\",\"title\":\"\\u773c\\u955c\\u4e00\",\"main_img\":\"9\"},{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"},{\"sku_id\":\"3\",\"quantity\":\"1\",\"paid_price\":\"50000\",\"title\":\"\\u773c\\u955c\\u4e09\",\"main_img\":\"6\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('53', '105', '1470450224', '0', '0', '0', '123125', '0', '123123', '0', '0', '12', '0', '', '{\"id\":\"11\",\"user_id\":\"105\",\"modify_time\":\"1470379752\",\"name\":\"\\u6768\\u6d66\",\"phone\":\"15512536548\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u56db\\u65b9\\u53f0\\u533a\",\"town\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"address\":\"\\u56de\\u6765\\u4e86\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('54', '100', '1470451853', '1470452372', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470452372,\"transaction_id\":\"4007022001201608060690908496\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('55', '105', '1470452163', '0', '0', '0', '1', '0', '123123', '0', '0', '1', '0', '', '{\"id\":\"11\",\"user_id\":\"105\",\"modify_time\":\"1470379752\",\"name\":\"\\u6768\\u6d66\",\"phone\":\"15512536548\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u56db\\u65b9\\u53f0\\u533a\",\"town\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"address\":\"\\u56de\\u6765\\u4e86\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('56', '100', '1470452620', '1470453251', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470453252,\"transaction_id\":\"4007022001201608060690155259\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('57', '100', '1470454346', '1470454576', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470454577,\"transaction_id\":\"4007022001201608060692914810\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('58', '100', '1470456406', '1470456436', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470456436,\"transaction_id\":\"4007022001201608060695683485\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('59', '100', '1470460189', '1470460241', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470460242,\"transaction_id\":\"4007022001201608060702398979\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('60', '100', '1470460611', '1470460637', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470461573,\"transaction_id\":\"4007022001201608060702664751\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('61', '100', '1470462096', '1470462125', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470462125,\"transaction_id\":\"4007022001201608060702155819\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('62', '100', '1470462578', '1470462615', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470462615,\"transaction_id\":\"4007022001201608060704456425\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('63', '100', '1470462823', '1470462857', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470462857,\"transaction_id\":\"4007022001201608060704601075\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('64', '100', '1470462909', '1470462969', '0', '0', '1', '0', '0', '0', '0', '2', '11', '{\"callback_time\":1470462969,\"transaction_id\":\"4007022001201608060704672008\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjnhqdvI8x8fLGvp_OdYRlDA\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"7\",\"user_id\":\"100\",\"modify_time\":\"1467360735\",\"name\":\"dasd\",\"phone\":\"asdas\",\"province\":\"\\u5929\\u6d25\\u5e02\",\"city\":\"\\u6cb3\\u4e1c\\u533a\",\"town\":\"\",\"address\":\"dasd\",\"delivery\":\"\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"5\",\"quantity\":\"1\",\"paid_price\":\"1\",\"title\":\"\\u514d\\u8d39\\u5546\\u54c1\\u6d4b\\u8bd5\",\"main_img\":\"6\"}]');
INSERT INTO `uctoo_shop_order` VALUES ('65', '105', '1470466355', '1470467903', '0', '0', '1', '0', '123123', '0', '0', '2', '11', '{\"callback_time\":1470467905,\"transaction_id\":\"4009552001201608060709526949\",\"trade_type\":\"JSAPI\",\"appid\":\"wx2cdf8e0dffd4b2b2\",\"mch_id\":\"1228598202\",\"openid\":\"oWhGnjkZKRvNz7ANk40w7NTuaW08\",\"bank_type\":\"CFT\",\"fee_type\":\"CNY\",\"total_fee\":\"1\"}', '{\"id\":\"11\",\"user_id\":\"105\",\"modify_time\":\"1470379752\",\"name\":\"\\u6768\\u6d66\",\"phone\":\"15512536548\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u56db\\u65b9\\u53f0\\u533a\",\"town\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"address\":\"\\u56de\\u6765\\u4e86\",\"delivery\":\"express\"}', '', '{\"remark\":\"\"}', '[{\"sku_id\":\"2\",\"quantity\":\"1\",\"paid_price\":\"2\",\"title\":\"\\u773c\\u955c\\u4e8c\",\"main_img\":\"8\"}]');
-- -----------------------------
-- 表内记录 `uctoo_shop_product`
-- -----------------------------
INSERT INTO `uctoo_shop_product` VALUES ('1', '1', '眼镜一', '', '9', '', '0', '0', '0', '0', '2', '0', '0', '12', '23', '20', '', '', '0', '0', '0', '', '', '0', '1466392655', '1466667444', '0', '0');
INSERT INTO `uctoo_shop_product` VALUES ('2', '1', '眼镜二', '<p>配置，特点，说明等内容....</p><p><br/></p><p><img src=\"/Uploads/Picture/2016-07-05/577b3a122a61a.jpg\" style=\"\"/></p><p><img src=\"/Uploads/Editor/Picture/2016-07-15/57887d57d91fa.jpg\" style=\"\"/></p><p><br/></p>', '8', '6,9', '0', '0', '6', '0', '35', '6', '26', '2', '20', '181', '', '', '0', '0', '0', '', '', '1', '1466493907', '1468562841', '2', '0');
INSERT INTO `uctoo_shop_product` VALUES ('3', '1', '眼镜三', '<p>眼镜测试</p>', '6', '', '0', '0', '3', '0', '10', '3', '15', '50000', '200000000', '212', '', '', '0', '0', '0', '', '', '0', '1466493935', '1467535961', '2', '0');
INSERT INTO `uctoo_shop_product` VALUES ('5', '2', '免费商品测试', '<p>测试免费商品</p>', '6', '', '0', '0', '6', '0', '10', '6', '23', '1', '2', '103', '', '7', '0', '0', '0', '', '', '0', '1466734485', '1468476931', '0', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_product_cats`
-- -----------------------------
INSERT INTO `uctoo_shop_product_cats` VALUES ('1', '0', '普通眼镜', 'dress', '15', '1466392604', '0', '1');
INSERT INTO `uctoo_shop_product_cats` VALUES ('2', '0', '特殊眼镜', 'jeans', '16', '1466497448', '0', '1');
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
INSERT INTO `uctoo_shop_product_comment` VALUES ('11', '5', '24', '0', '1', '1', '1467107699', '', '3', '········改过了', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('12', '2', '20', '0', '1', '1', '1467107858', '', '3', 'TEse打算大声道', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('13', '2', '21', '0', '1', '1', '1467108112', '', '5', 'successful  ！！！！', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('14', '2', '19', '0', '1', '1', '1467279160', '', '5', 'sdfsdf', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('15', '5', '27', '0', '1', '1', '1467280239', '', '5', '这里是测试评价上传图片功能', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('16', '2', '30', '0', '1', '1', '1467281691', '/Uploads/Picture/2016-06-30/5774f0b11f79d.jpg', '5', '1231', '2');
INSERT INTO `uctoo_shop_product_comment` VALUES ('17', '5', '32', '0', '1', '1', '1467355574', '/Uploads/Picture/2016-06-30/5774e3053084e.jpg;/Uploads/Picture/2016-06-30/5774f0b11f79d.jpg', '5', '图片测试', '5');
INSERT INTO `uctoo_shop_product_comment` VALUES ('18', '3', '35', '0', '100', '2', '1467361857', '/Uploads/Picture/2016-07-01/57762a4119887.jpg', '5', '41231', '3');
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
INSERT INTO `uctoo_shop_quick_order` VALUES ('19', '1', '1466670304', '1467251739', '', '{\"id\":\"6\",\"user_id\":\"1\",\"modify_time\":\"1466650256\",\"name\":\"\\u9ece\\u9526\\u826f\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"remark\":\"\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('36', '1', '1467513051', '0', '', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467512962\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '{\"remark\":\"123123\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('38', '1', '1467600987', '0', '{\"info\":\"this is test pay\"}', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"\"}', '{\"remark\":\"\"}', '0', '', '0');
INSERT INTO `uctoo_shop_quick_order` VALUES ('39', '1', '1467601129', '1467689374', '{\"info\":\"this is test pay\"}', '{\"id\":\"8\",\"user_id\":\"1\",\"modify_time\":\"1467536326\",\"name\":\"\\u674e\\u53ca\\u57fa\",\"phone\":\"13345678901\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5357\\u5c71\\u533a\",\"town\":\"\\u6df1\\u5733\\u5e02\",\"address\":\"\\u521b\\u65b0\\u8c37\",\"delivery\":\"express\"}', '{\"remark\":\"\"}', '0', '', '0');
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
INSERT INTO `uctoo_shop_user_address` VALUES ('8', '0', '1467966320', '李及基', '13345678901', '广东省', '南山区', '深圳市', '创新谷');
INSERT INTO `uctoo_shop_user_address` VALUES ('9', '1', '1467704350', '123', '12312312312', '广东省', '龙岗区', '深圳市', '尔特人');
INSERT INTO `uctoo_shop_user_address` VALUES ('10', '1', '1467704412', '1231', '12312312312', '山西省', '泽州县', '晋城市', '123123');
INSERT INTO `uctoo_shop_user_address` VALUES ('11', '105', '1470379752', '杨浦', '15512536548', '黑龙江省', '四方台区', '双鸭山市', '回来了');
-- -----------------------------
-- 表内记录 `uctoo_shop_user_coupon`
-- -----------------------------
INSERT INTO `uctoo_shop_user_coupon` VALUES ('9', '1', '1467517017', '0', '0', '0', '2', '{\"title\":\"\\u8282\\u65e5\\u4f18\\u60e0\",\"img\":\"13\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":33,\"max_cnt_day\":3,\"min_price\":223,\"discount\":222}}');
INSERT INTO `uctoo_shop_user_coupon` VALUES ('10', '1', '1467517063', '1470109063', '0', '0', '1', '{\"title\":\"\\u6ee1100\\u51cf99\",\"img\":\"4\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":123,\"max_cnt_day\":12,\"min_price\":10000,\"discount\":9900}}');
INSERT INTO `uctoo_shop_user_coupon` VALUES ('11', '1', '1467517301', '0', '46', '0', '2', '{\"title\":\"\\u8282\\u65e5\\u4f18\\u60e0\",\"img\":\"13\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":33,\"max_cnt_day\":3,\"min_price\":223,\"discount\":222}}');
INSERT INTO `uctoo_shop_user_coupon` VALUES ('12', '107', '1470099312', '1472691312', '0', '0', '1', '{\"title\":\"\\u6ee1100\\u51cf99\",\"img\":\"4\",\"valuation\":\"0\",\"rule\":{\"max_cnt\":123,\"max_cnt_day\":12,\"min_price\":10000,\"discount\":9900}}');
