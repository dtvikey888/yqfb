<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

<%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.ly1;
	String tt2=AllValus.ly2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
    //out.println(kz);
%>

<%

ZghTools.ClearNull();

//���˵���ҳ

//���ڻص�

//��������Ȧת���㿪���Ļ������Լ��㣬�ǾͲ��ص�
//����������Լ���Żص�
//�ص���Ӧ���ǵ�������һ������ҳ��

//String openid =request.getParameter("openid");
String bzlopenid =request.getParameter("bzlopenid");

//out.println("openid: "+openid);
//out.println("bzlopenid: "+bzlopenid);

  String zlsession = (String)session.getAttribute("zlsession");

   
 //out.println("zlsession: "+zlsession);
  
  
  if(ZghTools.IsCz2(bzlopenid)&&ZghTools.IsCz3(bzlopenid)){
  
  
  if(ZghTools.IsCz2(zlsession)==false){
     
   if(zlsession!=null){
   
      if(zlsession.equals(bzlopenid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	      
      }else{
        
          //out.println("�����˵����Ժ󣬲��ص�");
          //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
      }
   
   }else{
   
  		//��û��Ҫ�ص�
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet15&response_type=code&scope=snsapi_base&state="+bzlopenid+"#wechat_redirect");        
   
   }
   
   
   //yqfb_openid û�д���Ҫ�ص�
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet15&response_type=code&scope=snsapi_base&state="+bzlopenid+"#wechat_redirect");        
   
   
   }
   
   }else{
   		response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqfb/lyzx/gd.jsp");  
   }
  
  ZghTools.upyt(zlsession);
  
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)file:///C:/Users/zpuser/Desktop/%E7%BD%91%E9%A1%B5/CYL.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
<title>������԰װ�μ�װ΢��Ը���Ϊ<%=ZghTools.GetXm2(bzlopenid)%>����</title>
<script src="js/jquery.js"></script>
<script type="text/javascript">
		   	  
		  <%
		     // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
		  // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("��ʼ");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('�ǳ���Ǹ������ʱ���ѹ�����л���Ĺ�ע�����´�������');
            window.location.href="http://www.yqrb.com.cn/yqfb/lyzx/phb.jsp"; 
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('��û��ʼ�أ�"��ʼ����ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
           window.location.href="http://www.yqrb.com.cn/yqfb/lyzx/phb.jsp"; 
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('��л��ע��');
           
		  <%} %>

		</script>	
	<style>
			 #mcover {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.7);
				display: none;
				z-index: 20000;
			 }
			 #mcover img {
				position: fixed;
				right: 18px;
				top: 5px;
				width: 260px!important;
				height: 180px!important;
				z-index: 20001;
			 }
			 .text {
				margin: 15px 0;
				font-size: 14px;
				word-wrap: break-word;
				color: #727272;
			 }
			 #mess_share {
				margin: 15px 0;
				display: block;
			 }
			 #share_1 {
				float: left;
				width: 49%;
				display: block;
			 }
			 #share_2 {
				float: right;
				width: 49%;
				display: block;
			 }
			 .clr {
				display: block;
				clear: both;
				height: 0;
				overflow: hidden;
			 }
			 .button2 {
				font-size: 16px;
				padding: 8px 0;
				border: 1px solid #adadab;
				color: #000000;
				background-color: #e8e8e8;
				background-image: linear-gradient(to top, #dbdbdb, #f4f4f4);
				box-shadow: 0 1px 1px rgba(0, 0, 0, 0.45), inset 0 1px 1px #efefef;
				text-shadow: 0.5px 0.5px 1px #EFEFF1;
				text-align: center;
				border-radius: 3px;
				width: 100%;
			 }
			 #mess_share img {
				width: 22px!important;
				height: 22px!important;
				vertical-align: top;
				border: 0;
			 }
        </style>
        
        <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // ��������Ѱ�ť��������
			}
			function button2(){
			$("#mcover").css("display","block")  // ���������Ȧ��ť��������
			}
			function weChat(){
			$("#mcover").css("display","none");  // ��������㣬��������ʧ
			}
			
			/*$
			(function(){
			   setTimeout(function () {
					$("#mcover").show();}, 6000);   // 6000ʱ�����ǵ�����
			setTimeout(function () {
					$("#mcover").hide(); }, 8000);    //8000���������ز�
			})
			*/
		</script>


