<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 관리자모드 </title>
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
		 		
      	//int mM = (Integer)session.getAttribute("membermanager");
      	
      	//String mN = (String)session.getAttribute("membername");
   			
      	// 아이디 가 null이면 로그인 안한거
      	//System.out.println((Integer)session.getAttribute("membermanager"));
      	int a =(Integer)session.getAttribute("membermanager");
      	
      	if (Integer.toString(a) == null)   // ID가 null이면 로그인 진행
      		response.sendRedirect("MainPage.jsp"); 
      	else if (a==0)
      		response.sendRedirect("BookMain.jsp"); 
      		
      	
      	
			%>
	<form action="#" name="person_info" method="POST">
      <fieldset style="width:1920px, height:150px">
         
            <div style="width:250px; height:150px; float:left;"> 
               <ul>
                <li class="menu">
               <a><img src="자료검색.png" alt="자료검색"/></a>
               <ul class="hide">
                  <li><a href="BookMain.jsp">통합검색</a></li>
                 <li> 인기자료</li>
                 <li> 회원도서 신청</li> 
                
               </ul>
             </li>
            </ul>
         </div>
         <div  style="width:250px; height:150px;float:left;"> 
         <ul>
             <li class="menu">
            <a><img src="내 정보.png" alt="내 정보"/></a>
            <ul class="hide">
            <li> <a href="viewMyBook.jsp">대여도서</a></li>
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
        <button type="button" onclick="location.href='MainPage.jsp';">로그아웃</button>
      </div>
      <div style='width:170px;float: right;'>
      <%
      	String nM = (String)session.getAttribute("membername");
      	if (nM == null)
      		response.sendRedirect("MainPage.jsp");
      	else
      		out.println(""+nM+"님 안녕하세요. <p>");
			%>
			</div>
      
      </fieldset>
      
   </form>
   <%
			String gettitle = request.getParameter("title");
   		session.setAttribute("gettitle", gettitle);
   %>
  	<br><br>
	
	<div id = "div1" style = "float:left;">
	
	<table border="1",align = "LEFT">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="20%">
			<col width="3%">
			<col width="3%">
			<col width="3%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>저자</th>
				<th>장르</th>
				<th>상태</th>
				<th>대출</th>
				<th>수정</th>
				
			</tr>
		</thead>
	</table>
	<style>
	
		#div2 table{width: 1250px;  }
		
	</style><%--- 
	</div>
	<div id="div1" float:right;">
	---%>
	<hr>
	<table>
		 <colgroup>
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="20%">
			<col width="3%">
			<col width="3%">
			<col width="3%">
		</colgroup>
			
		
	<% 
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//con = DriverManager.getConnection(url, user, pw);


		String sql = "SELECT num,title,author,genre,state from book";
		pstmt = con.prepareStatement(sql);


		rs = pstmt.executeQuery();


		int count = 1;
		
		while(rs.next()){
			int num = rs.getInt("num");
			String snum = Integer.toString(num);
			String title = rs.getString("title");
			String author = rs.getString("author");
			String genre = rs.getString("genre");
			int state = rs.getInt("state");
			String hr = "'drawCheck.jsp?num="+snum+"'";
			String man = new String("'manageMenu.jsp?title=" + rs.getString("title") + "'");
			String bor= new String("'borrowBook.jsp?title=" + rs.getString("title") + "'");

			%>  
			<tbody>
				<tr>
					<td align = "center"><%=num %></td>
					<td align = "center"><%=title%></td>
					<td align = "center"><%=author%></td>
					<td align = "center"><%=genre%></td>
					<td align = "center"><%=state%></td> 
					<td align = "center"> <a href=<%=bor%>> □ </a> </td>
					 
					<td align = "center"> <a href=<%=man%>> X </a> </td>
				
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
	
		#div1 table{width: 1250px;  }
		#div1 {max-height: 500px; overflow-y: scroll; width: 1250px;}
		
	</style>
	
	</div>
	
	<div style = "float : left;">
	
	<fieldset style="width:180px">
			<legend> 관리자메뉴 </legend><p>
			<div align="center"><br><br>
				검색어 : <br>
				<form action="searchBookEx.jsp" method="POST" name="loginForm">
					<input type="text" name = "search"><br><br>
					<input type ="submit" value="도서 검색" onclick="location.href='searchBookEx.jsp"><br><br>
				</form>
				<input type ="button" value="도서 등록" onclick="location.href='insertBook.jsp'"><br><br>
				<input type ="button" value="도서 삭제" onclick="location.href='removeBook.jsp'"><br><br>
				<input type ="button" value="도서 수정" onclick="location.href='updateBook.jsp'"><br><br>
			</div>
		</fieldset>	
	</div>
	
	

</body>
</html>	