<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.component.Topay"%>
<%@ page import="org.fjw.weixin.util.AllValus" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <%

    String urlname ="bl6/memo.jsp";
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
      wx_share_title="<%=AllValus.daf_title%>";
      wx_share_desc="<%=AllValus.daf_desc%>";
      wx_share_link="<%=AllValus.daf_link%>";
      wx_share_imgUrl="<%=AllValus.daf_img%>";

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
<title><%=AllValus.daf_title %></title>
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
<table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background-color:#ececee">
    <tr>
        <td height="600" align="center" valign="top" bgcolor="#FFFFFF" style="background:url(img/IMG_TOP3.png) no-repeat top center;background-size: 100% 100%;"><table width="95%" cellspacing="2" cellpadding="0">
            <tr>
                <td height="10" colspan="2" align="right">

                    <div style="margin-top: 0px;">
                        <a href="javascript:history.back(-1)"><img src="img/ICO_return.png" width="200" /></a>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right"><div onClick="button2();"></div></td>
            </tr>

        </table></td>
    </tr>
    <tr>
        <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="30">
            <tr>
                <td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;">4月26日是世界知识产权日，今年的活动主题是“强化版权治理，优化版权生态”，为了树立尊重知识、崇尚科学和保护知识产权的意识，营造鼓励知识创新的法律环境，中共乐清市委宣传部（市新闻出版局）举办版权知识网络有奖问答活动。</div></strong></P></td>
            </tr>
            <tr>
                <td height="50" colspan="2">
                    <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#073A21; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动奖励</button>
                    <div align="center" style="margin-top:50px;margin-bottom:25px;line-height:1.8">一等奖10份:  50元移动话费</div>
                    <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">二等奖30份:  30元移动话费</div>
                    <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">三等奖50份:  20元移动话费</div>
                    <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">参与奖260份: 10元移动话费</div>
                    <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#073A21; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动规则</button>
                    <div style="margin-top:50px;padding-left:12px;line-height:1.8">1、  共有20道选择题，答对其中15道题，即可参与刮刮卡抽奖活动。每个手机号仅限参与一次，请实名参与。</div>
                    <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;line-height:1.8">2、  350份话费奖励完成或超出活动时间参与答题均无效。</div>
                    <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">3、	活动对象：浙江移动用户</div>
                    <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">4、	话费将在活动结束后5个工作日内赠送。</div>
                    <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#073A21; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">选择题</button>
                </td>
            </tr>

            <tr>
                <td>

                    <table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
                        <tbody id="tbName" >
                        <tr>
                            <td height="20"><p></p><div style="line-height:1.8"><strong>1、世界读书日是几月几日（   ）</strong></div>
                                <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
                                    A. 3月23日</p>
                                <p>
                                    <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
                                    B. 3月26日</p>
                                <p style="line-height:1.8">
                                    <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
                                    C. 4月23日</p>
                                <p style="line-height:1.8">
                                    <input type="radio" name="c1" value="4" style="width:55px; height:55px;"/>
                                    D. 4月26日</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、世界知识产权日是几月几日（  ）</strong></div>
                                <p><input type="radio" name="c2" value="1" style="width:55px; height:55px;"/>
                                    A. 3月23日 </p>
                                <p>
                                    <input type="radio" name="c2" value="2" style="width:55px; height:55px;"/>
                                    B. 3月26日</p>
                                <p>
                                    <input type="radio" name="c2" value="3" style="width:55px; height:55px;"/>
                                    C. 4月23日</p>
                                <p>
                                    <input type="radio" name="c2" value="4" style="width:55px; height:55px;"/>
                                    D. 4月26日</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、从事出版活动应当将（ ）放在首位。</strong></div>
                                <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
                                    A. 经济效益</p>
                                <p>
                                    <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
                                    B. 社会效益</p>
                                <p>
                                    <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
                                    C. 个人效益</p>
                                <p>
                                    <input type="radio" name="c3" value="4" style="width:55px; height:55px;"/>
                                    D. 企业效益</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、按《印刷业管理条例》的规定，以下不属于“出版物”的是（ ）。</strong></div>
                                <p> <input type="radio" name="c4" value="1" style="width:55px; height:55px;"/>
                                    A. 期刊</p>
                                <p>
                                    <input type="radio" name="c4" value="2" style="width:55px; height:55px;"/>
                                    B. 地图</p>
                                <p>
                                    <input type="radio" name="c4" value="3" style="width:55px; height:55px;"/>
                                    C. 挂历</p>
                                <p>
                                    <input type="radio" name="c4" value="4" style="width:55px; height:55px;"/>
                                    D. 广告宣传品</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、以未成年人为对象的出版物（   ）含有诱发未成年人模仿违反社会公德的行为和违法犯罪的行为的内容，（    ）含有恐怖、残酷等妨害未成年人身心健康的内容。</strong></div>
                                <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
                                    A. 不得      不得</p>
                                <p>
                                    <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
                                    B. 可以      可以</p>
                                <p>
                                    <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
                                    C. 不得      可以</p>
                                <p>
                                    <input type="radio" name="c5" value="4" style="width:55px; height:55px;"/>
                                    D. 可以      不得</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、《出版管理条例》规定，单位违反本条例被处以吊销许可证行政处罚的，其法定代表人或者主要负责人自许可证被吊销之日起（ ）内不得担任出版、印刷或者复制、进口、发行单位的法定代表人或者主要负责人。</strong></div>
                                <p><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
                                    A. 5年</p>
                                <p>
                                    <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
                                    B. 10年</p>
                                <p>
                                    <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
                                    C. 15年</p>
                                <p>
                                    <input type="radio" name="c6" value="4" style="width:55px; height:55px;"/>
                                    D. 20年</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7、差错率不超过（ ）的图书，其编校质量属合格。?</strong></div>
                                <p><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
                                    A. 千分之一</p>
                                <p>
                                    <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
                                    B. 万分之一</p>
                                <p>
                                    <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
                                    C. 百分之一</p>
                                <p>
                                    <input type="radio" name="c7" value="4" style="width:55px; height:55px;"/>
                                    D. 十万分之一</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8、著作权法所称作品，是指文学、艺术和科学领域内具有（ ）并能以某种有形形式复制的智力成果。</strong></div>
                                <p> <input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
                                    A. 新颖性</p>
                                <p>
                                    <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
                                    B. 艺术性</p>
                                <p>
                                    <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
                                    C. 独创性</p>
                                <p>
                                    <input type="radio" name="c8" value="4" style="width:55px; height:55px;"/>
                                    D. 思想性</p>
                            </td>
                        </tr>
                        </tbody>



                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9、根据我国著作权法的规定，（ ）与著作权是同一概念。</strong></div>
                                <p> <input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
                                    A. 版权</p>
                                <p>
                                    <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
                                    B. 出版权</p>
                                <p>
                                    <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
                                    C. 复制权</p>
                                <p>
                                    <input type="radio" name="c9" value="4" style="width:55px; height:55px;"/>
                                    D. 邻接权</p>
                            </td>
                        </tr>
                        </tbody>



                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10、著作权法保护的是（ ）。</strong></div>
                                <p> <input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
                                    A. 思想观念</p>
                                <p>
                                    <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
                                    B. 数学概念</p>
                                <p>
                                    <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
                                    C. 原则和发现</p>
                                <p>
                                    <input type="radio" name="c10" value="4" style="width:55px; height:55px;"/>
                                    D. 思想观念的独创性表达</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>11、根据我国著作权法，我国公民著作权（ ）。</strong></div>
                                <p> <input type="radio" name="c11" value="1" style="width:55px; height:55px;"/>
                                    A. 随作品的发表而自动产生</p>
                                <p>
                                    <input type="radio" name="c11" value="2" style="width:55px; height:55px;"/>
                                    B. 随作品的创作完成而自动产生</p>
                                <p>
                                    <input type="radio" name="c11" value="3" style="width:55px; height:55px;"/>
                                    C. 在作品上加注版权标记后自动产生</p>
                                <p>
                                    <input type="radio" name="c11" value="4" style="width:55px; height:55px;"/>
                                    D. 作品以一定的物质形态固定后产生</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>12、( )不受著作权法保护。</strong></div>
                                <p> <input type="radio" name="c12" value="1" style="width:55px; height:55px;"/>
                                    A. 计算机软件</p>
                                <p>
                                    <input type="radio" name="c12" value="2" style="width:55px; height:55px;"/>
                                    B. 地图</p>
                                <p>
                                    <input type="radio" name="c12" value="3" style="width:55px; height:55px;"/>
                                    C. 时事新闻</p>
                                <p>
                                    <input type="radio" name="c12" value="4" style="width:55px; height:55px;"/>
                                    D. 即兴演说</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>13、图书出版者重印、再版作品的，应当（ ）。</strong></div>
                                <p> <input type="radio" name="c13" value="1" style="width:55px; height:55px;"/>
                                    A. 支付报酬但不必通知著作权人</p>
                                <p>
                                    <input type="radio" name="c13" value="2" style="width:55px; height:55px;"/>
                                    B. 通知著作权人并支付报酬</p>
                                <p>
                                    <input type="radio" name="c13" value="3" style="width:55px; height:55px;"/>
                                    C. 通知著作权人但不必支付报酬</p>
                                <p>
                                    <input type="radio" name="c13" value="4" style="width:55px; height:55px;"/>
                                    D. 与著作权人重新签订合同</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>14、作者的署名权、修改权、保护作品完整权的保护期为（ ）</strong></div>
                                <p> <input type="radio" name="c14" value="1" style="width:55px; height:55px;"/>
                                    A. 作者终生及死后五十年</p>
                                <p>
                                    <input type="radio" name="c14" value="2" style="width:55px; height:55px;"/>
                                    B. 作者终生</p>
                                <p>
                                    <input type="radio" name="c14" value="3" style="width:55px; height:55px;"/>
                                    C. 不受限制</p>
                                <p style="line-height: 1.5">
                                    <input type="radio" name="c14" value="4" style="width:55px; height:55px;line-height: 1.5"/>
                                    D. 截止于作品首次发表后第50年的12月31日</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>15、甲撰写毕业论文，大量抄袭了乙刊登在某杂志上的一篇译文，甲的行为侵犯了（ ）的著作权。</strong></div>
                                <p> <input type="radio" name="c15" value="1" style="width:55px; height:55px;"/>
                                    A. 乙</p>
                                <p>
                                    <input type="radio" name="c15" value="2" style="width:55px; height:55px;"/>
                                    B. 杂志社</p>
                                <p>
                                    <input type="radio" name="c15" value="3" style="width:55px; height:55px;"/>
                                    C. 乙和杂志社</p>
                                <p>
                                    <input type="radio" name="c15" value="4" style="width:55px; height:55px;"/>
                                    D. 乙和原作者</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>16、下列哪项不适用于我国著作权法保护？（ ）</strong></div>
                                <p> <input type="radio" name="c16" value="1" style="width:55px; height:55px;"/>
                                    A. 书法</p>
                                <p>
                                    <input type="radio" name="c16" value="2" style="width:55px; height:55px;"/>
                                    B. 地图</p>
                                <p>
                                    <input type="radio" name="c16" value="3" style="width:55px; height:55px;"/>
                                    C. 化学元素周期表</p>
                                <p>
                                    <input type="radio" name="c16" value="4" style="width:55px; height:55px;"/>
                                    D. 地方志</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>17、因侵犯著作权行为提起的民事诉讼，由著作权法所规定侵权行为的（ ）人民法院管辖。</strong></div>
                                <p> <input type="radio" name="c17" value="1" style="width:55px; height:55px;"/>
                                    A. 实施地</p>
                                <p>
                                    <input type="radio" name="c17" value="2" style="width:55px; height:55px;"/>
                                    B. 侵权复制品储藏地</p>
                                <p>
                                    <input type="radio" name="c17" value="3" style="width:55px; height:55px;"/>
                                    C. 被告住所地</p>
                                <p style="line-height: 1.5">
                                    <input type="radio" name="c17" value="4" style="width:55px; height:55px;"/>
                                    D. 实施地、侵权复制品储藏地或查封扣押地、被告住所地</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>18、下列哪个是著作权中的人身权（ ）。</strong></div>
                                <p> <input type="radio" name="c18" value="1" style="width:55px; height:55px;"/>
                                    A. 发行权</p>
                                <p>
                                    <input type="radio" name="c18" value="2" style="width:55px; height:55px;"/>
                                    B. 署名权</p>
                                <p>
                                    <input type="radio" name="c18" value="3" style="width:55px; height:55px;"/>
                                    C. 表演权</p>
                                <p>
                                    <input type="radio" name="c18" value="4" style="width:55px; height:55px;"/>
                                    D. 复制权</p>
                            </td>
                        </tr>
                        </tbody>


                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>19、中国历史上第一部著作权法是（ ）。</strong></div>
                                <p> <input type="radio" name="c19" value="1" style="width:55px; height:55px;"/>
                                    A. 中华人民共和国著作权法</p>
                                <p>
                                    <input type="radio" name="c19" value="2" style="width:55px; height:55px;"/>
                                    B. 中华民国著作权法</p>
                                <p>
                                    <input type="radio" name="c19" value="3" style="width:55px; height:55px;"/>
                                    C. 北洋政府著作权法</p>
                                <p>
                                    <input type="radio" name="c19" value="4" style="width:55px; height:55px;"/>
                                    D. 大清著作权律</p>
                            </td>
                        </tr>
                        </tbody>

                        <tbody id="tbName">
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>20、商标注册和版权登记有哪些区别（多选）</strong></div>
                                <p><input type="checkbox" name="c20" value="1" style="width:55px; height:55px;"/>
                                    A. 申请机构不同</p>
                                <p>
                                    <input type="checkbox" name="c20" value="2" style="width:55px; height:55px;"/>
                                    B. 保护对象不同</p>
                                <p>
                                    <input type="checkbox" name="c20" value="3" style="width:55px; height:55px;"/>
                                    C. 保护期限不同</p>
                                <p>
                                    <input type="checkbox" name="c20" value="4" style="width:55px; height:55px;"/>
                                    D. 保护的目的不同</p>
                                <div style="float:right" onClick="window.location.href='memo.jsp'"><img src="img/xxzl2.png" border="0"></div>
                            </td>
                        </tr>
                        </tbody>





                    </table>
                </td>
            </tr><tr>

        </tr>



        </table></td>
    </tr>



    <tr>
        <td height="115" align="center" valign="middle"><table width="95%" height="75" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <%if(!MyUtils22.iscj_pd(openid)){%>
                    <!--
                    <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
                    -->
                    <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#073A21; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;</button>
                    <p></p>
                    <%}else{ %>
                    <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">您已经参与过,<%="您是第"+MyUtils22.GetWs(openid)+"位参与者,"+MyUtils22.zsm(openid) %></button>
                    <%} %>
                    <p></p>
                    <input name="openid" type="hidden" id="openid" value="<%=openid%>"/>	<div></div></td>
            </tr>
        </table></td>
    </tr>
