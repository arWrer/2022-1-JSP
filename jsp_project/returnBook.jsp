<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<html>

<%
	

	
	String title = request.getParameter("title");

	String Id = (String)session.getAttribute("memberId");
	String sql = "UPDATE book set name = 'O' , state = 0 WHERE title = ?";
	
	//System.out.println(Id);
	PreparedStatement sm = con.prepareStatement(sql);
	sm.setString(1,title);

	int count = sm.executeUpdate();
	if(count == 1){
		response.sendRedirect("BookMain.jsp");
	}else{
		out.println("업데이트 실패!");
	}

		
	
	sm.close();
	con.close();	
%>