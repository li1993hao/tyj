<?php
namespace Admin\Controller;
use Think\Controller;
use Org\Util\QueryList;
class IndexController extends BaseController {
    public function index(){
       // $hj = QueryList::Query('http://mobile.csdn.net/',array("title"=>array('.unit h1','text')));
       // print_r($hj->jsonArr);
        $this->display();
    }


}