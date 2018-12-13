<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>E娱平台首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
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
<!-- top scrolling -->
<script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
<script type="text/javascript" src="<%=path%>/js/easing.js"></script>



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
			<%-- <li><a href="shop.jsp">商品列表</a></li>
			 <li><a href="checkout.html">购物车</a></li>--%>
			   <li id="username_lab">用户：<%=session.getAttribute("userName")%></li>
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
		    <li style="width: 220px"><a class="color1" href="<%=basePath%>index2.jsp">首页</a></li>
			<li class="grid" style="width: 220px"><a class="color2" href="<%=basePath%>shop.jsp">周边</a></li>
			<li class="active grid" style="width: 220px"><a class="color4" href="<%=path%>/shopcar/update?username=${userName}">购物车</a></li>
			<li style="width: 220px"><a class="color5" href="<%=basePath%>shopvideo.jsp">演出</a></li>
			<li style="width: 220px"><a class="color7" href="<%=basePath%>personal_center.jsp">个人中心</a></li>
				<!--<li><a class="color8" href="#">Shop</a></li>
				<li><a class="color9" href="#">Football</a></li>
				<li><a class="color10" href="#">Running</a></li>
				<li><a class="color11" href="#">Originals</a></li>
				<li><a class="color12" href="#">Basketball</a></li>-->
		   </ul>
		   <div class="clear"></div>
     	</div>
       </div>
     <%--  <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>--%>
       <div class="index-banner">
       	  <div class="wmuSlider example1" style="height: 560px;">
			  <div class="wmuSliderWrapper">
				  <article style="position: relative; width: 100%; opacity: 1;"> 
				   	<div class="banner-wrap">
					   	<div class="slider-left">
							<img style="width: 700px;height: 438px" src="<%=path%>/image/usericon2.jpg" alt=""/>
						</div>
						 <div class="slider-right">
						    <h1>有机米</h1>
						    <h2>绿色健康</h2>
						    <p>你值得购买</p>
						    <div class="btn"><a href="<%=basePath%>shop.jsp">点击进入</a></div>
						 </div>
						 <div class="clear"></div>
					 </div>
					</article>
				   <article style="position: absolute; width: 100%; opacity: 0;"> 
				   	 <div class="banner-wrap">
					   	<div class="slider-left">
							<img style="width: 700px;height: 438px" src="<%=path%>/image/usericon11.jpg" alt=""/>
						</div>
						 <div class="slider-right">
							 <h1>有机米</h1>
							 <h2>绿色健康</h2>
							 <p>你值得购买</p>
						    <div class="btn"><a href="<%=basePath%>shop.jsp">点击进入</a></div>
						 </div>
						 <div class="clear"></div>
					 </div>
				   </article>
				   <article style="position: absolute; width: 100%; opacity: 0;">
				   	<div class="banner-wrap">
					   	<div class="slider-left">
							<img style="width: 700px;height: 438px" src="<%=path%>/image/usericon16.jpg" alt=""/>
						</div>
						 <div class="slider-right">
							 <h1>有机米</h1>
							 <h2>绿色健康</h2>
							 <p>你值得购买</p>
						    <div class="btn"><a href="<%=basePath%>shop.jsp">点击进入</a></div>
						 </div>
						 <div class="clear"></div>
					 </div>
				   </article>
				   <article style="position: absolute; width: 100%; opacity: 0;">
				   	<div class="banner-wrap">
					   	<div class="slider-left">
							<img style="width: 700px;height: 438px" src="<%=path%>/image/timg.jpg" alt=""/>
						</div>
						 <div class="slider-right">
							 <h1>有机米</h1>
							 <h2>绿色健康</h2>
							 <p>你值得购买</p>
						    <div class="btn"><a href="<%=basePath%>shop.jsp">点击进入</a></div>
						 </div>
						 <div class="clear"></div>
					 </div>
				   </article>
				   <article style="position: absolute; width: 100%; opacity: 0;"> 
				   	 <div class="banner-wrap">
					   	<div class="slider-left">
							<img style="width: 700px;height: 438px" src="<%=path%>/image/right.png" alt=""/>
						</div>
						 <div class="slider-right">
							 <h1>有机米</h1>
							 <h2>绿色健康</h2>
							 <p>你值得购买</p>
						    <div class="btn"><a href="<%=basePath%>shop.jsp">点击进入</a></div>
						 </div>
						 <div class="clear"></div>
					 </div>
			      </article>
				</div>
                <a class="wmuSliderPrev">前一张</a><a class="wmuSliderNext">下一张</a>
                <ul class="wmuSliderPagination">
                	<li><a href="#" class="">0</a></li>
                	<li><a href="#" class="">1</a></li>
                	<li><a href="#" class="wmuActive">2</a></li>
                	<li><a href="#">3</a></li>
                	<li><a href="#">4</a></li>
                  </ul>
                 <a class="wmuSliderPrev">前一张</a><a class="wmuSliderNext">下一张</a><ul class="wmuSliderPagination"><li><a href="#" class="wmuActive">0</a></li><li><a href="#" class="">1</a></li><li><a href="#" class="">2</a></li><li><a href="#" class="">3</a></li><li><a href="#" class="">4</a></li></ul></div>
            	 <script src="<%=path%>/js/jquery.wmuSlider.js"></script>
						<script>
       						 $('.example1').wmuSlider();         
   						</script> 	           	      
             </div>
  <%--页面主体--%>
  <div id="numberno">
  <!--第一部分轮播图管理模块，显示5张轮播图-->
	  <div  id="number1">


  </div>

         <%--第二部分，明星模块， 显示4位明星，按照人气显示前4个明星--%>
  <div id="number2">


  </div>

  <%--第三部分显示推荐新闻，显示五条新闻，有更多新闻按钮，点击跳转到新闻页面--%>
  <div id="number3">

  </div>

  <%--第四部分显示推荐话题，显示5条话题，有更多话题按钮，点击跳转到话题页面--%>
  <div id="number4">

  </div>
  </div>

