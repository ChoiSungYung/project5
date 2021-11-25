<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.NoticeVO" %>
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

<h2 class="tit">게시글 등록</h2>

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
			sql = "select substr(n_id,2,3) as num2 from notice where idx in (select max(idx) from notice)";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			//String data;
			int dataIns, data;
			if(rs.next()){
				data = Integer.parseInt(rs.getString("num2"));
				//dataIns = Integer.parseInt(data);
				if(data+1 < 10){
					num2 = "A00" + (data+1);
				} else if(data+1 < 100) {
					num2 = "A0" + (data+1);
				} else if(data+1 < 1000) {
					num2 = "A" + (data+1);
				}

%>
<form action="AddNoticeCtrl" method="post" id="frm" name="frm">

	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="nid">글번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="nid" name="nid" class="in_data" value="<%=num2 %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="title" >제목</label>
				</th>
				<td class="col_data">
					<input type="text" id="title" name="title" class="in_data" value=""  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="content">글 내용</label>
				</th>
				<td class="col_data">
					<textarea id="content" name="content" class="in_data_area"  cols="60" rows="15" required></textarea>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="author">작성자</label>
				</th>
				<td class="col_data">
					<input type="text" id="author" name="author" class="in_data" value="관리자" readonly required/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="resdate">작성일</label>
				</th>
				<td class="col_data">
					<input type="text" id="resdate" name="resdate" class="in_data" value="sysdate" readonly />
				</td>
			</tr>
		</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">등록</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
<script>
  document.getElementById('resdate').value = new Date().toISOString().substring(0, 10);
</script>
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
 </section>

<%@ include file="footer.jsp" %>
</div>
</body>
</html>