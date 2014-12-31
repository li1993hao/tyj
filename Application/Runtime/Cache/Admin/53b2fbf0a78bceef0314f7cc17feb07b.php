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

</head>
<body style="background-color: #ffffff">
<?php if(is_array($datas)): $i = 0; $__LIST__ = $datas;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div style="width:500px; margin: 20px auto">
        <ul class="nav nav-tabs padding-16 tab-size-bigger tab-space-1">
            <li class="active"><a href="javascript:;"><?php echo ($data[$header]); ?>的详细信息</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane in active">
            <!-- 表单 -->
            <div class="profile-user-info profile-user-info-striped">
                <?php if(is_array($fields)): $i = 0; $__LIST__ = $fields;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$field): $mod = ($i % 2 );++$i; if($field['is_show'] == 1 || $field['is_show'] == 3): ?><div class="profile-info-row">
                            <?php if($field['type'] == 'picture'): ?><div class="profile-info-name">
                                    <div style="margin-top:50%"><?php echo ($field['title']); ?></div>
                                </div>
                                <?php else: ?>
                                <div class="profile-info-name">
                                    <?php echo ($field['title']); ?>
                                </div><?php endif; ?>
                            <div class="profile-info-value">
                                <?php switch($field["type"]): case "num": echo ($data[$field['name']]); break;?>
                                    <?php case "string": ?><div style="word-wrap: break-word;word-break:break-all;">
                                            <?php echo ($data[$field['name']]); ?>
                                        </div><?php break;?>
                                    <?php case "textarea": ?><div style="word-wrap: break-word;word-break:break-all;">
                                            <?php echo ($data[$field['name']]); ?>
                                        </div><?php break;?>
                                    <?php case "date": echo (date('Y-m-d',$data[$field['name']])); break;?>
                                    <?php case "datetime": echo (date('Y-m-d H:i',$data[$field['name']])); break;?>
                                    <?php case "bool": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if(($data[$field['name']]) == $key): echo ($vo); endif; endforeach; endif; else: echo "" ;endif; break;?>
                                    <?php case "select": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if(($data[$field['name']]) == $key): echo ($vo); endif; endforeach; endif; else: echo "" ;endif; break;?>
                                    <?php case "radio": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if(($data[$field['name']]) == $key): echo ($vo); endif; endforeach; endif; else: echo "" ;endif; break;?>
                                    <?php case "checkbox": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><label class="checkbox">
                                                <?php if(in_array(($key), is_array($data[$field['name']])?$data[$field['name']]:explode(',',$data[$field['name']]))): echo ($vo); endif; ?>
                                            </label><?php endforeach; endif; else: echo "" ;endif; break;?>
                                    <?php case "editor": ?><section> <?php echo (htmlspecialchars_decode($data[$field['name']])); ?>
                                        </section><?php break;?>
                                    <?php case "picture": if(!empty($data[$field['name']])): ?><img style="width:200px;height:200px" src="/tyj<?php echo (get_cover($data[$field['name']],'path')); ?>"/><?php endif; break;?>
                                    <?php case "file": if(isset($data[$field['name']])): ?><div class="upload-pre-file"><i class="icon-paper-clip"></i><span><?php echo (get_table_field($data[$field['name']],'id','name','File')); ?></span>
                                            </div><?php endif; break;?>
                                    <?php case "color": ?><a><span class="btn-colorpicker btn-colorpicker-<?php echo ($field["name"]); ?>"
                                                 style="background-color:<?php echo ($data[$field['name']]); ?>"></span></a><?php break;?>
                                    <?php case "simpleEditor": echo (htmlspecialchars_decode($data[$field['name']])); break;?>
                                    <?php case "place": ?><i class="icon-map-marker light-orange bigger-110"></i>
                                        <span>
                                            <?php echo ($data[$field['name']]); ?>
                                        </span><?php break;?>

                                    <?php default: ?>
                                    <?php echo ($data[$field['name']]); endswitch;?>
                            </div>
                        </div><?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </div>
            </div>
        </div>
    </div><?php endforeach; endif; else: echo "" ;endif; ?>

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



<script type="text/javascript">
    window.print();
</script>
</body>
</html>