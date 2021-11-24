<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="wrap">
		<h3 class="pop_tit">아이디 중복 확인</h3>
		<form action="idCheckPro.jsp" method="post" onsubmit="return invaildCheck(this)">
			<div class="item_fr">
				<input type="text" name="id" id="id" placeholder="8~12 문자 및 숫자로 입력" required autofocus class="id_chk"/>
				<input type="submit" value="중복확인" class="inbtn"/>
			</div>
		</form>
		<script>
		function invaildCheck(f){
			var id = f.id.value;
			id = id.trim();
			if(id.length<8 || id.length>12){
				alert("아이디는 글자수가 8이상~12이하 이어야 합니다.")
				return false;
			}
		}
		</script>
	</div>
</body>
</html>