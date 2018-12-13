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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户列表</title>


	<script src="<%=path%>/js/jquery-3.1.1.js"></script>


<script type="text/javascript">
	var currentpage=1;//从第一页开始
     if(sessionStorage.getItem("currentpage")==null){
		 sessionStorage.setItem("currentpage",currentpage);
	 }



	console.log(currentpage);
	//点击
	function blue(){

		console.log("点击触发事件");
		console.log(sessionStorage.getItem("currentpage"));
		var nextPage="<%=path%>/user/selectByserch?demo="+$("#demo").val()+"&input="+$("#input1").val()+"&usersex="+$("#one").val()+
				"&useraddress="+$("#two").val()+"&userstatus="+$("#three").val()+"&currentpage="+sessionStorage.getItem("currentpage")+"&count=5";
        window.location=nextPage;
	}
	$(function(){

		//上一页
		$("#button1").click(function(){
			console.log("点击触发事件上一页");
			currentpage=sessionStorage.getItem("currentpage")-0-1
			console.log(currentpage);
			sessionStorage.setItem("currentpage",currentpage)
			if(currentpage==0){
				currentpage++;
				sessionStorage.setItem("currentpage",1)
				return;
			}else{
				blue();
			}
		});

//下一页
		$("#button2").click(function(){
			console.log("点击触发事件下一页");
			currentpage=sessionStorage.getItem("currentpage")-0+1;
			console.log(currentpage);
			sessionStorage.setItem("currentpage",currentpage);
			blue();
		});

	});


</script>




</head>
<body>
<select style="width: 150px;height: 30px" id="demo">
	<option value="昵称">昵称</option>
	<option value="账号">账号</option>
</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 30px" id="input1">&nbsp;&nbsp;
<select style="width: 150px;height: 30px" id="one">
	<option  value="">性别</option>
	<option value="男">男</option>
	<option value="女">女</option>
</select>&nbsp;&nbsp;
<select style="width: 150px;height: 30px" id="two">
	<option value="">所在地</option>
	<option value="北京"> 北京</option>
	<option value="上海">上海</option>
	<option value="河南"> 河南</option>
	<option value="浙江">浙江</option>
</select>&nbsp;&nbsp;
<select style="width: 150px;height: 30px" id="three">
	<option value="0">用户类型</option>
	<option value="1">普通用户</option>
	<option value="2">站长</option>
	<option value="3">待审核</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a onclick="blue()">
	<button id="group_id" style="width: 100px;height: 30px">查询</button></a>
<br>
<br>

用户列表：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="gift1" id="all"><label>全选</label>
<button id="aab" style="width: 100px;height: 30px">禁用</button>
<table width="100%" border=1>
	<tr>
		<td>用户id</td>
		<td>头像</td>
		<td>昵称</td>
		<td>手机号</td>
		<td>性别</td>
		<td>所在地</td>
		<td>用户类型</td>
		<td>禁用状态</td>
		<td>操作</td>
	</tr>
	<c:forEach items="${userList}" var="user">



		<tr>
			<td><input type="checkbox" name="gift" value="${user.userid}">${user.userid}</td>
			<td><img src="<%=basePath%>${user.usericon }" alt="头像" style="width: 50px;height: auto">
			</td>
			<td>${user.nickname}</td>
			<td>${user.userphone}</td>
			<td>${user.usersex}</td>
			<td>${user.useraddress}</td>
			<td>
			<c:if test="${user.userstatus==1}"><span>普通用户</span></c:if>
				<c:if test="${user.userstatus!=1}"><span>站长</span></c:if>

			</td>
			<td><c:if test="${user.userdisable==1}"><span>未禁用</span></c:if>
				<c:if test="${user.userdisable!=1}"><span>已禁用</span></c:if>

			</td>
			<td>
				<a href="<%=basePath%>user/selectuserbyid?userid=${user.userid}">用户详情</a>&nbsp;
				<c:if test="${user.userstatus==3}"><a href="<%=basePath%>user/selectuserbyid?userid=${user.userid}">审核</a> </c:if>
				<c:if test="${user.userstatus!=3}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
                <c:if test="${user.userdisable==1}"><a href="<%=basePath%>user/updatedisable?userid=${user.userid}&userdisable=${user.userdisable}">禁用</a> </c:if>
				<c:if test="${user.userdisable!=1}"><a href="<%=basePath%>user/updatedisable?userid=${user.userid}&userdisable=${user.userdisable}">取消禁用</a> </c:if>
			</td>
		</tr>
	</c:forEach>

</table>
<tr>
	<td colspan="8"><div><a href="">首页</a> <button id="button1">上一页</button> <span id="page"></span> <button id="button2">下一页</button>
	</div></td>
</tr>
</body>
</html>
<script>
	$(function () {
		/*当点击全选时让所有复选框选中，再次点击全不选*/
		$("#all").click(function(){
			if(this.checked){
				$("input[type='checkbox'][name='gift']").prop("checked", true);
			}else{
				$("input[type='checkbox'][name='gift']").prop("checked", false);
			}
		});



		$("#aab").click(function(){
			var valArr = "";
			$("input[type='checkbox'][name='gift']").each(function () {
				if($(this).prop("checked")==true){
					valArr+= $(this).val()+",";//转换为逗号隔开的字符串
				}
			});
			/*将选中的id返回到后台controller*/
			alert(valArr);
			$.get("updateuserdisable",{"valArr":valArr});
		});



	});

</script>