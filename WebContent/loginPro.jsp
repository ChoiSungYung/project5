<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	//캐릭터셋을 UTF-8로 설정(request, response)
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//login.html 에서 보내온 데이터 가져와서 임의 변수에 저장
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	
	
	//연결자, 상태정보자, 결과물저장 객체 선언 및 null 초기화
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null; 
	
	//접속정보를 선언 및 값 지정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="scott";
	String pw="tiger";
	String sql;
	
	try {
		//드라이버로딩
		Class.forName("oracle.jdbc.OracleDriver");
		
		//접속
		conn = DriverManager.getConnection(url, id, pw);
		
		//sql문 작성
		sql = "select * from membership where m_id=? and m_pw=?";
		
		//상태정보 활성화 및 SQL문 처리
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_id);
		stmt.setString(2, m_pw);
		
		//SQL을 처리하여 결과반환
		rs = stmt.executeQuery();
		
		//반환결과를 출력
		//로그인시에는 해당 사람의 is가 존재하면, 로그인 처리, 존재하지 않으면 회원가입 페이지로 이동
		if(rs.next()) {
			session.setAttribute("id", m_id);	 
			session.setAttribute("pw", m_pw); 
			response.sendRedirect("index.jsp");
			
		} else {
			response.sendRedirect("login.jsp");
		}
		
		//결과물 저장 객체, 상태정보자 객체, 접속 객체 닫기
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		response.sendRedirect("e500.html"); //e500은 예시. 오류 페이지가 떠야한다.
		out.println("시스템에 오류가 있습니다.");
			
	}
%>
