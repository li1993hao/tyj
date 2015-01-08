<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 运动员身体机能管理控制器
 */
class PhysicalController extends BaseController{
    public function index(){
        $map = array('status'=>array('gt',-1));
        $list = D('Physical')->where($map)->select();
        int_to_string($list);
        //得到栏目树形结构
        $tree =list_to_tree($list,'id','pid','children');

        //得到树形结构的先序遍历集合
        $sortList= array();
        tree_to_list_first($tree,'children',$sortList);


        //判断节点是不是父亲节点的最后一个孩子
        //用于前台显示判断
        foreach($sortList as $key => $value){
            $children = &$sortList[$key]['children'];
            if(isset($children)){
                $count = count($children);
                foreach($sortList as $m_key => $m_value){
                    //当前孩子节点的ID等于父亲节点ID，则是最后一个节点
                    if($m_value['id'] == $children[$count-1]['id']){
                        $sortList[$m_key]['last'] = true;
                    }
                }
            }
        }

        $this->assign("nodeList",$sortList);
        $this->display();
    }

    public function  add(){
        $Physical = D('Physical');
        //保存提交
        if(IS_POST){
            //更新或者是添加,由模型在底层根据是否由id进行判断
            if($Physical->update()){
                $this->success("操作成功",U("index"));
            }else{
                $error = $Physical->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        }else{
            $id = I('id');
            if(is_numeric($id)){
                $node = $Physical->where(array('id'=>$id))->find();
                $this->assign('node',$node);
                $this->assign('select_id',$node['pid']);
            }else{
                $this->assign('select_id',I('select_id'));
            }
            $this->assign('pid',$Physical->getPhysical($node));
            $this->display();
        }
    }


    public function setStatus(){
        parent::setStatus('Physical');
    }


    /**
     * 批量倒入项目
     */
    public function import(){
        if(IS_POST){
            $tree = I('tree');
            if($tree){
                $array = preg_split('/[\r\n]+/', trim($tree, ",;\r\n"));
                $pre0 = 0; //前置根节点
                $pre1 = 0; //前置1级节点
                $pre2 = 0; //前置2级节点
                foreach($array as $str){
                    $info = str2arr(trim($str,",;\r\n"),',');
                    $data['code'] = $info[0];
                    $data['name'] = $info[1];
                    if(isset($info[2])){
                        $data['eng_name'] = $info[2];
                    }
                    if(isset($info[3])){
                        $data['unit'] = $info[3];
                    }else{
                        $data['unit'] = '';
                    }

                    $level = (strlen($info[0])/2)-1;

                    if($level==0){//根节点
                        $data['pid'] = 0;
                        $pre0 = D('Physical')->add($data); //直接保存
                        $res = $pre0;
                    }elseif($level==1){//1级节点
                        $data['pid'] = $pre0;
                        $pre1 = D('Physical')->add($data); //直接保存
                        $res = $pre1;
                    }elseif($level==2){//2级节点
                        $data['pid'] = $pre1;
                        $pre2 = D('Physical')->add($data); //直接保存
                        $res = $pre2;
                    }else{//叶子节点
                        $data['pid'] = $pre2;
                        $res =  D('Physical')->add($data); //直接保存
                    }


                    if(!$res){
                        $this->error(D('Physical')->getDbError());
                    }
                }
                $this->success('导入成功!');
            }else{
                $this->error('输入不能为空!');
            }
        }else{
            $this->display();
        }
    }

}
