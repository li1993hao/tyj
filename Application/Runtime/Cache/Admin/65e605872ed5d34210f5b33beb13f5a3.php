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
                        
    用户列表

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
	<div>
        <div class="btn-group">
        <a class="btn btn-sm btn-primary" href="<?php echo U('User/add');?>">新 增</a>
        <button class="btn btn-sm btn-primary ajax-post" url="<?php echo U('User/changeStatus',array('method'=>'resumeUser'));?>" target-form="id">启 用</button>
        <button class="btn btn-sm btn-primary ajax-post" url="<?php echo U('User/changeStatus',array('method'=>'forbidUser'));?>" target-form="id">禁 用</button>
        <button class="btn btn-sm btn-primary ajax-post confirm" url="<?php echo U('User/changeStatus',array('method'=>'deleteUser'));?>" target-form="id">删 除</button>
        </div>
        <!-- 高级搜索 -->
        <div class="pull-right">
            <span class="input-icon">
                <input type="text" placeholder="搜索..." autocomplete="off" id="search">
                <i class="icon-search"></i>
			</span>
        </div>
    </div>
    <!-- 数据列表 -->
    <div class="table-responsive">
        <form class="ids">
	<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th class="center">
                <label>
                    <input type="checkbox" class="ace check-all">
                    <span class="lbl"></span>
                </label>
            </th>
		<th>UID</th>
		<th>昵称</th>
		<!--<th class="">积分</th>-->
		<th>登录次数</th>
		<th>最后登录时间</th>
		<th>最后登录IP</th>
        <th>用户组</th>
		<th>状态</th>
		<th>操作</th>
		</tr>
    </thead>
    <tbody>
		<?php if(!empty($_list)): if(is_array($_list)): $i = 0; $__LIST__ = $_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
            <td class="center">
                <label>
                    <input class="ids ace" type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>" />
                    <span class="lbl"></span>
                </label>
            </td>
			<td><?php echo ($vo["id"]); ?> </td>
			<td><?php echo ($vo["nickname"]); ?></td>
			<!--<td><?php echo ($vo["score"]); ?></td>-->
			<td><?php echo ($vo["login_times"]); ?></td>
			<td><span><?php echo (time_format($vo["last_login_time"])); ?></span></td>
			<td><span><?php echo long2ip($vo['last_login_ip']);?></span></td>
            <td><?php echo ((isset($vo["groups"]) && ($vo["groups"] !== ""))?($vo["groups"]):'-'); ?></td>
			<td><?php echo ($vo["status_text"]); ?></td>
			<td><?php if(($vo["status"]) == "1"): ?><a href="<?php echo U('User/changeStatus?method=forbidUser&id='.$vo['id']);?>" class="ajax-get">禁用</a>
				<?php else: ?>
				<a href="<?php echo U('User/changeStatus?method=resumeUser&id='.$vo['id']);?>" class="ajax-get">启用</a><?php endif; ?>
				<a href="<?php echo U('User/changeStatus?method=deleteuser?id='.$vo['id']);?>" class="confirm ajax-get">删除</a>
                <a href="javascript:;" class="group-set" data-id="<?php echo ($vo['groups_id']); ?>" data-uid="<?php echo ($vo["id"]); ?>">设置用户组</a>
            </td>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php else: ?>
		<td colspan="9" class="text-center"> aOh! 暂时还没有内容! </td><?php endif; ?>
	</tbody>
    </table>
       </form>
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
    </div>
</div><!-- /.main-container -->

    <div id="group_check" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="group_check-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" style="text-align:center">设置用户组</h4>
                </div>
                <div class="modal-body">
                      <form class="group_ids">
                       <?php if(is_array($group)): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$g): $mod = ($i % 2 );++$i;?><label>
                               <input type="checkbox" class=" group_check group_check_<?php echo ($g["id"]); ?>" name="groups_id[]" value="<?php echo ($g["id"]); ?>">
                               <span class="lbl"><?php echo ($g["title"]); ?></span>
                           </label><?php endforeach; endif; else: echo "" ;endif; ?>
                          <input type="hidden" name="uid"/>
                       </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-sm ajax-post " url="<?php echo U('User/setUserGroup');?>" target-form="group_ids">设置</button>
                    <button class="btn btn-sm" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>


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
        var uid;
        //回车搜索
        $("#search").keyup(function(e) {
            if (e.keyCode === 13) {
                var url =  "<?php echo U(CONTROLLER_NAME.'/'.ACTION_NAME.'?nickname=PLACEHODLE');?>";
                var query = $('#search').val();
                url = url.replace('PLACEHODLE',query);
                window.location.href = url;
                return false;
            }
        });

        $(".group-set").click(function(){
            $('.group_check').prop('checked',false);
            uid = $(this).data('uid');
            $("input[name='uid']").val(uid);
            var cg = ($(this).data('id')+'').split(',');

            for(var i=0; i<cg.length; i++){
                var cl = '.group_check_'+cg[i];
                $(cl).prop('checked',true);
            }
            $("#group_check").modal('show');
        });
        function group_set(){

        }

	</script>

</body>
</html>