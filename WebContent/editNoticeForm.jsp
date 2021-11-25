<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.NoticeVO" %>
<%
	NoticeVO noti = (NoticeVO) request.getAttribute("noti");
	String content = noti.getContent().trim();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title> 북스크린 | 영화 예매, 정보 검색, 다운로드까지 한 곳에서 </title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/ban.css">
    <link rel="stylesheet" href="./css/form.css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<style>
	.tit { padding: 30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb { width:1200px; margin:20px auto; }
	.tb th, .tb td { width:300px; line-height:36px; border-bottom:1px solid #333; }
	.tb th { border-top:2px solid #333; background:#ffd35e; }
	.tb tbody tr:nth-child(2n) td { background:#fff6de; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	</style>
</head>
<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<h2 class="tit">상세 게시글 수정</h2>
<form action="EditNoticeCtrl" method="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="nid">글번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="nid" name="nid" class="in_data" value="<%=noti.getN_id() %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="title" >제목</label>
				</th>
				<td class="col_data">
					<input type="text" id="title" name="title" class="in_data" value="<%=noti.getTitle() %>"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="content">글 내용</label>
				</th>
				<td class="col_data">
					<textarea id="content" name="content" class="in_data_area"  cols="60" rows="15" required><%=content  %></textarea>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="author">작성자</label>
				</th>
				<td class="col_data">
					<input type="text" id="author" name="author" class="in_data" value="<%=noti.getAuthor() %>" required/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="resdate">작성일</label>
				</th>
				<td class="col_data">
					<input type="text" id="resdate" name="resdate" class="in_data" value="<%=noti.getResdate() %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="">읽은 횟수</label>
				</th>
				<td class="col_data">
					<span class="in_comment"><%=noti.getVisited() %></span>
				</td>
			</tr>
		</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">수정</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>