<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<%@ include file="header.jsp" %>
<body>
로그인 아이디 : ${user_id}<br>
비밀번호 : ${passcode}<br>
실명 : ${name}<br>
생년월일 : ${birthday}<br>
성별 : ${gender}<br>
모바일 : ${mobile}<br>
</body>
</html>