<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/5 0005
  Time: 上午 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>查看mingx</title>
</head>
<style type="text/css">
    #div{
        position: absolute;
        top: 1000px;
        left: 200px;
    }
</style>
<body>
查看明星
<br><br><br>
姓名：${star.starname}
<br><br><br>
简介：${star.starintroduce}
<br><br><br>
封面图：<img src="<%=path%>/${star.staricom}" style="width: 200px;height: 250px">
<br><br><br>
背景图：：<img src="<%=path%>/${star.starimg}" style="width: 200px;height: 250px">
<br><br><br>
粉丝数：${star.starfans}
<br><br><br>
排名：${star.rank}
<br><br><br>
<div id="div"><button style="width: 100px;height: 40px;background-color: #0A6AD0" onclick="window.history.back(-1)">返回</button></div>
</body>
</html>
