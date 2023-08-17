<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>
<style>
body { text-align:center; }
table { width : 80%; margin-left:auto; margin-right:auto; }
#tblBoard{ border-collapse : collapse; }
#tblBoard th { background-color : black; color : yellow; border : 1px solid yellow; }
#tblBoard td { border : 1px solid black; cursor : pointer; }
</style>
<body align=center>
<h1>자유 게시판</h1>
<table>
	<tr><td></td></tr>
</table>
<table id=tblBoard>
<thead>
	<tr><th colspan=6 style='text-align:right; background-color:white; border : 1px solid white;'><a href='/write'>게시물 작성</a></th></tr>
	<tr><th>게시물 번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성시각</th><th>수정시각</th></tr>
</thead>
<tbody>
<c:forEach items="${bList}" var="list">
<tr><td>${list.seqno}</td><td>${list.title}</td><td>${list.writer}</td><td>${list.hit}</td><td>${list.created}</td><td>${list.updated}</td></tr>
</c:forEach>
</tbody>
</table>
<table>
<tr><td colspan=2 style='text-align:center;'>${pageCount}</td></tr>
<tr>
<td style='text-align:left;'>${prev}</td>
<td style='text-align:right;'>${next}</td>
</tr>
<tr>
<td colspan=2 style='text-align:center;'>${pagestr}</td>
</tr>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#tblBoard tbody tr',function(){
	document.location = '/view?seqno=' + $(this).find('td:first').text();
	return false;
})
</script>
</html>