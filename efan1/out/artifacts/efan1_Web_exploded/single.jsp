
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
								<li><a href="about.jsp">About</a></li>
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
	<!-- blog -->
		<div class="blog">
				<!-- container -->
				<div class="container">
					<div class="col-md-8 blog-top-left-grid">
						<div class="left-blog left-single">
							<div class="blog-left">
								<div class="single-left-left">
									<p>Posted By <a href="#">Admin</a> &nbsp;&nbsp; on June 2, 2016 &nbsp;&nbsp; <a href="#">Comments (10)</a></p>
									<img src="images/g9.jpg" alt="" />
								</div>
								<div class="blog-left-bottom">
									<P>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed blandit massa vel mauris sollicitudin 
										dignissim. Phasellus ultrices tellus eget ipsum ornare molestie scelerisque eros dignissim. Phasellus 
										fringilla hendrerit lectus nec vehicula. ultrices tellus eget ipsum ornare consectetur adipiscing elit.Sed blandit .
									</P>
								</div>
								<div class="blog-left-bottom left-bottom">
									<P>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed blandit massa vel mauris sollicitudin 
										dignissim. Phasellus ultrices tellus eget ipsum ornare molestie scelerisque eros dignissim. Phasellus 
										fringilla hendrerit lectus nec vehicula. ultrices tellus eget ipsum ornare consectetur adipiscing elit.Sed blandit .
									</P>
								</div>
								<div class="blog-left-bottom left-bottom">
									<P>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed blandit massa vel mauris sollicitudin 
										dignissim. Phasellus ultrices tellus eget ipsum ornare molestie scelerisque eros dignissim. Phasellus 
										fringilla hendrerit lectus nec vehicula. ultrices tellus eget ipsum ornare consectetur adipiscing elit.Sed blandit .
									</P>
								</div>
							</div>
							<div class="response">
								<h3>Responses</h3>
								<div class="media response-info">
									<div class="media-left response-text-left">
										<a href="#">
											<img class="media-object" src="images/t1.jpg" alt="">
										</a>
										<h5><a href="#">Admin</a></h5>
									</div>
									<div class="media-body response-text-right">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
											sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										<ul>
											<li>June 21, 2016</li>
											<li><a href="single.jsp">Reply</a></li>
										</ul>
										<div class="media response-info">
											<div class="media-left response-text-left">
												<a href="#">
													<img class="media-object" src="images/t2.jpg" alt="">
												</a>
												<h5><a href="#">Admin</a></h5>
											</div>
											<div class="media-body response-text-right">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
													sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
												<ul>
													<li>June 21, 2016</li>
													<li><a href="single.jsp">Reply</a></li>
												</ul>		
											</div>
											<div class="clearfix"> </div>
										</div>
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="media response-info">
									<div class="media-left response-text-left">
										<a href="#">
											<img class="media-object" src="images/t3.jpg" alt="">
										</a>
										<h5><a href="#">Admin</a></h5>
									</div>
									<div class="media-body response-text-right">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
											sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										<ul>
											<li>June 21, 2016</li>
											<li><a href="single.jsp">Reply</a></li>
										</ul>		
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
							
							<div class="opinion">
								<h2>Leave Your Comment</h2>
								<form action="#" method="post">
									<input type="text" name="Name" placeholder="Name" required="">
									<input type="text" name="Email" placeholder="Email" required="">
									<textarea name="Message" placeholder="Message" required=""></textarea>
									<input type="submit" value="SEND">
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4 blog-top-right-grid">
						<div class="categories">
							<h3>Categories</h3>
							<ul>
								<li><a href="#">Phasellus sem leo, interdum quis risus</a></li>
								<li><a href="#">Nullam egestas nisi id malesuada aliquet </a></li>
								<li><a href="#"> Donec condimentum purus urna venenatis</a></li>
								<li><a href="#">Ut congue, nisl id tincidunt lobor mollis</a></li>
								<li><a href="#">Cum sociis natoque penatibus et magnis</a></li>
								<li><a href="#">Suspendisse nec magna id ex pretium</a></li>
							</ul>
						</div>
						<div class="categories">
							<h3>Archive</h3>
							<ul class="marked-list offs1">
								<li><a href="#">May 2016 (7)</a></li>
								<li><a href="#">April 2016 (11)</a></li>
								<li><a href="#">March 2016 (12)</a></li>
								<li><a href="#">February 2016 (14)</a> </li>
								<li><a href="#">January 2016 (10)</a></li>    
								<li><a href="#">December 2016 (12)</a></li>
								<li><a href="#">November 2016 (8)</a></li>
								<li><a href="#">October 2016 (7)</a> </li>
								<li><a href="#">September 2016 (8)</a></li>
								<li><a href="#">August 2016 (6)</a></li>                          
							</ul>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!-- //container -->
		</div>
		<!-- //blog -->
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