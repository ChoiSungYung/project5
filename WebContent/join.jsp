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
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/reset2.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/form.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <style>
   .warning{margin-left:100px;}
   .form_fr{height:1500px;}
   .chk_button {display:inline; margin-left: 20px;width: 120px;margin-right:20px;height:40px;line-height:40px;background-color:#333;color:#fff;border:0;text-align:center;border-radius:10px;}
   </style>
<title>회원가입</title>
</head>
<body>
<div class="wrap">
<%@include file="header.jsp" %>
 	<section class="content">        
 		<h2 class="fr_tit">회원가입</h2>        
        <form action="joinPro.jsp" class="join_frm" method="post" name="joinform" onsubmit="return joinCheck(this)">
         	<div class="form_join">
			<label for="m_id"><span style="color:red">*&nbsp;</span>아이디</label>
			<input type="text" name="m_id" value="" style="margin-left:88px; display:inline; width:450px" id="m_id" class="indata" placeholder="아이디 입력" required>			
			<input type="hidden" name="idck" value="" id="idck" required>			
			<button class="chk_button" onclick="idCheck()">중복확인</button>
			<br>
			<p class="warning">4~16자의 알파벳,숫자만 사용할 수 있습니다.</p>
			<br><br>
			<label for="m_pw"><span style="color:red">*&nbsp;</span>비밀번호</label>
			<input type="password"  id="m_pw"  name="m_pw" placeholder="영문과 숫자를 반드시 포함할 것" class="indata" required />
			<label for="m_pw2"><span style="color:red">*&nbsp;</span>비밀번호 확인</label>
			<input type="password"  id="m_pw2" name="m_pw2" placeholder="영문과 숫자를 반드시 포함할 것" class="indata"  required />
			<label for="m_name"><span style="color:red">*&nbsp;</span>이름</label>
			<input type="text"  id="m_name" name="m_name"  class="indata"  required />
			<label for="m_email"><span style="color:red">*&nbsp;</span>이메일</label>
			<input type="email"  id="m_email" name="m_email"  class="indata"  required />
			<label for="m_tel"><span style="color:red">*&nbsp;</span>핸드폰 번호</label>
			<input type="tel"  id="m_tel" name="m_tel"  class="indata"  required />
		
			<label for="zipcode" class="lb">우편번호</label>
				<span class="lb_data">
					<input type="text" name="zipcode" id="zipcode" class="indata"  style="margin-left:88px; display:inline; width:450px" readonly/>
					<input type="button" class="chk_button" value="주소찾기" onclick="findAddr()">
				</span>
			<br>
			<label for="m_address">집주소</label>
				<span class="lb_data">
					<input type="text" name="address1" id="address1" class="indata" readonly/>
					<input type="text" name="address2" id="address2" placeholder="상세주소 입력" class="indata"/>
				</span>
			<label for="m_job">직업</label>
			<select name="m_job" id="m_job" class="indata" style="width:624px">
   				 <option value="">직업선택</option>
   				 <option value="A1">학생</option>
   				 <option value="A2">회사원</option>
   				 <option value="A3">기타</option>
			</select>
				<div class="btn_box">			
					<input type="submit" value="회원가입" class="inbtn">
					<input type="reset"  value="취소" onclick="javascript:history.back();" class="inbtn"/>
				</div>
			</div>
			
		</form>
		<script>	
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);                   
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("address1").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("address1").value = jibunAddr;
                    }
                }
            }).open();
        }
        
  	  function idCheck(){
  		  window.open("idCheckForm.jsp", "idwin","width=400, height=200");
  	  }
  	  function emailCheck(){
  		  window.open("emailCheckForm.jsp", "emailwin","width=400, height=350");
  	  }
  	  
 	  function joinCheck(f){
 		  if(f.idck.value != "yes"){
 			  alert("아이디 중복 검사를 진행하지 않으셨습니다.");
 			  return false;
 		  } 
 		  
 		  if(f.m_pw.value != f.m_pw2.value){
 			  alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
 			  return false;
 		  } else {
 			  alert("회원가입이 완료되었습니다.");
			  return true;
 		  }
 	  }
  	
  	  </script>
	</section>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>