<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가</title>
</head>
<style>
table { border-collapse : collapse;}
td,th { border : 1px solid blue; }
th {color:yellow; background-color:black; }
</style>
<body>
<form method="post" action="/insert">
메뉴명 : <input type=text name=name><br>
가격 : <input type=number name=price><br>
<input type=submit value='add'><br><br><br>
</form>
<table id=tblMenu>
<thead>
<tr><th>메뉴번호</th><th>메뉴명</th><th>가격</th></tr>
</thead>
<tbody>
<c:forEach items="${menuList}" var="menu">
<tr><td>${menu.seq}</td><td>${menu.name}</td><td>${menu.price}</td></tr>
</c:forEach>
</tbody>
</table>
</body>
</html>