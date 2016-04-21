<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>管理系统后台登录界面</title>
<!-- <link href="css/style.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet" type="text/css" href="/static/css/admin/style.css" />
<script language="JavaScript" src="/static/js/jquery.min.js"></script>
<script src="/static/js/admin/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script>

</head>

<body
	style="background-color: #1c77ac; background-image: url(/static/img/admin/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">



	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>
		<form:form method="post" action="/admin_index" modelAttribute="adminLogin">
			<div class="loginbox">
				<ul>
					<li><input  type="text" name="username" id="username"
						class="loginuser" placeholder="请填写登录账号..." onclick="JavaScript:this.value=''" /></li>
					<li><input type="password" name="password"
						id="password" class="loginpwd"  placeholder="请填写密码..."
						onclick="JavaScript:this.value=''" /></li>
					<li><input name="submit" type="submit" id="submit"
						class="loginbtn" value="登录"/>
						<label><input
							name="" type="checkbox" value="" checked="checked" />记住密码</label></li>
				</ul>
			</div>
		</form:form>
	</div>



	<div class="loginbm">
		版权所有 2013 <a href="http://www.uimaker.com">uimaker.com</a>
		仅供学习交流，勿用于任何商业用途
	</div>


</body>

</html>
