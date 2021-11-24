<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>
</head>
<body>
<%
	//캐릭터셋을 UTF-8로 설정(request, response)
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//login.html 에서 보내온 데이터 가져와서 임의 변수에 저장
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_tel = request.getParameter("m_tel");
	String m_zip = request.getParameter("zipcode");
	String m_addr1 = request.getParameter("address1");
	String m_addr2 = request.getParameter("address2");
	String m_job = request.getParameter("m_job");
	


	
	//연결자, 상태정보자, 결과물저장 객체 선언 및 null 초기화
	Connection conn = null;
	PreparedStatement stmt = null;
	
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
		sql = "INSERT INTO membership (m_id, m_pw, m_name, m_email, m_tel, m_zip, m_addr1, m_addr2, m_job, regdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

		//상태정보 활성화 및 SQL문 처리
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_id);
		stmt.setString(2, m_pw);
		stmt.setString(3, m_name);
		stmt.setString(4, m_email);
		stmt.setString(5, m_tel);
		stmt.setString(6, m_zip);
		stmt.setString(7, m_addr1);
		stmt.setString(8, m_addr2);
		stmt.setString(9, m_job);
		
		
		//SQL을 처리하여 결과반환
		int n=stmt.executeUpdate();
		
		if(n>=1){
			//회원가입 성공시 이동
			response.sendRedirect("login.jsp");
		} else {
			//회원가입 실패시 이동
			response.sendRedirect("join.jsp");
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

%>

</body>
</html>
