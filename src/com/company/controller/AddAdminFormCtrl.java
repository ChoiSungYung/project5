package com.company.controller;

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

import com.company.model.AdminVO;
import com.company.model.MemberVO;

@WebServlet("/AddAdminFormCtrl")
public class AddAdminFormCtrl extends HttpServlet {
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
			sql = "select * from admin_member";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			ArrayList<AdminVO> adminList = new ArrayList<AdminVO>();	
			//select로 검색한 데이터를 저장한 공간 마련
			while(rs.next()) {
				String ad_id = rs.getString("userid");
				String ad_pw = rs.getString("passwd");
				String ad_name = rs.getString("name");
				int ad_birthyear = rs.getInt("birthyear");
	
				
				AdminVO admin = new AdminVO();	// 한 회원의 컬럼 데이터를 VO에 담는다.
				admin.setUserid(ad_id);
				admin.setPasswd(ad_pw);
				admin.setBirthyear(ad_birthyear);
				admin.setName(ad_name);
				
				//mem.setYesno(rs.getString("yesno"));
				adminList.add(admin);	//VO에 담긴 여러 건의 데이터들를 List에 담는다. 
			}
			request.setAttribute("adminList", adminList);		//보내질 List 데이터를 지정
			RequestDispatcher view = request.getRequestDispatcher("getAdminList.jsp");  //보내질 곳 지정 
			view.forward(request, response);	//지정한 URL로 데이터를 송신
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}