<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
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
Date.prototype.format = function (format) {  
    var o = {  
        "M+": this.getMonth() + 1, // month  
        "d+": this.getDate(), // day  
        "h+": this.getHours(), // hour  
        "m+": this.getMinutes(), // minute  
        "s+": this.getSeconds(), // second  
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S": this.getMilliseconds()  
        // millisecond  
    }  
    if (/(y+)/.test(format))  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
            .substr(4 - RegExp.$1.length));  
    for (var k in o)  
        if (new RegExp("(" + k + ")").test(format))  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
    return format;  
}  
function formatDatebox(value) {  
    if (value == null || value == '') {  
        return '';  
    }  
    var dt;  
    if (value instanceof Date) {  
        dt = value;  
    } else {  
        dt = new Date(value);  
    }  
  
    return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)  
} 

	function myformatter(date) {
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
				+ (d < 10 ? ('0' + d) : d);
	}
	function myparser(s) {
		if (!s)
			return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0], 10);
		var m = parseInt(ss[1], 10);
		var d = parseInt(ss[2], 10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
			return new Date(y, m - 1, d);
		} else {
			return new Date();
		}
	}
</script>
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
			<li><a href="#">借书管理</a></li>
		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">读者借书</a></li>
					<li><a href="#tab2">当前已借出书籍统计</a></li>
					<!-- 何绍金：href请求过来了 -->
					<!-- <li><a href="/admin/borrow_1.action">当前已借出书籍统计</a></li> -->
				</ul>
			</div>
			<form:form method="post" action="/admin/borrow_1" modelAttribute="addBorrow">
				<div id="tab1" class="tabson">

					<div class="formtext">
						Hi，<b>admin</b>，欢迎您使用借书功能！借书后，请在20天内归还。<b>${message3}</b>
					</div>

					<ul class="forminfo">
						<li><label>读者证号<b>*</b></label><input name="username" id="username" type="text"
							class="dfinput" placeholder="请填写读者证号..." style="width: 308px;" /><b>${message1}</b></li>

						<li><label>书籍唯一标识<b>*</b></label><input name="bookId" id="bookId" type="text"
							class="dfinput" placeholder="请填写书籍唯一标识..." style="width: 308px;" /> 
							<b>${message2}</b></li>
						</br>
						</br>
						</br>
						<li><label>&nbsp;</label><input name="submit" type="submit" id="submit" 
							class="btn" value="点击借书" /></li>
					</ul>

				</div>

			</form:form>
			<div id="tab2" class="tabson">
				</br>
				<table id="tt" class="easyui-datagrid" title="information"
					style="width: 1000px;" toolbar="#toolbar"
					data-options="pagination:true,fitColumns:true,singleSelect:true,collapsible:true,url:'/admin/borrow_info',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'book_id',width:80">书籍唯一标识</th>
							<th data-options="field:'book_name',width:80">书籍名</th>
							<th data-options="field:'username',width:80">读者名</th>
							<th data-options="field:'borrow_time',width:80,formatter: formatDatebox">借书时间</th>
							<th data-options="field:'uid',width:80">操作员</th>
						</tr>
					</thead>
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
