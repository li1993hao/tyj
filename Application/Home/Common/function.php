<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**获得栏目
 * 两个参数都不写则获得顶级栏目
 * 写了$cid可以选择是获得此分类的详细信息还是获得
 * 其子栏目信息
 * @param $cid
 * @param bool $children
 * @return mixed
 */
function cat($cid='',$children=false,$root_nav=0){
    if(empty($cid)){//获得顶级分类
        $result = api('Category/get_top_category',array('map'=>array('index_show'=>1)));
        foreach($result as $k =>$v){
            $result[$k]['has_child'] =api('Category/get_children_count',array('cid'=>$v['id'],'map'=>array('map'=>array('index_show'=>1))));
            $result[$k]['class'] =($result[$k]['id']==$root_nav?'active':'');
        }
        return $result;
    }else{
        if($children){//获得指定分类的子分类
            return api('Category/get_children_category',array('id'=>$cid));
        }else{//获得指定分类
            return api('Category/get_category',array('id'=>$cid));
        }
    }
}

function cat_field($cid,$field){
    $result = api('Category/get_category',array('id'=>$cid));
    return isset($field)?$result[$field]:$result;
}

/**获得某栏目下的新闻
 * @param $cid 栏目id
 * @param string $limit 如果输入0,10类似则返回指定区间内的数据,如果是数字则返回指定页面,页面大小
 * 由栏目设置决定
 * @return bool|mixed
 */
function lists($cid,$limit='0,10'){
     if(is_numeric($cid)){
         return api('Document/lists',array('category'=>$cid,'page'=>$limit));
     }else{
         return false;
     }
}

/**获得推荐位置信息
 * @param $pos 推荐位id
 * @param $limit 取的范围
 * @param null $category 取指定栏目下的推荐位
 * @return bool|mixed
 */
function position($pos,$limit='0,5',$category=null){
    if(is_numeric($pos)){
        $result = api('Document/position',array('pos'=>'3','category'=>$category,
            'limit'=>$limit,'field'=>'id,cover,category_id,title,url'));
        return $result;
    }else{
        return false;
    }
}



function get_link($group,$start,$length){
    $result = api('Link/get_link',array('group'=>$group));
    if(isset($start)){
       return array_slice($result,$start,$length);
    }else{
        return $result;
    }
}

function set_auto_login_cookie(){
    $user = session('user_auth');
    cookie(C('AUTO_COOKIE'), think_encrypt($user['username'],C('AUTO_ENCRYPT_KEY')));
    cookie(C('AUTO_COOKIE_SIGN'),session('user_auth_sign'));//数据签名
}

function get_user_menu(){
    // 获取主菜单
    $where['pid']   =   0;
    $where['hide']  =   0;
    if(!C('DEVELOP_MODE')){ // 是否开发者模式
        $where['is_dev']    =   0;
    }
    $menus['main']  =   M('Menu')->where($where)->order('sort asc')->select();
    /**
     * 动态设置主菜单权限和url
     */
    foreach($menus['main'] as $mk=>$main_menu){
        $where['pid']   =   $main_menu['id'];
        $where['hide'] = 0;
        $mmenus = M('Menu')->where($where)->order('sort asc')->select();
        if($mmenus){
            $flag = false;
            foreach($mmenus as $mm){
                if(checkRule($mm['module'].'/'.$mm['url'],1,'url') ){
                    $menus['main'][$mk]['url']= $mm['url'];
                    $flag = true; //有子菜单
                    break;
                }
            }
            if(!$flag){ //没有子菜单
                unset($menus['main'][$mk]);
            }
        }else if($main_menu['url']=='Public/index'){
            unset($menus['main'][$mk]);
        }
    }
    return $menus;
}

function checkRule($rule, $type=1, $mode='url'){
    if(is_administrator()){
        return true;//管理员允许访问任何页面
    }
    static $Auth    =   null;
    if (!$Auth) {
        $Auth       =   new \Think\Auth();
    }
    if(!$Auth->check($rule,user_field('uid'),$type,$mode)){
        return false;
    }
    return true;
}