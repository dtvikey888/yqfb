<%@ page contentType="text/html;charset=gb2312" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<jsp:directive.page import="org.fjw.weixin.util.FileCounter"/>
<%  
SmartUpload mySmartUpload =new SmartUpload();  
long file_size_max=800000;    //800k
String fileName2="",ext="",testvar=""; 
 String url="download7/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）  //初始化  
 mySmartUpload.initialize(pageContext);  //只允许上载此类文件  
 try {  
 mySmartUpload.setAllowedFilesList("jpg,gif,png,JPG,GIF,PNG");//此处的文件格式可以根据需要自己修改  //上载文件 
 mySmartUpload.upload(); 
 } catch (Exception e){  
 %> 
 <SCRIPT language=javascript>
 alert("只允许上传jpg,gif,png类型流媒体文件");  
 window.location='upload.htm'; 
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
 window.location='upload.htm'; 
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
//saveurl=application.getRealPath("/")+url; 
//saveurl = "D:\\ms\\asp\\mountain\\"+url;
//saveurl = "D:\\yqxz\\乡镇网站\\yqds\\"+url;
//saveurl = "D:\\jsp\\yqfb\\"+url;
saveurl = "D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\"+url;

System.out.println("dizhi:"+saveurl);
 saveurl+=filename+"."+ext; //保存路径
 
 
 // String upper = TestString.upperStrToLowerStr(ext);   //把后缀名中包含大写的字母转为小写
 //out.println(upper);
  String saveurl2=filename+"."+ext;
  //上传
 myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
 
  String saveurl3="http://v.yqcn.com/bmwj/asp/sxbook/download7/"+filename+"."+ext;

 out.print("上传文件成功<br>");
  
 out.print("<script>opener.document.form1.imageList.style.display=''</script>");
 out.print("<script>opener.document.form1.imageList.src='"+saveurl3+"'</script>");
 out.print("<script>opener.document.form1.img1.value='"+saveurl2+"'</script>");
 out.print("<script>alert('上传照片成功!如果要更换照片请按加号！');</script>");
 
 
 //out.print("<textarea>http://info.yqcn.com/ms/Lmsc/uploadFiles/"+authority+"/"+saveurl2+"</textarea><button onclick=window.clipboardData.setData('text',this.previousSibling.value)><font color=red><h1>复制媒体地址用于播放等 ：-）。。。</h1></font></button> <br>");
//out.print("<br>");

 out.print("原文件名： "+myFilemyFileName);
 out.print("<script>window.close()</script>");
 
// out.print(saveurl);
 String ret = "parent.HtmlEdit.focus();";
 ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
 ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/download7/" + filename + "." + ext + "\">');" ;
 //ret += "range.pasteHTML('<img src=\"/uploadFiles/" + filename + "." + ext + "\">');" ;
 ret += "alert('上传成功！');"; 
 ret += "window.location='upload.htm';";
 out.print("<script language=javascript>" + ret + "</script>");
 }else{
  out.print("<script language=javascript>alert('文件超过800K，请尽量压缩，否则会严重影响速度！');history.back();window.location.href=document.referrer;</script>");
 }  
 }  
 }catch (Exception e){
    out.print(e.toString());  
 }
%>   