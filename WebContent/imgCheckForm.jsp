<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 체크폼</title> 
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
		<h3 class="pop_tit">이미지 업로드 확인</h3>
		<form action="imgCheckPro.jsp" method="post" onsubmit="return invaildCheck(this)" enctype="multipart/form-data">
			<div class="item_fr">
				<label for="pcode" class="lb">이미지 : </label>
				<input type="file" name="p_pic" id="p_pic" placeholder="8~12 문자 및 숫자로 입력" required class="id_chk"/>
				<input type="submit" value="이미지 업로드" class="inbtn"/>
			</div>
		</form>
		<script>
		function invalidCheck(f) {
			var p_pic = f.p_pic.value;
			p_pic = p_pic.trim();
			if(p_pic.length<=0) {
				alert("이미지가 업로드 되지 않았습니다.");
				return false;
			}
		}
		</script>
	</div>
</body>
</html>