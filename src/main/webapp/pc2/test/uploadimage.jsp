<%@ page contentType="text/html;charset=gb2312" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<jsp:directive.page import="org.fjw.weixin.util.FileCounter"/>
<%  
SmartUpload mySmartUpload =new SmartUpload();  
long file_size_max=800000;    //800k
String fileName2="",ext="",testvar=""; 
 String url="download7/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ��ڣ�Ҳ����˵��Ҫ�Լ�������Ӧ���ļ��У�  //��ʼ��  
 mySmartUpload.initialize(pageContext);  //ֻ�������ش����ļ�  
 try {  
 mySmartUpload.setAllowedFilesList("jpg,gif,png,JPG,GIF,PNG");//�˴����ļ���ʽ���Ը�����Ҫ�Լ��޸�  //�����ļ� 
 mySmartUpload.upload(); 
 } catch (Exception e){  
 %> 
 <SCRIPT language=javascript>
 alert("ֻ�����ϴ�jpg,gif,png������ý���ļ�");  
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
 alert("����ѡ��Ҫ�ϴ����ļ�");  
 window.location='upload.htm'; 
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
//saveurl=application.getRealPath("/")+url; 
//saveurl = "D:\\ms\\asp\\mountain\\"+url;
//saveurl = "D:\\yqxz\\������վ\\yqds\\"+url;
//saveurl = "D:\\jsp\\yqfb\\"+url;
saveurl = "D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\"+url;

System.out.println("dizhi:"+saveurl);
 saveurl+=filename+"."+ext; //����·��
 
 
 // String upper = TestString.upperStrToLowerStr(ext);   //�Ѻ�׺���а�����д����ĸתΪСд
 //out.println(upper);
  String saveurl2=filename+"."+ext;
  //�ϴ�
 myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
 
  String saveurl3="http://v.yqcn.com/bmwj/asp/sxbook/download7/"+filename+"."+ext;

 out.print("�ϴ��ļ��ɹ�<br>");
  
 out.print("<script>opener.document.form1.imageList.style.display=''</script>");
 out.print("<script>opener.document.form1.imageList.src='"+saveurl3+"'</script>");
 out.print("<script>opener.document.form1.img1.value='"+saveurl2+"'</script>");
 out.print("<script>alert('�ϴ���Ƭ�ɹ�!���Ҫ������Ƭ�밴�Ӻţ�');</script>");
 
 
 //out.print("<textarea>http://info.yqcn.com/ms/Lmsc/uploadFiles/"+authority+"/"+saveurl2+"</textarea><button onclick=window.clipboardData.setData('text',this.previousSibling.value)><font color=red><h1>����ý���ַ���ڲ��ŵ� ��-��������</h1></font></button> <br>");
//out.print("<br>");

 out.print("ԭ�ļ����� "+myFilemyFileName);
 out.print("<script>window.close()</script>");
 
// out.print(saveurl);
 String ret = "parent.HtmlEdit.focus();";
 ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
 ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/download7/" + filename + "." + ext + "\">');" ;
 //ret += "range.pasteHTML('<img src=\"/uploadFiles/" + filename + "." + ext + "\">');" ;
 ret += "alert('�ϴ��ɹ���');"; 
 ret += "window.location='upload.htm';";
 out.print("<script language=javascript>" + ret + "</script>");
 }else{
  out.print("<script language=javascript>alert('�ļ�����800K���뾡��ѹ�������������Ӱ���ٶȣ�');history.back();window.location.href=document.referrer;</script>");
 }  
 }  
 }catch (Exception e){
    out.print(e.toString());  
 }
%>   