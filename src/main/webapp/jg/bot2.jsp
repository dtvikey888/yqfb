<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%String openid=request.getParameter("openid");%>
<%String lb=request.getParameter("lb");%>
<div style="height:120px;"></div>
<div  style=" height:120px; width:100%; position:fixed; left:0; bottom:0; background-color:#ffffff">
  <table width="100%" height="120" border="0" cellpadding="0" cellspacing="10">
    <tr>
      <td width="643" align="center" bgcolor="#AE392D"><a href="UP2.jsp?openid=<%=openid%>"><m>上传</m></a></td>
      <td width="244" align="center" bgcolor="#d73615" style="font-size:80px; color:#FFF; "><a href="pm.jsp?openid=<%=openid%>&lb=<%=lb%>"><img src="IMG/ICO_UP.png" /></a></td>
      <td width="638" align="center" bgcolor="#AE392D"><a href="List.jsp?openid=<%=openid%>&lb=0"><m>我的相册</m></a></td>
    </tr>
  </table>
</div>