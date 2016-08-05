<?php
namespace Shop\Model;
use Think\Model;

class ShopDistributionProfitModel extends Model {
	protected $tableName = 'distribution_profit';
	protected $_validate = array(
		//array('uid','/[0-9]\d*/','uid参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
	);

	public function add_or_edit_profit($data)
	{
		$profit = $this->get_profit_one(array('mid'=>$data['mid']));
		if($profit){
			$data['update_time'] = NOW_TIME;
			$ret = $this->where('mid='.$data['mid'])->setInc('sum',$data['amount']);
			$ret = $this->where('mid='.$data['mid'])->setInc('withdraw',$data['amount']);
			$ret = $this->where('mid='.$data['mid'])->save($data);
		}
		else{
			$data['sum'] = $data['amount'];
			$data['withdraw'] = $data['amount'];
			$data['create_time'] = NOW_TIME;
			$ret = $this->add($data);
		}
		return $ret;
	}

	public function withdraw_profit($data)
	{
		$data['update_time'] = NOW_TIME;
		$ret = $this->where('id='.$data['id'])->setDec('withdraw',$data['price']);
		$ret = $this->where('id='.$data['id'])->save($data);
		return $ret;
	}

	public function get_profit_by_id($id)
	{
		$ret = $this->where('id = '.$id)->find();

		return $ret;
	}

	public function get_profit_list($option){
		if (!empty($option['mid'])){
			$where_arr[] = 'mid = ' . $option['mid'];
		}
		if (!empty($option['orderby'])){
			$order_str = $option['orderby'].' desc';
		}else{
			$order_str = 'mid desc';
		}
		$where_str = '';
		if (!empty($where_arr)){
			$where_str .=  implode(' and ', $where_arr);
		}
		$ret['list']  = $this->where($where_str)->order($order_str)->page($option['page'], $option['r'])->select();
		$ret['count'] = $this->where($where_str)->count();
		return $ret;
	}

	public function get_profit_one($option){
		if (!empty($option['mid'])){
			$where_arr[] = 'mid = ' . $option['mid'];
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

