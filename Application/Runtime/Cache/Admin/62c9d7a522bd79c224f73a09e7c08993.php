<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
<title><?php echo ((isset($meta_title) && ($meta_title !== ""))?($meta_title):'体育局训竞管理服务平台'); ?></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

    <style>
        .main_nav li{
            float: left;
        }
        ul li{
            list-style: none;
        }
        .main_nav a{
            color: #ffffff;
            display: block;
            padding: 10px 10px 0 10px;
            min-height: 45px;
            font-size: 16px;
        }
        .main_nav a:hover{
            text-decoration: none;
        }

        .main_nav a.active{
            background-color:#93cbf9;
        }
        textarea{
            min-height: 150px;
            min-width: 300px;
        }
        .table thead>tr>th, .table tbody>tr>th, .table tfoot>tr>th, .table thead>tr>td, .table tbody>tr>td, .table tfoot>tr>td{
            line-height: 2;
        }
    </style>
    

    
</head>
<body class="navbar-fixed">
<!-- 头部 -->
<div class="navbar navbar-default navbar-fixed-top" id="navbar">
<script type="text/javascript">
    try {
        ace.settings.check('navbar', 'fixed')
    } catch (e) {
    }
</script>

<div class="navbar-container" id="navbar-container">
<div class="navbar-header pull-left">
    <ul class="main_nav">
        <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i; if(($menu["hide"]) == "0"): ?><li ><a class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>" href="<?php echo U($menu['url']);?>"><?php echo ($menu["title"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>
<!-- /.navbar-header -->

<div class="navbar-header pull-right" role="navigation">
<ul class="nav ace-nav">
<li class="light-blue">
    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
        <i class="icon-user" style="font-size: 23px"></i>
    </a>
    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
        <li>
            <a href="javascript:;">
                您好:<?php echo session('user_auth.username');?>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <?php if(user_field('type') == 0): ?><a href="<?php echo U('MySpace/updatePassword');?>">
                    修改密码
                </a>
            <?php else: ?>
                <a href="<?php echo U('MySpace/baseInfo');?>">
                    个人中心
                </a><?php endif; ?>
        </li>
        <li class="divider"></li>
        <li>
            <a href="<?php echo U('public/logout');?>">
                退出
            </a>
        </li>
    </ul>
