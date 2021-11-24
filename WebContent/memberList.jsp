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
		sql = "select * from membership";
		rs = stmt.executeQuery(sql);
%>
<section class="content">
<h2 class="fr_tit">회원 조회</h2>        
<table class="tbl_member"> 
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>전화번호</th><th>집주소</th>
			<th>직업</th><th>가입일</th>
		</tr>
<%		
		while(rs.next()) {
			String m_id = rs.getString("m_id");
			String m_pw = rs.getString("m_pw");
			String m_name = rs.getString("m_name");
			String m_email = rs.getString("m_email");
			String m_tel = rs.getString("m_tel");
			String m_addr1 = rs.getString("m_addr1");
			String m_addr2 = rs.getString("m_addr2");
			String m_job = rs.getString("m_job");
			Date m_regdate = rs.getDate("regdate");
			
%>
		<tr>
			<td><a href="detailMember.jsp?m_id=<%=m_id %>"><%=m_id %></a></td>
			<td><%=m_pw %></td>
			<td><%=m_name %></td>
			<td><%=m_email %></td>
			<td><%=m_tel %></td>
			<td><%=m_addr1 %><%=m_addr2 %></td>
			<td>
<%
	if(m_job=="A1"){
		out.println("학생");
	} else if(m_job=="A2"){
		out.println("회사원");
	} else {
		out.println("기타");
	}
%>
			</td>
			<td><%=m_regdate %></td>

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