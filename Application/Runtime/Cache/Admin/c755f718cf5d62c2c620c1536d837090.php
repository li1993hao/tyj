<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
<title><?php echo ((isset($meta_title) && ($meta_title !== ""))?($meta_title):'体育局训竞管理服务平台'); ?></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit">
<!-- basic styles -->
<link href="/tyj/Public/vendor/ace/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/font-awesome.min.css" />

<!--[if IE 7]>
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/jquery.gritter.css" />
<!-- fonts -->

<!-- ace styles -->

<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/ace.min.css" />
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/ace-rtl.min.css" />
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/ace-skins.min.css" />

<link rel="stylesheet" href="/tyj/Public/static/css/comm.css" />
<!--[if lte IE 8]>
<link rel="stylesheet" href="/tyj/Public/vendor/ace/css/ace-ie.min.css" />
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<!-- ace settings handler -->

<script type="text/javascript" src="/tyj/Public/vendor/ace/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/html5shiv.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/respond.min.js"></script>
<![endif]-->

    

    
</head>
<body class="navbar-fixed">
<div class="shade" style="display:none"></div>
<!-- 头部 -->
<div class="navbar navbar-default navbar-fixed-top">
<script type="text/javascript">
    try {
        ace.settings.check('navbar', 'fixed')
    } catch (e) {
    }
</script>
<div class="container-fluid">
    <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" id="nav_top_main_bt" data-toggle="collapse" data-target="nav_top_main">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!--<a class="navbar-brand hidden-sm" href="http://www.bootcss.com">天津市体育局</a>-->
    </div>
    <div class="navbar-collapse collapse" id="nav_top_main">
        <ul class="nav navbar-nav">
            <li class="menu_hide menu_hide1">
                <span>您好:<?php echo session('user_auth.username');?></span>
            </li>
            <li class="menu_hide menu_hide2">
                <?php if(user_field('type') == 0): ?><a href="<?php echo U('MySpace/updatePassword');?>">
                        修改密码
                    </a>
                    <?php else: ?>
                    <a href="<?php echo U('MySpace/baseInfo');?>">
                        个人中心
                    </a><?php endif; ?>
            </li>
            <li class="menu_hide menu_hide3">
                <a href="<?php echo U('public/logout');?>">
                    退出
                </a>
            </li>
            <li class="menu_hide" style="background-color: #fff;height:2px"></li>
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i; if(($menu["hide"]) == "0"): ?><li ><a  class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>" href="<?php echo U($menu['module'].'/'.$menu['url']);?>"><?php echo ($menu["title"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <ul class="user_menu_ul nav navbar-nav navbar-right ">
            <li >
                <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                    <i class="icon-user" style="font-size: 23px"></i>
                </a>
                <ul class="user-menu  dropdown-menu">
                    <li>
                        <span>您好:<?php echo session('user_auth.username');?></span>
                    </li>
                    <li>
                        <?php if(user_field('type') == 0): ?><a href="<?php echo U('MySpace/updatePassword');?>">
                                修改密码
                            </a>
                            <?php else: ?>
                            <a href="<?php echo U('MySpace/baseInfo');?>">
                                个人中心
                            </a><?php endif; ?>
                    </li>
                    <li>
                        <a href="<?php echo U('public/logout');?>">
                            退出
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- /.ace-nav -->
</div>


<!-- /头部 -->

