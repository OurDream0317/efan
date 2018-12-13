
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
    <title>站长主页</title>
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
            /*这是站长主页面，后台判断是站长的时候返回这个页面，通过ajax请求，查询商品*/
            var masterid=${master.masterid};
            var userphone=${user1.userphone};
            //通过用户账号查询该用户发布的产品信息
            $.get("<%=basePath%>product/selectMasterByphone",{"userphone":userphone},function(data){
                console.log(data);
                var html="";
                var index=0;
                for(var y = 0; y< data.length; y+=2 ) {
                    html+="<br>";

                    for (var i = 0; i < 2; i++) {
                        console.log(index);
                        html += " <div style='margin-left: 20px;margin-bottom:20px;width: 400px;float: left;'>"+
                        "<a href='<%=basePath%>master/masterProductdetail?proid="+data[index].proid+"'><img src='<%=basePath%>"+data[index].proicon+"' style='width:400px; height: 230px;'></a><br>"+
                                "<span style='margin-left: 50px;'>商品名:"+data[index].proname+"</span><br>"+
                                "<span style='margin-left: 50px;color: red'>￥150</span><span style='margin-left: 230px;'>销量："+data[index].prosale+"</span></div>";
                        index++;
                        if(index>=data.length){
                            break;
                        }
                    }


                }
                $("#table").append(html);
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
                    <li><i class="fa fa-phone" aria-hidden="true"></i> 登录</li><li>你好：${master.mastername}</li>
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
<%--用户点击站长特权，跳转到controller处理，先查询用户的删除状态，0代删除，1代表普通用户2代表站长3代表审核状态,4审核失败，
    如果是2代表是站长，跳转到站长的主页面，如果是1跳转到站长的申请页面，如果是3则查询master表，将申请填写的数据返回给页面，如果是4审核失败，返回master数据并显示从新提交--%>
<%--z站长主页--%>
<div style="width:60%; height:600px; margin-left: auto;margin-right: auto;background: #c0c0c0;overflow-y: auto;">
   <a href="<%=basePath%>masterProduct.jsp"> <input type="button" value="新增商品" style="width: 90px;height: 45px;margin-left: 20px;"></a>
    <ul class="nav navbar-nav">
        <li><a href="<%=basePath%>master/findmaster?userid=${user1.userid}">商品管理</a></li>
        <li><a href="#">订单管理</a></li>
    </ul><br><br>
    <div id="table">
        <%--<div style="margin-left: 20px;margin-bottom:20px;width: 400px;float: left;">
            <a href="#"><img src="<%=basePath%>image/101.jpg" style="width:400px; height: auto"></a><br>
           <span style="margin-left: 50px;">商品名</span><br>
             <span style="margin-left: 50px;color: red">￥150</span><span style="margin-left: 230px;">销量：</span>
        </div>
        <div style="margin-left: 20px;margin-bottom:20px;width: 400px;float: left;">
            <a href="#"><img src="<%=basePath%>image/101.jpg" style="width:400px; height: auto"></a><br>
            <span style="margin-left: 50px;">商品名</span><br>
            <span style="margin-left: 50px;color: red">￥150</span><span style="margin-left: 230px;">销量：</span>
        </div>
        <div style="margin-left: 20px;margin-bottom:20px;width: 400px;float: left;">
            <a href="#"><img src="<%=basePath%>image/101.jpg" style="width:400px; height: auto"></a><br>
            <span style="margin-left: 50px;">商品名</span><br>
            <span style="margin-left: 50px;color: red">￥150</span><span style="margin-left: 230px;">销量：</span>
        </div>
        <div style="margin-left: 20px;margin-bottom:20px;width: 400px;float: left;">
            <a href="#"><img src="<%=basePath%>image/101.jpg" style="width:400px; height: auto"></a><br>
            <span style="margin-left: 50px;">商品名</span><br>
            <span style="margin-left: 50px;color: red">￥150</span><span style="margin-left: 230px;">销量：</span>
        </div>--%>

    </div>



</div>






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