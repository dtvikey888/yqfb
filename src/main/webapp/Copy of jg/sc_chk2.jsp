<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="org.fjw.weixin.util.FileCounter"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

<!-- 先搞定上传 -->
<%
String openid = request.getParameter("openid");
//System.out.println("sc_chk2.jsp openid="+openid);

SmartUpload mySmartUpload =new SmartUpload();  
long file_size_max=80000000;    //80M
String fileName2="",ext="",testvar="",ext2=""; 
 String url="upload/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）  //初始化  
 mySmartUpload.initialize(pageContext);  //只允许上载此类文件
 
 //定义允许上传文件类型 
mySmartUpload.setAllowedFilesList("jpg,jpeg,png,gif,PNG,GIF,JPEG,JPG,mp3,MP3,mp4,MP4,m4a"); 
//不允许上传文件类型 
mySmartUpload.setDeniedFilesList("jsp,asp,php,aspx,html,htm"); 
//单个文件最大限制 
mySmartUpload.setMaxFileSize(file_size_max); 
//总共上传文件限制 
mySmartUpload.setTotalMaxFileSize(file_size_max); 
//开始上传,如果超过限制或者为不允许类型，抛出异常提示 
mySmartUpload.setContentDisposition(null);
 
   
 try {  

 mySmartUpload.upload(); 
 
 } catch (Exception e){  
 %> 
 <SCRIPT language=javascript>
 alert("只允许上传mp4,mp3,jpg,jpeg,png,gif类型流媒体文件");  
 window.location='UP2.jsp?openid=<%=openid%>'; 
 </script>
 <% 
  }  
  try{
  com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0); 
  FileCounter fCounter=new FileCounter();
  String saveurl5=application.getRealPath("/")+url; 
 
 if (myFile.isMissing()){%> 
  <SCRIPT language=javascript>
 alert("请先选择要上传的文件");  
 window.location='sc.jsp?openid=<%=openid%>'; 
 </script>
 <%}else{
String myFilemyFileName=myFile.getFileName(); //取得上载的文件的原来的文件名
 ext= myFile.getFileExt(); //取得后缀名
if(ext.indexOf("m4a")!=-1){
  ext2="mp3";
}else{
  ext2=ext;
}
 
 int file_size=myFile.getSize(); //取得文件的大小
 String saveurl="";
 if(file_size<file_size_max){
 //更改文件名，取得当前上传时间的毫秒数值  
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis()); 
saveurl = "E:\\webapp\\jsp\\"+url;

System.out.println("dizhi:"+saveurl);
 saveurl+=filename+"."+ext2; //保存路径
 
 
 // String upper = TestString.upperStrToLowerStr(ext2);   //把后缀名中包含大写的字母转为小写
 //out.println(upper);
  String saveurl2=filename+"."+ext2;
  //上传
 myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
 
  //String saveurl3="http://v.yqcn.com:7001/yqfb/download/"+filename+"."+ext2;

String video1 = saveurl2;

String story = mySmartUpload.getRequest().getParameter("story");
String memo = mySmartUpload.getRequest().getParameter("memo");
String lb = mySmartUpload.getRequest().getParameter("lb");
//out.println("openid:"+openid);
//out.println("story:"+story);
//out.println("memo:"+memo);
//out.println("lb:"+lb);
//out.close();

//把图片和姓名电话写入数据库
	if(WeixinChaOpenId.ReImgesToDB10(video1,openid,lb,memo,story)){
		out.print("<script type=\"text/javascript\">alert('"+AllValus.title3+"');document.location.href='index.jsp?openid="+openid+"';</script>");
	}else{
    	out.print("<script type=\"text/javascript\">alert('"+AllValus.title4+"');document.location.href='UP2.jsp?openid="+openid+"';</script>");
	}





// out.print("上传文件成功<br>");
  
// out.print("<script>opener.document.form1.imageList.style.display=''</script>");
 //out.print("<script>opener.document.form1.imageList.src='"+saveurl3+"'</script>");
 //out.print("<script>opener.document.form1.img1.value='"+saveurl2+"'</script>");
 //out.print("<script>alert('上传照片成功!如果要更换照片请按加号！');</script>");
 
 
 //out.print("<textarea>http://info.yqcn.com/ms/Lmsc/uploadFiles/"+authority+"/"+saveurl2+"</textarea><button onclick=window.clipboardData.setData('text',this.previousSibling.value)><font color=red><h1>复制媒体地址用于播放等 ：-）。。。</h1></font></button> <br>");
//out.print("<br>");

 //out.print("原文件名： "+myFilemyFileName);
 //out.print("<script>window.close()</script>");
 
// out.print(saveurl);
// String ret = "parent.HtmlEdit.focus();";
// ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
// ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/download3/" + filename + "." + ext + "\">');" ;
 //ret += "range.pasteHTML('<img src=\"/uploadFiles/" + filename + "." + ext + "\">');" ;
// ret += "alert('上传成功！');"; 
 //ret += "window.location='upload.htm';";
// out.print("<script language=javascript>" + ret + "</script>");
 }else{
  out.print("<script language=javascript>alert('文件超过15Mb，请选择其他文件！');history.back();window.location.href=document.referrer;</script>");
 }  
 }  
 }catch (Exception e){
    out.print(e.toString());  
 }
%>   


<%



//out.println("openid="+openid);
//out.println("MediaId="+MediaId);
//System.out.println("xm="+xm);
//out.println("tel="+tel);

//String urlname ="mother/index_chk.jsp";
//String check=Topay.WxJsApiCheck4(urlname,openid);


//把图片和姓名电话写入数据库
//int bz=WeixinChaOpenId.ReImgesToDB(MediaId, openid,xm,tel,td,memo,bh);

//跳转到首页

//if(bz==2){
//out.print("<script type=\"text/javascript\">alert('同一个号码只能上传一次照片，您可以换号参赛。');document.location.href='index.jsp?openid="+openid+"';</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}else if(bz==1){
//out.print("<script type=\"text/javascript\">alert('您的照片已经上传成功，您的编号是"+bh+",请等待审核通过，谢谢,召唤小伙伴一起参加吧！');document.location.href='index.jsp?openid="+openid+"';</script>");

//out.println("<script>alert('您的照片已经上传成功，您的编号是"+bh+"！');</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}

%>

 
<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //是微信浏览器不做操作
	   
    }else{
	  // alert('not');
	  //非微信浏览器就因此显示列表等
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('非微信中打开！');
	  
	 
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
