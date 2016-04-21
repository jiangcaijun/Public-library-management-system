<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍预约</title>
<script type="text/javascript">
function logout1(){
	if(window.confirm('您确定要退出吗？')){
		return  true;
		
		}else{
			return false;}
}
</script>

<!-- boorrow2.jsp中对应的css 和js -->
<link rel="stylesheet" type="text/css"
	href="/static/css/admin/style.css" />
<link rel="stylesheet" type="text/css"
	href="/static/css/admin/select.css" />
<script type="text/javascript"
	src="/static/js/admin/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="/static/js/admin/select-ui.min.js"></script>
<script type="text/javascript" src="/static/js/admin/kindeditor.js"></script>


<script language="JavaScript" src="/static/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/static/easyui/demo.css">
<script type="text/javascript" src="/static/easyui/jquery.easyui.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="http://my1.hzlib.net/opac3/media/style/default/main.css">
</link>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/jquery/jquery-1.6.2.min.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/jquery/jquery.cookie.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/highcharts-2.1.6/highcharts.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/highcharts-2.1.6/themes/grid.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/common/common.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/common/bookcover.js">
	
</script>
<!--[if IE 6]>
        <script type="text/javascript" src="http://my1.hzlib.net/opac3/media/js/jquery/DD_belatedPNG.js">
        </script>
        <script type="text/javascript">
          DD_belatedPNG.fix('li');
          DD_belatedPNG.fix('#searchDiv .inputs .left');
          DD_belatedPNG.fix('.logoimg');
        </script>
      <![endif]-->
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/i18n/message_zh.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/common/charts.js">
	
</script>
<!-- 国际化支持 -->
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/common/i18nUtil.js">
	
</script>
<script type="text/javascript"
	src="http://my1.hzlib.net/opac3/media/js/common/space.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="http://my1.hzlib.net/opac3/media/style/default/space.css" />
<link rel="shortcut icon"
	href="http://my1.hzlib.net/opac3/media/images/favicon.ico"
	type="image/vnd.microsoft.icon" />
<link rel="icon"
	href="http://my1.hzlib.net/opac3/media/images/favicon.ico"
	type="image/vnd.microsoft.icon" />
<title></title>
<!-- 使用jqueryui引用的js和css -->
<!-- 书目浏览用到的tree的js和css -->
<!-- meta keywords, etc -->
<meta name="keywords" content="opac, 图创, interlib, 图书检索, 借书, , 杭州地区图书馆" />
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
						<li class="f"><a href="/opac3/index"> 检索 </a></li>
						<li class="f"><a href="/opac3/browse/cls"> 书目浏览 </a>
							<ul>
								<li><a href="/opac3/browse/cls"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										中图分类浏览
								</a></li>
								<li><a href="/opac3/browse/sci"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										科图分类浏览
								</a></li>
							</ul></li>
						<li class="f"><a href="/opac3/reader/space"> 我的图书馆 </a></li>
						<li class="f"><a href="/opac3/newpub/cls"> 新书通报 </a>
							<ul>
								<li><a href="/opac3/newpub/cls"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										中图分类查看
								</a></li>
								<li><a href="/opac3/newpub/sci"> <!-- 这里处理下，当没有key时使用name（方便动态加载） -->
										科图分类查看
								</a></li>
							</ul></li>
						<li class="f"><a href="/opac3/hotLabel/hotLabelCategory">
								热门标签 </a></li>
						<!-- 湖南大学图书馆需显示个人首页的菜单链接 -->
					</ul>
				</div>
			</div>
			<!-- 这才是真正的，起作用的 -->
			<div class="navbar_info_zh">

				欢迎您,${ sessionScope.username}&nbsp; <a href="/front_logout"
					onclick="return logout1()"> 退出 <!--a href="">帮助</a-->
			</div>
		</div>
	</div>

	<div id="wrapper">
		<link type="text/css"
			href="http://my1.hzlib.net/opac3/media/style/default/space.css"
			rel="stylesheet" />
		<style type="text/css">
