<?php

namespace app\admin\controller;

use think\Controller;
use think\facade\Session;
use app\admin\repository\User as UserRepository;

/**
 * 后台登录模块
 */
class Login extends Controller
{

    protected $user;

    protected function initialize()
    {
        $userRepository = new UserRepository();
        $this->user =  $userRepository;
    }

    // 登录
    public function login()
    {
    	if(is_login()){
    		$this->redirect('/king/index');
    	}else{
    		return $this->fetch();
    	}
    }

    // 退出
    public function logout()
    {
    	if(is_login()){
    		Session::clear();
    		$this->success('退出成功','/king/login');
    	}else{
    		$this->redirect('/king/login');
    	}
    }

    // 登录确认页面 
    public function doLogin()
    {
    	if($this->request->isAjax()){
    		$request = $this->request->param();
    		$user = model('User')->login($request);
    		return $user;
    	}else{
    		throw new Exception("非法请求");
    	}
    }

    // 修改密码
    public function changePwd()
    {
    	$this->checkLogin();

    	if($this->request->isPost()){
            $password = set_password($this->request->param('password'));
            $user = $this->user->setFieldById(Session::get('king_auth.id'),'password',$password);
            return $user;
    	}else{
            dump(Session::get());
    		$this->assign('meta-title','修改密码');
    		return $this->fetch();
    	}
    }

    // 验证是否登录
    private function checkLogin()
    {
    	if(!is_login()){
    		if($this->request->isGet()){
    			$this->error('登录超时，请先登录','/king/login');
    		}elseif($this->request->isAjax()){
    			$this->error('登录超时，请先登录');
    		}
    	}

    	return true;
    }
}
