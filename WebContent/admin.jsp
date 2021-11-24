<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	<h1>메인 페이지 콘텐츠</h1>
	<%
	out.println("<h1>관리자 메인 페이지</h1>");
	%>
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
