<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <link href="<%=path%>/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <%--<script src="<%=path%>/js/jquery.easydropdown.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });

            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });

            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });


    </script>
    <!-- start menu -->
    <link href="<%=path%>/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=path%>/js/megamenu.js"></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <!-- end menu -->
    <script type="text/javascript" src="<%=path%>/js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function()
        {
            $('.scroll-pane').jScrollPane();
        });
    </script>
    <!-- top scrolling -->
    <script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
    <script type="text/javascript" src="<%=path%>/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
            });
        });





    </script>















    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购物车页面</title>
    <style>
  /*  @charset "utf-8";
    !* CSS Document *!
*/
    body{
    margin:0px;
    padding:0px;
    font-size:12px;
    line-height:20px;
    color:#333;
    }
    ul,li,ol,h1,dl,dd{
    list-style:none;
    margin:0px;
    padding:0px;
    }
    a{
    color:#1965b3;
    text-decoration: none;
    }
    a:hover{
    color:#CD590C;
    text-decoration:underline;
    }
    img{
    border:0px;
    vertical-align:middle;
    }
    #header{
    height:40px;
    margin:10px auto 10px auto;
    width:800px;
    clear:both;
    }
    #nav{
    margin:10px auto 10px auto;
    width:800px;
    clear:both;
    }
    #navlist{
    width:800px;
    margin:0px auto 0px auto;
    height:23px;
    }
    #navlist li{
    float:left;
    height:23px;
    line-height:26px;
    }
    .navlist_red_left{
/*    background-image:url(../images/taobao_bg.png);*/
    background-repeat:no-repeat;
    background-position:-12px -92px;
    width:3px;
    }
    .navlist_red{
    background-color:#ff6600;
    text-align:center;
    font-size:14px;
    font-weight:bold;
    color:#FFF;
    width:130px;
    }
    .navlist_red_arrow{
    background-color:#ff6600;
  /*  background-image:url(../images/taobao_bg.png);*/
    background-repeat:no-repeat;
    background-position:0px 0px;
    width:13px;
    }
    .navlist_gray{
    background-color:#e4e4e4;
    text-align:center;
    font-size:14px;
    font-weight:bold;
    width:150px;
    }
    .navlist_gray_arrow{
    background-color:#e4e4e4;
  /*  background-image:url(../images/taobao_bg.png);*/
    background-repeat:no-repeat;
    background-position:0px 0px;
    width:13px;
    }
    .navlist_gray_right{
/*    background-image:url(../images/taobao_bg.png);*/
    background-repeat:no-repeat;
    background-position:-12px -138px;
    width:3px;
    }
    #content{
    width:800px;
    margin:10px auto 5px auto;
    clear:both;
    }
    .title_1{
    text-align:center;
    width:50px;
    }
    .title_2{
    text-align:center;
    }
    .title_3{
    text-align:center;
    width:80px;
    }
    .title_4{
    text-align:center;
    width:80px;
    }
    .title_5{
    text-align:center;
    width:100px;
    }
    .title_6{
    text-align:center;
    width:80px;
    }
    .title_7{
    text-align:center;
    width:60px;
    }
    .line{
    background-color:#a7cbff;
    height:3px;
    }
    .shopInfo{
    padding-left:10px;
    height:35px;
    vertical-align:bottom;
    }
    .num_input{
    border:solid 1px #666;
    width:25px;
    height:15px;
    text-align:center;
    }
    .cart_td_1,.cart_td_2,.cart_td_3,.cart_td_4,.cart_td_5,.cart_td_6,.cart_td_7,.cart_td_8{
    background-color:#e2f2ff;
    border-bottom:solid 1px #d1ecff;
    border-top:solid 1px #d1ecff;
    text-align:center;
    padding:5px;
    }
    .cart_td_1,.cart_td_3,.cart_td_4,.cart_td_5,.cart_td_6,.cart_td_7{
    border-right:solid 1px #FFF;
    }
    .cart_td_3{
    text-align:left;
    }
    .cart_td_4{
    font-weight:bold;
    }
    .cart_td_7{
    font-weight:bold;
    color:#fe6400;
    font-size:14px;
    }
    .hand{
    cursor:pointer;
    }
    .shopend{
    text-align:right;
    padding-right:10px;
    padding-bottom:10px;
    }
    .yellow{
    font-weight:bold;
    color:#fe6400;
    font-size:18px;
    line-height:40px;
    }
    </style>
