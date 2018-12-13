<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>管理人员</title>
</head>
<body>
<form action="<%=path%>/updateManage" method="post">
    账户:${msg1}<br>
    姓名:<input type="text" name="username"><br>
    用户角色:<select name="uroleid">
    <option value="1">管理员</option>
    <option value="2">运营人员</option>

</select>
    <input type="submit" value="提交">

</form>
</body>
</html>
