<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.util.TimeString"%>
<%@page import="org.liufeng.course.util.DateDistance"%>
<%@page import="org.fjw.weixin.util.PublicFun"%>

<%
//关于回调
//如有朋友圈转发点开来的还是我自己点，那就不回调
//如果不是我自己点才回调
//回调后应该是调到另外一个助力页面
//String openid =request.getParameter("openid");

String bzlopenid =request.getParameter("bzlopenid");

//out.println("openid: "+openid);
//out.println("bzlopenid: "+bzlopenid);

String zlsession = (String)session.getAttribute("zlsession");

//out.println("zlsession: "+zlsession);
  
  
   if(zlsession!=null){
   
      if(zlsession.equals(bzlopenid)){
      
   	      //out.println("你是自己点的，不回调");
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
          //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx03c461977443af41&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqzgh%2foauthServlet&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
          
      }
   
   }else{
   
  		//还没点要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet11&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
               
   
   }
   
   
  
 %>


<%




String fbsj = ZghTools.GetFbsjRd(bzlopenid);

String str1=fbsj+" 00:00:00";
String str2=TimeString.nowTime();

String rd[] = PublicFun.split(fbsj,"-");


System.out.println("str1"+str1);
System.out.println("str1"+str2);

String dd=DateDistance.getDistanceTime3(str1,str2);
String dd2[] = PublicFun.split(dd,",");




//out.println(y1);
//out.println(m1);
//out.println(d1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)file:///C:/Users/zpuser/Desktop/%E7%BD%91%E9%A1%B5/CYL.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>不忘初心——入党那一天 <%=ZghTools.GetNick(request.getParameter("openid")) %>已经入党<%=dd2[0]%>年<%=dd2[1]%>月<%=dd2[2]%>日<%=dd2[3]%>时<%=dd2[4]%>分<%=dd2[5]%>秒</title>
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:微软雅黑}
.style6 {color: #FFFFFF}
</style>
</head>
<body>
<table width="100%"  border="0">
  <tr>
    <td><img src="img/01.png" width="100%"  /></td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td align="center" bgcolor="#9C2926"><p><span class="style6"><%=ZghTools.GetNick(request.getParameter("bzlopenid")) %>的入党时间为 <strong><%=rd[0] %>年<%=rd[1] %>月<%=rd[2] %>日 </strong></span><strong></strong></p></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#F2F1E5"><p>截至此时，<%=ZghTools.GetNick(request.getParameter("bzlopenid")) %>已经入党 <strong><span id="year"><%=dd2[0]%></span>年<span id="month"><%=dd2[1]%></span>月<span id="day"><%=dd2[2]%></span>日<span id="hour"><%=dd2[3]%></span>时<span id="mini"><%=dd2[4]%></span>分<span id="sec"><%=dd2[5]%></span>秒 </strong><strong></strong></p>
    

    
    </td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="90%" height="43"  border="0" align="center">
  <tr>
    <td align="center"><table width="80%"  border="0">
      <tr>
        <td><img src="img/04.png" width="100%" /></td>
      </tr>
    </table></td>
    <td align="center"><table width="80%"  border="0">
      <tr>
        <td><img src="img/05.png" width="100%" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td align="center"><table width="46%"  border="0" cellspacing="15">
      <tr>
        <td><img src="img/LOGO.png" width="100%"  /></td>
      </tr>
    </table>    </td>
  </tr>
</table>
</body>
</html>