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

import com.company.model.ProductVO;

@WebServlet("/GetProductListCtrl")
public class GetProductListCtrl extends HttpServlet {
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
			sql = "select * from m_product order by pronum desc";	
			stmt = con.prepareStatement(sql); 	
			rs = stmt.executeQuery();
			ArrayList<ProductVO> productList = new ArrayList<ProductVO>();	
			while(rs.next()) {		

				String p_NUM = rs.getString("PRONUM"); 
				String p_NAME = rs.getString("PRONAME"); 
				int p_PRICE = rs.getInt("PROPRICE");
				int p_CNT = rs.getInt("PROCNT"); 
				String p_IMG = rs.getString("PROIMG"); 

				ProductVO prod = new ProductVO();
				prod.setPronum(p_NUM);
				prod.setProname(p_NAME);
				prod.setProprice(p_PRICE);
				prod.setProcnt(p_CNT);
				prod.setProimg(p_IMG);
				productList.add(prod);
			}
			request.setAttribute("productList", productList);
			RequestDispatcher view = request.getRequestDispatcher("getProductList.jsp"); 
			view.forward(request, response);
			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}
