<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.component.Topay"%>
<%@ page import="org.fjw.weixin.util.AllValus" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <%

    String urlname ="bl4/memo.jsp";
    String check=Topay.WxJsApiCheck3(urlname);

  %>
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
      wx_share_title="<%=AllValus.daf_lp_title%>";
      wx_share_desc="<%=AllValus.daf_lp_desc%>";
      wx_share_link="<%=AllValus.daf_lp_link%>";
      wx_share_imgUrl="<%=AllValus.daf_lp_img%>";

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=0.38, maximum-scale=1.0, user-scalable=no"/>
<title><%=AllValus.daf_lp_title %></title>
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
#que{
  color: #b5b5b5;
}

</style>

</head>

<body >
<table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background:url(img/IMG_TOP3.png) no-repeat top center; background-size: 100%;" >
  <tr>
    <td height="320" align="center" valign="top"><table width="100%" cellspacing="0" cellpadding="30">
      <tr>
        <td width="13%">
          <div style="margin-top: 55px;">
          <a href="javascript:history.back(-1)"><img src="img/ICO_return.png" width="200" /></a>
          </div>
        </td>
        <td width="87%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>



  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="1676" height="0" align="center" valign="top"><table width="100%" cellspacing="30" cellpadding="0">
          <tr>
            <td align="center" valign="top"><table width="100%" border="0" cellspacing="5"  style="background-color:#FFF; border:2px solid #e2e2e2;"  >

              <div style="margin-top: 230px"/>
              <tr>
                <td width="14%" height="7" align="center" valign="middle" >【知识点】</td>
                </tr>
              <tr>
                <td height="1" align="left" valign="top" >
                  <div id="que"><p>Q  您知道温州正在创建国家公共文化服务体系示范区吗？</p></div>
                  <p>我知道，正在创建第四批国家公共文化体系示范区，创建时间是 2018 年到 2020 年。</p>
                  <div id="que"><p>Q 您支持乐清创建国家公共文化服务体系示范区吗？ </p></div>
                  <p>非常支持！共建文化乐清，同享美好生活！ </p>
                  <div id="que"><p>Q 您对乐清文化活动开展满意吗？  </p></div>
                  <p>非常满意！乐清经常开展文艺演出、公益培训、展览讲座等文化活动，图书馆、文化馆、综合文化站、 农村文化礼堂等文体活动丰富多彩，我也经常参加。</p>
                  <div id="que"><p>Q 您知道乐清市有哪些公共文化设施吗？ </p></div>
                  <p>我知道，市一级有图书馆、文化馆、博物馆、非遗馆、大剧院、影城，还有市民活动中心 （市职工活动中心、市老年大学、市妇女儿童活动中心、市青少年活动中心）、体育中心；乡镇（街道） 一级有综合文化站；村（社区）一级有文化礼堂、文化家园。 </p>
                  <div id="que"><p>Q 您了解乐清市公共文化设施的服务信息吗？ </p></div>
                  <p>我了解，每个公共文化设施门口都有服务信息公示，有免费开放时间、服务项目和活动内容等；网站、 微信公众号上也有服务信息。</p>
                  <div id="que"><p>Q 您知道温州·乐清公共文化服务领域有哪些“金名片”？ </p></div>
                  <p>我知道，城市书房、百姓书屋、文化驿站、乡村艺术团、市民文化节等；乐清还有“百姓舞台”“公益课堂”“梅溪讲堂”等。  </p>
                  <div id="que"><p>Q 创建国家公共文化服务体系示范区“两法”宣传，是指哪两个法律，您知道吗？ </p></div>
                  <p>我知道，《公共文化服务保障法》和《公共图书馆法》。</p>
                  <div id="que"><p>Q 您知道哪些做法是参与公共文化服务工作吗？ </p></div>
                  <p>我知道，《公共文化服务保障法》和《公共图书馆法》。</p>
                  <p>《公共文化服务保障法》自2017年3月1日起施行。</p>
                  <p>《公共图书馆法》自2018年1月1日起开始实施。</p>
                  <p>《公共文化服务保障法》所称公共文化服务，是指由政府主导、社会力量参与，以满足公民基本文化需求为主要目的而提供的公共文化设施、文化产品、文化活动以及其他相关服务。</p>
                  <p>《公共图书馆法》所称公共图书馆，是指向社会公众免费开放，收集、整理、保存文献信息并提供查询、借阅及相关服务，开展社会教育的公共文化设施。</p>
                  <div id="que"><p>Q 您知道哪些做法是参与公共文化服务工作吗？ </p></div>
                  <p>我知道 , 读书看报、观看演出、看电视看电影、参加各种文化活动等等，在手机上看文章看视频也是。</p>
                  </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table> 
</body>
</html>
<script type="text/javascript">
    window.onload = function(){
        if(isWeiXin()){
            //是微信浏览器不做操作
        }else{
            // alert('not');
            //非微信浏览器就因此显示列表等
            var target=document.getElementById("contentid");
            target.style.display="none";
            alert('非微信中打开');
        }
    }
    function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    }
</script>