<?php

namespace app\admin\model;

use think\Model;

class Hospital extends Model
{
    protected $auto = [];
    protected $insert = ['status' => 1];  
    protected $update = []; 
	protected $readonly = ['name','id','create_at'];

	public function alipay(){
		return $this->hasOne('Alipay');
	}
}
