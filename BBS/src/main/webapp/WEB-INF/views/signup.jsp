<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body style="background-color:ivory;">
<h1 style='text-align:center'>회 원 가 입</h1>
<table align=center>
<tr><td>로그인 아이디</td><td><input type=text name=logid id=logid></td></tr><br>
<tr><td>비 밀 번 호</td><td><input type=password id=pass1 name=pwd></td></tr><br>
<tr><td>비밀번호 확인</td><td><input type=password id=pass2 name=pwd></td></tr><br>
<tr><td align=center colspan=2><input type=button id=signup value="가입" style='background-color:blanchedalmond;font-weight:bold;'>&nbsp;
<a href="/">홈으로</a></td></tr>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#signup',function(){
	if ($('#logid').val() == '') {
		alert("아이디가 입력되지 않았습니다.");
		return false;
	}
	if ($('#pass1').val() != $('#pass2').val()) {
		alert('비밀번호와 비밀번호 확인이 같지 않습니다.');
		return false;
	} else if ($('#pass1').val()=='' || $('#pass2').val()==''){
		alert('비밀번호가 입력되지 않았습니다.');
		return false;
	}
	$.ajax({url:'/signUpOk', data:{ id : $('#logid').val(), pw : $('#pass1').val() }, type:'post', dataType:'json',
		success: function(data){
			if(data=="1"){
				alert('회원가입 완료 ! 로그인 창으로 이동합니다.');
				document.location = "/login";
			} else {
				alert('중복된 아이디가 있습니다. 다른 아이디를 입력해주세요.');
				return false;
			}
		},
		error : function(){
			alert('회원 가입 중 오류가 발생했습니다. 다시 시도해 주세요.');
			return false;
		}
	})
})
</script>
</html>