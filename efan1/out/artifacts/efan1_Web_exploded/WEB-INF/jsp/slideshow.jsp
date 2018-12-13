<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>轮播图管理</title>
</head>
<body>
<div id="first">
      <form action="<%=path%>/slide/addimg1" method="post" enctype="multipart/form-data">
      <input type="file" name="myFile" multiple="multiple"><br>

      图片上传的位置<select name="slidelocation">
              <option value="0">首页</option>
              <option value="1">新闻页</option>
              <option value="2">演出页</option>
          </select>
          <br>
          编号<input type="text" name="identifier"><br>
          <input type="submit" value="提交">
      </form>
</div>

    <table width="100%" border="1">
    <tr>
        <td>轮播图片</td>
        <td>轮播图位置</td>
        <td>编号</td>
        <td>新增日期</td>
        <td>上架状态</td>
        <td>操作</td>
    </tr>

        <c:forEach items="${slideAll}" var="slide">
         <tr>
             <td><img style='width:50px;height:50px' src=<%=path%>/${slide.slideimg}></td>
             <td>${slide.slidelocation}</td>
             <td>${slide.identifier}</td>
             <td><fmt:formatDate value="${slide.solideaddtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
             </td>
             <td>${slide.slideshelf}</td>
             <td>
                 <a href="<%=path%>/slide/delete?slideid=${slide.slideid}">删除</a>
                 <a href="<%=path%>/slide/update?slideshelf=${slide.slideshelf}&slideid=${slide.slideid}&slidelocation=${slide.slidelocation}">上(下)架</a>
             </td>
         </tr>
            </c:forEach>

    </table>
     ${shelf}
</body>
</html>
