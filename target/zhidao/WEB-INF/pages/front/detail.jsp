<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书详情页</title>

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
						<li class="f"><a href="/opac/index"> 检索 </a>
							<ul>
								<li><a href="/opac/index/advance"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										高级检索
								</a></li>
							</ul></li>
						<li class="f"><a href="/opac/browse/cls"> 书目浏览 </a>
							<ul>
								<li><a href="/opac/browse/cls"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										中图分类浏览
								</a></li>
							</ul></li>
						<li class="f"><a href="/opac/reader/space"> 我的图书馆 </a></li>
						<li class="f"><a href="/opac/newpub/cls"> 新书通报 </a>
							<ul>
								<li><a href="/opac/newpub/cls"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										中图分类查看
								</a></li>
							</ul></li>
						<li class="f"><a href="/opac/recommended"> 精品图书 </a></li>
						<li class="f"><a href="/opac/publicNotice/reservationInLib">
								信息公告 </a>
							<ul>
								<li><a href="/opac/publicNotice/reservationInLib"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										全馆预约到馆通知
								</a></li>
								<li><a href="/opac/publicNotice/bookOverdue"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										全馆图书催还通知
								</a></li>
							</ul></li>
						<li class="f"><a href="/opac/bookSpecial"> 图书专题 </a></li>
						<!-- 湖南大学图书馆需显示个人首页的菜单链接 -->
					</ul>
				</div>
				<div class="navbar_info_en" style="display: none;">
					<!-- <img src="http://opac.zjlib.cn/opac/media/images/lang.png" class="lang"/>
                            -->
					<span id="readerLogin"> <a href="/opac/reader/login"> 登录
					</a>
					</span>
					<!-- <a href="/opac/admin/login?returnUrl=/index">管理员登录</a>
                            -->
					<!--a href="">帮助</a-->
				</div>
			</div>
			<!-- zh -->
			<div class="navbar_info_zh">
				<!-- <img src="http://opac.zjlib.cn/opac/media/images/lang.png" class="lang"/>
                        -->
				<span id="readerLogin"> <a href="/opac/reader/login"> 登录
				</a>
				</span>
				<!-- <a href="/opac/admin/login?returnUrl=/index">管理员登录</a>
                        -->
				<!--a href="">帮助</a-->
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

						<div>
							全站综合查询
						</div>

						<div class="search_input">
							<input type="text" id="bookName" name="bookName" value="检索内容"
								size="50" onblur="if (value=='') {value='检索内容'};"
								onfocus="if (value=='检索内容') {value=''};" />
						</div>
					<!-- 	<input type="button" name="submit" id="submit"
							class="search_button" value="检索啊" /> -->
						<input name="submit" type="submit" id="submit" value="搜索" style="width:100px;height:32px"/>

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


