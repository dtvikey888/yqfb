<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="org.fjw.weixin.util.FileCounter"%>
<%@page import="org.liufeng.course.util.ThumbTest"%>
<%@page import="org.fjw.weixin.util.DeleteFileUtil"%>

<!-- 先搞定上传 -->
<%
String bzlopenid = request.getParameter("bzlopenid");

SmartUpload mySmartUpload =new SmartUpload();  


long file_size_max=5000000;    //5M
String fileName2="",ext="",testvar=""; 
 String url="download3/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）  //初始化  
 mySmartUpload.initialize(pageContext);  //只允许上载此类文件  
 try {  
 mySmartUpload.setAllowedFilesList("jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG");//此处的文件格式可以根据需要自己修改  //上载文件 
 mySmartUpload.upload(); 
 
 } catch (Exception e){  
 %> 
 <SCRIPT language=javascript>
 alert("只允许上传jpg,gif类型流媒体文件");  
 window.location='tj.jsp?openid=<%=bzlopenid%>'; 
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
 window.location='tj.jsp?openid=<%=bzlopenid%>';
 </script>
 <%}  
 
 
 else{
String myFilemyFileName=myFile.getFileName(); //取得上载的文件的原来的文件名
 ext= myFile.getFileExt(); //取得后缀名

 
 int file_size=myFile.getSize(); //取得文件的大小
 String saveurl="";
 if(file_size<file_size_max){
 //更改文件名，取得当前上传时间的毫秒数值  
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis()); 
saveurl = "D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\"+url;

System.out.println("dizhi:"+saveurl);
saveurl+=filename+"."+ext; //保存路径
 
 
 // String upper = TestString.upperStrToLowerStr(ext);   //把后缀名中包含大写的字母转为小写
 //out.println(upper);
 String saveurl2=filename+"."+ext;
 
  //上传
 myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
 
  //String saveurl3="http://v.yqcn.com:7001/yqfb/download/"+filename+"."+ext;

String img1 = saveurl2;
String xm = mySmartUpload.getRequest().getParameter("xm");
String tel = mySmartUpload.getRequest().getParameter("tel");
String dz = mySmartUpload.getRequest().getParameter("dz");
String memo = mySmartUpload.getRequest().getParameter("memo");
System.out.println(tel);
System.out.println(memo);


System.out.println("压缩前图片文件名:"+img1);

String fromPicName = "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download3/"+img1;

//压缩突破前生成新的图片地址
 //更改文件名，取得当前上传时间的毫秒数值  
String img2 = "ys"+img1;
String toPicName =  "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download3/"+img2;


//压缩图片处理
ThumbTest Ys = new ThumbTest();
Ys.testHandlePicture2(fromPicName,toPicName);

System.out.println("压缩后图片文件名:"+img2);

//把压缩后的图片和姓名电话写入数据库
WeixinChaOpenId.ReImgesToDB6(img2,bzlopenid,xm,tel,dz,memo);

//删除原图
System.out.println("删除原图:"+fromPicName);
DeleteFileUtil.deleteFile(fromPicName);

//if(bz==2){
//out.print("<script type=\"text/javascript\">alert('还没人给你助力,所以不能上传和抽奖!快去拉人赞助你吧！');document.location.href='cj_chk.jsp?bzlopenid="+openid+"';</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}else if(bz==1){
//out.print("<script type=\"text/javascript\">alert('您的装修照片上传成功，进入抽奖！');document.location.href='cjym.jsp?openid="+bzlopenid+"&tel="+tel+"&img1="+img2+"&memo="+memo+"';</script>");

out.println("<script>window.location.href='dz.jsp?bzlopenid="+bzlopenid+"'</script>");

//out.println("<script>alert('您的照片已经上传成功，您的编号是"+bh+"！');</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}


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
  	out.print("<script language=javascript>alert('文件超过5Mb，请选择其他图片！');history.back();window.location.href=document.referrer;</script>");
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
