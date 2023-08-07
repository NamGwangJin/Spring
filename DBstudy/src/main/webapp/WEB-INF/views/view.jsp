<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
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
	<th>사번</th><th>이름</th><th>급여</th><th>매니저 사번</th><th>부서코드</th>
</tr>
</thead>
<tbody>
<tr>
	<td>${person.employee_id}</td><td>${person.emp_name}</td><td>${person.salary}</td><td>${person.manager_id}</td><td>${person.department_id}</td>
</tr>
</tbody>
</table>
</body>
</html>