</head>

<body>
<div class="header-top">
    <div class="wrap">
        <div class="logo">
            <a href="index2.jsp"><img src="<%=path%>/images/logo.png" alt=""/></a>
        </div>
        <div class="cssmenu">
            <ul>
                <li class="active"><a href="<%=basePath%>fontLogin.jsp">注册/登录</a></li>
                <%--<li><a href="backproduct/selectProductfontAll.do">商品列表</a></li>
                <li><a href="checkout.html">购物车</a></li>--%>
                <li>用户:${userName}</li>
            </ul>
        </div>
        <ul class="icon2 sub-icon2 profile_img">
            <li><a class="active-icon c2" href="#"> </a>
                <ul class="sub-icon2 list">
                    <li><h3>Products</h3><a href=""></a></li>
                    <li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
                </ul>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div class="header-bottom">
    <div class="wrap">
        <!-- start header menu -->

        <ul class="megamenu skyblue">
            <li style="width: 220px;font-size: 16px;"><a class="color1" href="<%=basePath%>index2.jsp">商城</a></li>
            <li class="grid" style="width: 220px;font-size: 16px"><a class="color2" href="<%=basePath%>shop.jsp">商品列表</a></li>
            <li class="active grid" style="width: 220px;font-size: 16px"><a class="color4" href="<%=basePath%>shopcar/update?username=${userName}">购物车</a></li>
            <li style="width: 220px;font-size: 16px"><a class="color5" href="<%=basePath%>shopvideo.jsp">视频展示</a></li>

            <li style="width: 220px;font-size:16px"><a class="color7" href="<%=basePath%>personal_center.jsp">个人中心</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>






















<div id="header"><img src="<%=path%>/images/addcar22.jpg" alt="logo" /></div>
<div id="nav">您的位置：<a href="<%=basePath%>index2.jsp">首页</a> >  > 我的购物车</div>
<div id="navlist">
    <ul>
        <li class="navlist_red_left"></li>
        <li class="navlist_red"> 查看购物车</li>
        <li class="navlist_red_arrow"></li>
        <li class="navlist_gray"></li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray"></li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray"></li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray"></li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>

