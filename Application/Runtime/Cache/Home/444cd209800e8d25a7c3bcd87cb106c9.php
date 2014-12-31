<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>天津市训竞网络服务管理平台</title>

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS Global Compulsory-->
<link rel="stylesheet" href="/tyj/public/vendor/unify/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/tyj/public/vendor/unify/css/style.css">
<link rel="stylesheet" href="/tyj/public/vendor/unify/css/headers/header1.css">
<link rel="stylesheet" href="/tyj/public/vendor/unify/css/responsive.css">
<!--<link rel="shortcut icon" href="favicon.ico">        -->
<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="/tyj/public/vendor/unify/plugins/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/tyj/public/vendor/unify/plugins/flexslider/flexslider.css">
<link rel="stylesheet" href="/tyj/public/vendor/unify/plugins/parallax-slider/css/parallax-slider.css">
<!-- CSS Theme -->
<link rel="stylesheet" href="/tyj/public/vendor/unify/css/themes/default.css" id="style_color">
<link rel="stylesheet" href="/tyj/public/vendor/unify/css/plugins.css" >
<link rel="stylesheet" href="/tyj/Public/static/css/am.min.css" />
    
    <link rel="stylesheet" href="/tyj/Public/static/css/person.css" >

    <style>
        /*扩展*/
        div.tab-red li.active a{
            border-top: solid 2px #e74c3c;
        }
        div.tab-yellow li.active a{
            border-top: solid 2px #f1c40f;
        }
        div.panel-orange li.active a{
            border-top: solid 2px #e67e22;
        }

        div.tab-blue li.active a{
            border-top: solid 2px #3498db;
        }
     </style>
</head>
<body>
<!-- 头部 -->
<!--=== Top ===-->
<div class="top">
    <div class="container">
        <ul class="loginbar unstyled pull-right">
            <?php if(is_login()): if(user_field('type') == 0): ?><li><a href="<?php echo U('Admin/Index/index');?>">您好:<?php echo user_field('nickname');?></a></li>
                    <li class="topbar-devider"></li>
                    <li><a href="<?php echo U('Admin/Index/index');?>" target="_blank">后台管理</a></li>
                <?php else: ?>
                    <li><a href="<?php echo U('Person/index');?>">您好:<?php echo user_field('nickname');?></a></li>
                    <li class="topbar-devider"></li>
                    <li><a href="<?php echo U('Person/index');?>">个人中心</a></li><?php endif; ?>
                <li class="topbar-devider"></li>
                <li><a href="<?php echo U('logout');?>">注销</a></li>
            <?php else: ?>
                <li><a href="<?php echo U('login');?>">登陆</a></li><?php endif; ?>
        </ul>
    </div>
</div><!--/top-->
<!--=== End Top ===-->

<!--=== Header ===-->
<div class="header">
    <div class="navbar navbar-default equinav" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-responsive-collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="dropdown <?php echo ($index_style); ?>">
                        <a href="<?php echo U('index/index');?>">
                            首页
                        </a>
                    </li>
                    <?php $_result=cat('',false,$root_nav);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cat): $mod = ($i % 2 );++$i; if($cat['has_child'] != 0): ?><li class="dropdown <?php echo ($cat["class"]); ?>">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">
                                    <?php echo ($cat['name']); ?>
                                    <i class="icon-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <?php $_result=cat($cat['id'],true);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cat_child): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($cat_child['url']); ?>"><?php echo ($cat_child['name']); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                                </ul>
                            </li>
                        <?php else: ?>
                            <li class="<?php echo ($cat["class"]); ?>">
                                <a href="<?php echo ($cat['url']); ?>">
                                    <?php echo ($cat['name']); ?>
                                </a>
                            </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    <li class="hidden-sm"><a class="search"><i class="search-btn icon-search"></i></a></li>
               </ul>
                <div class="search-open" style="display: none;">
                    <div class="input-group">
                            <input type="text" id="search_text" name="search" required class="form-control" placeholder="搜索">
                            <span class="input-group-btn">
                            <button class="btn-u" id="search_btn" type="button">确定</button>
                             </span>
                    </div><!-- /input-group -->
                </div>
            </div>
        </div>
    </div>
