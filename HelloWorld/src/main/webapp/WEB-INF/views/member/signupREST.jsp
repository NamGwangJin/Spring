<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<%@ include file="header.jsp" %>

<table align=center>
<caption><h1>회원가입</h1></caption>
<tbody>
<tr><td>로그인 아이디</td><td><input id=userid name=id></td></tr>
<tr><td>비밀번호</td><td><input type=password id=passcode1 name=pw></td></tr>
<tr><td>비밀번호 확인</td><td><input type=password id=passcode2 name=pw></td></tr>
<tr><td>실명</td><td><input id=name name=name></td></tr>
<tr><td>모바일번호</td><td><input type=text id=mobile name=mobile></td></tr>
<tr><td>생년월일</td><td><input type=date id=birthday name=bd id=birth></td></tr>
<tr><td>성별</td><td><input type=radio name=gender id=male value="남성">남성
					<input type=radio name=gender id=female value="여성">여성</td></tr>
<tr><td>관심분야</td>
	<td><input type=checkbox name=interest value="경제">경제
		<input type=checkbox name=interest value="사회">사회
		<input type=checkbox name=interest value="문화">문화<br>
		<input type=checkbox name=interest value="스포츠">스포츠
		<input type=checkbox name=interest value="국제">국제
		<input type=checkbox name=interest value="자연">자연<br>
		<input type=checkbox name=interest value="우주">우주
		<input type=checkbox name=interest value="환경">환경
		<input type=checkbox name=interest value="기타">기타
	</td>
<tr><td>지역</td>
	<td><select name=region size=4 multiple id=region>
		<option value='일산동구'>일산동구</option>
		<option value='일산서구'>일산서구</option>
		<option value='덕양구'>덕양구</option>
	</select>
</tr>
<tr><td colspan=2 align=center>
	<input type=button id=btnSubmit value="가입">&nbsp;
	<input type=button id=btnReset value='비우기'>
	</td></tr>
</tbody>
</table>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btnSubmit',function(){
	if ( $('#userid').val() == '' ) {
		alert('아이디가 입력되지 않았습니다.');
		return false;
	}
	if ( $('#passcode1').val() == '' || $('#passcode2').val() == '') {
		alert('비밀번호가 입력되지 않았습니다.');
		return false;
	}
	if ( $('#passcode1').val() != $('#passcode2').val() ) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	if ( $('#name').val() == '' ) {
		alert('실명이 입력되지 않았습니다.');
		return false;
	}
	if ( $('#mobile').val() == '' ) {
		alert('모바일번호가 입력되지 않았습니다.');
		return false;
	}
	let bd = $('#birthday').val();
	console.log(bd);
	if ( bd == '' ) {
		alert('생년월일이 선택되지 않았습니다.');
		return false;
	}
    let gender='';
    $('input[name=gender]:checked').each(function(){
        gender=$(this).attr('id');
    })
    if(gender==''){
        alert('성별을 선택하시오'); 
        return false;
    }
    document.location="/bemember/"+ $('#userid').val() + "/" + $('#passcode1').val() +
    					"/" + $('#name').val() + "/" + $('#mobile').val() + "/" + $('#birthday').val()
    					+ "/" + $('input[name=gender]').val();
    return true;
})
;
</script>
</html>