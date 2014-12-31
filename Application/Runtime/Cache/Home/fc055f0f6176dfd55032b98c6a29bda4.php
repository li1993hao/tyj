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
                    <li><a href="<?php echo U('Admin/Index/index');?>">个人中心</a></li><?php endif; ?>
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
                <?php if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$av): $mod = ($i % 2 );++$i; if($i == count($nav)): ?><li class="active"><?php echo ($av["name"]); ?></li>
                        <?php else: ?>
                        <li><a href="<?php echo ($av["url"]); ?>"><?php echo ($av["name"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <!-- Begin Content -->
            <div class="col-md-9">
                <div class="blog margin-bottom-40">
                    <?php if(info.title_color == '#555' ): ?><h2 class="text-center"><?php echo ($info["title"]); ?></h2>
                    <?php else: ?>
                        <h2 class="text-center" style="color:<?php echo ($info["title_color"]); ?>"><?php echo ($info["title"]); ?></h2><?php endif; ?>
                    <div class="blog-post-tags">
                        <ul class="list-unstyled list-inline">
                            <li><i class="icon-calendar"></i><?php echo (date('Y-m-d H:i',$info["create_time"])); ?></li>
                            <li><i class="icon-pencil"></i><?php echo get_nickname($info['uid']);?></li>
                            <li><i class="icon-eye-open"></i> <a href="#"><?php echo ($info["view"]); ?></a></li>
                        </ul>
                    </div>
                    <hr/>
                    <section><?php echo ($info["content"]); ?></section>
                </div>
            </div>
            <!-- End Content -->


            <div class="col-md-3">
                <div class="headline"><h2>快速通道</h2></div>
<ul class="list-unstyled blog-photos margin-bottom-30">
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/5.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/6.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/8.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/10.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/11.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/1.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/2.jpg"></a>
    </li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/7.jpg"></a>
    </li>
</ul>

<div class="headline"><h2>服务台</h2></div>
<div class="row">
    <ul class="list-unstyled col-xs-6">
        <li><a href="#">Revolution Slider</a></li>
        <li><a href="#">Parralax Page</a></li>
        <li><a href="#">Backgrounds</a></li>
        <li><a href="#">Parralax Slider</a></li>
        <li><a href="#">Responsive</a></li>
        <li><a href="#">Bootstrap 3x</a></li>
    </ul>
    <ul class="list-unstyled col-xs-6">
        <li><a href="#">50+ Valid Pages</a></li>
        <li><a href="#">Layer Slider</a></li>
        <li><a href="#">Bootstrap 2x</a></li>
        <li><a href="#">Fixed Header</a></li>
        <li><a href="#">Best Template</a></li>
        <li><a href="#">And Many More</a></li>
    </ul>
</div>
<div class="headline"><h2>合作单位</h2></div>
<div class="row">
    <ul class="list-unstyled col-xs-6">
        <li><a href="#">Revolution Slider</a></li>
        <li><a href="#">Parralax Page</a></li>
        <li><a href="#">Backgrounds</a></li>
        <li><a href="#">Parralax Slider</a></li>
        <li><a href="#">Responsive</a></li>
        <li><a href="#">Bootstrap 3x</a></li>
    </ul>
    <ul class="list-unstyled col-xs-6">
        <li><a href="#">50+ Valid Pages</a></li>
        <li><a href="#">Layer Slider</a></li>
        <li><a href="#">Bootstrap 2x</a></li>
        <li><a href="#">Fixed Header</a></li>
        <li><a href="#">Best Template</a></li>
        <li><a href="#">And Many More</a></li>
    </ul>
</div>

<div class="headline"><h2>外部链接</h2></div>
<div class="row">
    <ul class="list-unstyled col-xs-6">
        <li><a href="#">Revolution Slider</a></li>
        <li><a href="#">Parralax Page</a></li>
        <li><a href="#">Backgrounds</a></li>
        <li><a href="#">Parralax Slider</a></li>
        <li><a href="#">Responsive</a></li>
        <li><a href="#">Bootstrap 3x</a></li>
    </ul>
    <ul class="list-unstyled col-xs-6">
        <li><a href="#">50+ Valid Pages</a></li>
        <li><a href="#">Layer Slider</a></li>
        <li><a href="#">Bootstrap 2x</a></li>
        <li><a href="#">Fixed Header</a></li>
        <li><a href="#">Best Template</a></li>
        <li><a href="#">And Many More</a></li>
    </ul>
</div>

            </div>
        </div>
    </div>
    <!--/container-->
    <!-- End Content Part -->

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


</body>
</html>