

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* " %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.company.model.ProductVO"  %>
<%
	//GetNoticeListCtrl에서 보내온 데이터를 받기
	ArrayList<ProductVO> prodList = (ArrayList<ProductVO>) request.getAttribute("productList");
%>    
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
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<style>
	.tit { margin:30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb {width: 1000px;margin:20px auto;}
	.tb th, .tb td { line-height:36px; border-bottom:1px solid #333; text-align: center;}
	.tb td img{ width:100px; height:auto; vertical-align: middle;}
	.tb th { border-top:2px solid #333; background:#ffd35e; }
	.tb tbody tr:nth-child(2n) td { background:#fff6de; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	</style>
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
					<input type="text" class="p_indata" name="p_num" placeholder="상품코드입력" required /><br><br>
					<input type="button" class="in_btn" name="chk_button" value="상품코드체크" onclick="codeCheck()"/>
					<input type="hidden" name="codeck" value="" id="codeck" required>			
				</td>
				<td><input type="text" class="p_indata" name="p_name" placeholder="상품이름입력" required ></td>
				<td><input type="text" class="p_indata" name="p_price" placeholder="상품가격입력" required ></td>
				<td><input type="text" class="p_indata" name="p_cnt" placeholder="상품수량입력" required ></td>
				<td>
					<input type="text" class="p_indata" name="p_img" placeholder="상품이미지" required ><br><br>
					<input type="button" class="in_btn" name="chk_button" value="이미지업로드" onclick="imgCheck()" readonly/>
					<input type="hidden" name="imgck" value="" id="imgck" required>			
				</td>
			</tr>

	</table>
			<div class="btn_wrap">			
				<input type="submit" value="상품등록" class="in_btn">
				<input type="reset"  value="취소" onclick="javascript:history.back();" class="in_btn"/>
			</div>
	</form>
	
  	<h2 class="fr_tit">상품목록</h2>        
	<form action="deleteProductCtrl" method="post" name="delForm">
	<table class="tb">
		<thead>
			<tr>
				<th class="item1">번호</th>
				<th class="item2">상품코드</th>
				<th class="item3">상품제목</th>
				<th class="item4">상품가격</th>
				<th class="item5">상품수량</th>
				<th class="item6">상품이미지</th>
				<th class="item7">편집</th>
			</tr>
		</thead>
		<tbody>
<%
	int cnt=0;
	for(int i=0;i<prodList.size();i++) {		//한 튜플씩 불러다 출력하기
		cnt=i+1;
		ProductVO prod = prodList.get(i);
%>		
			<tr>
				<td class="item1"><%=cnt %></td>
				<td class="item2"><a href="EditNoticeFormCtrl?id=<%=prod.getPronum() %>"><%=prod.getPronum() %></a></td>
				<td class="item3"><%=prod.getProname() %></td>
				<td class="item4"><%=prod.getProprice() %></td>
				<td class="item5"><%=prod.getProcnt() %></td>
				<td class="item6"><img src='./img/<%=prod.getProimg() %>'  alt='' /></td>
				<td class="item7">
					<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=prod.getPronum()%>"/>
				</td>
			</tr>
<%
	}
%>			
		</tbody>
	</table>
		<div class="btn_wrap">	
			<button type="submit" class="in_btn" onclick="">삭제</button>
			<button type="reset" class="in_btn" onclick="">취소</button>
		</div>	
	</form>
	<script>
	function frm_submit(f){
		var sel='input[name="ck"]:checked';
		var item=document.querySelectorAll(sel);
		var cnt=item.length;
		if(cnt==0){
			alert("삭제할 요소를 선택하지 않았습니다.")
			return false;
		} else {
			var qt=confirm("정말로 삭제하시겠습니까?")
			if(qt){
				f.submit();
			} else{
				return false;
			}
		}
	}
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
	</div>
	  <!-- 푸터 -->
  <%@ include file = "footer.jsp" %>
</body>
</html>
