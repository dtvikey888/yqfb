<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="org.fjw.weixin.util.FileCounter"%>
<%@page import="org.liufeng.course.util.ThumbTest"%>
<%@page import="org.fjw.weixin.util.DeleteFileUtil"%>

<!-- �ȸ㶨�ϴ� -->
<%
String bzlopenid = request.getParameter("bzlopenid");

SmartUpload mySmartUpload =new SmartUpload();  


long file_size_max=5000000;    //5M
String fileName2="",ext="",testvar=""; 
 String url="download3/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ��ڣ�Ҳ����˵��Ҫ�Լ�������Ӧ���ļ��У�  //��ʼ��  
 mySmartUpload.initialize(pageContext);  //ֻ�������ش����ļ�  
 try {  
 mySmartUpload.setAllowedFilesList("jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG");//�˴����ļ���ʽ���Ը�����Ҫ�Լ��޸�  //�����ļ� 
 mySmartUpload.upload(); 
 
 } catch (Exception e){  
 %> 
 <SCRIPT language=javascript>
 alert("ֻ�����ϴ�jpg,gif������ý���ļ�");  
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
 alert("����ѡ��Ҫ�ϴ����ļ�");
 window.location='tj.jsp?openid=<%=bzlopenid%>';
 </script>
 <%}  
 
 
 else{
String myFilemyFileName=myFile.getFileName(); //ȡ�����ص��ļ���ԭ�����ļ���
 ext= myFile.getFileExt(); //ȡ�ú�׺��

 
 int file_size=myFile.getSize(); //ȡ���ļ��Ĵ�С
 String saveurl="";
 if(file_size<file_size_max){
 //�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ  
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis()); 
saveurl = "D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\"+url;

System.out.println("dizhi:"+saveurl);
saveurl+=filename+"."+ext; //����·��
 
 
 // String upper = TestString.upperStrToLowerStr(ext);   //�Ѻ�׺���а�����д����ĸתΪСд
 //out.println(upper);
 String saveurl2=filename+"."+ext;
 
  //�ϴ�
 myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
 
  //String saveurl3="http://v.yqcn.com:7001/yqfb/download/"+filename+"."+ext;

String img1 = saveurl2;
String xm = mySmartUpload.getRequest().getParameter("xm");
String tel = mySmartUpload.getRequest().getParameter("tel");
String dz = mySmartUpload.getRequest().getParameter("dz");
String memo = mySmartUpload.getRequest().getParameter("memo");
System.out.println(tel);
System.out.println(memo);


System.out.println("ѹ��ǰͼƬ�ļ���:"+img1);

String fromPicName = "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download3/"+img1;

//ѹ��ͻ��ǰ�����µ�ͼƬ��ַ
 //�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ  
String img2 = "ys"+img1;
String toPicName =  "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download3/"+img2;


//ѹ��ͼƬ����
ThumbTest Ys = new ThumbTest();
Ys.testHandlePicture2(fromPicName,toPicName);

System.out.println("ѹ����ͼƬ�ļ���:"+img2);

//��ѹ�����ͼƬ�������绰д�����ݿ�
WeixinChaOpenId.ReImgesToDB6(img2,bzlopenid,xm,tel,dz,memo);

//ɾ��ԭͼ
System.out.println("ɾ��ԭͼ:"+fromPicName);
DeleteFileUtil.deleteFile(fromPicName);

//if(bz==2){
//out.print("<script type=\"text/javascript\">alert('��û�˸�������,���Բ����ϴ��ͳ齱!��ȥ����������ɣ�');document.location.href='cj_chk.jsp?bzlopenid="+openid+"';</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}else if(bz==1){
//out.print("<script type=\"text/javascript\">alert('����װ����Ƭ�ϴ��ɹ�������齱��');document.location.href='cjym.jsp?openid="+bzlopenid+"&tel="+tel+"&img1="+img2+"&memo="+memo+"';</script>");

out.println("<script>window.location.href='dz.jsp?bzlopenid="+bzlopenid+"'</script>");

//out.println("<script>alert('������Ƭ�Ѿ��ϴ��ɹ������ı����"+bh+"��');</script>");
//response.sendRedirect("index.jsp?openid="+openid);
//}


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
  	out.print("<script language=javascript>alert('�ļ�����5Mb����ѡ������ͼƬ��');history.back();window.location.href=document.referrer;</script>");
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
