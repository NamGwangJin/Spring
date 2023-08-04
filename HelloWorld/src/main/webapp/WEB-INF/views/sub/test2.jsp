<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sub/test2</title>
</head>
<body>
<h1><a href="index.html">홈으로 이동</a></h1>
<a href="testone">test one으로 이동</a>
<%
	String id = request.getParameter("name");
	out.print("name : "+ id);
%>
</body>
</html>