<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.ProductVO" %>
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
	.btn_wrap { width:400px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	</style>
</head>
<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<section class="content">
<h2 class="tit">상품 등록</h2>

<%
//연결자/상태코드/DB 접속 정보/sql 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql, num2 = "";

		try {
			//드라이버로딩/연결/상태정보로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select substr(pronum,2,4) as num2 from (select * from m_product order by pronum desc) where rownum <=1";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			//String data;
			int data;
			if(rs.next()){
				data = Integer.parseInt(rs.getString("num2"));
				//dataIns = Integer.parseInt(data);
				if(data+1 < 10){
					num2 = "A000" + (data+1);
				} else if(data+1 < 100) {
					num2 = "A00" + (data+1);
				} else if(data+1 < 1000) {
					num2 = "A0" + (data+1);
				} else if(data+1 < 10000) {
					num2 = "A" + (data+1);
				}

%>
<form action="AddProductCtrl" method="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="pronum">제품번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="pronum" name="pronum" class="in_data" value="<%=num2%>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="proname" >상품명</label>
				</th>
				<td class="col_data">
					<input type="text" id="proname" name="proname" class="in_data" value=""  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="proprice">가격</label>
				</th>
				<td class="col_data">
					<input type="text" id="proprice" name="proprice" class="in_data" value=""  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="procnt">수량</label>
				</th>
				<td class="col_data">
					<input type="text" id="procnt" name="procnt" class="in_data" value=""  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="author">제품 이미지</label>
				</th>
				<td class="col_data">
					<img src="./img/noname.png" alt="noname.png"  id="proData"/>
					<input type="button" onclick="imgCheck()" value="이미지 추가"/>
					<input type="hidden" name="proimg" id="proimg" value="./img/noname.png" />
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
<%				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
%>		
<script>
	function imgCheck() {
		window.open("imgUploadForm.jsp", "imguploadcheck", "width=300, height=300");
		return false;
	}
	function pCheck(f) {
		if(f.imgck.value=="yes"){
			alert("이미지가 등록되었습니다.");
		} else {
			alert("이미지가 등록되지 않았습니다.");
		}
	}
	</script>	
</section>
<%@ include file="footer.jsp" %>
</div>	
</body>
</html>