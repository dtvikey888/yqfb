<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="org.fjw.weixin.util.FileCounter"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

<!-- �ȸ㶨�ϴ� -->
<%
String openid = request.getParameter("openid");
//System.out.println("sc_chk2.jsp openid="+openid);

SmartUpload mySmartUpload =new SmartUpload();  
long file_size_max=80000000;    //80M
String fileName2="",ext="",testvar="",ext2=""; 
 String url="upload/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ��ڣ�Ҳ����˵��Ҫ�Լ�������Ӧ���ļ��У�  //��ʼ��  
 mySmartUpload.initialize(pageContext);  //ֻ�������ش����ļ�
 
 //���������ϴ��ļ����� 
mySmartUpload.setAllowedFilesList("jpg,jpeg,png,gif,PNG,GIF,JPEG,JPG,mp3,MP3,mp4,MP4,m4a"); 
//�������ϴ��ļ����� 
mySmartUpload.setDeniedFilesList("jsp,asp,php,aspx,html,htm"); 
//�����ļ�������� 
mySmartUpload.setMaxFileSize(file_size_max); 
//�ܹ��ϴ��ļ����� 
mySmartUpload.setTotalMaxFileSize(file_size_max); 
//��ʼ�ϴ�,����������ƻ���Ϊ���������ͣ��׳��쳣��ʾ 
mySmartUpload.setContentDisposition(null);
 
   
 try {  

 mySmartUpload.upload(); 
 
 } catch (Exception e){  
 %> 
 <SCRIPT language=javascript>
 alert("ֻ�����ϴ�mp4,mp3,jpg,jpeg,png,gif������ý���ļ�");  
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
 alert("����ѡ��Ҫ�ϴ����ļ�");  
 window.location='sc.jsp?openid=<%=openid%>'; 
 </script>
 <%}else{
String myFilemyFileName=myFile.getFileName(); //ȡ�����ص��ļ���ԭ�����ļ���
 ext= myFile.getFileExt(); //ȡ�ú�׺��
if(ext.indexOf("m4a")!=-1){
  ext2="mp3";
}else{
  ext2=ext;
}
 
 int file_size=myFile.getSize(); //ȡ���ļ��Ĵ�С
 String saveurl="";
 if(file_size<file_size_max){
 //�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ  
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis()); 
saveurl = "E:\\webapp\\jsp\\"+url;

System.out.println("dizhi:"+saveurl);
 saveurl+=filename+"."+ext2; //����·��
 
 
 // String upper = TestString.upperStrToLowerStr(ext2);   //�Ѻ�׺���а�����д����ĸתΪСд
 //out.println(upper);
  String saveurl2=filename+"."+ext2;
  //�ϴ�
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

//��ͼƬ�������绰д�����ݿ�
	if(WeixinChaOpenId.ReImgesToDB10(video1,openid,lb,memo,story)){
		out.print("<script type=\"text/javascript\">alert('"+AllValus.title3+"');document.location.href='index.jsp?openid="+openid+"';</script>");
	}else{
    	out.print("<script type=\"text/javascript\">alert('"+AllValus.title4+"');document.location.href='UP2.jsp?openid="+openid+"';</script>");
	}





// out.print("�ϴ��ļ��ɹ�<br>");
  
// out.print("<script>opener.document.form1.imageList.style.display=''</script>");
 //out.print("<script>opener.document.form1.imageList.src='"+saveurl3+"'</script>");
 //out.print("<script>opener.document.form1.img1.value='"+saveurl2+"'</script>");
 //out.print("<script>alert('�ϴ���Ƭ�ɹ�!���Ҫ������Ƭ�밴�Ӻţ�');</script>");
 
 
 //out.print("<textarea>http://info.yqcn.com/ms/Lmsc/uploadFiles/"+authority+"/"+saveurl2+"</textarea><button onclick=window.clipboardData.setData('text',this.previousSibling.value)><font color=red><h1>����ý���ַ���ڲ��ŵ� ��-��������</h1></font></button> <br>");
//out.print("<br>");

 //out.print("ԭ�ļ����� "+myFilemyFileName);
 //out.print("<script>window.close()</script>");
 
// out.print(saveurl);
// String ret = "parent.HtmlEdit.focus();";
// ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
// ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/download3/" + filename + "." + ext + "\">');" ;
 //ret += "range.pasteHTML('<img src=\"/uploadFiles/" + filename + "." + ext + "\">');" ;
// ret += "alert('�ϴ��ɹ���');"; 
 //ret += "window.location='upload.htm';";
// out.print("<script language=javascript>" + ret + "</script>");
 }else{
  out.print("<script language=javascript>alert('�ļ�����15Mb����ѡ�������ļ���');history.back();window.location.href=document.referrer;</script>");
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


//��ͼƬ�������绰д�����ݿ�
//int bz=WeixinChaOpenId.ReImgesToDB(MediaId, openid,xm,tel,td,memo,bh);

//��ת����ҳ

//if(bz==2){
//out.print("<script type=\"text/javascript\">alert('ͬһ������ֻ���ϴ�һ����Ƭ�������Ի��Ų�����');document.location.href='index.jsp?openid="+openid+"';</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}else if(bz==1){
//out.print("<script type=\"text/javascript\">alert('������Ƭ�Ѿ��ϴ��ɹ������ı����"+bh+",��ȴ����ͨ����лл,�ٻ�С���һ��μӰɣ�');document.location.href='index.jsp?openid="+openid+"';</script>");

//out.println("<script>alert('������Ƭ�Ѿ��ϴ��ɹ������ı����"+bh+"��');</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}

%>

 
<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
    }else{
	  // alert('not');
	  //��΢��������������ʾ�б��
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('��΢���д򿪣�');
	  
	 
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
