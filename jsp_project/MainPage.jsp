<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
   <style>
    .menu a{cursor:pointer;}  
    
    .menu .hide{display:none;}
   </style>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script>
    	document.getElementByid("test").sytle.display="none"; 
			document.getElementByid("test").sytle.display="block";
			$("#test").hide(); 
			$("#test").show();
		</script>
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
        $(".menu:eq(1)>a").click();
    });
   </script>
</head>
<body>
<%
	session.removeAttribute("membername");
	session.removeAttribute("memberId");
	session.removeAttribute("membermanager");
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
         <div style="width:250px; height:150px;float:left;"> 
         <ul>
             <li class="menu">
            <a><img src="내 정보.png" alt="내 정보"/></a>
            <ul class="hide">
            	<li> <a href="viewMyBook.jsp">내정보</a></li>
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
        <button type="button" onclick="location.href='Login.jsp';">로그인</button>
      </div>
      <div style='width:170px;float: right;'>
      <%
      	String nM = (String)session.getAttribute("membername");
      	if (nM == null)
      		out.println("");
      	else
      		out.println(""+nM+"님 안녕하세요. <p>");
			%>
			</div>
      
      </fieldset>
   </form>
   <form>
   		
   </form>

</body>
</html>