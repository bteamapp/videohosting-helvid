<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>会员注册 - <?=Web_Name?>WWW.helvid.COM</title>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <link rel="stylesheet" href="/packs/static/css/style.css"/>
        <script src="/packs/static/js/jquery.min.js"></script>
        <script src="//cdn.bootcss.com/layer/3.1.0/layer.js"></script>
    <body>
        <div class="login-container">
	    <div class="box">
            <h1>
                <img src="/packs/static/picture/logo.png" alt="">
            </h1>
            <div class="connect">
                <p>免费多媒体云盘系统</p>
            </div>

            <form action="<?=links('reg','save')?>" method="post" id="registerForm">
                <div>
                    <input type="text" name="name" class="username" placeholder="您的用户名" autocomplete="off"/>
                </div>
                <div>
                    <input type="password" name="pass" class="password" placeholder="输入密码" />
                </div>
                <div>
                    <input type="password" name="repass" class="confirm_password" placeholder="再次输入密码" />
                </div>
                <div>
                    <input type="email" name="email" class="email" placeholder="输入邮箱地址" />
                </div>
                <div style="position: relative;"> <input type="text" name="code" class="password" placeholder="验证码"  />
                    <img src="<?=links('code')?>" onclick="this.src=this.src+'?'" class="verifyimg"> </div>
                <span id="submit" class="u-btn">注 册</span>
            </form>
            <a href="<?=links('login')?>" class="to-login">
                <button type="button" class="register-tis">已经有账号？</button>
            </a>


            <p class="copyright">
                <script>
                    document.write(new Date().getFullYear());
                </script>&copy; 版权所有 <span>
               <span>HAOSEPAN.COM</span> &nbsp;|&nbsp;多媒体云盘系统
            </p>

        </div>
        <!--背景图片自动更换-->
        <script src="/packs/static/js/supersized.3.2.7.min.js"></script>
        <script src="/packs/static/js/common.js"></script>
    </body>
</html>