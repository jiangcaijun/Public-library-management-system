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
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>通讯录</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="/static/img/admin/leftico01.png" /></span>读者管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="index.html" target="rightFrame">首页</a><i></i></li>
        <li><cite></cite><a href="/admin/right" target="rightFrame">读者-管理员交流页</a><i></i></li>
        <li><cite></cite><a href="imgtable.html" target="rightFrame">读者资格验证</a><i></i></li>
        <li><cite></cite><a href="form.html" target="rightFrame">已验证读者</a><i></i></li>    
        <li><cite></cite><a href="tab.html" target="rightFrame">Tab页</a><i></i></li>
        <li><cite></cite><a href="/admin/error" target="rightFrame">404页面</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="/static/img/admin/leftico02.png" /></span>借还书管理
    </div>
    <ul class="menuson">
   	    <li><cite></cite><a href="/admin/borrow" target="rightFrame">借书管理</a><i></i></li>
        <li><cite></cite><a href="/admin/borrow2" target="rightFrame">还书管理</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="/static/img/admin/leftico03.png" /></span>上下架管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/admin/newBook" target="rightFrame">新书上架</a><i></i></li>
        <li><cite></cite><a href="/admin/deleteBook" target="rightFrame">旧书下架</a><i></i></li>
        <li><cite></cite><a href="/admin/tabBook" target="rightFrame">图书查询与管理</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="/static/img/admin/leftico04.png" /></span>日志查询</div>
    <ul class="menuson">
        <li><cite></cite><a href="/admin/tabLog" target="rightFrame">日志查询</a><i></i></li>
    </ul>
    
    </dd>   
    
    </dl>
    
</body>
</html>
