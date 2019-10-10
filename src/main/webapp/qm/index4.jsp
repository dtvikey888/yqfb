<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
String openid =request.getParameter("openid");

if(ZghTools.IsCz2(openid)==false){

	//回调
	  response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet6&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
      
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>我是乐清人，我接力！清明祭扫，不烧纸钱不放鞭炮……</title>
<script src="js/meta.js"></script>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/memorial2.css">
<script src="js/jquery.min.js"></script>
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
<body>
<div class="wrap">
    <ul class="tabUl">
        <li class="tabli fl">
            <img class="verticl" src="images/01.png" alt=""  onClick="javascript:location.href='http://v.yqcn.com/bmwj/asp/h5/gt31/index.asp'">
            <img class="smallImg" src="images/03.jpg" alt="">
        </li>
        <li class="liner"></li>
        <li class="tabli fr">
            <img class="verticl" src="images/02.png" alt="">
            <img class="smallImg" src="images/04.png" alt="">
        </li>
    </ul>

    <!--1-->
	<form id="form1" name="form1" method="post" action="save.jsp"/>
	
	 <input type="hidden" name="openid" value="<%=openid%>">
	
    <div class="main1" id="commitShow1">
        <div class="container1">
            <ul>
                <li class="formLi center">
                    <img src="images/06.png" alt="">
                </li>
                <li class="formLi center">
                    <img class="vertical" src="images/07.png" alt="">
                    <span class="flower">鲜花</span>
                </li>
                <li class="formLi">
                    <span class="merLeft">祭奠对象：</span>
                    <input type="text" id="merObkect" name="merObkect" class="merObject">
                </li>
				
                <li class="formLi">
                    <span class="merLeft">祭奠人：</span>
                    <img class="vertical" src="<%=ZghTools.GetImg(openid) %>" alt="" width="30px" height="30px">
                    <input type="text" id="merMan" class="merObject" value="<%=ZghTools.GetNick(openid) %>">
                </li>
                
				 <li class="formLi">
                    <span class="merLeft">寄语：</span>
                   <input type="text" id="memo" name="memo" class="leftValue">
                </li>
                
                <li class="formLi empty"></li>
            </ul>
           <%if(ZghTools.IsCz2(openid)==true){%>
  
            <div class="btn" id="commitY" onClick="document.form1.action='save.jsp?bzlopenid=<%=openid%>';if(DataLength(form1.merObkect.value)<1){alert('请填写祭奠对象');form1.merObkect.focus();return false};if(DataLength(form1.memo.value)<1){alert('请填写寄语');form1.memo.focus();return false};document.form1.submit();">确认提交</div>
           
           <%}%>
           
        </div>
    </div>
    
	</form>
    <!--2-->
    <div class="main1 main2" id="commitShow2">
        <div class="container1">
            <div class="rightTopInfo">转发呼唤更多亲友追思</div>
            <div class="title">
                亲爱的<span class="name"></span>
            </div>
            <div class="empInfo">

            </div>
            <span class="come">到访追思：</span>
            <div class="flowsValue">
                <div class="letFlow">
                    <img class="flowImgTop" src="images/08.png" alt="">
                    <span class="flowFt">献花</span>
                </div>
                <input type="text" class="rightValue">
            </div>
            <div class="lineEmp">
                <span class="fr">发起人：<span class="Launch"></span></span>
            </div>
        </div>
    </div>

    <footer class="fixedMain">
        <div class="mymemor">
            <img src="images/05.png" alt="" onClick="javascript:location.href='index4.jsp'">
        </div>
        <img class="logo" src="images/logo.png" alt="">
    </footer>
</div>
</body>
</html>