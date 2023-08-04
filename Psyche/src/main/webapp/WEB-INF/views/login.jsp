<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form method="POST" action="/doLogin">
<table align=center>
<tr><td>로그인 아이디</td><td><input type=text name=logid></td></tr><br>
<tr><td>비 밀 번 호</td><td><input type=password name=pwd></td></tr><br>
<tr><td align=center colspan=2><input type=submit id=btnSubmit value="로그인">&nbsp;
		<a href="/">홈으로</a></td></tr>
</table>
</form>
</body>
</html>