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
   * ע�⣺
   * 1. ���е�JS�ӿ�ֻ���ڹ��ںŰ󶨵������µ��ã����ںſ�������Ҫ�ȵ�¼΢�Ź���ƽ̨���롰���ں����á��ġ��������á�����д��JS�ӿڰ�ȫ��������
   * 2. ��������� Android ���ܷ����Զ������ݣ��뵽�����������µİ����ǰ�װ��Android �Զ������ӿ��������� 6.0.2.58 �汾�����ϡ�
   * 3. �������⼰���� JS-SDK �ĵ���ַ��http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
   *
   * ������������������ĵ�����¼5-�������󼰽���취�����������δ�ܽ����ͨ����������������
   * �����ַ��weixin-open@qq.com
   * �ʼ����⣺��΢��JS-SDK��������������
   * �ʼ�����˵�����ü��������������������ڣ��������������������ĳ������ɸ��Ͻ���ͼƬ��΢���Ŷӻᾡ�촦����ķ�����
   */
   wx_share_title="<%=AllValus.adv_title1 %>";
   wx_share_desc="<%=AllValus.adv_desc %>";
   wx_share_link="<%=AllValus.adv_link %>";
   wx_share_imgUrl="<%=AllValus.adv_nopicpath %>";
   
  wx.config({
      debug: false,
      <%=check%>,// ���ǩ��������¼1
      jsApiList: [
        'updateTimelineShareData',
        'updateAppMessageShareData'
      ]
  });
  
  wx.ready(function () {   //�����û����ܵ������ťǰ���ȵ���
    wx.updateTimelineShareData({
      title: wx_share_title,
      link: wx_share_link,
      imgUrl: wx_share_imgUrl,
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
        //alert('�û������������Ȧ');
      },
      success: function (res) {
      //  alert('�ѷ���');
      },
      cancel: function (res) {
       // alert('��ȡ��');
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
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       // alert('�û�������͸�����');
      },
      success: function (res) {
       // alert('�ѷ���');
      },
      cancel: function (res) {
        //alert('��ȡ��');
      },
      fail: function (res) {
        //alert(JSON.stringify(res));
      }
    });
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width" name="viewport"/>
<title>��ף����70����ϵ�л ɹɹ��͹����Ĺ���</title>
<style>
body{font-size:14px; font-family:΢���ź�; background:url(IMG/bodybg.jpg); padding:0px;margin:0px;}
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
            <input type="text" name="xm"  placeholder=" ����"  style="width:100%;height:40px;border:1px solid #dddddd;"></td>
            </tr>
        </table></td>
      </tr>
     -->
      <tr>
        <td align="center"><table width="95%" border="0" cellspacing="10" >
        
            <tr>
            <td height="60" align="left" valign="top">
            
            <input type="text" name="xm"  placeholder=" ����"  style="width:100%;height:50px;border:1px solid #dddddd;font-size:18px;"></td>
            </tr>
            
            <tr>
            <td height="60" align="left" valign="top">
            
            <input type="text" name="tel"  placeholder=" �ֻ�����"  style="width:100%;height:50px;border:1px solid #dddddd;font-size:18px;"></td>
            </tr>
         
        </table></td>
      </tr>
      <tr>
        <td height="50" align="center"><br />
          <input type=image src="IMG/Button_tj.png" width=60%  onClick="document.form1.action='user_chk.jsp?openid=<%=openid%>';if(DataLength(form1.xm.value)<2){alert('����д����');form1.xm.focus();return false};if(DataLength(form1.tel.value)<11){alert('����д��ȷ���ֻ�����');form1.tel.focus();return false};document.form1.submit();"/></td>
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
        alert("����������11λ�ֻ��Ż�����ȷ���ֻ���ǰ��λ"); 
        document.form.tel.focus(); 
        return false; 
    } 
} 

</script>
</body>
</html>
