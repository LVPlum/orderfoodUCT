<?php
namespace Shop\Model;
use Think\Model;

class ShopDistributionOrdersModel extends Model {
	protected $tableName = 'distribution_orders';
	protected $_validate = array(
		//array('uid','/[0-9]\d*/','uid参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
	);

	public function add_or_edit_distribution_orders($data)
	{
		if(empty($data['id'])){
			$ret = $this->add($data);
		}else{
			$ret = $this->where('id='.$data['id'])->save($data);
		}
		return $ret;
	}

	public function get_distribution_orders_by_id($id)
	{
		$ret = $this->where('id = '.$id)->find();

		return $ret;
	}

	public function get_distribution_orders_list($option){
		if (!empty($option['uid'])){
			$where_arr[] = 'uid = ' . $option['user_id'];
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

	public function get_distribution_order_one($option){
		if (!empty($option['uid'])){
			$where_arr[] = 'uid = ' . $option['user_id'];
		}
		if (!empty($option['top_user_id'])){
			$where_arr[] = 'top_user_id = ' . $option['top_user_id'];
		}
		if (!empty($option['status'])){
			$where_arr[] = 'status = ' . $option['status'];
		}
		if (!empty($option['level'])){
			$where_arr[] = 'levelid = ' . $option['level'];
		}
		
		$where_str = '';
		if (!empty($where_arr)){
			$where_str .=  implode(' and ', $where_arr);
		}
		$ret = $this->where($where_str)->find();
		return $ret;
	}

	public function delete_distribution_orders($ids)
	{
		if(!is_array($ids))
		{
			$ids = array($ids);
		}
		$data['status'] = 3;
		$ret = $this->where('id in ('.implode(',',$ids).')')->save($data);
		return ret;

	}

	public function settle_distribution_orders($option='')
	{
		if (!empty($option['level'])){
			$where_arr[] = 'levelid = ' . $option['level'];
		}
		$where_arr[] = 'status = 1';
		
		$where_str = '';
		if (!empty($where_arr)){
			$where_str .=  implode(' and ', $where_arr);
		}
		$data['status'] = 2;
		$ret = $this->where($where_str)->save($data);
		return ret;

	}

}

