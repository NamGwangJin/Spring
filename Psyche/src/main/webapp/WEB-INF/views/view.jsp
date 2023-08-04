<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View List</title>
</head>
<style>
table { border-collapse:collapse; }
td {border:1px solid blue; }
</style>
<body>
<input type=button id=btnlist value="목록보기">
<br><br>
<table id=tblList></table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btnlist',function(){
/* 	$.post('/list',{},function(data){
		for(let i=0; i<data.length; i++) {
			let obj = data[i];
			let str = '<tr><td>' + obj['menu'] + '</td><td>' + obj['price'] + '</td></tr>';
			$('#tblList').append(str);
		}
	},'json'); */
	
 	$.ajax( {url:'/list', data:{}, type:'post', dataType:'json', 
		success: function(data) {
			for(let i=0; i<data.length; i++) {
				let obj = data[i];
				let str = '<tr><td>' + obj['menu'] + '</td><td>' + obj['price'] + '</td></tr>';
				$('#tblList').append(str);
			}
		},
		error: function() {
			alert('ajax call failed !!!');
		}
	})
});
</script>
</html>