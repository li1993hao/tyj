<?php
namespace Admin\Model;
use Think\Model;

class GamePlanModel extends Model{
    protected  $_auto = array(
        array('start_time','strtotime',self::MODEL_BOTH,'function'),
        array('end_time','strtotime',self::MODEL_BOTH,'function')
    );

    protected $_validate = array(
        array('name', 'require','赛事名称必须填写',self::MUST_VALIDATE,'regex',self::MODEL_BOTH),
        array('name', '1,100', '赛事名称必须在1到100个字符内', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
        array('athlete_num','/[1-9][0-9]*/','参赛人数必须是正整数',self::EXISTS_VALIDATE,'regex',self::MODEL_BOTH),
    );

    public function update(){
        $data = $this->create();
        if(!$data){
            return false;
        }
        /* 添加或更新数据 */
        if(empty($data['id'])){
            $res = $this->add();
        }else{
            $res = $this->save();
        }
        return $res;
    }
}
