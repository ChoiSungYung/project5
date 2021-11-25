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
<title>관리자 글 수정</title>
<style>
* { margin:0; padding:0; }
body, html { width:100%; }
ul { list-style:none; }
.hd { clear:both; height:100px; border-bottom:3px solid #f1f1f1; }
.gnb { width:1140px; margin:10px auto; }
.gnb li { float:left; margin:14px; }
.tit { padding-top:50px; line-height:50px; text-align:center; }
table { display:table; border-collapse:collapse; }
tr { display:table-row; }
th, td { display:table-cell; }
.tb { width:600px; margin:20px auto; }
.tb th, .tb td { line-height:42px; border-bottom:1px solid #333; }
.tb th { background:#ffd35e; }
.tb tr:first-child th, .tb tr:first-child td { border-top:1px solid #333; } 
.in_data { display:block; line-height:32px; height:32px; margin-left:10px; padding-left:5px; width:240px; }
.in_data_area { line-height:1.6; padding:5px; width:400px; margin-left:10px; }
.btn_wrap { width:220px; margin:20px auto; }
.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
text-align:center; border:0; outline:0; float:left; line-height:38px; }
.btn_wrap .in_btn:hover { background-color:deeppink; }
.in_comment { padding-left:18px; }
input[readonly] { background:#f1f1f1; }
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
					<img src="<%=proimg %>" alt="<%=pro.getProname() %>"  id="proData"/>
					<input type="button" onclick="imgCheck()" value="이미지 변경"/>
					<input type="hidden" name="proimg" id="proimg" value="<%=proimg %>" />
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
<%@ include file="admin_footer.jsp" %>
</div>	
</body>
</html>