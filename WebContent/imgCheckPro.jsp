<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*"  %>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>
</head>
<body>
<%
	//캐릭터셋을 UTF-8로 설정(request, response)
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String originalFile, uploadFile;
	try {
		int maxSize= 1024*1024*10;
		String saveDirectory = "D:\\CSY\\eclipse_jsp\\web02\\WebContent\\img";
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());
		originalFile =multi.getOriginalFileName("p_pic");
		uploadFile =multi.getFilesystemName("p_pic");
		//여러파일일 경우
		//Enumeration formNames = multi.getFileNames();
	if(uploadFile==null){
		out.println("<p> 해당이미지가 업로드 되지 못했습니다.</p>");
	} else {
		
		
%>
		<div class="wrap">
		<h3 class="pop_tit">사진 업로드 완료</h3>
		<p><%=uploadFile%>가 업로드 되었습니다.</p>
		<button onclick ="javascript:apply('<%=uploadFile%>')" class="inbtn">적용하기</button>
		<p>적용을 눌러야만 업로드된 이미지로 이미지를 사용할 수 있습니다.</p>
		</div>
		
<%
	}
 %>
	<script>
	function apply(id){
		//opener 부모창
		opener.document.pform.p_img.value=id;
		opener.document.pform.imgck.value="yes";
		window.close();
	}
	</script>
<%
	} catch (Exception e) {
		System.out.println("파일 업로드가 실패했습니다.");
		e.printStackTrace();
	}

%>

</body>
</html>
