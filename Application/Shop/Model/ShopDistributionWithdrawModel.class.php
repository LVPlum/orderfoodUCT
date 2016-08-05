<?php
namespace Shop\Model;
use Think\Model;

class ShopDistributionWithdrawModel extends Model {
	protected $tableName = 'distribution_withdraw';
	protected $_validate = array(
		//array('uid','/[0-9]\d*/','uid参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
	);

	public function add_withdraw($data)
	{
		$data['create_time'] = NOW_TIME;
		$ret = $this->add($data);
		return $ret;
	}

	public function get_withdraw_list($option){
		if (!empty($option['mid'])){
			$where_arr[] = 'mid = ' . $option['mid'];
		}
		if (!empty($option['op_uid'])){
			$where_arr[] = 'op_uid = ' . $option['op_uid'];
		}
		if (!empty($option['orderby'])){
			$order_str = $option['orderby'].' desc';
		}else{
			$order_str = 'create_time desc';
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

