<?php

namespace app\admin\model;

use think\Model;

class Alipay extends Model
{
    public function hospital(){
    	return $this->belongsTo('User');
    }
}
