<?php
namespace app\admin\repository;

use app\admin\model\User as UserModel;
use think\facade\Session;

/**
 * 系统用户仓库
 */
class User
{
	public function byId($id)
	{
		return UserModel::find($id);
	}

	public function select($field=true,$order = 'id desc')
	{
		return UserModel::field($field)->order($order)->select();
	}

	public function create(array $user)
	{
		return UserModel::create($user);
	}

	public function setFieldById($id,$field,$value)
	{
		return UserModel::where('id',$id)->setField($field,$value);
	}

	public function deleteById($id)
	{
		return UserModel::where('id',$id)->delete();
	}

	// 切换用户状态
	public function toggleStatus($id)
	{
		$user = $this->byId($id);
		switch ($user['status']) {
			case 0:
				return $this->setFieldById($user['id'],'status',1);
				break;
			
			case 1:
				return $this->setFieldById($user['id'],'status',0);
				break;
		}
	}
	// 返回当前用户所有节点信息
	public function userNode()
	{
		$user = $this->byId(Session::get('king_auth.id'));
		return $user->nodes;
	}
}