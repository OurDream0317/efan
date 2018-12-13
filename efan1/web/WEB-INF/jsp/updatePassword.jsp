<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/1 0001
  Time: 上午 10:43
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body>
      <form action="<%=path%>/updatePassword">
         x姓名:<input type="password" name="username"><br>
         新密码:<input type="password" name="password"><br>
          确认密码:<input type="password" name="rpassword"><br>
          <input type="submit" value="提交">

      </form>

</body>
</html>
