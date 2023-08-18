<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body style='background-color:ivory;'>
<c:if test="${id==''}">
<h2 style='color:red; text-align:center' id=check>입력하신 회원정보와 일치하는 데이터가 없습니다.<br>다시 시도해 주세요.</h2>
</c:if>
<h1 style='text-align:center'>LOG IN</h1>
<form method="POST" action="/loginOk" id="frmLogin">
<table align=center>
<tr><td>로그인 아이디</td><td><input type=text name=logid id=id></td></tr><br>
<tr><td>비 밀 번 호</td><td><input type=password name=pwd id=pw></td></tr><br>
<tr><td align=center colspan=2><input type=submit id=login value="로그인" style='background-color:blanchedalmond;font-weight:bold;'>&nbsp;
<a href="/home">홈으로</a></td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmLogin',function(){
	if($('#id').val() == '' || $('#pw').val() == '') {
		alert('아이디와 비밀번호를 입력해주세요.');
		return false;
	}
	return true;
})
</script>
</html>