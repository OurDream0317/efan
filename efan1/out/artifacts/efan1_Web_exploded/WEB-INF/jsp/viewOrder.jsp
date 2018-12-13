
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


    <script type="text/javascript">

        $(function() {

            selectAll();
            function selectAll() {
                $.get("<%=path%>/order/selectAll", function (data) {
                    var tmp = "";
                    var tmp1 = 0;
                    for (var i in data) {
                        if (data[i].orderstatus == 1) {
                            tmp = "待付款";
                            tmp1 = 1;
                        }
                        if (data[i].orderstatus == 2) {
                            tmp = "待发货";
                            tmp1 = 2;
                        }
                        if (data[i].orderstatus == 3) {
                            tmp = "待收货";
                            tmp1 = 3;
                        }
                        if (data[i].orderstatus == 4) {
                            tmp = "交易成功";
                            tmp1 = 4;
                        }
                        if (data[i].orderstatus == 0) {
                            tmp = "交易失败";
                        }
                        var src = "<%=path%>/" + data[i].showicon;
                        $("#div1").append("<div class='div1'>" +
                                '<span>订单编号:' + data[i].ordernumber + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<span>' + tmp + '</span><br>' +
                                '<div ><img src="' + src + '" style="height: 200px"><div>' +
                                '<span>' + data[i].showtitle + '</span><br>' +
                                '<span>' + data[i].showttime + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '' + '<span>共计' + data[i].baynumber + '件，合计：' + data[i].orderprice + '&nbsp;张</span><br>' +
                                '<span>' + data[i].showadress + '</span><br>' +
                                '<span>￥&nbsp;' + data[i].showmoney + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<button class="btn" id="btn' + data[i].ordernumber + '" onclick="javascript:method(' + data[i].ordernumber + ')">确定收货</button>' +
                                '<button class="btn" id="btn2' + data[i].ordernumber + '" onclick="javascript:methodB(' + data[i].ordernumber + ')">取消订单</button>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<button class="btn" id="btn3' + data[i].ordernumber + '" onclick="javascript:methodC(' + data[i].ordernumber + ')">付款</button>' +
                                '<button class="btn" id="btn1' + data[i].ordernumber + '" onclick="javascript:methodA(' + data[i].ordernumber + ')">评价</button><br>' +
                                '<span>' + data[i].baynumber + '&nbsp;张</span><br>' +


                                '<hr>' +
                                "</div>");
                        if (tmp1 == 4) {
                            $("#btn" + data[i].ordernumber).hide();
                            $("#btn1" + data[i].ordernumber).show();
                            $("#btn2" + data[i].ordernumber).hide();
                            $("#btn3" + data[i].ordernumber).hide();
                        }
                        if (tmp1 == 3) {
                            $("#btn3" + data[i].ordernumber).hide();
                            $("#btn2" + data[i].ordernumber).hide();
                            $("#btn1" + data[i].ordernumber).hide();
                            $("#btn" + data[i].ordernumber).show();
                        }
                        if (tmp1 == 2) {
                            $("#btn3" + data[i].ordernumber).hide();
                            $("#btn2" + data[i].ordernumber).hide();
                            $("#btn1" + data[i].ordernumber).hide();
                            $("#btn" + data[i].ordernumber).hide();
                        }
                        if (tmp1 == 1) {
                            $("#btn3" + data[i].ordernumber).show();
                            $("#btn2" + data[i].ordernumber).show();
                            $("#btn1" + data[i].ordernumber).hide();
                            $("#btn" + data[i].ordernumber).hide();
                        }
                    }
                });
            }

            $("#a1").click(function () {
                $(".div1").remove();
                $(this).css ('color', 'red').siblings ().css ('color', 'lightblue');
                selectAll();
                $(".div1").show();
                $(".div2").hide();
                $(".div3").hide();
                $(".div4").hide();
            });
            $("#a2").click(function () {
                $(".div4").remove();
                $(this).css ('color', 'red').siblings ().css ('color', 'lightblue');
                $(".div1").hide();
                $(".div2").hide();
                $(".div3").hide();
                $.get("<%=path%>/order/selectDemo", {"status": 1}, function (data) {
                    var tmp = "";
                    var tmp1 = 0;

                    for (var i in data) {
                        if (data[i].orderstatus == 1) {
                            tmp = "待付款";
                            tmp1 = 1;
                        }
                        if (data[i].orderstatus == 2) {
                            tmp = "待发货";
                            tmp1 = 2;
                        }
                        if (data[i].orderstatus == 3) {
                            tmp = "待收货";
                            tmp1 = 3;
                        }
                        if (data[i].orderstatus == 4) {
                            tmp = "交易成功";
                            tmp1 = 4;
                        }
                        if (data[i].orderstatus == 0) {
                            tmp = "交易失败";
                        }
                        var src = "<%=path%>/" + data[i].showicon;
                        $("#div1").append("<div class='div4'>" +
                                '<span>订单编号:' + data[i].ordernumber + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<span>' + tmp + '</span><br>' +
                                '<div ><img src="' + src + '" style="height: 200px"><div>' +
                                '<span>' + data[i].showtitle + '</span><br>' +
                                '<span>' + data[i].showttime + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '' + '<span>共计' + data[i].baynumber + '件，合计：' + data[i].orderprice + '&nbsp;张</span><br>' +
                                '<span>' + data[i].showadress + '</span><br>' +
                                '<span>￥&nbsp;' + data[i].showmoney + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<button class="btn" id="bn' + data[i].ordernumber + '" onclick="javascript:method(' + data[i].ordernumber + ')">确定收货</button>' +
                                '<button class="btn" id="bn1' + data[i].ordernumber + '" onclick="javascript:methodA(' + data[i].ordernumber + ')">取消订单</button>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<button class="btn" id="bn3' + data[i].ordernumber + '" onclick="javascript:methodC(' + data[i].ordernumber + ')">付款</button>' +
                                '<button class="btn" id="bn2' + data[i].ordernumber + '" onclick="javascript:methodB(' + data[i].ordernumber + ')">评价</button><br>' +
                                '<span>' + data[i].baynumber + '&nbsp;张</span><br>' +


                                '<hr>' +
                                "</div>");

                        if (tmp1 == 1) {
                            $("#bn1" + data[i].ordernumber).show();
                            $("#bn" + data[i].ordernumber).hide();
                            $("#bn2" + data[i].ordernumber).hide();
                            $("#bn3" + data[i].ordernumber).show();
                        }
                    }
                });
            });
            $("#a3").click(function () {
                $(".div3").remove();
                $(this).css ('color', 'red').siblings ().css ('color', 'lightblue');
                $(".div1").hide();
                $(".div2").hide();
                $(".div4").hide();
                $.get("<%=path%>/order/selectDemo", {"status": 2}, function (data) {
                    var tmp = "";
                    var tmp1 = 0;

                    for (var i in data) {
                        if (data[i].orderstatus == 1) {
                            tmp = "待付款";
                            tmp1 = 1;
                        }
                        if (data[i].orderstatus == 2) {
                            tmp = "待发货";
                            tmp1 = 2;
                        }
                        if (data[i].orderstatus == 3) {
                            tmp = "待收货";
                            tmp1 = 3;
                        }
                        if (data[i].orderstatus == 4) {
                            tmp = "交易成功";
                            tmp1 = 4;
                        }
                        if (data[i].orderstatus == 0) {
                            tmp = "交易失败";
                        }
                        var src = "<%=path%>/" + data[i].showicon;
                        $("#div1").append("<div class='div3'>" +
                                '<span>订单编号:' + data[i].ordernumber + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<span>' + tmp + '</span><br>' +
                                '<div ><img src="' + src + '" style="height: 200px"><div>' +
                                '<span>' + data[i].showtitle + '</span><br>' +
                                '<span>' + data[i].showttime + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '' + '<span>共计' + data[i].baynumber + '件，合计：' + data[i].orderprice + '&nbsp;张</span><br>' +
                                '<span>' + data[i].showadress + '</span><br>' +
                                '<span>￥&nbsp;' + data[i].showmoney + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<button class="btn" id="bnn' + data[i].ordernumber + '" onclick="javascript:method(' + data[i].ordernumber + ')">确定收货</button><br>' +
                                '<button class="btn" id="bnn1' + data[i].ordernumber + '" onclick="javascript:methodA(' + data[i].ordernumber + ')">取消订单</button>' +
                                '<button class="btn" id="bnn3' + data[i].ordernumber + '" onclick="javascript:methodAC(' + data[i].ordernumber + ')">付款</button>' +
                                '<button class="btn" id="bnn2' + data[i].ordernumber + '" onclick="javascript:methodB(' + data[i].ordernumber + ')">评价</button><br>' +
                                '<span>' + data[i].baynumber + '&nbsp;张</span><br>' +


                                '<hr>' +
                                "</div>");

                        if (tmp1 == 2) {
                            console.log(tmp + "+++" + i)
                            $("#bnn1" + data[i].ordernumber).hide();
                            $("#bnn" + data[i].ordernumber).hide();
                            $("#bnn2" + data[i].ordernumber).hide();
                            $("#bnn3" + data[i].ordernumber).hide();
                        }
                    }
                });
            });
            $("#a4").click(function () {
                $(".div2").remove();
                $(this).css ('color', 'red').siblings ().css ('color', 'lightblue');
                $(".div2").show();
                $(".div1").hide();
                $(".div3").hide();
                $(".div4").hide();
                $.get("<%=path%>/order/selectDemo", {"status": 3}, function (data) {
                    var tmp = "";
                    var tmp1 = 0;

                    for (var i in data) {
                        if (data[i].orderstatus == 1) {
                            tmp = "待付款";
                            tmp1 = 1;
                        }
                        if (data[i].orderstatus == 2) {
                            tmp = "待发货";
                            tmp1 = 2;
                        }
                        if (data[i].orderstatus == 3) {
                            tmp = "待收货";
                            tmp1 = 3;
                        }
                        if (data[i].orderstatus == 4) {
                            tmp = "交易成功";
                            tmp1 = 4;
                        }
                        if (data[i].orderstatus == 0) {
                            tmp = "交易失败";
                        }
                        var src = "<%=path%>/" + data[i].showicon;
                        $("#div1").append("<div class='div2'>" +
                                '<span>订单编号:' + data[i].ordernumber + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<span>' + tmp + '</span><br>' +
                                '<div ><img src="' + src + '" style="height: 200px"><div>' +
                                '<span>' + data[i].showtitle + '</span><br>' +
                                '<span>' + data[i].showttime + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '' + '<span>共计' + data[i].baynumber + '件，合计：' + data[i].orderprice + '&nbsp;张</span><br>' +
                                '<span>' + data[i].showadress + '</span><br>' +
                                '<span>￥&nbsp;' + data[i].showmoney + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<button class="btn" id="bnt' + data[i].ordernumber + '" onclick="javascript:method(' + data[i].ordernumber + ')">确定收货</button><br>' +
                                '<button class="btn" id="bnt1' + data[i].ordernumber + '" onclick="javascript:methodA(' + data[i].ordernumber + ')">取消订单</button><br>' +
                                '<button class="btn" id="bnt2' + data[i].ordernumber + '" onclick="javascript:methodB(' + data[i].ordernumber + ')">评价</button><br>' +
                                '<span>' + data[i].baynumber + '&nbsp;张</span><br>' +


                                '<hr>' +
                                "</div>");

                        if (tmp1 == 3) {
                            console.log(tmp + "+++" + i)
                            $("#bnt1" + data[i].ordernumber).hide();
                            $("#bnt" + data[i].ordernumber).show();
                            $("#bnt2" + data[i].ordernumber).hide();
                        }
                    }
                });
            });
            });
            function method(tmp) {
                $.get("<%=path%>/order/updatestatus", {"ordernumber": tmp}, function (data) {
                    console.log(data);
                    window.location.href = "<%=path%>/order/first";

                });
            }

    </script>
    <style>
        #div1{
            position: relative;
            top: 20px;
            left: 500px;
            width: 500px;
            height: 600px;
            border: 2px solid dodgerblue;
        overflow-y: scroll;
        }
        #div ul
        {
            text-align:center;
        }
        ul li
        {
            list-style-type:none;
            display:inline;
            display:inline-block;margin:0 10px;width:80px;
            font-size: 20px;
        }
      #a1{
          color: red;
      }
        .btn{
            background-color: #FF6100;
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
                    <a href="<%=path%>index3.jsp">E 娱</a>
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
            <div class="clearfix"> </div>
        </div>
    </div>
</div>


<div id="div1" >
<ul>
    <a id="a1" href="#"><li>全部</li></a>
    <a id="a2" href="#"><li>待付款</li></a>
        <a id="a3" href="#"><li>待发货</li></a>
            <a id="a4" href="#"><li>待收货</li></a>
</ul>
    <hr>

    </div>
</body>
</html>
