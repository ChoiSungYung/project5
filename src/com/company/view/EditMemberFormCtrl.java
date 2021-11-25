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

import com.company.model.MemberVO;

@WebServlet("/EditMemberFormCtrl")
public class EditMemberFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("id");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from membership where m_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, uid);
			System.out.println(uid);
			rs = stmt.executeQuery();
			MemberVO mem = new MemberVO();
						
			if(rs.next()) {
				mem.setM_id(rs.getString("m_id"));
				mem.setM_pw(rs.getString("m_pw"));
				mem.setM_name(rs.getString("m_name"));
				mem.setM_email(rs.getString("m_email"));
				mem.setM_tel(rs.getString("m_tel"));
				mem.setM_addr1(rs.getString("m_addr1"));
				mem.setM_addr2(rs.getString("m_addr2"));
				mem.setM_job(rs.getString("m_job"));
			} else {
				response.sendRedirect("GetMemberListCtrl");
			}
			request.setAttribute("mem", mem);
			RequestDispatcher view = request.getRequestDispatcher("editMemberForm.jsp");
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