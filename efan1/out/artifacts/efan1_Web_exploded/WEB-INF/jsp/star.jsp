<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/4 0004
  Time: 下午 3:32
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
    <title>明星列表</title>

    <script  src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        var currentPage=1;
        function preOrNextPage(tmp) {

            if (tmp == 0) { // 第一页不需要在请求
                return;
            }
            currentPage=tmp;
            $("table  tr:not(:first)").empty("");
            $.get("<%=path%>/star/selectStar", {
                "starname": $("#demo").val(),
                "content": $("#input").val(),
                "upStatus": $("#two").val(),
                "sort": $("#three").val(),
                "currentPage": currentPage,
                "count": 5
            }, function (data) {
                if(data.length>=1) {
                for (var i in data) {
                    var str = "<%=path%>/star/viewStar?showid=" + data[i].starid;
                    var edit = "<%=path%>/star/editStar?showid=" + data[i].starid;
                    var upStatus = "<%=path%>/star/updateUpStatus?showid=" + data[i].starid + "&starshelf=" + data[i].starshelf;
                    var delStatus = "<%=path%>/star/updateDelStatus?showid=" + data[i].starid;
                    if (data[i].starshelf == 1) {
                        $("table").append('<tr id="tr"> ' +
                                '<th class="tdClass"><input type="checkbox" name="ck" value="'+ data[i].starid+'"></th>' +
                                '<th class="tdClass">' + data[i].starid + '</th>' +
                                '<th class="tdClass">' + data[i].starname + '</th>' +
                                '<th class="tdClass">' + data[i].starfans + '</th>' +
                                '<th class="tdClass">' + data[i].startime + '</th>' +
                                '<th class="tdClass"> 已上架  </th>' +
                                '<th class="tdClass">' + data[i].rank + '</th>' +
                                '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></th>' +
                                '</tr>');
                    } else if (data[i].starshelf == 0) {
                        $("table").append('<tr id="tr"> ' +
                                '<th class="tdClass"><input type="checkbox" name="ck" value="'+ data[i].starid+'"></th>' +
                                '<th class="tdClass">' + data[i].starid + '</th>' +
                                '<th class="tdClass">' + data[i].starname + '</th>' +
                                '<th class="tdClass">' + data[i].starfans + '</th>' +
                                '<th class="tdClass">' + data[i].startime + '</th>' +
                                '<th class="tdClass">未上架</th>' +
                                '<th class="tdClass">' + data[i].rank + '</th>' +
                                '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<a href="' + edit + '"><span>编辑</span></a>&nbsp;&nbsp;<a href="' + delStatus + '"><span>删除</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>上架</span></th>' +
                                '</tr>');
                    }
                }
                    return;
                }
                currentPage--;
                preOrNextPage(currentPage);
                return;
            });

        }
        $.get("<%=path%>/star/first?currentPage=1&count=5", function (data) {
            for (var i in data) {
                var str = "<%=path%>/star/viewStar?showid=" + data[i].starid;
                var edit = "<%=path%>/star/editStar?showid=" + data[i].starid;
                var upStatus = "<%=path%>/star/updateUpStatus?showid=" + data[i].starid + "&starshelf=" + data[i].starshelf;
                var delStatus = "<%=path%>/star/updateDelStatus?showid=" + data[i].starid;
                if (data[i].starshelf == 1) {
                    $("table").append('<tr id="tr"> ' +
                            '<th class="tdClass"><input type="checkbox" name="ck" value="'+ data[i].starid+'"></th>' +
                            '<th class="tdClass">' + data[i].starid + '</th>' +
                            '<th class="tdClass">' + data[i].starname + '</th>' +
                            '<th class="tdClass">' + data[i].starfans + '</th>' +
                            '<th class="tdClass">' + data[i].startime + '</th>' +
                            '<th class="tdClass"> 已上架</th>' +
                            '<th class="tdClass">' + data[i].rank + '</th>' +
                            '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></th>' +
                            '</tr>');
                } else if (data[i].starshelf == 0) {
                    $("table").append('<tr id="tr"> ' +
                            '<th class="tdClass"><input type="checkbox" name="ck" value="'+ data[i].starid+'"> </th>' +
                            '<th class="tdClass">' + data[i].starid + '</th>' +
                            '<th class="tdClass">' + data[i].starname + '</th>' +
                            '<th class="tdClass">' + data[i].starfans + '</th>' +
                            '<th class="tdClass">' + data[i].startime + '</th>' +
                            '<th class="tdClass">未上架</th>' +
                            '<th class="tdClass">' + data[i].rank + '</th>' +
                            '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<a href="' + edit + '"><span>编辑</span></a>&nbsp;&nbsp;<a href="' + delStatus + '"><span>删除</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>上架</span></th>' +
                            '</tr>');
                }
            }
        });
        $(function(){


                $("#btn1").click(function () {
                    $("table  tr:not(:first)").empty("");
                    $.get("<%=path%>/star/selectStar", {
                        "starname": $("#demo").val(),
                        "content": $("#input").val(),
                        "upStatus": $("#two").val(),
                        "sort": $("#three").val(),
                        "currentPage": currentPage,
                        "count": 5
                    }, function (data) {
                        for (var i in data) {
                            var str = "<%=path%>/star/viewStar?showid=" + data[i].starid;
                            var edit = "<%=path%>/star/editStar?showid=" + data[i].starid;
                            var upStatus = "<%=path%>/star/updateUpStatus?showid=" + data[i].starid + "&starshelf=" + data[i].starshelf;
                            var delStatus = "<%=path%>/star/updateDelStatus?showid=" + data[i].starid;
                            if (data[i].starshelf == 1) {
                                $("table").append('<tr id="tr"> ' +
                                        '<th class="tdClass"><input type="checkbox" name="ck" value="'+ data[i].starid+'"></th>' +
                                        '<th class="tdClass">' + data[i].starid + '</th>' +
                                        '<th class="tdClass">' + data[i].starname + '</th>' +
                                        '<th class="tdClass">' + data[i].starfans + '</th>' +
                                        '<th class="tdClass">' + data[i].startime + '</th>' +
                                        '<th class="tdClass"> 已上架  </th>' +
                                        '<th class="tdClass">' + data[i].rank + '</th>' +
                                        '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></th>' +
                                        '</tr>');
                            } else if (data[i].starshelf == 0) {
                                $("table").append('<tr id="tr"> ' +
                                        '<th class="tdClass"><input type="checkbox" name="ck" value="'+ data[i].starid+'"></th>' +
                                        '<th class="tdClass">' + data[i].starid + '</th>' +
                                        '<th class="tdClass">' + data[i].starname + '</th>' +
                                        '<th class="tdClass">' + data[i].starfans + '</th>' +
                                        '<th class="tdClass">' + data[i].startime + '</th>' +
                                        '<th class="tdClass">未上架</th>' +
                                        '<th class="tdClass">' + data[i].rank + '</th>' +
                                        '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<a href="' + edit + '"><span>编辑</span></a>&nbsp;&nbsp;<a href="' + delStatus + '"><span>删除</span>&nbsp;&nbsp;<a href="' + upStatus + '"><span>上架</span></th>' +
                                        '</tr>');
                            }
                        }
                    });
                });

        $("#btn2").click(function(){
            window.location.href="<%=path%>/star/addStar";
        });

        });
      /*  function updateUpStatus(emp){
            var id=$(emp).parent().parent().find("th").eq(0).text();
            $.get("updateUpStatus?id="+id)
        }*/
        function deleteAll() {
            var all = $("input:checked[name='ck']"); //所有name为ck并且是选择状态的checkbox
            console.log(all.length); //所有选中的复选框的长度
            if(all.length == 0) {
                alert("请选择,然后进行删除");
                return; //下面代码不执行
            }
            //删除
            var str=",";
            var ids="";
            for(var i = 0; i < all.length; i++) {
              console.log($("input:checked[name='ck']").attr("value"));
                ids=ids+$("input:checked[name='ck']").attr("value")+str;
                console.log(ids+"++++++");
                all[i].parentNode.parentNode.remove();

            }
            window.location.href="<%=path%>/star/deleteAll?ids="+ids;
        }
    </script>
