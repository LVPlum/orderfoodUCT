<?php
namespace Shop\Model;
use Think\Model;

class ShopCouponModel extends Model{
	//用户收货地址
	protected $tableName='shop_coupon';
	protected $key = 'Coupon1';
	protected $_validate = array(
		array('brief','0,255','留言长度不对',1,'length'),
		array('title','1,32','优惠券名称长度不对',1,'length'),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, 1),
		array('duration', 0, 1),
		array('publish_cnt', 0, 1),
	); 

	public function add_or_edit_coupon($coupon)
	{
		if(!empty($coupon['id']))
		{
			$ret = $this->where('id ='.$coupon['id'])->save($coupon);
		}
		else
		{
			$ret = $this->add($coupon);
		}
		return $ret;
	}

	public function delete_coupon($ids)
	{
		return $this->where('id in ('.implode(',',$ids).')')->delete();
	}

	/*
		店铺优惠劵列表
	*/
	public function get_coupon_lsit($option)
	{
		if(isset($option['valuation']) && $option['valuation'] >= 0) {
			$where_arr[] = 'valuation = '.$option['valuation'];
		}
		if(!empty($option['available'])) {
			$where_arr[] = '(publish_cnt = 0 || publish_cnt >= used_cnt) && (expire_time = 0 || expire_time >= '.$_SERVER['REQUEST_TIME'].')';
		}
		if(!empty($option['key'])) {
			$where_arr[] = '(title like "%'.addslashes($option['key']).'%" || brief like "%'.addslashes($option['key']).'%")';
		}
		if(!empty($option['id'])) {
			$where_arr[] =  'id = '.$option['id'];
		}
		$where_str = '';
		if (!empty($where_arr))
		{
			$where_str .=  implode(' and ', $where_arr);
		}
		$ret['list'] = $this->where($where_str)->order('id desc')->page($option['page'], $option['r'])->select();
		$ret['list'] = $this->func_get_coupon($ret['list']);
		//header("Content-type:text/html;charset=utf8");dump($ret['list']);exit;
		$ret['count'] = $this->where($where_str)->count();
		return $ret;
	}

	public function get_coupon_by_id($id)
	{
		$ret  = $this->where('id='.$id)->find($id);
		if(!empty($ret['rule'])) $ret['rule'] = json_decode($ret['rule'], true);
		return $ret;
	}

	public function func_get_coupon($item)
	{
//		if(!empty($item['brief'])) $item['brief'] = XssHtml::clean_xss($item['brief']);
		foreach($item as &$row){
			if(!empty($row['rule'])) $row['rule'] = json_decode($row['rule'], true);
		}
		return $item;
	}

	/*
	 * 加密
	 */
	public function encrypt_id($id)
	{
		$id = \Think\Crypt\Driver\Des::encrypt($id,md5($this->key),0);
		$id = base64_encode($id);
		return $id;
	}

	/*
	 * 解密
	 */
	public function decrypt_id($id)
	{
		$id = base64_decode($id);
		if(!$id)
		{

			return false;
		}
		$id =\Think\Crypt\Driver\Des::decrypt($id,md5($this->key));
		return $id;

	}

	/*
	 * 设置密钥
	 */
	public function set_key($key)
	{
		$this->key = $key;
	}

	/*
	 * 获取密钥
	 */
	public function get_key()
	{
		return $this->key;
	}
}

