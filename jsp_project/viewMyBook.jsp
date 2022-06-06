<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Members List </title>
	 <style>
    .menu a{cursor:pointer;}  
    
    .menu .hide{display:none;}
   </style>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <script>
    $(document).ready(function(){
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        }).mouseover(function(){
            $(this).next("ul").slideDown();
        });
    });
   </script>
   
</head>
<body>
	
	<%
      	
      	if ((String)session.getAttribute("memberId") == null)   // ID가 null이면 로그인 진행
      		response.sendRedirect("Login.jsp"); 
			%>
	<h1>도서 정보</h1>
	<form action="#" name="person_info" method="POST">
      <fieldset style="width:1920px, height:150px">
         
            <div style="width:250px; height:150px; float:left;"> 
               <ul>
                <li class="menu">
               <a><img src="자료검색.png" alt="자료검색"/></a>
               <ul class="hide">
                  <li> <a href="BookMain.jsp">통합검색</a></li>
                 <li> 인기자료</li>
                 <li> 회원도서 신청</li> 
                         
               </ul>
             </li>
            </ul>
         </div>
         <div style="width:250px; height:150px;float:left;"> 
         <ul>
             <li class="menu">
            <a><img src="내 정보.png" alt="내 정보"/></a>
            <ul class="hide">
            <li> <a href="viewMyBook.jsp">대여정보</a></li>
           <li> 정보수정</li>
           <li> 희망도서 신청내역</li>
           
            </ul>
          </li>
         </ul>
      </div>
      <div style="width:150px; height:150px;float:left;"> 
      <ul>
          <li class="menu">
            <a><img src="도서관 정보.png" alt="도서관 정보"/></a>
            <ul class="hide">
               <li> 인삿말</li>
              <li> 연혁</li>
              <li> 도서관 현황</li>
            </ul>
          </li>
         </ul>
      </div>
      <div style='width:80px;float: right;'>
        <button type="button" onclick="location.href='Login.jsp';">로그아웃</button>
      </div>
      <div style='width:170px;float: right;'>
      <%
      	String nM = (String)session.getAttribute("membername");
      	if (nM == null){
      		response.sendRedirect("MainPage.jsp");
      	}
      	else
      		out.println(""+nM+"님 안녕하세요. <p>");
			%>
			</div>
      
      </fieldset>
      
   </form>
	<br><br>
	
	<div id = "div1">
	
	<table border="1",align = "LEFT">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="20%">
			<col width="3%">
			<col width="3%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>저자</th>
				<th>장르</th>
				<th>반납</th>
				
			</tr>
		</thead>
	</table>
	<style>
	
		#div2 table{width: 1200px;  }
		
	</style>
	<hr>
	<table>
		 <colgroup>
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="20%">
			<col width="3%">
			<col width="3%">
		</colgroup>
	<% 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String Id = (String)session.getAttribute("memberId");
		String sql = "SELECT num,title,author,genre from book where name = '"+Id+"' ";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next()){
			int num = rs.getInt("num");
			String title = rs.getString("title");
			String author = rs.getString("author");
			String genre = rs.getString("genre");
			String bor= new String("'returnBook.jsp?title=" + rs.getString("title") + "'");

			%>  
			<tbody>
				<tr>
					<td align = "center"><%=num %></td>
					<td align = "center"><%=title%></td>
					<td align = "center"><%=author%></td>
					<td align = "center"><%=genre%></td>
					<td align = "center"> <a href=<%=bor%>> □ </a> </td>
				
				</tr>
			</tbody>
			<%
			count++;
			} %>
		</table>
		
		<%
			rs.close();
			pstmt.close();
			con.close();
		%>
	<hr>
	<style>
		#div1 table{width: 1200px;  }
		#div1 {max-height: 500px; overflow-y: scroll; width: 1200px;}
	</style>
	</div>
</body>
</html>	