<div id="content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
        <form action="" method="post" name="myform">

            <p  style="align:center;font-size: 20px;height: 30px;color:orangered;">请先勾选商品在进行数量选择</p>

            <tr>
                <td class="title_1"><input id="allCheckBox" type="checkbox" value="" onclick="selectAll()" />全选</td>
                <td class="title_2" colspan="2">商城宝贝</td>
                <td class="title_3">商品编号</td>
                <td class="title_4">单价（元）</td>
                <td class="title_5">数量</td>
                <td class="title_6">小计（元）</td>
                <td class="title_7">操作</td>
            </tr>
            <tr>
                <td colspan="8" class="line"></td>
            </tr>


            <c:forEach items="${shopcarlist}" var="tmp">

            <tr>
                <td colspan="8" class="shopInfo">商品：${tmp[0]}</td>
            </tr>
            <tr id="${tmp[4]}">
                <td class="cart_td_1"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
                <td class="cart_td_2"><img src="<%=path%>/${tmp[1]}" width="10px" hight="10px" alt="shopping"/></td>
                <td class="cart_td_3"><a href="#">${tmp[3]}</a><br />
                   <br />
                    图片：<img src="<%=path%>/${tmp[1]}" width="50px" height="50px" alt="icon" /></td>
                <td class="cart_td_4">${tmp[4]}</td>
                <td class="cart_td_5">${tmp[2]}</td>
                <td class="cart_td_6"><img src="<%=path%>/images/jian222.jpg" alt="minus" onclick="changeNum('${tmp[5]}','minus',${tmp[4]})" class="hand"/> <input id="${tmp[5]}" type="text"  value="1" class="num_input" readonly="readonly"/> <img src="<%=path%>/images/add11.jpg" alt="add" onclick="changeNum('${tmp[5]}','add',${tmp[4]})"  class="hand"/></td>
                <td class="cart_td_7"></td>
                <td class="cart_td_8"><a href="javascript:deleteRow('${tmp[4]}');">删除</a></td>
            </tr>
            </c:forEach>
            <tr>
                <td  colspan="3"><a href="javascript:deleteSelectRow()"><img  src="<%=path%>/images/deletecar.jpg" alt="delete"/></a></td>
                <td colspan="5" class="shopend">商品总价（不含运费）：<label id="total" class="yellow"></label> 元<br />
                    <br />
                  <%--  <input name=" " type="image" src="images/taobao_subtn.jpg" /></td>--%>
                <a onclick="wu()" ><input type="button" value="提交"></a></td>
            </tr>

        </form>
    </table>

</div>
</body>
<script>
function changeNum(QQ,flag,dd){/*numId表示对应商品数量的文本框ID，flag表示是增加还是减少商品数量*/
var tom=document.getElementById(QQ);
if(flag=='add'){

tom.value++;
    /*console.log(dd+""+QQ+"11"+flag+"=="+"add"+"==="+tom.value);*/
    var xmlhttp=new XMLHttpRequest();
    var url="<%=basePath%>shopcar/addp?"+"productid="+dd+"&username="+"${userName}";
    xmlhttp.open("get",url,true);
    xmlhttp.send();
}
if(flag=='minus'){
if (tom.value > 1) {
tom.value=tom.value-1;
    var xmlhttp=new XMLHttpRequest();
    var url="<%=basePath%>shopcar/addp1?"+"productid="+dd+"&username="+"${userName}";
    xmlhttp.open("get",url,true);
    xmlhttp.send();
}
}
getSubTotal(tom.parentNode.parentNode.id);
productCount();
}
function getSubTotal(tr) {
var tds=document.getElementById(tr);
var price = parseFloat(tds.cells[4].innerHTML);//获取价格
var count = parseInt(tds.cells[5].getElementsByTagName('input')[0].value);//获取数量
var SubTotal = parseFloat(price * count);
tds.cells[6].innerHTML = SubTotal.toFixed(2);//四舍五入
}
/*自动计算商品的总金额、总共节省的金额和积分*/
function productCount(){
var checkAllInputs = document.getElementById('allCheckBox');
var tableTr=document.getElementById("shopping").getElementsByTagName("tr");
var total=0;      //所有商品的总计
var integral=0;   //所有商品的积分
console.log(tableTr);
if(tableTr.length==3){
checkAllInputs.checked=false;
}
var checkInputs = document.getElementsByName("cartCheckBox");
for(var i=0;i< checkInputs.length;i++){
var point=0;      //每一行商品的单品积分
var price=0;     //每一行商品的单价
var nums=0;    //每一行商品的数量

if(checkInputs[i].checked) { //判断复选框是否被选中

var c=checkInputs[i].parentNode.parentNode;
    console.log(c+"=======");
    console.log(i+"----------");
point=c.childNodes[7].innerHTML;//选中行商品的id
    console.log(point)
    var xmlhttp=new XMLHttpRequest();
    var url="<%=basePath%>shopcar/updatecommit?"+"productId="+point+"&username="+"${userName}";
    xmlhttp.open("get",url,true);
    xmlhttp.send();


price=c.childNodes[9].innerHTML;  //选中行商品的单价
nums=c.childNodes[11].childNodes[2].value; //选中行商品的数量
console.log(nums);
/*integral+=point*nums; */ //所有商品的积分的和 = 每一行商品的单价积分 x 数量   相加
total+=price*nums;//所有商品的总计的和 = 每一个商品的单价 x 数量   相加
c.childNodes[13].innerHTML=price*nums;  //商品小计 =商品的单价 x 数量
} else {
total+=0;//思考这里为什么是“+=”
integral+=0;
}
}
document.getElementById("total").innerHTML=total;
//document.getElementById("integral").innerHTML=integral;
}

