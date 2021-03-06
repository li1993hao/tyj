<?php
namespace Home\Controller;
use Think\Controller;
use Think\Page;
class IndexController extends HomeController {


    public function index(){
        $this->assign('index_style','active');

        $this->display();
    }


    public function search($search,$p=0){
        $array = preg_split('/[,;\r\n]+/', trim($search, ",;\r\n"));
        if(!$array){
            $this->error('查询条件不能为空!');
        }else{
            $list = api('Document/search',array('search'=>$array,'page'=>$p,'page_num'=>10));
            $total  = api('Document/searchCount',array('search'=>$array));
            $page = new Page($total,10,array('search'=>$search));
            if($total>10){
                $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            }
            $page->setConfig('div_class','pagination');
            $page->setConfig('current_class','active');
            $show       = $page->home_show();
            $this->assign('list',$list);
            $this->assign('page',$show);
            $nav[] = array('name'=>'首页','url'=>U('Index/index'));
            $nav[] = array('name'=>'搜索:'.$search,'url'=>"#");
            $this->assign('nav',$nav);
            $this->assign('tip','没找到您要的搜索结果,换个关键词试试吧!');
            $temp = C('TEMP_PATH').'/'.'list.html';
            if(!is_file($temp)){
                $this->error('衣服丢了- -');
            }else{
                $this->display($temp);
            }
        }
    }


    /**二级页面统一入口
     * @param $id
     * @param $p
     */
    public function  category($id,$p){
        $Category = api('Category/get_category',array('id'=>$id));

        if(!$Category){
            $this->error('没找到该分类~~~');
        }


        $this->assign('cat',$Category);
        $this->parse_nav($Category,'');

        if($Category['type']==1){
            //栏目
            if(api('Category/get_children_count',array('id'=>$id))>0){
                //有子栏目,渲染频道模板
                $temp = C('TEMP_PATH').'/'.$Category['temp_category'];
                if(!is_file($temp)){
                    $this->error('衣服丢了- -');
                }else{
                    $this->display($temp);
                }
            }else{//渲染列表页模版
                $list =  api('Document/lists',array('id'=>$id,'page'=>$p));
                $total = api('Document/listCount',array('id'=>$id));
                $page = new Page($total,$Category['list_num'],array('id'=>$id));
                if($total>$Category['list_num']){
                    $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
                }
                $page->setConfig('div_class','pagination');
                $page->setConfig('current_class','active');
                $show       = $page->home_show();
                $this->assign('list',$list);
                $this->assign('page',$show);
                $this->assign('cat',$Category);
                $temp = C('TEMP_PATH').'/'.$Category['temp_list'];
                if(!is_file($temp)){
                    $this->error('衣服丢了- -');
                }else{
                    $this->display($temp);
                }
            }
        }elseif($Category['type']==2){
            $info =  api('Document/detail',array('category'=>$id));
            $temp = C('TEMP_PATH').'/'.$Category['temp_content'];
            if(!is_file($temp)){
                $this->error($this->$tip);
            }else{
                $this->assign('cat',$Category);
                $this->assign('info',$info);
                $this->display($temp);
            }
        }elseif($Category['type']==3){
            //外部链接
            JDIRedirect($Category['url']);
        }
    }

    /**解析导航
     * @param $cat 当前栏目id
     * @param $content_title 内容页标题
     * @param int $pop_num  控制导航显示深度
     */
    private  function  parse_nav($cat,$content_title,$pop_num=1){
        //导航
        $nav =array();
        $cat_name = $cat['name'];
        if(!empty($content_title)){ //内容页导航
            $cat_url = list_url($cat);
            $cat_url = $cat_url['url'];
        }else{ //列表页导航
            $cat_url = "#";
        }


        if($cat['pid']==0){
            array_push($nav,array('name'=>$cat['name'],'url'=>$cat_url));
            $root_nav = $cat['id'];//根栏目,控制导航显示
        }else{
            while(true){
                $cat = api('Category/get_category',array('id'=>$cat['pid']));
                $cat = list_url($cat);
                array_push($nav,array('name'=>$cat['name'],'url'=>$cat['url']));
                if($cat['pid']==0){
                    $root_nav = $cat['id'];//根栏目,控制导航显示
                    for($i=0; $i<$pop_num;$i++){
                        array_pop($nav); //控制导航显示深度
                    }
                    if(!empty($content_title)){
                        array_push($nav,array('name'=>$content_title,'url'=>'#'));
                    }
                    array_push($nav,array('name'=>$cat_name,'url'=>$cat_url));
                    break;
                }
            }
        }
        array_push($nav,array('name'=>'首页','url'=>U('Index/index')));
        $nav = array_reverse($nav);
        $this->assign('root_nav',$root_nav);
        $this->assign('nav',$nav);
    }

