<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/5 0005
  Time: 下午 7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path =request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

    <script  src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        var currentPage=1;
        function method(tmp){
            currentPage=tmp;
            $("table  tr:not(:first)").empty("");
            $.get("<%=path%>/news/findNewsAllDemo", {
                "demo": $("#demo").val(),
                "content": $("#input").val(),
                "upStatus": $("#two").val(),
                "tStatus": $("#three").val(),
                "currentPage": currentPage,
                "count": 5
            }, function (data) {
                if(data.length>=1) {
                for (var i in data) {
                        var str = "<%=path%>/news/viewNews?newsid=" + data[i].newsid;
                        var edit = "<%=path%>/news/editNews?newsid=" + data[i].newsid;
                        var upStatus = "<%=path%>/news/updateUpStatus?newsid=" + data[i].newsid + "&newsshelf=" + data[i].newsshelf;
                        var delStatus = "<%=path%>/news/updateDelStatus?newsid=" + data[i].newsid;
                        var tStatus = "<%=path%>/news/updateTStatus?newsid=" + data[i].newsid + "&newsrecomment=" + data[i].newsrecomment;
                        if (data[i].newsshelf == 0) {
                            $("table").append('<tr>' +
                                    '<th>' + data[i].newsid + '</th>' +
                                    '<th>' + data[i].newstitle + '</th>' +
                                    '<th>' + data[i].readnumber + '</th>' +
                                    '<th>' + data[i].clicknumber + '</th>' +
                                    '<th>' + data[i].commentnumber + '</th>' +
                                    '<th>' + data[i].newstime + '</th>' +
                                    '<th>' + "未上架" + '</th>' +
                                    '<th><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<span>编辑</span>&nbsp;&nbsp;<a href="' + delStatus + '"><span>删除</span></a>&nbsp;&nbsp;<a href="' + upStatus + '"><span>上架</span></a>' + '</tr>')
                        } else if (data[i].newsshelf == 1) {
                            if (data[i].newsrecomment == 0) {
                                $("table").append('<tr>' +
                                        '<th>' + data[i].newsid + '</th>' +
                                        '<th>' + data[i].newstitle + '</th>' +
                                        '<th>' + data[i].readnumber + '</th>' +
                                        '<th>' + data[i].clicknumber + '</th>' +
                                        '<th>' + data[i].commentnumber + '</th>' +
                                        '<th>' + data[i].newstime + '</th>' +
                                        '<th>' + "已上架" + '</th>' +
                                        '<th><a href="' + str + '"><span>查看</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></a>&nbsp;&nbsp;<a href="' + tStatus + '"><span>推荐</span></a>' + '</tr>')
                            }
                            if (data[i].newsrecomment == 1) {
                                $("table").append('<tr>' +
                                        '<th>' + data[i].newsid + '</th>' +
                                        '<th>' + data[i].newstitle + '</th>' +
                                        '<th>' + data[i].readnumber + '</th>' +
                                        '<th>' + data[i].clicknumber + '</th>' +
                                        '<th>' + data[i].commentnumber + '</th>' +
                                        '<th>' + data[i].newstime + '</th>' +
                                        '<th>' + "已上架" + '</th>' +
                                        '<th><a href="' + str + '"><span>查看</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></a>&nbsp;&nbsp;<a href="' + tStatus + '"><span>不推荐</span></a>' + '</tr>')
                            }
                        }
                }
                    return;
                }
                currentPage--;
                preOrNextPage(currentPage);
                return;
            });
        }



        function preOrNextPage(tmp) {

            if (tmp == 0) { // 第一页不需要在请求
                return;
            }
            currentPage = tmp;
            $("table  tr:not(:first)").empty("");
            method(tmp);
        }
        $(function(){
                $("#btn1").click(function(){
                    method();
                });
            $.get("<%=path%>/news/findNewsAll",{"currentPage":currentPage,"count":5},function(data){
                console.log(data)
                for(var i in data) {
                        var str = "<%=path%>/news/viewNews?newsid=" + data[i].newsid;
                        var edit = "<%=path%>/news/editNews?newsid=" + data[i].newsid;
                        var upStatus = "<%=path%>/news/updateUpStatus?newsid=" + data[i].newsid + "&newsshelf=" + data[i].newsshelf;
                        var delStatus = "<%=path%>/news/updateDelStatus?newsid=" + data[i].newsid;
                        var tStatus = "<%=path%>/news/updateTStatus?newsid=" + data[i].newsid + "&newsrecomment=" + data[i].newsrecomment;
                        if (data[i].newsshelf == 0) {
                            $("table").append('<tr>' +
                                    '<th>' + data[i].newsid + '</th>' +
                                    '<th>' + data[i].newstitle + '</th>' +
                                    '<th>' + data[i].readnumber + '</th>' +
                                    '<th>' + data[i].clicknumber + '</th>' +
                                    '<th>' + data[i].commentnumber + '</th>' +
                                    '<th>' + data[i].newstime + '</th>' +
                                    '<th>' + "未上架" + '</th>' +
                                    '<th><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<span>编辑</span>&nbsp;&nbsp;<a href="' + delStatus + '"><span>删除</span></a>&nbsp;&nbsp;<a href="' + upStatus + '"><span>上架</span></a>' + '</tr>')
                        } else if (data[i].newsshelf == 1) {
                            if (data[i].newsrecomment == 0) {
                                $("table").append('<tr>' +
                                        '<th>' + data[i].newsid + '</th>' +
                                        '<th>' + data[i].newstitle + '</th>' +
                                        '<th>' + data[i].readnumber + '</th>' +
                                        '<th>' + data[i].clicknumber + '</th>' +
                                        '<th>' + data[i].commentnumber + '</th>' +
                                        '<th>' + data[i].newstime + '</th>' +
                                        '<th>' + "已上架" + '</th>' +
                                        '<th><a href="' + str + '"><span>查看</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></a>&nbsp;&nbsp;<a href="' + tStatus + '"><span>推荐</span></a>' + '</tr>')
                            }
                            if (data[i].newsrecomment == 1) {
                                $("table").append('<tr>' +
                                        '<th>' + data[i].newsid + '</th>' +
                                        '<th>' + data[i].newstitle + '</th>' +
                                        '<th>' + data[i].readnumber + '</th>' +
                                        '<th>' + data[i].clicknumber + '</th>' +
                                        '<th>' + data[i].commentnumber + '</th>' +
                                        '<th>' + data[i].newstime + '</th>' +
                                        '<th>' + "已上架" + '</th>' +
                                        '<th><a href="' + str + '"><span>查看</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></a>&nbsp;&nbsp;<a href="' + tStatus + '"><span>不推荐</span></a>' + '</tr>')
                            }
                        }
                    }


            });

        });
    </script>
        <title>新闻</title>