</li>
</ul>
<!-- /.ace-nav -->
</div>
<!-- /.navbar-header -->
</div>
<!-- /.container -->
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
                    <h1>
                         
    模型列表

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
    <div class="btn-group">
        <?php if(isset($current_type)): if(is_array($types)): foreach($types as $key=>$vo): if(($current_type) == $key): ?><button data-toggle="dropdown" class="btn btn-sm btn-primary dropdown-toggle"><?php echo ($vo); ?>
                        <span class="icon-caret-down icon-on-right"></span>
                    </button><?php endif; endforeach; endif; ?>
            <?php else: ?>
            <button data-toggle="dropdown" class="btn btn-sm btn-primary dropdown-toggle">全部
                <span class="icon-caret-down icon-on-right"></span>
            </button><?php endif; ?>

        <ul class="dropdown-menu dropdown-primary">
            <?php if(isset($current_type)): ?><li>
                    <a href="<?php echo U('index');?>" >全部</a>
                </li>
                <?php if(is_array($types)): foreach($types as $key=>$vo): ?><li>
                        <?php if(($current_type) != $key): ?><a href="<?php echo U('index?type='.$key);?>"><?php echo ($vo); ?></a><?php endif; ?>
                    </li><?php endforeach; endif; ?>
                <?php else: ?>
                <?php if(is_array($types)): foreach($types as $key=>$vo): ?><li>
                        <a href="<?php echo U('index?type='.$key);?>"><?php echo ($vo); ?></a>
                    </li><?php endforeach; endif; endif; ?>
        </ul>
        <a class="btn btn-sm btn-primary" href="<?php echo U('Model/add');?>">新 增</a>
        <button class="btn btn-sm btn-primary  ajax-post" target-form="ids" url="<?php echo U('Model/setStatus',array('status'=>1));?>">启 用</button>
        <button class="btn btn-sm btn-primary ajax-post" target-form="ids" url="<?php echo U('Model/setStatus',array('status'=>0));?>">禁 用</button>
        <a class="btn btn-sm btn-primary" href="<?php echo U('Model/generate');?>">生 成</a>
    </div>

    <!-- 数据列表 -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th class="center">
                    <label>
                        <input type="checkbox" class="ace check-all">
                        <span class="lbl"></span>
                    </label>
                </th>
                <th>编号</th>
                <th>标识</th>
                <th>名称</th>
                <th>创建时间</th>
                <th>状态</th>
                <th>组别</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(!empty($_list)): if(is_array($_list)): $i = 0; $__LIST__ = $_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                        <td class="center">
                            <label>
                                <input type="checkbox" class="ids ace" name="ids[]" value="<?php echo ($vo["id"]); ?>">
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td><?php echo ($vo["id"]); ?></td>
                        <td><?php echo ($vo["name"]); ?></td>
                        <td><a data-id="<?php echo ($vo["id"]); ?>" href="<?php echo U('model/edit?id='.$vo['id']);?>"><?php echo ($vo["title"]); ?></a></td>
                        <td><span><?php echo (time_format($vo["create_time"])); ?></span></td>
                        <td><?php echo ($vo["status_text"]); ?></td>
                        <td><?php echo (get_model_type($vo["type"])); ?></td>
                        <td>
                            <a href="<?php echo U('think/lists?model='.$vo['name']);?>">数据</a>
                            <a href="<?php echo U('model/setstatus?ids='.$vo['id'].'&status='.abs(1-$vo['status']));?>"
                               class="ajax-get"><?php echo (show_status_op($vo["status"])); ?></a>
                            <a href="<?php echo U('model/edit?id='.$vo['id']);?>">编辑</a>
                            <a href="<?php echo U('model/del?ids='.$vo['id']);?>" class="confirm ajax-get">删除</a>
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <?php else: ?>
                <td colspan="8" class="text-center"> aOh! 暂时还没有内容!</td><?php endif; ?>
            </tbody>
        </table>

    </div>
    <div class="page">
        <?php echo ($_page); ?>
    </div>

                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.page-content -->
            </div>
            <!-- /.main-content -->

        </div>
        <!-- /.main-container-inner -->
        <!--<div  class="ace-settings-container" id="ace-settings-container">-->
        <!--<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">-->
        <!--<i class="icon-cog bigger-150"></i>-->
        <!--</div>-->

        <!--<div class="ace-settings-box" id="ace-settings-box">-->
        <!--<div>-->
        <!--<div class="pull-left">-->
        <!--<select id="skin-colorpicker" class="hide">-->
        <!--<option data-skin="default" value="#438EB9">#438EB9</option>-->
        <!--<option data-skin="skin-1" value="#222A2D">#222A2D</option>-->
        <!--<option data-skin="skin-2" value="#C6487E">#C6487E</option>-->
        <!--<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>-->
        <!--</select>-->
        <!--</div>-->
        <!--<span>&nbsp; 选择皮肤</span>-->
        <!--</div>-->

        <!--<div>-->
        <!--<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />-->
        <!--<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>-->
        <!--</div>-->

        <!--<div>-->
        <!--<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />-->
        <!--<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>-->
        <!--</div>-->

        <!--<div>-->
        <!--<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />-->
        <!--<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>-->
        <!--</div>-->

        <!--<div>-->
        <!--<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />-->
        <!--<label class="lbl" for="ace-settings-rtl">切换到左边</label>-->
        <!--</div>-->

        <!--<div>-->
        <!--<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />-->
        <!--<label class="lbl" for="ace-settings-add-container">-->
        <!--切换窄屏-->
        <!--<b></b>-->
        <!--</label>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!-- /#ace-settings-container -->


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
            "APP"    : "/tyj", //当前项目地址
            "PUBLIC" : "/tyj/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
</script>
<script type="text/javascript" src="/tyj/Public/static/think.js"></script>
<script type="text/javascript" src="/tyj/Public/static/js/common.js"></script>





</body>
</html>