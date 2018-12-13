
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
    <title>商品详情</title>
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
            var product=${product};

            console.log(product);

            $("#img1").html("<img style='width:300px;height:auto' src=<%=path%>/"+product.proicon+">" );
            $("#td1").text(product.proname);
            $("#td2").text(product.proprice);
            $("#td3").text(product.prostar);
            $("#td4").text(product.prodetail);
            $("#td5").text(product.properson);
          if(product.proshelf==0){
                //说明商品是未上架的商品显示的操作有，上架，编辑 ，删除

                $("#proshelf").html(" <input type='button' value='上架' onclick='proshelf1("+product.proid +")' style='width: 100px;height: 40px'>"+
                    " <a href='<%=basePath%>master/updatemasterProduct?proid="+product.proid+"'><input type='button' value='编辑' style='width: 100px;height: 40px'></a>"+
                      "<input type='button' value='删除' onclick='delete1("+product.proid +")' id='deletepro' style='width: 100px;height: 40px'>"+
                      "<input type='button' value='返回' onclick='window.history.back(-1);' style='width: 100px;height: 40px'>");
            }else{
                //说明是上架的商品，显示的操作是下架
              $("#proshelf").html(" <input type='button' value='下架' onclick='proshelf2("+product.proid +")' style='width: 100px;height: 40px'>"+
                      "<input type='button' value='返回' onclick='window.history.back(-1);' style='width: 100px;height: 40px'>");
            }






        });
        function proshelf1(proid){
            //点击上架将
            $.get("<%=basePath%>product/updateproshelf",{"proid":proid,"proshelf":0});
            //请求过后刷新页面
            window.location.reload();
        }
        function proshelf2(proid){
            //点击下架将
            $.get("<%=basePath%>product/updateproshelf",{"proid":proid,"proshelf":1});
            //请求过后刷新页面
            window.location.reload();
        }
        function delete1(proid){
            //点击删除

            $.get("<%=basePath%>master/deletemasterProduct",{"proid":proid});
            window.history.back(-1);
        }







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
    <br>
    <h3 style="width: auto;height: 30px;line-height: 30px;background: #C3DEF9">商品详情:</h3>



    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <tr><td><span>商品名称:</span></td>&nbsp;&nbsp;<td ><span id="td1"></span></td></tr><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <tr><td><span>商品单价:</span></td>&nbsp;&nbsp;<td><span id="td2"></span></td></tr><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>邮费:</span></td>&nbsp;&nbsp;<td><span >免邮</span></td></tr><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>发布方:</span></td>&nbsp;&nbsp;<td><span id="td5"></span></td></tr><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>关联明星:</span></td>&nbsp;&nbsp;<td><span id="td3"></span></td></tr><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>商品详情:</span></td><br><br>&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <td><span id="td4"></span></td></tr><br><br>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <tr><td><span>商品图片:</span></td><br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<tr><td><span id="img1"></span></td></tr><br><br>


    </div>
    <br><br><br>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <div id="proshelf">

     </div>


  <br><br>



</div>







<!-- //footer -->
</body>
</html>
