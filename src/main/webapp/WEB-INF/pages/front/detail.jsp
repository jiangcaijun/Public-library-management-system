<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书详情页</title>
<script type="text/javascript">
	function logout1() {
		if (window.confirm('您确定要退出吗？')) {
			return true;

		} else {
			return false;
		}
	}
</script>
<link rel="stylesheet" type="text/css"
	href="http://opac.zjlib.cn/opac/media/style/default/main.css"></link>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/jquery/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/highcharts-2.1.6/highcharts.js"></script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/highcharts-2.1.6/themes/grid.js"></script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/common.js"></script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/bookcover.js"></script>
<!--[if IE 6]>
		<script type="text/javascript" src="http://opac.zjlib.cn/opac/media/js/jquery/DD_belatedPNG.js"></script>
		<script type="text/javascript">
			 DD_belatedPNG.fix('li');
			 DD_belatedPNG.fix('#searchDiv .inputs .left');
			 DD_belatedPNG.fix('.logoimg');
		</script>
		<![endif]-->




<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/i18n/message_en.js"></script>



<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/charts.js"></script>
<!-- 国际化支持 -->
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/i18nUtil.js"></script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/space.js"></script>


<link rel="stylesheet" type="text/css"
	href="http://opac.zjlib.cn/opac/media/style/default/space.css" />
<link rel="shortcut icon"
	href="http://opac.zjlib.cn/opac/media/images/favicon.ico"
	type="image/vnd.microsoft.icon" />
<link rel="icon"
	href="http://opac.zjlib.cn/opac/media/images/favicon.ico"
	type="image/vnd.microsoft.icon" />
<title></title>
<!-- 使用jqueryui引用的js和css -->



<link rel="stylesheet" type="text/css"
	href="http://opac.zjlib.cn/opac/media/js/jquery-ui-1.8.16/css/smoothness/jquery-ui-1.8.16.custom.css"></link>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/jquery-ui-1.8.16/js/jquery-ui-1.8.16.custom.min.js"></script>
<!-- 书目浏览用到的tree的js和css -->

<!-- meta keywords, etc -->



<meta name="keywords"
	content="opac, 图创, interlib, 图书检索, 借书, 细说Java, 浙江图书馆检索平台" />

</head>
<body>

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

	<style>
<!--
.selected {
	font-weight: bold;
}
-->
</style>

	<!-- 云南司法警官职业学院 -->


	<div id="navbar">
		<div class="navbar_bd">
			<div class="navbar_menu_items">
				<div id="navar_ul" style="float: left;">
					<ul>
						<li class="f"><a href="/front"> 检索 </a>
							<ul>
								<li><a href="#"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										高级检索
								</a></li>
							</ul></li>
						<li class="f"><a href="#"> 书目浏览 </a>
							<ul>
								<li><a href="#"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										中图分类浏览
								</a></li>
							</ul></li>
						<li class="f"><a href="#"> 我的图书馆 </a></li>
						<li class="f"><a href="#"> 新书通报 </a>
							<ul>
								<li><a href="#"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										中图分类查看
								</a></li>
							</ul></li>
						<li class="f"><a href="#"> 精品图书 </a></li>
						<li class="f"><a href="#"> 信息公告 </a>
							<ul>
								<li><a href="#"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										全馆预约到馆通知
								</a></li>
								<li><a href="#"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										全馆图书催还通知
								</a></li>
							</ul></li>
						<li class="f"><a href="#"> 图书专题 </a></li>
						<!-- 湖南大学图书馆需显示个人首页的菜单链接 -->
					</ul>
				</div>

			</div>
			<!-- zh -->
			<div class="navbar_info_zh">

				<c:if test="${ empty sessionScope.username}">
					<a href="/front/login"> 登录</a>
				</c:if>

				<c:if test="${not empty sessionScope.username}">
				欢迎您,${ sessionScope.username}&nbsp; <a href="/front/myData">个人中心</a>&nbsp;<a href="/front_logout" onclick="return logout1()"> 退出</a>
				</c:if>

			</div>
		</div>
	</div>


	<div id="wrapper">

		<link type="text/css"
			href="http://opac.zjlib.cn/opac/media/style/default/space.css"
			rel="stylesheet" />
		<style type="text/css">
