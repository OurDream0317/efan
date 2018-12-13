<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/13 0013
  Time: 上午 9:20
  To change this template use File | Settings | File Templates.
--%>

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

   <%-- <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>--%>
    <!-- end menu -->
    <script src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.jscrollpane.min.js"></script>

    <script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
    <script type="text/javascript" src="<%=path%>/js/easing.js"></script>

    <style type="text/css">
        #mytab{
            width: 100%;
        }
        #mytab tr{
            border:  1px solid slategray;
            height: 40px;
            line-height: 40px;
        }
        #mytab td{
            border:  1px solid slategray;
            text-align: center;
        }

    </style>
    <script type="text/javascript">



    </script>


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
                <%--<li><a href="backproduct/selectProductfontAll.do">商品列表</a></li>
                <li><a href="checkout.html">购物车</a></li>--%>
                <li>用户:<span id="upname"><%=session.getAttribute("userName")%></span></li>
            </ul>
        </div>
        <ul class="icon2 sub-icon2 profile_img">
            <li><a class="active-icon c2" href="#"> </a>
                <ul class="sub-icon2 list">
                    <li><h3>Products</h3><a href=""></a></li>
                    <li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
                </ul>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div class="header-bottom">
    <div class="wrap">
        <!-- start header menu -->

        <ul class="megamenu skyblue">
            <li style="width: 220px;font-size: 16px;display: inline-block;"><a class="color1" href="<%=basePath%>index2.jsp">商城</a></li>
            <li class="grid" style="width: 220px;font-size: 16px;display: inline-block;"><a class="color2" href="<%=basePath%>shop.jsp">商品列表</a></li>
            <li class="active grid" style="width: 220px;font-size: 16px;display: inline-block;"><a class="color4" href="<%=basePath%>shopcar/update?username=${userName}">购物车</a></li>
            <li style="width: 220px;font-size: 16px;display: inline-block;"><a class="color5" href="<%=basePath%>shopvideo.jsp">视频展示</a></li>

            <li style="width: 220px;font-size:16px;display: inline-block;"><a class="color7" href="<%=basePath%>personal_center.jsp">个人中心</a></li>
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
        <%--管理收货地址模块，--%>
        <a href="<%=basePath%>useraddress_add.jsp"><input id="Add" type="button" value="添加地址"></a>
        <div class="cont span_2_of_3" style="width: 77.1%">
            <table style="width: 100%;height: 40px;" id="mytab">
                <tr style="border: 1px solid silver;background-color: silver">
                    <th style="width: 80px;vertical-align:middle;">收货人姓名</th>
                    <th style="width: 100px;vertical-align:middle;">电话</th>
                    <th style="width:150px;vertical-align:middle;">地址</th>
                    <th style="width:100px;vertical-align:middle;">管理操作</th>
                </tr>
            </table>

          <%--  <button id="button1">上一页</button><label id="lab">当前页</label><button id="button2">下一页</button>--%>

                <div class="clear"></div>
            </div>



        </div>
        <div class="clear"></div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    //定义全局变量 当前的页数
    var currentpage=1;//从第一页开始

    $(function() {

        $("#lab").html("第"+currentpage+"页");
        $.get("fontAddress/selectAddress.do", {
            "username": "${userName}",
            "currentpage": currentpage,
            "count": 20
        }, function (data) {
            console.log(data);
            //获取到数据动态添加到表里 先删除之前的数据
            $(".table  tr:not(:first)").empty("");
            //添加数据
            var html = "";
            for( var i = 0; i < data.length; i++ ) {
                html += "<tr>";
                html += "<td>" + data[i].username + "</td>";
                html += "<td>" + data[i].phone + "</td>";
                html += "<td>" +data[i].address + "</td>";
                var u= "<%=basePath%>fontAddress/updateAddressStatus.do?addreId="+data[i].addreId+"&username="+"${userName}";
                var u1= "fontAddress/deleteAddress.do?addreId="+data[i].addreId;
                var u2="useraddress_update.jsp?addreId="+data[i].addreId;
                if(data[i].defStatus==1){
                    html += "<td><a class=link_icon href="+u+"> 设为默认 </a>" +
                            " <a class=link_icon href="+u2+"> 编辑 </a>"+
                            " <a class=link_icon href="+u1+">  删除</a></td>";
                }else{
                    html += "<td> 默认地址 </td>";
                }

               /* var u= "back/deleteManage.do?addreId="+data[i].addreId;
                html += "<td><a class=link_icon href='manage_update.jsp'> 修改</a>" +
                        " <a class=link_icon href="+u+"> 删除</a></td>";*/

                html += "</tr>";
            }
            $("#mytab").append(html);
        });

        $("#btn").click(function () {
            console.log("afagfafag");
            $.get("fontAddress/selectAddress.do", {
                "username": "${userName}",
                "currentpage": currentpage,
                "count": 20
            }, function (data) {
                console.log(data);
                if(data.length===0&&currentpage!=1){
                    currentpage--;
                    return;
                }else {
                    $("#lab").html("当前是第" + currentpage + "页");

                    //获取到数据动态添加到表里 先删除之前的数据
                    $(".table  tr:not(:first)").empty("");
                    //添加数据
                    var html = "";
                    for( var i = 0; i < data.length; i++ ) {
                        html += "<tr>";
                        html += "<td>" + data[i].username + "</td>";
                        html += "<td>" + data[i].phone + "</td>";
                        html += "<td>" +data[i].address + "</td>";
                        var u= "fontAddress/updateAddressStatus.do?addreId="+data[i].addreId+"&username="+"${userName}";
                        var u1= "fontAddress/deleteAddress.do?addreId="+data[i].addreId;
                        if(data[i].defStatus==1){
                            html += "<td><a class=link_icon href="+u+"> 设为默认</a>" +
                                    " <a class=link_icon href="+u1+"> 删除</a></td>";
                        }else{
                            html += "<td> 默认地址 </td>";
                        }

                       /* var u = "back/deleteManage.do?id=" + data[i].mid;
                        html += "<td><a class=link_icon href='manage_update.jsp'> 修改</a>" +
                                " <a class=link_icon href=" + u + "> 删除</a></td>";
*/
                        html += "</tr>";
                    }
                    $("#mytab").append(html);
                }
            });
        });

//上一页
        $("#button1").click(function(){
            currentpage--;
            if(currentpage==0){
                currentpage++;
                return;
            }else{
                $("btn").click();
            }
        });

//下一页



    });
    $("#button2").click(function(){
        ++currentpage;
        $("#btn").click();
        console.log("kkkkkkkkkkk");
    });

</script>
