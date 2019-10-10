<%@ page language="java" pageEncoding="gb2312"%>
<%
session.invalidate();

Cookie[] cookies=request.getCookies();

for(Cookie cookie: cookies){

cookie.setMaxAge(0);

cookie.setPath("/");

response.addCookie(cookie);

}

out.println("阿蒙阿蒙,已经帮你清空所有的cookie和session.");
%>