#showVisitedCountDiv {
	text-align: right;
	padding-right: 20px;
	margin-top: 26px;
}
</style>
		<script type="text/javascript">
			
		</script>

		<div id="page_header">
			<div id="page_nav">
				<div class="logo">
					<a href="/front"> <img
						src="http://opac.zjlib.cn/opac/media/images/logo.png" />
					</a>
				</div>
				<form:form method="post" action="/front_bookName"
					modelAttribute="frontBookName">

					<div class="page_nav_search">
						<input type="hidden" name="rows" value="10" />

						<div>全站书籍查询</div>

						<div class="search_input">
							<input type="text" id="bookName" name="bookName" value="检索内容"
								size="50" onblur="if (value=='') {value='检索内容'};"
								onfocus="if (value=='检索内容') {value=''};" />
						</div>
						<!-- 	<input type="button" name="submit" id="submit"
							class="search_button" value="检索啊" /> -->
						<input name="submit" type="submit" id="submit" value="搜索"
							style="width: 100px; height: 32px" />

					</div>
				</form:form>
				<div id="showVisitedCountDiv"></div>
			</div>
		</div>
		<div id="page_content">


			<!-- dojo style -->
			<link rel="stylesheet"
				href="http://opac.zjlib.cn/opac/media/js/dojo/dojo/resources/dojo.css">
			<link rel="stylesheet"
				href="http://opac.zjlib.cn/opac/media/js/dojo/dgrid/css/skins/claro.css">
			<script src="http://opac.zjlib.cn/opac/media/js/dojo/dojo/dojo.js"
				data-dojo-config="async: true"></script>

			<script type="text/javascript"
				src="http://opac.zjlib.cn/opac/media/js/common/loanTrendCharts.js"></script>


			<script type="text/javascript"
				src="http://data.libtop.com/scripts/xopac/9.js"></script>

			<!-- 加载排架号解析方法文件 -->
			<script type="text/javascript"
				src="http://opac.zjlib.cn/opac/media/js/common/convertShelfnoFunctions.js"></script>

			<!-- 这一段代码是用来判断需要加载什么语言的信息文件 -->

			<script type="text/javascript"
				src="http://opac.zjlib.cn/opac/media/js/custominfo/bookDetail_en.js"></script>

			<style type="text/css">
<!--
#topDiv {
	
}

#toolBar {
	float: right;
	margin-top: 5px;
	margin-right: 5px;
}

#leftDiv {
	float: left;
	width: 20%;
	margin-left: 10px;
}

#rightDiv {
	float: right;
	width: 75%;
	margin-bottom: 15px;
}

#fontcolor {
	color: red;
}

#bookInfoTable {
	width: 100%;
	font-size: 11pt;
}

#bookInfoTable .leftTD {
	width: 15%;
}

#bookInfoTable .rightTD {
	border-bottom: 1px solid #ccc;
}

#contentTab {
	clear: both;
	margin: 5px auto;
	width: 99%;
	border: 1px solid #ccc;
	font-size: 11pt;
}

#addComment {
	width: 700px;
	height: 230px;
	margin: 10px auto;
}

#addComment table {
	font-size: 10pt;
	color: #333333;
	background-color: #EEEEEE;
}

#addComment table td {
	padding: 5px 3px;
	background-color: #FFFFFF;
}

#addComment ul, #addComment ul li {
	margin: 0px;
	padding: 0px;
	list-style: none;
	width: 450px;
}

#addComment ul li {
	line-height: 25px;
	height: 25px;
}

#addComment input[type="text"] {
	width: 500px;
	height: 20px;
	line-height: 20px;
	font-size: 15px;
	font-weight: bold;
	border: 1px #888888 solid;
}

#addComment textarea {
	width: 500px;
	height: 100px;
	border: 1px #888888 solid;
}

#addComment input[type="button"], #addComment input[type="reset"] {
	width: 80px;
	height: 30px;
	border: none;
	font-size: 13px;
	font-weight: bold;
	color: #FFFFFF;
	background-image:
		url("http://opac.zjlib.cn/opac/media/images/nav-bg.gif");
}

