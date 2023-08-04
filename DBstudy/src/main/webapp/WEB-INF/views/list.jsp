<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 명단</title>
</head>
<style>
table { border-collapse : collapse; }
td,th { border : 1px solid blue; }
th {color:yellow; background-color:black; }
</style>
<body>
<table>
<thead>
<tr>
	<th>사번</th><th>이름</th><th>급여</th><th>매니저 사번</th><th>부서코드</th>
</tr>
</thead>
<tbody>
<c:forEach var="person" items="${list}">
		<tr><td>${person.employee_id}</td><td>${person.emp_name}</td>
			   <td>${person.salary}</td><td>${person.manager_id}</td><td>${person.department_id}</td>
</c:forEach>
</tbody>
</table>
</body>
</html>