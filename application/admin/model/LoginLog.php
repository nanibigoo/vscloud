<?php

namespace app\admin\model;

use think\Model;

class LoginLog extends Model
{
    public function user()
    {
    	return $this->belongsTo('user');
    }
}
