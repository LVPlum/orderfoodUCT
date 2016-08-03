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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='购物车';


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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='分销用户表';


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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='订单';


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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='收货地址';


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
INSERT INTO `uctoo_shop_distribution` VALUES ('8', '100', '0', '1469762942', '1', '1', '1');
INSERT INTO `uctoo_shop_distribution` VALUES ('9', '104', '100', '1468376700', '3', '3', '2');
INSERT INTO `uctoo_shop_distribution` VALUES ('10', '105', '104', '1469763059', '3', '0', '1');
-- -----------------------------
-- 表内记录 `uctoo_shop_messages`
-- -----------------------------
INSERT INTO `uctoo_shop_messages` VALUES ('1', '0', '0', '1', '', 'sdfsdf', '1467096142', '1');
INSERT INTO `uctoo_shop_messages` VALUES ('2', '0', '0', '1', '', '建议网站速度快一点', '1467513437', '0');
INSERT INTO `uctoo_shop_messages` VALUES ('3', '0', '0', '1', '', '是电饭锅电饭锅', '1467770927', '0');
-- -----------------------------
-- 表内记录 `uctoo_shop_product`
-- -----------------------------
INSERT INTO `uctoo_shop_product` VALUES ('1', '1', '眼镜一', '', '9', '', '0', '0', '0', '0', '1', '0', '0', '12', '23', '21', '', '', '0', '0', '0', '', '', '0', '1466392655', '1466667444', '0', '0');
INSERT INTO `uctoo_shop_product` VALUES ('2', '1', '眼镜二', '<p>配置，特点，说明等内容....</p><p><br/></p><p><img src=\"/Uploads/Picture/2016-07-05/577b3a122a61a.jpg\" style=\"\"/></p><p><img src=\"/Uploads/Editor/Picture/2016-07-15/57887d57d91fa.jpg\" style=\"\"/></p><p><br/></p>', '8', '6,9', '0', '0', '6', '0', '19', '6', '26', '2', '20', '197', '', '', '0', '0', '0', '', '', '1', '1466493907', '1468562841', '2', '0');
INSERT INTO `uctoo_shop_product` VALUES ('3', '1', '眼镜三', '<p>眼镜测试</p>', '6', '', '0', '0', '3', '0', '9', '3', '15', '50000', '200000000', '213', '', '', '0', '0', '0', '', '', '0', '1466493935', '1467535961', '2', '0');
INSERT INTO `uctoo_shop_product` VALUES ('5', '2', '免费商品测试', '<p>测试免费商品</p>', '6', '', '0', '0', '6', '0', '9', '6', '23', '1', '2', '104', '', '7', '0', '0', '0', '', '', '0', '1466734485', '1468476931', '0', '0');
INSERT INTO `uctoo_shop_product` VALUES ('6', '1', '雷朋 知书达理 ', '<table align=\"center\" data-sort=\"sortDisabled\"><tbody><tr class=\"firstRow\"><td align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\" rowspan=\"1\" colspan=\"2\">基本信息</td></tr><tr><td width=\"222\" align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\">产品型号</td><td width=\"222\" align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\">5296D</td></tr><tr><td width=\"222\" align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\">产品材料</td><td width=\"222\" align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\">板材</td></tr><tr><td width=\"222\" align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\">边框</td><td width=\"222\" align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\">全框</td></tr><tr><td align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\" rowspan=\"1\" colspan=\"1\">风格</td><td align=\"center\" valign=\"top\" style=\"-ms-word-break: break-all;\" rowspan=\"1\" colspan=\"1\">知书达理</td></tr></tbody></table><p><br/></p>', '8', '23', '0', '0', '0', '0', '0', '0', '0', '399', '688', '77', '', '6', '0', '0', '0', '', '', '0', '1468417393', '1468476210', '0', '0');
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
