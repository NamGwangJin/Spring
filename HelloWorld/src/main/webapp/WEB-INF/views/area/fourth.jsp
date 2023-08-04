<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fourth</title>
</head>
<body>
<%
	out.print("Fourth Page<br>");
	out.print("page 변수 : " + pageContext.getAttribute("name") + "<br>");
	out.print("request 변수 : " + request.getAttribute("name") + "<br>");
	out.print("session 변수 : " + session.getAttribute("name") + "<br>");
	out.print("application 변수 : " + application.getAttribute("name"));
%>
<h2><a href="index.html">홈으로 이동</a></h2>
</body>
</html>