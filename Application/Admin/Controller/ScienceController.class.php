<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
//TODO 代码重复太多 要重构
/**
 * 科训管理
 * @author huajie <banhuajie@163.com>
 */
class ScienceController extends ThinkController {
    public function addPlan(){
        $str = array('日计划','周计划','月计划');
        $str2 = array('您今天已经写过计划了!','您这周已经写过计划了!','您这个月已经写过计划了!');
        if(IS_POST){
            $type = session('add_plan_type');
            if($this->check(session('add_plan_type'),'trainPlan')>0){
                $this->error($str2[$type]);
            }
            $_POST['uid'] = UID;
            $_POST['type'] = session('add_plan_type');;
            //TODO 关联的计划表和记录在用户信息表里面,杜绝硬编码
            parent::add(C('PLAN_MODEL'));
        }else{
            $type = I('type',-1);
            if($type==0||$type==1||$type==2){
                if($this->check($type,'trainPlan')>0){ //写过了
                    $this->error($str2[$type]);
                }
                session('add_plan_type',$type);
                parent::add(C('PLAN_MODEL'),'写'.$str[$type]."(当前时间:".date('Y-m-d',time()).")");
            }else{
                $this->error('参数非法!');
            }
        }
    }

    public function editPlan(){
        $str = array('当日计划','本周计划','当月计划');
        if(IS_POST){
            $id =  I('id');
            $re = M('trainPlan')->field('type,uid')->find($id);
            if($this->check($re['type'],'trainPlan') != $id){
                $this->error("您只能编辑".$str[$re['type']]);
            }
            if($re['uid']!=UID){
                $this->error('您只能编辑自己的计划');
            }
            parent::edit(C('PLAN_MODEL'));
        }else{
            $id = I('id');
            $re = M('trainPlan')->field('type,uid')->find($id);
            if(!$re){
                $this->error('请求的数据不存在!');
            }

            if($this->check($re['type'],'trainPlan') != $id){
                $this->error("您只能编辑".$str[$re['type']]);
            }
            parent::edit(C('PLAN_MODEL'),$id);
        }
    }

    public  function plan($type=0){
        $types = array(0=>'日计划',1=>'周计划',2=>'月计划');
        $p = I('p');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据

        //TODO 关联的计划表和记录在用户信息表里面,杜绝硬编码
        $model = M("model")->where(array('id'=>C('PLAN_MODEL')))->find();

        $map['uid'] = UID;
        $map['type'] = $type;
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        $name = parse_name(get_table_name($model['id']), true);
        $data = M($name)
            ->field(true)
            // 查询条件
            ->where($map)
            /* 默认通过id,和置顶逆序排列 */
            ->order('create_time DESC')
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        MK();
        /* 查询记录总数 */
        $count = M($name)->where($map)->count();
        //分页
        if($count > $row){
            $page = new \Think\Page($count, $row);
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page', $page->show());
        }
        $data   =   $this->parseDocumentList($data,$model['id']);
        foreach($data as $k=>$v){///审核意见搜索
            $result = M('Verify')->where(array('topic_table'=>'train_plan','topic_id'=>$v['id']))->find();
            if($result !== false){
                $data[$k]['_verify'] = $result;
            }
        }
        $this->assign('list_data', $data);
        $this->assign('current_type',$type);
        $this->assign('types',$types);
        $this->meta_title = $types[$type];
        $this->display('plan_lists');
    }


    public function addSum(){
        $str = array('日总结','周总结','月总结','年度总结');
        $str2 = array('您今天已经写过总结了!','您这周已经写过总结了!','您这个月已经写过总结了!','您今年已经写过总结了!');
        if(IS_POST){
            $type = session('add_sum_type');
            if($this->check(session('add_sum_type'),'trainPlan')>0){
                $this->error($str2[$type]);
            }
            $_POST['uid'] = UID;
            $_POST['type'] = session('add_sum_type');;
            //TODO 关联的计划表和记录在用户信息表里面,杜绝硬编码
            parent::add(C('SUM_MODEL'));
        }else{
            $type = I('type',-1);
            if($type==0||$type==1||$type==2||$type==3){
                if($this->check($type,'trainSum')>0){ //写过了
                    $this->error($str2[$type]);
                }
                session('add_sum_type',$type);
                parent::add(C('SUM_MODEL'),'写'.$str[$type]."(当前日期:".date('Y-m-d',time()).")");
            }else{
                $this->error('参数非法!');
            }
        }
    }

