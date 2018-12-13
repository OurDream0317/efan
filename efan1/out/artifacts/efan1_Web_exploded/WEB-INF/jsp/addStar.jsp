<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/4 0004
  Time: 下午 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path =request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>添加明星列表</title>
    <script  src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body>
新增明星
<br><br>
<form action="<%=path%>/star/addStarDemo" method="post" enctype="multipart/form-data">
姓名：<input type="text" style="width: 200px;height: 30px" name="starname"><br><br><br>
简介：<textarea style="width: 200px;height: 200px" name="starintroduce"></textarea><br><br><br>
封面图：<input type="file" style="width: 200px;height: 20px" name="file1"><br><br><br>
背景图：<input type="file" style="width: 200px;height: 20px" name="file2"><br><br><br><br><br><br>
<input type="submit" value="确定" style="width: 100px;height: 40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="window.history.back(-1)" style="width: 100px;height: 40px" value="取消">
</form>
</body>
</html>
