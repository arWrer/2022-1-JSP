<%@ page import = "java.sql.*" %>    
<%
	Connection con = null;
	
	String url = "jdbc:mysql://localhost:3306/javaproject";
	String user = "root";
	String passwd = "tjddbs6262";
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd);
%>    