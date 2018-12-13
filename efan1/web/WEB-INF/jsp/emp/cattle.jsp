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
    <title>黄牛列表</title>


    <script src="<%=path%>/js/jquery-3.1.1.js"></script>


    <script type="text/javascript">
        $(function(){

            //定义全局变量 当前的页数
            var currentpage=1;//从第一页开始
            $("#lab").html("第"+currentpage+"页");

            $.get("selectCattleAll", {
                "demo": $("#demo").val(),
                "input": $("#input1").val(),
                "disable":$("#three").val(),
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
                    html += "<td>" + data[i].manageid + "</td>";
                    html += "<td>" + data[i].nickname + "</td>";
                    html += "<td>" +data[i].manageacc + "</td>";
                    html += "<td>" + data[i].shownumber + "</td>";
                    var u= "updatestatus?manageid="+data[i].manageid+"&disable="+data[i].disable;
                    if(data[i].disable==0){
                        html += "<td>已禁用 </td>";
                        html += "<td> <a class=link_icon  href="+u+"> 解除禁用</a> </td>";
                    }else {
                        html += "<td>未禁用 </td>";
                        html += "<td> <a class=link_icon  href="+u+">禁用</a> </td>";
                    }

                    html += "</tr>";
                }
                $("#mytab").append(html);
            });
            $("#group_id").click(function () {
                $.get("selectCattleAll", {
                    "demo": $("#demo").val(),
                    "input": $("#input1").val(),
                    "disable":$("#three").val(),
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
                            html += "<td>" + data[i].manageid + "</td>";
                            html += "<td>" + data[i].nickname + "</td>";
                            html += "<td>" +data[i].manageacc + "</td>";
                            html += "<td>" + data[i].shownumber + "</td>";
                            var u= "updatestatus?manageid="+data[i].manageid+"&disable="+data[i].disable;
                            if(data[i].disable==0){
                                html += "<td>已禁用 </td>";
                                html += "<td> <a class=link_icon  href="+u+"> 解除禁用</a> </td>";
                            }else {
                                html += "<td>未禁用 </td>";
                                html += "<td> <a class=link_icon  href="+u+">禁用</a> </td>";
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
        function hide2(){
            /*正则表达式判断手机号*/
            var pattern=/^1[345789]\d{9}$/;
            /*如果点击确认，先判断有没有值*/
            var cattlename=$("#audit1").val();
            var cattlephone=$("#audit2").val();
            var cattlepassword=$("#audit3").val();
            console.log(cattlename+"---"+cattlephone+"---"+cattlepassword);
            if(cattlename=="请输入名称"){
                alert("请输入正确的名称");
            }else {
                if(!pattern.test(cattlephone)){
                    alert("请输入正确的手机号")
                }else {
                    $.get("addcattle",{"nickname":cattlename,
                        "manageacc":cattlephone,
                        "managepassword":cattlepassword},function(data){
                        console.log("---"+data);
                        /*接收返回值，查看新增是否成功*/
                        if(data=="false"){
                            alert("账号已存在，请重新输入");
                        }
                        if(data=="true"){
                            alert("黄牛账号新增成功");
                        }

                    });
                }
            }
            $("#hid1").fadeToggle();
        }


        /*点击新增，显示提示框*/
        function prom(){
            $("#hid1").fadeToggle();
        }
        /*点击取消，隐藏提示框*/
        function hide1(){
            $("#hid1").fadeToggle();
        }






    </script>

    <style type="text/css">
        #hid1{
            width:320px;
            height:220px;
            position:absolute;
            left:250px;
            top:100px;
            z-index:2;
            background:#cccccc;
        }
        #audit0{
            width:320px;
            height:30px;
        }
       #audit1,#audit2,#audit3{
           width:200px;
           height:25px;
           margin-bottom: 5px;
        }

        #input4{
            width: 320px;
            height: 30px;

        }
        #hid1{
            display: none;
        }

    </style>




</head>
<body>
<select style="width: 150px;height: 30px" id="demo">
    <option value="全部">全部</option>
    <option value="黄牛名称">黄牛名称</option>
    <option value="账号">账号</option>
</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 30px" id="input1">&nbsp;&nbsp;


<select style="width: 150px;height: 30px" id="three">
    <option value="2">账号状态</option>
    <option value="0">禁用</option>
    <option value="1">未禁用</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a >
    <button id="group_id" style="width: 100px;height: 30px">查询</button></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a>
    <button onclick="prom()" style="width: 100px;height: 30px">新增</button></a>
<br>
黄牛列表：
<table width="100%" border=1 class="table" id="mytab">
    <tr>
        <td>id</td>
        <td>黄牛名称</td>
        <td>账号</td>
        <td>发布演出数</td>
        <td>账号状态</td>
        <td>操作</td>
    </tr>

</table>
<tr>
    <td colspan="8"><div> <button id="button1">上一页</button> <span id="lab"></span> <button id="button2">下一页</button>
    </div></td>
</tr>



<div id="hid1">
    <form >
      <div id="audit0"> <p style="line-height: 20px;text-align: left;font-size: 18px;padding-left: 10px">新增黄牛</p></div>

        <span style="line-height: 30px;text-align: left;font-size: 15px;padding-left: 10px">黄牛名称:</span>
        <input id="audit1" type="text" name="audit" value="请输入名称" /><br>
        <span style="line-height: 30px;text-align: left;font-size: 15px;padding-left: 10px">黄牛账号:</span>
        <input id="audit2" type="text" name="audit" value="手机号即为账号" /><br>
        <span style="line-height: 30px;text-align: left;font-size: 15px;padding-left: 10px">黄牛账号:</span>
        <input id="audit3" type="password" name="audit" value="123456" /><br>
        <div id="input4">
        <input id="input3" style="width: 100px;height: 35px;color:#333;margin-left: 50px" type="button" onclick="hide2()" value="确认">&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="input2" style="width: 100px;height: 35px;color:#333;" type="button" onclick="hide1()" value="取消"><br>
        </div>

    </form>


</div>



</body>
</html>