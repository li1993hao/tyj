<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
        if(!is_login()){//没有登陆.进行cookie检测
            $username = cookie(C('AUTO_COOKIE'));
            if($username){
                $username = think_decrypt($username,C('AUTO_ENCRYPT_KEY')); //解密
                $auth_sign = cookie(C('AUTO_COOKIE_SIGN'));//数据签名
                $member = D('Member');
                if($auth_sign && ($auth_sign==$member->get_user_auth_sign($username))){ //签名认证
                    $member->cookie_login($username); //自动登陆
                    set_auto_login_cookie();//更新cookie
                }
            }
        }

    }

    protected  function download($id){
        $info = D('File')->find($id);
        if(empty($info)){
            return false;
        }
        $File = D('File');
        $root = C('DOWNLOAD_UPLOAD.rootPath');
        $call = array($this, 'setDownload');
        if(false === $File->download($root, $info['file_id'])){
             $this->error($File->getError());
        }
    }
}
