<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<html>

<%
	

	
	String title = (String)session.getAttribute("gettitle");
	String sql = "delete from book where title = '"+title+"'";
	PreparedStatement sm = con.prepareStatement(sql);

	int count = sm.executeUpdate();
	if(count == 1){
		response.sendRedirect("BookMain.jsp");
	}else{
		out.println("������Ʈ ����!");
	}
	session.removeAttribute("title");
		
	
	sm.close();
	con.close();	
%>