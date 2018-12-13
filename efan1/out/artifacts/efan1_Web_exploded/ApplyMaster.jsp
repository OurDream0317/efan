
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
    <title>个人中心</title>
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


    <script type="text/javascript">
        $(function(){
            $("#li1").click(function(){
                $("#div1").style("disable",block);
            });
        });

    </script>
    <style>
        .head{
            position: relative;
            top: 40px;
            left: 500px;
            width: 500px;
            height: 500px;
            border: 2px solid dodgerblue;
            background-image: url("image/zyxDemo.jpg");
            background-size:500px;
        }
        #div11{
            position: relative;
            top: 40px;
            left: 500px;
            width: 500px;
            height: 120px;
            border: 2px solid dodgerblue;
            background-size:500px;
        }
        #div1{
            position: relative;
            left: 0px;
            top: 0px;
            width: 100px;
            height: 100px;

        }
        #div2{
            position: absolute;
            right: 0px;
            top: 0px;
            width: 380px;
            height: 120px;
            background-color: #2e6da4;
        }

    </style>
    <!-- //parallax -->
</head>
<body>
<!-- banner -->
<div class="banner about-bg">
    <div class="top-banner about-top-banner">
        <div class="container">
            <div class="top-banner-left">
                <ul>
                    <li><a href="<%=basePath%>fontLogin.jsp">登录</a>&nbsp;&nbsp;&nbsp;${user.nickname}:您好</li>
                    <li><a href="mailto:example@email.com"><i class="fa fa-envelope" aria-hidden="true"></i> 给我们的意见</a></li>
                </ul>
            </div>
            <div class="top-banner-right">
                <ul>
                    <li><a class="facebook" href="#"><%--<i class="fa fa-facebook" aria-hidden="true"></i>--%></a></li>
                    <li><a class="facebook" href="#"><%--<i class="fa fa-twitter" aria-hidden="true"></i>--%></a></li>
                    <li><a class="facebook" href="#"><%--<i class="fa fa-dribbble" aria-hidden="true"></i>--%></a></li>
                    <li><a class="facebook" href="#"><%--<i class="fa fa-google-plus" aria-hidden="true"></i>--%></a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="header">
        <div class="container">
            <div class="logo">
                <h1>
                    <a href="index3.jsp">E 娱</a>
                </h1>
            </div>
            <div class="top-nav">
                <nav class="navbar navbar-default">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu
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
<!-- contact -->
<div id="div11">
    <div id="div1">
        <img src="<%=path%>/image/5.jpeg" style="width: 120px;height: 120px">
    </div>
    <div id="div2">
			<pre><span></span><br>星座：<span></span>           本命英雄：<span></span><br>个性签名：<span></span><br>粉丝：<span></span>           关注：<span></span>
				<a href="<%=path%>/order/my"><span>修改</span></a></pre>
    </div>
</div>
<div class="head">

</div>
<!-- //contact -->
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