</div><!--/header-->



<!-- /头部 -->

<!-- 主体 -->

    <div class="breadcrumbs">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li class="active">个人中心</li>
            </ul>
        </div>
    </div>
<div class="row">
<div class="container" id="main">
<div class="col-md-3" id="sidebar-nav">
    <ul class="list-group sidebar-nav-v1" >
        <!-- Typography -->
        <li class="list-group-item list-toggle">
            <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-buttons" class="">个人资料</a>
            <ul id="collapse-buttons" class="collapse">
                <li><a href="feature_btn_general.html">基本资料</a></li>
                <li>
                    <a href="feature_btn_brands.html">竞赛成绩</a>
                </li>
                <li>
                    <a href="feature_btn_effects.html">伤病信息</a>
                </li>
            </ul>
        </li>
        <li class="list-group-item list-toggle">
            <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-plan" class="">训练计划</a>
            <ul id="collapse-plan" class="collapse">
                <li><a href="feature_btn_general.html">日计划</a></li>
                <li>
                    <a href="feature_btn_brands.html">周计划</a>
                </li>
                <li>
                    <a href="feature_btn_effects.html">月计划</a>
                </li>
            </ul>
        </li>
        <li class="list-group-item list-toggle">
            <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-worklog" class="">工作日志</a>
            <ul id="collapse-worklog" class="collapse">
                <li><a href="feature_btn_general.html">写日志</a></li>
                <li>
                    <a href="feature_btn_brands.html">日志管理</a>
                </li>
            </ul>
        </li>
    </ul>
</div>
<!-- End Sidebar Menu -->

<!-- Begin Content -->
<div class="col-md-9" id="person-content">
    <div class="tag-box tag-box-v3">
        <div class="heading heading-v4">
            <h2>3 Single Line Deviders</h2>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it.</p>
        </div>

        <hr class="devider devider-dotted">

        <p><span class="dropcap dropcap-bg bg-color-dark">A</span>t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use.</p>

        <hr class="devider devider-dashed">

        <p><span class="dropcap dropcap-bg rounded bg-color-dark">B</span>t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use.</p>

        <hr>

        <p><span class="dropcap dropcap-bg rounded-2x bg-color-dark">C</span>t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use.</p>
    </div>
</div>
<!-- End Content -->
</div>
</div>

<!-- /主体 -->

<!-- 底部 -->

<!--=== Copyright ===-->
<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="copyright-space">
                    2014 &copy; 天津时代科技. ALL Rights Reserved.
                </p>
            </div>
        </div><!--/row-->
    </div><!--/container-->
</div><!--/copyright-->
<!--=== End Copyright ===-->


<!-- JS Global Compulsory -->
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/hover-dropdown.min.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/back-to-top.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/plugins/parallax-slider/js/jquery.cslider.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/tyj/public/vendor/unify/js/app.js"></script>
<script type="text/javascript" src="/tyj/public/vendor/unify/js/pages/index.js"></script>
<script type="text/javascript" src="/tyj/Public/static/js/common.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initSliders();
        Index.initParallaxSlider();
    });

    $('.carousel').carousel({
        interval: 4000 // in milliseconds
    });

    $("#search_text").keyup(function(e) {
        if (e.keyCode === 13) {
            $('#search_btn').click();
        }
    });

    $('#search_btn').click(function(){
        var text = $("#search_text").val();
        text = text.trim();
        if(!text){
            shake($('#search_text').parent());
            $('#search_text').prop('placeholder','写点什么吧..');
        }else{
            var url = "<?php echo U('Index/search');?>";
            location.href= url+"?search="+text;
        }
    });
</script>

<!--[if lt IE 9]>
<script src="/tyj/public/vendor/unify/plugins/respond.js"></script>
<![endif]-->

    <script type="text/javascript">
        !function(){
            var $window = $(window);
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 150);
            }).resize();
        }();
    </script>

</body>
</html>