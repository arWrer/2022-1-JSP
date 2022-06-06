<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
	<% 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//con = DriverManager.getConnection(url, user, pw);

		int count = 1;
		String u_id = request.getParameter("id");
		String u_pw = request.getParameter("passwd");
		String sql = "SELECT * FROM user where id = '" + u_id +"' and pw = '"+ u_pw +"';";
		pstmt = con.prepareStatement(sql);


		rs = pstmt.executeQuery();
		 if(rs.next()){
	         String id = rs.getString("id");
	         String pw = rs.getString("pw");
	         String name = rs.getString("name");
	         int manager = rs.getInt("manager");
	         
	         /* if(id.equals("space") && pw.equals("123456")){
	            
	            session.setAttribute("memberId", id);
	            session.setAttribute("memberPw", pw);
	            
	            out.println("새로운 세션 생성 성공 ! <br>");
	            out.println("관리자 [ " + id + " ]님이 입장하였습니다. <p>");
	            
	            response.sendRedirect("loginSuccess.jsp");
	         }
	         else if(u_id.equals(id) && u_pw.equals(pw)){
	            session.setAttribute("memberId", id);
	            session.setAttribute("memberPw", pw);
	            
	            out.println("새로운 세션 생성 성공 ! <br>");
	            out.println("사용자 [ " + id + " ]님이 입장하였습니다. <p>");
	            
	            response.sendRedirect("membersList.jsp");
	         } */
	         if(u_id.equals(id) && u_pw.equals(pw)){
		            session.setAttribute("memberId", id);
		            session.setAttribute("membername", name);
		            session.setAttribute("membermanager", manager);
		          
		            
		            if (manager == 0 )
		            	response.sendRedirect("BookMain.jsp");
		            else if ( manager == 1)
		            	response.sendRedirect("manageMenu.jsp");
	         }
	      }
	      else{
	         response.sendRedirect("Login.jsp");
	      }
	      rs.close();
	      pstmt.close();
	      con.close();
	   %>



