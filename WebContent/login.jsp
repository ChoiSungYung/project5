<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>환상의 싸이트 </title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/form.css">
    
</head>

<body>
    <div class="wrap">
  	<%@ include file = "header.jsp" %>	<!-- 헤더 -->
 	<section class="content">
        <h2 class="con_tit">로그인</h2>
        <form action="loginPro.jsp" class="login_form" method="post">
			<input type="text"  id="m_id"  name="m_id" placeholder="아이디 입력" class="indata" required />
			<input type="password"  id="m_pw" name="m_pw" placeholder="비밀번호 입력" class="indata"  required />
			<br><br>
			<div class="btn_box">			
				<input type="submit" value="로그인" class="inbtn">
				<input type="reset"  value="취소" class="inbtn"/>
			</div>		
		</form>
</section>
  <%@ include file = "footer.jsp" %>
</div>
</body>
</html>