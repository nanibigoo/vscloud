<?php
namespace app\admin\controller;
use think\Db;

class Index extends \think\Controller
{
    public function index()
    {
		$data = Db::name('user')->find();
		$this->assign('data',$data);
		return $this->fetch();
    }
}
