<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<div class="itop">
  <div class="itopc">
    <div class="itopcl"><span>欢迎进入手机综合类门户网站公司官网!</span></div>
    <div class="itopcr">
	  <div align="right">
	   <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
	      <a href="login.jsp">用户登陆</a><span>|</span><a href="userreg.jsp">用户注册</a>
	      <%
							}
				  else
				  {
				 %>
	    当前用户:<%=request.getSession().getAttribute("username")%>,权限:<%=request.getSession().getAttribute("cx")%>;&nbsp;&nbsp; <a href="logout.jsp">退出</a><span>|</span><a href="main.jsp">个人后台</a>
	     <% } %>
        </div>
    </div>
  </div>
 
</div>
<div class="ilogo">
  <div class="ilogoc">
    <div class="ilogol"><img src="qtimages/timg.jpg" width="70" height="65" />
      <p><strong>手机综合类门户网站</strong><br>
        <span>全力打造,精心呵护</span></p>
    </div>
    <div class="ilogor">
      <p>全国咨询热线：<br>
        <strong>400-xxxx-xxxx</strong></p>
    </div>
    <div class="clear"></div>
  </div>
</div>