</table>




<table width="100%" height="600" border="0" cellpadding="0" cellspacing="0" style="background:url(img/IMG_TOP3.png) no-repeat top center;background-size: 100%;" >
  <tr>
    <td height="600" align="center" valign="top"><table width="100%" cellspacing="0" cellpadding="30">
      <tr>
        <td width="13%">
          <div style="margin-top: 0px;">
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
                  <div id="que"><p>1.世界读书日是几月几日（  C  ）</p></div>
                     <p>A、3月23日</p>
                     <p>B、3月26日</p>
                     <p>C、4月23日</p>
                     <p>D、4月26日</p>
                  <div id="que"><p>2.世界知识产权日是几月几日（ D ） </p></div>
                    <p>A、3月23日</p>
                    <p>B、3月26日</p>
                    <p>C、4月23日</p>
                    <p>D、4月26日</p>
                  <div id="que"><p>3.从事出版活动应当将（ B ）放在首位。    </p></div>
                  <p>A、经济效益</p>
                  <p>B、社会效益</p>
                  <p>C、个人效益</p>
                  <p>D、企业效益</p>
                  <div id="que"><p>4.按《印刷业管理条例》的规定,以下不属于"出版物"的是(D)。  </p></div>
                  <p>A、期刊</p>
                  <p>B、地图</p>
                  <p>C、挂历</p>
                  <p>D、广告宣传品</p>
                  <div id="que"><p>5.以未成年人为对象的出版物（  A  ）含有诱发未成年人模仿违反社会公德的行为和违法犯罪的行为的内容，（    ）含有恐怖、残酷等妨害未成年人身心健康的内容。 </p></div>
                    <p>A、不得      不得</p>
                    <p>B、可以      可以</p>
                    <p>C、不得      可以</p>
                    <p>D、可以      不得</p>
                  <div id="que"><p>6.《出版管理条例》规定，单位违反本条例被处以吊销许可证行政处罚的，其法定代表人或者主要负责人自许可证被吊销之日起（ B ）内不得担任出版、印刷或者复制、进口、发行单位的法定代表人或者主要负责人。 </p></div>
                  <p>A、5年</p>
                  <p>B、10年</p>
                  <p>C、15年</p>
                  <p>D、20年</p>
                  <div id="que"><p>7.差错率不超过（ B ）的图书，其编校质量属合格。 </p></div>
                  <p>A、千分之一</p>
                  <p>B、万分之一</p>
                  <p>C、百分之一</p>
                  <p>D、十万分之一</p>
                  <div id="que"><p>8.著作权法所称作品，是指文学、艺术和科学领域内具有（ C ）并能以某种有形形式复制的智力成果。    </p></div>
                  <p>A、新颖性</p>
                  <p>B、艺术性</p>
                  <p>C、独创性</p>
                  <p>D、思想性</p>
                  <div id="que"><p>9.根据我国著作权法的规定，（ A ）与著作权是同一概念。 </p></div>
                  <p>A、版权</p>
                  <p>B、出版权</p>
                  <p>C、复制权</p>
                  <p>D、邻接权</p>
                  <div id="que"><p>10.著作权法保护的是（ A ）。 </p></div>
                  <p>A、思想观念</p>
                  <p>B、数学概念</p>
                  <p>C、原则和发现</p>
                  <p>D、思想观念的独创性表达</p>
                  <div id="que"><p>11.根据我国著作权法，我国公民著作权（ B ）。 </p></div>
                    <p>A、随作品的发表而自动产生</p>
                    <p>B、随作品的创作完成而自动产生</p>
                    <p>C、在作品上加注版权标记后自动产生</p>
                    <p>D、作品以一定的物质形态固定后产生</p>
                  <div id="que"><p>12.( C )不受著作权法保护。  </p></div>
                    <p>A、计算机软件</p>
					<p>B、地图</p>
                    <p>C、时事新闻</p>
                    <p>D、即兴演说</p>
                  <div id="que"><p>13.图书出版者重印、再版作品的，应当（ B ）。 </p></div>
                    <p>A、支付报酬但不必通知著作权人</p>
                    <p>B、通知著作权人并支付报酬</p>
                    <p>C、通知著作权人但不必支付报酬</p>
                    <p>D、与著作权人重新签订合同</p>
                  <div id="que"><p>14.作者的署名权、修改权、保护作品完整权的保护期为（ C ）  </p></div>
                    <p>A、作者终生及死后五十年</p>
                    <p>B、作者终生</p>
                    <p>C、不受限制</p>
                    <p>D、截止于作品首次发表后第50年的12月31日   </p>
                  <div id="que"><p>15.甲撰写毕业论文，大量抄袭了乙刊登在某杂志上的一篇译文，甲的行为侵犯了（ D ）的著作权。 </p></div>
                    <p>A、乙</p>
                    <p>B、杂志社</p>
                    <p>C、乙和杂志社</p>
                    <p>D、乙和原作者</p>
                  <div id="que"><p>16.下列哪项不适用于我国著作权法保护？（ C ） </p></div>
                    <p>A、书法</p>
                    <p>B、地图</p>
                    <p>C、化学元素周期表</p>
                    <p>D、地方志</p>
                  <div id="que"><p>17.因侵犯著作权行为提起的民事诉讼，由著作权法所规定侵权行为的（ D ）人民法院管辖。</p></div>
                    <p>A、实施地</p>
                    <p>B、侵权复制品储藏地</p>
                    <p>C、被告住所地</p>
                    <p>D、实施地、侵权复制品储藏地或查封扣押地、被告住所地</p>
                  <div id="que"><p>18.下列哪个是著作权中的人身权（ B ）。 </p></div>
                    <p>A、发行权</p>
                    <p>B、署名权</p>
                    <p>C、表演权</p>
                    <p>D、复制权</p>
                  <div id="que"><p>19.中国历史上第一部著作权法是（ D ）。 </p></div>
                  <p>A、中华人民共和国著作权法</p>
                  <p>B、中华民国著作权法</p>
                  <p>C、北洋政府著作权法</p>
                  <p>D、大清著作权律</p>
                  <div id="que"><p>20.商标注册和版权登记有哪些区别（多选）ABCD</p></div>
                    <p>A、申请机构不同</p>
                    <p>B、保护对象不同</p>
                    <p>C、保护期限不同</p>
                    <p>D、保护的目的不同</p>
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