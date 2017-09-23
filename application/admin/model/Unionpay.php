<?php

namespace app\admin\model;

use think\Model;

class Unionpay extends Model
{
    public function hospital(){
    	return $this->belongsTo('User');
    }
}
