
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
    <title>新闻页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css" media="all" />
    <!--// css -->
    <link rel="stylesheet" href="<%=basePath%>css/ken-burns.css">
    <!-- font-awesome icons -->
    <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.js"></script>
    <!-- parallax -->
    <script src="<%=basePath%>js/SmoothScroll.min.js"></script>
    <script src="<%=basePath%>js/jarallax.js"></script>
    <!-- //parallax -->
    <script style="text/javascript">
        $(function(){
            //第四个请求，请求新闻，返回新闻列表，添加到页面上
            $.get("news/fontselectnews",{"newsnumber":"2"},function(data) {
                console.log(data);
                var html="";
                var index=0;
                for(var y = 0; y< data.length; y+=4 ) {
                    html+="<br>";

                    for (var i = 0; i < 4; i++) {
                        console.log(index);
                        html += "<div class='col-md-4 news-grid' style='width: 25%;height: auto'> <div class='agile-news-grid-info'> <div class='news-grid-info-img'>" +
                                    <!--图片-->
                                "<a href='<%=basePath%>news/fontselectnewsbyid?newsid="+ data[i].newsid+"'><img style='width: 200px;height: 220px;' src='" + data[index].newsimg + "' alt='图片走丢了' /></a> </div>" +
                                "<div class='news-grid-info-bottom'>" +
                                "<div class='date-grid'>" +
                                "<div class='admin'>" +
                                "<a href='#'><i class='fa fa-user' aria-hidden='true'></i>平台发布</a> </div>" +
                                "<div class='time'>" +
                                "<p><i class='fa fa-calendar' aria-hidden='true'></i>" + data[index].newstime + "</p></div>" +
                                "<div class='clearfix'> </div> </div>" +
                                "<div class='news-grid-info-bottom-text'>" +
                                "<a href='single.jsp'>" + data[index].newstitle + "</a>" +
                                "<p> 暂无</p></div> </div> </div> </div>";
                        index++;
                        if(index>=data.length){
                            break;
                        }
                    }


                }
                $("#news123").append(html);

            });
        });

    </script>
</head>
<body>
<!-- banner -->
<div class="banner about-bg">
    <div class="top-banner about-top-banner">
        <div class="container">
            <div class="top-banner-left">
                <ul>
                    <li><a href="<%=basePath%>fontLogin.jsp">登录</a>${user.nickname}:您好</li>
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
                            <li><a class="active" href="<%=basePath%>index3.jsp">首页</a></li>
                            <li><a href="about.jsp">商品</a></li>
                            <li><a href="services.jsp">娱乐新闻和演出</a></li>
                            <li><a href="codes.jsp">占时不用</a></li>
                            <li><a href="gallery.jsp">我们的明星</a></li>
                            <li><a href="contact.jsp">个人中心</a></li>
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
<!--轮播图编写 -->
<%--
<div id="pic">
    <div>
        &lt;%&ndash;<img src="../image/scroll_01.jpg">
        <img src="../image/scroll_02.jpg">
        <img src="../image/scroll_03.jpg">
        <img src="../image/scroll_04.jpg">&ndash;%&gt;
    </div>
    <div>
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
    </div>
</div>
--%>


<div class="news">
    <div class="container">
        <div class="news-heading">
            <h3>推荐新闻</h3>
            <p>热点快讯，快速浏览</p>
        </div>
        <div class="news-grids" id="news123">



            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<!--//short-codes-->
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