#score_li img {
	cursor: pointer;
}

.bookcover_img {
	border: none;
	width: 160px;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-box-shadow: 1px 1px 5px #333333;
	-webkit-box-shadow: 1px 1px 5px #333333;
	box-shadow: 1px 1px 5px #333333;
}

.hide {
	display: none;
}

.dojoxGridMasterHeader {
	font-size: 11pt !important;
}

.dojoxGridView {
	font-size: 11pt !important;
}

.dojoxGridCell {
	word-break: break-all !important;
}

#holdingDescription {
	font-size: 14px;
}

#holdingDescription ol {
	list-style-type: none;
}

#holdingDescription li {
	text-align: center;
}

#loanTrendContainer {
	margin: 15px 0;
	width: 100%;
	clear: both;
	height: 150px;
}

.field-state {
	width: 70px;
}

.field-state1 {
	width: 40px;
}

.field-state2 {
	width: 75px;
}

.field-memoinfo {
	width: 90px;
}

.field-returnDate {
	width: 102px;
}

.field-cirtype {
	width: 85px;
}

.field-volInfo {
	width: 70px;
}

.field-totalLoanNum {
	width: 80px;
}

.field-totalRenewNum {
	width: 70px;
}

.dgrid-navigation .dgrid-page-link {
	padding: 0 10px !important;
}

.dgrid-no-data, .dgrid-loading {
	color: #aaa !important;
	font-size: 3em !important;
	padding: 3em !important;
	text-align: center !important;
}

.ui-widget-content {
	border: 0px;
}

.dgrid-cell {
	word-break: break-all !important;
}

#holdingGrid .ui-state-default, #holdingGrid .ui-widget-content .ui-state-default,
	#holdingGrid .ui-widget-header .ui-state-default {
	border-style: none;
	font-weight: normal;
	color: #555555;
}

#holdingGrid .ui-widget-header {
	border-style: none;
}
-->
</style>

			<div id="newBookListDialog" class="hide" title="New booklist">
				<table align="center" cellspacing="5">
					<tr>
						<td width="100px" align="right">Name:</td>
						<td><input type="text" name="new_listName" id="new_listName"
							style="width: 350px; height: 20px; border: 1px #888888 solid;" />
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">Description:</td>
						<td><textarea name="new_description" id="new_description"
								style="width: 350px; height: 70px; border: 1px #888888 solid;"></textarea>
						</td>
					</tr>
					<tr id="publicBookListTag">
						<td align="right">Public / private:</td>
						<td><input type="radio" name="new_privacy" value="1" />Public
							<input type="radio" name="new_privacy" value="0"
							checked="checked" />Private</td>
					</tr>
				</table>
			</div>
			<div id="editDialog">
				<span><em>Label:</em><input type="text" name="tagName"
					onchange="changeTagNames()" /></span> <span
					style="display: block; font-size: 14px;">Separate labels
					with space, for example: novel literature Yu Qiuyu</span>

			</div>

			<link rel="stylesheet" type="text/css"
				href="http://opac.zjlib.cn/opac/media/js/jquery-ui-1.8.16/css/smoothness/jquery-ui-1.8.16.custom.css"></link>
			<script type="text/javascript"
				src="http://opac.zjlib.cn/opac/media/js/jquery-ui-1.8.16/js/jquery-ui-1.8.16.custom.min.js"></script>
			<style type="text/css">
body, h2 {
	margin: 0;
	padding: 0;
}

#faqbg {
	background-color: #666666;
	position: absolute;
	z-index: 99;
	left: 0;
	top: 0;
	display: none;
	width: 100%;
	height: 1000px;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
}

#faqdiv {
	position: absolute;
	width: 400px;
	left: 50%;
	top: 50%;
	margin-left: -200px;
	height: auto;
	z-index: 100;
	background-color: #fff;
	border: 1px #fff solid;
	padding: 1px;
	padding-bottom: 30px
}

#faqdiv h2 {
	height: 25px;
	font-size: 14px;
	background-color: #C4C4C4;
	position: relative;
	padding-left: 10px;
	line-height: 25px;
}

