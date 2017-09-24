<?php
namespace app\admin\repository;

use app\admin\model\Node as NodeModel;

/**
 * 系统用户仓库
 */
class Node
{
	public function byId($id)
	{
		return NodeModel::find($id);
	}

	public function select($field=true,$order = 'id desc')
	{
		return NodeModel::field($field)->order($order)->select();
	}

	public function selectBy($map=[],$field=true,$order = 'id desc')
	{
		return NodeModel::where($map)->field($field)->order($order)->select();
	}

	public function create(array $node)
	{
		return NodeModel::create($node);
	}

	public function update($id,array $node)
	{
		return NodeModel::where('id',$id)->update($node);
	}

	public function setFieldById($id,$field,$value)
	{
		return NodeModel::where('id',$id)->setField($field,$value);
	}

	public function deleteById($id)
	{
		return NodeModel::where('id',$id)->delete();
	}

	public function deleteByIds($ids)
	{
		if($ids){
			return NodeModel::where('id','in',$ids)->delete();
		}
		return false;
	}

	// 切换用户状态
	public function toggleStatus($id)
	{
		$node = $this->byId($id);
		switch ($node['status']) {
			case 0:
				return $this->setFieldById($node['id'],'status',1);
				break;
			
			case 1:
				return $this->setFieldById($node['id'],'status',0);
				break;
		}
	}

	// 获取规则的树结构
	public function getTree()
	{
		$map = [
			'status' =>1,
			'pid'    =>0,
		];
		$nodes = $this->selectBy($map,true,'sort desc');
		if(!empty($nodes)){
			foreach ($nodes as $key => $node) {
				$nodes[$key]['child']=$this->getChild($node['id'],1);
			}
			return $nodes;
		}
		return null;
	}

	private function getChild($id,$level)
	{
		$map = [
			'status' =>1,
			'pid'    =>$id,
		];
		$nodes = $this->selectBy($map,true,'sort desc');
		if(!empty($nodes)&&$level==1){
			foreach ($nodes as $subkey => $value) {
				$nodes[$subkey]['subchild']=$this->getChild($value['id'],2);
			}
			return $nodes;
		}
		return $nodes;
	}
	
}