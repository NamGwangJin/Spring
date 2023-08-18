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
table { width : 100%; }
#tblBoard{ border-collapse : collapse; }
#tblBoard th { background-color : black; color : yellow; border : 1px solid yellow; }
#tblBoard td { border : 1px solid black; }
</style>
<body>
<h1>자유 게시판</h1>
<table>
	<tr><td></td></tr>
</table>
<table id=tblBoard>
<thead>
	<tr><th>게시물 번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성시각</th><th>수정시각</th></tr>
</thead>
<tbody>
<c:forEach items="${bList}" var="list">
<tr><td>${list.seqno}</td><td><a href='/view?seqno=${list.seqno}'>${list.title}</a></td><td>${list.writer}</td><td>${list.hit}</td><td>${list.created}</td><td>${list.updated}</td></tr>
</c:forEach>
</tbody>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','tr',function(){
	document.location = '/view?seqno=' + $(this).find('td:first').text();
})
</script>
</html>