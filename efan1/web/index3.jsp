
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>E娱平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="<%=path%>/css/style.css" type="text/css" media="all" />
<!--// css -->
<link rel="stylesheet" href="<%=path%>/css/ken-burns.css">
<!-- font-awesome icons -->
<link href="<%=path%>/css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- font -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>


	<script style="text/javascript">

		$(function(){
			/*get请求轮播图，*/
			$.get("<%=path%>/slide/fontselectslide",{"slidelocation":0},function(data){
				/*console.log(data);*/
				console.log(data[0].slideimg);
				console.log(data[1].slideimg);
				var html="";
				/*html += "<td>" + data[i].proname + "</td>";*/
				html += "<div class='item active'><div class='slider' style=' background: url(<%=basePath%>" + data[0].slideimg + ") no-repeat 0px 0px; background-size: 100% 100%;min-height: 800px;'></div></div>";
				//$("#item11").append(html);
				for(var i = 1; i < data.length; i++ ) {
					console.log(data[i].slideimg);
					html += "<div class='item'><div class='slider' style=' background: url(<%=basePath%>" + data[i].slideimg + ") no-repeat 0px 0px; background-size:100% 100%;min-height: 800px;'></div></div>";
				}
				$("#item11").append(html);

			});
			//第二个请求，查询人气最高的4位明星
			$.get("<%=path%>/star/fontselecthot",function(data){
				console.log(data);

				var html="";
				for(var i = 0; i < data.length; i++ ){
					console.log(data[i].staricom)
			html+="	<div class='col-md-3 about-grid'> <div class='about-grid-info effect-1' style='background: url(<%=basePath%>"+data[i].staricom +")no-repeat 0px 0px; background-size: 100% 100%;min-height: 255px;'> <h4>"+data[i].starname +"</h4></div></div>";
				}
				$("#about11").append(html);
			});

			//第三个请求，查询一个演出
			$.get("<%=path%>/show/fontselectshow",function(data){
				console.log(data);

				var html="";
				//html+="	<h3 STYLE='margin-left: auto;margin-right: auto'>精品演出</h3>";
				for(var i = 0; i < data.length; i++){
				html +="<div class='container' style='width: 24%;height: auto; float: left;'  >"+
				"<div class='wthree-offer-grid' style=' background: url(<%=basePath%>"+data[i].showicon+") no-repeat 0px 0px;background-size:100% 100%;min-height: 385px;box-shadow: 0 -1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);text-align:center;'>"+
				"<h4 style='font-size: 20px'>"+data[i].showstar +"</h4> <p> "+ data[i].showtitle +"</p> <div class='click-button'><br><br><br><br><br><br> <br><br><br><a href='#'>点击查看</a> </div> </div> </div>";
				}
				$("#ofer11").append(html);
			});


			//第四个请求，请求新闻，返回新闻列表，添加到页面上
			$.get("<%=path%>/news/fontselectnews",{"newsnumber":"1"},function(data) {
				console.log(data);
				var html="";

				for(var i = 0; i < data.length; i++ ){
				html+=	"<div class='col-md-4 news-grid' style='width: 25%;height: auto'> <div class='agile-news-grid-info'> <div class='news-grid-info-img'>"+
								<!--图片-->
							"<a href='<%=basePath%>news/fontselectnewsbyid?newsid="+ data[i].newsid+"'><img style='width: 200px;height: 220px;' src='<%=basePath%>"+data[i].newsimg +"' alt='图片走丢了' /></a> </div>"+
							"<div class='news-grid-info-bottom'>"+
							"<div class='date-grid'>"+
							"<div class='admin'>"+
							"<a href='#'><i class='fa fa-user' aria-hidden='true'></i>平台发布</a> </div>"+
							"<div class='time'>"+
							"<p><i class='fa fa-calendar' aria-hidden='true'></i>"+data[i].newstime +"</p></div>"+
							"<div class='clearfix'> </div> </div>"+
							"<div class='news-grid-info-bottom-text'>"+
							"<a href='<%=path%>/single.jsp'>"+ data[i].newstitle+"</a>"+
							"<p> 暂无</p></div> </div> </div> </div>";
				}

				$("#news123").append(html);

			});


		});

	</script>
















