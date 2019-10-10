<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String id =request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width" name="viewport"/>
<title>庆祝建国70周年系列活动 晒晒你和光阴的故事</title>
<style>
body{font-size:14px; font-family:微软雅黑; background:url(IMG/bodybg.jpg); padding:0px;margin:0px;}
a{text-decoration:none; color:#000000;}
a:hover{ color:##d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:15px; color:#ffffff;}
c{font-size:15px; font-family:Arial;}
d{color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}
td{font-size:15px;}
</style>
<script>
function DataLength(fData) 
{ 
    var intLength=0 
    for (var i=0;i<fData.length;i++) 
    { 
        if ((fData.charCodeAt(i) < 0) || (fData.charCodeAt(i) > 255)) 
            intLength=intLength+2 
        else 
            intLength=intLength+1    
    } 
    return intLength 
} 
</script>
</head>
<body >


<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr bgcolor="#d73615">
    <td align="center" valign="middle"><table width="100%" height="75" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="76" align="right"><a href="index.jsp"><img src="IMG/ICO_return.png" width="57" height="29" border="0" /></a></td>
        <td width="1442" align="center"><img src="IMG/PIC_theme.png" width=90% /></td>
        <td width="50" align="center" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top">
		
	<form name="form1" action="xg_chk.jsp?id=<%=id%>" method="post">
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0">

	
	<!--  
      <tr>
        <td align="center"><table width="95%" border="0" cellspacing="10" onsubmit="return check();">
            <tr>
            <td height="60" align="left" valign="top">
            <input type="text" name="xm"  placeholder=" 姓名"  style="width:100%;height:40px;border:1px solid #dddddd;"></td>
            </tr>
        </table></td>
      </tr>
     -->
      <tr>
        <td align="center"><table width="95%" border="0" cellspacing="10" >
        
            <tr>
            <td height="60" align="left" valign="top">
            
            <input type="text" name="memo" value="<%=ZghTools.getMemo2(id) %>" style="width:100%;height:50px;border:1px solid #dddddd;font-size:18px;"></td>
            </tr>
            
            <tr>
            <td height="60" align="left" valign="top">
            
             <select  id="lb" name=lb style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:120px;font-size:25px;">
			   
				<option value="1">为祖国唱一首歌（读诗）</option>
				<option value="2">为祖国绘一副画</option>
				<option value="3">为祖国拍一张照</option>
				<option value="4">为家乡打一处卡</option>
	    	</select>


			</td>
            </tr>
         
        </table></td>
      </tr>
      <tr>
        <td height="50" align="center"><br />
          <input type=image src="IMG/Button_tj.png" width=60%  onClick="document.form1.action='xg_chk.jsp?id=<%=id%>';document.form1.submit();"/></td>
      </tr>

	
    </table>
      </form>
	</td>
  </tr></table>
<div style="height:50px;"></div>

<script language="javascript">
function checkMobile(){ 
    var sMobile = document.form.tel.value 
    if(!(/^1[3|5|7|8][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("不是完整的11位手机号或者正确的手机号前七位"); 
        document.form.tel.focus(); 
        return false; 
    } 
} 

</script>
</body>
</html>
