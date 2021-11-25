<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* " %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.company.model.ProductVO"  %>
<%
	//GetNoticeListCtrl에서 보내온 데이터를 받기
	ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("productList");
%>    
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title> 북스크린 | 영화 예매, 정보 검색, 다운로드까지 한 곳에서 </title>
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
	.tit { padding: 30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb { width:1200px; margin:20px auto; }
	.tb th, .tb td { width:300px; line-height:36px; border-bottom:1px solid #333; }
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
<%@ include file="admin_header.jsp" %>
	<h2 class="tit">상품목록</h2>
	<form action="DeleteProductCtrl" name="frm" id="frm" method="post" onsubmit="return frm_submit(this)">	
	<table class="tb">
		<thead>
			<tr>
				<th class="item1">번호</th>
				<th class="item2">제품명</th>
				<th class="item3">제품가격</th>
				<th class="item4">수량</th>
				<th class="item5">이미지</th>
				<th class="item6">편집</th>
			</tr>
		</thead>
		<tbody>
<%
	int cnt=0;
	for(int i=0;i<productList.size();i++) {		//한 튜플씩 불러다 출력하기
		cnt=i+1;
		ProductVO pro = productList.get(i);
		String proimg = pro.getProimg();
		if(proimg==null || proimg.equals("")) { 
			proimg = "./img/noImg.png";		
		}
%>		
			<tr>
				<td class="item1"><%=pro.getPronum() %></td>
				<td class="item2"><a href="EditProductFormCtrl?pronum=<%=pro.getPronum() %>"><%=pro.getProname() %></a></td>
				<td class="item3"><%=pro.getProprice() %></td>
				<td class="item4"><%=pro.getProcnt() %></td>
				<td class="item5">
					<img src="<%=proimg %>" alt="<%=pro.getProname() %>" />	
				</td>
				<td class="item6">
					<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=pro.getPronum() %>"/>
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
<%@ include file="footer.jsp" %>
</div>
<script>
function frm_submit(f){		//f:form 태그에서 보내온 데이터
	var sel = 'input[name="ck"]:checked';		//sel = document.getElementsByClass("ck_item");
	var item = document.querySelectorAll(sel);
	var cnt = item.length;
	if(cnt==0){	//선택체크한 체크박스가 없으면
		alert("삭제할 요소를 선택하지 않았습니다.");	//메시지만 띄우고 끝남
		return false;
	} else {		//선택체크된 체크박스가 있으면 
		var qt = confirm("정말로 삭제하시겠습니까?");		//지우기 전에 정말로 삭제할 것인지 물어서 [확인] 선택시  true 반환
		if(qt) {		//qt가 true(확인 대화상자에서 [확인]을 누른 경우)이면 폼 데이터 전송
			f.submit();	
		} else {		//qt가 false(확인 대화상자에서 [취소]를 누른 경우)이면 아무 일도 일어나지 않음
			return false;
		}
	}
}
</body>
</html>