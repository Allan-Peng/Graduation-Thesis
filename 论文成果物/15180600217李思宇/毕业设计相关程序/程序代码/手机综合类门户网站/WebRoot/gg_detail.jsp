<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

 <%
  String id=request.getParameter("id");

  connDbBean.hsgexecute("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
  if(request.getParameter("jbid")!=null)
  {
  connDbBean.hsgexecute("update pinglun set bjb=bjb+1 where id="+request.getParameter("jbid"));
  }
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>内容详细</title>
<link rel="stylesheet" type="text/css" href="qtimages/css/fxke.css"/>
<link rel="stylesheet" href="qtimages/hsgbanner.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
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
         <li><a class="diyi" >内容详细</a></li>
         <!--<li><a href="#">行业动态</a></li>
         <li><a href="#">保养常识</a></li>
         <li><a href="#">技术支持</a></li>-->
       </ul>
     </div>
     <div class="dqwz fr">
     当前位置：<a href="index.do">网站首页</a> &gt; 内容详细     </div> 
  </div>
  <!--顶部类别结束-->
  <!--详细内容的开始-->
  <div class="fxmain_nr">
   
  			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FA8A89" class="newsline" style="border-collapse:collapse">
                          <tr>
                            <td height="46" align="center" class="STYLE2">${xinwentongzhi.biaoti} (被访问${xinwentongzhi.dianjilv }次) </td>
                          </tr>
                          <tr>
                            <td height="110" align="left">${xinwentongzhi.neirong }</td>
                          </tr>
                          <tr>
                            <td height="33" align="right"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">
                              <tr>
                                <td width="30" align="center" bgcolor="CCFFFF">序号</td>
                                <td width="471" bgcolor='#CCFFFF'>评价内容</td>
                                <td width="88" bgcolor='#CCFFFF'>评分</td>
                                <td width="88" bgcolor='#CCFFFF'>评论人</td>
                                <td width="138" align="center" bgcolor="CCFFFF">被举报次数</td>
                                <td width="138" align="center" bgcolor="CCFFFF">评论时间</td>
                              </tr>
                              <%@page import="com.util.db"%>
                              <%
								   int pli=0;
    for(HashMap map:new db().getpinglun("xinwentongzhi",id)){
	pli=pli+1;
     %>
                              <tr>
                                <td width="30" align="center" bgcolor='#CCFF99'><%=pli%></td>
                                <td width="471" bgcolor='#CCFF99'><%=map.get("pinglunneirong") %></td>
                                <td width="88" bgcolor='#CCFF99'><%=map.get("pingfen") %></td>
                                <td width="88" bgcolor='#CCFF99'><%=map.get("pinglunren") %></td>
                                <td width="138" align="center" bgcolor="CCFF99"><%=map.get("bjb") %> <a href="xwtzDetail.do?id=<%=id%>&jbid=<%=map.get("id") %>">逆名举报</a> </td>
                                <td width="138" align="center" bgcolor="CCFF99"><%=map.get("addtime") %></td>
                              </tr>
                              <%
								 
								  }
								   %>
                            </table>
							  <div align="center">
                                <input type="button" name="Submit5" value="返回" onclick="javascript:history.back();" />
                                <input type="button" name="Submit52" value="收藏" onclick="javascript:location.href='jrsc.jsp?id=<%=id%>&biao=xinwentongzhi&ziduan=biaoti';"  />
                                <input type="button" name="Submit53" value="评论" onclick="javascript:hsgpinglun('xinwentongzhi','<%=id%>')"/>
                              </div></td>
                          </tr>
                        </table>
					  
  </div>
  
  <!--详细内容的结束-->
  
</div>

<!--主体内容的结束-->





<!--底部的开始-->
<jsp:include page="qtdown.jsp"></jsp:include>
<!--底部的结束-->

</body>
</html>