<!-- 主体 -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        
            <div class="sidebar sidebar-fixed" id="sidebar">
                <script type="text/javascript">
                    try {
                        ace.settings.check('sidebar', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="nav nav-list">
                    <?php if(!empty($_extra_menu)): ?>
                        <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                    <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                        <?php if(!empty($sub_menu)): if(empty($key)): if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>">
                                        <a href="<?php echo U($menu['url']);?>">
                                            <span class="menu-text"><?php echo ($menu["title"]); ?></span>
                                        </a>
                                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                <?php else: ?>
                                <?php $group_class = $__MENU__['group_class'][$key]; ?>
                                <li class="<?php echo ($group_class); ?>">
                                    <a href="#" class="dropdown-toggle">
                                        <span class="menu-text"><?php echo ($key); ?></span>
                                        <b class="arrow icon-angle-down"></b>
                                    </a>
                                    <ul class="submenu">
                                        <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>">
                                                <a href="<?php echo U($menu['url']);?>"><?php echo ($menu["title"]); ?></a>
                                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </ul>
                                </li><?php endif; endif; ?>
                        <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
                <!-- /.nav-list -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="icon-double-angle-right" data-icon1="icon-double-angle-left"
                       data-icon2="icon-double-angle-right"></i>
                </div>
                <script type="text/javascript">
                    try {
                        ace.settings.check('sidebar', 'collapsed')
                    } catch (e) {
                    }
                </script>
            </div>
        

        <div class="main-content">

            <div class="page-content">
                <div class="page-header">
                    <h1 class="page-header-title">
                        
    身体机能信息

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
    <div class="able-responsive">
        <table class="table table-striped  ">
            <thead>
            <tr>
                <th>代码</th>
                <th>名称</th>
                <th>单位</th>
                <th class="text-center">值(双击修改)</th>
            </tr>
            </thead>
            <tbody>
            <?php if(!empty($nodeList)): if(is_array($nodeList)): $i = 0; $__LIST__ = $nodeList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$node): $mod = ($i % 2 );++$i;?><tr class="level" data-level="<?php echo ($node['level']); ?>" >
                        <td><?php echo ($node["code"]); ?></td>
                        <td>
                            <?php if(isset($node["children"])): ?><div style="display: inline-block" class=" node-folder" data-status='open'><i class="icon-minus smaller-100"></i></div><?php endif; ?>
                            <?php $__FOR_START_2044965953__=0;$__FOR_END_2044965953__=$node["level"];for($i=$__FOR_START_2044965953__;$i < $__FOR_END_2044965953__;$i+=1){ if($i == $node['level']-1): if($node['last']): ?>|__
                                        <?php else: ?>
                                        |--<?php endif; ?>
                                    <?php else: ?>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php endif; } ?>
                            <?php echo ($node["name"]); ?></td>
                        <td><?php echo ((isset($node["unit"]) && ($node["unit"] !== ""))?($node["unit"]):''); ?></td>
                        <td class="text-center">
                            <?php if(!isset($node["children"])): ?><div class="click_edit"  data-name="<?php echo ($node["code"]); ?>" data-value="<?php echo ((isset($data->$node['code']) && ($data->$node['code'] !== ""))?($data->$node['code']):'-'); ?>"><?php echo ((isset($data->$node['code']) && ($data->$node['code'] !== ""))?($data->$node['code']):'-'); ?></div><?php endif; ?>
                        </td>

                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <?php else: ?>
                <td colspan="6" class="text-center"> aOh! 暂时还没有内容! </td><?php endif; ?>

            </tbody>
        </table>
    </div>

                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.page-content -->
            </div>
            <!-- /.main-content -->
        </div>
    </div>
</div><!-- /.main-container -->



<!-- /主体 -->

<!-- 底部 -->

<script type="text/javascript">
    !function(){
        var str = "<script src='/tyj/Public/vendor/ace/js/jquery.mobile.custom.min.js'>"+"<"+"script>";
        if("ontouchend" in document) document.write(str);
    }();
</script>
<script src="/tyj/Public/vendor/ace/js/bootstrap.min.js"></script>
<script src="/tyj/Public/vendor/ace/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/excanvas.min.js"></script>
<![endif]-->

<script type="text/javascript"  src="/tyj/Public/vendor/ace/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/flot/jquery.flot.resize.min.js"></script>

<script type="text/javascript" src="/tyj/Public/vendor/ace/js/bootbox.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery.gritter.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/bootstrap-wysiwyg.min.js"></script>

<!-- ace scripts -->

<script type="text/javascript" src="/tyj/Public/vendor/ace/js/ace-elements.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/ace.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ace/js/jquery.hotkeys.min.js"></script>
<script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "/tyj", //当前网站地址
            "APP"    : "/tyj/index.php?s=", //当前项目地址
            "PUBLIC" : "/tyj/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
        $("#nav_top_main_bt").click(function(){
            $("#nav_top_main").toggle(200);
        })
    })();
