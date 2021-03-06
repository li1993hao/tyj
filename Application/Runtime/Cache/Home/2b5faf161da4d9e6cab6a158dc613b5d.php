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
<meta name="renderer" content="webkit">
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
        #menu a:hover{
            text-decoration:none;
        }
        #menu ul a:hover{
            background-color:#72c02c;
        }
     </style>
</head>
<body>
<!-- 头部 -->
<!--=== Top ===-->
<div class="top">
    <div class="container">
        <ul class="loginbar unstyled pull-right">
            <?php if(is_login()): $__MENU__ = get_user_menu(); ?>
                <li>您好:<?php echo user_field('nickname');?></li>
                <li class="topbar-devider"></li>
                <li id="menu"  class="dropdown" style="padding-bottom:0px">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">
                        <span class="glyphicon glyphicon-align-left" style="font-size: 16px; color:#72c02c"></span>
                    </a>
                    <ul class="pull-right dropdown-menu dropdown-caret dropdown-yellow" style="margin:0px">
                        <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U($menu['module'].'/'.$menu['url']);?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </li>
                <li class="topbar-devider"></li>
                <li><a href="<?php echo U('logout');?>">注销</a></li>
            <?php else: ?>
                <li><a href="<?php echo U('login');?>">登陆</a></li><?php endif; ?>
        </ul>
    </div>
    <hr style="margin: 0;margin-top:5px;"/>
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
                    <section>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>赛事名称</th>
                                <th>阶段</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>比赛地点</th>
                                <th>参赛人数</th>
                                <th>备注</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if(!empty($list)): if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                        <td><?php echo ($vo["name"]); ?></td>
                                        <td><?php echo ((isset($vo["stage"]) && ($vo["stage"] !== ""))?($vo["stage"]):'-'); ?></td>
                                        <td><?php echo (time_format($vo["start_time"],'m-d','待定')); ?></td>
                                        <td><?php echo (time_format($vo["end_time"],'m-d','待定')); ?></td>
                                        <td><?php echo ((isset($vo["place"]) && ($vo["place"] !== ""))?($vo["place"]):'待定'); ?></td>
                                        <td><?php echo ($vo["athlete_num"]); ?></td>
                                        <td><?php echo ($vo["remark"]); ?></td>
                                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                                <?php else: ?>
                                <td colspan="6" class="text-center"> aOh! 暂时还没有内容! </td><?php endif; ?>
                            </tbody>
                        </table>
                    </section>
                </div>
            </div>
            <div class="col-md-3">
                <!--快速通道-->
<div class="headline"><h2><?php echo CC('LINK_GROUP','p-2');?></h2></div>
<ul class="list-unstyled blog-photos margin-bottom-30">
    <?php $_result=get_link('p-2');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($info["url"]); ?>"><img  style="height: 50px;width: 102px" class="hover-effect" alt="<?php echo ($info["name"]); ?>" src="<?php echo ($info["picture"]); ?>"></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<!--服务台-->
<div class="headline"><h2><?php echo CC('LINK_GROUP','a-3');?></h2></div>
<div class="row">
    <ul class="list-unstyled col-xs-6">
        <?php $_result=get_link('a-3',0,3);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($info["url"]); ?>"><?php echo ($info["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <ul class="list-unstyled col-xs-6">
        <?php $_result=get_link('a-3',4,7);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($info["url"]); ?>"><?php echo ($info["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>
<!--外部链接-->
<div class="headline"><h2><?php echo CC('LINK_GROUP','t-1');?></h2></div>
<div class="row">
    <ul class="list-unstyled col-xs-6">
        <?php $_result=get_link('t-1',0,5);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($info["url"]); ?>"><?php echo ($info["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <ul class="list-unstyled col-xs-6">
        <?php $_result=get_link('t-1',6,5);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($info["url"]); ?>"><?php echo ($info["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>

            </div>
        </div>
    </div>
    <!--/container-->
    <!-- End Content Part -->

<!-- /主体 -->

<!-- 底部 -->
<div class="margin-bottom-40"></div>
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
            var url = "<?php echo U('Index/search?search=PLACEHOLDER');?>";
            location.href= url.replace('PLACEHOLDER',text);
        }
    });

    $('a').each(function(){
        var color = $(this).data('color');
        if(color && color!='#555'){
            $(this).css('color',color);
        }
    });
</script>

<!--[if lt IE 9]>
<script src="/tyj/public/vendor/unify/plugins/respond.js"></script>
<![endif]-->


</body>
</html>