<?php
namespace Shop\Model;
use Think\Model;

class ShopDistributionModel extends Model {
	protected $tableName = 'shop_distribution';
	protected $_validate = array(
		array('user_id','/[0-9]\d*/','user_id参数错误',Model::MUST_VALIDATE),
	);
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
		array('status', 1, self::MODEL_INSERT),
	);

	public function add_or_edit_distribution($userLevel)
	{
		if(empty($userLevel['id'])){
			$ret = $this->add($userLevel);
		}else{
			$ret = $this->where('id='.$userLevel['id'])->save($userLevel);
		}
		return $ret;
	}

	public function delete_product($ids)
	{
		if(!is_array($ids))
		{
			$ids = array($ids);
		}
		$ret = $this->where('id in ('.implode(',',$ids).')')->delete();
		return true;

	}

	/*
	 * 获取商品信息
	 */
	public function get_product_by_id($id)
	{
		$ret = $this->where('id = '.$id)->find();

		return $ret;
	}

	public function get_product_list($option)
	{
		if(isset($option['cat_id']) && $option['cat_id'] >= 0) {
			$where_arr[] = 'cat_id = '.$option['cat_id'];
		}
		if(isset($option['status'])) {
			$where_arr[] = 'status = '.$option['status'];
		}
		if(isset($option['key'])) {
			$where_arr[] = 'title LIKE "%'.$option['key'].'%"';
		}
		$where_str ='';
		if(!empty($where_arr)) {
			$where_str .= implode(' and ', $where_arr);
		}
		if($option['sort'] == 1) {
			$sort_arr = 'price desc';
		}
		else if($option['sort'] == 2) {
			$sort_arr = 'price asc';
		}
		else if($option['sort'] == 3) {
			$sort_arr = 'sell_cnt desc';
		}
		else{
			$sort_arr = 'sort desc, create_time';
		}
		$ret['list'] = $this->where($where_str)->order($sort_arr)->page($option['page'],$option['r'])->field('content,sku_table,location,delivery_id',true)->select();
		$ret['count'] = $this->where($where_str)->count();

		return $ret;
	}


	/*
	 * 通过sku_id 获取商品
	 */
	public function get_product_by_sku_id($sku_id)
	{
		$sku_id = explode(';', $sku_id, 2);
		$product_id = $sku_id[0];

		$where_arr[] = 'id = '.$product_id.'';
		$where_str ='';
		if(!empty($where_arr)) {
			$where_str .= implode(' and ', $where_arr);
		}
		$ret = $this->where($where_str)->find();
		$ret['quantity_total'] = $ret['quantity'];
		if(!empty($sku_id[1]) && !empty($ret['sku_table']['info'][$sku_id[1]])) {
			$ret = array_merge($ret, $ret['sku_table']['info'][$sku_id[1]]);
		}
		unset($ret['sku_table']);
		$ret['sku_id'] = $sku_id;
		return $ret;
	}

	protected function _after_find(&$ret,$option)
	{
		if(!empty($ret['sku_table'])) $ret['sku_table'] = json_decode($ret['sku_table'],true);
	}

	protected function _after_select(&$ret,$option)
	{
		if(!empty($ret['sku_table'])) $ret['sku_table'] = json_decode($ret['sku_table'],true);
	}


	/*
	 * 取某个分类、某几个分类下所有分类的商品id
	 */
	public function get_all_product_id_by_cat_id($cat_id)
	{
		is_array($cat_id) || $cat_id = array($cat_id);
		$ret = $this->where('cat_id in ('.implode(',',$cat_id).')')->field('id')->select();
		is_array($ret) && $ret = array_column($ret,'id');
		return $ret;
	}
}

