<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bPost.title}</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; }
table td { border : 1px solid black; }
</style>
<body>
<table>
<tr><td>게시물 번호</td><td>${bPost.seqno}</td></tr>
<tr><td>제목</td><td>${bPost.title}</td></tr>
<tr><td>내용</td><td><textarea rows=10 cols=50 readonly>${bPost.content}</textarea></td></tr>
<tr><td>작성자</td><td>${bPost.writer}</td></tr>
<tr><td>조회수</td><td>${bPost.hit}</td></tr>
<tr><td>작성시각</td><td>${bPost.created}</td></tr>
<tr><td>수정시각</td><td>${bPost.updated}</td></tr>
<tr><td><a href="/">목록으로</a></td><td></td></tr>
</table>
</body>
</html>