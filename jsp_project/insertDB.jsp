<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	String age = request.getParameter("age");
	String name1 = request.getParameter("name1");
	String gender = request.getParameter("gender");
	String genre = request.getParameter("genre");
	
	String sql = "INSERT INTO user(id,pw,name,age,sex,genre,book) VALUES";
	sql += "('" + id + "','" + pw + "','" + name1 + "','" + age + "','" + gender + "','" + genre + "','NULL')";

	Statement sm = con.createStatement();
	
	int count = sm.executeUpdate(sql);
	if(count == 1){
		response.sendRedirect("signupSuccess.jsp");
	}else{
		out.println("회원가입 실패!");
		response.sendRedirect("SignUp.jsp");
	}
	sm.close();
	con.close();	
%>