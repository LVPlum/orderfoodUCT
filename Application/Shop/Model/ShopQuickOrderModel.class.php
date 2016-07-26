<?php
namespace Shop\Model;
use Think\Model;

class ShopQuickOrderModel extends Model{
	protected $tableName='shop_quick_order';
	protected $_validate = array(
		array('images','0,256','图片信息有误',Model::MUST_VALIDATE,'length'),
		array('typeid','/[1-9]\d*/','类型id参数错误',Model::EXISTS_VALIDATE),
		array('quantity','/[0-9]\d*/','采购数量参数错误',Model::MUST_VALIDATE),
		array('connection','/[0-9]\d*/','联系方式参数错误',Model::MUST_VALIDATE),
		array('user_id','/[0-9]\d*/','user_id参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, Model::MODEL_INSERT)
	);

	public function edit_status_quick_order($ids,$status)
	{
		is_array($ids) ||
		$ids = explode(',',$ids);
		return $this->where('id in ('.implode(',',$ids).')')->save(array('check_time'=>NOW_TIME));

	}

	public function add_or_edit_quick_order($quickorder)
	{
		if(!empty($quickorder['id'])){
			return	$this->save($quickorder);
		}else{
			return	$this->add($quickorder);
		}
	}

	public function get_quick_order_list($option){
		$where_str = '';
		empty($option['check_time']) || $where_arr[] = "check_time != ''";
		empty($option['user_id']) || $where_arr[] = 'user_id = ' . $option['user_id'];
		empty($option['id']) || $where_arr[] = 'id = ' . $option['id'];
		empty($where_arr) || $where_str .= implode(' and ', $where_arr);

		$order_str = '';
		$order_arr[] = (empty($order_arr) ? 'create_time desc' : $order_arr);
		$order_str .= implode(' , ', $order_arr);

		$option['page'] = (empty($option['page']) ? 1 : $option['page']);
		$option['r']    = (empty($option['r']) ? 10 : $option['r']);

		$ret['list']  = $this->where($where_str)->order($order_str)->page($option['page'], $option['r'])->select();
		$ret['count'] = $this->where($where_str)->count();

		return $ret;
	}

	protected function _after_select(&$ret,$option)
	{

	}

	protected function _after_find(&$ret,$option)
	{

	}

}