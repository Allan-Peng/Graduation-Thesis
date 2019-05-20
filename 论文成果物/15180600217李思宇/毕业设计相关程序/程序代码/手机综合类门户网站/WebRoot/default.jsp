<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.db"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="upload/bootstrap3.3.5/css/bootstrap.min.css">

<script src="upload/jquery1.11.3/jquery-1.11.3.js"></script>

<script src="upload/bootstrap3.3.5/js/bootstrap.min.js"></script>

<%-- <script type="text/javascript" src="upload/bootstrap/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="upload/bootstrap/js/bootstrap.min.js"></script> --%>
<%-- <script type="text/javascript" src="qtimages/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="qtimages/bootstrap/css/bootstrap.min.css"/> --%>
<link rel="stylesheet" type="text/css" href="upload/bootstrap/css/bootstrap.min.css"/>

<title>手机综合类门户网站网站首页</title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>

<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>

<!--新头部的开始-->

<jsp:include page="qttop.jsp"></jsp:include>

<!--新头部的结束--> 

<!--ban图片切换开始-->

<jsp:include page="bht.jsp"></jsp:include>
<!--ban图片切换结束--> 

<!--视频和关于我们的开始-->
 <div id="hsgbanner">
		<div  class="navgrp">
		
			<ul class="nav" id="nav">
				
			  <li class="cur" ><a href="index.do">网站首页</a></li>
			  <li ><a href="xwtzList.do?lb=评测类文章" style="width:120px">评测类文章</a> </li>
			  <li><a href="xwtzList.do?lb=曝光类文章" style="width:120px">曝光类文章</a> </li>
			  <li><a href="xwtzList.do?lb=预测类文章" style="width:120px">预测类文章</a> </li>
			  <li><a href="xwtzList.do?lb=娱乐新闻">娱乐新闻</a> </li>
			  <li><a href="xwtzList.do?lb=科技新闻">科技新闻</a> </li>
			  	  <li><a href="xiaomi.do" style="width:120px">相关视频</a> </li>
			  <li><a href="main.jsp">后台管理</a> </li>
			</ul>
        </div>
 </div>
 
 
 
 
<!--  轮播图开始 -->
 <div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-667163">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-667163">
					</li>
					<li data-slide-to="1" data-target="#carousel-667163">
					</li>
					<li data-slide-to="2" data-target="#carousel-667163">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="upload/3.jpg" />
						<div class="carousel-caption">
							<h4>
								棒球
							</h4>
							<p>
								棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="upload/2.jpg" />
						<div class="carousel-caption">
							<h4>
								冲浪
							</h4>
							<p>
								冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="upload/1.jpg" />
						<div class="carousel-caption">
							<h4>
								自行车
							</h4>
							<p>
								以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-667163" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-667163" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
<!--  
 轮播图结束 -->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
<div class="spgy"> 
  <!--视频的开始-->
  <div class="sspzx">
    <div class="sspzx1"> <strong class="bt1">手机视频</strong><span class="bt2">Video Introduction</span></div>
    <div class="sspzx2"> 

 <video width="320" height="240" controls>您的浏览器不支持video标签
 <source src="upload/a.MP4" type="video/mp4">
 </video>
   <!--   <embed src="qtimages/tv/a.mp4" width="600" height="800"/> -->
      
  </div>
  </div>
  <!--视频的结束--> 
  <!--关于我们的开始-->

  <div class="gywm">
    <div class="gywm1"> <strong class="bt1">评测类文章</strong><span class="bt2">About Us</span><a class="gd" href="xwtzList.do?lb=评测类文章"
                    target="_blank">更多&gt;&gt;</a></div>
                    
    <div class="gywm2">
	
	 <ul>
      <c:forEach items="${syxinwentongzhi3 }" var="a">
              <li><a href="xwtzDetail.do?id=${a.id}">${fn:substring(a.biaoti, 0, 24)}</a> <span> ————————${fn:substring(a.addtime, 0, 10)}</span></li>
            </c:forEach>
    </ul>
	 
      <h2>&nbsp;</h2>
      <div style="clear: both;"> </div>
    </div>
  </div>
  <!--关于我们的结束-->
  <div style="clear: both;"> </div>
