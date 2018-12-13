<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/1 0001
  Time: 上午 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path =request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>

<script  src="<%=path%>/js/jquery-3.1.1.js"></script>
<script type="text/javascript">

console.log(${activeUser.managestatus})
    var currentPage=1;
  function preOrNextPage(tmp) {
      if (tmp == 0) {// 第一页不需要在请求
          return;
      }
      currentPage = tmp;
      console.log(currentPage+"===============");
      /* $(function(){*/
      /*  $("#btn1").click(function(){*/
      $("table  tr:not(:first)").empty("");
      $.get("findShowAll", {
          "demo": $("#demo").val(),
          "content": $("#input").val(),
          "pStatus": $("#one").val(),
          "upStatus": $("#two").val(),
          "tStatus": $("#three").val(),
          "status": ${activeUser.managestatus},
          "showperson": "${activeUser.manageacc}",
          "currentPage": currentPage,
          "count": 5
      }, function (data) {
          console.log(data);
          if(data.length>=1) {
              console.log(data.length);
              for (var i in data) {
                  var str = "<%=path%>/show/viewShowDemo?showid=" + data[i].showid;
                  var edit = "<%=path%>/show/updateShowDemo?showid=" + data[i].showid;
                  var shenHe="<%=path%>/show/shenHe?showid="+data[i].showid;
                  var upStatus = "<%=path%>/show/updateShowUpStatus?showid=" + data[i].showid + "&showshelf=" + data[i].showshelf;
                  var tStatus = "<%=path%>/show/updateShowTStatus?showid=" + data[i].showid + "&showrecommend=" + data[i].showrecommend;
                  var delStatus = "<%=path%>/show/updateShowDelStatus?showid=" + data[i].showid + "&showstatus=" + data[i].showstatus;

                  console.log(str);
                  var up="";
                  var tp="";
                  if(data[i].showrecommend==1){
                      tp="已推荐";
                  }else if(data[i].showrecommend==0){
                      tp="未推荐";
                  }
                  if (data[i].status == 1) {
                      if (data[i].showshelf == 1) {
                          up="已上架";
                          console.log(data);
                          $("table").append('<tr id="tr"> ' +
                                  '<th class="tdClass">' + data[i].showid + '</th>' +
                                  '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                  '<th class="tdClass">' + "官方平台" + '</th>' +
                                  '<th class="tdClass">' + "---" + '</th>' +
                                  '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                  '<th class="tdClass">' + up+ '</th>' +
                                  '<th class="tdClass">' +tp+ '</th>' +
                                  '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></a>&nbsp;&nbsp;<a href="' + tStatus + '"><span>推荐</span></th>' +
                                  '</tr>');
                      } else {
                          up="未上架";

                          $("table").append('<tr id="tr"> ' +
                                  '<th class="tdClass">' + data[i].showid + '</th>' +
                                  '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                  '<th class="tdClass">' + "官方平台" + '</th>' +
                                  '<th class="tdClass">' + "---" + '</th>' +
                                  '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                  '<th class="tdClass">' + up+ '</th>' +
                                  '<th class="tdClass">' + tp+ '</th>' +
                                  '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<a href="' + edit + '"><span>编辑</span></a>&nbsp;&nbsp;<a href="' + delStatus + '"><span>删除</span></a>&nbsp;&nbsp;<a href="' + upStatus + '" id="upStatus2">上架</span></a>&nbsp;&nbsp;</th>' +
                                  '</tr>');
                      }
                  } else {//黄牛端
                      var tmp="";
                      var shangjia="";
                      if(data[i].auditstatus==1){
                          tmp="审核通过";
                          shangjia="上架";
                      }else if(data[i].auditstatus==0){
                          tmp="待审核";
                      }
                      else if(data[i].auditstatus==2){
                          tmp="审核不通过";
                      }
                      if (data[i].showshelf == 1) {
                          console.log(data[i].auditstatus);
                           up="已上架";
                          $("table").append('<tr id="tr"> ' +
                                  '<th class="tdClass">' + data[i].showid + '</th>' +
                                  '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                  '<th class="tdClass">' + data[i].showperson + '</th>' +
                                  '<th class="tdClass">' + tmp + '</th>' +
                                  '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                  '<th class="tdClass">' + up + '</th>' +
                                  '<th class="tdClass">' +tp+ '</th>' +
                                  '<th class="tdClass"><a href="' + str + '"><span>查看</span></a>&nbsp;&nbsp;<a href="' + upStatus + '"><span>下架</span></a>&nbsp;&nbsp;<a href="' + tStatus + '"><span>推荐</span></th>'  +
                                  '</tr>');
                      } else {
                          up="未上架";


                          $("table").append('<tr id="tr"> ' +
                                  '<th class="tdClass">' + data[i].showid + '</th>' +
                                  '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                  '<th class="tdClass">' + data[i].showperson + '</th>' +
                                  '<th class="tdClass">' + tmp + '</th>' +
                                  '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                  '<th class="tdClass">' + up+ '</th>' +
                                  '<th class="tdClass">' + tp+ '</th>' +
                                  '<th class="tdClass"><a href="'+str+'"><span>查看</span></a>&nbsp;&nbsp;<a href="'+shenHe+'"><span>审核</span></a>&nbsp;&nbsp;<a href="'+edit+'"><span>编辑</span></a>&nbsp;&nbsp;<a href="'+delStatus+'"><span>删除</span></a>&nbsp;&nbsp;<a href="'+upStatus+'"><span>'+shangjia+'</span></a>&nbsp;&nbsp;</th>' +
                                  '</tr>');
                      }
                  }
              }
              return;
          }
          currentPage--;
          preOrNextPage(currentPage);
          return;
      });
  }
    $(function(){
          $("#btn2").click(function(){
              window.location.href="addshowjsp"
          });
    });



        /*String demo,String content,int pStatus,int upStatus,int tStatus,int currentPage,int count*/
        $.get("findAll", {
           /* "demo": $("#demo").val(),
            "content": $("#input").val(),
            "pStatus": $("#one").val(),
            "upStatus": $("#two").val(),
            "tStatus": $("#three").val(),*/
            "status": ${activeUser.managestatus},
            "showperson": "${activeUser.manageacc}",
            "currentPage": currentPage,
            "count": 5
        }, function (data) {
            for(var i in data) {
                var str="<%=path%>/show/viewShowDemo?showid="+data[i].showid;
                var shenHe="<%=path%>/show/shenHe?showid="+data[i].showid;
                var edit="<%=path%>/show/updateShowDemo?showid="+data[i].showid;
                var upStatus="<%=path%>/show/updateShowUpStatus?showid="+data[i].showid+"&showshelf="+data[i].showshelf;
                var tStatus="<%=path%>/show/updateShowTStatus?showid="+data[i].showid+"&showrecommend="+data[i].showrecommend;
                var delStatus="<%=path%>/show/updateShowDelStatus?showid="+data[i].showid+"&showstatus="+data[i].showstatus;
                console.log(str);
                var up="";
                var tp="";
                if(data[i].showrecommend==1){
                    tp="已推荐";
                }else if(data[i].showrecommend==0){
                    tp="未推荐";
                }
                if (data[i].status == 1) {
                    if(data[i].showshelf==1) {
                        up="已上架";
                        console.log(data);
                        $("table").append('<tr id="tr"> ' +
                                '<th class="tdClass">' + data[i].showid + '</th>' +
                                '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                '<th class="tdClass">' + "官方平台" + '</th>' +
                                '<th class="tdClass">' + "---"+ '</th>' +
                                '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                '<th class="tdClass">' +up+ '</th>' +
                                '<th class="tdClass">' +tp+ '</th>' +
                                '<th class="tdClass"><a href="'+str+'"><span>查看</span></a>&nbsp;&nbsp;<a href="'+upStatus+'"><span>下架</span></a>&nbsp;&nbsp;<a href="'+tStatus+'"><span>推荐</span></a></th>' +
                                '</tr>');
                    }else {
                        up="未上架";

                        $("table").append('<tr id="tr"> ' +
                                '<th class="tdClass">' + data[i].showid + '</th>' +
                                '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                '<th class="tdClass">' + "官方平台" + '</th>' +
                                '<th class="tdClass">' + "---" + '</th>' +
                                '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                '<th class="tdClass">' + up+ '</th>' +
                                '<th class="tdClass">' + tp+ '</th>' +
                                '<th class="tdClass"><a href="'+str+'"><span>查看</span></a>&nbsp;&nbsp;<a href="'+edit+'"><span>编辑</span></a>&nbsp;&nbsp;<a href="'+delStatus+'"><span>删除</span></a>&nbsp;&nbsp;<a href="'+upStatus+'">上架</span></a>&nbsp;&nbsp;</th>' +
                                '</tr>');
                    }
                }else{//黄牛端
                    var tmp="";
                    var shangjia="";
                    if(data[i].auditstatus==1){
                        tmp="审核通过";
                        shangjia="上架";
                    }else if(data[i].auditstatus==0){
                        tmp="待审核";
                    }
                    else if(data[i].auditstatus==2){
                        tmp="审核不通过";

                    }
                    if(data[i].showshelf==1) {
                        console.log(data);
                        up="已上架";
                        $("table").append('<tr id="tr"> ' +
                                '<th class="tdClass">' + data[i].showid + '</th>' +
                                '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                '<th class="tdClass">' + data[i].showperson + '</th>' +
                                '<th class="tdClass">' +tmp + '</th>' +
                                '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                '<th class="tdClass">' + up+ '</th>' +
                                '<th class="tdClass">' + tp + '</th>' +
                                '<th class="tdClass"><a href="'+str+'"><span>查看</span></a>&nbsp;&nbsp;<a href="'+upStatus+'"><span>下架</span></a>&nbsp;&nbsp;<a href="'+tStatus+'"><span>推荐</span></a></th>' +
                                '</tr>');
                    }else {
                        up="未上架";

                        $("table").append('<tr id="tr"> ' +
                                '<th class="tdClass">' + data[i].showid + '</th>' +
                                '<th class="tdClass">' + data[i].showtitle + '</th>' +
                                '<th class="tdClass">' + data[i].showperson + '</th>' +
                                '<th class="tdClass">' +tmp+ '</th>' +
                                '<th class="tdClass">' + data[i].showaddtime + '</th>' +
                                '<th class="tdClass">' + up + '</th>' +
                                '<th class="tdClass">' + tp+ '</th>' +
                                '<th class="tdClass"><a href="'+str+'"><span>查看</span>&nbsp;&nbsp;<a href="'+shenHe+'"><span>审核</span></a>&nbsp;&nbsp;<a href="'+edit+'"><span>编辑</span></a>&nbsp;&nbsp;<a href="'+delStatus+'"><span>删除</span></a>&nbsp;&nbsp;<a href="'+upStatus+'"><span>'+shangjia+'</span></a>&nbsp;&nbsp;</th>' +
                                '</tr>');
                    }
                }
            }
        });

