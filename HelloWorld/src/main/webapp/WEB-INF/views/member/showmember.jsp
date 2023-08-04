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
컨텍스트 패스 : <%= request.getContextPath() %><br>
요청방식 : <%= request.getMethod() %><br>
요청한 URL : <%= request.getRequestURL() %><br>
요청한 URI : <%= request.getRequestURI() %><br>
서버의 이름 : <%= request.getServerName() %><br>
프로토콜 : <%= request.getProtocol() %><br>
GetParameterNames : <br>
<%
	Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()) {
		String eName = (String)e.nextElement();
		out.print(eName + ":" + request.getParameter(eName) + "<br>");
	}
%>
<body>
<h1><a href="/">홈으로 이동</a></h1>
<h1>회원 정보</h1>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("bd");
	String gender = request.getParameter("gender");
	String mobile = request.getParameter("mobile");
	
	out.print("<h2>로그인 아이디 : </h2>" + id + "<br>");
	out.print("<h2>비밀번호 : </h2>" + pw + "<br>");
	out.print("<h2>실명 : </h2>" + name + "<br>");
	out.print("<h2>모바일 : </h2>" + mobile + "<br>");
	out.print("<h2>생년월일 : </h2>" + birth + "<br>");
	out.print("<h2>성별 : </h2>" + gender);
	
	if (gender.equals("남성")){
		out.print("<h1><a href='http://www.amazon.com'>아마존으로 이동</a></h1>");
	} else{
		out.print("<h1><a href='http://www.instagram.com'>인스타그램으로 이동</a></h1>");
	}
%>

-------------------------------------------------------------------<br>
로그인 아이디 : ${member.userid}<br>
비밀번호 : ${member.passcode1}<br>
실명 : ${member.name}<br>
생년월일 : ${member.birthday}<br>
성별 : ${member.gender}<br>
모바일 : ${member.mobile}<br>
관심분야 : 
<c:forEach var="interest" items="${member.interest}" varStatus="status">
	${interest} <c:if test="${not status.last}">, </c:if>
</c:forEach>
<%--
	String items[] = request.getParameterValues("interest");
	for (String item : items){
		if (item.equals(items[items.length - 1])) {
			out.print(item);
		} else {
			out.print(item+",");
		}
	}
--%><br>
지역 :
<c:forEach var="region" items="${member.region}" varStatus="status">
	${region} <c:if test="${not status.last}">, </c:if>
</c:forEach>
<%--
	if (request.getParameterValues("region") == null) {
		response.sendRedirect("http://www.naver.com");
	} else {
		String regions[] = request.getParameterValues("region");
		for (String region : regions){
			if (region.equals(regions[regions.length - 1])) {
				out.print(region);
			} else {
				out.print(region+",");
			}
		}
	}
--%><br>
<%
	if (gender.equals("남성")){ %>
		<h1><a href='http://www.amazon.com'>아마존으로 이동</a></h1>
<% 	} else{ %>
		<h1><a href='http://www.instagram.com'>인스타그램으로 이동</a></h1>
<%  }
%>
</body>
</html>