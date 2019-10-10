<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.fjw.utils.HTMLSpirit"%>
<%
//String openid =request.getParameter("openid");

 String id =request.getParameter("id"); 
  sql_data sqlbean=new sql_data();
  String sql = "Select * FROM yqfbwx_tea where id="+id;
  ResultSet RS = sqlbean.executeQuery(sql);
  String images2="";
  String bh ="";
  String xm ="";
  String title="";
  String zan="";
  String ps="";
  String memo=""; 
  int lb=0;
  String lbs = "";
  String school="";
 
  while(RS.next()){

    bh = RS.getString("bh");
    title = RS.getString("title");
    //out.println(title);
	memo = RS.getString("memo");
	school = RS.getString("school");
	ps = RS.getString("ps");
	
	String images ="";
	images = RS.getString("img1");
	
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://www.yqrb.com.cn/yqvod/bmwj/asp/sxbook/download3/"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}
  }


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=0.40, maximum-scale=1.0, user-scalable=no"/>
<title>最美教师评选</title>
<style>
body{font-size:30px; font-family:微软雅黑; padding:0px;margin:0px; background-color:#f4e6c3; }
a{text-decoration:none; color:#000000;}
a:hover{ color:##d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px; color:#ffffff;}
c{font-size:35px; color:#b5b5b5; font-family:Arial;}
d{color:#ffffff; text-indent:2em;}
e{font-size:35px; font-weight:bold; color:#c1262c;}

input[type="radio"] {
    display: none;
}
input[type="radio"]+span {
    display: inline-block;
    width:30px;
    height:30px;
    vertical-align: middle;
    border-radius: 50%;
    border: 6px solid #999;
    background-color: #ddd;
}
input[type="radio"]:checked+span {
    border: 6px solid #ffbfac;
    background-color: #f19175;
}
.STYLE3 {color: #FF0000}
.STYLE6 {color: #666666}
</style>

</head>

<body >
<table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background:url(IMG/IMG_top.jpg) no-repeat top center; " >
  <tr>
    <td height="320" align="center" valign="top"><table width="100%" cellspacing="0" cellpadding="30">
      <tr>
        <td width="13%"><a href="javascript:history.back(-1)"><img src="IMG/ICO_return.png" width="200" /></a></td>
        <td width="87%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table> 

<div style="margin-bottom:20px;">

  <div align="center">NO.<%=bh%></div>
  <div align="center" style="margin-top:15px;">
  <img style="border:8px solid #fff;" src="<%=images2%>" width="350" height="500" /></div>
  <div style="background:#FFFFFF;width:90%;margin:0 auto;margin-top:15px;">
  <div style="background:#FFFFFF;margin-top:10px;padding-top:15px;"><span class="STYLE6">&nbsp;&nbsp;姓名：</span><span><%=title%></span></div>
  <div style="background:#FFFFFF;margin-top:10px;"><span class="STYLE6">&nbsp;&nbsp;学校：</span><span><%=school%></span></div>
  <div style="background:#FFFFFF;margin-top:10px;"><span class="STYLE6">&nbsp;&nbsp;票数：</span><span class="STYLE3"><%=ps%></span></div>
  <div style="background:#FFFFFF;margin-top:10px;padding-bottom:15px;padding-left:18px;padding-right:18px;line-height:58px;"><span><%=HTMLSpirit.delHTMLTag(memo)%></span></div>
  </div>
</div>
  
  

</body>
</html>
