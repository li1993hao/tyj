<?php
namespace Admin\Model;
use Think\Model;

class PhysicalModel extends Model{

    protected $_validate = array(
        array('name', 'require','栏目名称必须填写',self::MUST_VALIDATE,'regex',self::MODEL_BOTH),
        array('code','require','代码必须填写',self::MUST_VALIDATE,'regex',self::MODEL_BOTH),
        array('code', '','代码已经存在!', self::MUST_VALIDATE, 'unique',self::MODEL_BOTH),
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

    /**
     * @param $node
     * @return array|mixed
     */
    public function  getPhysical($node){
        if(!empty($node)){
            $list = $this->where(array('type'=>1,'status'=>array('eq',1)))->field('id,name,pid')->select();
            $result = array();
            $count = count($list);

            $refer = array();
            foreach ($list as $key=>$value){
                $refer[$value['id']] = &$list[$key];
            }

            for($i=0; $i<$count; $i++){
                $c = $list[$i];
                $flag = false;
                while(true){
                    if($c['pid'] == $node['id'] || $c['id'] == $node['id']){
                        $flag = false;
                        break;
                    }
                    if($c['pid']==0){
                        $flag = true;
                        break;
                    }
                    $c = $refer[$c['pid']];
                }
                if($flag){
                    $result[] = $list[$i];
                }
            }
            return $result;
        }else{
            return $this->where(array('status'=>1,'type'=>1))->field('id,name')->select();
        }
    }

    /**
     * 获取分类树，指定分类则返回指定分类极其子分类，不指定则返回所有分类树
     * @param  integer $id    分类ID
     * @param  boolean $field 查询字段
     * @return array          分类树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function getTree($id = 0, $field = true){
        /* 获取当前分类信息 */
        if($id){
            $info = $this->info($id);
            $id   = $info['id'];
        }

        /* 获取所有分类 */
        $map  = array('status' => array('gt', -1));
        $list = $this->field($field)->where($map)->select();
        $list = list_to_tree($list, $pk = 'id', $pid = 'pid', $child = '_', $root = $id);
        /* 获取返回数据 */
        if(isset($info)){ //指定分类则返回当前分类极其子分类
            $info['_'] = $list;
        } else { //否则返回所有分类
            $info = $list;
        }
        return $info;
    }
}
