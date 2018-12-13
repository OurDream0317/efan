<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>E娱平台后台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<LINK rel="stylesheet" type="text/css" href="${baseurl}js/easyui/styles/default.css">
	<script src="<%=path%>/js/jquery-3.1.1.js"></script>

<%@ include file="/WEB-INF/jsp/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/common_js.jsp"%>
<SCRIPT type="text/javascript">
    var tabOnSelect = function(title) {
		//根据标题获取tab对象
		var currTab = $('#tabs').tabs('getTab', title);
		var iframe = $(currTab.panel('options').content);//获取标签的内容
		
		var src = iframe.attr('src');//获取iframe的src
		//当重新选中tab时将ifram的内容重新加载一遍，目的是获取当前页面的最新内容
		if (src)
			$('#tabs').tabs('update', {
				tab : currTab,
				options : {
					content : createFrame(src)//ifram内容
				}
			});


	};
	var _menus;
	$(function() {//预加载方法
		//通过ajax请求菜单
		/* $.ajax({
			url : '${baseurl}menu.json',
			type : 'POST',
			dataType : 'json',
			success : function(data) {
				_menus = data;
				initMenu(_menus);//解析json数据，将菜单生成
			},
			error : function(msg) {
				alert('菜单加载异常!');
			}
		}); */

		//tabClose();
		//tabCloseEven();

		$('#tabs').tabs('add', {
			title : '欢迎使用',
			content : createFrame('${baseurl}welcome.jsp')
		}).tabs({
			//当重新选中tab时将ifram的内容重新加载一遍
			onSelect : tabOnSelect
		});
		
		//修改密码
		$('#modifypwd').click(menuclick);

	});

	//退出系统方法
	function logout() {
		_confirm('您确定要退出本系统吗?',null,
				function(){
					location.href = '${baseurl}logout';
				}
		)
	}



	//帮助
	function showhelp(){
	    window.open('${baseurl}help/help.html','帮助文档'); 
	}
	
	
</SCRIPT>
	<script type="text/javascript">
		$(function(){
		$("#hid5").click(function(){
			console.log("123alsjflkajgd");
         $("#div1").fadeToggle();
			$("#div2").fadeToggle();
		 });

			$("#hid6").click(function(){
				console.log("123alsjflkajgd");
				$("#div3").fadeToggle();
				$("#div4").fadeToggle();
			});
			$("#hid10").click(function(){
				console.log("123alsjflkajgd");
				$("#div5").fadeToggle();
				$("#div6").fadeToggle();
			});
		});
	</script>

<style type="text/css">
	#div1,#div2,#div3,#div4,#div5,#div6{
		display: none;
	}
</style>

<META name="GENERATOR" content="MSHTML 9.00.8112.16540">
</HEAD>

<BODY style="overflow-y: hidden;" class="easyui-layout" scroll="no" >
	<DIV
		style='background: url("images/layout-browser-hd-bg.gif") repeat-x center 50% rgb(127, 153, 190); height: 30px; color: rgb(255, 255, 255); line-height: 20px; overflow: hidden; font-family: Verdana, 微软雅黑, 黑体;'
		border="false" split="true" region="north">
		<SPAN style="padding-right: 20px; float: right;" class="head">

			<a href="${baseurl}user/toLogin">登录</a>
			<c:if test="${activeUser.managestatus==2}">
				欢迎当前用户：${activeUser.nickname}&nbsp;&nbsp;
			</c:if>
           <c:if test="${activeUser.managestatus!=2}">
			   欢迎当前用户：${activeUser.manageacc}&nbsp;&nbsp;
            </c:if>

			<A href=javascript:showhelp()>使用帮助</A>
			&nbsp;&nbsp;
			<A title='修改密码' ref='modifypwd' href="#" rel='${baseurl}user/updatepwd.action' icon='icon-null' id="modifypwd" >修改密码</A>
			&nbsp;&nbsp;
			<A id="loginOut" href=javascript:logout()>退出系统</A>

		</SPAN> <SPAN style="padding-left: 10px; font-size: 16px;"><IMG
			align="absmiddle" src="images/blocks.gif" width="20" height="20">
			E娱后台管理系统</SPAN> <SPAN style="padding-left: 15px;" id="News"></SPAN>
	</DIV>

	<DIV style="background: rgb(210, 224, 242); height: 30px;" split="false"
		region="south">

		<DIV class="footer">
			系统版本号：${version_number}&nbsp;&nbsp;&nbsp;发布日期：${version_date}
		</DIV>
	</DIV>

	<DIV style="width: 180px;" id="west" title="导航菜单" split="true"
		region="west" hide="true">

		<DIV id="nav" class="easyui-accordion" border="false" fit="true">
			
			<c:if test="${activeUser!=null }">
				<ul>
				<c:forEach items="${activeUser.menuList }" var="menu">

					<c:if test="${menu.parentid==0}">
						<c:choose>
							<c:when test="${menu.upermissionid==5}">

								<div><a title="${menu.upermissionname}" id="hid5" >&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">${menu.upermissionname }</span></a></div>
								<div id="div1">&nbsp;&nbsp;<a title="票务订单" href="javascript:addTab('票务订单','${baseurl }/order/ordernote')">&nbsp;&nbsp; <span class="icon icon-log">&nbsp;</span><span class="nav">票务订单</span></a></div>

								<c:if test="${activeUser.managestatus!=2}">
									<div id="div2">&nbsp;&nbsp;<a title="商品订单" href="javascript:addTab('商品订单','${baseurl }/order/orderproduct')">&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">商品订单</span></a></div>
								</c:if>


							</c:when>
							<c:when test="${menu.upermissionid==6}">

								<div><a title="${menu.upermissionname}" id="hid6" >&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">${menu.upermissionname }</span></a></div>

								<div id="div3">&nbsp;&nbsp;<a title="新闻" href="javascript:addTab('新闻','${baseurl }/news/first')">&nbsp;&nbsp; <span class="icon icon-log">&nbsp;</span><span class="nav">新闻</span></a></div>
								<div id="div4">&nbsp;&nbsp;<a title="话题" href="javascript:addTab('话题','${baseurl }/order/')">&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">话题</span></a></div>


							</c:when>
							<c:when test="${menu.upermissionid==10}">
								<%--<div><a title="${menu.upermissionname}" id="hid10" >&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">${menu.upermissionname }</span></a></div>--%>
					       <%-- <div>
					        <a id="${menu.upermissionid}" title="${menu.upermissionname }" ref="1_1" href="#"
					            rel="${baseurl }${menu.upermissionurl }" icon="icon-log"><span
							class="icon icon-log">&nbsp;</span><span class="nav"><a href=javascript:addTab('${menu.upermissionname }','${baseurl }/findAll')>人员管理</a></span></a>
		                    </div>
