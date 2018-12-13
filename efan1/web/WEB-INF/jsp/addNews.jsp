<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/5 0005
  Time: 下午 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <script  src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">


        $(function(){
           $("#id1").click(function(){
                $("#div2").hide();
                $("#div1").show();
           });
            $("#id2").click(function(){
                $("#div1").hide();
                $("#div2").show();
            });
          /*  $("#button").click(function(){
                window.location.href="<%=path%>/news/first"
            });*/
            $("#btn").click(function(){
                $.get("<%=path%>/news/addNewsDemo",{/*"newstitle":$("#one").val(),"newstar":$("#two").val(),"newscontent":$("three").val()*/"img":$("#img").val()})
            });
        });
    </script>
    <title>Title</title>
</head>
<style type="text/css">
    #div1,#div2{
        display: none;
    }
</style>
<body>
新增新闻
<br><br><br>
<form action="<%=path%>/news/addNewsDemo" method="post" enctype="multipart/form-data">
新闻标题：<input type="text" style="width: 250px;height: 25px" name="newstitle">
<br><br><br>
*关联明星：<select style="width: 150px;height: 25px" name="newstar">
    <c:forEach items="${AllStarlist}" var="list">
         <option>${list.starname}</option>
    </c:forEach>
       </select>
<br><br><br>
新闻内容：<input type="radio" id="id1" name="radio1" >&nbsp;图文&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio1" id="id2">&nbsp;图集
<br><br><br>
<div id="div1"><textarea style="width: 300px;height: 300px" name="newscontent"></textarea></div>
<div id="div2"><input type="file" style="width: 200px;height: 40px" name="file1" multiple="multiple"></div>
<br><br><br><br><br><br>
封面图：<input type="file" style="width: 200px;height: 40px" id="img" name="file">
<br><br><br><br><br>
<input type="submit" style="width: 100px;height: 40px;background-color: #0A6AD0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" style="width: 100px;height: 40px;background-color: #0A6AD0" onclick="window.history.back(-1)" value="取消">
</form>

</body>
</html>
