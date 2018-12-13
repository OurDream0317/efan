<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="<%=path%>/js/jquery-3.1.1.js"></script>
<html>
<head>
    <title>角色管理</title>
</head>
<style type="text/css">
    #hid1{
        position: absolute;
        left:400px;
        top:300px;
        z-index:2;
        background:#cccccc;
        width:280px;
        height: 250px;

    }
    #hid1{
       display: none;
    }

    #hid2{
        position: absolute;
        left:400px;
        top:300px;
        z_index:2;
        background: #C1C1C1;
        width: 800px;
        height: 200px;
    }
    #hid2{
        display: none;
    }

</style>
<script type="text/javascript">
    function sb(s){
        console.log(s);
        $("#uroleid").val(s);
        $("#hid2").fadeToggle();
    }
    function hide2(){
        $("#hid2").fadeToggle();
    }



   function po(){
        $("#hid1").fadeToggle();
    }
    function hide1(){
        $("#hid1").fadeToggle();
    }

   /* function  submit(){

        console.log($("#first").val())
      $.get("<%=path%>/urole/add",{"uroleName":$("#first").val()});

    }*/

</script>




<body>
<p>角色列表</p>
<%--<input type="button" value="添加角色" onclick="fo()">--%>
<td><button style="width: 100px;height: 35px;color:#333;" onclick="po()">添加角色</button></td>
    <table  width="100%" border=1 class="table" id="table">
        <tr>
            <td>序号</td>
            <td>用户角色</td>
            <td>功能设置</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${findAll}" var="urol">

            <tr>
                <td>${urol.uroleid}</td>
                <td>${urol.urolename}</td>
                <td><a onclick="sb(${urol.uroleid})">操作设置</a>
                <td><a href="<%=path%>/urole/delete?uroleName=${urol.urolename}">删除</a></td>

            </tr>
        </c:forEach>

    </table>
<div id="hid2">
<form action="<%=path%>/urole/insert" method="post">
    <input type="text" name="uroleid" id="uroleid" readonly="readonly">
    <p>功能设置</p><br>
    <label><input type="checkbox" name="upermissionid" value="1" checked="checked" />用户管理</label>
    <label><input type="checkbox" name="upermissionid" value="2" checked="checked" />黄牛管理</label>
    <label><input type="checkbox" name="upermissionid" value="3" checked="checked" />演出管理</label>
    <label><input type="checkbox" name="upermissionid" value="4" checked="checked" />商品管理</label>
    <label><input type="checkbox" name="upermissionid" value="5" checked="checked" />订单管理</label>
    <label><input type="checkbox" name="upermissionid" value="6" checked="checked" />内容管理</label>
    <label><input type="checkbox" name="upermissionid" value="7" checked="checked" />轮播图管理</label>
    <label><input type="checkbox" name="upermissionid" value="8" checked="checked" />明星管理</label>
    <label><input type="checkbox" name="upermissionid" value="9" checked="checked" />意见反馈</label>
    <label><input type="checkbox" name="upermissionid" value="10" checked="checked" />系统管理</label>
    <label><input type="checkbox" name="upermissionid" value="11" checked="checked" />系统消息</label>
    <label><input type="checkbox" name="upermissionid" value="12" checked="checked" />修改密码</label>
  <%--  <label><input type="checkbox" name="upermissionid" value="13" checked="checked" /></label>
    <label><input type="checkbox" name="check" value="14" checked="checked" /></label>
    <label><input type="checkbox" name="check" value="15" checked="checked" /></label>--%>
    <input type="submit" id="btn" value="确定" />
    <input type="button" name="button" value="返回" onclick="hide2()"/>

</form>
    </div>

<div id="hid1">
    <form action="<%=path%>/urole/add" method="get">
        角色名称:<input type="text" name="uroleName" id="first" style="width:100px;height: 50px;"><br>
        <input type="submit" value="提交" <%--onclick="submit()" --%>style="align-content: center"/>
        <input type="button" name="button" value="返回" onclick="po()"/>
    </form>
</div>

</body>
</html>