</head>
<body>
<br>
明星列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1代表上架，0代表未上架)
<br><br>
<select style="width: 150px;height: 50px" id="demo">
    <option value="starname">姓名</option>
</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 50px" id="input">&nbsp;&nbsp;

<select style="width: 150px;height: 50px" id="two">
    <option value="-1">状态</option>
    <option value="1"> 已上架</option>
    <option value="0">未上架</option>
</select>&nbsp;&nbsp;
<select style="width: 150px;height: 50px" id="three">
    <option value="-1">排序</option>
    <option value="0">按排名正序</option>
    <option value="1">按排名倒序</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button  style="width: 100px;height: 50px"  onclick="preOrNextPage(1)">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 50px" onclick="window.location.href='addStar'">新增</button>
&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 50px" onclick="deleteAll()">批量删除</button>
<br><br><br>
<table width="100%" border="1" cellspacing="0" cellpadding="0" id="mytab">
    <tr>
        <th>选择</th>
        <th>序号</th>
        <th>姓名</th>
        <th>粉丝数</th>
        <th>新增时间</th>
        <th>上架状态</th>
        <th>排名</th>
        <th>操作</th>
    </tr>
   <%-- <c:forEach items="${starlist}" var="star">
        <tr>
            <th>${star.starid}</th>
            <th>${star.starname}</th>
            <th>${star.starfans}</th>
            <th>${star.startime}</th>
            <th>${star.rank}</th>
            <c:if test="${star.starshelf==0}">
                <th>未上架</th>
            </c:if>
            <c:if test="${star.starshelf==1}">
                <th>已上架</th>
            </c:if>
           <c:if test="${star.starshelf==1}">
    <th>&nbsp;&nbsp;&nbsp;<a href="<%=path%>/star/viewStar?showid=${star.starid}">查看</a>&nbsp;&nbsp;&nbsp;<a  href="<%=path%>/star/updateUpStatus?showid=${star.starid}&starshelf=${star.starshelf}">下架</a></th>
</c:if>
    <c:if test="${star.starshelf==0}">
        <th>&nbsp;&nbsp;&nbsp;<a href="<%=path%>/star/viewStar?showid=${star.starid}">查看</a>&nbsp;&nbsp;&nbsp;<a href="<%=path%>/star/editStar?showid=${star.starid}">编辑</a> &nbsp;&nbsp;&nbsp;<a  href="<%=path%>/star/updateDelStatus?showid=${star.starid}">删除</a>&nbsp;&nbsp;&nbsp;<a  href="<%=path%>/star/updateUpStatus?showid=${star.starid}&starshelf=${star.starshelf}">上架</a></th>
    </c:if>
    </tr>
    </c:forEach>--%>
</table>
<button style="width: 100px;height: 40px" onclick="preOrNextPage(currentPage-1)">上一页</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 40px" onclick="preOrNextPage(currentPage+1)">下一页</button>
</body>
</html>
