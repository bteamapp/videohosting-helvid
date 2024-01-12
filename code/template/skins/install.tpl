<!doctype html>
<html>
<head>
	<meta charset=utf-8>
	<title>网盘系统安装</title>
	<meta name="robots" content="noindex,nofollow">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/packs/layui/css/layui.css">
	<link type="text/css" rel="stylesheet" href="/packs/install/install.css" />
	<script src="/packs/layui/layui.js"></script>
	<script src="/packs/jquery/jquery.min.js"></script>
</head>
<body>
<div class="bg">
	<div class="logkuang">
		<blockquote class="layui-elem-quote layui-text">
		  <b>网盘系统安装</b> 
		  <a style="float:right" href="http://www.9niu.wang/" target="_blank">优质源码</a>
		</blockquote>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>使用许可协议</legend>
		</fieldset>

<div style="text-align:center;">
<textarea style="width:100%;border:2px solid #C8E9FF;font-size:12px;" rows="15">

感谢您选择云网盘系统, 希望我们的产品能够帮您把网站发展的更快、更好、更强！

云网盘系统由网络科技有限公司(以下简称本公司)独立开发，全部核心技术归属本公司所有 。

本源码来自 https://www.9niu.wang

一、崇胜云网盘系统(以下简称 云转码)使用限制 

  1、您在使用云转码时应遵守中华人民共和国相关法律法规、您所在国家或地区之法令及相关国际惯例，不将云转码用于任何非法目的，也不以任何非法方式使用云转码。

  2、云转码 著作权已在中华人民共和国国家版权局注册，并受到法律和国际公约保护。如果您需要采用 云转码 系统的部分程序构架其他程序系统，请务必取得我们的同意。否则我们将追究责任!修改后的代码，未经书面许可，严禁公开发布，更不得利用其从事盈利业务。

  3、未经商业授权,不得使用本软件，否则我们将保留追究的权力。有关 云转码 授权包含的服务范围，技术支持等，请参看 http://www.9niu.wang
二、Ctcms 免责声明

  1、利用云转码构建的网站的任何信息内容以及导致的任何版权纠纷和法律争议及后果，本公司不承担任何责任。

  2、云转码损坏包括程序的使用(或无法再使用)中所有一般化、特殊化、偶然性的或必然性的损坏(包括但不限于数据的丢失，自己或第三方所维护数据的不正确修改，和其他程序协作过程中程序的崩溃等)，本公司不承担任何责任。

  电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦安装使用云转码，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，本公司有权随时终止授权，责令停止损害，并保留追究相关责任的权力。
</textarea></div>

		<p style="margin-top: 20px;"><font color=red> 安装前，请给这些目录 ：./caches/、./sys/libs/、./packs/install/、./video/ 修改权限(777)</font></p>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>数据库信息</legend>
		</fieldset>
		<form class="layui-form" action="<?=links('install/save')?>" method="post">
		  <div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">服务器名称：</label>
			  <div class="layui-input-inline">
				<input type="text" name="host" value="127.0.0.1" lay-verify="required" autocomplete="off" class="layui-input" placeholder="服务器名称地址">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">数据库端口：</label>
			  <div class="layui-input-inline">
				<input type="text" name="port" autocomplete="off" class="layui-input" placeholder="数据库端口，默认3306">
			  </div>
			</div>
		  </div>

		  <div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">数据库名称：</label>
			  <div class="layui-input-inline">
				<input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input" placeholder="数据库名称">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">数据表前缀：</label>
			  <div class="layui-input-inline">
				<input type="text" name="prefix" value="pan_" autocomplete="off" class="layui-input" placeholder="数据表前缀">
			  </div>
			</div>
		  </div>

		  <div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">数据库帐号：</label>
			  <div class="layui-input-inline">
				<input type="text" name="user" lay-verify="required" autocomplete="off" class="layui-input" placeholder="数据库链接帐号">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">数据库密码：</label>
			  <div class="layui-input-inline">
				<input type="text" name="pass" lay-verify="required" autocomplete="off" class="layui-input" placeholder="数据库链接密码">
			  </div>
			</div>
		  </div>

		  <div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">网站域名：</label>
			  <div class="layui-input-inline">
				<input type="text" name="weburl" lay-verify="required" autocomplete="off" value="<?=$_SERVER['HTTP_HOST']?>" class="layui-input" placeholder="网站运行域名">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">转码域名：</label>
			  <div class="layui-input-inline">
				<input type="text" name="zmurl" lay-verify="required" autocomplete="off" value="<?=$_SERVER['HTTP_HOST']?>" class="layui-input" placeholder="转码域名，绑定到主域名一起即可">
			  </div>
			</div>
		  </div>
					  
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>后台登陆信息</legend>
		</fieldset>

		  <div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">后台登陆帐号：</label>
			  <div class="layui-input-inline">
				<input type="text" name="admin_name" value="admin" lay-verify="required" autocomplete="off" class="layui-input" placeholder="后台登陆帐号">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">后台登陆密码：</label>
			  <div class="layui-input-inline">
				<input type="text" name="admin_pass" value="admin" lay-verify="required" autocomplete="off" class="layui-input" placeholder="后台登陆密码">
			  </div>
			</div>
		  </div>

		  <div class="layui-form-item">
			<div class="layui-input-block">
			  <button class="layui-btn" lay-submit="" lay-filter="install">立即安装</button>
			  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		  </div>
		  <br><br><br>
		</form>
	</div>
</div>
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer;
});
</script>
</body>
</html>
