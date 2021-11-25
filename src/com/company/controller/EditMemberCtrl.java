package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditMemberCtrl")
public class EditMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String m_id = request.getParameter("uid");
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String tel = request.getParameter("utel");
		String addr1 = request.getParameter("uaddr1");
		String addr2 = request.getParameter("uaddr2");
		String job = request.getParameter("ujob");

		
		//연결자/상태코드/DB 접속 정보/sql 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩/연결/상태정보로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "update membership set m_name=?, m_email=?, m_tel=?, m_addr1=?, m_addr2=?, m_job=? where m_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, tel);
			stmt.setString(4, addr1);
			stmt.setString(5, addr2);
			stmt.setString(6, job);
			stmt.setString(7, m_id);

			int cnt = stmt.executeUpdate();
			response.setContentType("text/html;charset=UTF-8");	
			PrintWriter out = response.getWriter();

			if(cnt == 0) { 
				out.println("<script>alert('상품 수정이 거부되었습니다'); location.href='EditMemberFormCtrl';</script>");
			} else {
				out.println("<script>alert('수정되었습니다'); location.href='GetMemberListCtrl';</script>");
			}


			stmt.close();
			con.close();
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}