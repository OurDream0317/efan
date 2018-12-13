<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/3 0003
  Time: 下午 7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑演出</title>
</head>
<body>
编辑演出
<br><br><br>
<form action="updateShow" method="post" enctype="multipart/form-data">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出名称：&nbsp;<input name="showtitle"  type="text" style="width:200px;height: 20px">
    <br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*关联明星：&nbsp;<select  name="showstar"  style="width:200px;height: 20px " >
    <%--  <c:forEach items="" var="emp">

      </c:forEach>--%>
    <option>薛之谦</option>
    <option>易烊千玺</option>
    <option>林俊杰</option>

</select>
    <br><br><br>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出时间：&nbsp;<input name="showtime" type="datetime-local" style="width:300px;height: 40px " >
    <br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出地点：&nbsp;<input name="showaddress" type="text" style="width:200px;height: 20px ">
    <br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*商品类型：看台票（外场票）&nbsp;&nbsp;&nbsp;
    价格&nbsp;&nbsp;<input name="showprice2" type="text" style="width:50px;height: 20px ">&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
    数量&nbsp;&nbsp;<input name="shownumber2" type="text" style="width:50px;height: 20px ">&nbsp;张
    <br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内场票&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    价格&nbsp;&nbsp; <input name="showprice1" type="text" style="width:50px;height: 20px ">&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
    数量&nbsp;&nbsp; <input name="shownumber1" type="text" style="width:50px;height: 20px ">&nbsp;张
    <br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出简介：<input name="showdetail" type="text" style="width:300px;height: 250px ">
    <br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*演出封面：<input name="myFile" type="file" value="+上传图片" style="width: 150px;height: 150px;background-color: #00cc00" >
    <br><br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确定" style="width: 100px;height: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick="window.history.back(-1);" style="width: 100px;height: 40px">
</form>
</body>
</html>