</script>
<script type="text/javascript" src="/tyj/Public/static/think.js"></script>
<script type="text/javascript" src="/tyj/Public/static/js/common.js"></script>




    <script type="text/javascript">
        $('.click_edit').css('cursor','pointer');
        $('.click_edit').dblclick(function(){
            <?php if((C("USER_PHY")) == "0"): ?>errorAlert('抱歉该功能暂时关闭!');
            return false;<?php endif; ?>

            if($(this).children('.edit_input').length>0){
                return;
            }
             var name = $(this).data('name');
             var value = $(this).data('value');
             if(value == '-'){
                 value='';
             }
             var input = '<input  type="text" onblur="submit(this)" data-value="'+value+'"  name="'+name+'"  value="'+value+'"/>';
             $(this).empty().html(input);
            $(this).children('input').focus();
        });

        function submit(ele){
            var value = $(ele).val();
            var preValue = $(ele).data('value');
            if(value == preValue){ //没编辑
                var parentDiv = $(ele).parent('.click_edit');
                if(!value){
                    value = '-';//默认值
                }
                $(parentDiv).data('value',value);
                $(parentDiv).empty().text(value);
                return;
            }

            var code = $(ele).prop('name');
           if(/^[-+]?\d+\.?\d*$/.test(value)){
               $.post("<?php echo U('changePhysical');?>",{'code':code,'value':value},function(data){
                   if(data.status){
                       okAlert(data.msg);
                       var parentDiv = $(ele).parent('.click_edit');
                       $(parentDiv).data('value',value);
                       $(parentDiv).empty().text(value);
                   }else{
                       $(ele).focus();
                       errorAlert(data.msg);
                   }
               },'json');
           }else{
               $(ele).focus();
               errorAlert('输入非法');
           }
        }

        $('.node-folder').click(function(){
            var tr = $(this).parents('.level');
            var currentLevel = getLevel(tr);
            var current_status = $(this).data('status');
            var ob = getNextLevel(tr);
            //下层检测
            while(true){
                if(ob.level == 0||ob.level===undefined){
                    break;
                }
                if(ob.level>currentLevel){
                    if(current_status=='open'){
                        $(ob.tr).hide();
                        $($(ob.tr).find('.node-folder')).empty().html('<i class="icon-plus smaller-100"></i>');
                    }else{
                        $(ob.tr).show();
                        $($(ob.tr).find('.node-folder')).empty().html('<i class="icon-minus smaller-100"></i>');
                    }
                }else{
                    break;
                }
                ob = getNextLevel(ob.tr); //指针替换
            }

            if(current_status=='open'){
                $(this).data('status','close');
                $(this).empty().html('<i class="icon-plus smaller-100"></i>');
            }else{
                $(this).data('status','open');
                $(this).empty().html('<i class="icon-minus smaller-100"></i>');
            }

//            if(currentLevel != 0){ //根节点不做上层检测
//                ob = getPreLevel(tr);
//                //上层检测
//                while(true){
//                    if(ob.level == 0||ob.level===undefined){
//                        if(status && ob.level == 0){
//                            $($(ob.tr).find("input[type='checkbox']")).prop('checked',true);
//                        }
//                        break;
//                    }
//                    if(ob.level<currentLevel){
//                        if(status){
//                            $($(ob.tr).find("input[type='checkbox']")).prop('checked',true);
//                        }
//                    }
//                    ob = getPreLevel(ob.tr); //指针替换
//                }
//            }
        });

        /**
         * 获得下一行层次
         * @param current
         */
        function getNextLevel(tr){
            var nextTr = $(tr).next('tr');
            var level = getLevel(nextTr);
            return {'level':level,'tr':nextTr};
        }

        /**
         * 获得上一行的层次
         * @param current
         */
        function getPreLevel(tr){
            var preTr = $(tr).prev('tr');
            var level = getLevel(preTr);
            return {'level':level,'tr':preTr};
        }

        function getLevel(tr){
            return $(tr).data('level');
        }
    </script>

</body>
</html>