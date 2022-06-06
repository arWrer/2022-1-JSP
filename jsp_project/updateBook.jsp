<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보수정</title>
	
</head>	
<body>
	<hr>
	<%
		if ((String)session.getAttribute("memberId") == null)   // ID가 null이면 로그인 진행
      		response.sendRedirect("Login.jsp"); 
		
	%>
	<form action="updateBookEx.jsp" method="POST" name="updateForm">
		<fieldset style="width:180px">
			<legend> 도서등록 </legend><p>
				title : <br>
				<input type ="text" name = "btitle"><br><br>
				author : <br>
				<input type="text" name = "author"><br><br>
				genre : <br><p>
				<input type="checkbox" name = "genre" value="철학">철학	
				<input type="checkbox" name = "genre" value="종교">종교
				<input type="checkbox" name = "genre" value="사회과학">사회과학 <p>
				<input type="checkbox" name = "genre" value="자연과학">자연과학 
				<input type="checkbox" name = "genre" value="기술과학">기술과학
				<input type="checkbox" name = "genre" value="예술">예술 <p>
				<input type="checkbox" name = "genre" value="언어">언어
				<input type="checkbox" name = "genre" value="문학">문학
				<input type="checkbox" name = "genre" value="역사">역사 <p>
				<hr>
				
				
			<div align="center">
				
				<input type ="submit" value="수정완료">
			</div>
		</fieldset>	
	</form>
</body>
</html>