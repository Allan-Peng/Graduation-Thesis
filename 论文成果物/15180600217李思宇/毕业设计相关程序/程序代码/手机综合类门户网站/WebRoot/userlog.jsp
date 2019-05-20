<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>用户登陆</title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 20px;
	font-weight: bold;
	color: #078548;
}
-->
</style>
<body>

<!--新头部的开始-->

<jsp:include page="qttop.jsp"></jsp:include>
<!--新头部的结束--> <!--产品中心ban开始-->
<div class="cpzxban"></div>

<!--产品中心ban结束-->

<!--主体内容的开始-->
<div class="fxmain">
  <!--顶部类别开始-->
  <div class="fx_fenlei">
     <div class="leibei fl">
       <ul>
         <li><a class="diyi" >用户登陆</a></li>
         <!--<li><a href="#">行业动态</a></li>
         <li><a href="#">保养常识</a></li>
         <li><a href="#">技术支持</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     当前位置：<a href="index.do">网站首页</a> &gt; 用户登陆     </div> 
  </div>
  <!--顶部类别结束-->
  <!--详细内容的开始-->
  <div class="fxmain_nr">
   
  			  
								<%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
                          
                            <table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
							<form action="hsgloginyanzheng.jsp" method="post" name="userlog" id="userlog" >
                              <tr>
                                <td height="48" colspan="4" style="padding-left:30px; font-size:20px;"><strong>用户登陆</strong></td>
                              </tr>
                              <tr>
                                <td width="40" height="28">&nbsp;</td>
                                <td width="240" height="28">用户名:</td>
                                <td height="28" colspan="2"><input name="username" type="text" id="username" placeholder="请输入用户名" style="width:160px; height:40px; border:solid 1px #000000; color:#666666;"  /></td>
                              </tr>
                              <tr>
                                <td height="28">&nbsp;</td>
                                <td height="28">密码:</td>
                                <td height="28" colspan="2"><input name="pwd" type="password" id="pwd" placeholder="请输入密码" style="width:160px; height:40px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                              <tr >
                                <td height="28">&nbsp;</td>
                                <td height="28">权限:</td>
                                <td height="28" colspan="2"><select name="cx" id="cx" style="width:160px; height:40px; border:solid 1px #000000; color:#666666" >
                                    <option value="注册用户">注册用户</option>
                                   
									<!--quxanxiaxndexnglxu-->
                                </select></td>
                              </tr>
                              <tr >
                                <td height="28">&nbsp;</td>
                                <td height="28">验证码:</td>
                                <td width="67" height="28"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" /></td>
                                <td width="653"><%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" id="yzm" value="<%=yzm %>" >
								   <%=yzm %></td>
                              </tr>
                              <tr>
                                <td height="38" align="center">&nbsp;</td>
                                <td height="38" align="center">&nbsp;</td>
                                <td height="38" colspan="2"><input type="submit" name="Submit" value="登陆" onClick="return checklog();" class="button button1" />
                                  <input type="reset" name="Submit2" value="重置" class="button button1" /></td>
                              </tr>
							   </form>
                            </table>
                         
						   <script type="text/javascript">
       
function checklog()
{
	if(document.userlog.username.value=="" || document.userlog.pwd.value=="" || document.userlog.pagerandom.value=="")
	{
		alert("请输入完整");
		return false;
	}
	if (document.userlog.pagerandom.value != document.userlog.yzm.value) {
			alert("验证码错误！");
			document.userlog.pagerandom.focus();
			return false;
	}
	
}
           
                                  </script>
								  <%
							}
				  else
				  {
				 %>
                          <table width="100%" height="300" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                            <tr>
                              <td height="28" align="left" style="padding-left:20px; font-size:20px;">当前用户：<%=request.getSession().getAttribute("username")%></td>
                            </tr>
							 <tr>
                              <td height="28" align="left" style="padding-left:20px; font-size:20px;">您的权限：<%=request.getSession().getAttribute("cx")%></td>
                            </tr>
                            <tr>
                              <td height="28" align="left" style="padding-left:20px; font-size:20px;">欢迎您的到来!!!</td>
                            </tr>
                            <tr>
                              <td height="28" align="center"><input type="button" name="Submit3" value="退出" onClick="javascript:location.href='logout.jsp';" class="button button1" />
                                  <input type="button" name="Submit22" value="个人后台" onClick="javascript:location.href='main.jsp';" class="button button1" /></td>
                            </tr>
                          </table>
                          <%
						  }
						  %>
					  
  </div>
  
  <!--详细内容的结束-->
  
</div>

<!--主体内容的结束-->





<!--底部的开始-->
<jsp:include page="qtdown.jsp"></jsp:include>
<!--底部的结束-->

</body>
</html>


