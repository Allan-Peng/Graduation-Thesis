<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="xinwentongzhihsgb" scope="page" class="com.bean.XinwentongzhiBean" /> 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=xinwentongzhi.xls");
%>
<html>
  <head>
    <title>新闻通知</title>
  </head>

  <body >
 <%
			String sql="select * from xinwentongzhi  order by id desc";

			
			%>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td align='center'>标题</td>    <td align='center'>类别</td>        <td  width='90' align='center'>首页图片</td>    <td align='center'>点击率</td>    <td align='center'>添加人</td>    
	
    <td width="120" align="center" bgcolor="CCFFFF">添加时间</td>
    
  </tr>
   <%		
				List pagelist3=xinwentongzhihsgb.getAllXinwentongzhi(8);
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td>${u.biaoti}</td>    <td>${u.leibie}</td>        <td width='90' align='center'><a href='${u.shouyetupian}' target='_blank'><img src='${u.shouyetupian}' width=88 height=99 border=0 /></a></td>    <td>${u.dianjilv}</td>    <td>${u.tianjiaren}</td>    
	
	
   
  </tr>
  	<%
  }}
   %>
   
</table>
<br>
  </body>
</html>

