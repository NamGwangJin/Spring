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
<input type=hidden id=menu_no>
메뉴명 : <input type=text id=name><br>
가격 : <input type=number id=price><br><br>
<input type=button id=btnAdd value='추가/변경'>
<input type=button id=btnDelete value='삭제'>
<input type=button id=btnUpdate value='변경(prompt 방식)'>
<form method='post' action='/formDelete' id='numForm'>
<input type=hidden name=num placeholder='삭제할 번호 입력 (form 방식)'>
<input type=hidden id=btnDel value='delete'>
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
	if($('#menu_no').val() == '') {
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
	} else {
		$.ajax({url : '/update', data : { num : $('#menu_no').val(), name : $('#name').val(), price : $('#price').val() },
			   type : 'post', dataType : 'text',
			   success: function(data) {
				   if(data == "1") {
					   getList();
				   }
			   }, error: function(){
				   alert('error!');
			   }
		})
	}
})

.on('submit','#numForm',function(){
	return true;
})

.on('click','tr',function(){
	$('#menu_no').val($(this).find('td:eq(0)').text());
	$('#name').val($(this).find('td:eq(1)').text());
	$('#price').val($(this).find('td:eq(2)').text());
	return false;
})

.on('click','#btnDelete',function(){
	$.ajax({url:'/delete', data:{ num : $('#menu_no').val() }, type:'post',dataType:'text',
		success: function(data) {
			if(data == "1"){
				getList();
			}
		},
		error: function(){
			alert('error!!');
		}
	})
})

.on('click','#btnUpdate',function(){
	let name = prompt("변경할 메뉴명을 입력해주세요.");
	let price = prompt('변경할 메뉴의 가격을 입력해주세요');
	$.ajax({url:'/update', data:{ num : $('#menu_no').val(), name : name, price : price }, type:'post', dataType:'text',
		success: function(data) {
			if(data == "1"){
				getList();
			}
		},
		error: function(){
			alert('error!!');
		}
	})
})	

function getList() {
	$('#tblMenu').html('<thead><tr><th>메뉴번호</th><th>메뉴명</th><th>가격</th></tr></thead><tbody></tbody>');
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
	$('#menu_no').val('');
	$('#name').val('');
	$('#price').val('');
}
</script>
</html>