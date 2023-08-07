<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<style>
table { border-collapse : collapse; float:left;}
td,th { border : 1px solid blue; }
th {color:yellow; background-color:black; }
</style>
<body>
<h2><a href='ajaxlist'>홈으로 이동</a></h2>
<table id=tblList>
<thead>
<tr>
	<th>사번</th><th>이름</th><th>급여</th><th>매니저명</th><th>부서명</th>
</tr>
</thead>
<tbody>
<c:forEach var="emp" items="${salary}">
		<tr><td>${emp.employee_id}</td><td>${emp.emp_name}</td>
			   <td>${emp.salary}</td><td>${emp.manager_name}</td><td>${emp.department_name}</td>
</c:forEach>
</tbody>
</table>
</body>
</html>