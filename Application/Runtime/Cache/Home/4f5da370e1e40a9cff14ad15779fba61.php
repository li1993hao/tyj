<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if(isset($vo["cover_path"])): ?><img src="<?php echo ($vo["cover_path"]); ?>"/><?php endif; ?>
    <a href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?></a><br/><?php endforeach; endif; else: echo "" ;endif; ?>
</body>
</html>