<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/5 0005
  Time: 上午 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path =request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="refresh" content="2;URL=<%=path%>/star/first">
    <title>Title</title>
    <style type="text/css">
        #div{
            position: absolute;
            top: 300px;
            left: 400px;
            width: 300px;
            height: 300px;
            background-color: #6bc8e3;
            color: red;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div id="div">
    <h2>修改成功，2秒后自动跳转到明星管理界面</h2>
</div>
</body>
</html>
