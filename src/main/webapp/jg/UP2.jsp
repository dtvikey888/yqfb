<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%
String urlname ="jg/UP2.jsp";
String openid =request.getParameter("openid");
//out.println("openid="+openid);
String ympath=AllValus.ympath;

String twbsession1 = (String)session.getAttribute("twbsession1");

//out.println("twbsession1="+twbsession1);

if(twbsession1!=null){
   
      if(twbsession1.equals(openid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	     
   	      
      }else{
        
           //out.println("�����˵����Ժ󣬲��ص�");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet25&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
  
      }
   
   }else{
   
  		   //��û��Ҫ�ص�
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet25&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
  
   }

   ZghTools.ClearNull3();
   
  // System.out.println("openid: "+openid);
   
  // out.println("isws:"+ZghTools.IsWs("oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"));
   
   if(openid!=null){
   
   if(!ZghTools.IsWs(openid)){

	   out.println("<script>window.location.href='User.jsp?openid="+openid+"'</script>");

   }
   
   }
   
   String check=Topay.WxJsApiCheck4(urlname,openid);
%>

<%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.story_t1;
	String tt2=AllValus.story_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
    //out.println(kz);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>
<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
		<script type="text/javascript">
		wx_share_title="<%=AllValus.title1 %>";
        wx_share_desc="<%=AllValus.desc %>";
        wx_share_link="<%=AllValus.thelink %>";
        wx_share_imgUrl="<%=AllValus.nopicpath %>";
        
        wx.config({
		    debug: false, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
		    <%=check%>,// ���ǩ��������¼1
		    jsApiList: ['updateTimelineShareData','updateAppMessageShareData','chooseImage','previewImage','uploadImage'] // �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2
		});
		wx.ready(function(){
		   //alert("config ok...");
		    //�������Ͻǲ˵��ӿ�
		   	  wx.hideOptionMenu();
		   
			    wx.checkJsApi({
           jsApiList: [
             'getNetworkType',
             'previewImage',
             'updateTimelineShareData',
             'chooseImage',
             'updateAppMessageShareData',
           ],
           success: function (res) {
             //alert(JSON.stringify(res));
           }
          });
          
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
		wx.error(function(res){
			//alert(res);
		    // config��Ϣ��֤ʧ�ܻ�ִ��error��������ǩ�����ڵ�����֤ʧ�ܣ����������Ϣ���Դ�config��debugģʽ�鿴��Ҳ�����ڷ��ص�res�����в鿴������SPA�������������ǩ����
		});

		function callpay(){
			wx.chooseImage({
			    jsApiList: ['updateTimelineShareData','updateAppMessageShareData','chooseImage','previewImage','uploadImage'], // ���΢�Žӿ��Ƿ����
			     success: function (res) {
        				var localIds = res.localIds; // ����ѡ����Ƭ�ı���ID�б�localId������Ϊimg��ǩ��src������ʾͼƬ
   					 }
			    });

		}
		
		 // 5 ͼƬ�ӿ�
    // 5.1 ���ա�����ѡͼ
     var images = {
        localId: [],
         serverId: []
    };
    
		function chooseimg(){
			wx.chooseImage({
			    jsApiList: ['chooseImage'], // ���΢�Žӿ��Ƿ����
			     success: function (res) {
        				//var localIds = res.localIds; // ����ѡ����Ƭ�ı���ID�б�localId������Ϊimg��ǩ��src������ʾͼƬ
						 images.localId = res.localIds;
	                	 var image = document.createElement("img");
	                     image.src = res.localIds;
	                     image.width=100;
	                     image.height=90;
	                     document.querySelector("#imageList").innerHTML="";  //���������
	               		 document.querySelector("#imageList").appendChild(image);
	               		 
	               		 uploadimg();
   					 }
			    });
			    
			    
			    
		}
		
		
		function uploadimg(){
		
		    if(images.localId.length <= 0){
  		    alert("��ѡ����Ƭ");
  		    return false;
  	       }
  	       	var i = 0, len = images.localId.length;
		
			wx.uploadImage({
			    jsApiList: ['uploadImage'], // ���΢�Žӿ��Ƿ����
			    localId: images.localId[i], // ��Ҫ�ϴ���ͼƬ�ı���ID����chooseImage�ӿڻ��
    			isShowProgressTips: 1, // Ĭ��Ϊ1����ʾ������ʾ
			     success: function (res) {
        				i++;
		  			    images.serverId.push(res.serverId);
		  			    if(i<len){
		  				upload();
		  			   }
		  			   
		  			   //��ӵ� med2
		  			   dd=res.serverId;
		  			   addmed2(dd);
		  			   
		  			  // var e = document.createElement("input");
		  			  // e.name= "med";
             		  // e.type = "text";
            		 //  e.value = res.serverId;
	               	 //  document.querySelector("#textList").appendChild(e);

	               	  // alert("�ϴ���Ƭ�ɹ�,���ڿ��Ե��ύ��ť!");
	               	   
   					 },
   				  fail: function(res){
	  			  //alert(JSON.stringify(res));
	  		      }
			    });
   
		}
		
		
	function addmed2(dtt){
		   
		document.getElementById("med2").value=dtt;
		   
	}
	
	
	
	// 2.2 ������������Ȧ��ť������Զ���������ݼ��������ӿ�
  function  sharefriendRound2() {
     //��ʾ���Ͻǲ˵��ӿ�
       wx.showOptionMenu();
	   
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
       // alert(JSON.stringify(res));
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
    
  };
  
</script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport"/>
<title><%=AllValus.title1 %></title>
<style>
 @font-face {
    font-family: wing;
    src: url("font/simkai.ttf")
} .wing{
    font-family: wing;
    color:#AA00FF;
}
</style>
<style>
body{
 font-size:12px;
 font-family:΢���ź�;
 background:url(IMG/top.png); 
 padding:0px;
 margin:0px;
 }
a{text-decoration:none; color:#000000;}
a:hover{ color:#d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px; color:#ffffff;}
c{font-size:35px; font-family:Arial;}
d{color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}
.style23 {color: #CCCCCC; font-size: 14px; }
.style24 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 25px;
	
}

</style>

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
				right: 30px;
				top: 50px;
				width: 480px!important;
				height: 780px!important;
				z-index: 20001;
			 }
			 
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
				right: 10px;
				top: 10px;
				width: 380px!important;
				height: 550px!important;
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
			 
			
        </style>
        
        <style>
        /*�ļ��ϴ�*/
.fileupload{
    position: relative;
    width:330px;
    height:100px;
    border:1px solid #66B3FF;
    border-radius: 4px;
    box-shadow: 1px 1px 5px #66B3FF;
    line-height: 35px;
    padding-left: 8px;
    overflow: hidden;
}
.fileupload input{
    position: absolute;
    width:330px;
    height:100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    -ms-filter: 'alpha(opacity=0)';
}
        </style>


<script>
  //�رյȴ�����
function closediv() {
    //Close Div 
    document.body.removeChild(document.getElementById("bgDiv"));
    document.getElementById("msgDiv").removeChild(document.getElementById("msgTitle"));
    document.body.removeChild(document.getElementById("msgDiv"));
}
//��ʾ�ȴ�����
function showdiv(str) {
    var msgw, msgh, bordercolor;
    msgw = 400; //��ʾ���ڵĿ�� 
    msgh = 100; //��ʾ���ڵĸ߶� 
    bordercolor = "#336699"; //��ʾ���ڵı߿���ɫ 
    titlecolor = "#99CCFF"; //��ʾ���ڵı�����ɫ 

    var sWidth, sHeight;
    sWidth = window.screen.availWidth;
    sHeight = window.screen.availHeight;

    var bgObj = document.createElement("div");
    bgObj.setAttribute('id', 'bgDiv');
    bgObj.style.position = "absolute";
    bgObj.style.top = "0";
    bgObj.style.background = "#777";
    bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
    bgObj.style.opacity = "0.6";
    bgObj.style.left = "0";
    bgObj.style.width = sWidth + "px";
    bgObj.style.height = sHeight + "px";
    document.body.appendChild(bgObj);
    var msgObj = document.createElement("div")
    msgObj.setAttribute("id", "msgDiv");
    msgObj.setAttribute("align", "center");
    msgObj.style.position = "absolute";
    msgObj.style.background = "white";
    msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
    msgObj.style.border = "1px solid " + bordercolor;
    msgObj.style.width = msgw + "px";
    msgObj.style.height = msgh + "px";
    msgObj.style.top = (document.documentElement.scrollTop + (sHeight - msgh) / 2) + "px";
    msgObj.style.left = (sWidth - msgw) / 2 + "px";
    var title = document.createElement("h4");
    title.setAttribute("id", "msgTitle");
    title.setAttribute("align", "right");
    title.style.margin = "0";
    title.style.padding = "3px";
    title.style.background = bordercolor;
    title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
    title.style.opacity = "0.75";
    title.style.border = "1px solid " + bordercolor;
    title.style.height = "18px";
    title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";
    title.style.color = "white";
    //title.style.cursor = "pointer";
    //title.innerHTML = "�ر�";
    //title.onclick = closediv;
    document.body.appendChild(msgObj);
    document.getElementById("msgDiv").appendChild(title);
    var txt = document.createElement("p");
    txt.style.margin = "1em 0"
    txt.setAttribute("id", "msgTxt");
    txt.innerHTML = str;
    document.getElementById("msgDiv").appendChild(txt);
}
//����F5
document.onkeydown = mykeydown;
function mykeydown() {
    if (event.keyCode == 116) //����F5ˢ�¼�   
    {
        window.event.keyCode = 0;
        return false;
    }
}  
</script>

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
		
		
<script language="javascript">
            //����֤
            function processForm(){
				if(document.getElementById("div1").style.display==="block"){
				    if (form1.memo.value==""){
                       alert("����д��");
                       form1.memo.focus();
                       return false;
                    }
				}
				
				if(document.getElementById("div2").style.display==="block"){
				    if (form1.story.value==""){
                       alert("����д2��");
                       form1.story.focus();
                       return false;
                    }
				}
				
				
				if(DataLength(form1.lb.value)<1){
					   alert('��ѡ�����');
					 
					   return false;
				}
				
				if(DataLength(form1.file.value)<1){
					   alert('����ѡȡ�ļ�');
					   return false;
				}
            }
        </script>

		<script src="js/jquery.js"></script>
</head>

<body>
<%if(twbsession1!=null){%>
  <%if(twbsession1.equals(openid)){%>
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

<div id="mcover2" onClick="weChat2()" style="display: none;">
   <img src="IMG/tip.png"/>
</div>

<table width="100%" border="0" cellspacing="15">
  <tr>
    <td><table width="100%" border="0">
        <tr>
          <td><img src="IMG/totu.png" width="100%" /></td>
        </tr>
    </table></td>
  </tr>
</table>

<form id="form1" name="form1" method="post"  enctype="multipart/form-data" action="sc_chk2.jsp?openid=<%=openid%>" >
<table width="100%"  border="0">
  <tr>
    <td><table width="90%" height="80%" align="center" cellspacing="5">
      <tr>
        <th height="30" align="center" bordercolor="#EC6941" scope="row">
        <div id="div1" style="display:none">
        <input id="div1_memo"  type="text" name="memo"  placeholder=" ��Ʒ���ƣ�14�����ڣ�"  style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:50px;font-size:18px;"/>
        </div>
        </th>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0">
  <tr>
    <td><table width="90%" height="80%" align="center" cellspacing="5">
      <tr>
        <th height="30" align="center" bordercolor="#EC6941" scope="row">
		<div id="div2" style="display:none">
        <textarea id="div2_story"  name="story" placeholder="���£�200�����ڣ�" rows="5"   style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:150px;font-size:18px;"></textarea>
        </div>
        </th>
      </tr>
    </table></td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td width="87%"><table width="111" height="80" border="0">
      <tr>
        <td align="center" bgcolor="#fff"><table width="260" border="0">
          <tr >
            <td>
             <div class="fileupload">
                <script>
      function getFilename(){
        var filename=document.getElementById("file").value;
        if(filename==undefined||filename==""){
          document.getElementById("filename").innerHTML="����˴��ϴ��ļ�";
        }else{
          var fn=filename.substring(filename.lastIndexOf("\\")+1);
          document.getElementById("filename").innerHTML=fn; //����ȡ����ļ�����䵽span��
        }
      }
    </script>
   <span id="filename">����˴��ϴ��ļ���֧��jpg��png��gif��mp3��mp4��m4a�ȸ�ʽ�� �ϴ���Ƶ�� ��Ƶ�����ڵ��Զˣ� ͨ��������΢���ϴ�����(����80MB)</span>
   <input type="file" name="file" id="file" onchange="getFilename()"/>
    </div>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="13%" align="right">&nbsp;</td>
  </tr>
</table>
<!--  
<table width="90%" height="40" border="0" align="center" bordercolor="#C6B798">
  <tr>
    <td valign="bottom"><table width="100%" border="0">
      <tr>
        <td><img src="IMG/08.png" width="100%" /></td>
      </tr>
    </table></td>
  </tr>
</table>-->
<table width="90%" height="40" border="0" align="center" bordercolor="#C6B798" action="sc_chk2.jsp?openid=<%=openid%>">
  <tr>
    <td valign="bottom"><table width="100%" border="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
 <script type="text/JavaScript">
        function gradeChange() {
            var objS = document.getElementById("lb");
            var grade = objS.options[objS.selectedIndex].value;
            //alert(grade);
            if(grade=="1"){
		       // alert('1');
		       document.getElementById("div1_memo").setAttribute("placeholder","��Ʒ���� (14������)");
        	   //document.getElementById("div2").setAttribute("placeholder","���� (200������)");
        	   document.getElementById("div1").style.display="block";
        	   document.getElementById("div2").style.display="none";
 			}else if(grade=="2"){
 	    		//alert('2');
 	    	   document.getElementById("div1_memo").setAttribute("placeholder","��Ʒ���� (14������)");
        	   //document.getElementById("div2").setAttribute("placeholder","���� (200������)");
        	   document.getElementById("div1").style.display="block";
        	   document.getElementById("div2").style.display="none";
 			}else if(grade=="3"){
        		//alert('3');
        	   document.getElementById("div1_memo").setAttribute("placeholder","��Ʒ���� (14������)");
        	   //document.getElementById("div2").setAttribute("placeholder","���� (200������)");
        	   document.getElementById("div1").style.display="block";
        	   document.getElementById("div2").style.display="none";
        		
 			}else if(grade=="4"){
        		//alert('4');
        		document.getElementById("div1").style.display="block";
        	    document.getElementById("div2").style.display="block";
        		document.getElementById("div1_memo").setAttribute("placeholder","�򿨵�");
        		document.getElementById("div2_story").setAttribute("placeholder","������");
 			}
            
        }
    </script>
    

<table width="90%"  border="0" align="center">
  <tr>
    <td width="90%">
 			 <select  id="lb" onchange="gradeChange()" name=lb style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:50px;font-size:18px;">
			    <option value="" selected>ѡ������</option>
				<option value="1">Ϊ�����һ�׸裨��ʫ��</option>
				<option value="2">Ϊ�����һ����</option>
				<option value="3">Ϊ�����һ����</option>
				<option value="4">Ϊ�����һ����</option>
			  </select>
 </td>
  </tr>
</table>
<table width="70%" height="10" border="0" align="center" cellspacing="30">
  <tr>
    <td align="center" bgcolor="#C62619" style="border-radius: 15px;">
    
     <%if(kz==1){
           // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
            %>
    <button onclick="showdiv('�����ύ�У����Ե�');return processForm(this.form);" type="submit" style="padding:5px 5px;border-radius:15px; background:#C62619; border:0px #555 solid; color:#fff; font-size:25px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;</button>  
    <%}else if(kz==2){%>
    <button  type="submit" disabled="disabled" style="padding:5px 5px;border-radius:15px; background:#C62619; border:0px #555 solid; color:#fff; font-size:25px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;ʱ&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;</button>  
    
    <%}else{%>
     
	<button  type="submit" disabled="disabled" style="padding:5px 5px;border-radius:15px; background:#C62619; border:0px #555 solid; color:#fff; font-size:25px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;δ&nbsp;&nbsp;��&nbsp;&nbsp;ʼ&nbsp;&nbsp;&nbsp;&nbsp;</button>  
           
     <%}%>        
    </td>
    <td align="center" bgcolor="#C62619" style="border-radius: 15px;">
    <div onClick="sharefriendRound2();button3();">
    <span class="style24">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
    </td>
  </tr>
</table>


 
</form>


<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</body>
</html>
