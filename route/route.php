<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});

Route::get('hello/:name', 'index/hello');

/* 后台模块 */
Route::get('king/index','admin/index/index');

/* 后台登录模块 */
Route::get('king/login','admin/login/login');
Route::get('king/logout','admin/login/logout');
Route::post('king/login','admin/login/doLogin');
Route::post('king/password','admin/login/changePwd')
	->validate([
			'password'=>'require|alphaDash|max:10',
			'repassword' =>'require|confirm:password',
		]);
Route::get('king/password','admin/login/changePwd');
Route::rule('king/nickname','admin/login/changePwd')
	->method('get,ajax');

/* 系统用户模块 */
Route::resource('king/user','admin/user');
Route::post('king/user/status/:id','admin/user/changeStatus');

Route::get('auth','com/auth/demo');