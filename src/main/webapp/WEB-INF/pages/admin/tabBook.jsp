<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="/static/css/admin/style.css" />
<link rel="stylesheet" type="text/css"
	href="/static/css/admin/select.css" />
<script language="JavaScript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/static/js/admin/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="/static/js/admin/select-ui.min.js"></script>
<script type="text/javascript" src="/static/js/admin/kindeditor.js"></script>

<link rel="stylesheet" type="text/css"
	href="/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/static/easyui/demo.css">
<script type="text/javascript" src="/static/easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="/admin/index">首页</a></li>
			<li><a href="#">上下架管理</a></li>
			<li><a href="#">图书查询</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">图书查询</a></li>
				</ul>
			</div>

			<div id="tab1" class="tabson">
				<form:form method="post" action="/admin/tabBook"
					modelAttribute="adminTabBook">
					<ul class="seachform">
						<li><label>书籍名查询</label><input id="bookName" name="bookName"
							type="text" class="scinput" /></li>
						<li><label>&nbsp;</label><input type="submit" id="submit"
							name="submit" class="scbtn" value="查询" /></li>
					</ul>
				</form:form>
				<table class="tablelist">
					<thead>
						<tr>
							<th>书籍唯一标识</th>
							<th>书籍名</th>
							<th>作者</th>
							<th>ISBN</th>
							<th>出版社</th>
							<th>图书分类</th>
							<th>上下架状态</th>
						</tr>
					</thead>
					<c:forEach var="items" items="${books}">
						<tbody>
							<tr>
								<td>${items.id}</td>
								<td>${items.bookName}</td>
								<td>${items.autor}</td>
								<td>${items.isbn}</td>
								<td>${items.press}</td>
								<td>${items.theme}</td>
								<c:if test="${ empty items.deleteTime}">
									<td>上架</td>
								</c:if>
								<c:if test="${not empty items.deleteTime}">
									<td><span style="color: red">下架</span></td>
								</c:if>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>


</body>

</html>