    public function editSum(){
        $str = array('日总结','周总结','月总结','年度总结');
        if(IS_POST){
            $id =  I('id');
            $re = M('trainSum')->field('type,uid')->find($id);
            if($re['uid']!=UID){
                $this->error('您只能编辑自己的总结');
            }

            if($this->check($re['type'],'trainSum') != $id){
                $this->error("您只能编辑".$str[$re['type']]);
            }
            parent::edit(C('SUM_MODEL'));
        }else{
            $id = I('id');
            $re = M('trainSum')->field('type,uid')->find($id);
            if(!$re){
                $this->error('请求的数据不存在!');
            }
            if($re['uid']!=UID){
                $this->error('您只能编辑自己的总结');
            }

            if($this->check($re['type'],'trainSum') != $id){
                $this->error("您只能编辑".$str[$re['type']]);
            }
            parent::edit(C('SUM_MODEL'),$id);
        }
    }

    public  function sum($type=0){
        $types = array(0=>'日总结',1=>'周总结',2=>'月总结',3=>'年度总结');
        $p = I('p');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据
        //TODO 关联的总结表和记录在用户信息表里面,杜绝硬编码
        $model = M("model")->where(array('id'=>C('SUM_MODEL')))->find();

        $map['uid'] = UID;
        $map['type'] = $type;
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        $name = parse_name(get_table_name($model['id']), true);
        $data = M($name)
            ->field(true)
            // 查询条件
            ->where($map)
            /* 默认通过时间排序*/
            ->order('create_time DESC')
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        MK();
        /* 查询记录总数 */
        $count = M($name)->where($map)->count();
        //分页
        if($count > $row){
            $page = new \Think\Page($count, $row);
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page', $page->show());
        }
        $data   =   $this->parseDocumentList($data,$model['id']);
        foreach($data as $k=>$v){///审核意见搜索
            $result = M('Verify')->where(array('topic_table'=>'train_sum','topic_id'=>$v['id']))->find();
            if($result !== false){
                $data[$k]['_verify'] = $result;
            }
        }
        $this->assign('list_data', $data);
        $this->assign('current_type',$type);
        $this->assign('types',$types);
        $this->meta_title = $types[$type];
        $this->display('sum_lists');
    }

    private function check($type,$model_str){
        if($type==0){//日计划
            $data = new \Org\Util\Date();
            $left = strtotime($data->format('%Y-%m-%d'));
            $right = strtotime($data->dateAdd(1)->format('%Y-%m-%d'));
        }elseif($type==1){//周
            $day= date('Y-m-d',time());
            $right=strtotime(date('Y-m-d',strtotime("$day Sunday")));
            $left=strtotime(date('Y-m-d',strtotime("$right -6 days")));
        }elseif($type==2){ //月
            $data = new \Org\Util\Date();
            $left = strtotime($data->firstDayOfMonth()->format('%Y-%m-%d'));
            $right = strtotime($data->lastDayOfMonth()->format('%Y-%m-%d'));
        }elseif($type==3){ //年
            $data = new \Org\Util\Date();
            $left = strtotime($data->firstDayOfYear()->format('%Y-%m-%d'));
            $right = strtotime($data->lastDayOfYear()->format('%Y-%m-%d'));
        }
        $result = M($model_str)->where(array('uid'=>UID,'type'=>$type,'create_time'=>array('between',$left.','.$right)))->field('id')->find();
        return ($result?$result['id']:$result);
    }

