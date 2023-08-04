<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<!-- <form id=frmLogin method="post" action="/doLogin"> -->
로그인 아이디 : <input type=text name=userid id=userid><br>
비 밀 번 호  : <input type=text name=passcode id=passcode><br>
<input type=button value="로그인" id="login">
<!-- </form> -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#login',function(){
	document.location = "/doLogin" + "/" + $('#userid').val() + "/" + $('#passcode').val();
})
</script>
</body>
</html>