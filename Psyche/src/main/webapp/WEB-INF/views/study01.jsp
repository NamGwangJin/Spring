<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table { border-collapse:collapse; }
td {border:1px solid blue; }
</style>
<body>
<input type=number id="num1" min="1" max="9"><br>
<input type=number id="num2" min="1" max="9"><br>
<input type=button value="result" id=btn><br>
<table id=answer>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btn',function(){
	$.post('/result', { num1 : $('#num1').val(), num2 : $('#num2').val() }, function(data){
		let q = $('#num1').val() + " x " + $('#num2').val() + " + " + $('#num1').val() + $('#num2').val() + " = "
		answer = '<tr><td>' + q + data + '</td></tr>'
		$('#answer').append(answer);
	}, 'text')
})
</script>
</html>