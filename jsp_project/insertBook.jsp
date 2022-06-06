<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
	<%
		if ((String)session.getAttribute("memberId") == null)   // ID가 null이면 로그인 진행
      		response.sendRedirect("Login.jsp"); 
		
	%>
</head>	
<body>
	<hr>
	<form action="insertBookEx.jsp" method="POST" name="insertForm">
		<fieldset style="width:180px">
			<legend> 도서등록 </legend><p>
				num : <br>
				<input type ="text" name = "num"><br><br>
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
				
				<input type ="submit" value="등록완료">
			</div>
		</fieldset>	
	</form>
</body>
</html>