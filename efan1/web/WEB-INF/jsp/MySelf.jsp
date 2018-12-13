
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
    <link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="<%=path%>/css/style.css" type="text/css" media="all" />
    <!--// css -->
    <!-- font-awesome icons -->
    <link href="<%=path%>/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <!-- parallax -->
    <script src="<%=path%>/js/SmoothScroll.min.js"></script>
    <html>
    <head>
        <title>Title</title>
        <style type="text/css">
            #div1{
                position: relative;
                top: 20px;
                left: 500px;
                width:400px;
                height: 500px;
                border: 2px solid dodgerblue;
                overflow-y: scroll;
            }
        </style>
    </head>
<body>
<div class="banner about-bg">
    <div class="top-banner about-top-banner">
        <div class="container">
            <div class="top-banner-left">
                <ul>
                    <li><i class="fa fa-phone" aria-hidden="true"></i>登录</li>
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
                             <li><a href="<%=path%>/index3.jsp">首页</a></li>
                             <li><a href="<%=path%>/about.jsp">About</a></li>
                             <li><a href="<%=path%>/services.jsp">Services</a></li>
                             <li><a href="<%=path%>/codes.jsp">Codes</a></li>
                             <li><a href="<%=path%>/gallery.jsp">Gallery</a></li>
                             <li><a class="active" href="<%=path%>/contact.jsp">个人中心</a></li>
                            <div class="clearfix"> </div>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<div id="div1">
    <form action="<%=path%>/user/updateMySelf" method="post" enctype="multipart/form-data">
<pre>头像：<span></span>
昵称：         <input type="text" style="width: 200px;height: 30px" name="nickname"><br>
绑定手机号：    <input type="text" style="width: 200px;height: 30px" name="userphone"><br>
验证码：        <input type="text" style="width: 200px;height: 30px"><br>
出生日期：      <input type="date" style="width: 200px;height: 30px" name="birthday"><br>
星座：          <input type="text" style="width: 200px;height: 30px" name="constellation"><br>
性别：          <select style="width: 200px;height: 30px" name="usersex">
        <option value="男">男</option>
        <option value="女">女</option>
    </select><br>
所在地：        <input type="text" style="width: 200px;height: 30px" name="useraddress"><br>
喜欢的明星：    <input type="text" style="width: 200px;height: 30px;" name="userstar"><br>
个性签名：      <input type="text" style="width: 200px;height: 30px" placeholder="不超过20个字" name="usersingnature"><br>
                                 <input type="submit" style="width: 100px;height: 30px;background-color: orange" value="保存">
    </pre>
    </form>
</div>
</body>
</html>
