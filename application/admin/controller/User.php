<?php

namespace app\admin\controller;

use app\admin\AdminBasic;
use think\facade\Session;
use app\admin\repository\User as UserRepository;
use com\Auth;

class User extends AdminBasic
{

    public function _initialize()
    {
        
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {

        $users = $this->user->select();

        $this->assign('users',$users);
        return $this->fetch();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        return $this->fetch();
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        $user = $request->param();
        $result = $this->validate($user,'User');
        if($result !== true){
            $this->error($result);
        }
        $user = $this->user->create($user);
        if($user){
            $this->success('新增用户成功','/king/user');
        }
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        dump('this is read');
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $user = $this->user->byId($id);
        $this->assign('user',$user);
        return $this->fetch();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        $nickname = $request->param('nickname');
        $uid = $this->user->setFieldById($id,'nickname',$nickname);
        if($id){
            $user = $this->user->byId($id);
            return $user;
        }
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return $this->user->deleteById($id);
    }

    
    // 改变状态
    public function changeStatus($id){
        return $this->user->toggleStatus($id);
    }
}
