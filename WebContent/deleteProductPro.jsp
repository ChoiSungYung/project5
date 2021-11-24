<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>  
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>   
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//multipart로 전송되어온 데이터는 파일과 기본 데이터가 섞여서 전송되어오므로 함께 처리할 수 없음	    
		String p_num = request.getParameter("p_num");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "delete from m_product where pronum=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, p_num);
			int n = stmt.executeUpdate();
			if(n>=1) {
				//상품삭제 성공시 이동
				out.println("<script>alert('상품이 삭제되었습니다'); location.href='productList.jsp';</script>");
			} else {
				//상품삭제 실패시 이동
				out.println("<script>alert('상품 삭제가 거부되었습니다'); location.href='productList.jsp';</script>");
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