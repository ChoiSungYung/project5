package com.company.controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddProductCtrl")
public class AddProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//보내온 데이터 받을 변수
		String  p_num = request.getParameter("pronum");
		String  p_name = request.getParameter("proname");
		Integer  p_price = Integer.parseInt(request.getParameter("proprice"));
		Integer  p_cnt = Integer.parseInt(request.getParameter("procnt"));
		String  p_img = request.getParameter("proimg");

		
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
			sql = "insert into m_product values (?, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, p_num);
			stmt.setString(2, p_name );
			stmt.setInt(3, p_price);
			stmt.setInt(4, p_cnt);
			stmt.setString(5, p_img);

			int cnt = stmt.executeUpdate();
			if(cnt!=0) {
				response.sendRedirect("GetProductListCtrl");
			} else {
				response.sendRedirect("addProductForm.jsp");
			}
			//구성요소 닫기
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}