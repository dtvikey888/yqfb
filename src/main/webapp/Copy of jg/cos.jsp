<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/yqfb/CosUploadServlet" ENCTYPE="multipart/form-data">
			<table>
				<tr><td><input type="text" name="subject" /></td></tr>
				<tr><td><input type="file" name="file1"/></td></tr>
				<tr><td><input type="file" name="file2"/></td></tr>
				<tr><td><input type="file" name="file3"/></td></tr>
				<tr><td><input type="submit" value="上传"/></td></tr>
			</table>  		
  		</form>
  		<br/>
  		<a href="/yqfb/CosDownloadServlet">下载</a>
</body>
</html>