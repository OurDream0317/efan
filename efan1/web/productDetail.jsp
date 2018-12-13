<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<head>
    <title>商品详情</title>

    <script type="text/javascript">

    </script>

</head>
<body>
<c:forEach items="${product1}" var="p">
<img style='width:100%;height:700px' src="<%=basePath%>${p.proicon}"><br>
    <p id="name">${p.proname}</p>
    <br>
价格:<a style="left: 50px" id="second">${p.proprice}</a>
    <a style="right: 50px">销量:${p.prosale}</a><br>
    <a>发布人:${p.properson}</a>

    <h1>商品详情<h1>
        <p>${p.prodetail}</p>
        <input type="button" value="加入购物车" style="color: red" onclick="po('${p.proname}')">
        <input type="button" value="立即购买" style="color: red" onclick="po1()">
</c:forEach>
        <br>
        <div id="hid">

        <tr>
               购买数量
                <button id="minus">minus</button>   <span id="first"></span>  <button id="add">add</button>
            </a>
        </tr>
        <br>
        <%-- <form action="<%=path%>/order.jsp">--%>
        <input type="submit" onclick="submit()" value="提交" style="align-content: center"/>
        <input type="button" name="button" value="返回" onclick="javascript:history.go(-1)"/>
       <%--  </form>--%>
        </div>

</body>
<style type="text/css">
    #hid{
        display: none;
    }


</style>
      <script  type="text/javascript">
          function submit(){
              var a=$("#first").text();
              console.log(a);
              var b=$("#name").text();
              console.log(b);
              var d=${user.userid};
              var c=$("#second").text();
              url="<%=path%>/product/return2?a="+a+"&b="+b+"&d="+d+"";
              window.location.href=url;
          }
          function po(s){
              var c=s;
              $("#hid").fadeToggle();

          };
          function hide(){
              $("#hid").fadeToggle();
          }
          $(function(){
              var startage=1;
              $("#first").html(startage);

              $("#minus").click(function(){
                  console.log(startage);
                  startage--;
                  if(startage==0){
                      startage++;

                  }
                  $("#first").html(startage);
                  return;
              });

              $("#add").click(function(){
                  console.log("13");
                  ++startage;
                  $("#first").html(startage);
                  return;
              });

          });

      </script>
</html>
