<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<script type="text/javascript">


</script>
<head>
    <title>地址管理</title>
    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
</head>
<script type="text/javascript"></script>
<body>
    <c:forEach items="${adress}" var="p">
        <div>
        <a>${p.username}</a><a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${p.userphone}
        </a><br>
        <tr>${p.address}</tr><br>
            <label onclick="po('${p.addressid}','${p.userid}')"><input type="checkbox" name="upermissionid"  /></label>设置为默认地址<br>
            <a onclick="upd('${p.addressid}')">编辑</a>
            <a onclick="del('${p.addressid}','${p.userid}')">删除</a>
        </div>
        <br><br>
    </c:forEach>

    <br><br><br><br><br>
    <a onclick="add(${userid})">新增地址</a>

    <div id="hid">
        <form action="<%=path%>/adress/add">
            <input type="text" name="userid" id="second"/>
            姓名:<input type="text" name="username"><br>
            联系电话:<input type="text" name="userphone"><br>
            收货地址:<input type="text" name="address"><br>
            <input type="submit" value="保存">
        </form>
    </div>

    <div id="hid1">
        <form action="<%=path%>/adress/update">
            <input type="text" name="addressid" id="third"/>
            姓名:<input type="text" name="username"><br>
            联系电话:<input type="text" name="userphone"><br>
            收货地址:<input type="text" name="address"><br>
            <input type="submit" value="保存">
        </form>
    </div>
    <br>${ad}
</body>
<style type="text/css">
    #hid{
        display: none;
    }
    #hid1{
        display: none;
    }
</style>
<script type="text/javascript">
    function add(s){
        $("#second").val(${user.userid});
        $("#hid").fadeToggle();
    }

    function upd(s){
        $("#third").val(s);
        $("#hid1").fadeToggle();
    }

    function hide(){
        $("#hid").fadeToggle();
        $("#hid1").fadeToggle();
    }
    function po(s,t){
        var addressid=s;
        var userid=t;
        $.get("<%=path%>/adress/set",{"addressid":addressid,"userid":userid});
        window.location.reload();

    }
    function del(s,t){
        console.log(s);
        console.log(t);
        var addressid=s;
        var userid=t;
        if(confirm("你确定要删除吗")){
            $.get("<%=path%>/adress/delete",{"addressid":addressid,"userid":userid});
            window.location.reload();
        }
    }
  /*  function upd(s){
        $.get("<%=path%>/adress/update",{"addressid":addressid});
    }
*/
</script>
</html>
