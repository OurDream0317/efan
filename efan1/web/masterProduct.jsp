
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
    <title>新增商品</title>
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
            /* var masterid=${master.masterid};
             var userphone=${user1.userphone};*/
            //通过用户账号查询该用户发布的产品信息
           /* $.get("product/selectMasterByphone",{"userphone":"平台"},function(data){
                console.log(data);
                var html="";
                var index=0;
                for(var y = 0; y< data.length; y+=2 ) {
                    html+="<br>";

                    for (var i = 0; i < 2; i++) {
                        console.log(index);
                        html += " <div style='margin-left: 20px;margin-bottom:20px;width: 400px;float: left;'>"+
                                "<a href='#'><img src='"+data[index].proicon+"' style='width:400px; height: auto'></a><br>"+
                                "<span style='margin-left: 50px;'>商品名:"+data[index].proneme+"</span><br>"+
                                "<span style='margin-left: 50px;color: red'>￥150</span><span style='margin-left: 230px;'>销量："+data[index].prosale+"</span></div>";
                        index++;
                        if(index>=data.length){
                            break;
                        }
                    }


                }
                $("#table").append(html);
            });*/

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
<div style="width:60%; height:600px; margin-left: auto;margin-right: auto;background: #c0c0c0;overflow-y: auto;margin-bottom: 50px;">

    <ul class="nav navbar-nav">
        <li><a href="<%=basePath%>master/findmaster?userid=${user1.userid}">商品管理</a></li>
        <li><a href="#">订单管理</a></li>
    </ul><br><br>
    <div style="width: auto;height: 40px;background: #cccccc;line-height: 40px">添加商品</div>
    <br><br><br>
    <form action="<%=basePath%>product/saveproductmaster" method="post" enctype="multipart/form-data">
        <input name="userid" value="${user1.userid}" style="display: none">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px; ">发布人：</span>&nbsp;<input name="properson" type="text" value="${user1.userphone}" style="width:200px;height: 30px; margin-bottom: 5px; " readonly="readonly">
       <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px; ">商品名称：</span>&nbsp;<input name="proname"  type="text" style="width:200px;height: 30px; margin-bottom: 5px; ">
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px;">商品单价：</span>&nbsp;<input name="proprice"  type="text" style="width:200px;height: 30px; margin-bottom: 5px; ">
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px;">库存数量：</span>&nbsp;<input name="prostock"  type="text" style="width:200px;height: 30px; margin-bottom: 5px; ">
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px;">关联明星：</span>&nbsp;
        <select  name="prostar"  style="width:200px;height: 30px; margin-bottom: 5px;">
            <%--  <c:forEach items="" var="emp">

              </c:forEach>--%>
            <option>薛之谦</option>
            <option>易烊千玺</option>
            <option>林俊杰</option>
            <option>刘亦菲</option>
            <option>胡歌</option>

        </select>
        <br>



        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px;margin-bottom: 10px;">商品详情：</span><br>
        <%-- <input name="prodetail" type="text" style="width:400px;height: 250px;margin-left: 50px; ">--%>
        <textarea name="prodetail" type="text" style="width:400px;height: 250px;margin-left: 50px; "></textarea>
        <br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 90px;height: 25px;margin-bottom: 10px;">商品图片：</span>
         <input name="myFile" type="file" value="+上传图片" style="width: 120px;height: 70px;background-color: #cccccc" >
        <br><br><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确定" style="width: 100px;height: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="window.history.back(-1);" style="width: 100px;height: 40px">
    </form>


</div>







<!-- //footer -->
</body>
</html>
