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
    <title>商品列表</title>


    <script src="<%=path%>/js/jquery-3.1.1.js"></script>


    <script type="text/javascript">
        $(function(){

            //定义全局变量 当前的页数
            var currentpage=1;//从第一页开始
            $("#lab").html("第"+currentpage+"页");

            $.get("selectproductAll", {
                "demo": $("#demo").val(),
                "input": $("#input1").val(),
                "proshelf":$("#three").val(),
                "currentpage": currentpage,
                "count": 5
            }, function (data) {
                console.log(data)
                //获取到数据动态添加到表里 先删除之前的数据
                $(".table  tr:not(:first)").remove();
                //添加数据
                var html = "";
                for( var i = 0; i < data.length; i++ ) {
                    html += "<tr>";
                    html += "<td>" + data[i].proid + "</td>";
                    html += "<td>" + data[i].proname + "</td>";
                    html += "<td>" +data[i].proprice + "</td>";
                    html += "<td>" + data[i].properson + "</td>";
                    html += "<td>" +formatDateTime(data[i].protime) + "</td>";
                    if(data[i].proshelf==0){
                        html += "<td>未上架 </td>";
                    }else {
                        html += "<td>已上架 </td>";
                    }
                    var u= "selectproductByid?proid="+data[i].proid;
                    var u1= "editproduct?proid="+data[i].proid;
                    var u2= "deleteproduct?proid="+data[i].proid;
                    var u3= "updateproshelf?proid="+data[i].proid+"&proshelf="+data[i].proshelf;

                    if(data[i].proshelf==0){
                        html += "<td><a class=link_icon  href="+u+"> 查看</a> &nbsp;&nbsp; <a class=link_icon  href="+u1+"> 编辑</a>" +
                                "<a class=link_icon  href="+u2+"> 删除</a> &nbsp;&nbsp; <a class=link_icon  href="+u3+"> 上架</a> </td>";
                    }else {
                        html += "<td><a class=link_icon  href="+u+"> 查看</a> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class=link_icon  href="+u3+"> 下架</a> </td>";
                    }

                    html += "</tr>";
                }
                $("#mytab").append(html);
            });
            $("#group_id").click(function () {
                $.get("selectproductAll", {
                    "demo": $("#demo").val(),
                    "input": $("#input1").val(),
                    "proshelf":$("#three").val(),
                    "currentpage": currentpage,
                    "count": 5
                }, function (data) {
                    console.log(data);
                    if(data.length===0&&currentpage!=1){
                        currentpage--;
                        return;
                    }else {
                        $("#lab").html("当前是第" + currentpage + "页");
                        //获取到数据动态添加到表里 先删除之前的数据
                        $(".table  tr:not(:first)").remove();

                        //添加数据
                        var html = "";
                        for( var i = 0; i < data.length; i++ ) {
                            html += "<tr>";
                            html += "<td>" + data[i].proid + "</td>";
                            html += "<td>" + data[i].proname + "</td>";
                            html += "<td>" +data[i].proprice + "</td>";
                            html += "<td>" + data[i].properson + "</td>";
                            html += "<td>" +formatDateTime(data[i].protime) + "</td>";
                            if(data[i].proshelf==0){
                                html += "<td>未上架 </td>";
                            }else {
                                html += "<td>已上架 </td>";
                             }
                            var u= "selectproductByid?proid="+data[i].proid;
                            var u1= "editproduct?proid="+data[i].proid;
                            var u2= "deleteproduct?proid="+data[i].proid;
                            var u3= "updateproshelf?proid="+data[i].proid+"&proshelf="+data[i].proshelf;

                            if(data[i].proshelf==0){
                                html += "<td><a class=link_icon  href="+u+"> 查看</a> &nbsp;&nbsp; <a class=link_icon  href="+u1+"> 编辑</a>" +
                                        "<a class=link_icon  href="+u2+"> 删除</a> &nbsp;&nbsp; <a class=link_icon  href="+u3+"> 上架</a> </td>";
                            }else {
                                html += "<td><a class=link_icon  href="+u+"> 查看</a> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                        " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class=link_icon  href="+u3+"> 下架</a> </td>";
                            }
                            html += "</tr>";
                        }
                        $("#mytab").append(html);
                    }
                });
            });
//上一页
            $("#button1").click(function(){
                currentpage--;
                if(currentpage==0){
                    currentpage++;
                    return;
                }else{
                    $("#group_id").click();
                }
            });

//下一页
            $("#button2").click(function(){
                ++currentpage;
                $("#group_id").click();
            });

        });

        //将时间戳改为String类型的时间的方法
        function formatDateTime(timeStamp) {
            var date = new Date();
            date.setTime(timeStamp);
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? ('0' + m) : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            var h = date.getHours();
            h = h < 10 ? ('0' + h) : h;
            var minute = date.getMinutes();
            var second = date.getSeconds();
            minute = minute < 10 ? ('0' + minute) : minute;
            second = second < 10 ? ('0' + second) : second;
            return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
        };





    </script>






</head>
<body>
<select style="width: 150px;height: 30px" id="demo">
    <option value="商品编号">商品编号</option>
    <option value="商品名称">商品名称</option>
    <option value="发布方">发布方</option>
</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 30px" id="input1">&nbsp;&nbsp;


<select style="width: 150px;height: 30px" id="three">
    <option value="2">上架状态状态</option>
    <option value="0">未上架</option>
    <option value="1">已上架</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a >
    <button id="group_id" style="width: 100px;height: 30px">查询</button></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="addproduct">
    <button  style="width: 100px;height: 30px">新增</button></a>
<br>
商品列表：
<table width="100%" border=1 class="table" id="mytab">
    <tr>
        <td>商品编号</td>
        <td>商品名称</td>
        <td>价格</td>
        <td>发布方</td>
        <td>新增时间</td>
        <td>上架状态</td>
        <td>操作</td>
    </tr>

</table>
<tr>
    <td colspan="8"><div> <button id="button1">上一页</button> <span id="lab"></span> <button id="button2">下一页</button>
    </div></td>
</tr>




</body>
</html>