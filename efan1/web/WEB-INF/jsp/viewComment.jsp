<%@ page import="org.springframework.web.bind.annotation.PathVariable" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/7 0007
  Time: 下午 6:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #div1{
            width: 600px;
            height: 300px;
            background-color: #6bc8e3;
        }
    </style>
</head>
<body>
评论详情
<br><br><br>
评论人头像<img src="<%=path%>/${newComment.commentimg}" style="width: 100px">&nbsp;&nbsp;&nbsp;&nbsp;
评论人昵称<span>${newComment.nikename}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
评论时间<span>${newComment.commenttime}</span>
<br><br>
评论：<br><br><br>
<div id="div1">${newComment.commentcontent}</div>
</body>
</html>