#faqdiv h2 a {
	position: absolute;
	right: 5px;
	font-size: 12px;
	color: #FF0000
}

#faqdiv .form {
	padding: 10px;
}

.form li {
	clear: left;
}
</style>

			<input type="hidden" id="reader" name="reader" value="" /> <input
				type="hidden" id="data" name="data" />
			<!-- <div id="faqbg"></div>-->
			<div id="loginDialog" class="hide" title="Sign in My Library"
				align="center" valign="top">
				<iframe id="loginFrame" name="loginFrame" src="#" frameborder="0"
					scrolling="no" width="100%" height="100%"></iframe>
			</div>

			<!-- *********************************************    主要内容             **************************************************** -->


			<c:forEach var="items" items="${books}">
				<div id="contentDiv" style="font-size: 14px;">

					<div id="topDiv">
						<div id="leftDiv">
							<div style="padding-top: 20px;">


								</br> <img id="bookcover_img" class="bookcover_img"
									src="${items.getBookPic()}" /> <a
									href="/opac/jsp_tiles/book/qrcode_help.jsp" target="_blank">

								</a>

							</div>
						</div>
						<!-- end of leftDiv -->
						<div id="rightDiv">
							<table id="bookInfoTable">
								<tr>
									</br>
									</br>
									<td colspan="2">
										<h2>${items.getBookName()}</h2>
									</td>
								</tr>
								<!-- 选择判断CNMARC和USMARC -->
								</br></br>
								<!-- CNMARC的情况下 -->

								<tr>
									<td class="leftTD">
										<div align="left">ISBN:</div>
									</td>
									<td class="rightTD">${items.getIsbn()}</td>
								</tr>



								<tr>
									<td class="leftTD">
										<div align="left">出版社:</div>
									</td>
									<td class="rightTD"><a>${items.getPress()}</a></td>
								</tr>


								<tr>
									<td class="leftTD">
										<div align="left">简要介绍:</div>
									</td>
									<td class="rightTD">${items.getContent()}</td>
								</tr>


								<tr>
									<td class="leftTD">
										<div align="left">主题:</div>
									</td>
									<td class="rightTD"><a> ${items.getTheme()} </a></td>
								</tr>
								<tr>
									<td class="leftTD">
										<div align="left">作者:</div>
									</td>
									<td class="rightTD"><a> ${items.getAutor()} </a></td>
								</tr>

								<!-- CNMARC结束 -->
								<!-- 这下面是CNMARC,USMARC等全部都显示的共有部分 -->
								<!-- 豆瓣内容简介和著者简介移动到下面的tab统一显示 -->
								<!--tr id="doubanSummaryTR" style="display:none;">
		<td class="leftTD" valign="top">豆瓣内容简介:</td>
		<td class="rightTD" id="doubanSummary"></td>
	</tr>
	<tr id="doubanAuthorIntroTR" style="display:none;">
		<td class="leftTD" valign="top">豆瓣著者简介:</td>
		<td class="rightTD" id="doubanAuthorIntro"></td>
	</tr-->
								<tr id="tagTr">
									<td>
										<div align="left">当前库存数量 :</div>
									</td>
									<td class="rightTD" id="tagTd"><label>${size}</label></td>
								</tr>
								<tr id="tagTr">
									<td>
										<div align="left">摆放位置 :</div>
									</td>
									<td class="rightTD" id="tagTd"><label>${items.getSite()}</label></td>
								</tr>
								<tr>

								</tr>
								</tr>


							</table>
						</div>
						<!-- end of rightDiv -->
					</div>

					<!-- 显示借阅趋势图 -->

					<div id="loanTrendContainer"></div>

				</div>
			</c:forEach>
			<script type="text/javascript">
		
			</script>
		</div>
	</div>

	<script>
		$(document).ready(function() {

		});
	</script>
	<div id="page_footer">
		<div class="page_footer_bd">
			<span>© 2005－2014 www.interlib.com.cn, all rights reserved</span> <span
				class="fcenter"></span> <span class="fright"> 
				<a href="#">关于</a>
				<a href="#">联系我们</a>
				<a href="#">帮助</a>
			</span>
		</div>
	</div>

</body>
</html>
