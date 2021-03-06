<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8" />
<title>体育局训竞管理服务平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="/tyj/Public/vender/ace/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/font-awesome.min.css" />

<!--[if IE 7]>
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/jquery.gritter.css" />
<!-- fonts -->

<!-- ace styles -->

<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace.min.css" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace-rtl.min.css" />
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace-skins.min.css" />

<link rel="stylesheet" href="/tyj/Public/static/css/comm.css" />
<!--[if lte IE 8]>
<link rel="stylesheet" href="/tyj/Public/vender/ace/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="/tyj/Public/vender/ace/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="/tyj/Public/vender/ace/js/html5shiv.js"></script>
<script src="/tyj/Public/vender/ace/js/respond.min.js"></script>
<![endif]-->
    <link rel="stylesheet" href="/tyj/Public/static/css/am.min.css" />
    <style>
        #captcha-img{
            cursor: pointer;
            width: 100%;
            height: 55px;
            border: 1px #d5d5d5 solid;
        }
        #login_btn{
            font-size: 16px;
            width: 100%;
            height: 40px;
        }
    </style>
    <script>
        var ROOT = '/tyj';
    </script>
</head>
<body class="login-layout">

<div class="main-container">
<div class="main-content">
<div class="row">
<div class="col-sm-10 col-sm-offset-1">
<div class="login-container">
<div class="center">
    <h1>
        <span class="blue">训竞管理服务网络平台</span>
    </h1>
</div>

<div class="space-6"></div>

<div class="position-relative">
    <div id="login-box" class="login-box visible widget-box no-border">
        <div class="widget-body">
            <div class="widget-main">
                <h4 class="header blue lighter bigger">
                    <i class="icon-coffee green"></i>

                </h4>

                <div class="space-6"></div>

                <form id="login_form" action="<?php echo U('login');?>" method="post">
                    <fieldset>
                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   name="username" id="username"
                                                                   placeholder="用户名"/>
															<i class="icon-user"></i>
														</span>
                        </label>

                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"
                                                                   name="password" id="password"
                                                                   placeholder="密码"/>
															<i class="icon-lock"></i>
														</span>
                        </label>
                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" maxlength="5" class="form-control"
                                                                   name="verify"
                                                                   placeholder="验证码"/>
															<i class="icon-lock"></i>
														</span>
                        </label>
                        <label class="block clearfix">
                            <img alt="验证码" id="captcha-img" title="点击更新" src="<?php echo U('verify');?>">
                        </label>


                        <div class="red" id="error_tip">
                        </div>
                        <div class="space">

                        </div>
                        <div class="clearfix">
                            <Button id="login_btn" type="button" class="btn btn-sm btn-primary">
                                登陆
                            </Button>
                        </div>
                    </fieldset>
                </form>
            </div>
            <!-- /widget-main -->

            <div class="toolbar clearfix">
                <div>
                    <a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
                        <i class="icon-arrow-left"></i>
                        忘记密码
                    </a>
                </div>

                <div>
                    <a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
                        注册
                        <i class="icon-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- /widget-body -->
    </div>
    <!-- /login-box -->


</div>
<!-- /position-relative -->
</div>
</div>
<!-- /.col -->
</div>
<!-- /.row -->
</div>
</div>
<!-- /.main-container -->

<!-- 底部 -->
<!--[if !IE]> -->

<script src="/tyj/Public/vender/ace/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/tyj/Public/vender/ace/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<script type="text/javascript">
    !function(){
        var str = "<script src='/tyj/Public/vender/ace/js/jquery.mobile.custom.min.js'>"+"<"+"script>";
        if("ontouchend" in document) document.write(str);
    }();
</script>
<script src="/tyj/Public/vender/ace/js/bootstrap.min.js"></script>
<script src="/tyj/Public/vender/ace/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="/tyj/Public/vender/ace/js/excanvas.min.js"></script>
<![endif]-->

<script src="/tyj/Public/vender/ace/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.ui.touch-punch.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.slimscroll.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.easy-pie-chart.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.sparkline.min.js"></script>
<script src="/tyj/Public/vender/ace/js/flot/jquery.flot.min.js"></script>
<script src="/tyj/Public/vender/ace/js/flot/jquery.flot.pie.min.js"></script>
<script src="/tyj/Public/vender/ace/js/flot/jquery.flot.resize.min.js"></script>

<script src="/tyj/Public/vender/ace/js/bootbox.min.js"></script>
<script src="/tyj/Public/vender/ace/js/jquery.gritter.min.js"></script>

<!-- ace scripts -->

<script src="/tyj/Public/vender/ace/js/ace-elements.min.js"></script>
<script src="/tyj/Public/vender/ace/js/ace.min.js"></script>
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
<script src="/tyj/Public/static/think.js"></script>
<script src="/tyj/Public/static/js/common.js"></script>



<script  type="text/javascript">
    var captcha_url = "<?php echo U('verify');?>";
    $("#captcha-img").attr("src", captcha_url);
    //更换验证码
    $("#captcha-img").click(function () {
        $(this).attr("src", captcha_url);
    });
    $("#login_btn").click(function(){
        $.post("<?php echo U('login');?>", $("#login_form").serialize(),function(data){
            if(data.status){
                location.href="<?php echo U('index/index');?>";
            }else{
                $("#error_tip").empty().text(data.msg);
                $("#captcha-img").click();
                shake('#error_tip');
            }
        },'json');
    });

    function shake(ele) {
        $(ele).addClass("shake");
        setTimeout(function() {
            $(ele).removeClass("shake");
        }, 1000);
    }

</script>
</body>
</html>