</script>
</head>
<body>
<br>
演出列表
<br><br>
<select style="width: 150px;height: 50px" id="demo">
    <option value="演出编号">演出编号</option>
    <option value="演出名称">演出名称</option>
    <option value="发布方">发布方</option>
</select>&nbsp;&nbsp;
<input type="text"  style="width: 150px;height: 50px" id="input">&nbsp;&nbsp;
<select style="width: 150px;height: 50px" id="one">
    <option value="-1">审核状态</option>
    <option value="0">待审核</option>
    <option value="1">审核通过</option>
    <option value="2">审核不通过</option>
</select>&nbsp;&nbsp;
<select style="width: 150px;height: 50px" id="two">
    <option value="-1">状态</option>
    <option value="1"> 已上架</option>
    <option value="0">未上架</option>
</select>&nbsp;&nbsp;
<select style="width: 150px;height: 50px" id="three">
    <option value="-1">是否推荐</option>
    <option value="0">未推荐</option>
    <option value="1">已推荐</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn1" style="width: 100px;height: 50px" onclick="preOrNextPage(1)">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<button style="width: 100px;height: 50px" id="btn2">新增</button>
<br><br><br>
<table width="100%" border="1" cellspacing="0" cellpadding="0" id="mytab">
    <tr>
        <th>演出序号</th>
        <th>演出名称</th>
        <th>发布方</th>
        <th>审核状态</th>
        <th>新增时间</th>
        <th>上架状态</th>
        <th>推荐状态</th>
        <th>操作</th>
    </tr>
</table>
<br><br><br>
    <div id="div">
        <button style="width: 100px;height: 30px" onclick="preOrNextPage(currentPage-1)"> 上一页</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button style="width: 100px;height: 30px" onclick="preOrNextPage(currentPage+1)">下一页</button>

    </div>
</body>
</html>
