<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/showfour" method="get" id=showform>
x <input type=number name=x id=x style="width:30px"><br>
y <input type=number name=y id=y style="width:30px"><br><br>
<input type=submit id=btnSubmit value="전송">
<h1><a href='index.html'>홈으로 이동</a></h1>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#showform',function(){
	if( $('#x').val() == '' || $('#x').val() == null ) {
		alert('x값이 입력되지 않았습니다.');
		return false;
	}
	if( $('#y').val() == '' || $('#y').val() == null ) {
		alert('y값이 입력되지 않았습니다.');
		return false;
	}
	return true;
})
;
</script>
</html>