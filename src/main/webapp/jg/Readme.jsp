<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String urlname ="jg/Readme.jsp";
String openid=request.getParameter("openid");
int lb=new Integer(request.getParameter("lb"));
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
.style3 {font-size: 36px; font-weight: bold; color: #D73615; }
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
        <td align="center">
 <%if(lb==0){ %>
<table width="85%" cellspacing="10" cellpadding="0"  style="border:5px dashed #fff; ">
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
              <tr>
                <td>
				  <div style="text-indent:2em; margin-bottom:20px; line-height:45px;">70年砥砺奋进，70年春华秋实，70年风雨历程……乐清儿女在时代巨变中，不懈奋斗、与时俱进，用勤劳、勇敢、智慧书写着乐清特色的故事。</div>
                   <div style="text-indent:2em;margin-bottom:20px; line-height:45px;">即时起至9月30日24:00，由中共乐清市委宣传部（市网信办）、乐清日报社联合主办的“喜迎新中国成立70周年 我为祖国庆生”大型网络征集活动正式与大家见面啦！该活动是乐清市2019年网络文化节重要子活动。</div>
                
                     <div style="text-indent:2em;margin-bottom:20px; line-height:45px;">历届网络文化节影响人数之多,覆盖范围之广,已成为深受乐清市民欢迎的网络文化盛宴。本次启动的大型网络征集活动希望能凝聚广大网友的力量，征集到各种形式的好图、好歌、好视频，讲好乐清70年的好故事。</div>
               
                     <div style="text-indent:2em;margin-bottom:20px; line-height:45px;">据主办方介绍，这个征集活动共设有“为祖国唱一首歌”“为祖国拍一张照”“为祖国绘一幅画”“为家乡打一处卡”等四大专题，大家可根据自己所长所有，分类进行投稿。</div>
                   
                     <div style="text-indent:2em;margin-bottom:20px; line-height:45px;">此次征集活动的投稿作品包括视频、音频、照片、绘画等类型，四大专题设置了不同的投稿规则、奖品，奖品总价值达6万余元。大家看清规则后，更容易拿奖哦！</div>
                    </td>
              </tr>
            </table>
               </td>
          </tr>
          
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
              <tr>
                <td><div  style="text-align:center"><span class="style3">1.为祖国唱一首歌(念诗)</span></div>
                  <p><br />
                    （1）投稿方式：<strong>即时起至9月30日</strong>，网友可以将音频或短视频，填上姓名、联系方式、作品名称，通过邮箱<strong>562419010@qq.com</strong>或扫码进入征集平台直接投稿，经审核微调后展示，并同步在乐清日报官方抖音号播放。</p>
                  <p><br />
                    （2）作品范围：要求投稿作品原创且紧扣主题，歌单以主办方提供的100首红歌为准，扫二维码查看歌单，诗歌作品可原创也可朗诵名家作品。</p>
                  <p><br />
                    （3）要求投稿作品原创且紧扣主题，歌单以主办方提供的100首红歌为准，诗歌作品可原创也可朗诵名家作品。&gt;&gt;&gt;<strong><a href="https://mp.weixin.qq.com/s/viTOzdc1LSC4E3A6iPbwVg">点击查看歌单</a></strong>&lt;&lt;&lt;</p>
                  <p><br />
                    （4）奖励方式：网友每天只能对一件作品点赞一次，可对多作品点赞。点赞数超过8个的前50名投稿人可获得价值100元的奖品。</p>
                  <p><br />
                    （5）十佳评选：10月1日至10月30日，主办方将根据作品爱心数和质量，评选出十佳作品，各给予价值800元奖品。</p>
                  <p><br />
                    （6）奖品将在11月底前发放完毕。</p>
                  </p></td>
              </tr>
            </table>
               </td>
          </tr>
          
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
                <tr>
                  <td><div style="text-align:center"><span class="style3">2.为祖国绘一幅画</span></div>
                    <p><br />
                      （1）投稿方式：即时起至9月30日，网友可以将绘画作品以照片形式通过扫码进入征集平台直接投稿，经审核后展示。要求投稿作品原创且紧扣主题。</p>
                    <p><br />
                      （2）奖品方式：网友每天只能对一件作品点赞一次，可对多作品点赞。点赞数超过8个的前50名投稿人可获得价值100元的奖品。</p>
                    <p><br />
                      （3）十佳评选：10月1日至10月30日，主办方将根据作品爱心数和质量，评选出十佳作品，并各给予价值800元奖品。</p>
                    <p><br />
                      （4）奖品将在11月底前发放完毕。</p></td>
                </tr>
            </table></td>
          </tr>
          
           <tr>
              <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
                  <tr>
                    <td><div style="text-align:center"><span class="style3">3.为祖国拍一张照</span></div>
                     
                        （1）投稿方式：即日至9月30日期间，扫码进入征集平台投稿，经审核后展示。
                        </p>
                      <p><br />
                        （2）征集范围：征集范围广泛，可以是有关红色文化与爱国主义教育主题的图片；也可以是反映跨越70年时代巨变、社会发展历程、百姓生活变迁、人事风云激荡、城乡风貌提升等方面的图片。图片必须原创，且切合主题。</p>
                      <p><br />
                        （3）奖励方式：点赞数超过8个的前200名投稿人可获得两张电影票，发完为止。网友每天只能对一件作品点赞一次，可对多作品点赞。</p>
                      <p><br />
                        （4）十佳评选：10月1日至10月30日，主办方将根据作品爱心数和质量，评选出十佳作品，并各给予价值500元奖品。</p>
                      <p><br />（5）奖品将在11月底前发放完毕。</p></td>
                  </tr>
              </table></td>
            </tr>
            
            <tr>
              <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
                  <tr>
                    <td><div style="text-align:center"><span class="style3">4.为家乡打一处卡</span></div>
                      <p><br />
                        （1）投稿方式：即日至9月30日期间，扫码进入征集平台投稿，经审核后展示。</p>
                    
                      <p><br />
                        （2）征集范围：选择你认为最能代表乐清或者乡镇（街）、村居的人文或自然建筑，并讲述你的理由（例：金溪照片，金溪是乐成的母亲河，故代表乐清；白象塔，白象塔是白象镇名的来源，故代表白象；南怀瑾故居，南怀瑾是翁垟人，故代表翁垟；中心公园，中心公园高大上，风景优美，故代表中心区等等），网友可以照片以照片形式通过本平台直接投稿，经审核后展示。图片必须原创，且切合主题。</p>
                      <p><br />
                        （3）投稿时，须写清楚打卡点：XXX（地点），以及推荐理由（不少于20个字）。</p>
                      <p><br />
                        （4）奖励方式：点赞数超过8个的前70名投稿人可获得奖品，前10名作品各给予价值500元奖品、第11名至70名各给予价值50元的奖品。网友每天只能对一件作品点赞一次，可对多作品点赞。</p>
                      <p><br />
                        （5）评选：10月1日至10月30日，主办方将根据作品爱心数及专家评审团评选，选取最能代表乐清或者乡镇（街）、村居的前70幅作品，绘制一张特殊的地图</p>
                      <p><br />
                        （6）奖品将在11月底前发放完毕。</p>
                      <p><br />
                      </p></td>
                  </tr>
              </table></td>
            </tr>
          
        </table>       
        
        
<%}else if(lb==1){ %>
<table width="85%" cellspacing="10" cellpadding="0"  style="border:5px dashed #fff; ">
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
              <tr>
                <td><div  style="text-align:center"><span class="style3">1.为祖国唱一首歌(念诗)</span></div>
                  <p><br />
                    （1）投稿方式：<strong>即时起至9月30日</strong>，网友可以将音频或短视频，填上姓名、联系方式、作品名称，通过邮箱<strong>562419010@qq.com</strong>或扫码进入征集平台直接投稿，经审核微调后展示，并同步在乐清日报官方抖音号播放。</p>
                  <p><br />
                    （2）作品范围：要求投稿作品原创且紧扣主题，歌单以主办方提供的100首红歌为准，扫二维码查看歌单，诗歌作品可原创也可朗诵名家作品。</p>
                  <p><br />
                    （3）要求投稿作品原创且紧扣主题，歌单以主办方提供的100首红歌为准，诗歌作品可原创也可朗诵名家作品。&gt;&gt;&gt;<strong><a href="https://mp.weixin.qq.com/s/viTOzdc1LSC4E3A6iPbwVg">点击查看歌单</a></strong>&lt;&lt;&lt;</p>
                  <p><br />
                    （4）奖励方式：网友每天只能对一件作品点赞一次，可对多作品点赞。点赞数超过8个的前50名投稿人可获得价值100元的奖品。</p>
                  <p><br />
                    （5）十佳评选：10月1日至10月30日，主办方将根据作品爱心数和质量，评选出十佳作品，各给予价值800元奖品。</p>
                 
                  <p><br />（6）奖品将在11月底前发放完毕。<br />
                  </p></td>
              </tr>
            </table>
               </td>
          </tr>
        </table>
        
<%}else if(lb==2){ %>       
         <table width="85%" cellspacing="10" cellpadding="0"  style="border:5px dashed #fff; ">
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
                <tr>
                  <td><div style="text-align:center"><span class="style3">2.为祖国绘一幅画</span></div>
                    <p><br />
                      （1）投稿方式：即时起至9月30日，网友可以将绘画作品以照片形式通过扫码进入征集平台直接投稿，经审核后展示。要求投稿作品原创且紧扣主题。</p>
                    <p><br />
                      （2）奖品方式：网友每天只能对一件作品点赞一次，可对多作品点赞。点赞数超过8个的前50名投稿人可获得价值100元的奖品。</p>
                    <p><br />
                      （3）十佳评选：10月1日至10月30日，主办方将根据作品爱心数和质量，评选出十佳作品，并各给予价值800元奖品。</p>
                    <p><br />
                      （4）奖品将在11月底前发放完毕。</p></td>
                </tr>
            </table></td>
          </tr>
        </table>
<%}else if(lb==3){ %>  
		<table width="85%" cellspacing="10" cellpadding="0"  style="border:5px dashed #fff; ">
            <tr>
              <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
                  <tr>
                    <td><div style="text-align:center"><span class="style3">3.为祖国拍一张照</span></div>
                     
                        （1）投稿方式：即日至9月30日期间，扫码进入征集平台投稿，经审核后展示。
                        </p>
                        <p><br />
                          （2）征集范围：征集范围广泛，可以是有关红色文化与爱国主义教育主题的图片；也可以是反映跨越70年时代巨变、社会发展历程、百姓生活变迁、人事风云激荡、城乡风貌提升等方面的图片。图片必须原创，且切合主题。</p>
                        <p><br />
                          （3）奖励方式：点赞数超过8个的前200名投稿人可获得两张电影票，发完为止。网友每天只能对一件作品点赞一次，可对多作品点赞。</p>
                        <p><br />
                          （4）十佳评选：10月1日至10月30日，主办方将根据作品爱心数和质量，评选出十佳作品，并各给予价值500元奖品。</p>
                        <p><br />
                          （5）奖品将在11月底前发放完毕。</p>
                        <p>&nbsp;</p></td>
                  </tr>
              </table></td>
            </tr>
          </table>
          
  <%}else{ %>          
          <table width="85%" cellspacing="10" cellpadding="0"  style="border:5px dashed #fff; ">
            <tr>
              <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="100%" cellspacing="30" cellpadding="0">
                  <tr>
                    <td><div style="text-align:center"><span class="style3">4.为家乡打一处卡</span></div>
                      <p><br />
                        （1）投稿方式：即日至9月30日期间，扫码进入征集平台投稿，经审核后展示。</p>
                    
                      <p><br />
                        （2）征集范围：选择你认为最能代表乐清或者乡镇（街）、村居的人文或自然建筑，并讲述你的理由（例：金溪照片，金溪是乐成的母亲河，故代表乐清；白象塔，白象塔是白象镇名的来源，故代表白象；南怀瑾故居，南怀瑾是翁垟人，故代表翁垟；中心公园，中心公园高大上，风景优美，故代表中心区等等），网友可以照片以照片形式通过本平台直接投稿，经审核后展示。图片必须原创，且切合主题。</p>
                      <p><br />
                        （3）投稿时，须写清楚打卡点：XXX（地点），以及推荐理由（不少于20个字）。</p>
                      <p><br />
                        （4）奖励方式：点赞数超过8个的前70名投稿人可获得奖品，前10名作品各给予价值500元奖品、第11名至70名各给予价值50元的奖品。网友每天只能对一件作品点赞一次，可对多作品点赞。</p>
                      <p><br />
                        （5）评选：10月1日至10月30日，主办方将根据作品爱心数及专家评审团评选，选取最能代表乐清或者乡镇（街）、村居的前70幅作品，绘制一张特殊的地图</p>
                      <p><br />
                        （6）奖品将在11月底前发放完毕。</p>
                      <p><br />
                      </p></td>
                  </tr>
              </table></td>
            </tr>
          </table>
<%} %>
</td>
      </tr>
      <tr>
        <td height="100" align="center">
        
       
        
          
          
          
          
          </td>
      </tr>
    </table></td>
  </tr>

</table>
<jsp:include page="bot.jsp">
<jsp:param value="<%=openid %>" name="openid"/>
</jsp:include>
</body>
</html>
