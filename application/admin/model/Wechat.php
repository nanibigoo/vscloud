<?php

namespace app\admin\model;

use think\Model;

class Wechat extends Model
{
    public function hospital(){
    	return $this->belongsTo('User');
    }
}
