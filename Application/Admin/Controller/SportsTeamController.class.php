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
 * 运动队管理
 * @author huajie <banhuajie@163.com>
 */
class SportsTeamController extends ThinkController
{
    public function  index(){
        $list = M('SportTeam')->where(array('status'=>array('gt',-1)))->select();
        //得到栏目树形结构
        $tree =list_to_tree($list,'id','pid','children');

        //得到树形结构的先序遍历集合
        $sortList= array();
        tree_to_list_first($tree,'children',$sortList);
        MK();
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
    /**
     * 添加或者修改某条新闻
     */
    public function  add(){
        if(IS_POST){
            parent::add(C('SPORTS_TEAM'));
        }else{
            parent::add(C('SPORTS_TEAM'),'运动队'."[添加]");
        }
    }

    public function edit(){
        if(IS_POST){
            $id = I('post.id');
            parent::edit(C('SPORTS_TEAM'),$id);
        }else{
            $id = I('id');
            parent::edit(C('SPORTS_TEAM'),$id,'运动队'."[编辑]");
        }
    }

    public function  del(){
        parent::delete('SportTeam');
    }

    /**
     * 批量倒入项目
     */
    public function import(){
        if(IS_POST){
            $tree = I('tree');
            if($tree){
                $array = preg_split('/[,;\r\n]+/', trim($tree, ",;\r\n"));
                $pre0 = 0; //前置根节点
                $pre1 = 0; //前置1级节点
                $pre2 = 0; //前置2级节点
                foreach($array as $str){
                    $level =  substr_count($str, '#');
                    $name = str_replace('#','',$str);
                    if($level==0){//根节点
                        $pre0 = $this->save_sports($name,0,0); //直接保存
                        $res = $pre0;
                    }elseif($level==1){//1级节点
                        $pre1 = $this->save_sports($name,$pre0,1); //直接保存
                        $res = $pre0;
                    }elseif($level==2){//2级节点
                        $pre2 = $this->save_sports($name,$pre1,2); //直接保存
                        $res = $pre0;
                    }else{//叶子节点
                        $this->save_sports($name,$pre2,3); //直接保存
                    }
                    if(!$res){
                        $this->error('导入失败,请检查导入格式是否正确!');
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
