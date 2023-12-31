<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List By AJAX call</title>
</head>
<style>
table { border-collapse : collapse;}
td,th { border : 1px solid blue; }
th {color:yellow; background-color:black; }
</style>
<body>
<caption><h1>사원 조회</h1></caption>
<input type=text id=search placeholder='사번으로 검색'><button id=searchBtn>검색</button>
<br><br>
<input type=text id=min placeholder='급여로 검색 (최소값 0)'><input type=text id=max placeholder='급여로 검색 (최대값 50000)'><button id=salaryBtn>검색</button>
<br><br>
<button id=btnGet>사원 목록 보기</button>
<table id=tblList>
<thead>
<tr>
	<th>사번</th><th>이름</th><th>급여</th><th>매니저명</th><th>부서명</th>
</tr>
</thead>
</table>
<br><br>
<button id=btnGet2>부서 목록 보기</button>
<table id=tblList2>
<thead>
<tr>
	<th>부서코드</th><th>부서명</th><th>매니저ID</th><th>매니저명</th>
</tr>
</thead>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)

.on('click','#btnGet',function(){
	if ($(this).text() == '사원 목록 보기') {
		$(this).text('사원 목록 숨기기');
	 	$.ajax( {url:'/emplist', data:{}, type:'post', dataType:'json', 
			success: function(data) {
				for(let i=0; i<data.length; i++) {
					let obj = data[i];
					if ( obj['manName'] == null ) obj['manName'] = "없음";
					if ( obj['depName'] == null ) obj['depName'] = "없음";
					let str = '<tr><td>' + obj['id'] + '</td><td>' + obj['name'] + '</td><td>'
								+ obj['sal'] + '</td><td>' + obj['manName'] + '</td><td>' + obj['depName'] + '</td></tr>' ;
					$('#tblList').append(str);
				}
			},
			error: function() {
				alert('ajax call failed !!!');
			}
		})
	} else {
		$(this).text('사원 목록 보기');
		$('#tblList').html('<thead><tr><th>사번</th><th>이름</th><th>급여</th><th>매니저명</th><th>부서명</th></tr></thead>');
	}
})

.on('click','#btnGet2',function(){
	if ($(this).text() == '부서 목록 보기') {
		$(this).text('부서 목록 숨기기');
	 	$.ajax( {url:'/deplist', data:{}, type:'post', dataType:'json', 
			success: function(data) {
				for(let i=0; i<data.length; i++) {
					let obj = data[i];
					if (obj['manid'] == 0) {
						obj['manid'] = "없음";
						obj['manName'] = "없음";
					}
					let str = '<tr><td>' + obj['depid'] + '</td><td>' + obj['depName'] + '</td><td>'
								+ obj['manid'] + '</td><td>' + obj['manName'] + '</td></tr>' ;
					$('#tblList2').append(str);
				}
			},
			error: function() {
				alert('ajax call failed !!!');
			}
		})
	} else {
		$(this).text('부서 목록 보기');
		$('#tblList2').html('<thead><tr><th>부서코드</th><th>부서명</th><th>매니저ID</th><th>매니저명</th></tr></thead>');
	}
})

.on('click','#searchBtn',function(){
	if ( $('#search').val() == '' ) {
		alert('입력된 데이터가 없습니다.');
		return false;
	}
	document.location = '/view?id=' + $('#search').val();
})

.on('click','#salaryBtn',function(){
	if ( $('#min').val() == '' ) {
		alert('입력된 데이터가 없습니다.');
		return false;
	}
	if ( $('#max').val() == '' ) {
		alert('입력된 데이터가 없습니다.');
		return false;
	}
	document.location = '/salary?min=' + $('#min').val() + '&max=' + $('#max').val();
})
</script>
</html>