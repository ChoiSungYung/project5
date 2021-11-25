<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.ProductVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	ProductVO pro = (ProductVO) request.getAttribute("pro");
	String proimg = pro.getProimg();
	if(proimg==null || proimg.equals("")) { 
		proimg = "./img/noImg.png";		
	}
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
	.tb img{ width:100px; height:auto; }
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
<h2 class="tit">상세  상품 정보 수정</h2>
<form action="EditProductCtrl" method="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="nid">제품번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="pronum" name="pronum" class="in_data" value="<%=pro.getPronum() %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="proname" >상품명</label>
				</th>
				<td class="col_data">
					<input type="text" id="proname" name="proname" class="in_data" value="<%=pro.getProname() %>"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="proprice">가격</label>
				</th>
				<td class="col_data">
					<input type="text" id="proprice" name="proprice" class="in_data" value="<%=pro.getProprice() %>"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="procnt">가격</label>
				</th>
				<td class="col_data">
					<input type="text" id="procnt" name="procnt" class="in_data" value="<%=pro.getProcnt() %>"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="author">제품 이미지</label>
				</th>
				<td class="col_data">
					<img src="<%=proimg %>" alt="<%=proimg %>"  id="proData"/>
					<input type="button" onclick="imgCheck()" value="이미지 변경"/>
					<input type="hidden" name="proimg" id="proimg" value="<%=pro.getProimg() %>" />
					<input type="hidden" name="imgck" id="imgck" value="" />
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
<script>
	function imgCheck() {
		window.open("imgUploadForm.jsp", "imguploadcheck", "width=300, height=300");
		return false;
	}
	function pCheck(f) {
		if(f.imgck.value=="yes"){
			alert("이미지가 변경되었습니다.");
		} else {
			alert("이미지가 변경되지 않았습니다.");
		}
	}
	</script>	
<%@ include file="footer.jsp" %>
</div>	
</body>
</html>