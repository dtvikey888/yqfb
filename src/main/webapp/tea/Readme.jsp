<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String openid =request.getParameter("openid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=0.38, maximum-scale=1.0, user-scalable=no"/>
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

  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="1676" height="0" align="center" valign="top"><table width="100%" cellspacing="30" cellpadding="0">
          <tr>
            <td align="center" valign="top"><table width="100%" border="0" cellspacing="5"  style="background-color:#FFF; border:2px solid #e2e2e2;"  >
              <tr>
                <td width="14%" height="7" align="center" valign="middle" >【投票规则】</td>
                </tr>
              <tr>
                <td height="1" align="left" valign="top" ><p>投票时间：8月24日-8月29日
                  
                  </p>
                  <p> 投票范围：主办方公布的21名候选人（人物名称、照片、简短介绍，按姓氏笔画排序）；</p>
                  <p>关注"乐清教育发布"公众号，每个微信号每日限投一次，一次投票不能超过10人。</p>
                  <p>友情提示：本次评选活动坚持自愿投票原则，严禁刷票，严禁使用任何技术进行投票舞弊等违规行为，如有违法违规现象，一经查实，主办方取消评选资格。</p>
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
