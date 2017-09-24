<?php

namespace app\admin\controller;

use app\admin\AdminBasic;
use app\admin\repository\Node as NodeRepository;
use com\Tree;

class Node extends AdminBasic
{
    protected $node;
    protected $model;
    public function _initialize()
    {
        $this->node  = new NodeRepository();
        $this->model = model('node');
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $nodes = $this->node->select(true,'sort desc,id desc');
        $this->assign('nodes',$nodes);
        return $this->fetch();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        $nodes = $this->node->getTree();

        $this->assign('nodes',$nodes);
        // dump($nodes);
        return $this->fetch();
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save()
    {
        $data = $this->request->param();
        unset($data['king']);
        return $this->node->create($data);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $node = $this->node->byId($id);
        $nodes = $this->node->getTree();
        $this->assign('nodes',$nodes);
        $this->assign('node',$node);
        return $this->fetch();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update($id)
    {
        $data = $this->request->param();
        unset($data['king']);
        return $this->node->update($id,$data);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return $this->node->deleteById($id);
    }

    /**
     * 批量删除
     * @return [type] [description]
     */
    public function deletes($ids)
    {
        return $this->node->deleteByIds($ids);
    }

    /**
     * 改变状态
     * @return [type] [description]
     */
    public function changeStatus($id)
    {
        $this->node->toggleStatus($id);
    }
}
