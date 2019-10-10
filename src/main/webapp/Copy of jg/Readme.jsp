<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String urlname ="jg/Readme.jsp";
String openid=request.getParameter("openid");
String from=request.getParameter("from");
String check="";
if(from!=null){
 check=Topay.WxJsApiCheck47(urlname,openid,from);
}else{
 check=Topay.WxJsApiCheck4(urlname,openid);
}
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
  wx_share_title="<%=AllValus.title1 %>";
  wx_share_desc="<%=AllValus.desc %>";
  wx_share_link="<%=AllValus.thelink %>";
  wx_share_imgUrl="<%=AllValus.nopicpath %>";
        
  wx.config({
      debug:false,
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=0.3, maximum-scale=0.3"/>
<title><%=AllValus.title1 %></title>
<style>
body{font-size:30px;font-family:微软雅黑;background:url(IMG/top.png) repeat-y;background-size:100%;}
a{text-decoration:none;color:#000000;}
a:hover{ color:#d73615;text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px;color:#ffffff;}
c{font-size:35px;font-family:Arial;}
d{color:#ffffff;text-indent:2em;}
e{color:#b1b1b1;}
</style>

</head>

<body >
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr bgcolor="#d73615">
    <td align="center" valign="middle"><table width="100%" height="75" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right"><a href="index.jsp?openid=<%=openid %>"><img src="IMG/ICO_return.png" border="0" /></a></td>
        <td width="1547" align="center"><img src="IMG/PIC_theme5.png" /></td>
        <td width="50" align="center" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><table width="85%" cellspacing="10" cellpadding="0"  style="border:5px dashed #fff; ">
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
              <tr>
                <td>　　70年砥砺奋进，我们的国家发生了天翻地覆的变化，这是一部感天动地的奋斗史诗。70年风雨历程，乐清儿女遇到挑战，不懈奋斗、与时俱进，用勤劳、勇敢、智慧书写着乐清特色的时代故事。<br />
                  <br />
　　即时起，由中共乐清市委宣传部、市网信办、乐清日报社联合主办的建国70周年“四个一”大型网络征集系统——“光阴的故事”正式与大家见面啦！这个征集系统共设有“为祖国唱一首歌”“为祖国绘一幅画”“为祖国拍一张照”“为家乡打一处卡”等四个专题，大家可根据自己所长所有，分别进行投稿。<br />
<br />
　　此次征集系统的投稿作品包括视频、音频、照片等，根据不同的专题要求，设置不同的投稿规则、投稿奖品，大家看清规则后，更容易拿奖哦。<br />
                        　　</td>
              </tr>
            </table>
               </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100" align="center">&nbsp;</td>
      </tr>
    </table></td>
  </tr>

</table>
<jsp:include page="bot.jsp">
<jsp:param value="<%=openid %>" name="openid"/>
</jsp:include>
</body>
</html>