</div>
<!--视频和关于我们的结束--> 

<!--产品中心的开始-->
<!--产品中心的结束-->
<!--广告的开始-->
<!--广告的结束-->
<!--优势的开始-->
<!--<div class="yszs"></div>
<div class="ysnr"> <img src="qtimages/fuxing_35_01.gif" /> <img src="qtimages/fuxing_35_02.gif" /> <img src="qtimages/fuxing_35_03.gif" /> </div>
-->
<!--优势的结束-->
<!--办公环境的开始-->

<!--办公环境的结束--> 

<!--新闻中心的开始-->
<div class="jxwzx"> 
  <!--左侧新闻的开始-->
  <div class="jnews fl"> 
    <!--标题的开始-->
    <div class="jnews_title">
      <ul>
        <li style="border-right:1px solid #d6d6d6;" id="lm1" onmousemove="setTabb(1)" class="selectTab4"><a href="xwtzList.do?lb=曝光类文章"><strong>曝光类文章</strong><span>COMPANY NEWS</span></a></li>
        <li id="lm2" onmousemove="setTabb(2)"><a href="xwtzList.do?lb=预测类文章"><strong>预测类文章</strong><span>TECHNIQUE SUPPORT</span></a></li>
      </ul>
    </div>
    <!--标题的开始--> 
    <!--内容的开始-->
    <div class="jnews_nr">
      <div class="newsxian" id="Setln1"> 
        <!--单个的开始-->
        <div class="newsc">
		
          
          <!--推荐新闻的结束-->
          <div class="newss_list">
            <ul>
			 <c:forEach items="${syxinwentongzhi1 }" var="a">
        <li><a href="xwtzDetail.do?id=${a.id}">${fn:substring(a.biaoti, 0, 24)}</a><span>${fn:substring(a.addtime, 0, 10)}</span></li>
          </c:forEach>
             
            </ul>
          </div>
        </div>
        <!--单个的结束--> 
      </div>
      <div class="newsyin" id="Setln2"> 
        <!--单个的开始-->
        <div class="newsc">
		 
          <!--推荐新闻的开始--> 
          
          <!--推荐新闻的结束-->
          <div class="newss_list">
            <ul>
			   <c:forEach items="${syxinwentongzhi2 }" var="a">
        <li><a href="xwtzDetail.do?id=${a.id}">${fn:substring(a.biaoti, 0, 24)}</a><span>${fn:substring(a.addtime, 0, 10)}</span></li>
          </c:forEach>
             
            </ul>
          </div>
        </div>
        <!--单个的结束--> 
      </div>
    </div>
    <!--内容的结束--> 
  </div>
  <script src="js/sy.js" type="text/javascript"></script>
  <!--左侧新闻的结束--> 
  <!--右侧联系我们的开始-->
  <div class="jlxwm fr">
    <div class="jlxwm1" ><strong class="bt1">联系我们</strong><span class="bt2">Contact Us</span><a class="gd" href="dx_detail.php?lb=联系我们" >更多&gt;&gt;</a></div>
    <div class="slxwmc">
      <div class="dianhua">全国服务电话：<br>
        <span style="font-size:20px;">400-008-0378</span></div>
      <p><strong>手机综合类门户网站有限公司</strong><br />
        销售热线：0371-xxxxxxx <br />
        传真：0371-xxxxxx <br />
        电子邮箱：xxxxxx@126.com<br />
        地址：xxxxxxxx<br />
        办事处电话：0991-xxxxxx<br />
        传真：0991-xxxxxx<br />
        地址：xxxxxxxxxxxxxxxx号</p>
    </div>
  </div>
  <!--右侧联系我们结束-->
  <div class="clear"></div>
</div>

<!--新闻中心的结束--> 

<!--友情链接的开始-->

<jsp:include page="qtdown.jsp"></jsp:include>
<!--底部的结束-->

</body>

<!--图片切换-->


</html>
