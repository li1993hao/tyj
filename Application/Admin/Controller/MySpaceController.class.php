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
               if(C('USER_EDIT_BASEINFO') == 0){
                   $this->error('抱歉,该功能暂时关闭.');
               }
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
                   $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('id')->find();
                   if($res){ //有基本信息了
                       $method = I('method');
                       if($method == 'edit'){
                           parent::edit($model_id,$res['id'],'修改个人资料');
                       }else{
                           MK();
                           $url = U('baseInfo',array('method'=>'edit'));
                           if(C('USER_EDIT_BASEINFO') == 1){
                               $this->assign('_extend',' <a  href="'.$url.'" class="tooltip-success" data-placement="right" data-rel="tooltip"  data-original-title="点我可进行编辑哦"><i style="color:#6c9842" class="icon-edit icon-animated-vertical bigger-100"></i></a>');
                           }
                           parent::info($model_id,$res['id'],'个人信息');
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
     * 运动员参赛信息
     */
    public function comInfo(){
        $model_id = CC('BASE_INFO_MODEL',user_field('type'));
        $model_name = get_model_by_id($model_id,'name');
        if($model_name){
            $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('physical')->find();
        }

        if(!$res){
            $this->error('您还未完善个人资料,请尽快完善',U('baseInfo'));
        }

        $list =parent::p_lists('ComInfo',array('uid'=>UID),'time desc');
        $this->assign('list',$list);
        $this->assign('meta_title',"参赛信息");
        $this->display('com_info');
    }
    /**
     * 添加参赛信息
     */
    public function  addComInfo(){
        if(C('USER_COM') == 0){
            $this->error('抱歉,该功能暂时关闭.');
        }

        $model_id = CC('BASE_INFO_MODEL',user_field('type'));
        $model_name = get_model_by_id($model_id,'name');
        if($model_name){
            $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('physical')->find();
        }

        if(!$res){
            $this->error('您还未完善个人资料,请尽快完善',U('baseInfo'));
        }


        $model = D('ComInfo');
        if(IS_POST){
            $_POST['uid'] = UID;
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
                $res = $model->where(array('id'=>$id,'uid'=>UID))->find();
                if(!res){
                    $this->error('数据不存在!');
                }
                $this->assign('info', $res);
                $this->assign('meta_title', '编辑参赛信息');
            }else{//新增
                $this->assign('meta_title', '新增参赛信息');
            }
            $this->display('add_com_info');
        }
    }

    public function delComInfo($id){
        if(C('USER_COM') == 0){
            $this->error('抱歉,该功能暂时关闭.');
        }

        if(is_numeric($id)){
           $res = M('ComInfo')->where(array('id'=>$id))->delete();
           if($res !== false){
               $this->success('删除成功！');
           }else{
               $this->error('删除失败!');
           }
       }else{
           $this->error('参数非法！');
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


    public function changePhysical(){
        if(C('USER_PHY') == 0){
            $this->error('抱歉,该功能暂时关闭.');
        }

        $model_id = CC('BASE_INFO_MODEL',user_field('type'));
        $model_name = parse_name(get_model_by_id($model_id,'name'),true);

        if($model_name){
            $res = M($model_name)->where(array('uid'=>UID))->field('physical,id')->find();
        }

        if(!$res){
            $this->error('您还未完善个人资料,请尽快完善',U('baseInfo'));
        }
        $code = I('code');
        $value = I('value');
        if(preg_match('/^[-+]?\d+\.?\d*$/',$value)){
            if($res['physical']){ //编辑过
                $data = json_decode($res['physical']);
            }
            $data[$code] = $value;
            $res['physical'] = json_encode($data);
            if(M($model_name)->save($res)!==false){
                $this->success('编辑成功!');
            }else{
                $this->error('编辑失败!');
            }
        }else{
            $this->error('输入非法!');
        }


    }

    public function physical(){
        $model_id = CC('BASE_INFO_MODEL',user_field('type'));
        $model_name = get_model_by_id($model_id,'name');
        if($model_name){
            $res = M(parse_name($model_name,true))->where(array('uid'=>UID))->field('physical')->find();
        }

        if(!$res){
            $this->error('您还未完善个人资料,请尽快完善',U('baseInfo'));
        }

        $map = array('status'=>array('eq',1));
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
        $this->assign("data",json_decode($res['physical']));
        $this->display();
    }


}
