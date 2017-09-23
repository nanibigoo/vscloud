<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 系统用户模块验证
 */
class User extends Validate
{
	protected $rule = [
		'username'   =>'require|max:15',
		'nickname'   =>'require|max:20',
		'password'   =>'require|alphaDash|max:10',
		'repassword' =>'require|confirm:password'
	];
}