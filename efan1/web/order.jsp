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
    <title>提交订单</title>
    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
</head>
<body>
    <h1>商品明细</h1>
    <c:forEach items="${test}" var="p">
        <tr>	<a  class="big"><img style="height: 60px;width: 120px" src="<%=basePath%>${p.proicon}" alt="" title="${p.proname}" /></a></tr>
        <p name="proname" id="proname">${p.proname}</p>
        <a style="left: 50px" name="price">价格:<span id="first">${p.proprice}</span></a>
        <a style="right: 50px" name="number">数量:<span id="second">${test1}</span></a>${b}<br>
        <a style="left: 50px" name="price1">总价格:${test1}</a>
        <a id="userid">${user.userid}</a><br>
        <a id="productid">${p.proid}</a>
        <br><br><br>
    </c:forEach>
        <h1>配送地址</h1>
    <a href="<%=path%>/adress/insert?userid=${user.userid}">地址管理</a>
   <c:forEach items="${address}" var="p">
    <div>
    <a id="username">${p.username}</a><a name="phone"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="userphone">${p.userphone}</span>
    </a><br>
    <tr><a name="address" id="address">${p.address}</a></tr><br>
    </div>
       </c:forEach>
<br>
<h1>订单费用明细</h1>
<h1>备注</h1>
   <input id="text1" type="text"/><br>
<input type="submit" value="提交订单" onclick="submit()">
</body>
<script type="text/javascript">
    function submit(){
        var proname=$("#proname").text();
        var price=$("#first").text();
        var buynumber=$("#second").text();
        var userid=$("#userid").text();
        var username=$("#username").text();
        var userphone=$("#userphone").text();
        var address=$("#address").text();
        var text=$("#text1" +
                "").val();
        var productid=$("#productid").text();
        console.log(proname,price,buynumber,userid,username,userphone,address,text);
        url="<%=path%>/order/neworder?proname="+proname+"&price="+price+"&buynumber="+buynumber+"&userid="+userid+"&username="+username+"&userphone="+userphone+"&address="+address+"&text="+text+"&productid="+productid+"";
        window.location.href=url;
        console.log(url);
    }


    $(function(){
        var name =
       // var search=location.a;
        console.log(name);
        $.get("<%=path%>/product/return2"),{
            "proname":"${b}"
        },function(data){
            console.log(data);
        }
    });
</script>
</html>
