<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	
	out.print("더하기 : " + x + "+" + y + "=" + (x+y) + "<br>");
	out.print("빼기 : " + x + "-" + y + "=" + (x-y) + "<br>");
	out.print("곱하기 : " + x + "X" + y + "=" + (x*y) + "<br>");
	out.print("나누기 : " + x + "/" + y + "=" + (x/y) + "<br>");
	out.print("<h1><a href='javascript:history.go(-1)'>다시</a></h1>");
%>
</body>
</html>