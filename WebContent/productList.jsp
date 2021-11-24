<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import = "java.sql.*" %>
   
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
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/ban.css">
    <link rel="stylesheet" href="./css/form.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/ban.js"></script>
    
</head>
<body>
<div class="wrap">
  <!-- 헤더 -->
  <%@ include file = "admin_header.jsp" %>
 
 <!-- 회원목록 -->
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		stmt = conn.createStatement();
		sql = "select * from m_product";
		rs = stmt.executeQuery(sql);
%>
<section class="content">
<h2 class="fr_tit">상품 관리 페이지</h2>        
<table class="tbl_product"> 
		<tr>
			<th>제품번호</th><th>제품명</th><th>제품가격</th><th>제품수량</th><th>제품이미지</th><th>편집 또는 삭제</th>
		</tr>
<%		
		while(rs.next()) {
			String p_num = rs.getString("pronum");
			String p_name = rs.getString("proname");
			int p_price = rs.getInt("proprice");
			int p_cnt = rs.getInt("procnt");
			String p_img = rs.getString("proimg");

			
%>
		<tr>
			<td><a href="updateProduct.jsp?p_num=<%=p_num %>"><%=p_num %></a></td>
			<td><%=p_name %></td>
			<td><%=p_price %></td>
			<td><%=p_cnt %></td>
			<td><img src='./img/<%=p_img %>'  alt='' /></td>
			<td><a href="deleteProductPro.jsp?p_num=<%=p_num %>">삭제</a>	</td>
		</tr>
<%			
		}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
%>
</table>	
</section>
</div>

  <!-- 푸터 -->
  <%@ include file = "footer.jsp" %>

</body>
</html>