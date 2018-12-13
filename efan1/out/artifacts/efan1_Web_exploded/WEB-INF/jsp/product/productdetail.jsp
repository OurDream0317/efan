

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>商品详情</title>

    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(function(){
            var product=${product};

            console.log(product);

           $("#img1").html("<img style='width:300px;height:auto' src=<%=path%>/"+product.proicon+">" );
            $("#td1").text(product.proname);
            $("#td2").text(product.proprice);
            $("#td3").text(product.prostar);
            $("#td4").text(product.prodetail);
            $("#td5").text(product.properson);

        });



    </script>



</head>
<body>
<br>
<h3 style="width: auto;height: 30px;line-height: 30px;background: #C3DEF9">商品详情:</h3>



<div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <tr><td><span>商品名称:</span></td>&nbsp;&nbsp;<td ><span id="td1"></span></td></tr><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <tr><td><span>商品单价:</span></td>&nbsp;&nbsp;<td><span id="td2"></span></td></tr><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>邮费:</span></td>&nbsp;&nbsp;<td><span >免邮</span></td></tr><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>发布方:</span></td>&nbsp;&nbsp;<td><span id="td5"></span></td></tr><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>关联明星:</span></td>&nbsp;&nbsp;<td><span id="td3"></span></td></tr><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <tr><td><span>商品详情:</span></td><br><br>&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <td><span id="td4"></span></td></tr><br><br>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <tr><td><span>商品图片:</span></td><br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<td><span id="img1"></span></td></tr><br><br>


</div>
<br><br><br>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<td><input type="button" value="返回" onclick="window.history.back(-1);" style="width: 100px;height: 40px"></td></tr><br><br>










</body>
</html>

