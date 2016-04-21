<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="/static/css/admin/style.css" />
<script language="JavaScript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<script type="text/javascript">
function logout1(){
	if(window.confirm('您确定要退出吗？')){
		return  true;
		
		}else{
			return false;}
}
</script>

</head>

<body style="background:url(/static/img/admin/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="#" ><img src="/static/img/admin/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="/admin/borrow" target="rightFrame" class="selected"><img src="/static/img/admin/icon01.png" title="工作台" /><h2>借书管理</h2></a></li>
    <li><a href="/admin/borrow2" target="rightFrame"><img src="/static/img/admin/icon02.png" title="模型管理" /><h2>还书管理</h2></a></li>
    <li><a href="/admin/tabLog"  target="rightFrame"><img src="/static/img/admin/icon06.png" title="系统设置" /><h2>日志查询</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="/static/img/admin/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li> <a href="/admin_logout" target="_parent" onclick="return logout1()">退出</a></li>
    </ul>
     
    <div class="user">
   	<span>欢迎您：${ sessionScope.username1}</span>
    </div>     
    </div>
</body>
</html>
