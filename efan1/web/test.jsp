<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        #winpop { width:350px; height:0px; position:absolute; right:0; bottom:0; border:1px solid grey; margin:0; padding:0px; overflow:hidden; display:none; background:#FFFFFF}
        #winpop .title { width:100%; height:25px; line-height:25px; background:#E7E7E7 ; font-family:Microsoft YaHei; text-align:left; font-size:15px;color:black}
        #winpop .con { width:100%; height:360px; line-height:80px; font-weight:bold; font-size:12px; color:#FF0000; text-decoration:underline; text-align:center}
        .close { position:absolute; right:4px; top:-1px; color:#FFFFFF; cursor:pointer}
    </style>
</head>
<%
    //未读消息unreadList根据实际情况取
    List<Map> unreadList = new ArrayList<Map>();
    Map<String,String> map1=new HashMap<String,String>();
    map1.put("msgId","1");
    map1.put("msgContent","message111111");
    unreadList.add(map1);
    Map<String,String> map2=new HashMap<String,String>();
    map2.put("msgId","2");
    map2.put("msgContent","message222222");
    unreadList.add(map2);
    int num=unreadList.size();
%>
<body>
<script language="javascript" type="text/javascript">
    window.onload = function tanchuang() { //加载
        document.getElementById('winpop').style.height = '0px';//要初始化这个高度,虽然CSS里已经初始化了

        setTimeout("tips_pop()",0); //调用tips_pop()这个函数
    }

    function tips_pop() {
        var MsgPop = document.getElementById("winpop");//获取窗口这个对象,即ID为winpop的对象
        var popH = parseInt(MsgPop.style.height);//用parseInt将对象的高度转化为数字,以方便下面比较

        if (popH == 0) { //如果窗口的高度是0
            MsgPop.style.display = "block";//那么将隐藏的窗口显示出来
            show = setInterval("changeH('up')", 2);//开始以每0.002秒调用函数changeH("up"),即每0.002秒向上移动一次
        } else { //否则
            hide = setInterval("changeH('down')", 2);//开始以每0.002秒调用函数changeH("down"),即每0.002秒向下移动一次
        }
    }
    function changeH(str) {
        var MsgPop = document.getElementById("winpop");
        var popH = parseInt(MsgPop.style.height);
        if (str == "up") { //如果这个参数是UP
            if (popH <= 100) { //如果转化为数值的高度小于等于100
                MsgPop.style.height = (popH + 4).toString() + "px";//高度增加4个象素
            } else {
                clearInterval(show);//否则就取消这个函数调用,意思就是如果高度超过100象度了,就不再增长了
            }
        }
        if (str == "down") {
            if (popH >= 4) { //如果这个参数是down
                MsgPop.style.height = (popH - 4).toString() + "px";//那么窗口的高度减少4个象素
            } else { //否则
                clearInterval(hide); //否则就取消这个函数调用,意思就是如果高度小于4个象度的时候,就不再减了
                MsgPop.style.display = "none"; //因为窗口有边框,所以还是可以看见1~2象素没缩进去,这时候就把DIV隐藏掉
            }
        }
    }
</script>

<%if(num>0){ %>
<div id="winpop">
    <div class="title" >友情提示 共有<font color="red"><big><%=num %></big></font>条未处理消息
        <span class="close" onclick="tips_pop()">X</span></div>
    <%for(int i=0;i<num;i++) { %>
    <!-- 点击信息标题链接到信息明细，传递信息编号参数 -->
    <a href="/XXXAction.do?msgId=<%=unreadList.get(i).get("msgId") %>">
        <%if(String.valueOf(unreadList.get(i).get("msgContent")).length()>16) {%>
        <%=String.valueOf(unreadList.get(i).get("msgContent")).substring(0,16)+"..." %>
        <%} else{ %>
        <%=String.valueOf(unreadList.get(i).get("msgContent")) %>
        <%} %>
    </a><br>
    <%
            if(i>=1){//最多显示两条
                break;
            }
        } %>
    <center>
        <!-- 点击查看更多未读消息 -->
        <a href="/XXXAction.do %>"><font color="red">更多未读消息...</font></a></center>
</div>
<%} %>
</body>
</html>