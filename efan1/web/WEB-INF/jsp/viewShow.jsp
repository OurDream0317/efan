<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/3 0003
  Time: 下午 4:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path =request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>查看演出</title>
    <script src="<%=path%>/js/jquery-3.1.1.js"></script>
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
           var user11="${activeUser.manageacc}"
            /*判断点击的是通过还是不通过*/
            var obj= $("input[type='radio']:checked").val();
            console.log(obj);
            if(obj=="通过"){
                /*将用户id controller*/
                console.log(obj);
                $.get("shenHeDemo",{"userName":user11});
                $("#hid1").fadeToggle();
            }else if(obj=="不通过"){
                /*将用户id 和 备注信息传给后台*/
                console.log(obj);
                $.get("NoshenHeDemo",{"userName":user11,"masterremar":$("#masterremar").val()});
                $("#hid1").fadeToggle();
            }else{
                alert("审核无反应，请继续审核！")
            }

        }
   $(function(){
       var tmp=${show.auditstatus}
       if(tmp==1){
           $("#btn").attr("disabled",true);
       }

   });


    </script>
    <style type="text/css">
        #div{
            position: relative;
            top: 30px;
            left: 100px;
            width: 800px;
            height: 1000px;
        }
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
查看演出
<br><br>
<div id="div">
    *演唱会名称：&nbsp;&nbsp;&nbsp;&nbsp;${show.showtitle}
    <br><br><br>
    *关联明星：&nbsp;&nbsp;&nbsp;&nbsp;${show.showstar}
    <br><br><br>
    *演出时间：&nbsp;&nbsp;&nbsp;&nbsp;${show.showtime}
    <br><br><br>
    *演出地点：&nbsp;&nbsp;&nbsp;&nbsp;${show.showaddress}
    <br><br><br>
    *商品类型：
    <br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>看台票</b>
    <br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：${show.showprice1}&nbsp;&nbsp;元&nbsp;&nbsp;&nbsp;数量：${show.shownumber1}&nbsp;&nbsp;张
    <br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>内场票</b>
    <br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：${show.showprice2}&nbsp;&nbsp;元&nbsp;&nbsp;&nbsp;数量：${show.shownumber2}&nbsp;&nbsp;张
    <br><br><br>
    *商品邮费：&nbsp;&nbsp;&nbsp;&nbsp;包邮
    <br><br><br>
    *演出简介：&nbsp;&nbsp;&nbsp;&nbsp;${show.showdetail}
    <br><br><br>
    *演出封面：&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=path%>/${show.showicon}" style="width: 150px;height: 200px">
    <br><br><br><br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 40px" onclick="prom()" id="btn">审核</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 40px" onclick="window.history.back(-1)">返回</button>
</div>
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
