<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
  String uid = (String) session.getAttribute("id");
  if(uid!=null){
  session.removeAttribute("id");
  session.removeAttribute("pw");
  
 }
  response.sendRedirect("admin.jsp");
%>