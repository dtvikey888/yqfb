<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%

//String openid= (String)session.getAttribute("state_session");
//String id_sjk = MyUtils24.GetId(openid);

String id1 = request.getParameter("id1");
String id2 = request.getParameter("id2");

//out.println(id1);
//out.println(id2);
//out.println(MyUtils24.IsXy(id1,id2));
//out.close();

String op = MyUtils24.GetOpenid(id1);


if(id1!=null&&id2!=null){

int bz =  MyUtils24.Zl(id1,id2);

if(bz==1){

    out.println("<script>alert('������Ӧ�Լ���');history.back();</script>");
    
}else if(bz==2){
    
    out.println("<script>alert('��Ҫ�ظ���Ӧ��');history.back();window.location.href=document.referrer;</script>");
    
}else if(bz==3){

   out.println("<script>alert('��Ӧ�ɹ���');window.location.href='index.jsp?id="+id1+"&id2="+id1+"&share=1&state=3&op="+op+"'</script>");
   
}else{

  out.println("<script>alert('���绺��,���������ԣ�');window.location.href='index.jsp?id="+id1+"&id2="+id1+"&share=1&state=3&op="+op+"'</script>");
  //out.println("<script>alert('�������');history.back();window.location.href=document.referrer;</script>");
  
}


}else{

   out.println("<script>alert('���绺��,���������ԣ�');window.location.href='index.jsp?id="+id1+"&id2="+id1+"&share=1&state=3&op="+op+"'</script>");
  //out.println("<script>alert('�������');history.back();window.location.href=document.referrer;</script>");
  
}


%>