<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %>
   
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
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/ban.css">
    <link rel="stylesheet" href="./css/form.css">

</head>

<body>
	<div class="wrap">
  <!-- 헤더 -->
  
  <%@ include file = "admin_header.jsp" %>
	<h2 class="fr_tit">상품등록</h2>        
	<form action="insertProductPro.jsp" class="frm" method="post" name="pform">
	<table class="tbl_product">
			<tr>
				<th>상품코드</th>
				<th>상품이름</th>
				<th>상품가격</th>
				<th>상품수량</th>
				<th>상품이미지</th>
				
			</tr>
			<tr>
				<td>
					<input type="text" class="p_indata" name="p_num" placeholder="상품코드입력" required /><br><br><input type="button" class="inbtn" name="chk_button" value="상품코드체크" onclick="codeCheck()"/>
					<input type="hidden" name="codeck" value="" id="codeck" required>			
				</td>
				<td><input type="text" class="p_indata" name="p_name" placeholder="상품이름입력" required ></td>
				<td><input type="text" class="p_indata" name="p_price" placeholder="상품가격입력" required ></td>
				<td><input type="text" class="p_indata" name="p_cnt" placeholder="상품수량입력" required ></td>
				<td>
					<input type="text" class="p_indata" name="p_img" placeholder="상품이미지" required ><br><br><input type="button" class="inbtn" name="chk_button" value="이미지업로드" onclick="imgCheck()" readonly/>
					<input type="hidden" name="imgck" value="" id="imgck" required>			
				</td>
			</tr>

	</table>
			<div class="btn_box">			
				<input type="submit" value="상품등록" class="inbtn">
				<input type="reset"  value="취소" onclick="javascript:history.back();" class="inbtn"/>
			</div>
	</form>
	</div>
<script>
function codeCheck(){
	window.open("codeCheckForm.jsp","pcodecheck","width=300,height=300");
}
function imgCheck(){
	window.open("imgCheckForm.jsp","pcodecheck","width=300,height=300");
}
function pCheck(f) {
	if(f.codeck.value!="yes" || f.imgck.value!="yes"){
		alert("상품코드 및 이미지 체크가 되어 있지 않습니다.");
		return false;
	}
}
</script>
<%@ include file = "footer.jsp" %>
</body>
</html>