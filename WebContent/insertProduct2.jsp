<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품등록</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="header.jsp" %>
	<h1>상품 등록</h1>
	<!-- 상품 등록 폼 -->
	<form action="insertProductPro2.jsp" class="frm" method="post" name="pform" onsubmit="return pCheck(this)">
		<table>
			<tr>
				<th class="item_name">
					<label for="p_num">상품코드</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_num" id="p_num" class="in_data" placeholder="상품코드입력" required />
					<input type="button" value="상품코드 중복체크" class="in_btn" onclick="codeCheck()" />
					<input type="hidden" value="" name="codeck" id="codeck" />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_name">상품명</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_name" id="p_name" class="in_data" placeholder="상품명 입력" required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_price">가격</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_price" id="p_price" class="in_data" placeholder="상품 가격 입력"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_cnt">수량</label>
				</th>
				<td class="item_val">
					<input type="number" name="p_cnt" id="p_cnt" class="in_data" required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_img">이미지</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_img" id="p_img" class="in_data"/>
					<input type="button" value="이미지 업로드 체크" class="in_btn" onclick="imgCheck()" />
					<input type="hidden" value="" name="imgck" id="imgck" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="제품등록" class="in_btn"/></td>
				<td><input type="reset" value="취소" class="in_btn"/></td>
			</tr>
		</table>
	</form>
	<script>
	function codeCheck() {
		window.open("codeCheckForm.jsp", "pcodecheck", "width=300, height=300");
	}
	function imgCheck() {
		window.open("imgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	function pCheck(f) {
		if(f.codeck.value!="yes" || f.imgck.value!="yes"){
			alert("상품코드 및 이미지 체크가 되어 있지 않습니다.");
			return false;
		}
	}
	</script>	
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>