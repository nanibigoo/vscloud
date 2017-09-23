<?php

namespace app\admin\model;

use think\Model;
use think\facade\Session;

class User extends Model
{

	protected $auto = [];
    protected $insert = ['status' => 1,'password'];
    protected $update = [];

	protected $readonly = ['username','id','create_at'];

	public function setPasswordAttr($value)
	{
		return set_password($value);
	}

	// 登录
    public function login(array $user)
    {
    	$map = [
			'username' => $user['username'],
			'password' => set_password($user['password'])
    	];
    	$user = $this->where($map)->find();

    	if($user){
    		$this->autoLogin($user);
    	}else{
    		return json(['code'=>404]);
    	}
    }
    
    // 登录数据操作
    private function autoLogin($user)
    {
    	// 记录session信息
    	$auth = [
    		'id'=>$user->id,
    		'nickname'=>$user->nickname,
    		'username'=>$user->username,
    		'last_login_at'=>$user->last_login_at
    	];

    	Session::set('king_auth',$auth);
    	Session::set('king_auth_sign',data_auth_sign($auth));
    	$this->where($auth)->setField('last_login_at',date('Y-m-d H:i:s'));
    }

    public function logs()
    {
    	return $this->hasMany('Log');
    }

    public function nodes()
    {
        return $this->belongsToMany('Node');
    }

}
