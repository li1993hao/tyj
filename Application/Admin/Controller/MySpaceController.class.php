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
 * 个人信息
 */
class MySpaceController extends ThinkController {
       public function baseInfo(){
           if(IS_POST){
               $model_id = I('get.model');
               if(!is_numeric($model_id)){
                   $this->error('参数非法!');
               }
               $model_name =  get_model_by_id($model_id,'name');
               if($model_name){
                   $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('id')->find();
                   if($res){//有基本信息了
                       parent::edit($model_id);
                   }else{
                       $_POST['uid'] = UID;
                       parent::add($model_id);
                   }
               }else{
                   $this->error('人员基本信息模型未定义!');
               }

           }else{
               $model_id = CC('BASE_INFO_MODEL',user_field('type'));
               $model_name = get_model_by_id($model_id,'name');
               if($model_name){
                   MK();
                   $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('id')->find();
                   if($res){ //有基本信息了
                       $method = I('method');
                       if($method == 'edit'){
                           parent::edit($model_id,$res['id'],'修改个人资料');
                       }else{
                           $url = U('baseInfo',array('method'=>'edit'));
                           parent::info($model_id,$res['id'],'个人信息[<a href="'.$url.'">修改</a>]');
                       }
                   }else{
                       parent::add($model_id,'完善个人资料(您还未填写过个人资料,请尽快完善)');
                   }
               }else{
                   $this->error('人员基本信息模型未定义!');
               }
           }
       }
    /**
     * 修改昵称初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updateNickname(){
        if(IS_POST){
            //获取参数
            $nickname = I('post.nickname');
            $password = I('post.password');
            empty($nickname) && $this->error('请输入昵称');
            empty($password) && $this->error('请输入密码');
            $Member =   D('Member');

            //密码验证
            $uid    =   $Member->checkLogin(UID, $password, 4);
            ($uid == -2) && $this->error('密码不正确');

            $data   =   $Member->create(array('nickname'=>$nickname));
            if(!$data){
                $this->error($Member->getError());
            }

            $res = $Member->where(array('id'=>$uid))->save($data);

            if($res){
                $user               =   session('user_auth');
                $user['username']   =   $data['nickname'];
                session('user_auth', $user);
                session('user_auth_sign', data_auth_sign($user));
                $this->success('修改昵称成功！');
            }else{
                $this->error('修改昵称失败！');
            }
        }
    }

    /**
     * 修改密码初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updatePassword(){
        if(IS_POST){
            //获取参数
            $password   =   I('post.old');
            empty($password) && $this->error('请输入原密码');
            $data['password'] = I('post.password');
            empty($data['password']) && $this->error('请输入新密码');
            $repassword = I('post.repassword');
            empty($repassword) && $this->error('请输入确认密码');
            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }
            $member = D('Member');
            $res    =   $member->updateInfo(UID, $password, $data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
        }else{
            $this->meta_title = '修改密码';
            $this->display();
        }

    }
}
