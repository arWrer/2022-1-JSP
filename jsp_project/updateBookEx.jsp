<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<html>

<%
	
	String gettitle = request.getParameter("btitle");
	String getauthor = request.getParameter("author");
	String getgenre = request.getParameter("genre");
	
	String title = (String)session.getAttribute("gettitle");
	String sql = "update book set title = '"+gettitle+"',author = '"+getauthor+"',genre = '"+getgenre+"' where title = '"+title+"'";
	PreparedStatement sm = con.prepareStatement(sql);

	int count = sm.executeUpdate();
	if(count == 1){
		response.sendRedirect("BookMain.jsp");
	}else{
		out.println("업데이트 실패!");
	}
	session.removeAttribute("title");
		

	sm.close();
	con.close();	
%>