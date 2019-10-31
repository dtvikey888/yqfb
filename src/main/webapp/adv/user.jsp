<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String urlname ="adv/user.jsp";
String openid =request.getParameter("openid");
//out.println("openid="+openid);

String twbsession2 = (String)session.getAttribute("twbsession2");

if(openid==null||openid==""||twbsession2==null){

 	out.println("<script>window.location.href='up.jsp?openid="+openid+"'</script>");

}else{

    ZghTools.ClearNull3();
}

 String check=Topay.WxJsApiCheck4(urlname,openid);
  //out.println(check);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>

<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script>
  /*
   * 注意：
   * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
   * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
   * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
   *
   * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
   * 邮箱地址：weixin-open@qq.com
   * 邮件主题：【微信JS-SDK反馈】具体问题
   * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
   */
   wx_share_title="<%=AllValus.adv_title1 %>";
   wx_share_desc="<%=AllValus.adv_desc %>";
   wx_share_link="<%=AllValus.adv_link %>";
   wx_share_imgUrl="<%=AllValus.adv_nopicpath %>";
   
  wx.config({
      debug: false,
      <%=check%>,// 必填，签名，见附录1
      jsApiList: [
        'updateTimelineShareData',
        'updateAppMessageShareData'
      ]
  });
  
  wx.ready(function () {   //需在用户可能点击分享按钮前就先调用
    wx.updateTimelineShareData({
      title: wx_share_title,
      link: wx_share_link,
      imgUrl: wx_share_imgUrl,
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
        //alert('用户点击分享到朋友圈');
      },
      success: function (res) {
      //  alert('已分享');
      },
      cancel: function (res) {
       // alert('已取消');
      },
      fail: function (res) {
        //alert(JSON.stringify(res));
      }
    });
    
	wx.updateAppMessageShareData({
      title: wx_share_title,
      desc: wx_share_desc,
      link: wx_share_link,
      imgUrl: wx_share_imgUrl,
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给朋友');
      },
      success: function (res) {
       // alert('已分享');
      },
      cancel: function (res) {
        //alert('已取消');
      },
      fail: function (res) {
        //alert(JSON.stringify(res));
      }
    });
});

</script>
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
        <td width="76" align="right"><a href="up.jsp"><img src="IMG/ICO_return.png" width="57" height="29" border="0" /></a></td>
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
		
	<form name="form1" action="user_chk.jsp?openid=<%=openid%>" method="post">
	
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
            
            <input type="text" name="xm"  placeholder=" 姓名"  style="width:100%;height:50px;border:1px solid #dddddd;font-size:18px;"></td>
            </tr>
            
            <tr>
            <td height="60" align="left" valign="top">
            
            <input type="text" name="tel"  placeholder=" 手机号码"  style="width:100%;height:50px;border:1px solid #dddddd;font-size:18px;"></td>
            </tr>
         
        </table></td>
      </tr>
      <tr>
        <td height="50" align="center"><br />
          <input type=image src="IMG/Button_tj.png" width=60%  onClick="document.form1.action='user_chk.jsp?openid=<%=openid%>';if(DataLength(form1.xm.value)<2){alert('请填写姓名');form1.xm.focus();return false};if(DataLength(form1.tel.value)<11){alert('请填写正确的手机号码');form1.tel.focus();return false};document.form1.submit();"/></td>
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
