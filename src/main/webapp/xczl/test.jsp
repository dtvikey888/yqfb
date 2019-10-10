<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
Cookie cookie = null;
   Cookie[] cookies = null;
   // 获取cookies的数据,是一个数组
   cookies = request.getCookies();
   if( cookies != null ){
   
      for (int i = 0; i < 1; i++){
         cookie = cookies[i];
         out.println("参数名 : " + cookie.getName());
         out.println("参数值 : " + cookie.getValue());

      }
}

String name1 = request.getParameter("name1");
String headimg = request.getParameter("headimg");

out.println(name1);
out.println(headimg);

%>