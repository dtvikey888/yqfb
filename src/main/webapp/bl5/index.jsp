<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils26"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.daf_t1;
	String tt2=AllValus.daf_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
    //out.println(kz);
%>

<%

String urlname ="bl6/index.jsp";
String openid =request.getParameter("openid");
//out.println("openid="+openid);


String from=request.getParameter("from");

String ympath=AllValus.ympath;
String appid=AllValus.appid;

String twbsession2 = (String)session.getAttribute("twbsession2");

//out.println("dafsession="+dafsession);

if(twbsession2!=null){
   
      if(twbsession2.equals(openid)){
      

   	      if(from!=null){
              response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet32&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

          }

          //out.println("�����Լ���ģ����ص�");
   	     
      }else{
        
            //out.println("�����˵����Ժ󣬲��ص�");      
   			
   			//response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");        

 			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet32&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



      }
   
   }else{
   
  		    //��û��Ҫ�ص�
            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");        
  			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet32&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

   }
   
   //ZghTools.upyt6(openid);
   
   ZghTools.ClearNull();
   
   String check="";
   
    if(from!=null){
      check=Topay.WxJsApiCheck48(urlname,openid,from);
      //out.println("from");
    }else{
      check=Topay.WxJsApiCheck4(urlname,openid);
     // out.println("nofrom");
    }
   
    // out.println(check);

    //�����ʱ׼������
    //session.removeAttribute("twbsession2");
    //session.invalidate();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        wx_share_title="<%=AllValus.daf_title%>";
        wx_share_desc="<%=AllValus.daf_desc%>";
        wx_share_link="<%=AllValus.daf_link%>";
        wx_share_imgUrl="<%=AllValus.daf_img%>";

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


<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title><%=AllValus.daf_title %></title>
<meta name="description" content=""/>
<meta name="viewport" content="initial-scale=0.3, width=device-width, maximum-scale=0.3, user-scalable=no"/>
<meta name="viewport" content="initial-scale=0.3,user-scalable=no,maximum-scale=0.3" media="(device-height: 568px)"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="full-screen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<link rel="apple-touch-icon-precomposed" sizes="57x57" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="120x120" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-120x120-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="196x196" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-196x196-precomposed.png">
<link rel="apple-touch-startup-image" href="http://ms0.meituan.net/touch/img/startup/apple-touch-startup-image-640x1096.png" media="(device-height:568px)">
<link rel="apple-touch-startup-image" href="http://ms0.meituan.net/touch/img/startup/apple-touch-startup-image-640x920.png" media="(device-height:480px)">
 
<style>
body{font-size:45px;color:#3f3e3d;line-height:35px;font-family:΢���ź�;background-color:#e7f0f7;padding:0px;margin:0px;}
a{color:#3f3e3d; text-decoration:none;}
a:hover{ color:#C1262C; text-decoration:none;}
p{text-indent:2em;line-height:40px;}
h1{font-size:40px; color:#6b6b6b;}
h2{font-size:20px; color:#315E01;}
m{color:#a6a6a6;}
c{font-size:30px; font-family:Arial; color:#ffb400;}
d{color:#fff;}
</style>

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
            window.location.href="<%=AllValus.errpage%>";
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('��û��ʼ�أ�"��ʼ����ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
           window.location.href="<%=AllValus.errpage%>";
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('��л��ע��');
           
		  <%} %>

		</script>

	<style>
			 #mcover2 {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.7);
				display: none;
				z-index: 20000;
			 }
			 #mcover2 img {
				position: fixed;
				right: 18px;
				top: 5px;
				width: 96%!important;
				height: 98%!important;
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
				text-shadow: 0.5px 0.5px 1px #fff;
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
        .STYLE1 {color: #FFFFFF}
    </style>
        
         <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // ��������Ѱ�ť��������
			}
			function button2(){
			$("#mcover").css("display","block")  // ���������Ȧ��ť��������
			}
			
			function button3(){
			$("#mcover2").css("display","block")  // ���������Ȧ��ť��������
			}
			
			function weChat2(){
			$("#mcover2").css("display","none");  // ��������㣬��������ʧ
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
		
		
	<script src="js/jquery.js"></script>
	
<style>
/*divͨ����ʽ*/
div{

}

/*���Ͻ�*/
div.right_top{
overflow: hidden;
z-index: 2000;
position:absolute;
right: 10px;
top: 190px;
}

/*���½�*/
div.right_bottom{
position:absolute;
bottom:0px;
right:0px

}


/*��Ļ�м�*/
div.center_{
right: 45%;
top: 50%;
}


/*���Ͻ�*/
div.left_top{
left: 10px;
top: 10px;
}


/*���½�*/
div.left_bottom{
left: 10px;
bottom: 10px;
}
</style>

    <script>
        //����֤
        function processForm(form)
        {

            var ids = document.getElementsByName("c1");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c2");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c3");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c4");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c5");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c6");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c7");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c8");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c9");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c10");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }


            var ids = document.getElementsByName("c11");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c12");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c13");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c14");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c15");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c16");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c17");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c18");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c19");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }

            var ids = document.getElementsByName("c20");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("��ѡ��");
                return false ;
            }



        }
    </script>
