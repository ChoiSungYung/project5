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

import com.company.model.ProductVO;

@WebServlet("/EditProductFormCtrl")
public class EditProductFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String  pronum = request.getParameter("pronum");
		
		//연결자/상태코드/DB 접속 정보/sql 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩/연결/상태정보로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from m_product where pronum=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, pronum);
			rs = stmt.executeQuery();
			ProductVO pro = new ProductVO();
			if(rs.next()) { 
				pro.setPronum(rs.getString("pronum"));
				pro.setProname(rs.getString("proname"));
				pro.setProprice(rs.getInt("proprice"));
				pro.setProcnt(rs.getInt("procnt"));
				pro.setProimg(rs.getString("proimg"));
			} else {
				response.sendRedirect("GetProductListCtrl");
			}
			request.setAttribute("pro", pro);
			RequestDispatcher view = request.getRequestDispatcher("editProductForm.jsp");
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