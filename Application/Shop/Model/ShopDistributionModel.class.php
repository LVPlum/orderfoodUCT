<?php
namespace Shop\Model;
use Think\Model;

class ShopDistributionModel extends Model {
	protected $tableName = 'shop_distri_user';
	protected $_validate = array(
		array('user_id','/[0-9]\d*/','user_id参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
		array('status', 1, self::MODEL_INSERT),
	);

	public function add_or_edit_distribution($data)
	{
		if(empty($data['id'])){
			$ret = $this->add($data);
		}else{
			$ret = $this->where('id='.$data['id'])->save($data);
		}
		return $ret;
	}

	public function get_distribution_by_uid($uid)
	{
		$ret = $this->where('user_id = '.$uid)->find();

		return $ret;
	}

	public function get_distribution_by_id($id)
	{
		$ret = $this->where('id = '.$id)->find();

		return $ret;
	}

	public function get_distribution_list($option){
		if (!empty($option['user_id'])){
			$where_arr[] = 'user_id = ' . $option['user_id'];
		}
		if (!empty($option['top_user_id'])){
			$where_arr[] = 'top_user_id = ' . $option['top_user_id'];
		}
		if (!empty($option['status'])){
			$where_arr[] = 'status = ' . $option['status'];
		}
		if (!empty($option['level'])){
			$where_arr[] = 'level = ' . $option['level'];
		}
		if (!empty($option['orderby'])){
			$order_str = $option['orderby']=='level'?'level asc':$option['orderby'].' desc';
		}else{
			$order_str = 'id desc';
		}
		$where_str = '';
		if (!empty($where_arr)){
			$where_str .=  implode(' and ', $where_arr);
		}
		$ret['list']  = $this->where($where_str)->order($order_str)->page($option['page'], $option['r'])->select();
		$ret['count'] = $this->where($where_str)->count();
		return $ret;
	}


}

