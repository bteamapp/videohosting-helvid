<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=9">
		<title>视频修改</title>
		<link rel="stylesheet" type="text/css" href="/packs/layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="/packs/admin/css/common.css?v=1.1">
		<link rel="stylesheet" type="text/css" href="/packs/font/font.css">
		<script src="/packs/jquery/jquery.min.js"></script>
		<script src="/packs/layui/layui.js"></script>
	</head>
	<style type="text/css">
		.layui-table td, .layui-table th{padding:5px;}
		.layui-input{height: 30px;line-height: 30px;}
		.layui-table td span{cursor: pointer;position: absolute;right: 8px;top: 10px;background-color: #34a7fd;color: #fff;font-size: 12px;padding: 1px 7px;border-radius: 5px;}
	</style>
	<body style="padding: 10px">
	<form class="layui-form" action="<?=site_url('server/save/'.$id)?>" method="post">
        <table class="layui-table">
            <colgroup>
                <col width="120">
                <col>
            </colgroup>
            <tbody>
                <tr><td align="center">名称标题</td><td><input type="text" name="name" placeholder="请输入服务器名称" value="<?=$name?>" class="layui-input"></td></tr>
                <tr><td align="center">访问地址</td><td><input type="text" name="apiurl" placeholder="请输入访问地址" value="<?=$apiurl?>" class="layui-input"></td></tr>
                <tr><td align="center">请求密钥</td><td style="position: relative;"><input type="text" id="apikey" name="apikey" placeholder="请输入请求密钥" value="<?=$apikey?>" class="layui-input"><span onclick="ger_rand();">重新生成</span></td></tr>
                <tr><td align="center">队列上限</td><td><input type="text" name="zmnum" placeholder="请输入转码队列上限数量" value="<?=$zmnum?>" class="layui-input" style="display: inline-block;width:150px;"> 个</td></tr>
                <tr><td align="center">源文件目录</td><td><input type="text" name="mp4dir" placeholder="请输入源文件保存目录" value="<?=$mp4dir?>" class="layui-input"></td></tr>
                <tr><td align="center">切片目录</td><td><input type="text" name="m3u8dir" placeholder="请输入切片保存目录" value="<?=$m3u8dir?>" class="layui-input"></td></tr>
                <tr><td align="center">CDN地址</td><td><input type="text" name="cdnurl" placeholder="请输入M3U8播放CDN地址" value="<?=$cdnurl?>" class="layui-input"></td></tr>
                <tr><td align="center">硬盘大小</td><td><input type="text" name="zsize" placeholder="请输入硬盘总大小，单位：G" value="<?=$zsize?>" class="layui-input" style="display: inline-block;width:150px;"> GB</td></tr>
                <tr><td align="center">线路类型</td><td>
                            <select name="vip">
                               <option value="0">普通线路</option>
                               <option value="1"<?php if($vip==1) echo 'selected';?>>Vip专属</option>
                            </select>
                </td></tr>
                <tr><td align="center" colspan="2"><button class="layui-btn" lay-submit lay-filter="edit">提交</button></td></tr>
            </tbody>
        </table>
	</form>
	<script src="/packs/admin/js/common.js"></script>
	<script>
	function ger_rand() {
	　　var len = 32;
	　　var chars = 'abcdefhijkmnprstwxyz123456789';
	　　var maxPos = chars.length;
	　　var pwd = '';
	　　for (i = 0; i < len; i++) {
	　　　　pwd += chars.charAt(Math.floor(Math.random() * maxPos));
	　　}
	　　$('#apikey').val(pwd);
	}
	</script>
	</body>
</html>