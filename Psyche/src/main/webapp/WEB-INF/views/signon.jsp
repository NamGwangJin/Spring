<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id=tblSignon>
<tr>
	<td>로그인 아이디</td><td><input type=text id=userid></td>
</tr>
<tr>
	<td>비밀번호</td><td><input type=password id=passcode></td>
</tr>
<tr>
	<td colspan=2 align=center>
		<input type=button id=btnsend value="SignOn">
	</td>
</tr>
</table>
<label id=result> </label>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btnsend',function(){
$.post('/signon',{ userid : $('#userid').val(), pw : $('#passcode').val() },
		function(data) {
			$('#result').text(data);
		}, 'text')
		return false;
})
</script>
</html>