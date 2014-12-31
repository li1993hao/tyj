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

<!--=== Content Part ===-->
<div class="container">
<div class="row magazine-page" style="margin-top: 10px">
    <!--Magazine Slider-->
    <div class="col-md-7 carousel-wapper">
        <div class="carousel  slide carousel-v1 margin-bottom-20" id="myCarousel-1">
            <div class="carousel-inner">
                <?php $_result=position(3);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="item <?php if(($i) == "1"): ?>active<?php endif; ?>">
                        <?php if(isset($vo["cover_path"])): ?><a href="<?php echo ($vo["url"]); ?>"><img style="height: 215px;width:100%" alt="<?php echo ($vo["title"]); ?>" src="<?php echo ($vo["cover_path"]); ?>"></a>
                            <?php else: ?>
                            <a href="<?php echo ($vo["url"]); ?>"> <img style="height: 215px;width:100%" alt="<?php echo ($vo["title"]); ?>" src="/tyj/public/static/images/default.jpeg"/></a><?php endif; ?>
                        <div class="carousel-caption">
                            <p><a href="<?php echo ($vo["url"]); ?>" style="color: #ffffff"><?php echo ($vo["title"]); ?></a></p>
                        </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <div class="carousel-arrow">
                <a data-slide="prev" href="#myCarousel-1" class="left carousel-control">
                    <i class="icon-angle-left"></i>
                </a>
                <a data-slide="next" href="#myCarousel-1" class="right carousel-control">
                    <i class="icon-angle-right"></i>
                </a>
            </div>
        </div>

    </div>

    <div class="col-md-5">
        <div class="tab-v1">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab">中心要闻</a></li>
                <li><a href="#profile" data-toggle="tab">赛事快讯</a></li>
                <li><a href="#messages" data-toggle="tab">热点关注</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <div class="row">

                    </div>
                </div>
                <div class="tab-pane" id="profile">

                </div>
                <div class="tab-pane" id="messages">

                </div>
                <div class="tab-pane" id="settings">

                </div>
            </div>
        </div>
    </div>
</div>

<div class="row magazine-page">
<div class="col-md-3">
 
<!-- Photo Stream -->
<div class="headline"><h2>快速通道</h2></div>
<ul class="list-unstyled blog-photos margin-bottom-30">
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/5.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/6.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/8.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/10.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/11.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/1.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/2.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/7.jpg"></a></li>
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
<!-- End Blog Twitter -->
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
<!-- End Quick Links -->
</div>
<!-- Begin Content -->
<div class="col-md-6">
    <div class="margin-bottom-10"></div>
    <div class="tab-v2 tab-v2-red">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#p1" data-toggle="tab">训练动态</a></li>
            <li><a href="#p2" data-toggle="tab">竞赛信息</a></li>
            <li><a href="#p2" data-toggle="tab">运动项目</a></li>
            <li><a href="#p2" data-toggle="tab">赛事安排</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p1">
                <div class="row">

                </div>
            </div>
            <div class="tab-pane" id="p2">

            </div>
        </div>
    </div>
    <hr/>
    <div class="tab-v2 tab-v2-orange">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#p4" data-toggle="tab">中心要闻</a></li>
            <li><a href="#p5" data-toggle="tab">赛事快讯</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p4">
                <div class="row">

                </div>
            </div>
            <div class="tab-pane" id="p5">

            </div>
        </div>
    </div>
    <hr/>
    <div class="tab-v2 tab-v2-yellow">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#p7" data-toggle="tab">规章制度</a></li>
            <li><a href="#p8" data-toggle="tab">机构职能</a></li>
            <li><a href="#p8" data-toggle="tab">职能评估</a></li>
            <li><a href="#p8" data-toggle="tab">网上办事</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p7">
                <div class="row">

                </div>
            </div>
            <div class="tab-pane" id="p8">

            </div>
        </div>
    </div>
    <hr/>
    <div class="tab-v2 tab-v2-blue">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#p11" data-toggle="tab">党的建设</a></li>
            <li><a href="#p12" data-toggle="tab">廉政建设</a></li>
            <li><a href="#p12" data-toggle="tab">群团建设</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p11">
                <div class="row">

                </div>
            </div>
            <div class="tab-pane" id="p12">

            </div>
        </div>
    </div>
    <hr/>
    <div class="tab-v2 tab-v2-sea">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#p11" data-toggle="tab">党务工作</a></li>
            <li><a href="#p12" data-toggle="tab">行政制度</a></li>
            <li><a href="#p12" data-toggle="tab">训练制度</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p13">
                <div class="row">

                </div>
            </div>
            <div class="tab-pane" id="p14">

            </div>
        </div>
    </div>
</div>
<!-- End Content -->

<!-- Begin Sidebar -->
<div class="col-md-3">
    <!-- Photo Stream -->
<div class="headline"><h2>快速通道</h2></div>
<ul class="list-unstyled blog-photos margin-bottom-30">
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/5.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/6.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/8.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/10.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/11.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/1.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/2.jpg"></a></li>
    <li><a href="#"><img class="hover-effect" alt="" src="/tyj/public/vendor/unify/img/sliders/elastislide/7.jpg"></a></li>
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
<!-- End Blog Twitter -->
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
<!-- End Quick Links -->
</div>
<!-- End Sidebar -->
</div>
</div><!--/container-->
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