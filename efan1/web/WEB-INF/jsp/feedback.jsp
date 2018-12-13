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
    <title>意见反馈</title>
    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
</head>
<body>
<p>意见反馈</p>

    <select id="feedbackstatus" name="feedbackstatus">
        <option value="2">处理状态</option>
    <option value="1">未处理</option>
    <option value="0">已处理</option>
    </select>
    <input type="button" value="查询" class="group_btn" id="group_btn"/><br>

    <table width="100%" border="1" class="table" id="table">
        <tr>
            <td>序号</td>
            <td>反馈账号</td>
            <td>反馈內容</td>
            <td>反馈时间</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
    </table>
<tr>
    <td colspan="8"><div><a href="">首页</a> <button id="button1">上一页</button> <span id="page"></span> <button id="button2">下一页</button>
    </div></td>
</tr>

</body>
<script type="text/javascript">
    $(function() {
//定义全局变量 当前的页数
        var startRow=1;//从第一页开始
        $("#page").html("第"+startRow+"页");

        $.get("<%=path%>/feedback/showfeedList", {
            "startRow": startRow,
            "endRow": 4,
            "feedbackstatus":$("#feedbackstatus").val()
        }, function (data) {
            console.log($("#feedbackstatus").val());

            console.log(data);
            //获取到数据动态添加到表里 先删除之前的数据
            $(".table  tr:not(:first)").remove();
            //添加数据
            var html = "";
            for( var i = 0; i < data.length; i++ ) {
                html += "<tr>";
                html += "<td>" + data[i].feedbackid + "</td>";
                html += "<td>" + data[i].feedbackuserphone + "</td>";
                html += "<td>" + data[i].feedbackcontent + "</td>";
                html += "<td>" + data[i].feedbacktime + "</td>";
                if (data[i].feedbackstatus == 1) {

                html += "<td>未处理</td>";
                }else if(data[i].feedbackstatus==0){
                html += "<td>已处理</td>";
            }
                if(data[i].feedbackstatus==1) {
                    var u = "<%=path%>/feedback/update?feedbackid=" + data[i].feedbackid + "";
                    html += "<td><a href=" + u + ">处理</a>" +"</td>";
                }
                html += "</tr>";
            }
            $(".table").append(html);
        });

        $("#group_btn").click(function () {
            $.get("showfeedList", {
                "startRow": startRow*4-3,
                "endRow": startRow*4,
                "feedbackstatus": $("#feedbackstatus").val(),
            }, function (data) {
                console.log($("#feedbackstatus").val());
                console.log(startRow*5-4);
                console.log(data);
                console.log("oooooooooooooooooooooooooooooooooooooooo");
                if(data.length===0&&startRow!=1){
                    startRow--;
                    return;
                }else {
                    $("#page").html("第"+startRow+"页");
                    //获取到数据动态添加到表里 先删除之前的数据
                    $(".table  tr:not(:first)").remove();
                    //添加数据
                    var html = "";
                    for( var i = 0; i < data.length; i++ ) {
                        console.log(data);
                        html += "<tr>";
                        html += "<td>" + data[i].feedbackid+ "</td>";
                        html += "<td>" + data[i].feedbackuserphone + "</td>";
                        html += "<td>" + data[i].feedbackcontent+"</td>";
                        html += "<td>" + data[i].feedbacktime + "</td>";
                        if (data[i].feedbackstatus == 1) {
                            html += "<td>未处理</td>";
                        }else if(data[i].feedbackstatus==0){
                            html += "<td>已处理</td>";
                        }
                        if(data[i].feedbackstatus==1) {
                            var u = "<%=path%>/feedback/update?feedbackid=" + data[i].feedbackid + "";
                            html += "<td><a href=" + u + ">处理</a>" +"</td>";
                        }
                        html += "</tr>";
                    }
                    $(".table").append(html);
                }
            });
        });

//上一页
        $("#button1").click(function(){
            startRow--;
            if(startRow==0){
                startRow++;
                return;
            }else{
                $(".group_btn").click();
            }
        });

//下一页
        $("#button2").click(function(){
            ++startRow;
            $(".group_btn").click();
        });


    });


</script>

</html>
