<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<script type="text/javascript">
function logout1(){
	if(window.confirm('您确定要退出吗？')){
		return  true;
		
		}else{
			return false;}
}
</script>
<link rel="stylesheet" type="text/css"
	href="http://opac.zjlib.cn/opac/media/style/default/main.css">
</link>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/jquery/jquery-1.6.2.min.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/jquery/jquery.cookie.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/highcharts-2.1.6/highcharts.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/highcharts-2.1.6/themes/grid.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/common.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/bookcover.js">
            </script>
<!--[if IE 6]>
                <script type="text/javascript" src="http://opac.zjlib.cn/opac/media/js/jquery/DD_belatedPNG.js">
                </script>
                <script type="text/javascript">
                    DD_belatedPNG.fix('li');
                    DD_belatedPNG.fix('#searchDiv .inputs .left');
                    DD_belatedPNG.fix('.logoimg');
                </script>
            <![endif]-->
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/i18n/message_zh.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/charts.js">
            </script>
<!-- 国际化支持 -->
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/i18nUtil.js">
            </script>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/common/space.js">
            </script>
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
	href="http://opac.zjlib.cn/opac/media/js/jquery-ui-1.8.16/css/smoothness/jquery-ui-1.8.16.custom.css">
</link>
<script type="text/javascript"
	src="http://opac.zjlib.cn/opac/media/js/jquery-ui-1.8.16/js/jquery-ui-1.8.16.custom.min.js">
            </script>
<!-- 书目浏览用到的tree的js和css -->
<!-- meta keywords, etc -->
<meta name="keywords"
	content="opac, 图创, interlib, 图书检索, 借书, , 浙江图书馆检索平台" />
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
	<!-- ***********************************该页面的uri编译********************************* -->
	<script type="text/javascript">
            $(document).ready(function() {
            	/*var t = Math.random();
            	var url="";
            	url = "/item?action=recommen&t="+t;*/
            	/* 
            	$("#search").click( function () {
            		var itemSearch = $("#itemSearch").val();
            		itemSearch = encodeURI(encodeURI(itemSearch));
            		if(itemSearch!=""){ */
            			location.href ="/front/search?search=";
            		/* }
            	}); */
            });
	<!-- 
	<script type="text/javascript">
                $(document).ready(function() {
                    $(".navbar_menu_items ul li").hover(function() {
                        $(this).children("ul").slideDown(200);
                    },
                    function() {
                        $(this).children("ul").slideUp(50);
                    });

                    var lang = $.cookie("org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE", {
                        path: "/"
                    });
                    if (lang == 'en' || lang == 'ko' || lang == 'ja') {
                        $(".navbar_info_en").show();
                        $(".navbar_info_zh").css("display", "none");
                        var maxLength = document.body.clientWidth;
                        var menuStr = 0;

                        menuStr += "navigator.search.simpleSearch".length * 4 + 24;

                        menuStr += "navigator.browse".length * 4 + 24;

                        menuStr += "navigator.space".length * 4 + 24;

                        menuStr += "navigator.newpub".length * 4 + 24;

                        menuStr += "navigator.recommended".length * 4 + 24;

                        menuStr += "navigator.publicNotice".length * 4 + 24;

                        menuStr += "navigator.bookSpecial".length * 4 + 24;

                        if (menuStr + 320 > maxLength) {
                            $("#navbar").css("height", "60px");
                            $("#navar_ul").css("float", "none");
                        }
                    }

                    //发布转借
                    //发布转借
                    $("a#releaseUL").attr("href", "javascript:void(0)").click(function() {

                        var readerHomeUrl = "";
                        var url = "/opac/interface/readerHome/ReaderHomeLogin";
                        $.ajax({
                            url: url,
                            async: false,
                            success: function(data) {
                                // 					alert(data);
                                if (data == "0") {
                                    alert("请先登录");
                                    window.location.href = "/opac/reader/login";
                                    return;
                                }
                                if (data == "500") {
                                    alert("err500");
                                    return;
                                }
                                readerHomeUrl = data;
                            }
                        });
                        if (readerHomeUrl != "") {
                            console.log("readerHomeUrl:" + readerHomeUrl);
                            $.ajax({
                                type: "GET",
                                url: readerHomeUrl,
                                dataType: 'jsonp',
                                jsonp: 'callback',
                                dataType: 'jsonp',
                                success: function(data) {
                                    window.location.href = data;
                                }
                            });
                            // 				window.open(readerHomeUrl,"_blank");	
                        }
                    });
                });
            </script>
	-->


	</script>
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
					<a href="#"> 登录</a>
				</c:if>

				<c:if test="${not empty sessionScope.username}">
				欢迎您,${ sessionScope.username}&nbsp; <a href="/front_logout"
						onclick="return logout1()"> 退出</a>
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

		</br>
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


		<div id="contentDiv">
			<div id="left_div" style="width: 320px;">
				<form:form method="post" action="/front1" modelAttribute="frontLogin1">
					<div class="form">
						<div id="tipForlogin" style="color: red; font-size: 18px;"></div>
						<label style="color: red;"></label><br />
						<ul id="login_ul" style="width: 320px;">

							<li><em>读者证号：</em> <input type="text" name="username" id="username"
								class="login_input" style="width: 168px" /></li>
							<!-- 如果是配置的允许读者证号和读者姓名进行登录,则显示读者姓名输入,隐藏密码输入 -->

							<li><em>密码：</em> <input type="text" name="password" id="password"
								class="login_input" style="width: 168px" /></li>

							<li><input name="submit" type="submit" id="submit"
					class="submit" value="登录" /><em>&nbsp;</em></li>

							<input type="hidden" value="" name="returnUrl" />
						</ul>
					</div>
				</form:form>
			</div>
			<div id="right_div">
				<div id="loginTips" class="tips">
					<!-- 			<h3 id="loginTitle"></h3> -->
					<!-- 			<font style="margin:15px;display:block;font-size:15px;min-height:250px;"> -->
					<!-- 				<ol></ol> -->
					<!-- 			</font> -->
					<h3 id="loginTitle">读者登录说明</h3>
					<ol>
						<ol>
							<li>请使用读者证号和密码 登陆我的图书馆，如果不能登陆请咨询工作人员。</li>
						</ol>
					</ol>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>
	</div>


	<script>
	
	$(document).ready(function(){
		
	});
</script>
	<div id="page_footer">
		<div class="page_footer_bd">
			<span>© 2005－2014 www.interlib.com.cn, all rights reserved</span> <span
				class="fcenter"></span> <span class="fright"> <a href="#">关于</a>

				<a href="#">联系我们</a> <a	href="#">帮助</a>

				<!--a href="#">隐私声明</a-->

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
