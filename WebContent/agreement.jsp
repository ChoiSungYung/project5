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
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/form.css">
    <link rel="stylesheet" href="./css/common.css">
    
<title>회원가입</title>
</head>
<body>
 <div class="wrap">
<%@include file="header.jsp" %>
 	<section class="content">
 	<form action="join.jsp" class="agree_frm" method="post" onsubmit="return send(this)">
 		<div class="form_fr">
        <h2 class="fr_tit">약관 동의</h2><br>        
		<label for="ck_agree1"><input type="checkbox"  id="m_agree1"/>이용약관 동의(필수)</label><br><br>
		<iframe style="width:100%; height:400px; text-align:center; border:1px solid #333" name="" src="./agreement/agreement.txt" ></iframe>
		<br><br><br>
		<h2 class="fr_tit">개인정보 수집 동의</h2><br>        
		<label for="ck_agree2"><input type="checkbox"  id="m_agree2"/>개인정보 수집·이용 동의(필수)</label><br><br>
		<table class="tbl_row" >
			<colgroup>
				<col style="width:25%;">
				<col>
			</colgroup>
			<tr>
				<th>수집하는 <br>개인정보 항목</th>
				<td>이름 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일</td>
			</tr>
			<tr>
				<th>수집 및 이용목적</th>
				<td>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리 , 고지사항 전달</td>
			</tr>
			<tr>
				<th>보유 및 이용기간</th>
				<td>
					회원탈퇴 단, 관계 법령에 따라 개인정보를 보존해야 하는 경우, 회사는 해당 법령에서 정한 기간동안 보관합니다.<br><br>
					※ 동의를 거부할 수 있으나 거부 시 회원가입이 불가능합니다.
				</td>
			</tr>
		</table>
		<br><br>
			<div class="btn_box">
				<input type="submit" value="로그인" class="inbtn">
				<input type="reset"  value="취소"  onclick="javascript:history.back();" class="inbtn"/>
			</div>
		</div>
	</form>
	<script>
	function send(f){
		if(f.m_agree1.checked==true && f.m_agree2.checked == true){
			return true;
		} else {
			alert("약관에 모두 동의해주시기 바랍니다.");
			return false;
		}
	}
	</script>

<%@include file="footer.jsp" %>
</section>
</div>
</body>
</html>