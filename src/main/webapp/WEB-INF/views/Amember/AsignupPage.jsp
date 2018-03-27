<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BigStar Login</title>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
</script>
<script>

$(document).ready(function(){
	//셀렉트박스에서 이메일 선택시 해당 이메일이 문자열로 input에 삽입됩니다.
	$('#mailBox').on('change', selectEmail);
	
	//비밀번호 재입력이 유효한지 체크합니다.
	$('#inputPasswordConfirm').on('input', checkPw);
	
	//회원가입 양식을 올바르게 입력했는지 유효성을 검사합니다.
	$('#AsignupReq').on('click', checkForm);
	
	//홈으로 돌아갑니다.
	$('#goHome').on('click', function(){
		location.href="/bigstar/";
	});
	
});

//회원가입양식 순차검사합니다. 차후 바뀔 수 있는 부분이라 일단 가볍게 작성.
function checkForm(){
	
	var inputId = document.getElementById('inputId').value;
	var inputPassword = document.getElementById('inputPassword').value;
	var inputPasswordConfirm = document.getElementById('inputPasswordConfirm').value;
	var emailA = document.getElementById('emailA').value;
	var emailB = document.getElementById('emailB').value;
	
	//아이디 체크
	if(inputId.length >= 7)
	{
		//비밀번호체크
		if(inputPassword.length >= 8)
		{
			//비밀번호확인체크
			if(inputPasswordConfirm == inputPassword)
			{
				//이메일체크
				if(emailA.length >= 1)
				{
					//이메일2체크
					if(emailB.length >= 4 && emailB.indexOf('.') != -1)
					{
						location.href="AsignupReq";
					}
					else{
						alert('이메일 형식을 확인하세요');
					}
				}//이메일체크
				else{
					alert('이메일 입력하세요');
				}
			}//비밀번호확인체크
			else{
				alert('위와 동일한 비밀번호');	
			}
		}//비밀번호 체크
		else{
			alert('비밀번호 8자 이상');
		}
	}//아이디체크
	else{
		alert('아이디7자이상');
	}
}

//input이벤트마다 함수가 실행되어 유효성을 검사합니다.
function checkPw(){
	
	var pw1 = $('#inputPassword').val();
	var pw2 = $('#inputPasswordConfirm').val();
	
		if(pw1 == pw2)
		{
			$('#checkpw').html('');
		}
		else
		{
			$('#checkpw').html('위와 동일해야합니다');
		}

}

//셀렉트 박스가 Change되었을때 실행됩니다. 해당 옵션을 선택하면 이메일 작성란에 문자열이 삽입됩니다.
function selectEmail(){
	//alert('대답');
    var typeMail = document.getElementById('mailBox');
    var msg = typeMail.value;
    
    if(msg == '직접입력')
    {
    	document.getElementById('emailB').value = '';
    }
    else
    {
    	document.getElementById('emailB').value = msg;
    }
}


</script>

<style type="text/css">

.button{

cursor: pointer;
text-align: center;
margin: 3px;

}

.borderIb{

display: inline-block;
border: 1px dotted black;
margin: 4px;

}

.borderI{

display: inline-block;
border: 1px dotted black;
width: 100%;
margin: 4px;

}

</style>

</head>
<body>

	<header>
		<%@ include file="header.jsp" %>
	</header>
	
		<article class="borderI" style="margin: 8px;">
			<form action="AsignupReq">
				<table>
					<tr>
					  <th>아이디</th>
					  <td><input type="text" id="inputId" name="id" placeholder="아이디를 입력하세요" required="required" autofocus="autofocus" /></td>
					</tr>
					<tr>
					  <th>비밀번호</th>
					  <td><input type="password" id="inputPassword" name="password" placeholder="비밀번호를 입력하세요" required="required"/></td>    
					</tr>
					<tr>
					  <th>비밀번호 확인</th>
					  <td><input type="password" id="inputPasswordConfirm" name="password" placeholder="비밀번호를 다시 입력하세요" required="required"/></td>
					  <td id="checkpw" style="color: red;"></td>    
					</tr>
					<tr>
					  <th>이메일</th>
					  <td>
					  	<input id="emailA" name="emailA" required="required"/>
					  		@
					  	<input id="emailB" name="emailB" required="required"/>
					  	<select id="mailBox">
					  		<option selected="selected">직접입력</option>
					  		<option>naver.com</option>
					  		<option>daum.net</option>
					  		<option>gmail.com</option>
					  	</select>
					  </td>    
					</tr>
					
				</table>
				
				<!-- div로 버튼모양 내서 만들었습니다.  -->
				<div style="margin: 10px; margin-left: 10%; ">
					<div id="AsignupReq" class="borderIb button">가입하기</div>
					<div id="goHome" class="borderIb button">취소</div>
				</div>
			</form>
		</article>
		
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>


</body>
</html>