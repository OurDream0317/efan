
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
<title>About</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- parallax -->
	<script src="js/SmoothScroll.min.js"></script>
	<script src="js/jarallax.js"></script>
	<!-- //parallax -->
</head>
<body>
	<!-- banner -->
	<div class="banner about-bg">
		<div class="top-banner about-top-banner">
			<div class="container">
				<div class="top-banner-left">
					<ul>
						<li><i class="fa fa-phone" aria-hidden="true"></i> +1 234 567 8901</li>
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
								<li><a class="active" href="about.jsp">About</a></li>
								<li><a href="services.jsp">Services</a></li>
								<li><a href="codes.jsp">Codes</a></li>
								<li><a href="gallery.jsp">Gallery</a></li>
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
				<h2>About Us</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta efficitur ante quis volutpat.</p>
			</div>
			<div class="agileits-a-about-grids">
				<div class="col-md-5 agileits-a-about-left">
					<img src="images/a1.jpg" alt="" />
				</div>
				<div class="col-md-7 agileits-a-about-right">
					<h3>A few words about us</h3>
					<h4>Praesent et aliquam erat, in pellentesque erat. Nulla massa nisl, vulputate nec urna vel, sagittis rhoncus leo. Donec pharetra congue tellus sed fringilla. Aliquam tellus est, mattis id nulla at, placerat bibendum velit. </h4>
					<p>Fusce tincidunt vitae purus in interdum. Sed mattis erat vitae nunc dignissim, a facilisis elit porta. Nam a dui id magna tempus tempor. Mauris vel nunc nec ante semper facilisis a sit amet dolor. Aliquam viverra ex felis, consequat condimentum augue ultrices vel. Pellentesque sed nibh ac diam tempor fringilla sit amet a tortor. Praesent sodales sapien turpis.
						<span>Maecenas vestibulum rhoncus rhoncus. Pellentesque ullamcorper consectetur elit sit amet rhoncus. Maecenas lobortis est vel odio volutpat laoreet. Praesent pharetra interdum lorem, eleifend ullamcorper sapien mattis efficitur. Phasellus sed nisi ultrices, sodales enim non, ullamcorper sapien. Nullam mollis tempus mauris in vulputate.</span>
					</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //a-about -->
	<!-- different -->
	<div class="jarallax different">
		<div class="container">
			<div class="w3-different-heading">
				<h3>Why we are different</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta efficitur ante quis volutpat.</p>
			</div>
			<div class="w3agile-different-info">
				<p>Cras vehicula massa id ipsum venenatis, non convallis libero pellentesque. Sed tristique massa et mattis mattis. Nunc euismod consequat ex, eu tincidunt justo malesuada vitae. Sed auctor diam quis nulla hendrerit porta. Quisque venenatis, tortor quis tristique congue, lorem lectus elementum augue, in laoreet lorem justo lacinia velit. Phasellus tempus luctus velit, eu fermentum arcu porttitor sit amet. Suspendisse id efficitur sem. Donec laoreet ante at facilisis dictum. Donec sodales porta orci sed porta. Vivamus est enim, pharetra sit amet placerat ut, eleifend quis purus. Sed elementum tortor erat, placerat rutrum augue facilisis vel. Morbi feugiat tortor erat, nec gravida mauris egestas tincidunt. Sed vitae dignissim sapien.</p>
				<div class="w3agile-button">
					<a href="single.jsp">Read More</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        /* init Jarallax */
        $('.jarallax').jarallax({
            speed: 0.5,
            imgWidth: 1366,
            imgHeight: 768
        })
    </script>
	<!-- //different -->
	<!-- team -->
	<div class="team">
		<div class="container">
			<div class="agileinfo-team-heading">
				<h3>Our Team</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta efficitur ante quis volutpat.</p>
			</div>
			<div class="team-grids">
				<div class="col-md-3 agileinfo-team-grid">
					<img src="images/t1.jpg" alt="" />
					<div class="captn">
						<h4>Mary Jane</h4>
						<p>Vestibulum </p>
						<div class="w3l-social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileinfo-team-grid">
					<img src="images/t2.jpg" alt="" />
					<div class="captn">
						<h4>Peter Parker</h4>
						<p>Aliquam non</p>
						<div class="w3l-social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileinfo-team-grid">
					<img src="images/t3.jpg" alt="" />
					<div class="captn">
						<h4>Johan Botha</h4>
						<p>Nulla molestie</p>
						<div class="w3l-social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileinfo-team-grid">
					<img src="images/t4.jpg" alt="" />
					<div class="captn">
						<h4>Steven Wilson</h4>
						<p>Quisque vitae</p>
						<div class="w3l-social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //team -->
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