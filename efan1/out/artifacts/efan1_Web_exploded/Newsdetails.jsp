
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
    <title>新闻详情页</title>
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
            /*进入到详情页面，就让阅读量加一*/
            //先判断下需要增加或减少的是哪个，阅读量 （1代表阅读量加1,），
            // 还是点赞量（2代表点赞量加1，-2代表点赞量减1），还是评论量(3代表评论量加1)


            var icons="${news.newsicon}";
            var html="";
            console.log(icons+"+++++++++++");
            if(icons!=null&&icons.length>0) {
                var icon = icons.split(",");
                console.log(icon);
                for (var i = 0; i < icon.length; i++) {
                    var src1 = "<%=path%>/image/" + icon[i];
                    console.log(src1)
                  html+="<img src='"+src1+"' style='width: 100%;height: auto;'><br>"
                }
                $("#img1").append(html);
            }

            $.get("see",{"id":${news.newsid}},function(data){
                console.log(data)
                for(var i in data) {
                    var str="<%=path%>/comment/first?img="+data[i].commentimg+"&id="+data[i].commentid+
                            "&nikename="+data[i].nikename+"&commentcontent="+data[i].commentcontent+"&commenttime="+data[i].commenttime;
                    var src1="<%=path%>/"+ data[i].commentimg;
                    $("table").append('<tr>' +
                            '<th>' + data[i].commentid + '</th>' +
                            '<th><img src='+src1+' style="width: 100px;height: auto"></th>' +
                            '<th>' + data[i].phone + '</th>' +
                            '<th>' + data[i].nikename + '</th>' +
                            '<th>' + data[i].commentcontent + '</th>' +
                            '<th>' + data[i].replys+ '</th>' +
                            '<th> <a href="'+str+'"><span>查看评论</span></a> </th>')
                }
            });

        });

        /*添加点赞事件*/
        //先判断下需要增加或减少的是哪个，阅读量 （1代表阅读量加1,），
        // 还是点赞量（2代表点赞量加1，-2代表点赞量减1），还是评论量(3代表评论量加1)
        var a=1;
        function button11(){
            /*点击点赞，让按钮变红*/
            if(a%2!=0){
                $("#button11").css("background","red");
                //请求后台点赞量加1
               $.get("fontaddclicknumber",{"newsid":${news.newsid},"a":2});
                //ajax请求后刷新页面
                //window.location.reload();
            }else{
                $("#button11").css("background","gray");
                $.get("fontaddclicknumber",{"newsid":${news.newsid},"a":-2});

            }
            a++;
            //请求后台点赞量加1

        }
        function button22(){
            //发表评论
            $("#hid1").fadeToggle();
        }
        //取消评论
       function hide1(){
           $("#hid1").fadeToggle();
       }
        //提交评论 评论人写死了，固定
        function hide2(){
            //获取评论用户id  String commentcontent, Integer newsid, Integer commentuserid
            //获取新闻id 评论的类型commenttyle为2新闻
            $.get("fontaddcomment",{
                "commentcontent":$("#comment11").val(),
                "newsid":${news.newsid},
                "commentuserid":1
            });
            window.location.reload();

            $("#hid1").fadeToggle();
        }

    </script>
    <style type="text/css">
        #div1{width:54%;
            height:600px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
         position:relative;

        }

        #hid1{
            width:320px;
            height:450px;
            position:fixed;
            left:50px;
            top:100px;
            z-index:2;
            background:#cccccc;

        }
        #audit0{
            width:320px;
            height:30px;

        }


        #input4{
            width: 320px;
            height: 30px;

        }
        #hid1{
            display: none;
        }

    </style>
</head>
<body>
<!-- banner -->
<div class="banner about-bg">
    <div class="top-banner about-top-banner">
        <div class="container">
            <div class="top-banner-left">
                <ul>
                    <li><i class="fa fa-phone" aria-hidden="true"></i> 登录</li>
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
<!--Shortcodes-page -->

<%--
<div class="news">
    <div class="container">
        <div class="news-heading">
            <h3>推荐新闻</h3>
            <p>热点快讯，快速浏览</p>
        </div>

    </div>
</div>
--%>
<div id="div1">
<div style="width:100%; height:auto; margin-left: auto;margin-right: auto;background: #c0c0c0">
     <h4>焦点饭谈|</h4>&nbsp;<h4>${news.newstitle}</h4><br>
    <span>查看量：${news.readnumber}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>点赞量：${news.clicknumber}</span>&nbsp;&nbsp;&nbsp;&nbsp;
    <span>评论量：${news.commentnumber}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${news.newstime}</span>

    <textarea style="width: 100%;height: auto;margin-left: auto;margin-right: auto;" readonly="readonly">
        ${news.newscontent}
    </textarea>
    <div id="img1" style="width: 100%;height: auto">

    </div><br>
<div id="div2">
    <input type="text" style="width: 80%;" onclick="button22()" value="说点什么吧？">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" id="button11" value="点赞" onclick="button11()">
</div>
    <br><br>


</div>

<br><br><br><br>
<div style="width:100%; height: 500px; margin-left: auto;margin-right: auto;background: #c0c0c0">
    <table>
        <tr>
            <th width="10%">序号</th>
            <th width="10%">头像</th>
            <th width="15%"> 手机号</th>
            <th width="15%"> 微信昵称</th>
            <th width="20%">评论内容</th>
            <th width="10%">回复条数</th>
            <th width="20%">操作</th>
        </tr>
    </table>
<br>
    <input type='button' value='返回' onclick='window.history.back(-1);' style='width: 100px;height: 40px;margin-left: 300px;'>

</div>


<div id="hid1">
    <form >
        <div id="audit0"> <p style="line-height: 20px;text-align: left;font-size: 18px;padding-left: 10px">发表评论</p></div>

       <textarea id="comment11" style="width: 80%;height: 350px;"></textarea>

        <div id="input4">
            <input id="input3" style="width: 100px;height: 35px;color:#333;margin-left: 50px" type="button" onclick="hide2()" value="确认">&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="input2" style="width: 100px;height: 35px;color:#333;" type="button" onclick="hide1()" value="取消"><br>
        </div>

    </form>


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