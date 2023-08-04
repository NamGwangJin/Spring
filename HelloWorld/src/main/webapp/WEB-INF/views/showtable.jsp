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
	int row = Integer.parseInt(request.getParameter("row"));
	int col = Integer.parseInt(request.getParameter("col"));
	
	String table = "<table border=1 style='border-collapse:collapse;width:500px;height:500px;'>";
	for (int x=0; x<row; x++) {
		table += "<tr>";
		for (int y=0; y<col; y++) {
			table += "<td></td>";
		}
		table += "</tr>";
	}
	out.print(table+"</table>");
	out.print("<h1><a href='javascript:history.go(-1)'>다시</a></h1>");
%>
</body>
</html>