    /**内容页统一入口
     * @param $catid
     * @param $id
     */
    public  function content($catid,$id){
        $info =  api('Document/detail',array('category'=>$catid,'id'=>$id));
        if(!$info){
            $this->error('您查询的内容不存在!');
        }else{
            //文件下载
            if(isset($info['file'])){
                if($this->download($info['file'])===false){
                    $this->error('文件找不到了..');
                }
            }else{
                $Category = api('Category/get_category',array('id'=>$catid));
                $temp = C('TEMP_PATH').'/'.$Category['temp_content'];
                if(!is_file($temp)){
                    $this->error('衣服丢了- -');
                }else{
                    //导航
                    $this->parse_nav($Category,$info['title']);
                    $info['content'] = htmlspecialchars_decode($info['content']); //内容去实体化
                    $this->assign('cat',$Category);
                    $this->assign('info',$info);
                    $this->display($temp);
                }
            }
        }
    }

    public function login($username = null, $password = null, $verify = null){
        if(IS_POST){
            if(!check_verify($verify)){
                $this->error("验证码输入错误");
            }
            $Member = D('Member');
            $uid = $Member->checkLogin($username, $password,1,false);
            if(0 < $uid){
                /* 登录用户 */
                if($Member->login($uid)){ //登录用户
//                    $reme = I('remember');
//                    if(!empty($reme)){//把登陆信息保存到cooike里面
//                        set_auto_login_cookie();
//                    }
                    define(UID,$uid);
                    $this->success("登录成功!");
                } else {
                    $this->error("登录失败！");
                }

            } else { //登录失败
                switch($uid) {
                    case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
                    case -2: $error = '密码错误！'; break;
                    default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }
        } else {
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                $nav[] = array('name'=>'首页','url'=>U('Index/index'));
                $nav[] = array('name'=>'登陆','url'=>"#");
                $this->assign('nav',$nav);
                $this->display();
            }
        }
    }

    public function gamePlan($years){
        if(is_numeric($years)){
            $result = M('GamePlanYears')->where(array('years'=>$years))->find();
            if(!$result || $result['status']<=0){
                $this->error('该年份的赛事信息还未发布!');
            }
            $article = M('Article')->find($result['status']);
            if(!$article){ //被删除了
                $result['status']=0; //新闻被删除,重置状态
                M('GamePlanYears')->save($result,LK());
                $this->error('该年份的赛事信息还未发布!');
            }

            if($article['status'] != 1){//非启用状态
                $this->error('赛事信息禁止查看!');
            }

            $Category = api('Category/get_category',array('id'=>$article['category_id']));
            $this->parse_nav($Category,$article['title']);

            M('Article')->where(array('id'=>$result['status']))->setInc('view'); //浏览数量＋1
            $map =array('years'=>$years,'status'=>1);
            $list =  M('GamePlan')->where($map)->order('name asc,start_time asc')->select();
            $this->meta_title = $years.'年赛事计划';
            $this->assign('years',$years);
            $this->assign('list',$list);
            $this->assign('info',$article);
            $this->display('game_plan');
        }else{
            $this->error('参数非法!');
        }
    }

    /* 退出登录 */
    public function logout(){
        if(is_login()){
            D('Member')->logout();
            session('[destroy]');
            $this->success('退出成功！', U('Index/index'));
        } else {
            $this->redirect('Index/index');
        }
    }

    public function verify(){
        $verify = new \Think\Verify(array('imageH'=>30,'imageW'=>100,'length'=>4,'codeSet'=>'23456789','fontSize'  =>  12,'useCurve'  =>  false,'useNoise'  =>  false));
        $verify->entry(1);
    }

}