--%>

								<div><a title="${menu.upermissionname}" id="hid10" >&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">${menu.upermissionname }</span></a></div>

								<div id="div5">&nbsp;&nbsp;<a title="人员管理" href="javascript:addTab('人员管理','${baseurl }/findAll')">&nbsp;&nbsp; <span class="icon icon-log">&nbsp;</span><span class="nav">人员管理</span></a></div>
								<div id="div6">&nbsp;&nbsp;<a title="角色管理" href="javascript:addTab('角色管理','${baseurl }/urole/findAll')">&nbsp;&nbsp;<span class="icon icon-log">&nbsp;</span><span class="nav">角色管理</span></a></div>

							</c:when>
							<c:otherwise>

						<li>
							<div>
								<a id="${menu.upermissionid}" title="${menu.upermissionname }" ref="1_1" href="#"
								   rel="${baseurl }${menu.upermissionurl }" icon="icon-log"><span
										class="icon icon-log">&nbsp;</span><span class="nav"><a href=javascript:addTab('${menu.upermissionname }','${baseurl }${menu.upermissionurl}')>${menu.upermissionname }</a></span></a>
								</div>
						</li>
							</c:otherwise>
						</c:choose>
						<%--<c:forEach items="${activeUser.menuList }" var="per">
							<c:if test="${per.parentid==menu.upermissionid}">
								<li>
									<div id="div1" style="width:80px;height:80px;background-color:red;">
										<a id="${per.upermissionid}" title="${per.upermissionname }" ref="1_1" href="#"
										   rel="${baseurl }${per.upermissionurl }" icon="icon-log">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
												class="icon icon-log">&nbsp;</span><span class="nav"><a href=javascript:addTab('${per.upermissionname }','${baseurl }${per.upermissionurl}')>${per.upermissionname }</a></span></a>
									</div>
								</li>

							</c:if>
						</c:forEach>
--%>
					</c:if>

					<%--<c:if test="${menu.upermissionid==5}">
						<li id="hid" style="display:inline;margin-left:0px;">
							<div>
								<a title="票务订单" ref="1_1" href="#"
								   rel="${baseurl }/order/orlist" icon="icon-log"><span
										class="icon icon-log">&nbsp;</span><span class="nav"><a href=javascript:addTab('票务订单','${baseurl }/order/orlist')>票务订单</a></span></a>
							</div>
						</li>

					</c:if>--%>

				</c:forEach>
				</ul>
			</c:if>

			<UL>

			</UL>
		</DIV>
	</DIV>

	<DIV style="background: rgb(238, 238, 238); overflow-y: hidden;"
		id="mainPanle" region="center">
		<DIV id="tabs" class="easyui-tabs" border="false" fit="true"></DIV>
	</DIV>


</BODY>
</HTML>