<c:forEach items="${list}" var="tmp">
					<div class="content-bottom">
						<div class="box1">
							<div class="col_1_of_3 span_1_of_3"><a href="<%=basePath%>single.jsp?productId=${tmp.productId}&productName=${tmp.productName}&productIcon=${tmp.productIcon}&
							productImg=${tmp.productImg}&productPrice=${tmp.productPrice}&productDescribe=${tmp.productDescribe}&productInventory=${tmp.productInventory}&
							productSpecific=${tmp.productSpecific}&productWeight=${tmp.productWeight}">
								<div class="view view-fifth">
									<div class="top_box">
										<h3 class="m_1">${tmp.productName}</h3>
										<p class="m_2">健康天然无公害</p>
										<div class="grid_img">
											<div class="css3"><img style="width: 250px;height: 173px" src=<%=path%>/${tmp.productImg} alt="图片走丢了"/></div>
											<div class="mask">
												<div class="info">商品详情</div>
											</div>
										</div>
										<div class="price">￥${tmp.productPrice}</div>
									</div>
								</div>
					   <span class="rating">
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
								<ul class="list">
									<li>
										<img src="images/plus.png" alt=""/>
										<ul class="icon1 sub-icon1 profile_img">
											<li><a class="active-icon c1" href="<%=basePath%>shopcar/addindex?productId=${tmp.productId}&username=${userName}">加入购物车 </a>
												<ul class="sub-icon1 list">
													<li><h3>sed diam nonummy</h3><a href=""></a></li>
													<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
								<div class="clear"></div>
							</a></div>
					</c:forEach>


       	 <div class="footer-middle">
       	 	<div class="wrap">
       	 		<div class="section group">
				<div class="col_1_of_middle span_1_of_middle">
					<dl id="sample" class="dropdown">
			        <dt><a href="#"><span>中国大米</span></a></dt>
			        <dd>
			            <ul>
			                <li><a href="#">北京<img class="flag" src="" alt="" /><span class="value">AS</span></a></li>
			                <li><a href="#">上海<img class="flag" src="" alt="" /><span class="value">SL</span></a></li>
			                <li><a href="#">杭州<img class="flag" src="" alt="" /><span class="value">NZ</span></a></li>
			             <%--   <li><a href="#">Pakistan<img class="flag" src="images/pk.png" alt="" /><span class="value">Pk</span></a></li>
			                <li><a href="#">United Kingdom<img class="flag" src="images/uk.png" alt="" /><span class="value">UK</span></a></li>
			                <li><a href="#">United States<img class="flag" src="images/us.png" alt="" /><span class="value">US</span></a></li>--%>
			            </ul>
			         </dd>
   				    </dl>
   				 </div>
				<div class="col_1_of_middle span_1_of_middle">
					<ul class="f_list1">
						<li><span class="m_8">中国最好吃的米都在这里，不信，你可以试试</span>
						<div class="search">
							<%--<input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
							<input type="submit" value="Subscribe" id="submit" name="submit">
							<div id="response"> </div>--%>
			 			</div><div class="clear"></div>
			 		    </li>
					</ul>
				</div>
				<div class="clear"></div>
			   </div>
       	 	</div>
       	 </div>

       	 <div class="copy">
       	   <div class="wrap">
       	   	  <p>有机米商城 &copy; 2018.新品上线，版权所有，翻版必究</p>
       	   </div>
       	 </div>
       </div>
       <script type="text/javascript">
			$(document).ready(function() {

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

</body>
</html>