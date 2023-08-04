<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
table { border-collapse:collapse; }
td { border:1px solid blue; }
</style>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if (id == null) id="";
	if (pw == null) pw="";
%>
<table style='width:100%'>
<tr>
	<td align=center><h1>웹사이트</h1></td>
</tr>
</table>
<form id=frmLogin align=center method=post action=/login>
<caption><h1>로그인</h1></caption>
<table align=center>
<tbody>
<tr style="height:50px;"><td>로그인 아이디</td><td><input name=id value="<%=id %>" type="text"></td></tr>
<tr style="height:50px;"><td>비 밀 번 호</td><td><input name=pw value="<%=pw %>" type="password"></td></tr>
<tr style="height:50px;"><td colspan=2 align=center><input type=submit value="로그인">
	<input type=reset value="비우기"><a href="/register">회원가입</a></td>
</tr>
</tbody>
</table>
</form>
</body>
</html>