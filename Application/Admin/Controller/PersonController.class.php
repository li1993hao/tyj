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
 * 人员管理控制器
 * @author huajie <banhuajie@163.com>
 */
class PersonController extends BaseController {

    /**
     * 运动员
     */
    public function athlete(){
        $result = $this->lists('athlete',$this->searc_parse(),'',array(),true);
        $this->assign('type',1);
        $this->assign('list',$result);
        $this->display('athlete');
    }
    /**
     * 教练员
     */
    public function coach(){
        $result = $this->lists('coach',$this->searc_parse(),'',array(),true);
        $this->assign('type',2);
        $this->assign('list',$result);
        $this->display('coach');
    }
    /**
     * 裁判员
     */
    public function referee(){
        $result = $this->lists('referee',$this->searc_parse(),'',array(),true);
        $this->assign('type',3);
        $this->assign('list',$result);
        $this->display('referee');
    }


    public function printData($id){
        if(!is_array($id)){
            $id = str2arr($id);
        }
        $id = array_unique($id);
        if ( empty($id)) {
            $this->error('请选择要操作的数据!');
        }
        $user = M('Member')->find($id[0]);
        $type = $user['type'];
        $title = ($type==1?"运动员资料":$type==2?"教练员资料":"裁判员资料");
        parent::print_data(CC('BASE_INFO_MODEL',$type), array('uid' => array('in', arr2str($id))),'name',$title);
    }

    private function searc_parse(){
        $map = array();
        $team_map = array(); //模版赋值
        foreach($_REQUEST as $k => $v){
            $kk = str2arr($k,'_');
            if($kk[0] == 'query'){ //查询字段
                if(trim($_REQUEST[$k]) === ""){
                    continue;
                }
                if($kk[1] == 'name'){//模糊查询
                    $map[] = "BINARY `name` LIKE '%{$v}%'";
                    $team_map[$k] = $v;
                    continue;
                }
                if($v == '__whatever__'){ //不限
                    continue;
                }
                $map[$kk[1]] = $v;
                $team_map[$k] = $v;
            }else{
                unset($map[$k]);
            }
        }
        if(I('r')){
            $team_map['r']= I('r');
        }
        $this->assign('where',$team_map);
        return $map;
    }


    public function info($id){
        if(is_numeric($id)){
            $user = M('Member')->find($id);
            parent::info(CC('BASE_INFO_MODEL',$user['type']),array('uid'=>$id),'','public/info');
        }else{
            $this->error('参数不合法!');
        }
    }

    public  function add($username = '',$nickname='', $password = '', $repassword = '',$type=1){
        if(IS_POST){
            if($password != $repassword){
                $this->error('两次密码输入不一致!');
            }
            $User = D('Member');
            $uid = $User->register($username,$password,$nickname,$type,1);
            if($uid > 0){ //注册成功
                $model_access = D('AuthGroup');
                $model_access->addToGroup($uid,get_user_group($type));
                $this->success('添加成功!');
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        }else{
            $this->display();
        }
    }

}
