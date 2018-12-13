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
    <title>票务订单</title>


    <script src="<%=path%>/js/jquery-3.1.1.js"></script>


    <script type="text/javascript">
        $(function(){
            var price=0;
            var buynumber=0;
            var manay=0;

            //定义全局变量 当前的页数
            var currentpage=1;//从第一页开始
            $("#lab").html("第"+currentpage+"页");

            $.get("selectorderproductAll", {
                "demo": $("#demo").val(),
                "input": $("#input1").val(),
                "orderstatus":$("#three").val(),
                "currentpage": currentpage,
                "count": 5
            }, function (data) {
                console.log(data)
                //获取到数据动态添加到表里 先删除之前的数据
                $(".table  tr:not(:first)").remove();
                //添加数据
                var html = "";
                for( var i = 0; i < data.length; i++ ) {
                    price=data[i].orderDatailList[0].price;
                    buynumber=data[i].orderDatailList[0].buynumber;
                    manay=price*buynumber;
                    html += "<tr>";
                    html += "<td>" + data[i].ordernumber + "</td>";
                    html += "<td>" + data[i].username + "</td>";
                    html += "<td>" +data[i].user1.userphone + "</td>";
                    html += "<td>" +data[i].orderDatailList[0].productList[0].proname + "</td>";
                    html += "<td>" + manay+ "</td>";
                    html += "<td>" +data[i].orderDatailList[0].productList[0].properson + "</td>";
                    if(data[i].orderstatus==0){
                        html += "<td>交易失败 </td>";
                    }else if(data[i].orderstatus==1){
                        html += "<td>待付款 </td>";
                    }else if(data[i].orderstatus==2){
                        html += "<td>待发货 </td>";
                    }else if(data[i].orderstatus==3){
                        html += "<td>待收货 </td>";
                    }else if(data[i].orderstatus==4){
                        html += "<td>交易成功 </td>";
                    }
                    html += "<td>" +formatDateTime(data[i].orderDatailList[0].committime )+ "</td>";

                    var u= "productorderdetail?ordernumber="+data[i].ordernumber;
                   // var u2= "updateproductstatus?ordernumber="+data[i].ordernumber;
                    if(data[i].orderstatus==2){
                        html += "<td> <a class=link_icon  href="+u+">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp; <a class=link_icon  onclick='prom("+data[i].ordernumber+")'>发货</a> </td>";

                    }else {
                        html += "<td> <a class=link_icon  href="+u+">查看详情</a> </td>";
                    }

                    html += "</tr>";
                }
                $("#mytab").append(html);
            });
            $("#group_id").click(function () {
                $.get("selectordernotAll", {
                    "demo": $("#demo").val(),
                    "input": $("#input1").val(),
                    "orderstatus":$("#three").val(),
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
                            price=data[i].orderDatailList[0].price;
                            buynumber=data[i].orderDatailList[0].buynumber;
                            manay=price*buynumber;
                            html += "<tr>";
                            html += "<td>" + data[i].ordernumber + "</td>";
                            html += "<td>" + data[i].username + "</td>";
                            html += "<td>" +data[i].user1.userphone + "</td>";
                            html += "<td>" +data[i].orderDatailList[0].productList[0].proname + "</td>";
                            html += "<td>" + manay+ "</td>";
                            html += "<td>" +data[i].orderDatailList[0].productList[0].properson + "</td>";
                            if(data[i].orderstatus==0){
                                html += "<td>交易失败 </td>";
                            }else if(data[i].orderstatus==1){
                                html += "<td>待付款 </td>";
                            }else if(data[i].orderstatus==2){
                                html += "<td>待发货 </td>";
                            }else if(data[i].orderstatus==3){
                                html += "<td>待收货 </td>";
                            }else if(data[i].orderstatus==4){
                                html += "<td>交易成功 </td>";
                            }
                            html += "<td>" +formatDateTime(data[i].orderDatailList[0].committime )+ "</td>";

                            var u= "productorderdetail?ordernumber="+data[i].ordernumber;
                            //var u2= "updateproductstatus?ordernumber="+data[i].cattleid;
                            if(data[i].orderstatus==2){
                                html += "<td> <a class=link_icon  href="+u+">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp; <a class=link_icon  onclick='prom("+data[i].ordernumber+")'>发货</a>  </td>";

                            }else {
                                html += "<td> <a class=link_icon  href="+u+">查看详情</a> </td>";
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
    <script type="text/javascript">

        function hide2(){

            /*如果点击确认，先判断有没有值*/
            var express=$("#audit1").val();
            var expressnumber=$("#audit2").val();
            var ordernumber=$("#aaa").text();

            console.log(express+"---"+expressnumber+"---"+ordernumber);
            if(express==="请输入物流公司"){
                alert("请输入正确的名称");
            }else {
                if(expressnumber==="请输入物流单号"){
                    alert("请输入正确的物流单号")
                }else {
                   /* $.get("updateproductstatus",{"ordernumber":ordernumber,
                        "express":express,
                         "expressnumber":expressnumber
                    });*/
                    var nextPage="updateproductstatus?ordernumber="+ordernumber+"&express="+express+"&expressnumber="+expressnumber;
                    window.location=nextPage;
                }
            }
            $("#hid1").fadeToggle();
        }

        /*点击发货，显示提示框*/
        function prom(ordernumber){
            console.log(ordernumber);
            $("#aaa").text(ordernumber)
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
    <option value="0">订单编号</option>
    <option value="1">姓名</option>
    <option value="2">手机号</option>
    <option value="3">演出名称</option>
    <option value="4">发布方</option>

</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 30px" id="input1">&nbsp;&nbsp;


<select style="width: 150px;height: 30px" id="three">
    <option value="5">订单状态</option>
    <option value="1">代付款</option>
    <option value="2">待发货</option>
    <option value="3">待收货</option>
    <option value="4">交易成功</option>
    <option value="0">交易失败</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a onclick="blue()">
    <button id="group_id" style="width: 100px;height: 30px">查询</button></a>


<br>
票务订单列表：
<table width="100%" border=1 class="table" id="mytab">
    <tr>
        <td>订单编号</td>
        <td>用户名</td>
        <td>用户账号</td>
        <td>演出名称</td>
        <td>金额</td>
        <td>发布方</td>
        <td>订单状态</td>
        <td>提交时间</td>
        <td>操作</td>
    </tr>

</table>
<tr>
    <td colspan="8"><div> <button id="button1">上一页</button> <span id="lab"></span> <button id="button2">下一页</button>
    </div></td>
</tr>

<div id="hid1">
    <form >
        <div id="audit0"> <p style="line-height: 20px;text-align: left;font-size: 18px;padding-left: 10px">添加物流</p></div>
        <span style="line-height: 30px;text-align: left;font-size: 15px;padding-left: 10px">订单号:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="aaa"></span><br>
        <span style="line-height: 30px;text-align: left;font-size: 15px;padding-left: 10px">物流公司:</span>
        <input id="audit1" type="text" name="audit" value="请输入物流公司" /><br>
        <span style="line-height: 30px;text-align: left;font-size: 15px;padding-left: 10px">物流单号:</span>
        <input id="audit2" type="text" name="audit" value="请输入物流单号" /><br>

        <div id="input4">
            <input id="input3" style="width: 100px;height: 35px;color:#333;margin-left: 50px" type="button" onclick="hide2()" value="确认">&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="input2" style="width: 100px;height: 35px;color:#333;" type="button" onclick="hide1()" value="取消"><br>
        </div>

    </form>


</div>






</body>
</html>
