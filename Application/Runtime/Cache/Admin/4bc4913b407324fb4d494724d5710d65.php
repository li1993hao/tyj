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
        a:hover{
            text-decoration: none;
        }
    </style>
    

    
</head>
<body class="navbar-fixed">
<div class="shade" style="display:none"></div>
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
                         
    <?php if(ACTION_NAME == 'add'): ?>新增<?php else: ?>编辑<?php endif; ?>模型

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
<div class="tabbable">
    <ul class="nav nav-tabs padding-16 tab-size-bigger tab-space-1">
        <li class="active"><a data-toggle="tab"  href="#tab1">基 础</a></li>
        <li ><a data-toggle="tab"  href="#tab2">设 计</a></li>
        <li ><a data-toggle="tab"  href="#tab3">高 级</a></li>
    </ul>
    <form  action="<?php echo U('update');?>"  class="form-horizontal">
    <div class="tab-content no-border padding-24">
            <div id="tab1" class="tab-pane in active">
                <div class="form-group">
                    <label class="item-label">父模型<span class="check-tips"><?php echo (get_model_by_id($info["pid"])); ?></span></label>
                </div>
                <div class="form-group">
                    <label class="item-label">模型标识<span class="check-tips">（请输入文档模型标识）</span></label>
                    <div class="controls">
                        <input type="text" class="text " name="name" value="<?php echo ($info["name"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">模型名称<span class="check-tips">（请输入模型的名称）</span></label>
                    <div class="controls">
                        <input type="text" class="text " name="title" value="<?php echo ($info["title"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">模型组别<span class="check-tips">（模型组别）</span></label>
                    <div class="controls">
                        <select name="type">
                            <?php if(is_array($types)): $i = 0; $__LIST__ = $types;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$t): $mod = ($i % 2 );++$i; if($key == $info['type']): ?><option value="<?php echo ($key); ?>" selected><?php echo ($t); ?></option>
                                    <?php else: ?>
                                    <option value="<?php echo ($key); ?>"><?php echo ($t); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div id="tab2" class="tab-pane">
                <div class="form-group">
                        <div>
                            <label class="item-label">字段管理<span class="check-tips">(有字段才会创建数据表)</span></label>
                        </div>
                        <div class="widget-box col-xs-3">
                            <div class="widget-header widget-header-flat">
                                <h5>字段列表</h5>
                                <div class="widget-toolbar">
                                    <a href="<?php echo U('Attribute/add?model_id='.$info['id']);?>" target="_balnk">新增</a>
                                    <a href="<?php echo U('Attribute/index?model_id='.$info['id']);?>" target="_balnk">管理</a>
                                </div>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main form_field_sort">
                                    <ul>
                                        <?php if(is_array($fields)): foreach($fields as $k=>$field): ?><li >
                                                <label>
                                                    <span ><?php echo ($field['title']); ?> [<?php echo ($field['name']); ?>]</span>
                                                </label>
                                            </li><?php endforeach; endif; ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="form-group">
                    <label class="item-label">字段别名定义<span class="check-tips">（用于表单显示的名称）</span></label>
                    <div class="controls">
                        <label class="textarea input-large">
                            <textarea name="attribute_alias"><?php echo ($info["attribute_alias"]); ?></textarea>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">表单显示分组<span class="check-tips">（用于表单显示的分组，以及设置该模型表单排序的显示）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-large" name="field_group" value="<?php echo ($info["field_group"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <label class="item-label">表单显示排序<span class="check-tips">（直接拖动进行排序）</span></label>
                    </div>
                    <?php $_result=parse_field_attr($info['field_group']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="widget-box col-xs-3">
                            <div class="widget-header widget-header-flat">
                                <h5><?php echo ($vo); ?></h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main  form_field_sort">
                                    <ul class="dragsort needdragsort" data-group="<?php echo ($key); ?>">
                                        <?php if(is_array($fields)): foreach($fields as $k=>$field): if((($field['group'] == $key) or($i == 1 and !isset($field['group']))) and ($field['is_show'] != 0)): ?><li class="getSort">
                                                    <em data="<?php echo ($field['id']); ?>"><?php echo ($field['title']); ?> [<?php echo ($field['name']); ?>]</em>
                                                    <input type="hidden" name="field_sort[<?php echo ($key); ?>][]" value="<?php echo ($field['id']); ?>"/>
                                                </li><?php endif; endforeach; endif; ?>
                                    </ul>
                                </div>
                            </div>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>

                <div class="form-group">
                    <label class="item-label">列表定义<span class="check-tips">（默认列表模板的展示规则）</span></label>
                    <div class="controls">
                        <label class="textarea input-large">
                            <textarea name="list_grid"><?php echo ($info["list_grid"]); ?></textarea>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="item-label">默认搜索字段<span class="check-tips">（默认列表模板的默认搜索项）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-large" name="search_key" value="<?php echo ($info["search_key"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">高级搜索字段<span class="check-tips">（默认列表模板的高级搜索项）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-large" name="search_list" value="<?php echo ($info["search_list"]); ?>">
                    </div>
                </div>
            </div>
            <div id="tab3"  class="tab-pane">
                <div class="form-group">
                    <label class="item-label">列表模板<span class="check-tips">（自定义的列表模板，放在对应控制器view文件夹的下面，不写则使用默认模板）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-large" name="template_list" value="<?php echo ($info["template_list"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">新增模板<span class="check-tips">（自定义的新增模板，放在对应控制器view文件夹的下面，不写则使用默认模板）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-large" name="template_add" value="<?php echo ($info["template_add"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">编辑模板<span class="check-tips">（自定义的编辑模板，放在对应控制器view文件夹的下面，不写则使用默认模板）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-large" name="template_edit" value="<?php echo ($info["template_edit"]); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="item-label">列表数据大小<span class="check-tips">（默认列表模板的分页属性）</span></label>
                    <div class="controls">
                        <input type="text" class="text input-small" name="list_row" value="<?php echo ($info["list_row"]); ?>">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="item-label"></label>
                <div class="controls">
                    <input type="hidden" name="id" value="<?php echo ($info['id']); ?>"/>
                    <button class="btn btn-sm btn-primary ajax-post no-refresh" type="submit" target-form="form-horizontal">确 定</button>
                    <button class="btn btn-sm" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
    </div>
    </form>
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
            "APP"    : "/tyj/index.php?s=", //当前项目地址
            "PUBLIC" : "/tyj/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
        $('[data-rel=tooltip]').tooltip();
    })();
</script>
<script type="text/javascript" src="/tyj/Public/static/think.js"></script>
<script type="text/javascript" src="/tyj/Public/static/js/common.js"></script>




<script type="text/javascript" src="/tyj/Public/vendor/jquery.dragsort-0.5.2.min.js"></script>
<script type="text/javascript" charset="utf-8">
//拖曳插件初始化
$(function(){
	$(".needdragsort").dragsort({
	     dragSelector:'li',
	     placeHolderTemplate: '<li class="draging-place">&nbsp;</li>',
	     dragBetween:true,	//允许拖动到任意地方
	     dragEnd:function(){
	    	 var self = $(this);
	    	 self.find('input').attr('name', 'field_sort[' + self.closest('ul').data('group') + '][]');
	     }
	 });
})
</script>

</body>
</html>