<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First</title>
</head>
<body>
<%
	pageContext.setAttribute("name","page man");
	request.setAttribute("name","request man");
	session.setAttribute("name","session man");
	application.setAttribute("name","application man");
	
	out.print("first Page<br>");
	out.print("page 변수 : " + pageContext.getAttribute("name") + "<br>");
	out.print("request 변수 : " + request.getAttribute("name") + "<br>");
	out.print("session 변수 : " + session.getAttribute("name") + "<br>");
	out.print("application 변수 : " + application.getAttribute("name"));
	
	request.getRequestDispatcher("second.jsp").forward(request, response);
%>
<h2><a href="second">second page로 이동</a></h2>
</body>
</html>