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
 * 属性控制器
 * @author huajie <banhuajie@163.com>
 */
class MailController extends BaseController {
        public function index(){

        }
    public function inbox(){
        $this->display('index');
    }
}
