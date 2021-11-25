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
		out.println("<li><a href='./admin_logout.jsp'>로그아웃</a></li>");
	} else {
		//관리자가 아니면 다시 관리자 로그인 페이지로 이동
		out.println("<li><a href='./admin_login.jsp'>로그인</a></li>");
	}
%>
	 			<li><a href="./agreement.jsp">회원가입</a></li>
			 </ul>
		</nav>
        <nav class="gnb">
            <ul class="menu">
                <li><a href="GetMemberListCtrl" class="dp1">회원관리</a>
                             <ul class="sub">
                                <li><a href="addMemberForm.jsp">회원 등록</a></li>
                                <li><a href="GetMemberListCtrl">회원 수정</a></li>
                                <li><a href="GetMemberListCtrl">회원 삭제</a></li>
                            </ul>
                </li>
                <li><a href="GetNoticeListCtrl" class="dp1">공지사항 관리</a>
                             <ul class="sub">
                                <li><a href="addNoticeForm.jsp">공지사항 등록</a></li>
                                <li><a href="GetNoticeListCtrl">공지사항 수정</a></li>
                                <li><a href="GetNoticeListCtrl">공지사항 삭제</a></li>
                            </ul>
                </li>
                <li><a href="GetProductListCtrl" class="dp1">상품 관리</a>
                            <ul class="sub">
                                <li><a href="addProductForm.jsp">상품 등록</a></li>
                                <li><a href="GetProductListCtrl">상품 수정</a></li>
                                <li><a href="GetProductListCtrl">상품 삭제</a></li>
                            </ul>
                </li>
                <!--  
                <li><a href="GetBoardListCtrl" class="dp1">게시판 관리</a>
                             <ul class="sub">
                                <li><a href="addBoardForm.jsp">게시판 등록</a></li>
                                <li><a href="GetBoardListCtrl">게시판 수정</a></li>
                                <li><a href="GetBoardListCtrl">게시판 삭제</a></li>
                            </ul>
                </li>
                -->
                <li><a href="GetGallaryListCtrl" class="dp1">갤러리 관리</a>
                             <ul class="sub">
                                <li><a href="addGallaryForm.jsp">갤러리 사진 등록</a></li>
                                <li><a href="GetGallaryListCtrl">갤러리 사진 수정</a></li>
                                <li><a href="GetGallaryListCtrl">갤러리 사진 삭제</a></li>
                            </ul>
                </li>
                <li><a href="GetAdminListCtrl" class="dp1">관리자 정보</a>
                             <ul class="sub">
                                <li><a href="">관리자 정보</a></li>
                                <li><a href="">로그아웃</a></li>
                            </ul>
                </li>
            </ul>
        </nav>   
    </header>