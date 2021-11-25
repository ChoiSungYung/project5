package com.company.controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddMemberCtrl")
public class AddMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//보내온 데이터 받을 변수
		String m_id = request.getParameter("uid");
		String pw = request.getParameter("upw");
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String tel = request.getParameter("utel");
		String zip = request.getParameter("uzip");
		String addr1 = request.getParameter("uaddr1");
		String addr2 = request.getParameter("uaddr2");
		String job = request.getParameter("ujob");

		
		//컨넥터/상태코드/DB 연결 변수/기타 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버 로딩/연결/상태코드 연결/SQL문 실행
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "insert into membership values (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, m_id );
			stmt.setString(2, pw );
			stmt.setString(3, name );
			stmt.setString(4, email );
			stmt.setString(5, tel );
			stmt.setString(6, zip );
			stmt.setString(7, addr1 );
			stmt.setString(8, addr2 );
			stmt.setString(9, job );
			int cnt = stmt.executeUpdate();
			if(cnt!=0) {
				response.sendRedirect("GetMemberListCtrl");
			} else {
				response.sendRedirect("addMemberForm.jsp");
			}
			//구성요소 닫기
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}