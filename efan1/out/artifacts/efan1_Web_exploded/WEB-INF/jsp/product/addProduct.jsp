
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/3 0003
  Time: 上午 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path =request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>添加商品</title>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(function(){

        });
    </script>
</head>
<body>
<div style="width: auto;height: 40px;background: #cccccc;line-height: 40px">添加商品</div>
<br><br><br>
<form action="saveproduct" method="post" enctype="multipart/form-data">
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
</body>
</html>