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
                <li class="active"><a href="#home" data-toggle="tab"><?php echo cat_field(50,'name');?></a></li>
                <li><a href="#profile" data-toggle="tab"><?php echo cat_field(54,'name');?></a></li>
                <li><a href="#messages" data-toggle="tab">热点关注</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="home">
                        <ul class="list-unstyled">
                            <?php $_result=lists(50,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?></a>
                                   <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                               </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                </div>
                <div class="tab-pane" id="profile">
                    <ul class="list-unstyled">
                    <?php $_result=lists(54,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                     </ul>
                </div>
                <div class="tab-pane" id="messages">
                    <ul class="list-unstyled">
                    <?php $_result=api('Document/hot_list');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"> <?php echo (msubstr($info['title'],0,20)); ?></a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                     </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row magazine-page">
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
<!-- Begin Content -->
<div class="col-md-6">
    <div class="margin-bottom-10"></div>
    <div class="tab-v2 tab-v2-red">
        <ul class="nav nav-tabs">
            <!--赛事安排-->
            <li  class="active"><a href="#p2" data-toggle="tab"><?php echo cat_field(52,'name');?></a></li>
            <!--训练动态-->
            <li><a href="#p1" data-toggle="tab"><?php echo cat_field(53,'name');?></a></li>
            <!--运动项目-->
            <li><a href="#p3" data-toggle="tab"><?php echo cat_field(55,'name');?></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p2">
                <ul class="list-unstyled">
                    <?php $_result=lists(52,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,30)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane " id="p1">
                <ul class="list-unstyled">
                    <?php $_result=lists(53,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,30)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane" id="p3">
                <ul class="list-unstyled">
                    <?php $_result=lists(55,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,30)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    </div>
    <hr/>
    <div class="tab-v2 tab-v2-yellow">
        <ul class="nav nav-tabs">
            <!--机构职能-->
            <li class="active"><a href="#p8" data-toggle="tab"><?php echo cat_field(58,'name');?></a></li>
            <!--职能评估-->
            <li><a href="#p9" data-toggle="tab"><?php echo cat_field(60,'name');?></a></li>
            <!--网上办事-->
            <li><a href="#p10" data-toggle="tab"><?php echo cat_field(61,'name');?></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p8">
                <ul class="list-unstyled">
                    <?php $_result=lists(58,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane" id="p9">
                <ul class="list-unstyled">
                    <?php $_result=lists(60,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane" id="p10">
                <ul class="list-unstyled">
                    <?php $_result=lists(61,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    </div>
    <hr/>
    <div class="tab-v2 tab-v2-blue">
        <ul class="nav nav-tabs">
            <!--党的建设-->
            <li class="active"><a href="#p11" data-toggle="tab"><?php echo cat_field(83,'name');?></a></li>
            <!--廉政建设-->
            <li><a href="#p12" data-toggle="tab"><?php echo cat_field(84,'name');?></a></li>
            <!--党员活动-->
            <li><a href="#p13" data-toggle="tab"><?php echo cat_field(69,'name');?></a></li>
            <!--学习园地-->
            <li><a href="#p14" data-toggle="tab"><?php echo cat_field(71,'name');?></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="p11">
                <ul class="list-unstyled">
                    <?php $_result=lists(83,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane" id="p12">
                <ul class="list-unstyled">
                    <?php $_result=lists(84,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane" id="p13">
                <ul class="list-unstyled">
                    <?php $_result=lists(69,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="tab-pane" id="p14">
                <ul class="list-unstyled">
                    <?php $_result=lists(71,'0,6');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?>
                        </a>
                            <div class="pull-right"><?php echo (date('Y-m-d',$info["create_time"])); ?></div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    </div>

</div>
<!-- End Content -->

<!-- Begin Sidebar -->
<div class="col-md-3">
    <!--合作单位-->
<div class="headline"><h2><?php echo CC('LINK_GROUP','p-3');?></h2></div>
<ul class="list-unstyled blog-photos margin-bottom-30">
    <?php $_result=get_link('p-3');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($info["url"]); ?>"><img  style="height: 50px;width: 102px" class="hover-effect" alt="<?php echo ($info["name"]); ?>" src="<?php echo ($info["picture"]); ?>"></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<!--网上办事-->
<div class="headline"><h2><?php echo cat_field(61,'name');?></h2></div>
<div class="row">
    <ul class="list-unstyled col-xs-12">
        <?php $_result=lists(61,'0,10');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$info): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($info['url']); ?>" data-color="<?php echo ($info["list_color"]); ?>"><?php echo (msubstr($info['title'],0,20)); ?></a>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>




</div>
<!-- End Sidebar -->
</div>
</div><!--/container-->
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