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
 * 竞赛管理控制器
 */
class CompetitionController extends ThinkController{

    /**
     * 赛事计划
     * 字段status  代表是否发布公告
     */
    public function plan(){
        $result = M('GamePlanYears')->order('years desc')->select();
        MK();
        $this->assign('list',$result);
        $this->display();
    }

    public function  addPlan(){
        $model = D('GamePlan');
        if(IS_POST){
            $start_time =  $_POST['start_time'];
            $end_time  = $_POST['end_time'];
            if($start_time && $end_time){
                if(strtotime($start_time) > strtotime($end_time)){ //开始时间不能大于结束时间
                    $this->error('赛事开始时间不能大于结束时间!');
                }
            }

            if($model->update()!==false){
                $this->success("操作成功");
            }else{
                $error = $model->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        }else{
            $id = I('get.id',0);
            $map['status'] =1;
            $com = M('Competition')->where($map)->select();
            $this->assign('com',$com);
            if($id >0 ){//编辑
                $res = $model->find($id);
                $this->assign('years',$res['years']);
                $this->assign('info', $res);
                $this->assign('meta_title', '编辑'.$res['years'].'年赛事计划');
            }else{//新增
                $year = I('year',0);
                if($year ==0){
                    $this->error('年份不正确!');
                }else{
                    $this->assign('years', $year);
                    $this->assign('meta_title', '新增'.$year.'年赛事计划');
                }

            }
            $this->display('add_plan');
        }
    }

    public  function planDetail($method=''){
        $year = I('year');
        $map =array('years'=>$year,'status'=>1);
        $list =  $this->p_lists('GamePlan', $map,'name asc,start_time asc');
        $this->meta_title = $year.'年赛事计划';
        $this->assign('years',$year);
        $this->assign('list',$list);

        if($method=='print'){
            $this->display('print');
        }else if($method=='publish'){
            $count = M('GamePlan')->where(array('years'=>$year))->count();

            if($count>0){
                $_POST['title'] = $this->meta_title;
                $_POST['uid'] = UID;
                $_POST['category_id'] = C('COM_PUBLISH_CATE');
                $_POST['description'] = $this->meta_title;
                $_POST['content'] = $this->meta_title;
                $_POST['link'] = 'Home/index/gamePlan?years='.$year;
                define('FORCE_POST',true);
                parent::add('article','',function($id) use($year){
                    $data = M('GamePlanYears')->where(array('years'=>$year))->find();
                    $data['status'] = $id;
                    M('GamePlanYears')->save($data);
                });
            }else{
                $this->error('请至少添加一个赛事信息!');
            }
        }else{
            $this->display('plan_detail');
        }
    }

    public function addYears(){
        $year = I('year');
        $result = M('GamePlanYears')->where(array('years'=>$year))->find();
        if($result){
            $this->error($year.'的年份计划已经添加过了,请不要重复添加.');
        }else{
            $data['years'] = $year;
            $data['status'] = 1;
            $res = M('GamePlanYears')->add($data);
            if($res !== false){
                $this->success('添加成功!');
            }else{
                $this->error('添加失败!');
            }
        }

    }

    /**
     * 赛事公告
     */
    public function notice(){
        $this->display();
    }

    /**
     * 成绩录入
     */
    public function achievement(){
        $this->display();
    }

    /**
     * 赛事管理
     */

    public function manager(){
        $name      =   trim(I('get.name'));
        if($name){
            $map[] ="BINARY `name` LIKE '%{$name}%'";
        }
        $map['status'] =array('gt',-1);
        $data = M('Competition')->where($map)->select();
        int_to_string($data);

        $this->assign('list',$data);
        // 记录当前列表页的cookie
        MK();
        $this->meta_title = '赛事列表';
        $this->display();
    }

    public function sports(){
        if(IS_POST){
            $codes = I('post.code');
            $id = I('get.id');
            $codes = is_array($codes)?arr2str($codes):$codes;
            if(empty($codes)){
                $this->error('请至少选择一个项目!');
            }else{
                $data  = M('Competition')->find($id);
                $data['sports'] = $codes;
                $res = M('Competition')->save($data);
                if($res !== false){
                    $this->success('操作成功!',LK());
                }else{
                    $this->error('操作失败!');
                }
            }

        }else{
            $id = I('id');
            $method = I('method','');
            $res = M('Competition')->where(array('status'=>1))->find($id);
            if(!$res){
                $this->error('数据不存在或被禁用!');
            }

            if($method=='checked'){ //只看已选
                $map = array('status'=>array('eq',1),'code'=>array('in',$res['sports']));
                $ls = M('Sports')->where($map)->field('id,pid')->select();
                $ids  = array();
                foreach ($ls as $v){
                    $pid = $v['pid'];
                    $ids[] = $v['id'];
                    while($pid!=0){
                        $r = M('Sports')->where(array('status'=>1,'id'=>$pid))->field('id,pid')->find();
                        if(in_array($pid,$ids)){
                            break;
                        }
                        if($r !== false){
                            $ids[] = $pid;
                            $pid = $r['pid'];
                        }else{
                            break;
                        }
                    }
                }
                $list = M('Sports')->where(array('id'=>array('in',arr2str($ids))))->select();
            }else{
                $map = array('status'=>array('eq',1));
                $list = M('Sports')->where($map)->select();
            }

            int_to_string($list);
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
            $this->assign("method",$method);
            $this->assign("id",$id);
            $this->assign("nodeList",$sortList);
            $this->assign('meta_title',$res['name']."的竞赛项目");
            $this->assign("data",str2arr($res['sports']));
            $this->display('select_sports');
        }
    }

    public function addCompetition(){
        $id = I('id',0);
        if($id){
            parent::edit(C('COMPETITION_MODEL'),$id,'编辑赛事');
        }else{
            parent::add(C('COMPETITION_MODEL'),'添加赛事');
        }
    }

    public function setStatus(){
        parent::setStatus('Competition');
    }
}
