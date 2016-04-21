<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索页面</title>

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
            </script> -->
            
          
                        </script>
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


		<div id="contentDiv">

			<div id="search_meta">
				<div>
					检索词: <span style="color: red;"> ${bookName} </span> , 检索到:
					${books.size()} 条结果
				</div>
			</div>
			<!-- end of search_meta -->
			<div id="wikiDiv" class="searchResultMetaInfo" style="display: none;">
				<b style="font-size: 14px; color: green"> 文 </b> <span id="wikip"
					class="searchResultMetaInfoContent"> </span>
			</div>
			<!-- start class facet navigate -->
			<!-- 注意下面facetUrl生成的链接是没有&开头的param,例如:"q=java&fq=xx" -->
			<div id="classFacetDiv">
				<fieldset style="border: 1px solid #ccc;">
					<legend>
						<b> 热点导航 </b>
					</legend>
					<p style="margin: 3px; padding: 3px;">
					<div class="search_facetClassLevel2Div" style="float: left;">
						<a
							href="/front/search?bookName=java">
							java </a>
					</div>
					<div class="search_facetClassLevel2Div" style="float: left;">
						<a
							href="/front/search?bookName=c">
							c/c++ </a>
					</div>
					<div class="search_facetClassLevel2Div" style="float: left;">
						<a
							href="/front/search?bookName=linux">
							linux </a>
					</div>
					<div class="search_facetClassLevel2Div" style="float: left;">
						<a
							href="/front/search?bookName=%e8%af%ad%e8%a8%80">
							语言 </a>
					</div>
					<div class="search_facetClassLevel2Div" style="float: left;">
						<a
							href="/front/search?bookName=文化">
							文化 </a>
					</div>
					<div style="width: 250px;"></div>
					</p>
				</fieldset>
			</div>
			<!-- end class facet navigate -->
			<!-- HighChartContainer -->

			<br />
			<div>
				<div id="facetTile">
					<!-- 分面处理 -->
					<div class="facetList">
						<div class="facetContainer">
							<h3>分面检索</h3>
							<ol id="curlibcodeFacetUL">
								<h4>
									<a href="#"> 分馆 </a>
								</h4>
								<!-- 将x值转换为c值处理 -->
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_curlibcode=403"
									title="2"> 省政府分馆 </a></li>
								<!-- 将x值转换为c值处理 -->
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_curlibcode=501"
									title="3"> 厅局机关分馆 </a></li>
								<!-- 将x值转换为c值处理 -->
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_curlibcode=601"
									title="3"> 企业分馆 </a></li>
								<!-- 将x值转换为c值处理 -->
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_curlibcode=801"
									title="85"> 社区村分馆 </a></li>
								<!-- 将x值转换为c值处理 -->
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_curlibcode=zjlib"
									title="2522"> 浙江图书馆 </a></li>
							</ol>
						</div>
						<div class="facetContainer">
							<ol id="subjectFacetUL">
								<h4>
									<a href="#"> 主题 </a>
								</h4>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_subject=中国"
									title="915"> 中国 </a></li>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_subject=现代"
									title="785"> 现代 </a></li>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_subject=当代"
									title="288"> 当代 </a></li>
							</ol>
						</div>

						<div class="facetContainer">
							<ol id="pubdateFacetUL">
								<h4>
									<a href="#"> 出版日期 </a>
								</h4>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_pubdate=2015"
									title="361"> 2015 </a></li>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_pubdate=2014"
									title="155"> 2014 </a></li>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_pubdate=2013"
									title="261"> 2013 </a></li>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_pubdate=2012"
									title="156"> 2012 </a></li>
								<li><a
									href="/opac/search?q=%E6%96%87&searchType=standard&isFacet=true&view=standard&rows=10&searchWay0=marc&q0=&logical0=AND&f_pubdate=2011"
									title="106"> 2011 </a></li>

							</ol>
						</div>
					</div>
					<!-- end facetList -->
				</div>

				<div id="resultTile">
					<!-- 以下是图书展示部分 蒋蔡军 -->
					<div class="resultList">
						<table class="resultTable">
							<c:forEach var="items" items="${books}">
								<tr>
									<td width="20px"></td>
									<td width="20px"></td>
									<td class="coverTD"><a
										href="/front/detail?bookName=${items.getBookName()}"> <img
											class="bookcover_img" src="${items.getBookPic()}" />
									</a></td>

									<td class="bookmetaTD" style="background-color: #F8F8F8">
										<div class="bookmeta">
											<div>
												<span class="bookmetaTitle"> <a
													href="/front/detail?bookName=${items.getBookName()}" id="title_2200352"
													target="_blank"> ${items.getBookName()} </a>
												</span>
												<!-- 如果有附件则显示非书资料的图标 -->
											</div>
											</br> </br>
											<div>
												作者:  ${items.getAutor()} 著 </a>
											</div>

											</br> </br>
											<div>
												出版社: ${items.getPress()}</a> &nbsp;
											</div>

										</div>

									</td>
								</tr>
							</c:forEach>


						</table>
					</div>

				</div>
			</div>
			<div id="debug"></div>
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
				target="_blank"
				href="http://www.interlib.com.cn/tcsoft/web/information.do?actionCmd=column&id=63">
					关于 </a> <a target="_blank" href="http://www.interlib.com.cn"> 联系我们
			</a> <a target="_blank"
				href="http://www.interlib.com.cn/tcsoft/web/information.do?actionCmd=column&id=62">
					帮助 </a> <!--a href="#">隐私声明</a-->
			</span>
		</div>
	</div>
	<div style="display: none;">
		<script type="text/javascript">
                
                    
                </script>
	</div>
</body>

</html>