<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆首页</title>

<!-- <link rel="stylesheet"
	href="http://www.zjlib.cn/r/cms/www/default/css/style.css"> -->
<link rel="stylesheet" type="text/css"
	href="/static/css/front/style.css" />
<script language="JavaScript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="http://www.zjlib.cn/r/cms/www/default/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="http://www.zjlib.cn/r/cms/www/default/js/jquery-s.js"></script>
<script type="text/javascript"
	src="http://www.zjlib.cn/r/cms/www/default/js/slides.min.jquery.js"></script>
<script type="text/javascript"
	src="http://www.zjlib.cn/r/cms/www/default/js/jquery.carouFredSel-6.0.4-packed.js"></script>

<script type="text/javascript">
    $(function() {
        $('#carousel ul').carouFredSel({
            prev: '#prev',
            next: '#next',
            pagination: "#pager",
            scroll: 1000
        });
    });
</script>

<script type="text/javascript">
	function jcj(){
		//alert($("#username").val());		
		$.post("/front",{
			username:$("#username").val(),password:$("#password").val()
			},function(data){
			if(data.message=="login_false"){
				alert("登录失败");
				$(p2).show();
			}else{
				alert("登录成功");	
				location.reload();
			/* 	$('.layer').fadeOut('fast'); $('.lg').fadeOut('fast'); $('.close2').fadeOut('fast');
				$(topRight_1).hide();
				$(topRight_2).show();		
				$("#forminfo").text("欢迎您，"+$("#username").val()); */
			}
		}); 
		}
</script>

<!--展开隐藏-->
<script type="text/javascript"
	src="http://www.zjlib.cn/r/cms/www/default/js/ddaccordion.js"></script>
<script type="text/javascript"> 
    /*展开隐藏*/
    ddaccordion.init({
    headerclass: "title",  //标题
    contentclass: "txt", //内容
    revealtype: "click",
    mouseoverdelay: 0,
    collapseprev: true,
    defaultexpanded: [0], //默认展开第几个,从0开始
    onemustopen: true,
    animatedefault: false,
    persiststate: false, //默认开启：false
    toggleclass: ["", "hover1"], //点击过后样式 
    togglehtml: ["suffix", ""],
    oninit: function (headers, expandedindices) {
    },
    onopenclose: function (header, index, state, isuseractivated) {
    }
  });
</script>

<script src="http://www.zjlib.cn/r/cms/front.js" type="text/javascript"></script>

<style tpye="css/text">
.ny2010 #demo .pic .qs_div1 img {
	width: 120px;
	height: 120px;
}
</style>

<title>图书馆首页</title>
</head>
<body onload="wjw1()">
	<!--遮蔽广告-->
	<!--
<div id="ad">
<a href="#1" >关闭</a>
<!--<img src="http://www.84n.net/UploadFiles/2011-01/20111109263976675.jpg" alt="" width="1500" height="500"/>-->
	<!--<img src="http://www.zjlib.cn/r/cms/www/default/img/2015yuandan.png" alt="" width="1500" height="480" />

</div>-->
	<!--遮蔽广告-->


	<div class="top">
		<div>
			<img src="http://www.zjlib.cn/r/cms/www/default/img/div1.jpg"
				class="img1">
		</div>

		<script
			src="http://www.zjlib.cn/r/cms/www/default/js/quanwensearch.js"
			type="text/javascript"></script>
		<script src="http://www.zjlib.cn/r/cms/www/default/js/daohang.js"
			type="text/javascript"></script>
		<script src="/js/showAjax.js" type="text/javascript"></script>
		<script type="text/javascript">var isLogin = false;var token='';var  token_ip='';var flagg='';</script>
		<script src="/js/login.js" type="text/javascript"></script>

		<iframe style="display: none" name="child" width="100%"
			src="/user/ipvalidate.jsp"></iframe>
		<script type="text/javascript">
    window.onload=function(){   
    if(isLogin && document.getElementById("myLibrary")){
       document.getElementById("myLibrary").style.display="block";
     }   
}

