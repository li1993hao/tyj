<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
<title>体育局训竞管理服务平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="/tyj/Public/vender/ace/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/font-awesome.min.css" />

<!--[if IE 7]>
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/jquery.gritter.css" />
<!-- fonts -->

<!-- ace styles -->

<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace.min.css" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace-rtl.min.css" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace-skins.min.css" />

<link rel="stylesheet" href="/tyj/Public/static/css/comm.css" />
<!--[if lte IE 8]>
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="/tyj/Public/vender/ace/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="/tyj/Public/vender/ace/js/html5shiv.js"></script>
<script src="/tyj/Public/vender/ace/js/respond.min.js"></script>
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
    </style>
    

    
    <script>
        var ROOT= '/tyj';
    </script>
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
        <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li ><a class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>
<!-- /.navbar-header -->

<div class="navbar-header pull-right" role="navigation">
<ul class="nav ace-nav">
<li class="grey">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="icon-tasks"></i>
        <span class="badge badge-grey">4</span>
    </a>

    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
        <li class="dropdown-header">
            <i class="icon-ok"></i>
            还有4个任务完成
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">软件更新</span>
                    <span class="pull-right">65%</span>
                </div>

                <div class="progress progress-mini ">
                    <div style="width:65%" class="progress-bar "></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">硬件更新</span>
                    <span class="pull-right">35%</span>
                </div>

                <div class="progress progress-mini ">
                    <div style="width:35%" class="progress-bar progress-bar-danger"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">单元测试</span>
                    <span class="pull-right">15%</span>
                </div>

                <div class="progress progress-mini ">
                    <div style="width:15%" class="progress-bar progress-bar-warning"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">错误修复</span>
                    <span class="pull-right">90%</span>
                </div>

                <div class="progress progress-mini progress-striped active">
                    <div style="width:90%" class="progress-bar progress-bar-success"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                查看任务详情
                <i class="icon-arrow-right"></i>
            </a>
        </li>
    </ul>
</li>

<li class="purple">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="icon-bell-alt icon-animated-bell"></i>
        <span class="badge badge-important">8</span>
    </a>

    <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
        <li class="dropdown-header">
            <i class="icon-warning-sign"></i>
            8条通知
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-comment"></i>
												新闻评论
											</span>
                    <span class="pull-right badge badge-info">+12</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <i class="btn btn-xs btn-primary icon-user"></i>
                切换为编辑登录..
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												新订单
											</span>
                    <span class="pull-right badge badge-success">+8</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
												粉丝
											</span>
                    <span class="pull-right badge badge-info">+11</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                查看所有通知
                <i class="icon-arrow-right"></i>
            </a>
        </li>
    </ul>
</li>

<li class="green">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="icon-envelope icon-animated-vertical"></i>
        <span class="badge badge-success">5</span>
    </a>

    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
        <li class="dropdown-header">
            <i class="icon-envelope-alt"></i>
            5条消息
        </li>

        <li>
            <a href="#">
                <img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar"/>
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												不知道写啥 ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>1分钟以前</span>
											</span>
										</span>
            </a>
        </li>

        <li>
            <a href="#">
                <img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar"/>
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												不知道翻译...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>20分钟以前</span>
											</span>
										</span>
            </a>
        </li>

        <li>
            <a href="#">
                <img src="assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar"/>
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												到底是不是英文 ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>下午3:15</span>
											</span>
										</span>
            </a>
        </li>

        <li>
            <a href="inbox.html">
                查看所有消息
                <i class="icon-arrow-right"></i>
            </a>
        </li>
    </ul>
</li>

