<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

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
    <title>添加演出</title>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(function(){

        });
    </script>
</head>
<body>
<div>添加演出</div>
<br><br><br>
<form action="addshow" method="post" enctype="multipart/form-data">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出名称：&nbsp;<input name="showtitle"  type="text" style="width:200px;height: 20px ">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*关联明星：&nbsp;<select  name="showstar"  style="width:200px;height: 20px ">
    <c:forEach items="${AllStarlist}" var="list">
        <option>${list.starname}</option>
    </c:forEach>
</select>
<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出时间：&nbsp;<input name="showtime" type="datetime-local" style="width:200px;height: 20px " >
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出地点：&nbsp;<input name="showaddress" type="text" style="width:200px;height: 20px ">
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*商品类型：看台票（外场票）&nbsp;&nbsp;&nbsp;
    价格&nbsp;&nbsp;<input name="showprice2" type="text" style="width:50px;height: 20px ">&nbsp;&nbsp;&nbsp;&nbsp;
    数量&nbsp;&nbsp;<input name="shownumber2" type="text" style="width:50px;height: 20px ">
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内场票&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    价格&nbsp;&nbsp; <input name="showprice1" type="text" style="width:50px;height: 20px ">&nbsp;&nbsp;&nbsp;&nbsp;
    数量&nbsp;&nbsp; <input name="shownumber1" type="text" style="width:50px;height: 20px ">
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出简介：<input name="showdetail" type="text" style="width:300px;height: 250px ">
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出封面：<input name="myFile" type="file" value="+上传图片" style="width: 150px;height: 150px;background-color: #00cc00" >
<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确定" style="width: 100px;height: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick="window.history.back(-1);" style="width: 100px;height: 40px">
</form>
</body>
</html>