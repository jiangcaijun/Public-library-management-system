<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css"
	href="/static/css/admin/style.css" />
<link rel="stylesheet" type="text/css"
	href="/static/css/admin/select.css" />
<script language="JavaScript" src="/static/js/jquery.min.js"></script>
<script language="JavaScript" src="/static/js/admin/ajaxfileupload.js"></script>

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
			<li><a href="#">新书上架</a></li>

		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">新书上架</a></li>
				</ul>
			</div>
			<form:form enctype="multipart/form-data" method="post"
				action="/admin/newBook_1" modelAttribute="newLABBook">
				<div id="tab1" class="tabson">

					<div class="formtext">
						Hi，<b>admin</b>，欢迎您使用新书上架功能！<b>${message1}</b>
					</div>

					<ul class="forminfo">
						<li><label>书籍名<b>*</b></label><input name="bookName"
							id="bookName" type="text" class="dfinput" placeholder="请填写书籍名..."
							style="width: 308px;" /></li>

						<li><label>作者<b>*</b></label><input name="autor" id="autor"
							type="text" class="dfinput" placeholder="请填写作者..."
							style="width: 308px;" /></li>

						<li><label>ISBN<b>*</b></label><input name="isbn" id="isbn"
							type="text" class="dfinput" placeholder="请填写ISBN..."
							style="width: 308px;" /></li>
						<li><label>书籍简介<b>*</b></label><input name="content"
							id="content" type="text" class="dfinput" placeholder="请填写书籍简介..."
							style="width: 308px;" /></li>
						<li><label>摆放位置<b>*</b></label><input name="site"
							id="site" type="text" class="dfinput" placeholder="请填写摆放位置..."
							style="width: 308px;" /></li>
						<li><label>出版社<b>*</b></label><input name="press"
							id="press" type="text" class="dfinput" placeholder="请填写出版社..."
							style="width: 308px;" /></li>
						<li><label>图书分类<b>*</b></label><input name="theme"
							id="theme" type="text" class="dfinput" placeholder="请填写图书分类..."
							style="width: 308px;" /></li>
						<li><label>书籍唯一标识<b>*</b></label><input name="id"
							id="id" type="text" class="dfinput" placeholder="请填写书籍唯一标识..."
							style="width: 308px;" /><b>${message2}</b></li>
						<li><label>&nbsp;</label>
						<li>
						<li><label>图书封面<b>*</b></label><input type="file"
							id="apkFile" name="apkFile" /> 请上传 jpg、png、jpeg格式的图片<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${message3}</b></b></li>
						</br>
						</br>
						<input name="submit" type="submit" id="submit" class="btn"
							value="点击上架" />
						</li>
					</ul>

				</div>

			</form:form>
			</br> </br>
			


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
