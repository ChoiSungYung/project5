<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="scott";
	String pw="tiger";
	String sql;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		out.println(m_id+"가 입력되었습니다.");
		//테이블인 member에서 사용자가 입력한 아이디와 패스워드가 일치하는지 검색하여 결과 반환
		sql = "select * from member2 where userid=? and passwd=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_id);
		stmt.setString(2, m_pw);
		rs = stmt.executeQuery();

if(rs.next()) { //반환된 결과가 있으면, 관리차(admin)으로 세션을 생성해줌
			session.setAttribute("id", m_id);//session.setAttribute"세션속성명"
			session.setAttribute("pw", m_pw);
			response.sendRedirect("admin.jsp");
%>			
<%			
		} else {
			response.sendRedirect("index.jsp");
		}
	} catch(Exception e) {
		
	}
	
%>