    //总结管理
    public function sumManager(){
        $map = array();
        $type = I('get.type',-1);
        if($type>-1){
            $map['type']= $type;
            $this->assign('current_type', $type);
        }
        $this->assign('types', array(0=>'日总结',1=>'周总结',2=>'月总结',3=>'年度总结'));

        $cf =  session('user_auth');
        $user_type =$cf['type'];
        if($user_type==2){//动态判断教练员权限
            $person = M('Coach')->where(array('uid'=>UID))->field('team')->find();
            //得到所有运动员用户id
            $teamUser = M('Member')->where(array('type'=>1))->field('id')->select();
            $teamUser = arr2str(array_column($teamUser,'id'));
            $teamUser  = M('Athlete')->where(array('uid'=>array('in',$teamUser),'team'=>$person['team']))
            ->field('uid')->select();//获得和教练员相同运动队的运动员id
            $map['uid'] =  array('in',arr2str(array_column($teamUser,'uid')));
        }

        $p = I('p');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据
        //TODO 关联的计划表和记录在用户信息表里面,杜绝硬编码
        $model = M("model")->where(array('id'=>C('SUM_MODEL')))->find();
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        $name = parse_name(get_table_name($model['id']), true);
        $data = M($name)
            ->field(true)
            ->where($map)
            /* 默认通过id,和置顶逆序排列 */
            ->order('create_time DESC')
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        MK();
        /* 查询记录总数 */
        $count = M($name)->count();
        //分页
        if($count > $row){
            $page = new \Think\Page($count, $row,$_REQUEST);
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page', $page->show());
        }
        $data   =   $this->parseDocumentList($data,$model['id']);

        int_to_string($data,array('status'=>array
        (1=>'<span class="label label-success ">已审核</span>',
            -1=>'删除',0=>'<span class="label label-danger ">禁用</span>',
            2=>'<span class="label label-warning">未审核</span>'),'type'=>array(0=>'日总结',
            1=>'周总结',2=>'月总结',3=>'年度总结')));
        $this->assign('list_data', $data);
        $this->meta_title = "训练总结管理";
        $this->display('sum_manager');
    }

    //计划管理
    public function planManager(){
        $map = array();
        $type = I('get.type',-1);
        if($type>-1){
            $map['type']= $type;
            $this->assign('current_type', $type);
        }
        $this->assign('types', array(0=>'日计划',1=>'周计划',3=>'月计划'));

        $p = I('p');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据

        //TODO 关联的计划表和记录在用户信息表里面,杜绝硬编码
        $model = M("model")->where(array('id'=>C('PLAN_MODEL')))->find();
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        $name = parse_name(get_table_name($model['id']), true);
        $data = M($name)
            ->field(true)
            ->where($map)
            /* 默认通过id,和置顶逆序排列 */
            ->order('create_time DESC')
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        MK();
        /* 查询记录总数 */
        $count = M($name)->count();
        //分页
        if($count > $row){
            $page = new \Think\Page($count, $row);
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page', $page->show());
        }
        $data   =   $this->parseDocumentList($data,$model['id']);

        int_to_string($data,array('status'=>array
        (1=>'<span class="label label-success ">已审核</span>',
            -1=>'删除',0=>'<span class="label label-danger ">禁用</span>',
            2=>'<span class="label label-warning">未审核</span>'),'type'=>array(0=>'日计划',
            1=>'周计划',2=>'月计划')));
        $this->assign('list_data', $data);
        $this->meta_title = "训练计划管理";
        $this->display('plan_manager');
    }

    /**计划审核
     * @param $id
     */
    public function  planVerify($id){
        parent::verify(C('PLAN_MODEL'),$id,"verify");
    }
    /**总结审核
     * @param $id
     */
    public function sumVerify($id){
        parent::verify(C('SUM_MODEL'),$id,"verify");
    }


    public function personInfo($id){
        if(is_numeric($id)){
            $user = M('Member')->find($id);
            parent::info(CC('BASE_INFO_MODEL',$user['type']),array('uid'=>$id),'','public/info');
        }else{
            $this->error('参数不合法!');
        }
    }

    public function printData($id){
        $id = array_unique((array)I('id',0));
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $user = M('Member')->find($id[0]);
        $type = $user['type'];
        $title = ($type==1?"运动员资料":$type==2?"教练员资料":"裁判员资料");
        parent::print_data(CC('BASE_INFO_MODEL',$type),array('uid' => array('in', arr2str($id))),'name',$title);
    }
}
