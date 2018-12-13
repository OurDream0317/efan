
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
    <title>订单详情</title>

    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">






        //将时间戳改为String类型的时间的方法
        function formatDateTime(timeStamp) {
            var date = new Date();
            date.setTime(timeStamp);
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? ('0' + m) : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            var h = date.getHours();
            h = h < 10 ? ('0' + h) : h;
            var minute = date.getMinutes();
            var second = date.getSeconds();
            minute = minute < 10 ? ('0' + minute) : minute;
            second = second < 10 ? ('0' + second) : second;
            return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
        };

    </script>



</head>
<body>
<br>
<h3>订单详情:</h3>
<c:forEach items="${orderMain}" var="order">
<div>
    <tr><td><span>订单编号:</span></td>&nbsp;<td><span id="tdd1">${order.ordernumber}</span></td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  <span>订单状态：</span>&nbsp;<td><td>
            <c:if test="${order.orderstatus==1}">
            <span id="tdd2">待付款</span>
        </c:if>
            <c:if test="${order.orderstatus==2}">
                <span id="tdd2">待发货</span>
            </c:if>
            <c:if test="${order.orderstatus==3}">
                <span id="tdd2">待收货</span>
            </c:if>
            <c:if test="${order.orderstatus==4}">
                <span id="tdd2">交易成功</span>
            </c:if>
            <c:if test="${order.orderstatus==0}">
                <span id="tdd2">交易失败</span>
            </c:if>

        </td></tr><br><br>

</div>

<h4>购买清单</h4>
<table width="100%" border=1 class="table" id="mytab">
    <tr>
        <td>演出名称</td>
        <td>发起方</td>
        <td>购买数量</td>
        <td>购买价格</td>

        <td>操作</td>
    </tr>
    <c:forEach items="${order.orderDatailList}" var="detail">
    <tr>
        <td>${detail.productList[0].proname}</td>
        <td>${detail.productList[0].properson}</td>
        <td>${detail.buynumber}</td>
        <td>${detail.price}</td>

        <td><a href="#">查看</a></td>
    </tr>

    </c:forEach>

</table><br><br>

<h4>配送地址</h4>
<div>
    <tr><td><span>收货人姓名:</span></td>&nbsp;&nbsp;<td ><span id="td">${order.username}</span></td></tr><br><br>
    <tr><td><span>收货人电话:</span></td>&nbsp;&nbsp;<td><span id="td1">${order.userphone} </span></td></tr><br><br>
    <tr><td><span>地址:</span></td>&nbsp;&nbsp;<td><span id="td2">${order.useraddress} </span></td></tr><br><br>

</div>
<h4>订单费用明细</h4>
<div>
    <tr><td><span>商品金额:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td>￥<span id="dd1">${order.orderDatailList[0].orderprice} </span></td></tr><br><br><hr>
    <tr><td><span>快递费:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="dd2">免运费</span></td></tr><br><br><hr>

</div>

    <h4>备注</h4>
    <div style="width: 200px; height: auto;">
        <tr>&nbsp;&nbsp;&nbsp;&nbsp;<span id="dd">${order.remarks} </span>

    </div></tr><br><br>

<h4>订单流程</h4>
<div>
    <tr><td><span>提交订单时间:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;
        <td><span id="ddd1">${committime}



        </span></td>
    </tr><br><br>
    <tr><td><span>付款时间:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="ddd2"> ${buytime} </span></td></tr><br><br>
</div>
<h4>物流信息</h4>
<div>
    <tr><td><span>物流公司:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="ddd3">${order.express}</span></td></tr><br><br>
    <tr><td><span>物流单号:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="ddd4">${order.expressnumber}</span></td></tr><br><br>
</div>
</c:forEach>
<tr><td></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><a href="<%=basePath%>order/orderproduct"><button style="width: 100px;height: 35px;color:#333;"> 返回</button></a></td></tr><br><br>









</body>
</html>