</script>
		<div class="head">
			<div class="nav">
				<div class="logo fl_lf">
					<a href="#"><img
						src="http://www.zjlib.cn/r/cms/www/default/img/icon/logo2.png" /></a>
				</div>
				<ul id="nav">
					<li>
						<div class="nav_1">
							<a
								onclick="addLog('资源','首页','1','3','/zysglg/23.htm?li_id=1','查看资源')">资&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源<span>RESOURCES</span></a>
						</div>
					</li>
					<li>
						<div class="nav_1">
							<a
								onclick="addLog('服务','首页','1','1','/syfw/index.htm?li_id=2','查看服务')">服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务<span>SERVICES</span></a>
						</div>
					</li>
					<li>
						<div class="nav_1">
							<a
								onclick="addLog('资讯','首页','1','1','/zxdtxw/index.htm?li_id=3','查看资讯')">资&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;讯<span>NEWS</span></a>
						</div>
					</li>
					<li>
						<div class="nav_1">
							<a
								onclick="addLog('概况','首页','1','1','/sygk/index.htm?li_id=4','查看概况')">概&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;况<span>OVERVIEW</span></a>
						</div>
					</li>
					<li>
						<div class="nav_1">
							<a
								onclick="addLog('专题','首页','1','1','/syzt/index.htm?li_id=5','查看专题')">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题<span>TOPICS</span></a>
						</div>
					</li>
				</ul>
				<div class="box1_1">
					<div class="search">
						<a href="javascript:void(0) " onclick="querytj(1)"></a>
					</div>
					<div class="login" style="width: 160px; right: -15px;">
						<a href="#" class="weixin"><img
							src="http://www.zjlib.cn/r/cms/www/default/img/icon/weixin.png">
							<div class="ewm">
								<img src="http://www.zjlib.cn/r/cms/www/default/img/ewm1.jpg"
									alt=""><img
									src="http://www.zjlib.cn/r/cms/www/default/img/ewm2.jpg" alt="">
							</div> </a> <a href="#" class="weibo" id="weibo"><img
							src="http://www.zjlib.cn/r/cms/www/default/img/icon/weibo.png">
							<div class="ewm" style="width: 150px; display: none; left: 55px;">
								<img src="http://www.zjlib.cn/r/cms/www/default/img/weibo1.png">
							</div> </a> <a id="user_ip" href="" target="_blank"
							onclick="addLog('英文版网页','首页','1','1','http://www.zjlib.cn:8282/zjlib/page/index.jsp','查看英文版网页')">EN</a>
						<a id="odl" href="#" target="_blank" style="margin-left: 20px;"
							onclick="addLog('中文版网页','首页','1','1','http://old.zjlib.cn/Public/index.asp','查看中文版网页')">怀旧</a>

					</div>
					<script>
                    $(".weibo").hover(function(){
                        if($(".weibo .ewm").is(":visible")){
                        	front_1       $(".weibo .ewm").slideUp("fast");
                        }else{
                            $(".weibo .ewm").slideDown("fast");
                        }
                    });
                </script>
					<script>
                    $(".weixin").hover(function(){
                        if($(".weixin .ewm").is(":visible")){
                            $(".weixin .ewm").slideUp("fast");
                        }else{
                            $(".weixin .ewm").slideDown("fast");
                        }
                    });
                </script>
				</div>
				<%-- <c:set var="salary" scope="session" value="${2000*2}" /> --%>
				<c:if test="${ empty sessionScope.username}">
					<div id="topRight_1">
						<a href="javascript:void(0);"
							onclick="$('.layer').fadeIn('slow'); $('.lg').fadeIn('slow'); $('.close2').fadeIn('slow');"
							class="own fl_rt">
							<div class="div_1">我的图书馆</div>
							<div class="div_2">MY&nbsp;LIBRARY</div>
							<div class="div_3">您好,请登录！</div>
							<div class="div_4"></div>
						</a>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.username}">
					<div id="topRight_2">
					    <a href="/front/myData" target="_blank"
							class="own fl_rt">
								<div class="div_1">个人中心</div>
								<div class="div_2">MY&nbsp;LIBRARY</div>
								<div class="div_3">欢迎您,${ sessionScope.username}</div>
								<div class="div_4"></div>
						</a>
					</div>
				</c:if>
			</div>
		</div>

		<ul id="searchs">
			<li>
				<div>
					<a href="javascript:void(0);" class="title">书籍名</a>
				</div>
				<div class="txt">
					<div class="searchs_1">

						<form:form id="searchGjForm" method="post"
							action="/front_bookName" modelAttribute="frontBookName"
							name="searchGjForm">

							<input type="text" class="text" id="bookName" name="bookName"
								value="检索内容" onblur="if (value=='') {value='检索内容'};"
								onfocus="if (value=='检索内容') {value=''};">
							<a href="#" onclick=" searchzjgj()">检索</a>

							<br style="line-height: 25px;" />
							<br />
							<br />
						</form:form>
					</div>
				</div>
			</li>
			<li>
				<div>
					<a href="javascript:void(0);" class="title">主题</a>
				</div>
				<div class="txt">
					<div class="searchs_1">

						<form:form id="searchGjForm1" method="post" action="/front_theme"
							modelAttribute="frontTheme" name="searchGjForm">

							<input type="text" class="text" id="theme" name="theme"
								value="检索内容" onblur="if (value=='') {value='检索内容'};"
								onfocus="if (value=='检索内容') {value=''};">
							<a href="#" onclick=" searchzjgj()">检索</a>

							<br style="line-height: 25px;" />
						</form:form>

					</div>
				</div>
			</li>
			<li>
				<div>
					<a href="javascript:void(0);" class="title">作者</a>
				</div>
				<div class="txt">
					<div class="searchs_1">

						<form:form id="searchGjForm2" method="post" action="/front_autor"
							modelAttribute="frontAutor" name="searchGjForm">

							<input type="text" class="text" id="autor" name="autor"
								value="检索内容" onblur="if (value=='') {value='检索内容'};"
								onfocus="if (value=='检索内容') {value=''};">
							<a href="#" onclick=" searchzjgj()">检索</a>

							<br style="line-height: 25px;" />
						</form:form>
					</div>
				</div>
			</li>
		</ul>

	</div>


	<iframe name="dicview" frameborder="no" id="myLibrary"
		style="display: none" scrolling="no" allowtransparency="true"
		width="100%" height="460px" src="/home/login_MyLibrary.jsp"></iframe>


	<script src="http://www.zjlib.cn/r/cms/www/default/js/quanwensearch.js"
		type="text/javascript"></script>
	<div class="div5">
		<div class="group5">
			<div class="group5_1">
				<div class="title5">关注我们</div>
				<div class="divs5" style="z-index: 10;">
					<div class="qs_ewm_tj">
						<div class="qs_top">
							<a href="#" class="qsaa_01"> <img
								src="http://www.zjlib.cn/r/cms/www/default/img/tj_001.png">
								<div style="font-size: 10px; margin-top: 20px">* 更多讯息关注订阅号</div>

								<div class="qsaaa_01">
									<img style="width: 147px; height: 165px;"
										src="http://www.zjlib.cn/r/cms/www/default/img/ewm1.jpg">
								</div>
							</a> <a href="#" class="qsaa_01"> <img
								src="http://www.zjlib.cn/r/cms/www/default/img/tj_002.png">
								<div style="font-size: 10px; margin-top: 20px">* 更多服务关注服务号</div>
								<div class="qsaaa_01">
									<img style="width: 147px; height: 165px;"
										src="http://www.zjlib.cn/r/cms/www/default/img/ewm2.jpg">
								</div>
							</a>
						</div>
						<div class="qs_bottom">
							<a href="#" class="qsaa_02" style="margin-top: 40px;"> <img
								src="http://www.zjlib.cn/r/cms/www/default/img/tj_003.png">
								<div class="qsaaa_01">
									<img style="width: 147px; height: 165px;"
										src="http://www.zjlib.cn/r/cms/www/default/img/tj_zhifibao.jpg">
								</div>
							</a> <a href="#" class="qsaa_02" style="margin-top: 40px;"> <img
								src="http://www.zjlib.cn/r/cms/www/default/img/tj_004.png">
								<div class="qsaaa_01">
									<img style="width: 147px; height: 165px;"
										src="http://www.zjlib.cn/r/cms/www/default/img/weibo1.png">
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="group5_2">
				<div class="title5_2">相关网站</div>
				<ul class="divs5_2">
					<li><a id="0_xg" href="http://zjisa.zjlib.cn/" target="_blank">浙江省公共图书馆资源门户</a></li>
					<li><a id="1_xg" href="http://www.zjelib.cn/" target="_blank">浙江网络图书馆</a></li>
					<li><a id="2_xg" href="http://www.zjdh.org:8080/vrd/index.htm"
						target="_blank">浙江省联合知识导航网</a></li>
					<li><a id="3_xg" href="http://www.zjgjbh.cn/" target="_blank">浙江古籍保护网</a></li>
					<li><a id="4_xg" href="http://10.18.36.55/151/"
						target="_blank">全省公共图书馆云平台</a></li>
					<li><a id="5_xg" href="http://www.zjwhgx.cn/" target="_blank">浙江数字文化网</a></li>
					<li><a id="6_xg" href="http://old.zjlib.cn/shutui/index.asp"
						target="_blank">浙江省数字图书馆推广工程</a></li>
					<li><a id="7_xg" href="http://www.zpsls.cn/" target="_blank">浙江省图书馆学会</a></li>
					<li><a id="8_xg" href="http://www.fuwen.biz/" target="_blank">浙江图书馆教育中心</a></li>
				</ul>
			</div>
			<div class="group5_3">
				<div class="title5_3">友情链接</div>
				<ul class="divs5_3">
					<li><a href="http://www.zjwh.gov.cn/" target="_blank">浙江省文化厅</a></li>
					<li><a href="http://www.nlc.gov.cn/" target="_blank">国家图书馆</a></li>
					<li><a href="http://www.ndlib.cn/" target="_blank">国家数字图书馆推广工程</a></li>
					<li><a href="http://www.ndcnc.gov.cn/" target="_blank">全国文化信息资源共享工程</a></li>
					<li><a href="http://www.goethe.de/ins/cn/zh/pek.html"
						target="_blank">歌德学院北京分院</a></li>
				</ul>
			</div>
			<div class="group5_4">
				<div class="title5_4">联系我们</div>
				<ul class="divs5_4">

					<li><a>投诉建议：0571-87988569（工作日8:30—17:00）</a></li>
					<li><a href="mailto:directorch@vip.sina.com">馆长信箱：directorch@vip.sina.com</a></li>
					<li><a href="http://www.zjlib.cn/yibanwt/index.htm?cid=y"
						target="_blank">咨询电话：0571-87988338（服务时间详见电话咨询）</a></li>
					<li><a href="mailto:zjdh@zjlib.cn">咨询信箱：zjdh@zjlib.cn</a></li>
					<li><a>语音服务：0571-87988998（24小时）</a></li>
				</ul>

				<a href="#" class="divs5_5"> <img
					src="http://www.zjlib.cn/r/cms/www/default/img/icon/position.jpg">
					<span>查看地理位置及公交线路</span><img
					src="http://www.zjlib.cn/r/cms/www/default/img/jtsglg.png"
					class="img2">
				</a>

			</div>
		</div>
	</div>
	<div class="div6" style="height: 100px;">
		<div class="group6">
			<div style="margin-left: -310px;">
				<script type="text/javascript">document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript src='http://dcs.conac.cn/js/12/000/0000/41018508/CA120000000410185080001.js' type='text/javascript'%3E%3C/script%3E"));</script>

			</div>
			<div style="font-size: 14px;">
				<a href="/fwzxfw/index.htm">常见问题</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href="/wzdt/index.htm">网站地图</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href="/zxflsm/index.htm">法律声明</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href="http://mail1.zjlib.cn/cgi-bin/openwebmail/openwebmail.pl"
					target="_blank">内部邮件</a>
			</div>
			<div style="font-size: 14px;">
				Copyright@2015 ZJLIB.CN ALL Rights Reserved 浙江图书馆&nbsp;浙ICP备<a
					href='http://www.miibeian.gov.cn/' target="_blank">10002501</a>号&nbsp;&nbsp;
				<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256711328'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D1256711328%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
			</div>
			<div style="font-size: 14px;">
				<a href="http://www.zjlib.cn/">电脑版</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href="#">手机版</a>
			</div>

		</div>
		<script type="text/javascript">
  var retuurl ='';
  function check_book(isC){
   if(isLogin){
     if(isC){
      window.open('/auth/authbook.jsp?book_url=http://opac.zjlib.cn/opac/loan/renewList');       
     }
     document.getElementById("a_book").href = "/auth/authbook.jsp?book_url=http://opac.zjlib.cn/opac/loan/renewList";
     
    }else{
       retuurl = "/auth/authbook.jsp?book_url=http://opac.zjlib.cn/opac/loan/renewList";  
      $('.layer').fadeIn('slow'); $('.lg').fadeIn('slow'); $('.close2').fadeIn('slow');
     
    }}
