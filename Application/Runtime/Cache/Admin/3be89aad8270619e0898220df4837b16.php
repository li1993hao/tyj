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
                        <a href="<?php echo U('Home/Index/logout');?>">
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
                        
    运动员

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
    <div class="clearfix">
        <div class="btn-group">
            <Button class="btn btn-sm btn-primary" id="print">打印所选运动员资料</Button>
        </div>
        <div class="pull-right">
            <a href="#" id="adv_show">
                <i class="icon-chevron-up"></i>
            </a>
            <span class="input-icon">
                <input type="text" placeholder="搜索姓名.按回车搜索" autocomplete="off" id="search">
                <i class="icon-search"></i>
			</span>
        </div>
    </div>
    <div class="panel panel-default" id="adv_search" style="display:none">
        <form class="search-form" method="post" action="<?php echo U();?>">
        <div class="panel-heading clearfix">
            <div class="pull-right">
                <Button class="btn btn-sm btn-primary" type="submit" target-form="search-form">搜索</Button>
            </div>
        </div>
        <div class="panel-body table-responsive">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td>姓名：<input type="text" name="query_name" ></td>
                        <td>性别：
                            <select name="query_gender">
                                <option value="__whatever__">不限</option>
                                <option value="0">女</option>
                                <option value="1">男</option>
                            </select>
                        </td>
                        <td>技术等级：
                            <select name="query_technicalGrade">
                                <option value="__whatever__">不限</option>
                                <?php $_result=C('TECHNICALGRADE');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$c): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>"><?php echo ($c); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </td>
                        <td>运动项目：
                            <select name="query_sports">
                                <option value="__whatever__">不限</option>
                                <?php $_result=get_sports();if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$c): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>"><?php echo ($c); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </td>
                        <td>运动队：
                            <select name="query_team">
                                <option value="__whatever__">不限</option>
                                <?php $_result=get_team();if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$c): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>"><?php echo ($c); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </td>
                        <td>每页显示数量：
                            <select name="r">
                                <option value="10">10</option>
                                <option value="20">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                                <option value="200">200</option>
                                <option value="400">400</option>
                            </select>
                        </td>
                    </tr>
                </table>
                </div>
        </div>
        </form>
    </div>
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
                <th>姓名
                </th>
                <th>性别</th>
                <th>运动项目</th>
                <th>所属运动队</th>
                <th>运动技术等级</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(!empty($list)): if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                        <td class="center">
                            <label>
                                <input type="checkbox" class="ids ace" name="id[]" value="<?php echo ($vo["uid"]); ?>">
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td><a href="javascript:;" class="info" data-name="<?php echo ($vo["name"]); ?>" data-id="<?php echo ($vo["uid"]); ?>"><?php echo ($vo["name"]); ?></a></td>
                        <td><?php if(($vo["gender"]) == "0"): ?>女
                            <?php else: ?>
                            男<?php endif; ?>
                        </td>
                        <td><?php echo (get_sports($vo["sports"],'name')); ?></td>
                        <td><?php echo (get_team($vo["team"])); ?></td>
                        <td><?php echo CC('TECHNICALGRADE',$vo['technicalGrade']);?></td>

                        <td><a href="javascript:;" class="winopen" data-width="800" data-url="<?php echo U('info?method=comInfo&id='.$vo['uid']);?>">参赛信息</a> <a class="winopen" href="javascript:;" data-width="600" data-url="<?php echo U('info?method=physical&id='.$vo['uid']);?>" target="_blank">体能信息</a></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <?php else: ?>
                <td colspan="6" class="text-center"> aOh! 暂时还没有数据! </td><?php endif; ?>
            </tbody>
        </table>
        <!-- 分页 -->
        <div class="page">
            <?php echo ((isset($_page) && ($_page !== ""))?($_page):''); ?>
        </div>
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

    <div id="user_info" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="group_check-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" style="text-align:center"></h4>
                </div>
                <div class="modal-body">
                    <div style="text-align: center">
                        <i class="icon-spinner icon-spin orange bigger-300"></i>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-sm ajax-post " id="print_single">打印</button>
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
    var lock = false;
    $('#print').click(function(){
        var url = "<?php echo U('printData',array('id'=>'PLACEHODLE'));?>";
        var ids = $('.ids:checked');
        var param = '';
        if(ids.length > 0){
            var str = new Array();
            ids.each(function(){
                str.push($(this).val());
            });
            param = str.join(',');
            window.open(url.replace('PLACEHODLE',param));
        }else{
            errorAlert('请选择要操作的数据');
        }
    });

    $("#print_single").click(function(){
        if(lock){
            errorAlert('数据正在加载请稍后');
        }else{
            var url = "<?php echo U('printData',array('type'=>$type,'id'=>'PLACEHODLE'));?>";
            window.open(url.replace('PLACEHODLE',$(this).data('id')));
        }
    });

    $('#adv_show').click(function(){
        var ele = $(this).find('i');
        if($(ele).hasClass('icon-chevron-up')){
            $("#adv_search").slideDown('fast');
            $(ele).removeClass('icon-chevron-up').addClass('icon-chevron-down');
        }else{
            $("#adv_search").slideUp('fast');
            $(ele).removeClass('icon-chevron-down').addClass('icon-chevron-up');
        }
    });
    $('.info').click(function(){
        lock = true;
        $("#user_info .modal-title").empty().html($(this).data('name')+"的详细信息");
        $('#user_info').modal('show');
        var uid = $(this).data('id')
        var url = "<?php echo U('info');?>";
        var wait ='<div style="text-align: center"><i class="icon-spinner icon-spin orange bigger-300"></i></div>'
        $("#user_info .modal-body").empty().html(wait);
        $("#print_single").data('id',uid);
        $.post(url,{'id':uid},function(data){
            lock = false;
            $("#user_info .modal-body").empty().html(data);
        });
    });

    $(function() {
        //回车搜索
        $("#search").keyup(function(e) {
            if (e.keyCode === 13) {
                var url =  "<?php echo U(CONTROLLER_NAME.'/'.ACTION_NAME.'?query_name=PLACEHODLE');?>";
                var query = $('#search').val();
                url = url.replace('PLACEHODLE',query);
                window.location.href = url;
                return false;
            }
        });
    });
    <?php if($where): ?>!function(){
                $("#adv_search").show();
                var ele = $("#adv_show").find('i');
                $(ele).removeClass('icon-chevron-up').addClass('icon-chevron-down');
                <?php if(is_array($where)): $i = 0; $__LIST__ = $where;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>Think.setValue('<?php echo ($key); ?>','<?php echo ($vo); ?>');<?php endforeach; endif; else: echo "" ;endif; ?>
            }();<?php endif; ?>
</script>

</body>
</html>