<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
Cookie cookie = null;
   Cookie[] cookies = null;
   // ��ȡcookies������,��һ������
   cookies = request.getCookies();
   if( cookies != null ){
   
      for (int i = 0; i < 1; i++){
         cookie = cookies[i];
         out.println("������ : " + cookie.getName());
         out.println("����ֵ : " + cookie.getValue());

      }
}

String name1 = request.getParameter("name1");
String headimg = request.getParameter("headimg");

out.println(name1);
out.println(headimg);

%>