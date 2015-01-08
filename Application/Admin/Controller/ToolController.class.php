<?php
namespace Admin\Controller;
class ToolController extends BaseController {
    public function selectSports($method='',$mode='single'){
        $tree = S('sports_tree');
        if(!$tree){
            $sports  =  M('Sports')->field('id,pid,name,cp_name,code')->where(array('status'=>1))->select();
            $this->assign('sports',$sports);
            $tree =list_to_tree($sports,'id','pid','children');
            sports_tree($tree);
            $tree = json_encode($tree);
            S('sports_tree',$tree);
        }
        if($method=='uid'){
            $user_type = user_field('type');
            if($user_type == 0){//管理员无权使用此功能
                $this->error('管理员无权使用此功能');
            }
            $model_id = CC('BASE_INFO_MODEL',$user_type);
            $model_name = get_model_by_id($model_id,'name');
            if($model_name){
                $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('id,sports')->find();
            }
            if(!$res){
                $this->error('您还未完善个人资料,请尽快完善',U('myspace/baseInfo'));
            }
            $tree = json_decode($tree);
            foreach($tree as $k=>$v){
                if($v->code == $res['sports']){
                    $tree = json_encode(array($k=>$v));
                    break;
                }
            }
        }else if($method='data'){
            $this->ajaxReturn($tree);
        }
        $this->assign('sportsTree',$tree);
        $this->assign('mode',$mode);
        $this->display('public/select_sports');
    }

    public  function  getSportsName($sports){
        $c_p = array();
        $current_sports = str2arr($sports);
        foreach($current_sports as $v){
            $c_p[] =array('code'=>$v,'name'=>get_sports($v,'cp_name'));
        }

        $data['status'] = 1;
        $data['data'] = $c_p;
        $this->ajaxReturn($data);
    }
}