
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
<title>Gallery:: w3layouts</title>
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
<!-- font-awesome icons -->
<link href="<%=path%>/css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- gallery -->
<link href='<%=path%>/css/simplelightbox.min.css' rel='stylesheet' type='text/css'>
<!-- //gallery -->
<!-- font -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<!-- parallax -->
<script src="<%=path%>/js/SmoothScroll.min.js"></script>
<!-- //parallax -->
</head>
<body>
	<!-- banner -->
	<div class="banner about-bg">
		<div class="top-banner about-top-banner">
			<div class="container">
				<div class="top-banner-left">
					<ul>
						<li><i class="fa fa-phone" aria-hidden="true"></i> 用户名:${user.nickname}</li>
						<li><a href="mailto:example@email.com"><i class="fa fa-envelope" aria-hidden="true"></i> mail@example.com</a></li>
					</ul>
				</div>
				<div class="top-banner-right">
					<ul>
						<li><a class="facebook" href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a class="facebook" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a class="facebook" href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						<li><a class="facebook" href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="header">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="index3.jsp">My Trip</a>
					</h1>
				</div>
				<div class="top-nav">
					<nav class="navbar navbar-default">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu						
							</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="index3.jsp">Home</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="services.jsp">Services</a></li>
								<li><a href="codes.jsp">Codes</a></li>
								<li><a class="active" href="gallery.jsp">商品简介</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								<div class="clearfix"> </div>
							</ul>	
						</div>	
					</nav>		
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!-- a-about -->
	<div class="a-grid">
		<div class="container">
			<div class="w3l-about-heading">
				<h2>Our Product11胡大帅11</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta efficitur ante quis volutpat.</p>
			</div>
			<br><a href="../perimeter.jsp" style="float:right">搜索商品</a><br>
			<c:forEach items="${product2}" var="p">
			<%--&lt;%&ndash;<div class="gallery">	&ndash;%&gt;
				<div class="gallery-bg">
					<div class="gallery-bg-text effect-2">--%>
				<a>发布人:${p.properson}</a><br>
					<tr>	<a href="<%=path%>/product/return?proname=${p.proname}" class="big"><img style="height: 600px;width: 1200px" src="<%=basePath%>${p.proicon}" alt="" title="${p.proname}" /></a></tr>
				<p>${p.proname}</p>
						<a style="left: 50px">价格:${p.proprice}</a>
						<a style="right: 50px">销量:${p.prosale}</a>
				<%--<input type="button" value="加入购物车" style="color: red" id="first" onclick="po(${p.proname})">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button"  value="立即购买" style="color: red">--%>
				<br><br><br>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="clearfix"></div>--%>
			<%--</div>--%>
			</c:forEach>
			<%--	<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g2.jpg"><img src="images/g2.jpg" alt="" title="Donec dictum nisi sit amet ex volutpat interdum."/></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g3.jpg"><img src="images/g3.jpg" alt="" title="Ut dignissim ipsum dolor, in scelerisque neque commodo sit amet."/></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g4.jpg"><img src="images/g4.jpg" alt="" title="Nulla molestie nulla et dolor commodo pharetra."/></a>
					</div>
				</div>
				<div class="clearfix"></div>
				
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g5.jpg"><img src="images/g5.jpg" alt="" title="Maecenas aliquam nec arcu at efficitur. Praesent cursus aliquam erat a commodo."/></a>
					</div>
				</div>
				<div class="gallery-bg">
					<div class="gallery-bg-text effect-2">
						<a href="images/g7.jpg" class="big"><img src="images/g7.jpg" alt="" title="Maecenas aliquam nec arcu at efficitur. Praesent cursus aliquam erat a commodo." /></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g6.jpg"><img src="images/g6.jpg" alt="" title="Maecenas aliquam nec arcu at efficitur."/></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g8.jpg"><img src="images/g8.jpg" alt="" title="Nulla molestie nulla et dolor commodo pharetra."/></a>
					</div>
				</div>
				<div class="clearfix"></div>
				
				<div class="gallery-bg">
					<div class="gallery-bg-text effect-2">
						<a href="images/g9.jpg" class="big"><img src="images/g9.jpg" alt="" title="Maecenas aliquam nec arcu at efficitur. Praesent cursus aliquam erat a commodo." /></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g2.jpg"><img src="images/g2.jpg" alt="" title="Maecenas aliquam nec arcu at efficitur. Praesent cursus aliquam erat a commodo."/></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g5.jpg"><img src="images/g5.jpg" alt="" title="Maecenas aliquam nec arcu at efficitur."/></a>
					</div>
				</div>
				<div class="gallery-small gallery-middle">
					<div class="gallery-small-text effect-3">
						<a href="images/g6.jpg"><img src="images/g6.jpg" alt="" title="Nulla molestie nulla et dolor commodo pharetra."/></a>
					</div>
				</div>--%>

			<script type="text/javascript" src="js/simple-lightbox.js"></script>
			<script>
				$(function(){
					function po(s){

					}
				});
			</script>
		</div>
	</div>
	<!-- //a-about -->
	<!-- footer -->
	<div class="footer">
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
	</div>
	<!-- //footer -->
</body>	
</html>