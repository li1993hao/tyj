<?php
/**
 * Created by PhpStorm.
 * User: haoli
 * Date: 14/12/11
 * Time: 上午9:23
 */
namespace Admin\Controller;
use Think\Controller;
class BaseController extends Controller {
    /**
     * 后台控制器初始化
     */
    protected function _initialize(){
        // 获取当前用户ID
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }

        /* 读取数据库中的配置 */
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   D('Config')->lists();
            S('DB_CONFIG_DATA',$config);
        }
        C($config); //添加配置

        // 是否是超级管理员
        define('IS_ROOT',   is_administrator());
        if(!IS_ROOT && C('ADMIN_ALLOW_IP')){
            // 检查IP地址访问
            if(!in_array(get_client_ip(),explode(',',C('ADMIN_ALLOW_IP')))){
                $this->error('403:禁止访问');
            }
        }

//        if(user_field('type') != 0){//非管理用户
//            $this->error('未授权访问');
//        }

        // 检测访问权限
        $access =   $this->accessControl();
        if ( $access === false ) {
            $this->error('403:禁止访问');
        }elseif( $access === null ){
            $sy = session('user_auth');
            $type = $sy['type'];
            if($type >0){//非管理员
                $cf = C('BASE_INFO_NAME');
                $result = M($cf[$type])->where(array('uid'=>UID))->find();
                if(!$result){//没有信息
                    if(strtolower(CONTROLLER_NAME) != 'myspace'){
                        $this->error('您的信息还不完善,请先完善个人信息!',U('MySpace/baseInfo'));
                    }
                }
            }
            $dynamic        =   $this->checkDynamic();//检测分类栏目有关的各项动态权限
            if( $dynamic === null ){
                //检测非动态权限
                $rule  = strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
                if ( !$this->checkRule($rule,array('in','1,2')) ){
                    $this->error('未授权访问!');
                }
            }elseif( $dynamic === false ){
                $this->error('未授权访问!');
            }
        }
        $this->assign('__MENU__', $this->getMenus());
    }

    /**
     * 权限检测
     * @param string  $rule    检测的规则
     * @param string  $mode    check模式
     * @return boolean
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function checkRule($rule, $type=1, $mode='url'){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        static $Auth    =   null;
        if (!$Auth) {
            $Auth       =   new \Think\Auth();
        }
        if(!$Auth->check($rule,UID,$type,$mode)){
            return false;
        }
        return true;
    }

    /**
     * 检测是否是需要动态判断的权限
     * @return boolean|null
     *      返回true则表示当前访问有权限
     *      返回false则表示当前访问无权限
     *      返回null，则会进入checkRule根据节点授权判断权限
     *
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    protected function checkDynamic(){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        return null;//不明,需checkRule
    }


    /**
     * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null  返回值必须使用 `===` 进行判断
     *
     *   返回 **false**, 不允许任何人访问(超管除外)
     *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function accessControl(){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        $allow = C('ALLOW_VISIT');
        $deny  = C('DENY_VISIT');
        $check = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);

        if(strtolower(CONTROLLER_NAME)=='tool'){//工具类
            return true;
        }

        if ( !empty($deny)  && in_array_case($check,$deny) ) {
            return false;//非超管禁止访问deny中的方法
        }
        if ( !empty($allow) && in_array_case($check,$allow) ) {
            return true;
        }
        return null;//需要检测节点权限
    }

    /**
     * 对数据表中的单行或多行记录执行修改 GET参数id为数字或逗号分隔的数字
     *
     * @param string $model 模型名称,供M函数使用的参数
     * @param array  $data  修改的数据
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    final protected function editRow ( $model ,$data, $where , $msg=array()){
        $id    = array_unique((array)I('id',0));
        $id    = is_array($id) ? implode(',',$id) : $id;
        $where = array_merge( array('id' => array('in', $id )) ,(array)$where );
        $msg   = array_merge( array( 'success'=>'操作成功！', 'error'=>'操作失败！', 'url'=>'' ,'ajax'=>IS_AJAX) , (array)$msg );
        if( M($model)->where($where)->save($data)!==false ) {
            $this->success($msg['success'],$msg['url'],$msg['ajax']);
        }else{
            $this->error($msg['error'],$msg['url'],$msg['ajax']);
        }
    }

    /**
     * 禁用条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的 where()方法的参数
     * @param array  $msg   执行正确和错误的消息,可以设置四个元素 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    protected function forbid ( $model , $where = array() , $msg = array( 'success'=>'状态禁用成功！', 'error'=>'状态禁用失败！')){
        $data    =  array('status' => 0);
        $this->editRow( $model , $data, $where, $msg);
    }

    /**
     * 恢复条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    protected function resume (  $model , $where = array() , $msg = array( 'success'=>'状态恢复成功！', 'error'=>'状态恢复失败！')){
        $data    =  array('status' => 1);
        $this->editRow(   $model , $data, $where, $msg);
    }

    /**
     * 还原条目
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * @author huajie  <banhuajie@163.com>
     */
    protected function restore (  $model , $where = array() , $msg = array( 'success'=>'状态还原成功！', 'error'=>'状态还原失败！')){
        $data    = array('status' => 1);
        $where   = array_merge(array('status' => -1),$where);
        $this->editRow(   $model , $data, $where, $msg);
    }

    /**
     * 条目假删除
     * @param string $model 模型名称,供D函数使用的参数
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    protected function delete ( $model , $where = array() , $msg = array( 'success'=>'删除成功！', 'error'=>'删除失败！')) {
        $data['status']         =   -1;
       // $data['update_time']    =   NOW_TIME;
        $this->editRow(   $model , $data, $where, $msg);
    }

    /**
     * 设置一条或者多条数据的状态
     */
    public function setStatus($Model=CONTROLLER_NAME){

        $ids    =   I('request.ids');
        $status =   I('request.status');
        if(empty($ids)){
            $this->error('请选择要操作的数据');
        }

        $map['id'] = array('in',$ids);
        switch ($status){
            case -1 :
                $this->delete($Model, $map, array('success'=>'删除成功','error'=>'删除失败'));
                break;
            case 0  :
                $this->forbid($Model, $map, array('success'=>'禁用成功','error'=>'禁用失败'));
                break;
            case 1  :
                $this->resume($Model, $map, array('success'=>'启用成功','error'=>'启用失败'));
                break;
            default :
                $this->error('参数错误');
                break;
        }
    }

    /**
     * 获取控制器菜单数组,二级菜单元素位于一级菜单的'_child'元素中
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final public function getMenus($controller=CONTROLLER_NAME){
        // $menus  =   session('ADMIN_MENU_LIST'.$controller);
        if(empty($menus)){
            // 获取主菜单
            $where['pid']   =   0;
            //$where['hide']  =   0;
            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                $where['is_dev']    =   0;
            }
            $menus['main']  =   M('Menu')->where($where)->order('sort asc')->select();

            $menus['child'] = array(); //设置子节点


            /**
             * 动态设置主菜单权限和url
             */
            foreach($menus['main'] as $mk=>$main_menu){
                $where['pid']   =   $main_menu['id'];
                $where['hide'] = 0;
                if(!C('DEVELOP_MODE')){ // 是否开发者模式
                    $where['is_dev']    =   0;
                }
                $mmenus = M('Menu')->where($where)->order('sort asc')->select();
                if($mmenus){
                    $flag = false;
                    foreach($mmenus as $mm){
                        if($this->checkRule(MODULE_NAME.'/'.$mm['url'],1,'url') ){
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



            $controller = lcfirst($controller);

            //高亮主菜单
            $current = M('Menu')->where("url like '{$controller}/".ACTION_NAME."'")->field('id')->find();

            if($current){
                $nav = D('Menu')->getPath($current['id']);
                $nav_first_title = $nav[0]['title'];

                foreach ($menus['main'] as $key => $item) {
                    if (!is_array($item) || empty($item['title']) || empty($item['url']) ) {
                        $this->error('控制器基类$menus属性元素配置有误');
                    }
                    if( stripos($item['url'],MODULE_NAME)!==0 ){
                        $item['url'] = MODULE_NAME.'/'.$item['url'];
                    }

                    // 获取当前主菜单的子菜单项
                    if($item['title'] == $nav_first_title){
                        $menus['group_class'] = array();

                        $menus['main'][$key]['class']='active';
                        //生成child树
                        $groups = M('Menu')->where("pid = {$item['id']}")->distinct(true)->field("`group`")->select();
                        if($groups){
                            $groups = array_column($groups, 'group');
                        }else{
                            $groups =   array();
                        }

                        //获取二级分类的合法url
                        $where          =   array();
                        $where['pid']   =   $item['id'];
                        $where['hide']  =   0;
                        if(!C('DEVELOP_MODE')){ // 是否开发者模式
                            $where['is_dev']    =   0;
                        }
                        $second_urls = M('Menu')->where($where)->getField('id,url');

                        if(!IS_ROOT){
                            // 检测菜单权限
                            $to_check_urls = array();
                            foreach ($second_urls as $key=>$to_check_url) {
                                if( stripos($to_check_url,MODULE_NAME)!==0 ){
                                    $rule = MODULE_NAME.'/'.$to_check_url;
                                }else{
                                    $rule = $to_check_url;
                                }
                                if($this->checkRule($rule, 1,null))
                                    $to_check_urls[] = $to_check_url;
                            }
                        }
                        // 按照分组生成子菜单树
                        foreach ($groups as $g) {
                            $map = array('group'=>$g);
                            if(isset($to_check_urls)){
                                if(empty($to_check_urls)){
                                    // 没有任何权限
                                    continue;
                                }else{
                                    $map['url'] = array('in', $to_check_urls);
                                }
                            }
                            $map['pid'] =   $item['id'];
                            $map['hide']    =   0;
                            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                                $map['is_dev']  =   0;
                            }
                            $menuList = M('Menu')->where($map)->field('id,pid,title,url,tip')->order('sort asc')->select();
                            $group_class = '';
                            //高亮二级菜单

                            foreach($menuList as $k=>$menu){
                                $is_break = false;
                                foreach($nav as $cur_nav){
                                    if($cur_nav['url']===$menu['url']){
                                        $menuList[$k]['class']= 'active';
                                        $group_class = 'open active';
                                        $is_break=true;
                                        break;
                                    }
                                }
                                if($is_break){
                                    break;
                                }
                            }
                            $menus['child'][$g] = list_to_tree($menuList, 'id', 'pid', 'operater', $item['id']);
                            $menus['group_class'][$g] = $group_class;
                        }
                        if($menus['child'] === array()){
                            //$this->error('主菜单下缺少子菜单，请去系统=》后台菜单管理里添加');
                        }
                    }
                }
            }
            // session('ADMIN_MENU_LIST'.$controller,$menus);
        }

        return $menus;
    }

    /**
     * 返回后台节点数据
     * @param boolean $tree    是否返回多维数组结构(生成菜单时用到),为false返回一维数组(生成权限节点时用到)
     * @retrun array
     *
     * 注意,返回的主菜单节点数组中有'controller'元素,以供区分子节点和主节点
     *
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final protected function returnNodes($tree = true){
        static $tree_nodes = array();
        if ( $tree && !empty($tree_nodes[(int)$tree]) ) {
            return $tree_nodes[$tree];
        }
        if((int)$tree){

            $list = M('Menu')->field('id,pid,title,url,tip,hide')->order('sort asc')->select();
            foreach ($list as $key => $value) {
                if( stripos($value['url'],MODULE_NAME)!==0 ){
                    $list[$key]['url'] = MODULE_NAME.'/'.$value['url'];
                }
            }
            $nodes = list_to_tree($list,$pk='id',$pid='pid',$child='operator',$root=0);
            foreach ($nodes as $key => $value) {
                if(!empty($value['operator'])){
                    $nodes[$key]['child'] = $value['operator'];
                    unset($nodes[$key]['operator']);
                }
            }
        }else{
            $nodes = M('Menu')->field('title,url,tip,pid')->order('sort asc')->select();
            foreach ($nodes as $key => $value) {
                if( stripos($value['url'],MODULE_NAME)!==0 ){
                    $nodes[$key]['url'] = MODULE_NAME.'/'.$value['url'];
                }
            }
        }
        $tree_nodes[(int)$tree]   = $nodes;
        return $nodes;
    }


    /**
     * 通用分页列表数据集获取方法
     *
     *  可以通过url参数传递where条件,例如:  index.html?name=asdfasdfasdfddds
     *  可以通过url空值排序字段和方式,例如: index.html?_field=id&_order=asc
     *  可以通过url参数r指定每页数据条数,例如: index.html?r=5
     *
     * @param sting|Model  $model   模型名或模型实例
     * @param array        $where   where查询条件(优先级: $where>$_REQUEST>模型设定)
     * @param array|string $order   排序条件,传入null时使用sql默认排序或模型属性(优先级最高);
     *                              请求参数中如果指定了_order和_field则据此排序(优先级第二);
     *                              否则使用$order参数(如果$order参数,且模型也没有设定过order,则取主键降序);
     *
     * @param array        $base    基本的查询条件
     * @param boolean      $field   单表模型用不到该参数,要用在多表join时为field()方法指定参数
     * @author 朱亚杰 <xcoolcc@gmail.com>
     *
     * @return array|false
     * 返回数据集
     */
    protected function lists ($model,$where=array(),$order='',$base = array('status'=>array('egt',0)),$field=true){
        $options    =   array();
        $REQUEST    =   (array)I('request.');
        if(is_string($model)){
            $model  =   M($model);
        }

        $OPT        =   new \ReflectionProperty($model,'options');
        $OPT->setAccessible(true);

        $pk         =   $model->getPk();
        if($order===null){
            //order置空
        }else if ( isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']),array('desc','asc')) ) {
            $options['order'] = '`'.$REQUEST['_field'].'` '.$REQUEST['_order'];
        }elseif( $order==='' && empty($options['order']) && !empty($pk) ){
            $options['order'] = $pk.' desc';
        }elseif($order){
            $options['order'] = $order;
        }
        unset($REQUEST['_order'],$REQUEST['_field']);

        $options['where'] = array_filter(array_merge( (array)$base, /*$REQUEST,*/ (array)$where ),function($val){
            if($val===''||$val===null){
                return false;
            }else{
                return true;
            }
        });
        if( empty($options['where'])){
            unset($options['where']);
        }
        $options      =   array_merge( (array)$OPT->getValue($model), $options );
        $total        =   $model->where($options['where'])->count();

        if( isset($REQUEST['r']) ){
            $listRows = (int)$REQUEST['r'];
        }else{
            $listRows = C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        }
        $page = new \Think\Page($total, $listRows, $REQUEST);
        if($total>$listRows){
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p =$page->show();
        $this->assign('_page', $p? $p: '');
        $this->assign('_total',$total);
        $options['limit'] = $page->firstRow.','.$page->listRows;

        $model->setProperty('options',$options);

        return $model->field($field)->select();
    }

    /**
     * 处理文档列表显示
     * @param array $list 列表数据
     * @param integer $model_id 模型id
     */
    protected function parseDocumentList($list,$model_id=null){
        $model_id = $model_id ? $model_id : 1;
        $attrList = get_model_attribute($model_id,false,'id,name,type,extra');
        // 对列表数据进行显示处理
        if(is_array($list)){
            foreach ($list as $k=>$data){
                foreach($data as $key=>$val){
                    if(isset($attrList[$key])){
                        $extra      =   $attrList[$key]['extra'];
                        $type       =   $attrList[$key]['type'];
                        if('select'== $type || 'checkbox' == $type || 'radio' == $type || 'bool' == $type) {
                            // 枚举/多选/单选/布尔型
                            $options    =   parse_field_attr($extra);
                            if($options && array_key_exists($val,$options)) {
                                $data[$key]    =   $options[$val];
                            }
                        }elseif('date'==$type){ // 日期型
                            $data[$key]    =   date('Y-m-d',$val);
                        }elseif('datetime' == $type){ // 时间型
                            $data[$key]    =   date('Y-m-d H:i',$val);
                        }
                    }
                }
                $data['model_id'] = $model_id;
                $list[$k]   =   $data;
            }
        }
        return $list;
    }

    public function info($model =null,$map,$title,$temp=''){
        if(is_numeric($model)){
            $model = M('Model')->find($model);
        }
        if(is_numeric($map)){ //默认
            $map = array('id'=>$map);
        }

        $model || $this->error('模型不存在！');
        $fields     = get_model_attribute($model['id']);
        //获取数据
        $data       = M(get_table_name($model['id']))->where($map)->find();
        $data || $this->error('数据不存在！');
        $this->assign('model', $model);
        $this->assign('fields', $fields);
        $this->assign('data', $data);
        $this->meta_title = ($title?$title:$model['title']);
        $this->display((!empty($temp))?$temp:'Think/info');
    }


    /**
     * @param null $model
     * @param $id
     * @param string $header  打印标题 要先生的字段名称
     * @param string $title
     * @param string $temp
     */
    public function print_data($model =null,$map,$header='',$title='打印数据',$temp=''){
        if(is_numeric($model)){
            $model = M('Model')->find($model);
        }
        //获取模型信息
        $model = M('Model')->find($model);
        $model || $this->error('模型不存在！');
        $fs     = get_model_attribute($model['id']);
        $fields = array();
        foreach($fs as $k=>$v){//合并分组 便于打印
            $fields = array_merge($fields,$fs[$k]);
        }
        if(is_numeric($map)){ //默认
            $map = array('id'=>$map);
        }

        $data       = M(get_table_name($model['id']))->where($map)->select();
        $data || $this->error('数据不存在！');
        $this->assign('model', $model);
        $this->assign('fields', $fields);
        $this->assign('datas', $data);
        $this->assign('header', $header);
        $this->meta_title = $title;
        $this->display($temp?$temp:'Think/print');
    }

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    protected  function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            case -12: $error = '昵称长度应该在2到40个字符之间！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

    /**通用审核方法
     * @param $model_id //审核模型id
     * @param $id //数据id
     * @param $temp //模版
     */
    protected  function verify($model_id,$id,$temp){
        if(is_numeric($model_id) && is_numeric($id)){
            if(IS_POST){
                $table_name = get_table_name($model_id);
                $name = parse_name($table_name, true);
                $_POST['topic_table'] = get_table_name($model_id);
                $_POST['topic_id'] = $id;
                $_POST['uid'] = UID;//审核人
                unset($_POST['model_id']);
                unset($_POST['id']);
                $model = D('Verify');
                if($model->update() !== false){
                    $data = M($name)->find($id);
                    $data['status'] = 1;
                    if(M($name)->save($data)){
                        $this->success('审核成功!',LK());
                    }else{
                        $this->error('审核失败!');
                    }
                }else{
                    $this->error('审核失败!');
                }
            }else{
                $map['topic_table'] = get_table_name($model_id);
                $map['topic_id'] = $id;
                $data = M('Verify')->where($map)->find();
                $this->assign('info',$data);
                $this->info($model_id,array('id'=>$id),'审核',$temp);
            }
        }else{
            $this->error('参数非法!');
        }
    }
}