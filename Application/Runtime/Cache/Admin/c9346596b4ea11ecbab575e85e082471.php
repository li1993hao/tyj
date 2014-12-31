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
                         
    <?php echo ($meta_title); ?>

                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        
    <script type="text/javascript" src="/tyj/Public/vendor/uploadify/jquery.uploadify.min.js"></script>
    <!-- 标签页导航 -->
    <form  action="<?php echo U('edit');?>" method="post" class="form-horizontal normal-form">
        <input name="category_id" type="hidden" value="<?php echo ($category_id); ?>"/>
        <!-- 标签页导航 -->
<div class="tabbable">
    <ul class="nav nav-tabs padding-16 tab-size-bigger tab-space-1">
        <?php $_result=parse_config_attr($model['field_group']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?><li <?php if(($key) == "1"): ?>class="active"<?php endif; ?>><a data-toggle="tab" href="#tab<?php echo ($key); ?>"><?php echo ($group); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <div class="tab-content no-border padding-24">
        <!-- 表单 -->
        <!-- 基础文档模型 -->
        <?php $_result=parse_config_attr($model['field_group']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?><div id="tab<?php echo ($key); ?>" class="tab-pane <?php if(($key) == "1"): ?>in active<?php endif; ?> tab<?php echo ($key); ?>">
            <?php if(is_array($fields[$key])): $i = 0; $__LIST__ = $fields[$key];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$field): $mod = ($i % 2 );++$i; if($field['is_show'] == 1 || $field['is_show'] == 3): ?><div class="form-group">
                        <label class="item-label"><?php echo ($field['title']); ?>:<span class="check-tips"><?php if(!empty($field['remark'])): ?>（<?php echo ($field['remark']); ?>）<?php endif; ?></span></label>

                        <div class="controls">
                            <?php switch($field["type"]): case "num": ?><input type="text" class="text input-mid" name="<?php echo ($field["name"]); ?>"
                                           value="<?php echo ($data[$field['name']]); ?>"><?php break;?>
                                <?php case "string": ?><input type="text" class="text input-large" name="<?php echo ($field["name"]); ?>"
                                           value="<?php echo ($data[$field['name']]); ?>"><?php break;?>
                                <?php case "textarea": ?><label class="textarea input-large">
                                        <textarea name="<?php echo ($field["name"]); ?>"><?php echo ($data[$field['name']]); ?></textarea>
                                    </label><?php break;?>
                                <?php case "date": ?><input type="text" name="<?php echo ($field["name"]); ?>" class="text input-mid date"
                                           value="<?php echo (date('Y-m-d',$data[$field['name']])); ?>"
                                           placeholder="请选择日期"/><?php break;?>
                                <?php case "datetime": ?><input type="text" name="<?php echo ($field["name"]); ?>" class="text input-mid time"
                                           value="<?php echo (date('Y-m-d H:i',$data[$field['name']])); ?>"
                                           placeholder="请选择时间"/><?php break;?>
                                <?php case "bool": ?><select name="<?php echo ($field["name"]); ?>">
                                        <?php $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>"
                                            <?php if(($data[$field['name']]) == $key): ?>selected<?php endif; ?>
                                            ><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select><?php break;?>
                                <?php case "select": ?><select name="<?php echo ($field["name"]); ?>">
                                        <?php $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>"
                                            <?php if(($data[$field['name']]) == $key): ?>selected<?php endif; ?>
                                            ><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select><?php break;?>
                                <?php case "radio": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><label class="radio">
                                            <input type="radio" class="ace" value="<?php echo ($key); ?>" name="<?php echo ($field["name"]); ?>"
                                            <?php if(($data[$field['name']]) == $key): ?>checked="checked"<?php endif; ?>
                                            ><?php echo ($vo); ?>
                                        </label><?php endforeach; endif; else: echo "" ;endif; break;?>
                                <?php case "checkbox": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><label class="checkbox">
                                            <input type="checkbox" value="<?php echo ($key); ?>" class="ace"
                                                   name="<?php echo ($field["name"]); ?>[]"
                                            <?php if(in_array(($key), is_array($data[$field['name']])?$data[$field['name']]:explode(',',$data[$field['name']]))): ?>checked="checked"<?php endif; ?>
                                            >
                                            <span class="lbl"><?php echo ($vo); ?></span>
                                        </label><?php endforeach; endif; else: echo "" ;endif; break;?>
                                <?php case "editor": ?><div class="controls">
                                        <script id="<?php echo ($field["name"]); ?>" name="<?php echo ($field["name"]); ?>" type="text/plain">
                                                      <?php echo (htmlspecialchars_decode($data[$field['name']])); ?>
                                        </script>
                                    </div>
                                    <script>
                                        $(function(){
                                            !function(){
                                                var ue = UE.getEditor('<?php echo ($field["name"]); ?>',{
                                                    serverUrl :"<?php echo U('File/ueditor');?>"
                                                });
                                            }();
                                        })
                                    </script><?php break;?>
                                <?php case "picture": ?><div class="controls">
                                        <div class="upload-img-box">
                                            <?php if(!empty($data[$field['name']])): ?><div class="upload-pre-item"><img
                                                        src="/tyj<?php echo (get_cover($data[$field['name']],'path')); ?>"/></div><?php endif; ?>
                                        </div>
                                        <input type="file" id="upload_picture_<?php echo ($field["name"]); ?>">
                                        <input type="hidden" name="<?php echo ($field["name"]); ?>" id="cover_id_<?php echo ($field["name"]); ?>"
                                               value="<?php echo ($data[$field['name']]); ?>"/>
                                    </div>
                                    <script type="text/javascript">
                                        //上传图片
                                        /* 初始化上传插件 */
                                        $("#upload_picture_<?php echo ($field["name"]); ?>").uploadify({
                                            "height": 30,
                                            "swf": "/tyj/Public/vendor/uploadify/uploadify.swf",
                                            "fileObjName": "download",
                                            "buttonText": "上传图片",
                                            "uploader": "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
                                            "width": 120,
                                            'removeTimeout': 1,
                                            'fileTypeExts': '*.jpg; *.png; *.gif;',
                                            "onUploadSuccess": uploadPicture<?php echo ($field["name"]); ?>,
                                        'onFallback':function () {
                                            alert('未检测到兼容版本的Flash.');}}
                                        );
                                        function uploadPicture<?php echo ($field["name"]); ?>(file, data){
                                            var data = $.parseJSON(data);
                                            var src = '';
                                            if (data.status) {
                                                $("#cover_id_<?php echo ($field["name"]); ?>").val(data.id);
                                                src = data.url || '/tyj' + data.path;
                                                $("#cover_id_<?php echo ($field["name"]); ?>").parent().find('.upload-img-box').html(
                                                        '<div class="upload-pre-item"><img width="200"  height="200" src="' + src + '"/></div>'
                                                );
                                            } else {
                                                errorAlert(data.msg);
                                            }
                                        }
                                    </script><?php break;?>
                                <?php case "file": ?><div class="controls">
                                        <input type="file" id="upload_file_<?php echo ($field["name"]); ?>">
                                        <input type="hidden" name="<?php echo ($field["name"]); ?>"
                                               value="<?php echo ($data[$field['name']]); ?>"/>

                                        <div class="upload-img-box">

                                            <?php if(isset($data[$field['name']])): ?><div class="upload-pre-file"><i class="icon-paper-clip"></i><span><?php echo (get_table_field($data[$field['name']],'id','name','File')); ?></span>
                                                </div><?php endif; ?>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        //上传文件
                                        /* 初始化上传插件 */
                                        $("#upload_file_<?php echo ($field["name"]); ?>").uploadify({
                                            "height": 30,
                                            "swf": "/tyj/Public/vendor/uploadify/uploadify.swf",
                                            "fileObjName": "download",
                                            "buttonText": "上传附件",
                                            "uploader": "<?php echo U('File/upload',array('session_id'=>session_id()));?>",
                                            "width": 120,
                                            'removeTimeout': 1,
                                            "onUploadSuccess": uploadFile<?php echo ($field["name"]); ?>,
                                        'onFallback':function () {
                                            alert('未检测到兼容版本的Flash.');}});
                                        function uploadFile<?php echo ($field["name"]); ?>(file, data){
                                            var data = $.parseJSON(data);
                                            if(data.status){
                                                var name = "<?php echo ($field["name"]); ?>";
                                                $("input[name="+name+"]").val(data.data);
                                                $("input[name="+name+"]").parent().find('.upload-box').html(
                                                        "<div class=\"upload-pre-file\"><i class=\"icon-paper-clip\"><span>" + data.msg + "</span></div>"
                                                );
                                            } else {
                                                errorAlert(data.msg);
                                            }
                                        }
                                    </script><?php break;?>
                                <?php case "color": ?><select id="colorpicker-<?php echo ($field["name"]); ?>" name="<?php echo ($field["name"]); ?>" class="hide" style="display: none;">
                                        <?php if(is_array(C("SYSTEM_COLOR"))): $i = 0; $__LIST__ = C("SYSTEM_COLOR");if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cc): $mod = ($i % 2 );++$i;?><option value="<?php echo ($cc); ?>" <?php if(($data[$field['name']]) == $cc): ?>checked="checked"<?php endif; ?>><?php echo ($cc); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>

                                    <div class="dropdown dropdown-colorpicker open">
                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><span
                                                class="btn-colorpicker btn-colorpicker-<?php echo ($field["name"]); ?>" style="background-color:<?php echo ($data[$field['name']]); ?>"></span></a>
                                        <ul class="dropdown-menu dropdown-caret">
                                            <?php if(is_array(C("SYSTEM_COLOR"))): $i = 0; $__LIST__ = C("SYSTEM_COLOR");if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cc): $mod = ($i % 2 );++$i;?><li><a class="colorpick-btn colorpick-btn-<?php echo ($field["name"]); ?>"  href="javascript:;" style="background-color:<?php echo ($cc); ?>;"
                                                    <?php if(($data[$field['name']]) == $cc): ?>checked="checked"<?php endif; ?>
                                                       data-color="<?php echo ($cc); ?>"></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </ul>
                                    </div>
                                    <script type="text/javascript">
                                        $(function(){
                                            $('#simple-colorpicker-<?php echo ($field["name"]); ?>').ace_colorpicker();
                                            !function(){
                                                $('.colorpick-btn-<?php echo ($field["name"]); ?>').click(function(){
                                                    var color = $(this).data('color');
                                                    $('.colorpick-btn-<?php echo ($field["name"]); ?>').removeClass('selected');
                                                    $(this).addClass('selected');
                                                    $('#colorpicker-<?php echo ($field["name"]); ?>').val(color);
                                                    $('.btn-colorpicker-<?php echo ($field["name"]); ?>').css('background-color',color);
                                                });
                                            }();
                                        });
                                    </script><?php break;?>
                                <?php case "simpleEditor": ?><div class="widget-box">
                                        <div class="widget-header widget-header-small  header-color-blue">
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-body-inner" style="display: block;">
                                                <div class="widget-main">
                                                    <div class="wysiwyg-editor" data-name="<?php echo ($field["name"]); ?>"  id="editor-<?php echo ($field["name"]); ?>" contenteditable="true">
                                                        <?php echo (htmlspecialchars_decode($data[$field['name']])); ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        $(function(){
                                            $('#editor-<?php echo ($field["name"]); ?>').css({'height':'200px'}).ace_wysiwyg({
                                                toolbar_place: function(toolbar) {
                                                    return $(this).closest('.widget-box').find('.widget-header').prepend(toolbar).children(0).addClass('inline');
                                                },
                                                toolbar:
                                                        [
                                                            'bold',
                                                            'strikethrough',
                                                            null,
                                                            'insertunorderedlist',
                                                            'insertorderedlist',
                                                            null,
                                                            'justifyleft',
                                                            'justifycenter',
                                                            'justifyright'
                                                        ],
                                                speech_button:false
                                            });
                                        });
                                    </script><?php break;?>
                                <?php case "place": ?><div id="city_china_val" data-name="<?php echo ($field["name"]); ?>" class="city_field">
                                        <select class="province cxselect" data-value="<?php echo (str2arr($data[$field['name']],',',0)); ?>" data-first-title="选择省"></select>
                                        <select class="city cxselect"  data-value="<?php echo (str2arr($data[$field['name']],',',1)); ?>" data-first-title="选择市" ></select>
                                        <select class="area cxselect" data-value="<?php echo (str2arr($data[$field['name']],',',2)); ?>"  data-first-title="选择地区" ></select>
                                    </div>
                                    <script type="text/javascript">
                                        $(function(){
                                            $.cxSelect.defaults.url = '/tyj/Public/static/cityData.min.json';
                                            $('#city_china').cxSelect({
                                                selects: ['province', 'city', 'area']
                                            });

                                            $('#city_china_val').cxSelect({
                                                selects: ['province', 'city', 'area'],
                                                nodata: 'none'
                                            });
                                        });
                                    </script><?php break;?>

                                <?php default: ?>
                                <input type="text" class="text " name="<?php echo ($field["name"]); ?>"
                                       value="<?php echo ($data[$field['name']]); ?>"><?php endswitch;?>
                        </div>
                    </div><?php endif; endforeach; endif; else: echo "" ;endif; ?>
    </div><?php endforeach; endif; else: echo "" ;endif; ?>
    <div class="form-group">
        <input type="hidden" name="id" value="<?php echo ($data["id"]); ?>">
        <button class="btn btn-sm btn-primary ajax-post" type="submit"  target-form="form-horizontal">确 定</button>
        <a class="btn btn-sm" onclick="javascript:history.back(-1);return false;">返 回</a>
    </div>
</div>
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




    <link href="/tyj/Public/vendor/datetimepicker/css/datetimepicker_blue.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/tyj/Public/vendor/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="/tyj/Public/vendor/ueditor/ueditor.config.js" ></script>
<script type="text/javascript" src="/tyj/Public/vendor/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/tyj/Public/vendor/jquery.cxselect.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.date').datetimepicker({
            format: 'yyyy-mm-dd',
            language:"zh-CN",
            minView:2,
            autoclose:true
        });
        $('.time').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            language:"zh-CN",
            minView:2,
            autoclose:true
        });
    });
</script>

</body>
</html>