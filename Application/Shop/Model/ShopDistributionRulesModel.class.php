<?php
namespace Shop\Model;
use Think\Model;

class ShopDistributionRulesModel extends Model {
	protected $tableName = 'distribution_rules';
	protected $_validate = array(
		//array('uid','/[0-9]\d*/','uid参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
	);

	public function add_or_edit_rules($data)
	{
		if(empty($data['id'])){
			$ret = $this->add($data);
		}else{
			$ret = $this->where('id='.$data['id'])->save($data);
		}
		return $ret;
	}

	public function get_rules_by_id($id)
	{
		$ret = $this->where('id = '.$id)->find();

		return $ret;
	}

	public function get_rules_list($option){
		if (!empty($option['status'])){
			$where_arr[] = 'status = ' . $option['status'];
		}
		$where_str = '';
		if (!empty($where_arr)){
			$where_str .=  implode(' and ', $where_arr);
		}
		$ret['list']  = $this->where($where_str)->order('status asc')->page($option['page'], $option['r'])->select();
		$ret['count'] = $this->where($where_str)->count();
		return $ret;
	}

	public function get_rule_one($option){
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

}

