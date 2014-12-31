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
        .error_tip{
            color: red;
        }
    </style>

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
    <div class="container" id="main">
        <div class="row">
            <div class="margin-bottom-40"></div>
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <form id="login_form" action="post">
                    <h4 class="error_tip text-center"></h4>
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="icon-user"></i></span>
                        <input type="text" name="username" placeholder="用户名" class="form-control">
                    </div>
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="icon-lock"></i></span>
                        <input type="password" name="password" placeholder="密码" class="form-control">
                    </div>
                    <div class="input-group margin-bottom-20" >
                        <input type="text" placeholder="验证码" name="verify" maxlength="4" class="form-control">
                         <span class="input-group-addon" style="padding:0"><img alt="验证码" id="captcha-img" title="点击更新" src="/tyj/Admin/Public/verify.html">
                        </span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="checkbox"><input name="remember" type="checkbox">记住我</label>
                        </div>
                        <div class="col-md-6">
                            <a class="btn-u pull-right" id="login_btn">登陆</a>
                        </div>
                    </div>
                    <hr>
                </form>
            </div>
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

<script  type="text/javascript">
    var captcha_url = "<?php echo U('verify');?>";
    $("#captcha-img").attr("src", captcha_url);
    //更换验证码
    $("#captcha-img").click(function () {
        $(this).attr("src", captcha_url);
    });
    $("#login_btn").click(function(){
        if(checkForm($("input[name='username']"),'用户名') &&
           checkForm($("input[name='password']"),'密码')&&
           checkForm($("input[name='verify']"),'验证码')){
            $.post("<?php echo U('login');?>", $("#login_form").serialize(),function(data){
                if(data.status){
                    location.href="<?php echo U('index');?>";
                }else{
                    $(".error_tip").empty().text(data.msg);
                    $("#captcha-img").click();
                    shake('.error_tip');
                }
            },'json');
        }
    });

    function  checkForm(ele,text){
        if($(ele).val() === ''){
            shake($(ele).parent());
            $(".error_tip").empty().text(text+'不能为空!');
            $(ele).focus();
            return false;
        }else{
            return true;
        }
    }

    $("input[name=verify]").keyup(function(e) {
        if (e.keyCode === 13) {
            $("#login_btn").click();
            return false;
        }
    });

    !function(){
        var $window = $(window);
        $window.resize(function(){
            $("#main").css("min-height", $window.height() - 210);
        }).resize();
    }();
</script>

</body>
</html>