</script>
		<!-- 右侧"欢迎咨询"栏 -->
		<!-- <div class="box1_2">
    <div class="sc schv schv2" id="image_login" style="top: 5px; right: 0px; opacity: 1;background-position-x:0px"><div class="ddd" style="display: block;"></div></div>
    <ul class="fc" style="top: 0px; right: -95px; opacity: 1;">
        <li><a  target="_bank" href="/yibanwt/index.htm?cid=x"><img src="http://www.zjlib.cn/r/cms/www/default/img/icon/fc_1.png"><br>机器人服务</a></li>
        <li><a  target="_bank" href="http://www.zjdh.org:8080/vrd/webform.jsp" ><img src="http://www.zjlib.cn/r/cms/www/default/img/icon/fc_4.png"><br>在线留言</a></li>
        <li class="search2">
        <form action="/search.jspx" target="_blank" method="get">
         <input type="text" id="searchword1"  name="q" value="请输入检索词" onfocus="if(this.value=='请输入检索词')this.value=''" onblur="if(this.value=='')this.value='请输入检索词'" maxlength="50" autocomplete="off" />
         <a href="" onclick="querytj('1')" ><img src="http://www.zjlib.cn/r/cms/www/default/img/icon/fc_2.png"><br>全站搜索</a>
        </form> 
  </li>

        <li style="cursor:pointer"><a target="_blank" id="a_book" onclick = "check_book('false');"  ><img src="http://www.zjlib.cn/r/cms/www/default/img/icon/fc_3.png"><br>续借/预约</a></li>
    </ul>