</head>
<body>
<%int cs = MyUtils26.GetCsForDt(openid);%>
<%if(cs>100000){%>
<div id="mcover" onClick="weChat()" style="display: block;">
          <img src="js/tip.png"/>
</div>
<%}else{%>
<div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png"/>
</div>
<%}%>

<%if(twbsession2!=null){%>
  <%if(twbsession2.equals(openid)){%>
  <div id="contentid"  style="display:block">
  <%}else{%>
  <!--  
  <img src="http://v.yqcn.com/bmwj/asp/sxbook/download3/no.png" width="100%" height="100%"/>-->
  <div id="contentid"  style="display:none">
  <%}%>
<%}else{%>
  <!--  
  <img src="http://v.yqcn.com/bmwj/asp/sxbook/download3/no.png" width="100%" height="100%"/>-->
<div id="contentid"  style="display:none">
<%}%>

<div id="mcover2" onClick="weChat2()" style="display:none;">
  <img src="img/tip9.png"/>
</div>

<form name="form1" method="get" action="tp.jsp">
<table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background-color:#ececee">
  <tr>
    <td height="600" align="center" valign="top" bgcolor="#FFFFFF" style="background:url(img/IMG_TOP3.png) no-repeat top center;background-size: 100% 100%;"><table width="95%" cellspacing="2" cellpadding="0">
      <tr>
        <td height="10" colspan="2" align="right">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="right"><div onClick="button2();"></div></td>
      </tr>
      
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="30">
      <tr>
        <td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;">4��26��������֪ʶ��Ȩ�գ�����Ļ�����ǡ�ǿ����Ȩ�����Ż���Ȩ��̬����Ϊ����������֪ʶ�����п�ѧ�ͱ���֪ʶ��Ȩ����ʶ��Ӫ�����֪ʶ���µķ��ɻ������й�������ί�������������ų���֣��ٰ��Ȩ֪ʶ�����н��ʴ���</div></strong></P></td>
        </tr>
      <tr>
        <td height="50" colspan="2">
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">�����</button>
	      <div align="center" style="margin-top:50px;margin-bottom:25px;line-height:1.8">һ�Ƚ�10��:  50Ԫ�ƶ�����</div>
	      <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">���Ƚ�30��:  30Ԫ�ƶ�����</div>
	      <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">���Ƚ�50��:  20Ԫ�ƶ�����</div>
	      <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">���뽱260��: 10Ԫ�ƶ�����</div>
	      <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">�����</button>
		  <div style="margin-top:50px;padding-left:12px;line-height:1.8">1��  ����20��ѡ���⣬�������15���⣬���ɲ���ιο��齱���ÿ���ֻ��Ž��޲���һ�Σ���ʵ�����롣</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;line-height:1.8">2��  350�ݻ��ѽ�����ɻ򳬳��ʱ�����������Ч��</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">3��	������㽭�ƶ��û���</div>
          <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">4��	���ѽ��ڻ������5�������������͡�</div>
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">ѡ����</button>
        </td>
      </tr>
      
      <tr>
        <td>
        
	<table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
      <tbody id="tbName" >
      <tr>
        <td height="20"><p></p><div style="line-height:1.8"><strong>1������������ǣ� ���£� ���ա�</strong></div>
          <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
		    A. 3��23��</p>
          <p> 
            <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
            B. 3��26��</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
            C. 4��23��</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="4" style="width:55px; height:55px;"/>
            D. 4��26��</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2������֪ʶ��Ȩ���ǣ� ���£� ���ա�</strong></div>
          <p><input type="radio" name="c2" value="1" style="width:55px; height:55px;"/>
		    A. 3��23�� </p>
          <p> 
            <input type="radio" name="c2" value="2" style="width:55px; height:55px;"/>
            B. 3��26��</p>
          <p>
            <input type="radio" name="c2" value="3" style="width:55px; height:55px;"/>
            C. 4��23��</p>
           <p>
            <input type="radio" name="c2" value="4" style="width:55px; height:55px;"/>
            D. 4��26��</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3�����³���Ӧ������ ��������λ��</strong></div>
          <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
		    A. ����Ч��</p>
          <p>
            <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
            B. ���Ч��</p>
          <p>
            <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
            C. ����Ч��</p>
          <p>
            <input type="radio" name="c3" value="4" style="width:55px; height:55px;"/>
            D. ��ҵЧ��</p>
        </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4������ӡˢҵ�����������Ĺ涨�����²����ڡ���������ǣ� ����</strong></div>
          <p> <input type="radio" name="c4" value="1" style="width:55px; height:55px;"/>
		    A. �ڿ�</p>
          <p>
            <input type="radio" name="c4" value="2" style="width:55px; height:55px;"/>
            B. ��ͼ</p>
          <p>
            <input type="radio" name="c4" value="3" style="width:55px; height:55px;"/>
            C. ����</p>
            <p>
                <input type="radio" name="c4" value="4" style="width:55px; height:55px;"/>
                D. �������Ʒ</p>
		   </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5����δ������Ϊ����ĳ����   �������շ�δ������ģ��Υ����ṫ�µ���Ϊ��Υ���������Ϊ�����ݣ���    �����пֲ����п�ȷ���δ���������Ľ��������ݡ�</strong></div>
          <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
		    A. ����      ����</p>
          <p>
            <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
            B. ����      ����</p>
          <p>
            <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
            C. ����      ����</p>
            <p>
                <input type="radio" name="c5" value="4" style="width:55px; height:55px;"/>
                D. ����      ����</p>
            </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6������������������涨����λΥ�������������Ե������֤���������ģ��䷨�������˻�����Ҫ�����������֤������֮���� ���ڲ��õ��γ��桢ӡˢ���߸��ơ����ڡ����е�λ�ķ��������˻�����Ҫ�����ˡ�</strong></div>
          <p><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
		    A. 5��</p>
          <p>
            <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
            B. 10��</p>
          <p>
            <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
            C. 15��</p>
            <p>
                <input type="radio" name="c6" value="4" style="width:55px; height:55px;"/>
                D. 20��</p>
		  </td>
      </tr>
	  </tbody>
	

	 <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7������ʲ������� ����ͼ�飬���У�������ϸ�</strong></div>
          <p><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
		    A. ǧ��֮һ</p>
          <p>
            <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
            B. ���֮һ</p>
          <p>
            <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
            C. �ٷ�֮һ</p>
              <p>
                  <input type="radio" name="c7" value="4" style="width:55px; height:55px;"/>
                  D. ʮ���֮һ</p>
		</td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8������Ȩ��������Ʒ����ָ��ѧ�������Ϳ�ѧ�����ھ��У� ��������ĳ��������ʽ���Ƶ������ɹ���</strong></div>
          <p> <input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
		    A. ��ӱ��</p>
          <p>
            <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
            B. ������</p>
          <p>
            <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
            C. ������</p>
              <p>
                  <input type="radio" name="c8" value="4" style="width:55px; height:55px;"/>
                  D. ˼����</p>
       </td>
      </tr>
	  </tbody>
	  
	   
      
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9�������ҹ�����Ȩ���Ĺ涨���� ��������Ȩ��ͬһ���</strong></div>
          <p> <input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
		    A. ��Ȩ</p>
          <p>
            <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
            B. ����Ȩ</p>
          <p>
            <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
            C. ����Ȩ</p>
            <p>
             <input type="radio" name="c9" value="4" style="width:55px; height:55px;"/>
            D. �ڽ�Ȩ</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	    
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10������Ȩ���������ǣ� ����</strong></div>
          <p> <input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
		    A. ˼�����</p>
          <p>
            <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
            B. ��ѧ����</p>
          <p>
            <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
            C. ԭ��ͷ���</p>
            <p>
                <input type="radio" name="c10" value="4" style="width:55px; height:55px;"/>
                D. ˼�����Ķ����Ա��</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>11�������ҹ�����Ȩ�����ҹ���������Ȩ�� ����</strong></div>
          <p> <input type="radio" name="c11" value="1" style="width:55px; height:55px;"/>
		    A. ����Ʒ�ķ�����Զ�����</p>
          <p>
            <input type="radio" name="c11" value="2" style="width:55px; height:55px;"/>
            B. ����Ʒ�Ĵ�����ɶ��Զ�����</p>
          <p>
            <input type="radio" name="c11" value="3" style="width:55px; height:55px;"/>
            C. ����Ʒ�ϼ�ע��Ȩ��Ǻ��Զ�����</p>
            <p>
                <input type="radio" name="c11" value="4" style="width:55px; height:55px;"/>
                D. ��Ʒ��һ����������̬�̶������</p>
       </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>12���� ����������Ȩ��������</strong></div>
          <p> <input type="radio" name="c12" value="1" style="width:55px; height:55px;"/>
		    A. ��������</p>
          <p>
            <input type="radio" name="c12" value="2" style="width:55px; height:55px;"/>
            B. ��ͼ</p>
          <p>
            <input type="radio" name="c12" value="3" style="width:55px; height:55px;"/>
            C. ʱ������</p>
            <p>
                <input type="radio" name="c12" value="4" style="width:55px; height:55px;"/>
                D. ������˵</p>
       </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>13��ͼ���������ӡ���ٰ���Ʒ�ģ�Ӧ���� ����</strong></div>
          <p> <input type="radio" name="c13" value="1" style="width:55px; height:55px;"/>
		    A. ֧�����굫����֪ͨ����Ȩ��</p>
          <p>
            <input type="radio" name="c13" value="2" style="width:55px; height:55px;"/>
            B. ֪ͨ����Ȩ�˲�֧������</p>
          <p>
            <input type="radio" name="c13" value="3" style="width:55px; height:55px;"/>
            C. ֪ͨ����Ȩ�˵�����֧������</p>
              <p>
                  <input type="radio" name="c13" value="4" style="width:55px; height:55px;"/>
                  D. ������Ȩ������ǩ����ͬ</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>14�����ߵ�����Ȩ���޸�Ȩ��������Ʒ����Ȩ�ı�����Ϊ�� ����</strong></div>
          <p> <input type="radio" name="c14" value="1" style="width:55px; height:55px;"/>
		    A. ����������������ʮ��</p>
          <p>
            <input type="radio" name="c14" value="2" style="width:55px; height:55px;"/>
            B. ��������</p>
          <p>
            <input type="radio" name="c14" value="3" style="width:55px; height:55px;"/>
            C. ��������</p>
              <p style="line-height: 1.5">
                  <input type="radio" name="c14" value="4" style="width:55px; height:55px;line-height: 1.5"/>
                  D. ��ֹ����Ʒ�״η�����50���12��31��</p>
       </td>
      </tr>
	  </tbody>
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>15����׫д��ҵ���ģ�������Ϯ���ҿ�����ĳ��־�ϵ�һƪ���ģ��׵���Ϊ�ַ��ˣ� ��������Ȩ��</strong></div>
          <p> <input type="radio" name="c15" value="1" style="width:55px; height:55px;"/>
		    A. ��</p>
          <p>
            <input type="radio" name="c15" value="2" style="width:55px; height:55px;"/>
            B. ��־��</p>
          <p>
            <input type="radio" name="c15" value="3" style="width:55px; height:55px;"/>
            C. �Һ���־��</p>
            <p>
                <input type="radio" name="c15" value="4" style="width:55px; height:55px;"/>
                D. �Һ�ԭ����</p>
       </td>
      </tr>
	  </tbody>

        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>16����������������ҹ�����Ȩ���������� ��</strong></div>
                <p> <input type="radio" name="c16" value="1" style="width:55px; height:55px;"/>
                    A. �鷨</p>
                <p>
                    <input type="radio" name="c16" value="2" style="width:55px; height:55px;"/>
                    B. ��ͼ</p>
                <p>
                    <input type="radio" name="c16" value="3" style="width:55px; height:55px;"/>
                    C. ��ѧԪ�����ڱ�</p>
                <p>
                    <input type="radio" name="c16" value="4" style="width:55px; height:55px;"/>
                    D. �ط�־</p>
            </td>
        </tr>
        </tbody>


        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>17�����ַ�����Ȩ��Ϊ������������ϣ�������Ȩ�����涨��Ȩ��Ϊ�ģ� ������Ժ��Ͻ��</strong></div>
                <p> <input type="radio" name="c17" value="1" style="width:55px; height:55px;"/>
                    A. ʵʩ��</p>
                <p>
                    <input type="radio" name="c17" value="2" style="width:55px; height:55px;"/>
                    B. ��Ȩ����Ʒ���ص�</p>
                <p>
                    <input type="radio" name="c17" value="3" style="width:55px; height:55px;"/>
                    C. ����ס����</p>
                <p style="line-height: 1.5">
                    <input type="radio" name="c17" value="4" style="width:55px; height:55px;"/>
                 D. ʵʩ�ء���Ȩ����Ʒ���صػ����Ѻ�ء�����ס����</p>
            </td>
        </tr>
        </tbody>

        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>18�������ĸ�������Ȩ�е�����Ȩ�� ����</strong></div>
                <p> <input type="radio" name="c18" value="1" style="width:55px; height:55px;"/>
                    A. ����Ȩ</p>
                <p>
                    <input type="radio" name="c18" value="2" style="width:55px; height:55px;"/>
                    B. ����Ȩ</p>
                <p>
                    <input type="radio" name="c18" value="3" style="width:55px; height:55px;"/>
                    C. ����Ȩ</p>
                <p>
                    <input type="radio" name="c18" value="4" style="width:55px; height:55px;"/>
                    D. ����Ȩ</p>
            </td>
        </tr>
        </tbody>


        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>19���й���ʷ�ϵ�һ������Ȩ���ǣ� ����</strong></div>
                <p> <input type="radio" name="c19" value="1" style="width:55px; height:55px;"/>
                    A. �л����񹲺͹�����Ȩ��</p>
                <p>
                    <input type="radio" name="c19" value="2" style="width:55px; height:55px;"/>
                    B. �л��������Ȩ��</p>
                <p>
                    <input type="radio" name="c19" value="3" style="width:55px; height:55px;"/>
                    C. ������������Ȩ��</p>
                <p>
                    <input type="radio" name="c19" value="4" style="width:55px; height:55px;"/>
                    D. ��������Ȩ��</p>
            </td>
        </tr>
        </tbody>

        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>20���̱�ע��Ͱ�Ȩ�Ǽ�����Щ���𣨶�ѡ����</strong></div>
                <p><input type="checkbox" name="c20" value="1" style="width:55px; height:55px;"/>
                    A. ���������ͬ</p>
                <p>
                    <input type="checkbox" name="c20" value="2" style="width:55px; height:55px;"/>
                    B. ��������ͬ</p>
                <p>
                    <input type="checkbox" name="c20" value="3" style="width:55px; height:55px;"/>
                    C. �������޲�ͬ</p>
                <p>
                    <input type="checkbox" name="c20" value="4" style="width:55px; height:55px;"/>
                    D. ������Ŀ�Ĳ�ͬ</p>
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
        <%if(!MyUtils26.iscj_pd(openid)){%>
        <!--  
        <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
        -->
       <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#21457B; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;</button>
       <p></p>
		<%}else{ %>
		 <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">���Ѿ������,<%="���ǵ�"+MyUtils26.GetWs(openid)+"λ������,"+MyUtils26.zsm(openid) %></button>  
		<%} %>
	   <p></p>
	<input name="openid" type="hidden" id="openid" value="<%=openid%>"/>	<div></div></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</div>

</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
	   
	   
	   
    }else{
	   //alert('not');
	  //��΢��������������ʾ�б��
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   //alert('���ȹ�ע΢��');
	  
	 
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
