<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.company.model.MemberVO" %> 
<%
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList");
	//MemberVO mem = (MemberVO) request.getAttribute("memberList");
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
  <!-- 헤더 -->
  <%@ include file = "admin_header.jsp" %>
<h2 class="fr_tit">회원 관리</h2>
	<form action="EditMemberCtrlPro" method="post" name="modForm" onsubmit="return frm_submit(this)">
	<table class="tb">
		<thead>
			<tr>
				<th class="item1">번호 </th>
				<th class="item2">회원아이디 </th>
				<th class="item3">비밀번호</th>
				<th class="item4">이름</th>
				<th class="item5">이메일</th>
				<th class="item6">전화번호</th>
			</tr>
		</thead>
		<tbody>
<%	
	int cnt=0;
	for(int i=0;i<memberList.size();i++) {		//한 튜플씩 불러다 출력하기
		cnt=i+1;
		MemberVO mem = memberList.get(i);
%>		
			<tr>
				<td class="item1"><%=cnt %></td>
				<td class="item2"><input type="text" name="m_id" id="m_id" class="in_data" value="<%=mem.getM_id() %>" readonly/></td>
				<td class="item3"><input type="text" name="m_pw" id="m_pw" class="in_data" value="<%=mem.getM_pw() %>" /></td>
				<td class="item4"><input type="text" name="m_name" id="m_name" class="in_data" value="<%=mem.getM_name() %>" /></td>
				<td class="item5"><input type="text" name="m_email" id="m_email" class="in_data" value="<%=mem.getM_email() %>" /></td>
				<td class="item6"><input type="text" name="m_tel" id="m_tel" class="in_data" value="<%=mem.getM_tel() %>" /></td>
			</tr>
<%
	}
%>
	</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">수정</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
<script>
function frm_submit(f){
		var qt=confirm("정말로 수정하시겠습니까?")
		if(qt){
			f.submit();
		} else{
			return false;
		}
}

</script>
</div>
  <!-- 푸터 -->
  <%@ include file = "footer.jsp" %>
</body>
</html>
	