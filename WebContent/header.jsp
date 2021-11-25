<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <header class="hd">
    	<nav class="tnb">
			 <ul>
<%
	String uid = (String) session.getAttribute("id");
	if(uid!=null) {
		//관리자로 로그인 정보가 있으면 "admin님"으로 출력
		out.println("<li><a>"+uid+"님 환영합니다!</a></li>");
		out.println("<li><a href='./logout.jsp'>로그아웃</a></li>");
	} else {
		//관리자가 아니면 다시 관리자 로그인 페이지로 이동
		out.println("<li><a href='./login.jsp'>로그인</a></li>");
	}
%>
	 			<li><a href="./admin.jsp">관리자모드</a></li>
	 			<li><a href="./agreement.jsp">회원가입</a></li>
	 			<li><a href="./companyinfo.jsp">회사소개</a></li>
			 	<li><a href="">사이트맵</a></li>
			 	<li><a href="">고객센터</a></li>
			 </ul>
		</nav>
        <nav class="gnb">
        
            <ul class="menu">
                <li><a href="" class="dp1">예매하기</a>
                             <ul class="sub">
                                <li><a href="">빠른 예매하기</a></li>
                                <li><a href="">개봉영화 목록</a></li>
                            </ul>
                </li>
                <li><a href="./movieSearch.jsp" class="dp1">영화검색</a>
                             <ul class="sub">
                                <li><a href="">일간 박스오피스 조회</a></li>
                                <li><a href="">영화 큐레이션</a></li>
                                <li><a href="">영화배우 통합검색</a></li>
                            </ul>
                </li>
                <li><a href="" class="dp1">예매가이드</a>
                            <ul class="sub">
                                <li><a href="">예매 방법 안내</a></li>
                                <li><a href="">쿠폰구매 및 이용 안내</a></li>
                            </ul>
                </li>
                <li><a href="" class="dp1">쿠폰등록&조회</a>
                             <ul class="sub">
                                <li><a href="">쿠폰 등록 & 조회</a></li>
                                <li><a href="">예매·취소내역 조회</a></li>
                            </ul>
                </li>
               	<li><a href="" class="dp1">고객센터</a>
                             <ul class="sub">
                                <li><a href="">공지사항</a></li>
                                <li><a href="">자주 묻는 질문</a></li>
                                <li><a href="">1:1 문의</a></li>
                                <li><a href="">나의 문의 내역</a></li>
                            </ul>
                </li>
            </ul>
        </nav>   
    </header>