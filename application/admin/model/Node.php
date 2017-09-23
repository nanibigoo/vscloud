<?php

namespace app\admin\model;

use think\Model;

class Node extends Model
{
    public function users()
    {
    	return $this->belongsToMany('user');
    }
}