<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:΢���ź�}
.style7 {
	font-size: 18px;
	font-weight: bold;
	color: #FFFFFF;
}
.style9 {
	font-size: 36px;
	font-weight: bold;
	color: #FFFFFF;
}
.style10 {color: #FFFFFF}
</style>

</head>
<%if(ZghTools.IsCz2(bzlopenid)==true){%>
<body style="background:url(img/to.png) no-repeat top center;background-size:100%;">
<div id="contentid"  style="display:block">
<%}else{%>
<body>
<div id="contentid"  style="display:none">
<%}%>
<div id="mcover" onClick="weChat()" style="display: none;">
    <img src="js/tip.png"/>
</div>
<table width="100%" height="102"  border="0">
  <tr>
    <th scope="row">&nbsp;</th>
  </tr>
</table>
<table width="95%" height="0"  border="1" align="center" cellspacing="0" bordercolor="#FFCC00" bgcolor="#FFFFFF">
  <tr>
    <td align="left"><img src="<%=ZghTools.GetImagSC2(bzlopenid)%>" width="100%" height="180px"/></td>
  </tr>
</table>
 <table width="100%"  border="0" cellspacing="0">
   <tr>
     <th width="20%" align="left" valign="middle" scope="row"><table width="60%"  border="0" cellspacing="0">
       <tr>
         <th scope="row"><div onClick="javascript:window.open('phb.jsp','_self')"><img src="img/15.png" width="100%" /></div></th>
       </tr>
     </table></th>
     <th scope="row"><table width="100%" height="94"  border="0" align="center">
       <tr>
         <td align="left"><span class="style7"><%=ZghTools.GetXm2(bzlopenid)%>��Ը��</span></td>
       </tr>
       <tr>
         <td align="left"><span class="style10"><%=ZghTools.GetMemo(bzlopenid)%></span></td>
       </tr>
     </table>
       <table width="100%" border="0" align="center">
         <tr>
           <td width="75%" align="center"><table width="60%" border="0" align="center">
               <tr>
                 <td align="right">

		<%if(zlsession!=null){ %>
		<%if(ZghTools.GetPx(bzlopenid)!=0){ %>
		<img src="img/06.png" width="50%"/>
		<%} %>
		<%} %>

				</td>
                 <td align="left">
                 <span class="style9">
                    <%if(!ZghTools.GetNoZlz(bzlopenid).equals("0")){%>
         			 +<%=ZghTools.GetNoPx(bzlopenid)%>
        			<%}%>
				 </span></td>
               </tr>
           </table></td>
           <td width="25%" align="center">&nbsp;</td>
         </tr>
       </table>
       <table width="100%"  border="0" align="center">
         <tr>
           <td align="center"><p class="style10"><strong> ��˾��ַ����������Զ·206����¥<br />
        ��ʱ���㳡���棩<br />
        ��ѯ���ߣ�0577-62567601</strong></p></td>
         </tr>
       </table>       
       <table width="100%" border="0" align="center">
         <tr>
           <td align="center"><table width="100%"  border="0">
               <tr>
                 <th scope="row">
                 
        <%if(zlsession!=null){ %>

		<%if(zlsession.equals(bzlopenid)){ %>
		
		<div><img src="img/17.png" width="100%" /></div>
	
		<%}else if(ZghTools.IsHelp2(bzlopenid,zlsession)&&ZghTools.GetYt(zlsession)!=0){%>
		
		    <%if(!zlsession.equals(bzlopenid)){ %>
		   
			<div><img src="img/18.png" width="100%" /></div>
			
		    <%}else{ %>
		   
		    <div><img src="img/17.png" width="100%" /></div>
		   
		    <%} %>
		<%}else{ %>
		    <%
		     // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
		  // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
		  
		   if (kz==1){

		    %>
		  
		    <div style="font-family:Arial; font-size:18px;" onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>','_self')"><img src="img/13.png" width="100%" /></div>
        
		   <%}else if(kz==2){
		   
		  
		  %>
		  <div><img src="img/17.png" width="100%" /></div>
		  <%}else if(kz==3){
		  
		  
		  %>
		  <div><img src="img/17.png" width="100%" /></div>
		  <%}else{
		      
		  
		   %>
		   <div><img src="img/17.png" width="100%" /></div>
		    <%} %>
		  
      
        <%} %>
		<%} %>	
                 
                 
                 </th>
               </tr>
           </table></td>
           <td align="center"><table width="100%"  border="0">
               <tr>
                 <th scope="row">
                  <%if(zlsession!=null){ %>
                 <div onClick="button2()"><img src="img/12.png" width="100%"/></div>
                 <%} %>
                 </th>
               </tr>
           </table></td>
         </tr>
       </table>       </th>
     <th width="20%" align="right" valign="middle" scope="row"><table width="60%"  border="0" cellspacing="0">
       <tr>
         <th scope="row"><div onClick="javascript:window.open('https://file762d99333146.iamh5.cn/v3/idea/NaNE3YYJ','_self')"><img src="img/14.png" width="100%" /></div></th>
       </tr>
     </table></th>
   </tr>
 </table>
 </div>
</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
    }else{
	  // alert('not');
	  //��΢��������������ʾ�б��
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('��΢���д�');

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


