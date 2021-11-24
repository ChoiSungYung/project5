package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.MemberVO;

@WebServlet("/GetMemberListCtrl")
public class GetMemberListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			sql = "select * from membership";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();	
			while(rs.next()) {
				String m_id = rs.getString("m_id");
				String m_pw = rs.getString("m_pw");
				String m_name = rs.getString("m_name");
				String m_email = rs.getString("m_email");
				String m_tel = rs.getString("m_tel");
				String m_zip = rs.getString("m_zip");
				String m_addr1 = rs.getString("m_addr1");
				String m_addr2 = rs.getString("m_addr2");
				String m_job = rs.getString("m_job");
				Date regdate = rs.getDate("regdate");	
				
				MemberVO mem = new MemberVO();	
				mem.setM_id(m_id);
				mem.setM_pw(m_pw);
				mem.setM_name(m_name);
				mem.setM_email(m_email);
				mem.setM_tel(m_tel);
				mem.setM_zip(m_zip);
				mem.setM_addr1(m_addr1);
				mem.setM_addr2(m_addr2);
				mem.setM_job(m_job);
				mem.setRegdate(regdate);
				memberList.add(mem);	
			}
			request.setAttribute("memberList", memberList);		
			RequestDispatcher view = request.getRequestDispatcher("getMemberList.jsp"); 
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
