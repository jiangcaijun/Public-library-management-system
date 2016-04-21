<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nothing测试</title>

<script language="JavaScript" src="/static/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/static/easyui/demo.css">
<script type="text/javascript" src="/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	alert("000 ");
	var username= ${sessionScop.username};
	alert("111");
if(username==null){
	alert("222");
	location.href("/front");
}
	}</script>
</head>
<body>
${sessionScop.username}
	<table id="tt" class="easyui-datagrid" title="info"
		style="width: 1000px;" toolbar="#toolbar"
		data-options="pagination:true,fitColumns:true,singleSelect:true,collapsible:true,url:'/front/nothinginfo',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'bookId',width:80">书籍唯一标识</th>
				<th data-options="field:'username',width:80">读者名</th>
				<th data-options="field:'borrowTime',width:80">借阅时间</th>
				<th data-options="field:'uid',width:80">操作员</th>
			</tr>
		</thead>
	</table>
</body>
</html>