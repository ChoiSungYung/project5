package com.company.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddAdminCtrl")
public class AddAdminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//multipart로 전송되어온 데이터는 파일과 기본 데이터가 섞여서 전송되어오므로 함께 처리할 수 없음	    
		String ad_userid = request.getParameter("ad_userid");
		String ad_passwd = request.getParameter("ad_passwd");
		//가격과 수량은 데이터베이스에 저장되려면 숫자로 저장해야하므로 형 변환이 되어 있어야 함
		String ad_name = request.getParameter("ad_name");
		int ad_birthyear = Integer.parseInt(request.getParameter("ad_birthyear"));
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "insert into admin_member(USERID, PASSWD, NAME, BIRTHYEAR) values (?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ad_userid);
			stmt.setString(2, ad_passwd);
			stmt.setString(3, ad_name);
			stmt.setInt(4, ad_birthyear);
			int n = stmt.executeUpdate();
			if(n>=1) {
				//제품 등록 성공시 이동
				response.sendRedirect("getAdminList.jsp");
			} else {
				//제품 등록 실패시 이동
				response.sendRedirect("AddAdminCtrl.jsp");
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

	}
}