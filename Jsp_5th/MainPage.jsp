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
 
            // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
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
               <a><img src="�ڷ�˻�.png" alt="�ڷ�˻�"/></a>
               <ul class="hide">
                  <li> ���հ˻�</li>
                 <li> �α��ڷ�</li>
                 <li> ȸ������ ��û</li>            
               </ul>
             </li>
            </ul>
         </div>
         <div style="width:250px; height:300px;float:left;"> 
         <ul>
             <li class="menu">
            <a><img src="�� ����.png" alt="�� ����"/></a>
            <ul class="hide">
            <li> ��������Ȯ��</li>
           <li> ��������</li>
           <li> ������� ��û����</li>
            </ul>
          </li>
         </ul>
      </div>
      <div style="width:150px; height:300px;float:left;"> 
      <ul>
          <li class="menu">
            <a><img src="������ ����.png" alt="������ ����"/></a>
            <ul class="hide">
               <li> �λ�</li>
              <li> ����</li>
              <li> ������ ��Ȳ</li>
            </ul>
          </li>
         </ul>
      </div>
      <div style='width:80px;float: right;'>
         <input type='submit'  value='�α���'>
      </div>
      </fieldset>
   </form>

</body>
</html>