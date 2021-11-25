package com.company.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.AdminVO;

@WebServlet("/EditAdminFormCtrl")
public class EditAdminFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uid = request.getParameter("id");
		
		//컨넥터/상태코드/DB 관련 변수에 대한 선언
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩~sql 실행
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from admin_member where userid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, uid);
			System.out.println(uid);
			rs = stmt.executeQuery();
			AdminVO admin = new AdminVO();
						
			if(rs.next()) {
				admin.setUserid(rs.getString("userid"));
				admin.setPasswd(rs.getString("passwd"));
				admin.setName(rs.getString("name"));
				admin.setBirthyear(rs.getInt("birthyear"));
			} else {
				response.sendRedirect("GetAdminListCtrl");
			}
			request.setAttribute("admin", admin);
			RequestDispatcher view = request.getRequestDispatcher("editAdminForm.jsp");
			view.forward(request, response);
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}