</div> -->
		<div class="lg" style="display: none;">

			<div class="lg_1">
				欢迎登录浙江图书馆 <br /> <span>读者登录</span><img alt=""
					src="http://www.zjlib.cn/r/cms/www/default/img/lg.jpg" />
			</div>


			<!-- <form action="/login.jspx" id="index" method="post" name="index"> -->
			<div class="ip_1">
				<input id="username" maxlength="16" name="username"
					onblur="if (value==''){value='读者证号'};"
					onfocus="if (value=='读者证号'){value=''};" type="text" value="读者证号" />
			</div>
			<p id="p1"
				style="display: none; color: white; font-size: 12px; margin-left: 30px; color: red">用户名输入有误(用户名不能为空)！</p>
			<div class="ip_2">
				<input id="password" autocomplete="on" maxlength="16"
					name="password" type="password" value="" />
			</div>
			<p id="p2"
				style="display: none; font-size: 12px; margin-left: 30px; color: red">密码输入有误!</p>
			<p id="p3"
				style="color: white; font-size: 12px; margin-left: 30px; margin-top: 5px;">初始密码为办证时证件号码后6位，字母大写!</p>
			<div class="lg_2">
				<input id="remember" name="remember" type="checkbox"
					onchange="jizhuPass()" /> <span>记住我</span> <a href="#"
					onclick="$('.lg').fadeOut('fast'); $('.close2').fadeOut('fast'); $('.lg1').fadeIn('slow'); $('.close21').fadeIn('slow');">忘记密码？</a>
			</div>
			<input class="lg_bt" name="submit" type="button" id="submit"
				onclick="jcj()" value="登录" />

			
			<!-- <a class="lg_bt" href="javascript:void(0)" onclick="check();">登录</a> -->

			<div class="lg_3" style="display: none">
				<a href="/wdtsgyzc/index.htm">没有账号？立即注册</a>
			</div>
			<a href="javascript:void(0);"
				onclick="$('.layer').fadeOut('fast'); $('.lg').fadeOut('fast'); $('.close2').fadeOut('fast');"><img
				alt="" class="close2"
				src="http://www.zjlib.cn/r/cms/www/default/img/icon/close.png" /></a>
		</div>
		<div class="layer"
			onclick="clear_value();$('.lg2').fadeOut('slow');$('.lg_brower').fadeOut('slow');$('.lg1').fadeOut('slow');$('.dv').fadeOut('slow'); $('.layer').fadeOut('slow');$('.lg').fadeOut('slow');$('.tb').fadeOut('slow');$('.tb2').fadeOut('slow');$('.tb3').fadeOut('slow');$('.tb4').fadeOut('slow');"
			style="display:">&nbsp;</div>

		<div id="lg1" class="lg1" style="display: none;">
			<div class="lg_1">
				欢迎登录浙江图书馆<br /> <img alt=""
					src="http://www.zjlib.cn/r/cms/www/default/img/lg.jpg" />
			</div>
			<form:form method="post" action="/front_resetPassword"
				modelAttribute="frontResetPassWord">
				<div class="div_qsqsqsqs_01">

					<table cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td>读者卡号：</td>
								<td><input id="username2" name="username" type="text" /></td>
							</tr>
							<tr>
								<td>证件类型：</td>
								<td><select><option>身份证</option></select></td>
							</tr>
							<tr>
								<td>证件号码：</td>
								<td><input id="idCard2" name="idCard" type="text" /></td>
							</tr>
							<tr style="display: true;" id="rePwd_tr">
								<td></td>
								<td id="rePwd_td"><span><a
										href='javascript:void(0);'
										onclick="$('.lg1').fadeOut('fast'); $('.close21').fadeOut('fast'); $('.lg').fadeIn('slow'); $('.close2').fadeIn('slow');"
										style='color: white'>返回登陆?</a></span></td>
							</tr>

						</tbody>
					</table>

				</div>
				<input class="lg_bt" name="submit" type="submit" id="submit"
					class="loginbtn" onclick="date_form()" value="重置" />
				<!-- <a class="lg_bt" href="javascript:void(0)" onclick="date_form();">重置</a> -->
				<div class="div_qsqsqsqs_02">
					读者在遗忘密码时，可使用此功能。输入读者证号、身份证号，点击重置，密码重置成功（重置密码为办证时提供的身份证件号后六位）。
			</form:form>
		</div>
		<a href="javascript:void(0);"
			onclick="$('.layer').fadeOut('slow'); $('.lg1').fadeOut('slow'); $('.close21').fadeOut('slow');"><img
			alt="" class="close21"
			src="http://www.zjlib.cn/r/cms/www/default/img/icon/close.png"
			style="display: block;" /></a>
	</div>


	<div class="lg2" style="display: none;">
		<div class="lg_1" style="font-size: 18px">
			查询读者证号<br /> <img alt=""
				src="http://www.zjlib.cn/r/cms/www/default/img/lg.jpg" />
		</div>
		<div class="div_qsqsqsqs_01">

			<table cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>证 件 号 码：</td>
						<td>&nbsp;&nbsp;<input id="idCard1" value="" name="idCard"
							type="text" /></td>
					</tr>
					<tr>
						<td>姓
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td>&nbsp;&nbsp;<input name="fullName" type="text"
							id="fullName" maxlength="18" value="" /></td>
					</tr>
					<tr>
						<td>读 者 卡 号：</td>
						<td id="car_no" style="color: red"></td>
					</tr>
					<tr>
						<td></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="color: #FB0303; width: 500px;" id="idCard_span"> </span>
						</td>

					</tr>
				</tbody>
			</table>

		</div>

		<a class="lg_bt" href="javascript:void(0)" onclick="checkcar_no();">提交</a>
		<div class="div_qsqsqsqs_02">
			读者在输入办证时提交的有效身份证件号码及姓名，提交后即可看到读者证号显示。若仍有疑问可<a
				href="#" target="_blank">在线咨询</a>留言。
		</div>
		<a href="javascript:void(0);"
			onclick="$('.layer').fadeOut('slow'); $('.lg2').fadeOut('slow'); $('.close22').fadeOut('slow');"><img
			alt="" class="close22"
			src="http://www.zjlib.cn/r/cms/www/default/img/icon/close.png"
			style="display: block;" /></a>
	</div>

	<div class="lg_brower" id="lg_brower" style="display: none;">
		<div
			style="margin-left: 15px; color: white; margin-top: 11px; font-size: 15px;">
			<br> <img alt=""
				src="http://www.zjlib.cn/r/cms/www/default/img/lg.jpg"
				style="position: absolute; top: 0px; right: 160px;">
		</div>
		<p
			style="color: white; font-family: cursive; font-weight: bolder; margin-top: 50px; padding-left: 10px; padding-right: 8px; line-height: 20px; letter-spacing: 2px;">您的浏览器版本过低，可能会与心仪的它失之交臂，建议升级到IE9.0或以上</p>
		<a href="javascript:void(0);"
			onclick="$('.layer').fadeOut('fast'); $('.lg_brower').fadeOut('fast'); $('.close2').fadeOut('fast');"><img
			alt="" class="close2"
			src="http://www.zjlib.cn/r/cms/www/default/img/icon/close.png"></a>
		<div>

</body>