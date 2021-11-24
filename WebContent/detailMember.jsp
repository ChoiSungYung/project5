<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h1>회원 목록</h1>
	<hr />
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		String m_id = request.getParameter("m_id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			out.println(m_id+"가 입력되었습니다.");
			//sql = "select * from member where userid=?";
			sql = "select * from membership where m_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			rs = stmt.executeQuery();
%>
		<h2>회원 상세목록</h2>
		<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>전화번호</th><th>집주소</th>
			<th>직업</th><th>가입일</th>
		</tr>
<% 
			String m_job= rs.getString("m_job");
			String m_zip= rs.getString("m_zip");
			String m_addr1= rs.getString("m_addr1");
			String m_addr2= rs.getString("m_addr2");
			String m_addrTot =m_addr1+" "+m_addr2;
			m_zip = (m_job==null)?"":m_zip;
			m_addr1 = (m_addr1==null)?"":m_addr1;
			m_addr2 = (m_addr2==null)?"":m_addr2;
			m_job = (m_job=="A1")?"학생":m_job;
			m_job = (m_job=="A2")?"회사원":m_job;
			m_job = (m_job=="A3")?"기타":m_job;
			
			if(rs.next()) {	
%>			

		<tr>
			<td><%=rs.getString("m_id") %></td>
			<td><%=rs.getString("m_pw") %></td>
			<td><%=rs.getString("m_name") %></td>
			<td><%=rs.getString("m_email") %></td>
			<td><%=rs.getString("m_tel") %></td>
			<td><%=m_zip%></td>
			<td><%=m_addrTot%></td>
			<td><%=m_job%></td>
			<td><%=rs.getDate("regdate") %></td>
		</tr>
		
		
<%			
			}
		out.println("작업이 올바르게 처리되었습니다.");
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
</table>	
</body>
</html>