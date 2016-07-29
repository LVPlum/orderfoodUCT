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

}

