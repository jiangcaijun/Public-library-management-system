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
			<li><a href="#">借还书管理</a></li>
			<li><a href="#">借还书查询</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">图书查询与管理</a></li>
				</ul>
			</div>

			<div id="tab1" class="tabson">
				<form:form method="post" action="/admin/tabBorrow"
					modelAttribute="adminTabBorrow">
					<ul class="seachform">
						<li><label>书籍唯一标识查询</label><input id="bookId" name="bookId"
							type="text" class="scinput" /></li>
						<li><label>&nbsp;</label><input type="submit" id="submit"
							name="submit" class="scbtn" value="查询" /></li>
					</ul>
				</form:form>
				<table class="tablelist">
					<thead>
						<tr>

							<th>书籍唯一标识<i class="sort"><img
									src="/static/img/admin/px.gif" /></i></th>
							<th>书籍名</th>
							<th>读者名</th>
							<th>借阅时间</th>
							<th>应归还时间</th>
							<th>实际归还时间</th>
						</tr>
					</thead>
					<c:forEach var="items" items="${borrows}">
						<tbody>
							<tr>
								<td>${items.bookId}</td>
								<td>${items.bookName}</td>
								<td>${items.username}</td>
								<td>${items.borrowTime}</td>
								<td>${items.willReturnTime}</td>

								<c:if test="${ empty items.returnTime}">
									<td><a class="tablelink"> 尚未归还</a></td>
								</c:if>
								<c:if test="${not empty items.returnTime}">
									<td><span style="color: red">${items.returnTime}</span></td>
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
