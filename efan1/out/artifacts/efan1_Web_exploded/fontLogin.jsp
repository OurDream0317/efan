<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员登录界面</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/body.css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css"/>
</head>
<body>
<div class="container">
	<section id="content">
		<form   action="<%=path%>/fontUser/findUser" method="post">
			<h1>会员登录</h1>
			<div>
				<input  type="text" placeholder="账号即手机号" required="" name="userphone" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="" name="password" />
			</div>
			 <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div> 
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登录" class="btn btn-primary" id="js-btn-login"/>
				<a href="#">忘记密码</a>
				<a href="fontRegister.jsp">注册</a>
			</div>
		</form><!-- form -->
		${msg}${usg}
		 <!-- <div class="button">
			<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			<a href="#">注册</a>	
		</div> --> <!-- button -->
	</section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>
<div style="text-align:center;">
<!-- <p>来源:More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p> -->
</div>
</body>
</html>