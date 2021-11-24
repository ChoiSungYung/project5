<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/form.css">
<style>
.wrap{text-align:center;}
.pop_tit h2{display:block; text-align: center; line-height: 3.6; }
.id_chk{display:block; width:300px; height:50px; margin:20px auto;}
</style>
</head>
<body>

<%
	//캐릭터셋을 UTF-8로 설정(request, response)
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//login.html 에서 보내온 데이터 가져와서 임의 변수에 저장
	String m_id = request.getParameter("id");	
	
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
		sql = "select * from membership where m_id=?";
		
		//상태정보 활성화 및 SQL문 처리
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, m_id);
		
		//SQL을 처리하여 결과반환
		rs = stmt.executeQuery();


		//반환결과를 출력
		//로그인시에는 해당 사람의 is가 존재하면, 로그인 처리, 존재하지 않으면 회원가입 페이지로 이동
		if(rs.next()) {
%>

	<div class="wrap">
	<h3 class="pop_tit">아이디 중복 확인 완료</h3>
	<p><%=m_id%>는 이미 사용 중인 아이디입니다.</p>
	<button onclick ="location.href='idCheckForm.jsp'" class="inbtn">다시 입력하기</button>
	</div>

<%
		} else {

%>
	<div class="wrap">
	<h3 class="pop_tit">아이디 중복 확인 완료</h3>
	<p><%=m_id%>는 사용 가능한 아이디입니다.</p>
	<p><span style="color:red">적용하기</span>를 누르시면 입력하신 아이디를 사용할 수 있습니다.</p>
	<button onclick ="javascript:apply('<%=m_id%>')" class="inbtn">적용하기</button>
	</div>
</body>
	<script>
	function apply(id){
		//opener 부모창
		opener.document.joinform.m_id.value=id;
		opener.document.joinform.idck.value="yes";
		window.close();
	}
	</script>
<% 	
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
