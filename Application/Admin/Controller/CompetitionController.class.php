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
 * 竞赛管理控制器
 */
class CompetitionController extends BaseController {

    /**
     * 赛事计划
     */
    public function plan(){
        $this->display();
    }

    /**
     * 赛事公告
     */
    public function notice(){
        $this->display();
    }

    /**
     * 成绩录入
     */
    public function achievement(){
        $this->display();
    }

}