</head>
<body>
	<!-- banner -->
	<div class="banner">
		<div class="top-banner">
			<div class="container">
				<div class="top-banner-left">
					<ul>
						<li><a href="<%=basePath%>fontLogin.jsp">登录</a>&nbsp;&nbsp;&nbsp;${user.nickname}:您好</li>
						<li><a href="mailto:example@email.com"><i class="fa fa-envelope" aria-hidden="true"></i> 给我们的意见</a></li>
					</ul>
				</div>
				<div class="top-banner-right">
					<ul>
						<li><a class="facebook" href="#"> <!--<i class="fa fa-facebook" aria-hidden="true"></i>-->   </a></li>
						<li><a class="facebook" href="#"> <!--<i class="fa fa-twitter" aria-hidden="true"></i>-->   </a></li>
						<li><a class="facebook" href="#"><!-- <i class="fa fa-dribbble" aria-hidden="true"></i> -->  </a></li>
						<li><a class="facebook" href="#"> <!--<i class="fa fa-google-plus" aria-hidden="true"></i>-->   </a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="header">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="<%=path%>/index3.jsp">E 娱</a>
					</h1>
				</div>
				<div class="top-nav">
					<nav class="navbar navbar-default">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">菜单
							</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a class="active" href="<%=path%>/index3.jsp">首页</a></li>
								<li><a href="<%=path%>/about.jsp">商品</a></li>
								<li><a href="<%=path%>/services.jsp">娱乐新闻和演出</a></li>
								<li><a href="<%=path%>/product/return1">我们的明星</a></li>
								<li><a href="<%=path%>/contact.jsp">个人中心</a></li>
							</ul>	
						</div>	
					</nav>		
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!--轮播图-->
	<div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
            <!-- Wrapper for Slides -->
            <div class="carousel-inner" role="listbox" id="item11">
                <!-- 第一张-->
               <%-- <div class="item active" id="item">
					<div class="slider" style=" background: url(images/8.jpg) no-repeat 0px 0px; background-size: cover;min-height: 800px;">
						<!--<div class="carousel-caption kb_caption slider-grid">
							<h3></h3>
							<p></p>
						</div>-->
					</div>
                </div>--%>

                <!-- 第二张-->
               <%-- <div class="item" id="item2">
					<div class="slider slider1" style=" background: url(images/7.jpg) no-repeat 0px 0px; background-size: cover; min-height: 800px;">
						<!--<div class="carousel-caption kb_caption kb_caption_right slider-grid">
							<h3>Hawaii</h3>
							<p>Vivamus vel nulla venenatis, tincidunt mi vel, consequat erat.</p>
						</div>-->
					</div>
                </div>--%>
				<!--第三张-->
				<%--<div class="item" id="item3">
				<div class="slider slider1" style=" background: url(images/4.jpg) no-repeat 0px 0px; background-size: cover; min-height: 800px;">
					<!--<div class="carousel-caption kb_caption kb_caption_right slider-grid">
                        <h3>Hawaii</h3>
                        <p>Vivamus vel nulla venenatis, tincidunt mi vel, consequat erat.</p>
                    </div>-->
				</div>
			</div>--%>

                <!-- 第四张 -->
              <%--  <div class="item" id="item4">
					<div class="slider slider2" style=" background: url(images/3.jpg) no-repeat 0px 0px; background-size: cover; min-height: 800px;">
						<!--<div class="carousel-caption kb_caption kb_caption_center slider-grid">
						   <h3>Hong Kong</h3>
							<p>Nunc turpis purus, vestibulum at quam ac, feugiat dignissim nunc</p>
						</div>-->
					</div>
                </div>--%>
				<!--第五张-->
				<%--<div class="item" id="item5">
					<div class="slider slider2" style=" background: url(images/2.jpg) no-repeat 0px 0px; background-size: cover; min-height: 800px;">
						<!--<div class="carousel-caption kb_caption kb_caption_center slider-grid">
						   <h3>Hong Kong</h3>
							<p>Nunc turpis purus, vestibulum at quam ac, feugiat dignissim nunc</p>
						</div>-->
					</div>
				</div>--%>

            </div>
            <!-- Navigation Buttons -->
            <!-- Left Button -->
            <a class="left carousel-control kb_control_left" href="#kb" role="button" data-slide="prev">
                <span class="fa fa-angle-left kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <!-- Right Button -->
            <a class="right carousel-control kb_control_right" href="#kb" role="button" data-slide="next">
                <span class="fa fa-angle-right kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
    </div> 
	<!-- about -->
	<div class="about">
		<div class="container">
			<div class="w3l-about-heading">
				<h2>明星Top4</h2>
				<p>人气最高的四位明星</P>
			</div>
			<div class="about-grids" id="about11">
				<%--<div class="col-md-3 about-grid">
					<div class="about-grid-info effect-1" style="background: url(images/g3.jpg)no-repeat 0px 0px; background-size: cover;min-height: 255px;">
						<h4>NO.1</h4>
					</div>
				</div>
				<div class="col-md-3 about-grid">
					<div class="about-grid-info about-grid-info1 effect-1" style="background: url(images/g4.jpg)no-repeat 0px 0px;background-size: cover;min-height: 255px;">
						<h4>No.2</h4>
					</div>
				</div>
				<div class="col-md-3 about-grid">
					<div class="about-grid-info about-grid-info2 effect-1" style="background: url(images/g5.jpg)no-repeat 0px 0px;background-size: cover;min-height: 255px;">
						<h4>No.3</h4>
					</div>
				</div>
				<div class="col-md-3 about-grid">
					<div class="about-grid-info about-grid-info3 effect-1" style="background: url(images/g6.jpg)no-repeat 0px 0px;background-size: cover;min-height: 255px;">
						<h4>No.4</h4>
					</div>
				</div>--%>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //about -->
	<!--<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>-->
	<!-- offer -->


	<div class="offer" id="ofer11" style="width: 100%;height: auto;float:left">
		<div class="w3l-about-heading">
			<h2>演出Top4</h2>
			<p>人气最高的四场演出</P>
		</div>
		<%--<div class="container">
			<div class="wthree-offer-grid" style=" background: url(images/o1.jpg) no-repeat 0px 0px;
    background-size: cover;min-height: 385px;
	box-shadow: 0 -1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);
	text-align:center;">
				<h4>特别的演出</h4>
				<p> 刘德华全国巡回演唱会</p>
				<div class="click-button">
					<a href="#">点击查看</a>
				</div>
			</div>
		</div>--%>
	</div>
	<!-- //offer -->
	<!-- news -->
	<div class="news">
		<div class="container">
			<div class="news-heading">
				<h3>推荐新闻</h3>
				<p>热点快讯，快速浏览</p>
			</div>    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="<%=basePath%>NewsAll.jsp">全部新闻</a>
			<div class="news-grids" id="news123">
				<%--<div class="col-md-4 news-grid">
					<div class="agile-news-grid-info">
						<div class="news-grid-info-img">
							<!--图片-->
							<a href="single.jsp"><img src="images/n1.jpg" alt="" /></a>
						</div>
						<div class="news-grid-info-bottom">
							<div class="date-grid">
								<div class="admin">
									<a href="#"><i class="fa fa-user" aria-hidden="true"></i>发布人</a>
								</div>
								<div class="time">
									<p><i class="fa fa-calendar" aria-hidden="true"></i>发布时间</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-text">
								<a href="single.jsp">新闻标题</a>
								<p> 新闻简介</p>
							</div>
						</div>
					</div>
				</div>--%>
				<!--<div class="col-md-4 news-grid">
					<div class="agile-news-grid-info">
						<div class="news-grid-info-img">
							<a href="single.jsp"><img src="images/n2.jpg" alt="" /></a>
						</div>
						<div class="news-grid-info-bottom">
							<div class="date-grid">
								<div class="admin">
									<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Admin</a>
								</div>
								<div class="time">
									<p><i class="fa fa-calendar" aria-hidden="true"></i> May 09,2016</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-text">
								<a href="single.jsp">Quisque gravida, nunc eu interdum porta</a>
								<p>Aliquam erat volutpat. Duis vulputate tempus laoreet. Integer viverra eleifend neque, eget dictum lectus. Quisque eu tempor dolor.</p>
							</div>
						</div>
					</div>
				</div>-->
				<!--<div class="col-md-4 news-grid">
					<div class="agile-news-grid-info">
						<div class="news-grid-info-img">
							<a href="single.jsp"><img src="images/n3.jpg" alt="" /></a>
						</div>
						<div class="news-grid-info-bottom">
							<div class="date-grid">
								<div class="admin">
									<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Admin</a>
								</div>
								<div class="time">
									<p><i class="fa fa-calendar" aria-hidden="true"></i> May 09,2016</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-text">
								<a href="single.jsp">Quisque gravida, nunc eu interdum porta</a>
								<p>Aliquam erat volutpat. Duis vulputate tempus laoreet. Integer viverra eleifend neque, eget dictum lectus. Quisque eu tempor dolor.</p>
							</div>
						</div>
					</div>
				</div>-->
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //news -->
	<!-- footer -->
	<!--<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>Address</h4>
					</div>
					<div class="footer-grid-info">
						<p>Eiusmod Tempor inc
							<span>St Dolore Place,Kingsport 56777.</span>
						</p>
						<p class="phone">Phone : +1 123 456 789
							<span>Email : <a href="mailto:example@email.com">mail@example.com</a></span>
						</p>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>Navigation</h4>
					</div>
					<div class="footer-grid-info">
						<ul>
							<li><a href="about.jsp">About</a></li>
							<li><a href="services.jsp">Services</a></li>
							<li><a href="gallery.jsp">Gallery</a></li>
							<li><a href="contact.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>Follow</h4>
					</div>
					<div class="social">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-rss"></i></a></li>
							<li><a href="#"><i class="fa fa-vk"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>Newsletter</h4>
					</div>
					<div class="footer-grid-info">
						<form action="#" method="post">
							<input type="email" id="mc4wp_email" name="EMAIL" placeholder="Enter your email here" required="">
							<input type="submit" value="Subscribe">
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="copyright">
				<p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
		</div>
	</div>-->
	<!-- //footer -->
	<script src="<%=path%>/js/SmoothScroll.min.js"></script>
</body>	
</html>