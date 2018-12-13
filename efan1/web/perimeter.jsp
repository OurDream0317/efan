<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<html>
<head>
    <title>周边</title>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
</head>
<body>
<form action="<%=path%>/product/nameselect">
<input type="text" id="first" name="productname">
<input type="submit" id="second" value="查询"><br>
    </form>
<c:forEach items="${product}" var="p">
 <a href="<%=path%>/product/return?proname=${p.proname}">${p.proname}<br></a>
</c:forEach>
</body>
<script type="text/javascript">
   /* function po(){

        console.log($("#first").val())
       /!* var data= encodeURI(encodeURI($("#first").val()));*!/
        $.get("<%=path%>/product/nameselect",{"productname":$("#first").val()});
    }
*/


</script>
</html>
