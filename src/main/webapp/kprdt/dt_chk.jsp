<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%

int c1 = new Integer(request.getParameter("c1"));
int c2 = new Integer(request.getParameter("c2"));
int c3 = new Integer(request.getParameter("c3"));
int c4 = new Integer(request.getParameter("c4"));
int c5 = new Integer(request.getParameter("c5"));
int c6 = new Integer(request.getParameter("c6"));
int c7 = new Integer(request.getParameter("c7"));
int c8 = new Integer(request.getParameter("c8"));
int c9 = new Integer(request.getParameter("c9"));
int c10 = new Integer(request.getParameter("c10"));

boolean bz = MyUtils24.save1(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10);


if(bz==true){

 out.println("<script>alert('答题正确，请留下联系方式！');window.location.href='tj.jsp'</script>");


}else{

   out.println("<script>alert('答题错误，重新答题！');window.location.href='index.jsp'</script>");

}


%>