</head>
<body>
新闻列表
<br><br><br><br>
<select style="width: 150px;height: 50px" id="demo">
    <option value="新闻编号">新闻编号</option>
    <option value="新闻标题">新闻标题</option>
</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 50px" id="input">&nbsp;&nbsp;

<select style="width: 150px;height: 50px" id="two">
    <option value="-1">状态</option>
    <option value="1"> 已上架</option>
    <option value="0">未上架</option>
</select>&nbsp;&nbsp;
<select style="width: 150px;height: 50px" id="three">
    <option value="-1">是否推荐</option>
    <option value="0">未推荐</option>
    <option value="1">已推荐</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button  style="width: 100px;height: 50px"  onclick="preOrNextPage(1)">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 50px" onclick="window.location.href='addNews'">新增</button>
<br><br><br>
<table width="100%" border="1" cellspacing="0" cellpadding="0" id="mytab">
    <tr>
        <th>新闻编号</th>
        <th>新闻标题</th>
        <th>阅读量</th>
        <th>点击量</th>
        <th>评论数</th>
        <th>新增时间</th>
        <th>上架状态</th>
        <th>操作</th>
    </tr>
</table>
<button style="width: 100px;height: 40px" onclick="preOrNextPage(currentPage-1)">上一页</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button style="width: 100px;height: 40px" onclick="preOrNextPage(currentPage+1)">下一页</button>
</body>
</html>
