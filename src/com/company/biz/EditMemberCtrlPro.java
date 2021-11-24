package com.company.biz;

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

@WebServlet("/EditMemberCtrlPro")
public class EditMemberCtrlPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	//연결자, 상태정보자, 결과물저장 객체 선언 및 null 초기화
	Connection conn = null;
	PreparedStatement stmt = null;

	//접속정보를 선언 및 값 지정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id="scott";
	String db_pw="tiger";
	String sql;

	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_tel = request.getParameter("m_tel");
	String m_id = request.getParameter("m_id");
	
	try {
		//드라이버로딩
		Class.forName("oracle.jdbc.OracleDriver");
		
		//접속
		conn = DriverManager.getConnection(url, db_id, db_pw);
		
		//sql문 작성
		sql = "update membership set m_pw=?, m_name=?, m_email=?, m_tel=? where m_id=?";

		//상태정보 활성화 및 SQL문 처리
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_pw);
		stmt.setString(2, m_name);
		stmt.setString(3, m_email);
		stmt.setString(4, m_tel);
		stmt.setString(5, m_id);

		//SQL을 처리하여 결과반환
		int n=stmt.executeUpdate();
		response.setContentType("text/html;charset=UTF-8");	
		PrintWriter out = response.getWriter();

		if(n>=1){
			//상품등록 성공시 이동
			out.println("<script>alert('수정되었습니다'); location.href='GetMemberListCtrl';</script>");
		} else {
			//상품등록 실패시 이동
			out.println("<script>alert('상품 수정이 거부되었습니다'); location.href='EditMemberCtrl?id='"+m_id+"';</script>");
		}
		
		//반환결과를 출력

		stmt.close();
		conn.close();
		
	} catch (ClassNotFoundException e) {
		System.out.println("드라이버 로딩이 실패되었습니다.");
		e.printStackTrace();
	} catch (SQLException e) {
		System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
		e.printStackTrace();
	}
}
}