<li class="light-blue">
    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
        <img class="nav-user-photo" src="/tyj/Public/vender/ace/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>欢迎光临,</small>
									Jason
								</span>

        <i class="icon-caret-down"></i>
    </a>

    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
        <li>
            <a href="#">
                <i class="icon-user"></i>
                个人资料
            </a>
        </li>

        <li class="divider"></li>

        <li>
            <a href="<?php echo U('public/logout');?>">
                <i class="icon-off"></i>
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

                <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                        <button class="btn btn-success">
                            <i class="icon-signal"></i>
                        </button>

                        <button class="btn btn-info">
                            <i class="icon-pencil"></i>
                        </button>

                        <button class="btn btn-warning">
                            <i class="icon-group"></i>
                        </button>

                        <button class="btn btn-danger">
                            <i class="icon-cogs"></i>
                        </button>
                    </div>

                    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                        <span class="btn btn-success"></span>

                        <span class="btn btn-info"></span>

                        <span class="btn btn-warning"></span>

                        <span class="btn btn-danger"></span>
                    </div>
                </div>
                <!-- #sidebar-shortcuts -->

                <ul class="nav nav-list">

                    <?php if(!empty($_extra_menu)): ?>
                        <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                    <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                        <?php if(!empty($sub_menu)): if(empty($key)): if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>">
                                        <a href="<?php echo (u($menu["url"])); ?>">
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
                                                <a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
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
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li class="active">
                        <i class="icon-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                         
    <?php if(ACTION_NAME == 'addaction'): ?>新增<?php else: ?>编辑<?php endif; ?>行为

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
	<!-- 表单 -->
	<form id="form" action="<?php echo U('saveAction');?>" method="post" class="form-horizontal normal-form">
		<div class="form-group">
			<label class="item-label">行为标识<span class="check-tips">（输入行为标识 英文字母）</span></label>
			<div class="controls">
				<input type="text" class="text input-large" name="name" value="<?php echo ($data["name"]); ?>">
			</div>
		</div>
		<div class="form-group">
			<label class="item-label">行为名称<span class="check-tips">（输入行为名称）</span></label>
			<div class="controls">
				<input type="text" class="text input-large" name="title" value="<?php echo ($data["title"]); ?>">
			</div>
		</div>
		<div class="form-group">
			<label class="item-label">行为类型<span class="check-tips">（选择行为类型）</span></label>
			<div class="controls">
				<select name="type">
					<?php $_result=get_action_type(null,true);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>"><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="item-label">行为描述<span class="check-tips">（输入行为描述）</span></label>
			<div class="controls">
				<label class="textarea input-large"><textarea name="remark"><?php echo ($data["remark"]); ?></textarea></label>
			</div>
		</div>
		<div class="form-group">
			<label class="item-label">行为规则<span class="check-tips">（输入行为规则，不写则只记录日志）</span></label>
			<div class="controls">
				<label class="textarea input-large"><textarea name="rule"><?php echo ($data["rule"]); ?></textarea></label>
			</div>
		</div>
		<div class="form-group">
			<label class="item-label">日志规则<span class="check-tips">（记录日志备注时按此规则来生成，支持[变量|函数]。目前变量有：user,time,model,record,data）</span></label>
			<div class="controls">
				<label class="textarea input-large"><textarea name="log"><?php echo ($data["log"]); ?></textarea></label>
			</div>
		</div>

		<div class="form-item">
			<input type="hidden" name="id" value="<?php echo ($data["id"]); ?>"/>
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
<!--[if !IE]> -->

<script src="/tyj/Public/vender/ace/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/tyj/Public/vender/ace/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<script type="text/javascript">
    !function(){
        var str = "<script src='/tyj/Public/vender/ace/js/jquery.mobile.custom.min.js'>"+"<"+"script>";
        if("ontouchend" in document) document.write(str);
    }();
</script>
<script src="/tyj/Public/vender/ace/js/bootstrap.min.js"></script>
<script src="/tyj/Public/vender/ace/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="/tyj/Public/vender/ace/js/excanvas.min.js"></script>
<![endif]-->

<script src="/tyj/Public/vender/ace/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.ui.touch-punch.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.slimscroll.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.easy-pie-chart.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.sparkline.min.js"></script>
<script src="/tyj/Public/vender/ace/js/flot/jquery.flot.min.js"></script>
<script src="/tyj/Public/vender/ace/js/flot/jquery.flot.pie.min.js"></script>
<script src="/tyj/Public/vender/ace/js/flot/jquery.flot.resize.min.js"></script>

<script src="/tyj/Public/vender/ace/js/bootbox.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.gritter.min.js"></script>

<!-- ace scripts -->

<script src="/tyj/Public/vender/ace/js/ace-elements.min.js"></script>
<script src="/tyj/Public/vender/ace/js/ace.min.js"></script>
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
<script src="/tyj/Public/static/think.js"></script>
<script src="/tyj/Public/static/js/common.js"></script>





</body>
</html>