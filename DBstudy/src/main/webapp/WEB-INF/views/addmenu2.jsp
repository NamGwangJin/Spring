<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
</head>
<style>
table { border-collapse : collapse;}
td,th { border : 1px solid blue; }
th {color:yellow; background-color:black; }
</style>
<body>
메뉴명 : <input type=text id=name><br>
가격 : <input type=number id=price><br>
<input type=button id=btnAdd value='add'><br><br>
<form method='post' action='/delete' id='numForm'>
<input type=text name=num placeholder='삭제할 번호 입력 (form 방식)'>
<input type=submit id=btnDel value='delete'>
</form><br><br><br>
<table id=tblMenu>
<thead>
<tr><th>메뉴번호</th><th>메뉴명</th><th>가격</th></tr>
</thead>
<tbody>
</tbody>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	getList();
})
.on('click','#btnAdd',function(){
	$('#tblMenu').html('<thead><tr><th>메뉴번호</th><th>메뉴명</th><th>가격</th></tr></thead><tbody></tbody>');
	$.ajax( {url : '/insert2', data : { name : $('#name').val(), price : $('#price').val() }, type:'post', dataType:'text', 
		success: function(data) {
				if(data=="1"){
					getList();
				}
		},
		error: function(){
			alert('error!!');
		}
	})
	$('#name').val('');
	$('#price').val('');
})

.on('submit','#numForm',function(){
	return true;
})

function getList() {
	$.ajax({url:'/getList', data:{}, type:'post',dataType:'json',
		success: function(data) {
			for(let i=0; i<data.length; i++){
				let obj = data[i];
				let str = '<tr><td>' + obj['num'] + '</td><td>' + obj['name'] + '</td><td>' + obj['price'] + '</td></tr>';
				$('#tblMenu').append(str);
			}
		},
		error: function(){
			alert('error!!');
		}
	})
}
</script>
</html>