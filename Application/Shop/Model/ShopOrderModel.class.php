<?php
namespace Shop\Model;
use Think\Model;

class ShopOrderModel extends Model {

	const PAY_TYPE_NULL      = 0; //未设置付款方式
	const PAY_TYPE_FREE      = 1; //免费无需付款
	const PAY_TYPE_CACHE     = 2; //货到付款
	const PAY_TYPE_ALIPAY    = 10; //支付宝
	const PAY_TYPE_WEIXINPAY = 11; //微信支付

	const ORDER_WAIT_TALK         = 12; //待沟通
	const ORDER_WAIT_USER_PAY     = 1; //待付款
	const ORDER_WAIT_FOR_DELIVERY = 2; //待发货
	const ORDER_WAIT_USER_RECEIPT = 3; //待收货
	const ORDER_DELIVERY_OK       = 4; //已收货
	const ORDER_COMMENT_OK        = 5; //已评价
	const ORDER_NEGOTATION_OK     = 6; //协商完成
	const ORDER_UNDER_NEGOTATION  = 8; //协商中(退货,换货)
	const ORDER_SHOP_CANCELED     = 9; //店家已取消
	const ORDER_CANCELED          = 10; //已取消
	const ORDER_WAIT_SHOP_ACCEPT  = 11; //等待卖家确认
	protected $tableName = 'shop_order';
	protected $_validate = array(
		array('title', '1,64', '分类标题长度不对', 1, 'length'),
		array('title_en', '0,128', '分类英文标题长度不对', 2, 'length'),
	);
	protected $_auto     = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
		array('status', '1', self::MODEL_INSERT),
		//array('parent_id', '0', self::MODEL_INSERT),
	);

	/*
	 * 获取订单列表
	 */
	public function get_order_list($option){
		if (!empty($option['user_id'])){
			$where_arr[] = 'user_id = ' . $option['user_id'];
		}
		if (!empty($option['status'])){
			$where_arr[] = 'status = ' . $option['status'];
		}
		if (!empty($option['no_status'])){
			$where_arr[] = 'status != ' . $option['no_status'];//不是这个状态的
		}
		if (!empty($option['create_time'])){ //最近一段时间的订单
			$where_arr[] = 'create_time >= ' . $option['create_time'];
		}
		if (!empty($option['ids'])){
			$where_arr[] = 'id in(' . implode(',', $option['ids']) . ')';
		}
		if (!empty($option['key'])){ //搜索订单号  和 商品名称
			$where_arr[] = '(products like "%' .
				addslashes('title":"'.trim(str_replace(array('\\u'), array('\\\\u'), json_encode($option['key'])), '"')) . '%")';
		}
		$where_str = '';
		if (!empty($where_arr)){
			$where_str .=  implode(' and ', $where_arr);
		}
		$ret['list']  = $this->where($where_str)->order('create_time desc')->page($option['page'], $option['r'])->select();
		$ret['count'] = $this->where($where_str)->count();
		return $ret;
	}

	/*
	 * 获取订单
	 */
	public function get_order_by_id($id){
		$ret =$this->where('id =' . $id)->find() ;
		return $ret;
	}

	protected function _after_select(&$ret,$option){
		foreach ($ret as &$ret){
			$ret['products'] =(!empty($ret['products']) ? json_decode($ret['products'],true)  : '');
			$ret['address'] =(!empty($ret['address']) ? json_decode($ret['address'],true)  : '');
			$ret['info'] =(!empty($ret['info']) ? json_decode($ret['info'],true)  : '');
			$ret['product_cnt'] = count($ret['products']);
			$ret['product_quantity'] = array_sum(array_column($ret['products'],'quantity'));
			$ret['product_title'] = (empty($ret['products'])?'':$ret['products'][0]['title']);
		}
		// array_walk($ret,
		// 	function(&$ret){
		// 		$this->func_get_oreder($ret);
		// 	});
	}

	protected function _after_find(&$ret,$option){
		$ret['products'] =(!empty($ret['products']) ? json_decode($ret['products'],true)  : '');
		$ret['address'] =(!empty($ret['address']) ? json_decode($ret['address'],true)  : '');
		$ret['info'] =(!empty($ret['info']) ? json_decode($ret['info'],true)  : '');
		$ret['product_cnt'] = count($ret['products']);
		$ret['product_quantity'] = array_sum(array_column($ret['products'],'quantity'));
		$ret['product_title'] = (empty($ret['products'])?'':$ret['products'][0]['title']);		
	}

	private function func_get_oreder(&$ret){
		$ret['products'] =(!empty($ret['products']) ? json_decode($ret['products'],true)  : '');
		$ret['address'] =(!empty($ret['address']) ? json_decode($ret['address'],true)  : '');
		$ret['info'] =(!empty($ret['info']) ? json_decode($ret['info'],true)  : '');
		$ret['product_cnt'] = count($ret['products']);
		$ret['product_quantity'] = array_sum(array_column($ret['products'],'quantity'));
		$ret['product_title'] = (empty($ret['products'])?'':$ret['products'][0]['title']);
	}

	/*
	 * 编辑订单
	 */
	public function add_or_edit_order($order){
		if (empty($order['id'])){
			$ret = $this->add($order);
		}
		else{
			$ret = $this->where('id=' . $order['id'])->save($order);
		}
		return $ret;
	}

	/*
	 * 删除订单
	 */
	public function delete_order($ids){
		if (!is_array($ids)){
			$ids = array($ids);
		}
		return $this->where('id in (' . implode(',', $ids) . ')')->delete();
	}

	public function get_order_status_list_select(){
		return array(
			array('id' => 0, 'value' => '全部'),
			array('id' => self::ORDER_WAIT_TALK, 'value' => '待沟通'),
			array('id' => self::ORDER_WAIT_USER_PAY, 'value' => '待付款'),
			//array('id' => self::ORDER_WAIT_SHOP_ACCEPT, 'title' => '待接单'),
			array('id' => self::ORDER_WAIT_FOR_DELIVERY, 'value' => '待发货'),
			array('id' => self::ORDER_WAIT_USER_RECEIPT, 'value' => '待收货'),
			array('id' => self::ORDER_UNDER_NEGOTATION, 'value' => '待退款'),
			array('id' => self::ORDER_DELIVERY_OK, 'value' => '已完成'),
			array('id' => self::ORDER_COMMENT_OK, 'value' => '已评价'),
			array('id' => self::ORDER_CANCELED, 'value' => '已取消'),
			array('id' => self::ORDER_SHOP_CANCELED, 'value' => '卖家取消'),
			array('id' => self::ORDER_NEGOTATION_OK, 'value' => '已退款'),
		);
	}

	public function get_order_status_config_select(){
		return array(
			self::ORDER_WAIT_TALK=> '待沟通',
			self::ORDER_WAIT_USER_PAY=> '待付款',
			//self::ORDER_WAIT_SHOP_ACCEPT=> '待接单',
			self::ORDER_WAIT_FOR_DELIVERY=> '待发货',
			self::ORDER_WAIT_USER_RECEIPT=> '待收货',
			self::ORDER_UNDER_NEGOTATION=> '待退款',
			self::ORDER_DELIVERY_OK => '已完成',
			self::ORDER_COMMENT_OK=> '已评价',
			self::ORDER_CANCELED=> '已取消',
			self::ORDER_SHOP_CANCELED=> '卖家取消',
			self::ORDER_NEGOTATION_OK=> '已退款',
		);
	}
}

