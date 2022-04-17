<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<form action="#" name="person_info" method="POST">
      <fieldset style="width:500px, height:600px">
         
            <div style="width:250px; height:300px; float:left;"> 
               <ul>
                <li class="menu">
               <a><img src="자료검색.png" alt="자료검색"/></a>
               <ul class="hide">
                  <li> 통합검색</li>
                 <li> 인기자료</li>
                 <li> 회원도서 신청</li>            
               </ul>
             </li>
            </ul>
         </div>
         <div style="width:250px; height:300px;float:left;"> 
         <ul>
             <li class="menu">
            <a><img src="내 정보.png" alt="내 정보"/></a>
            <ul class="hide">
            <li> 대출정보확인</li>
           <li> 정보수정</li>
           <li> 희망도서 신청내역</li>
            </ul>
          </li>
         </ul>
      </div>
      <div style="width:150px; height:300px;float:left;"> 
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
         <input type='submit'  value='로그인'>
      </div>
      </fieldset>
   </form>

</body>
</html>