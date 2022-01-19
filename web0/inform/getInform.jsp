<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>    
<%@ page import="java.util.Date"  %>
<%@ page import="com.shop.biz.*"  %>
<%@ page import="com.shop.model.*"  %>
<%
	InformVO inform = (InformVO) request.getAttribute("inform");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0, userscalable=no"/>
<title>공지사항 글 보기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.tit { font-size:48px; text-align: center; }
.btn-default { color:#fff; background-image: linear-gradient(to bottom,#111 0,#222 100%); }
.btn-default:hover { background-color:deepskyblue; }
</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="container">
		<h2 class="tit">공지사항 보기</h2>
		<form action="UpdateInformCtrl" method="post" name="frm">
			<table class="table">
				<tr>
					<th class="item1">번호</th>
					<td class="item2"><%=inform.getSeq() %>
						<input type="hidden" name="seq" value="<%=inform.getSeq() %>"/>
					</td>
				</tr>
				<tr>	
					<th class="item1">제목</th>
					<td class="item2">
						<input type="text" name="title" value="<%=inform.getTitle() %>"/>
					</td>
				</tr>	
				<tr>
					<th class="item1">내용</th>
					<td class="item2">
						<textarea name="incontent" id=""incontent cols="90" rows="10"><%=inform.getIncontent() %></textarea>
					</td>
				</tr>
				<tr>
					<th class="item1">작성자</th>
					<td class="item2"><%=inform.getNickname() %></td>
				</tr>
				<tr>	
					<th class="item1">작성일</th>
					<td class="item2"><%=inform.getRegdate() %></td>
				</tr>
				<tr>	
					<th class="item1">방문횟수</th>
					<td class="item2"><%=inform.getVisited() %></td>
				</tr>
			</table>
			<!--  버튼 그룹 -->
			<div class="btn-group">
				<input type="submit" class="btn btn-default" value="글 수정" />
				<a href="GetInformListCtrl" class="btn btn-default">목록</a>
				<%-- <a href="DeleteInformCtrl?seq=<%=inform.getSeq() %>" class="btn btn-default" >글 삭제</a> --%>
				<button class="btn btn-default"  onclick="func1(<%=inform.getSeq() %>)">글 삭제</button>
			</div>
		</form>
		<script>
		function func1(data) {
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="DeleteInformCtrl?seq="+data;
			} else {
				return false();
			}
		}
		</script>
	</div>
		<%@ include file="../footer.jsp" %>
</body>
</html>