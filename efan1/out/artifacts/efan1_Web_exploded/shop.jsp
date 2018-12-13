<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>商品列表</title>
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
	console.log(${list});

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

	   $(function(){
		   $.get("backproduct/selectProductfontAll.do");
		   console.log(${productlist})
	   });



	</script>		
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
			   <li>用户:<%=session.getAttribute("userName")%></li>
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
			<li style="width: 220px"><a class="color1" href="<%=basePath%>index2.jsp">商城</a></li>
			<li class="grid" style="width: 220px"><a class="color2" href="<%=basePath%>shop.jsp">商品列表</a></li>
			<li class="active grid" style="width: 220px"><a class="color4" href="<%=basePath%>shopcar/update?username=${userName}">购物车</a></li>
			<li style="width: 220px"><a class="color5" href="<%=basePath%>shopvideo.jsp">视频展示</a></li>

			<li style="width: 220px"><a class="color7" href="<%=basePath%>personal_center.jsp">个人中心</a></li>
		</ul>
		<div class="clear"></div>
	</div>
   </div>










       <div class="login">
         <div class="wrap">

		<div class="cont span_2_of_3">
		  <div class="mens-toolbar">
              <div class="sort">
               	<div class="sort-by">
		           <%-- <label>排序</label>
		            <select>
		                            <option value="">
		                    推荐               </option>
		                            <option value="">
		                    价格：  由高到低              </option>
		                            <option value="">
		                    价格 ： 由低到高               </option>
		            </select>--%>
		            <a href=""><img src="<%=path%>/images/arrow2.gif" alt="" class="v-middle"></a>
               </div>
    		</div>

	         <%-- <div class="pager">
	           <div class="limiter visible-desktop">
	            <label>显示数量</label>
	            <select>
	                            <option value="" selected="selected">
	                    9                </option>
	                            <option value="">
	                    15                </option>
	                            <option value="">
	                    30                </option>
	                        </select> 每页
	             </div>
	       		<ul class="dc_pagination dc_paginationA dc_paginationA06">
				    <li><a href="#" class="previous">Pages</a></li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
			  	</ul>
		   		<div class="clear"></div>
	    	</div>--%>


     	    <div class="clear"></div>
	       </div>


			<!--第一行的数据-->
			    <%--<div class="box1">--%>
              <c:forEach items="${productlist}" var="tmp">
				   <div class="col_1_of_single1 span_1_of_single1" style="width: 27.3%"><a href="<%=basePath%>single.jsp?productId=${tmp.productId}&productName=${tmp.productName}&productIcon=${tmp.productIcon}&
							productImg=${tmp.productImg}&productPrice=${tmp.productPrice}&productDescribe=${tmp.productDescribe}&productInventory=${tmp.productInventory}&
							productSpecific=${tmp.productSpecific}&productWeight=${tmp.productWeight}">
				     <div class="view1 view-fifth1">
				  	  <div class="top_box">
					  	<h3 class="m_1" id="name">${tmp.productName}</h3>
					  	<p class="m_2">绿色健康放心食用</p>
				         <div class="grid_img">
						   <div class="css3"><img style="width: 250px;height: 173px" src=<%=path%>/${tmp.productImg} alt="图片走丢了"/></div>
					          <div class="mask1">
	                       		<div class="info">商品详情</div>
			                  </div>
	                    </div>
                       <div class="price">￥${tmp.productPrice}</div>
					   </div>
					    </div>
					   <span class="rating1">
				        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
				        <label for="rating-input-1-5" class="rating-star1"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
				        <label for="rating-input-1-4" class="rating-star1"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
				        <label for="rating-input-1-3" class="rating-star1"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
				        <label for="rating-input-1-2" class="rating-star"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
				        <label for="rating-input-1-1" class="rating-star"></label>&nbsp;

		    	      </span>
						 <ul class="list2">
						  <li>
						  	<img src="<%=path%>/images/plus.png" alt=""/>
						  	<ul class="icon1 sub-icon1 profile_img">
							  <li><a class="active-icon c1"  onclick="addshopcar()" href="<%=basePath%>shopcar/add?productId=${tmp.productId}&username=${userName}">加入购物车 </a>
								<ul class="sub-icon1 list">
									<li><h3>sed diam nonummy</h3><a href=""></a></li>
									<li><p id="productId">${tmp.productId}</p>></li>
								</ul>
							  </li>
							 </ul>
						   </li>
					     </ul>
			    	    <div class="clear"></div>
				   </a></div>
			  </c:forEach>
			<%-- </div>--%>



			  </div>
			  <div class="clear"></div>
			</div>
		   </div>

	     <div class="footer">
       	   <div class="footer-top">
       		<div class="wrap">
       			   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	 <ul class="f_list">
				  	 	<li><img src="images/f_icon.png" alt=""/><span class="delivery">Free delivery on all orders over £100*</span></li>
				  	 </ul>
				   </div>
				   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	<ul class="f_list">
				  	 	<li><img src="images/f_icon1.png" alt=""/><span class="delivery">Customer Service :<span class="orange"> (800) 000-2587 (freephone)</span></span></li>
				  	 </ul>
				   </div>
				   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	<ul class="f_list">
				  	 	<li><img src="images/f_icon2.png" alt=""/><span class="delivery">Fast delivery & free returns</span></li>
				  	 </ul>
				   </div>
				  <div class="clear"></div>
			 </div>
       	    </div>
       	    <div class="footer-middle">
       	 	  <div class="wrap">
       	 		<div class="section group">
				<div class="col_1_of_middle span_1_of_middle">
					<dl id="sample" class="dropdown">
			        <dt><a href="#"><span>Please Select a Country</span></a></dt>
			        <dd>
			            <ul>
			               <!-- <li><a href="#">Australia<img class="flag" src="images/as.png" alt="" /><span class="value">AS</span></a></li>
			                <li><a href="#">Sri Lanka<img class="flag" src="images/srl.png" alt="" /><span class="value">SL</span></a></li>
			                <li><a href="#">Newziland<img class="flag" src="images/nz.png" alt="" /><span class="value">NZ</span></a></li>
			                <li><a href="#">Pakistan<img class="flag" src="images/pk.png" alt="" /><span class="value">Pk</span></a></li>
			                <li><a href="#">United Kingdom<img class="flag" src="images/uk.png" alt="" /><span class="value">UK</span></a></li>
			                <li><a href="#">United States<img class="flag" src="images/us.png" alt="" /><span class="value">US</span></a></li>-->
			            </ul>
			         </dd>
   				    </dl>
   				 </div>
				<div class="col_1_of_middle span_1_of_middle">
					<ul class="f_list1">
						<li><span class="m_8">Sign up for email and Get 15% off</span>
						<div class="search">	  
							<input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
							<input type="submit" value="Subscribe" id="submit" name="submit">
							<div id="response"> </div>
			 			</div><div class="clear"></div>
			 		    </li>
					</ul>
				</div>
				<div class="clear"></div>
			   </div>
       	 	</div>
       	 </div>
       	 <div class="footer-bottom">
       	 	<div class="wrap">

       	 </div>
       	 <div class="copy">
       	   <div class="wrap">
			   <p>有机米商城 &copy; 2018.新品上线，版权所有，翻版必究</p>
		   </div>
       	 </div>
       </div>
       <script type="text/javascript">

		    function addshopcar(){
				var xmlhttp=new XMLHttpRequest();
				console.log("111111112222");
			/*	console.log("${tmo.producted}");*/
				console.log($("#productId").text());
			/*	var url="<%=basePath%>shopcar/add?"+"productId="+$("#productId").val()+"&username="+"${userName}";
				xmlhttp.open("get",url,true);
				xmlhttp.send();*/

			}


			$(document).ready(function() {
				<%--<%=basePath%>shopcar/add?productId=${tmp.productId}&username=${userName}
				$("#addshopcar").click(function(){
					$.get("shopcar/add",{"productId",""})
				})--%>





			
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				
				
				$().UItoTop({ easingType: 'easeOutQuart' });
				
			});
		</script>
        <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
</div>
</body>
</html>