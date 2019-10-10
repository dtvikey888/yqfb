<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.sql_data"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
  
    <title>乐清市社会心理服务指导中心</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1,maximum-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<link href="css/style.css" rel="stylesheet" type="text/css"/>
	
  </head>
  
<body>
 <div  id="contentid" style="display:block">
 
<div class="page" id="page2">
	<div class="bg"></div>
	<div class="p2_btn1" id="p2_btn1"></div>
	
	<div class="p3_list" id="p3_list" style="padding-top:50px;">
	
	<table cellspacing="10" cellpadding="0">
	
      <tr>
        <td colspan="2" align="center" valign="top">
        
        <table cellspacing="15" cellpadding="0">
          <tr>
            <td width="94" align="right" valign="top" style="font-size:15px;"><div align="center">编号</div></td>
            <td width="123" align="right" valign="top" style="font-size:15px;"><div align="center">姓名</div></td>
            <td width="182" align="right" valign="top" style="font-size:15px;"><div align="center">电话</div></td>
            </tr>
<% 
String xm,tel,id;
xm=null;
tel=null;
id=null;
String sql="select * from doc1 where openid<>'null'";
ResultSet rs=sqlbean.executeQuery(sql); 
while(rs.next())
{
id = rs.getString("id");
xm = rs.getString("xm");
tel = rs.getString("tel");
%>
			
          <tr>
            <td align="right" valign="top" style="font-size:15px;"><%=id %></td>
            <td align="right" valign="top" style="font-size:15px;"><%=xm %></td>
            <td align="right" valign="top" style="font-size:15px;"><%=tel %></td>
          </tr>

<%
}
%>			  
        </table></td>
      </tr>
    </table>

  </div>
    

	
	<div id="slt" style="display: none;"><img src="img/top.jpg"></div>
</div>


 
</body>
</html>
