<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<style>
table { border-collapse:collapse; }
td { border:1px solid blue; }
</style>
<body>
<table width="80%" align=center>
<tr><td align=center><h1>Home Page</h1></td></tr>
<tr><td align=right>
<c:if test="${name == ''}">
	<a href="/login">로그인</a>&nbsp;&nbsp;
	<a href="/signup">회원가입</a>
</c:if>
<c:if test="${name != ''}">
	${name}님&nbsp;<a href="/logout">로그아웃</a>
</c:if>
</td></tr>
</table>
</body>
</html>