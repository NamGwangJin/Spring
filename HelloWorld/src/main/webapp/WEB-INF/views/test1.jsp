<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><a href="index.html">홈으로 이동</a></h1>
<a href='testtwo?name=홍길동'>test two로 이동</a><br><br>
<!-- 웹페이지가 최초로 load될 때 한 번만 실행 restart하면 초기화 -->
<%!
	String showTable(int td, int tr) {
		String table ="<table border=1 style='border-collapse:collapse;width:500px;height:500px;'>";
		
		for (int x=0; x<tr; x++){
			table += "<tr>";
			for (int y=0; y<td; y++){
				table += "<td></td>";
			}
			table += "</tr>";
		}
		
		return table += "</table>";
	}
%>
<%
	out.print("<br>" + showTable(5,5));
%>
</body>
</html>