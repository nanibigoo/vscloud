<?php

namespace app\admin\controller;

use app\admin\AdminBasic;
use app\admin\repository\Node as NodeRepository;

/**
 * 系统用户授权
 */
class UserAccess extends AdminBasic
{
    protected $node;
    public function _initialize()
    {
        $this->node = new NodeRepository();
    }

    public function nodeTree()
    {
        $nodeList = $this->node->getTree();
        $usernodes = $this->user->userNode();
        $nodes = $this->getNodes($usernodes);
        $nodeTree = $this->getNodeTree($nodeList,$nodes);
        return $nodeTree;
    }

    private function getNodes($usernodes)
    {
        if($usernodes){
            $nodes=[];
            foreach ($usernodes as $key => $value) {
                $nodes[] = $value['pivot']['node_id'];
            }
            return $nodes;
        }
        return false;
    }

    private function getNodeTree($nodeList,$nodes)
    {
        if($nodes){
            foreach ($nodeList as $key => $node) {
                if(in_array($node['id'],$nodes)){
                    $nodeList[$key]['checked'] =1;
                }
                foreach ($node['child'] as $childkey => $child) {
                    if(in_array($child['id'],$nodes)){
                        $nodeList[$key]['child'][$childkey]['checked'] =1;
                    }
                    foreach ($child['subchild'] as $subkey => $subchild) {
                        if(in_array($subchild['id'],$nodes)){
                            $nodeList[$key]['child'][$childkey]['subchild'][$subkey]['checked'] =1;
                        }
                    }
                }
            }
        }
        return $nodeList;
    }
}
