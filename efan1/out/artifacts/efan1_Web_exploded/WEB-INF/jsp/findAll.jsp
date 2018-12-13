<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=path%>/js/jquery-3.1.1.js"></script>
<html>
<head>
    <title>人员管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">

    <LINK rel="stylesheet" type="text/css" href="${baseurl}js/easyui/styles/default.css">
    <script src="<%=path%>/js/jquery-3.1.1.js"></script>

    <%@ include file="/WEB-INF/jsp/common_css.jsp"%>
    <%@ include file="/WEB-INF/jsp/common_js.jsp"%>
</head>
<body>
<span class="item_name" style="width:120px;">人员列表：</span><br>
<section>
<input type="text" name="videoName" id="videoName" class="group_btn" placeholder="输入账号查询"/>
<input type="button" value="查询" class="group_btn" id="group_btn"/><br>
</section>
<a href="<%=path%>/addManage" class="fr top_rt_btn add_icon">添加人员</a><br>
<table width="100%" border=1 class="table" id="table">
    <tr>
        <td>序号</td>
        <td>账号</td>
        <td>姓名</td>
        <td>角色</td>
        <td>新增时间</td>
        <td>操作</td>
    </tr>
    </table>
    <tr>
    <td colspan="8"><div><a href="">首页</a> <button id="button1">上一页</button> <span id="page"></span> <button id="button2">下一页</button>
    </div></td>
    </tr>

<div id="hid1">
    <form action="<%=path%>/updatePassword">
    <p>更改密码</p>
        新密码:<input type="password" name="password"><br>
        确认密码:<input type="password" name="rpasswrod"><br>
        <input type="text" name="username" id="uroleid" readonly="readonly">
        <input type="submit" value="提交">
        <input type="button" name="button" value="返回" onclick="javascript:history.go(-1)"/>
        ${msg}
    </form>
</div>

</body>
<style type="text/css">
    #hid1{
        position:absolute;
        left:150px;
        top:250px;
        z-index:2;
        background:#cccccc;

    }
    #hid1{
        display: none;
    }

</style>



<script type="text/javascript">


    function getDate(date){
        var t = new Date(date).toLocaleString();
        return t;
    }





    function po(q) {
        if (q !== 1) {
            console.log(q);
            if (confirm("你确定修改密码吗？")) {
                $("#uroleid").val(q);
                $("#hid1").fadeToggle();
            } else {

            }

        }
    }
    function hide1(){
        $("#hid1").fadeToggle();
    }



    $(function() {

//定义全局变量 当前的页数
        var startRow=1;//从第一页开始
        $("#page").html("第"+startRow+"页");

        $.get("<%=path%>/findAllList", {
            "startRow": startRow,
            "endRow": 5,
            "managename":$("#videoName").val()
        }, function (data) {
            console.log($("#videoName").val());
            console.log(data[1].nickname)
            console.log("111111");
            //获取到数据动态添加到表里 先删除之前的数据
            $(".table  tr:not(:first)").remove();
            //添加数据
            var html = "";
            for( var i = 0; i < data.length; i++ ) {
                html += "<tr>";
                html += "<td>" + data[i].manageid+ "</td>";
                html += "<td>" + data[i].manageacc + "</td>";
                html += "<td>" + data[i].managename+"</td>";
                html += "<td>" + data[i].nickname + "</td>";
                html += "<td>" + getDate(data[i].addtime)+"</td>";
                var u="<%=path%>/updateManage1?manageacc="+data[i].manageacc+"";
                var p="<%=path%>/deleteManage?manageacc="+data[i].manageacc+"";
               /* var q="<%=path%>/deleteManage?username="+data[i].manageacc+"";*/
                html +="<td><a href="+u+">编辑</a>" +"&nbsp"+"&nbsp"+
                        "<a href="+p+">删除</a>" +"&nbsp"+"&nbsp"+
                        "<a onclick='po("+data[i].manageid+")'>修改密码</a>" +
                        "</td>";

                /*function po(){
                    sessionStorage.setItem("manageid",data[i].manageid);
                    $("#hid1").fadeToggle();
                    console.log(sessionStorage.getItem(manageid));
                }*/


              /*  if(data[i][5]==1){
                    var u= "user/updateUserStatus?id="+data[i][0];
                    html +="<td><a href="+u+">禁用</a></td>";
                }else if(data[i][5]==0){
                    var u= "user/updateUserStatus?id="+data[i][0];
                    html+="<td><a href="+u+">解禁</a></td>";
                }*/
                html += "</tr>";
            }
            $(".table").append(html);
        });

        $("#group_btn").click(function () {
            $.get("findAllList", {
                "startRow": startRow*5-4,
                "endRow": startRow*5,
                "managename": $("#videoName").val(),
            }, function (data) {
                console.log($("#videoName").val());
                console.log(startRow*5-4);
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
                    for (var i = 0; i < data.length; i++) {
                        html += "<tr>";
                        html += "<td>" + data[i].manageid + "</td>";
                        html += "<td>" + data[i].manageacc + "</td>";
                        html += "<td>" + data[i].managename + "</td>";
                        html += "<td>" + data[i].nickname + "</td>";
                        html += "<td>"+ getDate(data[i].addtime)+ "</td>";
                        var u="<%=path%>/updateManage1?manageacc="+data[i].manageacc+"";
                        var p="<%=path%>/deleteManage?manageacc="+data[i].manageacc+"";
                        html +="<td><a href="+u+">编辑</a>" +"&nbsp"+"&nbsp"+
                                "<a href="+p+">删除</a>" +"&nbsp"+"&nbsp"+
                                "<a onclick='po("+data[i].manageacc+")'>修改密码</a>" +
                                "</td>";
/*                      /!*  if (data[i][5] == 1) {
                            var u = "user/updateUserStatus?id=" + data[i][0];
                            html += "<td><a href=" + u + ">禁用</a></td>";
                        } else if (data[i][5] == 0) {
                            var u = "user/updateUserStatus?id=" + data[i][0];
                            html += "<td><a href=" + u + ">解禁</a></td>";*!/
                        }*/
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
