package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteNoticeCtrl")
public class DeleteNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ck = request.getParameterValues("ck");
		//PrintWriter out = response.getWriter();
		//연결자/상태코드/연결시필수요소 선언
		Connection con = null;
		PreparedStatement stmt = null;
		//ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩/연결/상태코드활성화
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			int cnt = 0;
			for(int i=0;i<ck.length;i++) {
				//sql 구문,상태처리,실행문
				sql = "delete from notice where n_id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, ck[i]);	
				cnt++;
				stmt.executeUpdate();
			}
			if(cnt!=0) {
				response.sendRedirect("GetNoticeListCtrl");
			}
			stmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
