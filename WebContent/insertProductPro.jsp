<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록요청</title>
</head>
<body>
<%
	//캐릭터셋을 UTF-8로 설정(request, response)
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//login.html 에서 보내온 데이터 가져와서 임의 변수에 저장
	String p_num = request.getParameter("p_num");
	String p_name = request.getParameter("p_name");
	int p_price = Integer.parseInt(request.getParameter("p_price"));
	int p_cnt = Integer.parseInt(request.getParameter("p_cnt"));
	String p_img = request.getParameter("p_img");


	
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
		sql = "INSERT INTO m_product (proNum, proName, proPrice, proCnt, proImg) VALUES (?, ?, ?, ?, ?)";

		//상태정보 활성화 및 SQL문 처리
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, p_num);
		stmt.setString(2, p_name);
		stmt.setInt(3, p_price);
		stmt.setInt(4, p_cnt);
		stmt.setString(5, p_img);


		//SQL을 처리하여 결과반환
		int n=stmt.executeUpdate();
		
		if(n>=1){
			//상품등록 성공시 이동
			out.println("<script>alert('상품이 등록되었습니다'); location.href='GetProductListCtrl.jsp';</script>");
		} else {
			//상품등록 실패시 이동
			out.println("<script>alert('상품이 등록이 거부되었습니다'); location.href='GetProductListCtrl.jsp';</script>");
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
