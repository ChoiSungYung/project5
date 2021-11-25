<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
	.tit { padding: 30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb {width: 600px;margin:10px auto;}
	.tb th, .tb td { width:300px; line-height:36px; border-bottom:1px solid #333; }
	.tb th { border-top:2px solid #333; background:#ffd35e; }
	.tb tbody tr:nth-child(2n) td { background:#fff6de; }
	.btn_wrap { width:400px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	<h1>관리자 등록</h1>
	<!-- 상품 등록 폼 -->
	<form action="AddAdminCtrl" class="frm" method="post" name="pform" onsubmit="return pCheck(this)">
		<table>
			<tr>
				<th class="item_name">
					<label for="p_num">아이디</label>
				</th>
				<td class="item_val">
					<input type="text" name="ad_userid" id="ad_userid" class="in_data" placeholder="아이디입력" required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_name">비밀번호</label>
				</th>
				<td class="item_val">
					<input type="text" name="ad_passwd" id="ad_passwd" class="in_data" placeholder="비밀번호 입력" required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_price">이름</label>
				</th>
				<td class="item_val">
					<input type="text" name="ad_name" id="ad_name" class="in_data" placeholder="이름 입력"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_cnt">출생년도</label>
				</th>
				<td class="item_val">
					<input type="number" name="ad_birthyear" id="ad_birthyear" class="in_data" placeholder="출생년도 입력" required />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="등록" class="in_btn"/></td>
				<td><input type="reset" value="취소" class="in_btn"/></td>
			</tr>
		</table>
	</form>
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>