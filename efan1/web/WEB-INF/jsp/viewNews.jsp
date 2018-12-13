<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/6 0006
  Time: 上午 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>查看新闻</title>
    <style>
        table,tr,th{
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
    <script  src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        var id=${news.newsid};

        console.log(id+"==============")

        $(function(){
            var icons="${news.newsicon}";
            console.log(icons+"+++++++++++");
            if(icons!=null&&icons.length>0) {
                var icon = icons.split(",");
                console.log(icon);
                for (var i = 0; i < icon.length; i++) {
                    var src1 = "<%=path%>/image/" + icon[i];
                    console.log(src1)
                    $("#span" + i).html("<span><img src=" + src1 + "></span>");
                }
            }
           $.get("<%=path%>/news/see",{"id":id},function(data){
               console.log(data)
               for(var i in data) {
                   var str="<%=path%>/comment/first?img="+data[i].commentimg+"&id="+data[i].commentid+
                   "&nikename="+data[i].nikename+"&commentcontent="+data[i].commentcontent+"&commenttime="+data[i].commenttime;
                   var src1="<%=path%>/"+ data[i].commentimg;
                   $("table").append('<tr>' +
                           '<th>' + data[i].commentid + '</th>' +
                           '<th><img src='+src1+' style="width: 100px;height: auto"></th>' +
                           '<th>' + data[i].phone + '</th>' +
                           '<th>' + data[i].nikename + '</th>' +
                           '<th>' + data[i].commentcontent + '</th>' +
                           '<th>' + data[i].replys+ '</th>' +
                           '<th> <span>删除</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="'+str+'"><span>查看评论</span></a> </th>')
               }
           });
        });
    </script>

</head>
<body>
查看新闻
<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${news.newstitle}</b>
<br><br><br>

    &nbsp;&nbsp;<span style="width: 300px;height: 400px">${news.newscontent}</span>

&nbsp;&nbsp;<div  id="span0"></div>
&nbsp;&nbsp;<div  id="span1"></div>
&nbsp;&nbsp;<div  id="span2"></div>
&nbsp;&nbsp;<div  id="span3"></div>
&nbsp;&nbsp;<div  id="span4"></div>
&nbsp;&nbsp;<div  id="span5"></div>
&nbsp;&nbsp;<div  id="span6"></div>
&nbsp;&nbsp;<div  id="span7"></div>
&nbsp;&nbsp;<div  id="span8"></div>

<br><br><br><br>
<table>
    <tr>
    <th width="10%">序号</th>
    <th width="10%">头像</th>
    <th width="15%"> 手机号</th>
    <th width="15%"> 微信昵称</th>
    <th width="20%">评论内容</th>
    <th width="10%">回复条数</th>
    <th width="20%">操作</th>
    </tr>
</table>
</body>
</html>
