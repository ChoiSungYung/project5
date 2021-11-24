<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //기존에 로그인 했을 때 저장한 세션값을 불러와 저장
   String uid = (String) session.getAttribute("id");
   String upw = (String) session.getAttribute("pw");
   String uname = (String) session.getAttribute("name");
   
   //세션의 id값이 저장되어 있지 않으면 if문 실행하지 않고, 세션의 id값이 있으면 nvalidate() 또는 removeAttribute()로
   //세션 값을 비워 로그아웃 처리
   if(uid!=null) {
   session.invalidate();
   }
   //로그아웃 처리 후 index.jsp로 이동
   response.sendRedirect("index.jsp");
%>