<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<html>
<%
		if ((String)session.getAttribute("memberId") == null)   // ID�� null�̸� �α��� ����
      		response.sendRedirect("Login.jsp"); 
		
	%>
<%
	int getnum = request.getParameter("num");
	String gettitle = request.getParameter("btitle");
	String getauthor = request.getParameter("author");
	String getgenre = request.getParameter("genre");
	
	String title = (String)session.getAttribute("gettitle");
	String sql = "insert into book num,btitle,author,genre,state values ('"+getnum+"','"+gettitle+"','"+getauthor+"','"+getgenre+"',0";
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