window.onload=productCount; //onload函数，让页面加载后自动计算商品总额

/*复选框全选或全不选效果*/
function selectAll(){
var checkInputs = document.getElementsByName("cartCheckBox");
var checkAllInputs = document.getElementById('allCheckBox');
for(var i=0;i<checkInputs.length;i++){
    var point=0;
    var c=checkInputs[i].parentNode.parentNode;
    point=c.childNodes[7].innerHTML;
    var xmlhttp=new XMLHttpRequest();
    var url="<%=basePath%>shopcar/updatecommit?"+"productId="+point+"&username="+"${userName}";
    xmlhttp.open("get",url,true);
    xmlhttp.send();
    price=c.childNodes[9].innerHTML;
    nums=c.childNodes[11].childNodes[2].value; //选中行商品的数量
    console.log(nums);
    /*integral+=point*nums; */ //所有商品的积分的和 = 每一行商品的单价积分 x 数量   相加
    total+=price*nums;//所有商品的总计的和 = 每一个商品的单价 x 数量   相加
    c.childNodes[13].innerHTML=price*nums;  //商品小计 =商品的单价 x 数量
checkInputs[i].checked=checkAllInputs.checked;

}
}

/*根据单个复选框的选择情况确定全选复选框是否被选中*/
function selectSingle(){
var checkInputs = document.getElementsByName("cartCheckBox");
var checkAllInputs = document.getElementById('allCheckBox');
var count=0;
for(var i=0;i< checkInputs.length;i++){
if(checkInputs[i].checked) {
count++;

}
if (count === checkInputs.length ) {//判断是否全选
checkAllInputs.checked = true;
selectAll();
} else {
checkAllInputs.checked=false;
}
}
productCount();
}

/*删除单行商品*/
function deleteRow(rowId){
var t = document.getElementById(rowId);
t.previousSibling.previousSibling.remove();
    t.remove();
    console.log(rowId);
    productCount();
    var xmlhttp=new XMLHttpRequest();
    var url="<%=basePath%>shopcar/delete?"+"productid="+rowId+"&username="+"${userName}";
    xmlhttp.open("get",url,true);
    xmlhttp.send();
}



function wu(){
   /* var xmlhttp=new XMLHttpRequest();
     var url="<%=basePath%>shopcar/findnumber?shopcarname="+"${userName}";
     xmlhttp.open("get",url,true);
     xmlhttp.send();
     xmlhttp.onreadystatechange = function(){

     return "111";
     }*/

    var page="<%=basePath%>shopcar/findnumber?shopcarname="+"${userName}";
    window.location=page;

/*
   $.get("<%=basePath%>shopcar/findnumber",{
        "shopcarname":"${userName}"
    });*/


}













/*
$(function(){
    $("row").click(function(){
        $.get("shopcar/delete",{
            "productid":rowId,
            "username":""}
        );
    });
});
*/

/*删除选中行的商品*/
function deleteSelectRow() {
var inp=document.getElementsByName("cartCheckBox");  //获取每个多选框
for (var i=inp.length-1;i>=0;i--){//若顺序则无法删除所有
if(inp[i].checked){
inp[i].parentNode.parentNode.previousSibling.previousSibling.remove();
inp[i].parentNode.parentNode.remove();
inp.checked = false;//思考这里为什么不用数组下标
productCount();
}
}
}
</script>

</html>