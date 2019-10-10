<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>乐清最美笑脸大赛</title>

<%
  String id =request.getParameter("id"); 
  sql_data sqlbean=new sql_data();
  String sql = "Select * FROM yqfbwx_face where id="+id;
  ResultSet RS = sqlbean.executeQuery(sql);
  String images2="";
  String bh ="";
  String xm ="";
  String zan="";
  String memo=""; 
 
  while(RS.next()){

    bh = RS.getString("bh");
	xm = RS.getString("xm");
	zan = RS.getString("zan");
	memo = RS.getString("memo");
	
	String images ="";
	images = RS.getString("img1");
	
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3/"+images;
	}else{
		images2 = "http://60.190.93.215/ADV/uploadfiles/video/no.gif";
	}


}
   %>


<style>
body{font-size:13px;color:#3f3e3d; font-family:微软雅黑; background-color:#f1f1f3; padding:0px;margin:0px; }
a{color:#3f3e3d; text-decoration:none; line-height:25px;}
a:hover{ color:#de1d60; text-decoration:none;}
h1{font-size:16px; line-height:25px;}
h2{font-size:16px;line-height:25px; font-weight:bold; color:#c1262c;}
d{font-size:16px; color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}

</style>

<script language="JavaScript">
function checkinput(){


   if(form1.img1.value == "" ){
      alert("请点击加号按钮上传美图!");
      form1.img1.focus();
      return false;
    }

	if(form1.xm.value == "" ){
      alert("请输入您的真实姓名!");
      form1.xm.focus();
      return false;
    }	
   
   if(form1.tel.value == "" ){
      alert("请输入您的电话!");
      form1.tel.focus();
      return false;
    }	
	
	
  	
		  
}
</script>   



</head>

<body>
 <form id="form1" name="form1" method="post" action="sc_chk.jsp" onSubmit="return checkinput()">
  <input type="hidden" id="img1" name="img1" value=""/>
  
<table width="100%" border="0" cellpadding="0" cellspacing="0"style="background:url(IMG/TOP_D.png) no-repeat top center;">
  <tr style="background:url(IMG/wlwhj3.png) no-repeat top left;">
    <td height="150" align="center" valign="top" ><table width="1195" height="102" border="0" cellspacing="10">
      <tr>
        <td align="center" valign="bottom"><img src="IMG/PIC_theme.png" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" align="center" valign="top" ><table width="1195" border="0" cellpadding="0" cellspacing="0" style="background:url(IMG/round.png) no-repeat top left;">
      <tr>
        <td height="500" align="center" valign="top">
		
		
   
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#FFF">
          <tr>
            <td width="63%" align="center">&nbsp;</td>
            <td width="37%" align="center"><div align="left">NO.<%=bh %></div></td>
          </tr>
          <tr>
            <td colspan="2" align="center">
			<div>
			 <img src="<%=images2%>" width="550px;"/>			</div>			</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><table width="47%" border="0" cellspacing="10"  style="background-color:#FFF;" >
              <tr>
                <td width="7%" height="30"><img src="IMG/ICO24x24_user.png" width="24" height="24" /></td>
                <td width="48%" height="20"><%=xm %></td>
                <td width="45%">票数： <%=MyUtils3.GetPS(id) %></td>
              </tr>
              <tr>
                <td height="30" colspan="3"><div style="text-indent:2em; line-height:25px;"><%=memo %></div></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="100" colspan="2" align="center" valign="middle">&nbsp;</td>
          </tr>
        </table>
		
		
		</td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
 
  <tr>
    <td height="50" align="center" valign="top"><a href="#"></a></td>
  </tr>
  <tr>
    <td height="70" align="center" valign="top" bgcolor="#de1d60" ><table width="985" height="80" border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="182" height="62" align="left"><a href="http://www.yqcn.com/" target="_blank"><img src="http://zt1.yqcn.com/logo/Logo_zgyqw_white.png" width="177" height="54" border="0" /></a></td>
        <td width="10">&nbsp;</td>
        <td width="788" align="left"><d>Copyright &copy; www.yqcn.com　All Rights Reserved. 版权所有 中国乐清网 
          专题制作：中国乐清网2015年05月</d></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
