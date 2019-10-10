<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>“随手拍”拍下“不文明”</title>


<%
  String id =request.getParameter("id"); 
  sql_data sqlbean=new sql_data();
  String sql = "Select * FROM yqfbwx_ssp where yz=1 and id="+id;
  ResultSet RS = sqlbean.executeQuery(sql);
  String images2="";
  String bh ="";
  String xm="";
  String pssj="";
  String psdd="";
  String memo=""; 
 
  while(RS.next()){

    bh = RS.getString("bh");
	xm = RS.getString("xm");
	pssj = RS.getString("pssj");
	psdd = RS.getString("psdd");
	memo = RS.getString("memo");
	
	String images ="";
	images = RS.getString("img1");
	
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download7/"+images;
	}else{
		images2 = "http://60.190.93.215/ADV/uploadfiles/video/no.gif";
	}


}
   %>

<style>
body{font-size:13px;color:#3f3e3d; font-family:微软雅黑; background-color:#f1f1f3; padding:0px; width:1195px; margin:0 auto;}
a{color:#3f3e3d; text-decoration:none; line-height:25px;}
a:hover{ color:#de1d60; text-decoration:none;}
h1{font-size:16px; line-height:25px;}
h2{font-size:16px;line-height:25px; font-weight:bold; color:#c1262c;}
d{font-size:16px; color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}

/* item_list */
.item_list{position:relative;padding:0 0 50px;}
.item{
	width:226px;background:#fff;overflow:hidden;margin:15px 0 0 0;
	border-radius:4px 4px 4px 4px;
	box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);	
}
.item_t{padding:35px 8px 0;}
.item_t .img{background-color:#FFFFFF;margin:0 auto;position:relative;width:210px;min-height:210px;}
.item_t .img a{display:block;}
.item_t .img a:hover{background:#000;}
.item_t .img a:hover img{filter:alpha(opacity=80);-khtml-opacity:0.8;opacity:0.8;-webkit-transition:all 0.3s ease-out;-khtml-transition:all 0.3s ease-out;}
.item_t .price{
	position:absolute;
	top:-25px;
	right:65px;
	background-color:rgba(0, 0, 0, 0);
	color:#333;
	filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#33000000, endcolorstr=#33000000);
}
.item .btns{display:none;}
.img_album_btn{top:0px;right:0px;position:absolute;background:#f8b62c;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
.img_album_btn:hover{color:#fff;}
.item_t .title{padding:8px 0;line-height:18px;}
.item_b{padding:20px 8px; font:"微软雅黑"}

.item_b .items_likes em{line-height:23px;display:block;float:left;padding:0px 6px;color:#FF6699;font-weight:800;border:1px solid #ff6fa6;border-radius:3px;}

.clearfix {display:inline-table;}
.clearfix {display:block;}
.clearfix:after {content:".";display:block;height:0;clear:both;visibility:hidden;}
.fl {float:left;}
.img_album_btn1 {top:0px;right:0px;position:absolute;background:#f8b62c;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
.item1 {	width:226px;background:#fff;overflow:hidden;margin:15px 0 0 0;
	border-radius:4px 4px 4px 4px;
	box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);	
}
.img_album_btn11 {top:0px;right:0px;position:absolute;background:#f8b62c;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
</style>
</head>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="150" align="center" valign="top" ><table width="1195" height="102" border="0" cellspacing="10">
      <tr valign="bottom">
        <td height="308" colspan="6" align="center"  background="IMG/suishoupai-banner.png" style="background-repeat:no-repeat">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" align="center" valign="top" ><table width="1195" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="500" align="center" valign="top" bgcolor="#FFFFFF"><table width="500" border="0" cellpadding="0" cellspacing="3" style="background-color:#FFF">
          <tr>
            <td colspan="2" align="center" height="30"><a style="font-family:Arial; font-size:20px;">NO.<%=bh%></a> </td>
          </tr>
          <tr>
            <td  width="32%" height="30px"align="left"><p>姓名（昵称）：</p></td>
            <td align="left"><%=xm%></td>
          </tr>
          <tr>
            <td width="32%" height="30px" align="left">拍摄时间：</td>
            <td align="left"><%=pssj%></td>
          </tr>
          <tr>
            <td width="32%" height="30px" align="left">拍摄地址：</td>
            <td align="left"><%=psdd%></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><img src="<%=images2%>" width="100%" /></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><p><%=memo%></p></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
 
  <tr>
    <td height="50" align="center" valign="top"><a href="#"></a></td>
  </tr>
  <tr>
    <td height="70" align="center" valign="top" bgcolor="#f8b62c" ><table width="100%" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f8b62c">
      <tr>
        <td width="182" height="62" align="center"><a href="http://www.yqcn.com/" target="_blank"><img src="http://zt1.yqcn.com/logo/Logo_zgyqw_white.png" width="177" height="54" border="0" /></a></td>
        <td width="10">&nbsp;</td>
        <td width="788" align="left"><d>Copyright &copy; www.yqcn.com　All Rights Reserved. 版权所有 中国乐清网 
          专题制作：中国乐清网2015年05月</d></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
