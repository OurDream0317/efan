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
	</title>添加人员</title>
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
</head>
<body>
<form action="<%=path%>/addManage1" method="post" >
	账号:<input type="text" name="manageacc"><br>
	姓名:<input type="text" name="managename"><br>
	密码:<input type="password" name="managerpassword"><br>
	确认密码:<input type="password" name="rmanagerpassword"><br>
	用户角色:<select name="nickname" id="aa">
	<%--<c:forEach items="${findAll}" var="find">
	<option value="${find.urolename}">${find.urolename}</option>
	</c:forEach>--%>

          </select><br>
	<input type="submit" value="提交">

</form>
<script type="text/javascript">
	$(function(){
		$.get("<%=path%>/urole/findAllRole",function(data){
			console.log(data);
			var html="";
			for(var i=0;i<data.length;i++){
				if(data[i].urolename==="黄牛"){
					continue;
				}
				html+="<option  value="+data[i].urolename+">"+data[i].urolename+"</option>";

			}
			$("#aa").append(html);

		});
	});

</script>
</body>

</html>