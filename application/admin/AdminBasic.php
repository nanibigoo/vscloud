<?php
namespace app\admin;
use think\Controller;
use think\facade\Session;
use com\Auth;
use app\admin\repository\User as UserRepository;

/**
 * 后台基础类
 */
class AdminBasic extends Controller
{
	protected $user;
	
	public function initialize()
	{
		$this->user = new UserRepository();
		$this->_initialize();

		$uid = Session::get('king_auth.id');
		if($uid){

			if(!$this->checkAccess()){
				$this->error('您没有访问权限');
			}

			$user = $this->user->byId($uid);
			$this->assign('admin',$user);
		}else{
			if ($this->request->isPost()) {
                $this->error("您还没有登录！", '/king/login');
            } else {
                header("Location:/king/login");
                exit();
            }
		}
		
	}

	protected function _initialize()
	{

	}

	/**
	 * 权限验证
	 * @return [type] [description]
	 */
	private function checkAccess()
	{
		$auth = new Auth();
		$action = $this->getActionName();
		return $auth->check($action,Session::get('king_auth.id'));
	}

	/**
	 * 获取当前action
	 * @return [type] [description]
	 */
	private function getActionName()
	{
		return strtolower($this->request->module().'/'.$this->request->controller().'/'.$this->request->action());
	}
}