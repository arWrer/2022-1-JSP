<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script type = "text/javascript">
		function check()
		{
			var f = document.loginForm;
			
			var sid =f.id.value;
			var regExpId =/^[a-z0-9]*$/;
			
			var pw = f.passwd.value;
			var regExpPasswd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&].{4,16}$/;
			
			if(f.id.value.length < 4 || f.id.value.length > 16)
	         {
	            alert("아이디는 4~16자 이내로 입력해야 합니다.");
	            f.id.focus();
	            return false;
	         }
			else if(!regExpId.test(sid))
	         {
	            alert("아이디은 영문 또는 숫자로만 입력해야합니다");
	            f.id.focus();
	            return false;
	         }
			
			else if (!regExpPasswd.test(pw))
					{
						alert("비밀번호는 숫자로만 입력해주세요");
						f.passwd.focus();
						return false;
					}
			
		}
	</script>
</head>
<body>
	<hr>
	<form action="alram.jsp" method="POST" name="loginForm"
			onsubmit="return check()">
		<fieldset style="width:180px">
			<legend> 로그인 </legend><p>
				ID : <br>
				<input type ="text" name = "id"><br><br>
				PW : <br>
				<input type="text" name = "passwd"><br><br>
				<hr>
			<div align="center">
				<input type="submit" value="로그인">&nbsp;
				<input type ="button" value="회원가입" onclick="location.href='SignUp.jsp'">
			</div>
		</fieldset>	
	</form>

</body>
</html>