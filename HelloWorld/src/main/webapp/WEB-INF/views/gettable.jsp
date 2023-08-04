<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Table</title>
</head>
<body>
<form action="/showtable" method="get" id="showform">
테이블의 행 <input type=number name=row id=row style="width:30px"><br>
테이블의 열 <input type=number name=col id=col style="width:30px"><br><br>
<input type=submit id=btnSubmit value="전송">
</form>
<h1><a href='index.html'>홈으로 이동</a></h1>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#showform',function(){
	if ( $('#row').val() == '' || $('#row').val() == null || $('#row').val() < 1 ) {
		alert('입력된 행 수가 없거나 1보다 작습니다.');
		return false;
	}
	if ( $('#col').val() == '' || $('#col').val() == null || $('#col').val() < 1 ) {
		alert('입력된 열 수가 없거나 1보다 작습니다.');
		return false;
	}
	return true;
})
;
</script>
</html>