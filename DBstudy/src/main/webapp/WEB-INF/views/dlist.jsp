<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEP LIST</title>
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
	<th>부서코드</th><th>부서명</th><th>매니저아이디</th><th>매니저명</th>
</tr>
</thead>
<tbody>
<c:forEach var="dep" items="${list}">
		<c:choose>
		<c:when test="${dep.manager_id == 0}">
				<tr><td>${dep.department_id}</td><td>${dep.department_name}</td>
			   <td>없음</td><td>없음</td></tr>
		</c:when>
		<c:otherwise>
			<tr><td>${dep.department_id}</td><td>${dep.department_name}</td>
			   <td>${dep.manager_id}</td><td>${dep.emp_name}</td></tr>
		</c:otherwise>
		</c:choose>
</c:forEach>
</tbody>
</table>
</body>
</html>