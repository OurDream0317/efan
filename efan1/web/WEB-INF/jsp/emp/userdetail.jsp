
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
    <title>用户详情</title>

    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(function(){
            var user=${user1};

            console.log(${user1});

           $("#img1").html("<img style='width:40px;height:40px' src=<%=path%>/"+user.usericon+">" );
            $("#td1").text(user.nickname);
            $("#td2").text(user.userphone);
            $("#td3").text(formatDateTime(user.userbirthday));
            $("#td4").text(user.usersex);
            $("#td5").text(user.useraddress);
            $("#td6").text(user.userstar);
            $("#td7").text(user.usersingnature);


    if( ${master !=null && master !=''}   ){
        console.log("${master}");
              $("#dd1").text("${master.mastername}");
                $("#dd2").text(${master.masterphone});
                $("#dd3").text(${master.masteridnumber});
                $("#dd4").html("<img style='width:130px;height:90px' src=<%=path%>/${master.mastericon1}>");
                $("#dd5").html("<img style='width:130px;height:90px' src=<%=path%>/${master.mastericon2}>");
                $("#dd6").html("<img style='width:130px;height:90px' src=<%=path%>/${master.masterimg}>");
                $("#dd7").text("${master.masterstar}");
        }
            /*如果用户的状态status不是3,待审核状态，不能出现审核*/
            if(user.userstatus!=3){
                $("#but1").hide();
            }

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
        /*设置弹出提示框*/
        function prom(){
            $("#hid1").fadeToggle();
        }
/*提示框点击取消 隐藏*/
        function hide1(){
            $("#hid1").fadeToggle();
        }
/*提示框点击确认 将数据传给后台*/
        function hide2(){
            var user11=${user1}
            /*判断点击的是通过还是不通过*/
                   var obj= $("input[type='radio']:checked").val();
            console.log(obj);
            if(obj=="通过"){
                /*将用户id controller*/
                console.log(obj);
                $.get("updateuserstatus",{"userid":user11.userid});
                $("#hid1").fadeToggle();
            }else if(obj=="不通过"){
                /*将用户id 和 备注信息传给后台*/
                console.log(obj);
                $.get("<%=basePath%>user/updatemasterRemar",{"userid":user11.userid,"masterremar":$("#masterremar").val()});
                $("#hid1").fadeToggle();
            }else{
                alert("审核无反应，请继续审核！")
            }

        }

    </script>
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

</head>
<body>
<br>
<h3>用户详情:</h3>



<h4>基础资料</h4>

<div>
    <tr><td><span>头像:</span></td>&nbsp;&nbsp;<td id="img1"></td></tr><br><br>
    <tr><td><span>昵称:</span></td>&nbsp;&nbsp;<td><span id="td1"></span></td></tr><br><br>
    <tr><td><span>手机号:</span></td>&nbsp;&nbsp;<td><span id="td2"></span></td></tr><br><br>
    <tr><td><span>出生日期:</span></td>&nbsp;&nbsp;<td><span id="td3"></span></td></tr><br><br>
    <tr><td><span>性别:</span></td>&nbsp;&nbsp;<td><span id="td4"></span></td></tr><br><br>

    <tr><td><span>所在地:</span></td>&nbsp;&nbsp;<td><span id="td5"></span></td></tr><br><br>
    <tr><td><span>喜欢的明星:</span></td>&nbsp;&nbsp;<td><span id="td6"></span></td></tr><br><br>
    <tr><td><span>个性签名:</span></td>&nbsp;&nbsp;<td><span id="td7"></span></td></tr><br><br>


</div>
<h4>站长审核</h4>
<div>

</div>
<tr><td><span>真实姓名:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="dd1"></span></td></tr><br><br>
<tr><td><span>手机号:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="dd2"></span></td></tr><br><br>
<tr><td><span>身份证号:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="dd3"></span></td></tr><br><br>

<tr>
    <td><span>身份证照片:</span></td>&nbsp;&nbsp;
    <td id="dd4"></td>
    <td id="dd5"></td>
</tr><br><br>
<tr>
    <td><span>手持身份证照片:</span></td>&nbsp;&nbsp;
    <td id="dd6"></td>

</tr><br><br>
<tr><td><span>选择明星:</span></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><span id="dd7"></span></td></tr><br><br><br><br>

<tr><td><button id="but1" style="width: 100px;height: 35px;color:#333;" onclick="prom()">审核</button></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><button style="width: 100px;height: 35px;color:#333;"> <a href="<%=basePath%>user/selectAll">返回</a></button></td></tr><br><br>



<div id="hid1">
    <form action="<%=basePath%>user/updatemaster">
        <p id="audit0">审核结果:</p>
        <input id="audit1" type="radio" name="audit" value="通过" /><label for="audit1">通过</label>
        <input id="audit2" type="radio" name="audit" value="不通过" /><label for="audit2">不通过</label><br><br>

        <p id="master1">不通过原因：</p><br>
        <textarea name="masterremar" cols="70" id="masterremar" style="width:640px;height:165px;margin-left:20px;margin-top:0;line-height: 30px;"></textarea>
        <br><br><br>

        <input id="input1" style="width: 100px;height: 35px;color:#333;" type="button" onclick="hide2()" value="确认">&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="input2" style="width: 100px;height: 35px;color:#333;" type="button" onclick="hide1()" value="取消"><br>


    </form>


</div>






</body>
</html>
