<?php
namespace Admin\Model;
use Think\Model;

class ComInfoModel extends Model{
    protected  $_auto = array(
        array('time','strtotime',self::MODEL_BOTH,'function'),
        array('create_time','time',self::MODEL_INSERT,'function'),
        array('update_time','time',self::MODEL_BOTH,'function')
    );

    protected $_validate = array(
        array('sports', 'require','参赛项目必须填写',self::MUST_VALIDATE,'regex',self::MODEL_BOTH),
        array('time', 'require', '参赛时间必须填写', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('place', 'require','参赛地点必须填写',self::MUST_VALIDATE,'regex',self::MODEL_BOTH)
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
