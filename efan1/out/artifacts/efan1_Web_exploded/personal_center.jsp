<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <link href="<%=path%>/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>

    <link href="<%=path%>/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=path%>/js/megamenu.js"></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <!-- end menu -->
    <script type="text/javascript" src="<%=path%>/js/jquery.jscrollpane.min.js"></script>

    <script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
    <script type="text/javascript" src="<%=path%>/js/easing.js"></script>
</head>
<body>
<div class="header-top">
    <div class="wrap">
        <div class="logo">
            <a href="index2.jsp"><img src="<%=path%>/images/logo.png" alt=""/></a>
        </div>
        <div class="cssmenu">
            <ul>
                <li class="active"><a href="<%=basePath%>fontLogin.jsp">注册/登录</a></li>
                <li>用户:<span id="myname">${userName}</span></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="header-bottom">
    <div class="wrap">
        <!-- start header menu -->
        <ul class="megamenu skyblue">
            <li style="width: 220px;font-size: 16px;"><a class="color1" href="<%=basePath%>index2.jsp">商城</a></li>
            <li class="grid" style="width: 220px;font-size: 16px"><a class="color2" href="<%=basePath%>shop.jsp">商品列表</a></li>
            <li class="active grid" style="width: 220px;font-size: 16px"><a class="color4" href="<%=basePath%>shopcar/update?username=${userName}">购物车</a></li>
            <li style="width: 220px;font-size: 16px"><a class="color5" href="<%=basePath%>shopvideo.jsp">视频展示</a></li>

            <li style="width: 220px;font-size:16px"><a class="color7" href="<%=basePath%>personal_center.jsp">个人中心</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div class="login">
    <div class="wrap">
        <div class="rsidebar span_1_of_left">
            <section  class="sky-form">
                <br>
                <br>
                <h4><a href="personal_center.jsp" style="font-size: large">首页</a></h4>
                <h4 style="font-size: large">账户管理</h4>
                <h4><a href="checkUser.jsp">查看个人信息</a></h4>
                <h4><a href="updateUser.jsp">修改个人信息</a></h4>
                <h4><a href="userAddress.jsp">管理收货地址</a></h4>
                <h4 style="font-size: large" >订单管理</h4>
                <h4><a href="order_all.jsp">全部订单</a></h4>
                <h4><a href="order_forpay.jsp">待付款</a></h4>
                <h4><a href="order_send.jsp">待发货</a></h4>
                <h4><a href="order_receive.jsp">待收货</a></h4>
                <h4><a href="order_success.jsp">待评价-交易成功</a></h4>
                <h4><a href="order_close.jsp">交易关闭</a></h4>
            </section>
        </div>
        <div class="cont span_2_of_3" style="width: 77.1%">
            <div>

            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
