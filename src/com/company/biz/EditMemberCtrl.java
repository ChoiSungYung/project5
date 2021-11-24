package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class EditMemberCtrl
 */

import com.company.model.MemberVO;
@WebServlet("/EditMemberCtrl")
public class EditMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "scott";
			String db_pw = "tiger";
			String sql;
			String m_id = request.getParameter("id");
			
			try {
				
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(url, db_id, db_pw);

				//sql = "select * from member where userid=?";
				sql = "select * from membership where m_id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, m_id);
				rs = stmt.executeQuery();
				ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();	

				if(rs.next()) {
					m_id = rs.getString("m_id");
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
				request.setAttribute("memberList", memberList);		//蹂대궡吏� List �뜲�씠�꽣瑜� 吏��젙
				RequestDispatcher view = request.getRequestDispatcher("getMemberModify.jsp");  //蹂대궡吏� 怨� 吏��젙 
				view.forward(request, response);	//吏��젙�븳 URL濡� �뜲�씠�꽣瑜� �넚�떊
				rs.close();
				stmt.close();
				con.close();

			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩이 실패되었습니다.");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
				e.printStackTrace();
			} catch (Exception e) {
				response.sendRedirect("e404.jsp");
				e.printStackTrace();
			}
		}
	}


