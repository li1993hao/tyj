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
                        
    添加分类

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
    <form class="form-horizontal normal-form" action="<?php echo U(add);?>" method="post">
        <input type="hidden" name="type" value="<?php echo ($type); ?>"/>
        <?php if(!empty($node)): ?><input type="hidden" name="id" value="<?php echo ($node['id']); ?>"/><?php endif; ?>
        <div class="form-group">
            <label  class="item-label">父亲节点</label>
            <div class="controls">
                <select name="pid">
                    <option value="0">无</option>
                    <?php if(is_array($pid)): $i = 0; $__LIST__ = $pid;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$p): $mod = ($i % 2 );++$i; if($p['id'] == $select_id): ?><option value="<?php echo ($p["id"]); ?>" selected><?php echo ($p["name"]); ?></option>
                            <?php else: ?>
                            <option value="<?php echo ($p["id"]); ?>"><?php echo ($p["name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="item-label">分类名称</label>
            <div class="controls">
                <input type="text" class="text input-large"  name="name"
                       placeholder="请输入名称" value="<?php echo ($node['name']); ?>">
            </div>
        </div>
        <div class="form-group">
            <label class="item-label">英文名称</label>
            <div class="controls">
                <input type="text" class="text input-large"  name="symbol" value="<?php echo ($node['symbol']); ?>">
            </div>
        </div>
        <div class="form-group">
            <label class="item-label">列表页大小</label>
            <div class="controls">
                <input type="text"  id="list_num" name="list_num" value="<?php echo ($node['list_num']); ?>">
            </div>
        </div>
        <div class="form-group">
            <label  class="item-label">首页显示</label>
            <div class="controls">
                <select name="index_show">
                    <?php if(isset($node)): if(1 == $node['index_show']): ?><option value="1" selected>是</option>
                            <?php else: ?>
                            <option value="1" >是</option><?php endif; ?>
                        <?php if(0 == $node['index_show']): ?><option value="0" selected>否</option>
                            <?php else: ?>
                            <option value="0" >否</option><?php endif; ?>
                        <?php else: ?>
                        <option value="1" >是</option>
                        <option value="0" >否</option><?php endif; ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="item-label">是否需要审核</label>
            <div class="controls">
                <select name="verify">
                    <?php if(isset($node)): if(1 == $node['verify']): ?><option value="1" selected>是</option>
                            <?php else: ?>
                            <option value="1" >是</option><?php endif; ?>
                        <?php if(0 == $node['verify']): ?><option value="0" selected>否</option>
                            <?php else: ?>
                            <option value="0" >否</option><?php endif; ?>
                        <?php else: ?>
                        <option value="0" >否</option>
                        <option value="1" >是</option><?php endif; ?>
                </select>
            </div>
        </div>



        <div class="form-group">
            <label  class="item-label">禁用</label>
            <div class="controls">
                <select name="status">
                    <?php if(isset($node)): if(1 == $node['status']): ?><option value="1" selected>否</option>
                            <?php else: ?>
                            <option value="1" >否</option><?php endif; ?>
                        <?php if(0 == $node['status']): ?><option value="0" selected>是</option>
                            <?php else: ?>
                            <option value="0" >是</option><?php endif; ?>
                        <?php else: ?>
                        <option value="1" >否</option>
                        <option value="0" >是</option><?php endif; ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="item-label">模型</label>
            <div class="controls">
                <select  name="model_id">
                    <?php if(is_array($model)): $i = 0; $__LIST__ = $model;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$m): $mod = ($i % 2 );++$i; if($m['id'] == $node['model_id']): ?><option value="<?php echo ($m["id"]); ?>" selected><?php echo ($m["name"]); ?></option>
                            <?php else: ?>
                            <option value="<?php echo ($m["id"]); ?>"><?php echo ($m["name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>


        <div class="form-group">
            <label class="item-label">分类模板</label>
            <div class="controls">
                <select name="temp_category">
                    <?php if(is_array($temp["category"])): $i = 0; $__LIST__ = $temp["category"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$category): $mod = ($i % 2 );++$i; if($category == $node['temp_category']): ?><option value="<?php echo ($category); ?>" selected><?php echo ($category); ?></option>
                            <?php else: ?>
                            <option value="<?php echo ($category); ?>"><?php echo ($category); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label  class="item-label">列表页模板</label>
            <div class="controls">
                <select  name="temp_list">
                    <?php if(is_array($temp["list"])): $i = 0; $__LIST__ = $temp["list"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i; if($list == $node['temp_list']): ?><option value="<?php echo ($list); ?>" selected><?php echo ($list); ?></option>
                            <?php else: ?>
                            <option value="<?php echo ($list); ?>"><?php echo ($list); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label  class="item-label">内容模板</label>
            <div class="controls">
                <select name="temp_content">
                    <?php if(is_array($temp["content"])): $i = 0; $__LIST__ = $temp["content"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$content): $mod = ($i % 2 );++$i; if($content == $node['temp_content']): ?><option value="<?php echo ($content); ?>" selected><?php echo ($content); ?></option>
                            <?php else: ?>
                            <option value="<?php echo ($content); ?>"><?php echo ($content); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-primary ajax-post" target-form="form-horizontal">确 定</button>
            <button class="btn btn-sm" onclick="javascript:history.back(-1);return false;">返 回</button>
        </div>
    </form>

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





</body>
</html>