</br>
							<img id="bookcover_img" class="bookcover_img" src="${items.getBookPic()}" /> <a
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
								<td class="rightTD"><a>${items.getPress()}</a>
								</td>
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
								<td class="rightTD"><a> ${items.getAutor()} </a> </td>
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
								<td class="leftTD">
									<div align="left">Sharing:</div>
								</td>
								<td class="rightTD">
									<div id="shareResource" style="width: 150px;">
										<img src="http://opac.zjlib.cn/opac/media/images/share.jpg" />
										<div class="shareto_div_01" style="display: none;">
											<div
												style="background: #F2F2F2; border-bottom: 1px solid #E5E5E5; line-height: 200%; padding-left: 5px; font-size: 12px">
												<b>分享到...</b>
											</div>
											<div class="shareto_div_02">
												<a href="javascript:void(0);"
													onclick="share_to('tsina');return false;" class="stitle"><span
													class="stico stico_tsina">新浪微博</span></a> <a
													href="javascript:void(0);"
													onclick="share_to('douban');return false;" class="stitle"><span
													class="stico stico_douban">豆瓣</span></a>
												<!--                         <a href="javascript:void(0);" onclick="share_to('weixin');return false;" class="stitle"><span class="stico stico_weixin">微信</span></a> -->
												<a href="javascript:void(0);"
													onclick="share_to('tqq');return false;" class="stitle"><span
													class="stico stico_fav">腾讯微博</span></a> <a
													href="javascript:void(0);"
													onclick="share_to('t163');return false;" class="stitle"><span
													class="stico stico_t163">网易微博</span></a> <a
													href="javascript:void(0);"
													onclick="share_to('qzone');return false;" class="stitle"><span
													class="stico stico_qzone">Qzone</span></a>
												<div style="clear: both"></div>
											</div>
											<div
												style="background: #F2F2F2; border-top: 1px solid #E5E5E5; line-height: 120%; padding-left: 5px;">
											</div>
										</div>
									</div>
								</td>
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
			<!--
				var global_score = 0;
				function onmouseoverBookScore(scoreNum) {
					$("#score").html(scoreNum + "分");
					for (var i = 1; i <= scoreNum; i++) {
						$("#score_" + i)
								.attr("src",
										"http://opac.zjlib.cn/opac/media/images/commend2.jpg");
					}
					for (var i = scoreNum + 1; i <= 5; i++) {
						$("#score_" + i)
								.attr("src",
										"http://opac.zjlib.cn/opac/media/images/commend1.jpg");
					}
				}
				function onmouseoutBookScore() {
					$("#score").html(global_score + "分");
					var part_score = global_score;
					if (global_score == 0) {
						$("#score").html("Score");
					}
					for (var i = 1; i <= part_score; i++) {
						$("#score_" + i)
								.attr("src",
										"http://opac.zjlib.cn/opac/media/images/commend2.jpg");
					}
					for (var i = part_score + 1; i <= 5; i++) {
						$("#score_" + i)
								.attr("src",
										"http://opac.zjlib.cn/opac/media/images/commend1.jpg");
					}
				}
				function onclickBookScore(scoreNum) {
					global_score = scoreNum;
					$("#score").html(scoreNum + "分");
					$("#rate_id").attr("value", scoreNum);
				}
				$(function() {
					$("#contentTab")
							.tabs(
									{
										select : function(event, ui) {
											//alert(ui.tab + "\n" + ui.panel + "\n" + ui.panel.id);
											if (ui.panel.id == "bookOrderDiv") {
												//var url = $.data(ui.tab, "src");
												var url = $("#bookOrderIFrame")
														.attr("src");
												if (!url) {
													url = '/opac/book/order/2205946';
													$("#bookOrderIFrame").attr(
															"src", url);
												}
											} else if (ui.panel.id == "seriesOrderDiv") {
												//var url = $.data(ui.tab, "src");
												var url = $(
														"#seriesOrderIFrame")
														.attr("src");
												if (!url) {
													url = '/opac/series/order/2205946';
													$("#seriesOrderIFrame")
															.attr("src", url);
												}
											} else if (ui.panel.id == "seriesCurrentOrderDiv") {
												//var url = $.data(ui.tab, "src");
												var url = $(
														"#seriesCurrentOrderIFrame")
														.attr("src");
												if (!url) {
													url = '/opac/series/currentissue/2205946';
													$(
															"#seriesCurrentOrderIFrame")
															.attr("src", url);
												}
											} else if (ui.panel.id == "seriesBindDiv") {
												//var url = $.data(ui.tab, "src");
												var url = $("#seriesBindIFrame")
														.attr("src");
												if (!url) {
													url = '/opac/series/bind/2205946';
													$("#seriesBindIFrame")
															.attr("src", url);
												}
											} else if (ui.panel.id == "doubanReviewDiv") {
												showDoubanReview();
											} else if (ui.panel.id == "bookCatalog") {
												showBookAllMetaInfo();
											} else if (ui.panel.id == "bookPreview") {
												showBookAllMetaInfo();
											} else if (ui.panel.id == "bookContentSummary") {
												showBookAllMetaInfo();
											} else if (ui.panel.id == "bookAuthorIntroduction") {
												showBookAllMetaInfo();
											} else if (ui.panel.id == "addComment") {
												if ("" == "" || "" == null) {
													window.location = "/opac/reader/login?returnUrl="
															+ window.location.href
															+ "";
													return false;
												}
												$("#comment_content").show();
												if ($("#content_tip") != null) {
													$("#content_tip").remove();
												}
											} else if (ui.panel.id == "virtualBookshelfDiv") {
												var url = $(
														"#virtualBookshelfIFrame")
														.attr("src");
												if (!url) {
													url = '/opac/api/virtualBookshelf?bookrecno=2205946&holding=2';
													$("#virtualBookshelfIFrame")
															.attr("src", url);
												}
											}
										}
									});
				});
				var GLOBAL_BASE_API_URL = "http://localhost:8080/interes";
				GLOBAL_BASE_API_URL = "http://api.interlib.com.cn:6699/interes";
				//自动获取图书元数据信息是否存在的标识
				$(function() {
					if ($.cookie("configouternet") == "false") {
						return;
					}
					var haveBookMetaResource = "1";
					if (haveBookMetaResource != '1') {
						return;
					}
					var isbn = "978-7-115-22694-5";
					if ($.trim(isbn) == "") {
						return;
					}
					var globalLibraryCode = "P1ZJ0571017";
					var strURL = GLOBAL_BASE_API_URL
							+ "/api/bookmetadatastatus?glc="
							+ globalLibraryCode + "&isbns=" + isbn
							+ "&returnType=json"
							+ "&callback=showAllBookMetaInfoTab&jsoncallback=?";
					$.getJSON(strURL, {});
				});
				function showAllBookMetaInfoTab(data) {
					$
							.each(
									data,
									function(i) {
										var isbn = data[i].isbn;
										var isCatalogEmpty = data[i].isCatalogEmpty;
										var isPreviewEmpty = data[i].isPreviewEmpty;
										var isSummaryEmpty = data[i].isSummaryEmpty;
										var isAuthorIntroduction = data[i].isAuthorIntroductionEmpty;
										if (!isCatalogEmpty) {
											$("#book_catalog_" + isbn).show();
										}
										if (!isPreviewEmpty) {
											$("#book_preview_" + isbn).show();
										}
										if (!isSummaryEmpty) {
											$("#book_summary_" + isbn).show();
										}
										if (!isAuthorIntroduction) {
											$(
													"#book_authorIntroduction_"
															+ isbn).show();
										}
									});
				}
				//只加载一次全部信息
				var GLOBAL_LOADED_ALL_BOOK_META = false;
				//图书目录信息,图书试读信息,图书内容简介,图书著者简介
				function showBookAllMetaInfo() {
					if ($.cookie("configouternet") != "false") {
						if (!GLOBAL_LOADED_ALL_BOOK_META) {
							GLOBAL_LOADED_ALL_BOOK_META = true;
							getBookAllMetaInfo();
						}
					}
				}
				function getBookAllMetaInfo() {
					var isbn = "978-7-115-22694-5";
					//isbn = "9787308090957";
					if ($.trim(isbn) == "") {
						return;
					}
					var globalLibraryCode = "P1ZJ0571017";
					var strURL = GLOBAL_BASE_API_URL + "/api/book/isbn/" + isbn
							+ "/?glc=" + globalLibraryCode + "&returnType=json"
							+ "&callback=insertAllBookMetaInfo&jsoncallback=?";
					$.getJSON(strURL, {});
				}
				function insertAllBookMetaInfo(json) {
					if (json.result == undefined || json.result == null
							|| json.result.length == 0) {
						showDoubanSubject();
						return;
					}
					var bookCatalog = json.result.catalog;
					var previewUrl = trimToEmpty(json.result.previewUrl);
					var previewContent = json.result.previewContent;
					var summary = trimToEmpty(json.result.summary);
					var authorIntroduction = trimToEmpty(json.result.authorIntroduction);
					$("#bookCatalog").html(bookCatalog);
					if (previewUrl != "") {
						var previewBlock = "<p><a href='" + previewUrl + "' target='_blank'>"
								+ "<span style='color:blue;'>"
								+ 'View all RSS feeds'
								+ "</span></a></p>"
								+ "<br/>" + previewContent;
						$("#bookPreview").html(previewBlock);
					}
					if (summary != "") {
						$("#bookContentSummary").html(summary);
					}
					if (authorIntroduction != null) {
						$("#bookAuthorIntroduction").html(authorIntroduction);
					}
					if (summary == "" || authorIntroduction == "") {
						//showDoubanSubject();
						//这里不单独做处理了,保持和书目检索结果列表一致,统一获取中心平台数据显示
					}
				}
				function trimToEmpty(str) {
					if (str == undefined || str == null) {
						return "";
					}
					return $.trim(str);
				}
				//豆瓣书评
				function showDoubanReview() {
					if ($.cookie("configouternet") == "false") {
						return;
					}
					var isbn = "978-7-115-22694-5";
					if ($.trim(isbn) == "") {
						return;
					}
					var strURL = "http://api.douban.com/book/subject/isbn/"
							+ isbn + "/reviews?alt=xd"
							+ "&callback=insertDoubanReview&jsoncallback=?";
					$.getJSON(strURL, {});
				}
				//添加书评
				function addBookCommend() {
					var param = $("#bookReview").serialize();
					if (document.getElementById("title_id").value == "") {
						alert('The title cannot be null');
						return;
					}
					if (document.getElementById("rate_id").value == "") {
						alert('Score the book!');
						return;
					}
					if (document.getElementById("content_id").value == "") {
						alert('Comment cannot be null');
						return;
					}
					$
							.post(
									"/opac/book/addBookCommend",
									param,
									function(result) {
										$("#comment_content").hide();
										if (result == "true") {
											$("#reset_id").click();
											$("#addComment")
													.append(
															"<div id='content_tip' style='width:500px;height:50px;line-height:50px;font-size:16px;color:#333333;font-weight:bold;border:1px solid #AAAAAA;text-align:center;margin-top:100px;'>"
																	+ 'Adding comment succeeded. Wait for approval'
																	+ "</div>");
										} else if (result == "false") {
											$("#addComment")
													.append(
															"<div id='content_tip'>"
																	+ "Adding comment failed"
																	+ "</div>");
										}
									});

				}
				function insertDoubanReview(json) {
					var dbcon = '';
					if (json.entry.length > 0) {
						for (var i = 0; i < json.entry.length; i++) {
							var entry = json.entry[i];
							var dbauthor = entry.author.name.$t;
							var dblink = entry.link[1]["@href"];
							var dbdate = entry.updated.$t;
							//"updated":{"$t":"2009-03-05T19:58:21+08:00"}
							var tmp = dbdate.replace("T", " ");
							dbdate = tmp.replace(/\+.*/, "");
							var dbtitle = entry.title.$t;
							var dbreview = entry.summary.$t;
							if (i == 5) {
								dbcon += '<div id="dbhide" style="display:none">';
							}
							var hr = (i == (json.entry.length - 1)) ? ''
									: '<hr size="1" noshade="noshade" style="border:1px #cccccc dashed;"/>';
							dbcon += '<div style="margin:7px 5px 7px 5px;padding:0">'
									+ '<a target="_blank" href="' + dblink + '">'
									+ dbtitle
									+ '</a> &nbsp '
									+ '<span style="margin-left:35px">'
									+ dbauthor
									+ ' <i>('
									+ dbdate
									+ ')</i></span>'
									+ '<p style="margin:5px 0 6px 0">'
									+ dbreview + '</p>' + hr + '</div>';
						}
						if (i >= 5) {
							dbcon += '</div>'
									+ '<div style="float:right;cursor:pointer" onclick="moreOrLessDoubanReview(this)">'
									+ "Display all" + '</div>';
						}
						$("#doubanReviewDiv")
								.html(
										'<fieldset style="-moz-border-radius:8px;"><legend><b><a href="http://www.douban.com" target="_blank">'
												+ "Review"
												+ '</a></b></legend>'
												+ dbcon
												+ '</fieldset>');
					} else {
						noDoubanReview();
					}
				}
				function noDoubanReview() {
					var dbcon = '<div style="margin:7px 5px 7px 5px;padding:0">'
							+ 'No comment' + '</div>';
					$("#doubanReviewDiv")
							.html(
									'<fieldset style="-moz-border-radius:8px;"><legend><b><a href="http://www.douban.com" target="_blank">'
											+ "Review"
											+ '</a></b></legend>'
											+ dbcon + '</fieldset>');
				}
				function moreOrLessDoubanReview(obj) {
					if ($("#dbhide").css("display") == "none") {
						$("#dbhide").show();
						$(obj).html("Folding display");
					} else {
						$("#dbhide").hide();
						$(obj).html("Display all");
					}
				}
				//douban著者摘要,内容摘要
				$(function() {
					//TODO 暂时不从豆瓣api直接取了
					//showDoubanSubject();
				});
				function showDoubanSubject() {
					var isbn = "978-7-115-22694-5";
					if (trimToEmpty(isbn) == "") {
						return;
					}
					var strURL = "http://api.douban.com/book/subject/isbn/"
							+ isbn
							+ "?alt=xd&callback=insertDoubanSubject&jsoncallback=?";
					$.getJSON(strURL, {});
				}
				function insertDoubanSubject(json) {
					var summary = "";
					var authorIntro = "";
					if (json["summary"] != undefined || json["summary"] != null) {
						summary = json["summary"]["$t"];
					}
					if (json["db:attribute"].length > 0) {
						for (var i = 0; i < json["db:attribute"].length; i++) {
							var attr = json["db:attribute"][i];
							var name = attr["@name"];
							if (name == "author-intro") {
								authorIntro = attr["$t"];
							}
						}
					}
					summary = trimToEmpty(summary);
					authorIntro = trimToEmpty(authorIntro);
					if (summary != "") {
						$("#bookContentSummary").html(summary);
					}
					if (authorIntro != "") {
						$("#bookAuthorIntroduction").html(authorIntro);
					}
				}

				function showMoreRelateSubject() {
					$(".book_detial_related_subject").show();
				}
				//hotbook用的点击率
				$(function() {
					var bookrecno = "2205946";
					$.ajax({
						type : "get",
						url : '/opac/hotbook/2205946',
						data : {
							"classno" : 'TP312',
							"booktype" : '1'
						},
						dataType : "xml",
						success : function(xml) {
						}
					});
				});

				//博云光盘附件

				//添加超星按钮（由一个iframe加载）
				$(function() {

				});
				//海大畅想之星随书光盘
				//湖大畅想之星随书光盘
				$(function() {

				});

				$(document).ready(function() {
					$("#shareResource").hover(function() {
						$(".shareto_div_01").slideDown(500);
						$(".shareto_div_01").show();
					}, function() {

						$(".shareto_div_01").slideUp(100);
						$(".shareto_div_01").hide();
					});
				});

				function share_to(m) {

					var globalurl = "http://opac.zjlib.cn/opac/"
							+ "/book/2205946";
					var title = encodeURI("细说Java");
					if (m == "tsina") {
						window
								.open("http://v.t.sina.com.cn/share/share.php?url="
										+ globalurl + "&title=" + title);
					} else if (m == "tqq") {
						window.open("http://v.t.qq.com/share/share.php?url="
								+ globalurl + "&site=" + globalurl + "&title="
								+ title);
					} else if (m == "douban") {
						window.open("http://www.douban.com/recommend/?url="
								+ globalurl + "&title=" + title + "&v=1&n=1");
					} else if (m == "t163") {
						var link = "http://opac.zjlib.cn/opac/";
						var source = encodeURI("浙江图书馆检索平台");
						window
								.open("http://t.163.com/article/user/checkLogin.do?link="
										+ encodeURI(globalurl)
										+ "&source="
										+ source
										+ "&togImg=false&info="
										+ title + "  " + globalurl);
					} else if (m == "qzone") {
						window
								.open("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url="
										+ encodeURI(globalurl)
										+ "&title="
										+ title);
					}
				}
			//-->
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
				class="fcenter"></span> <span class="fright"> <a
				target="_blank"
				href="http://www.interlib.com.cn/tcsoft/web/information.do?actionCmd=column&id=63">About</a>


				<a target="_blank" href="http://www.interlib.com.cn">Contact us</a>


				<a target="_blank"
				href="http://www.interlib.com.cn/tcsoft/web/information.do?actionCmd=column&id=62">Help</a>

				<!--a href="#">Privacy declaration</a-->

			</span>
		</div>
	</div>
	<div style="display: none;">
		<script type="text/javascript">
/**
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-22724688-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
*/
</script>
	</div>


</body>
</html>
