<?php
namespace Home\Controller;
use Think\Controller;
use Think\Page;
class PersonController extends HomeController {
    public function index(){
        $this->assign('index_style','active');
        $this->display();
    }
}