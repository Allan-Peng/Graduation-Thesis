<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

 <%
  String lb=request.getParameter("lb");
  //String lb=new String(request.getParameter("lb").getBytes("8859_1"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title><%=lb%></title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<style>
        * {
            margin: 0;
            padding: 0;
        }
        body,
        html {
            font-size: 14px;
            font-family: 'Microsoft Yahei', '微软雅黑', 'Simsun', '宋体', 'Arial', sans-serif;
        }
        img {
            border: 0;
        }
        a {
            color: #fff;
            text-decoration: none;
            outline: none;
        }
        ol,
        ul,
        li {
            list-style: none;
        }
        .head-nav {
            width: 100%;
            height: 60px;
            background: #007130;
        }
        .head-nav-con {
            width: 1200px;
            height: 60px;
            margin: auto;
        }
        .head-nav-con ul li {
            width: 170px;
            float: left;
            font-size: 20px;
            text-align: center;
        }
        .head-nav-con ul li:hover {
            background: #ff9c01;
        }
        .head-nav-con ul a {
            display: block;
            text-decoration: none;
            text-align: center;
            line-height: 60px;
            color: white;
        }
        .head-nav-con .drop-down {
            position: relative;
        }
        .head-nav-con .drop-down-content {
            padding: 0;
            display: none;
            position: absolute;
            z-index: 1;
            background: #007130;
        }
        .head-nav-con .drop-down-content li:hover > a {
            background-color: #ff9c01;
        }
        .head-nav-con .drop-down:hover .drop-down-content {
            display: block;
        }
        .head-nav-con .drop-down-2 {
            position: relative;
        }
        .head-nav-con .drop-down-content-2 {
            padding: 0;
            display: none;
            position: absolute;
            z-index: 1;
            background-color: #007130;
            right: -170px;
            top: 0;
        }
        .head-nav-con .drop-down-content-2 > li {
            float: none;
            background-color: #007130;
        }
        .head-nav-con .drop-down-content-2 li:hover a {
            background-color: #ff9c01;
        }
        .head-nav-con .drop-down-2:hover .drop-down-content-2 {
            display: block;
        }
    </style>


<body>

<!--新头部的开始-->

<jsp:include page="qttop.jsp"></jsp:include>
 <div id="hsgbanner">
		<div  class="navgrp">
		
			<ul class="nav" id="nav">
				
			  <li ><a href="index.do">网站首页</a></li>
			  

			<c:choose>
<c:when test ="${cao==1}"> <li class="cur" ><a href="xwtzList.do?lb=评测类文章">评测类文章</a> </li>
</c:when>
<c:otherwise>
  <li><a href="xwtzList.do?lb=评测类文章">评测类文章</a> </li>
</c:otherwise>
</c:choose>	
	
				<c:choose>
<c:when test ="${cao==2}"> <li class="cur" ><a href="xwtzList.do?lb=曝光类文章">曝光类文章</a> </li>
</c:when>
<c:otherwise>
  <li><a href="xwtzList.do?lb=曝光类文章">曝光类文章</a> </li>
</c:otherwise>
</c:choose>		
	
			
			<c:choose>
<c:when test ="${cao==3}"> <li class="cur" ><a href="xwtzList.do?lb=预测类文章">预测类文章</a> </li>
</c:when>
<c:otherwise>
  <li><a href="xwtzList.do?lb=预测类文章">预测类文章</a> </li>
</c:otherwise>
</c:choose>			
			
				<c:choose>
<c:when test ="${cao==4}"> <li class="cur" ><a href="xwtzList.do?lb=娱乐新闻">娱乐新闻</a> </li>
</c:when>
<c:otherwise>
	  <li><a href="xwtzList.do?lb=娱乐新闻">娱乐新闻</a> </li>
</c:otherwise>
</c:choose>				
		<c:choose>
<c:when test ="${cao==5}"> <li class="cur" ><a href="xwtzList.do?lb=科技新闻">科技新闻</a> </li>
</c:when>
<c:otherwise>
	  <li><a href="xwtzList.do?lb=科技新闻">科技新闻</a> </li>
</c:otherwise>
</c:choose>			
			
<%-- 		<c:choose>
<c:when test ="${cao==6}"> <li class="cur" >	 <a href="xwtzList.do?lb=视频">发布会视频</a> </li>
</c:when>
<c:otherwise>
	 	  <li><a href="xwtzList.do?lb=视频">发布会视频</a> </li>
</c:otherwise>
</c:choose>		 --%>	
			

<c:choose>
<c:when test ="${cao==7}"> <li class="cur" >	<a href="login.jsp">后台管理</a> </li>
</c:when>
<c:otherwise>
		  <li><a href="login.jsp"> 后台管理</a></li>
</c:otherwise>
</c:choose>	
		
            <div class="head-nav-con clearFloat">
                <ul>
                    <li class="drop-down" ><a href="#" style="margin-top:-8px;">发布会视频</a>
                        <ul class="drop-down-content">
                            <li><a href="xiaomi.do">小米</a></li>
                            <li><a href="huawei.do">华为</a></li>
                        </ul>
                    </li>
                </ul>
        
    </div>
			  
		
			</ul>
        </div>
 </div>
<!--新头部的结束--> <!--产品中心ban开始-->
<div class="newsban"></div>

<!--产品中心ban结束-->

<!--主体内容的开始-->
<div class="fxmain">
  <!--顶部类别开始-->
  <div class="fx_fenlei">
     <div class="leibei fl">
       <ul>
         <li><a class="diyi" >华为</a></li>
         <li><a href="#">保养常识</a></li>
         <li><a href="#">技术支持</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     当前位置：<a href="index.do">网站首页</a> &gt;发布会视频&gt; 华为     </div> 
  </div>
  <!--顶部类别结束-->
  <!--详细内容的开始-->
  <div class="fxmain_nr">
   
   <video width="320" height="240" controls>您的浏览器不支持video标签
 <source src="upload/a.MP4" type="video/mp4">
 </video>
					  
  </div>
  
  <!--详细内容的结束-->
  
</div>

<!--主体内容的结束-->





<!--底部的开始-->
<jsp:include page="qtdown.jsp"></jsp:include>
<!--底部的结束-->

</body>
</html>
