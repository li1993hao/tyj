<?php
/**
 * Created by PhpStorm.
 * User: haoli
 * Date: 14/12/19
 * Time: 下午8:15
 */

namespace Admin\Model;
use Think\Model;


class Sports extends Model{
    protected $_validate = array(
        array('name','require','项目名称必须填写'),
        array('name','1,100','项目名称必须在100个字符以内',self::EXISTS_VALIDATE,'length')
    );
} 