#showVisitedCountDiv {
	text-align: right;
	padding-right: 20px;
	margin-top: 26px;
}
</style>

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

						<div>全站综合查询</div>

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
			<script>
				function searchCurrentReservation() {
					document.pageForm.searchType.value = $("#search_type")
							.val();
					document.pageForm.searchValue.value = $("#search_value")
							.val();
					doPage('1', '10');
				}
			</script>
			<div id="contentDiv">
				<div id="left_div">
					<script>
						$(document).ready(
								function() {
									/**
									$(".inner_div ul li").hover(function(){
									var img = $(this).find("img:first");
									var src = img.attr("src");
									img.attr("src",src.substring(0,src.length-5)+"2.png");
									$(this).find("a").css("color","#333333");
									},function(){
									var img = $(this).find("img:first");
									var src = img.attr("src");
									img.attr("src",src.substring(0,src.length-5)+"1.png");
									$(this).find("a").css("color","#999999");
									});
									 **/
									$(".inner_div ul li").each(
											function() {
												var img = $(this).find(
														"img:first");
												var src = img.attr("src");
												img.attr("src", src.substring(
														0, src.length - 5)
														+ "2.png");
												$(this).find("a").css("color",
														"#333333");
											});
									$(".haschild").hover(function() {
										$(this).children("ul").slideDown(200);
										$(this).children("em").show();
									}, function() {
										$(this).children("ul").slideUp(100);
										$(this).children("em").hide();
									});

									$("#treeShow_id").hide();
									$("#listShow_id").show();

								});
					</script>
					</br> </br> </br> </br>
					<div class="inner_div">
						<ul>
							<li><a href=/front/myData> <img
									src="http://my1.hzlib.net/opac3/media/images/getReaderInfo_1.png"
									style="width: 32px;" /> <br /> 个人资料
							</a></li>
							<li><a href="/front/borrowAndReturn"> <img
									src="http://my1.hzlib.net/opac3/media/images/renewList_first_1.png" />
									<br /> 借阅查询
							</a></li>
							<li><a href="/front/reBorrow"> <img
									src="http://my1.hzlib.net/opac3/media/images/currentLoanList_first_1.png" />
									<br /> 图书续借
							</a></li>
							<!-- 是否显示积分查看菜单 -->
							<li><a href="/front/apply"> <img
									src="http://my1.hzlib.net/opac3/media/images/currentReservationList_first_1.png" />
									<br /> 书籍预约
							</a></li>
							<li><a href="/front_logout" onclick="return logout1()">
									<img
									src="http://my1.hzlib.net/opac3/media/images/privateCollectionList_first_1.png" />
									<br /> 退出系统
							</a></li>
						</ul>
					</div>
				</div>
				<div id="right_div">
					<!-- <h3>
						当前预约列表&nbsp;&nbsp;|&nbsp;&nbsp; <a
							href="/opac3/reservation/historyReservationList"> 历史预约列表 </a>
					</h3> -->
					<!-- <div id="search_form">
						<select id="search_type" class="select">
							<option value="title">题名</option>
							<option value="resdate">预约时间</option>
							<option value="cancelDate">取消时间</option>
						</select> <input type="text" id="search_value" class="input" /> <input
							type="button" class="submit" value="查询"
							onclick="searchCurrentReservation()" />
					</div> -->
					<div id="content">
						<div class="place">
							<span>位置：</span>
							<ul class="placeul">
								<li><a href="#">个人中心</a></li>
								<li><a href="#">书籍预约</a></li>
							</ul>
						</div>

						<div class="formbody">

							<div id="usual1" class="usual">

								<div class="itab">
									<ul>
										<li><a href="#tab111" class="selected">我要预约</a></li>

									</ul>
								</div>
								<form:form method="post" action="/front/apply"
									modelAttribute="front_apply">
									<div id="tab111" class="tabson">

										<div class="formtext">
											Hi，<b>user</b>，欢迎您使用预约功能！
										</div>

										<ul class="forminfo">
											<li><label>书籍名称<b>*</b></label><input name="bookName"
												id="" bookName"" type="text" class="dfinput"
												placeholder="请填写完整的书籍名称..." style="width: 308px;" /> <b>${message1}</b></li>
											</br>

											<li><label>&nbsp;</label><input name="submit"
												type="submit" id="submit" class="btn" value="点击预约" /></li>
										</ul>
									</div>
								</form:form>
								</br>
								<div class="itab">
									<ul>
										<li><a href="#tab111" class="selected">已预约的书籍</a></li>

									</ul>
								</div>
								<div id="tab1" class="tabson">
								<form:form method="post" action="/front/apply_info_1"
										modelAttribute="applyInfo1">
										<ul class="seachform">
											<li><label>书籍名&nbsp;&nbsp;<input name="bookName"id="bookName" type="text" class="dfinput" placeholder="请填写书籍名..." style="width: 200px;" /></li>
											<li><label>&nbsp;</label><input type="submit"
												id="submit" name="submit" class="scbtn" value="查询" /></li>
										</ul>
								</form:form>
								<table class="tablelist">
									<thead>
										<tr>
											<th>id<i class="sort"><img
													src="/static/img/admin/px.gif" /></i></th>
											<th>书籍名</th>
											<th>预约时间</th>
											<th>当前库存</th>
										</tr>
									</thead>
									<c:forEach var="items" items="${applys}">
										<tbody>
											<tr>
												<td>${items.id}</td>
												<td><a href="/front/detail?bookName=${items.bookName}">${items.bookName}</a></td>
												<td>${items.applyTime}</td>
												<td>${items.sum}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
								</div>
								</br></br></br>
							</div>
						</div>

						<script type="text/javascript">
							$("#usual1 ul").idTabs();
						</script>

						<script type="text/javascript">
							$('.tablelist tbody tr:odd').addClass('odd');
						</script>

					</div>

				</div>
			</div>
			<script>
				var search_type = '';
				if (search_type == '') {
					search_type = 'title';
				}
				$("#search_type").val(search_type);
				$("#search_value").val("");
				document.pageForm.searchType.value = $("#search_type").val();
				document.pageForm.searchValue.value = $("#search_value").val();
			</script>
		</div>
	</div>

	<script>
		$(document).ready(function() {

		});
	</script>
	<div id="page_footer">
		<div class="page_footer_bd">
			<span> © 2005－2014 www.interlib.com.cn, all rights reserved </span> <span
				class="fcenter"> </span> <span class="fright"> <a
				target="_blank" href="http://www.hzlib.net/"> 关于 </a> <a
				target="_blank" href="http://www.hzlib.net/"> 联系我们 </a> <a
				target="_blank" href="http://www.hzlib.net/"> 帮助 </a> <!--a href="#">隐私声明</a-->
			</span>
		</div>
	</div>
	<div style="display: none;">
		<script type="text/javascript">
			
		</script>
	</div>
</body>

</html>