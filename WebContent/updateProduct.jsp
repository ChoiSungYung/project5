<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>환상의 싸이트 </title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/ban.css">
    <link rel="stylesheet" href="./css/form.css">
</head>
<body>
	<!-- 헤더 -->
	<div class="wrap">
	<%@ include file="admin_header.jsp" %>
	<!-- 상품 등록 폼 -->
	<h2 class="fr_tit">상품 수정</h2> 
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="scott";
	String pw="tiger";
	String sql;
	String p_num = request.getParameter("p_num");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);

		//sql = "select * from member where userid=?";
		sql = "select * from m_product where pronum=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, p_num);
		rs = stmt.executeQuery();

		if(rs.next()) {
			String p_name = rs.getString("proname");		
			int p_price = rs.getInt("proprice");
			int p_cnt = rs.getInt("procnt");
			String p_img = rs.getString("proimg");
%>
   
	<form action="updateProductPro.jsp" class="frm" method="post" name="pform" onsubmit="return pCheck(this)">
		<table class="tbl_product">
			<tr>
				<th class="item_name">
					<label for="p_num">상품코드</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_num" id="p_num" class="in_data" value="<%=p_num %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_name">상품명</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_name" id="p_name" class="in_data" value="<%=p_name %>"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_price">가격</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_price" id="p_price" class="in_data" value="<%=p_price %>"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_cnt">수량</label>
				</th>
				<td class="item_val">
					<input type="number" name="p_cnt" id="p_cnt" class="in_data" value="<%=p_cnt %>"   required/>
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_img">이미지</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_img" id="p_img" class="in_data" value="<%=p_img %>"/>
					<input type="button" value="이미지 업로드 체크" class="in_btn" onclick="imgCheck()" />
					<input type="hidden" value="" name="imgck" id="imgck" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="제품정보수정" class="in_btn"/></td>
				<td><input type="reset" value="취소" class="in_btn"/></td>
			</tr>
		</table>
	</form>
	<script>
	function imgCheck() {
		window.open("imgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	function pCheck(f) {
		if(f.codeck.value!="yes" || f.imgck.value!="yes"){
			alert("상품코드 및 이미지 체크가 되어 있지 않습니다.");
			return false;
		}
	}
	</script>	
	<!-- 푸터 -->
	<%			
		}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
			e.printStackTrace();
		}
%>
	<%@ include file="footer.jsp" %>
	</section>
	</div>
</body>
</html>