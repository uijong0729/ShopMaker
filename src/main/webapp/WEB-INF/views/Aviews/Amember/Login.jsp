<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/headerfooter.css?ver=5">
<link rel="stylesheet" href="./resources/css/login.css?ver=5">


<script src="./resources/js/jquery-3.2.1.min.js"></script>
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
	
	//아이디 중복체크
	$('#inputId').on('input', checkId);
	
	//alert('jq체크');
	$('#Alogin').on('click', function(){
	  //alert('로그인');
	  var logininputId = document.getElementById('logininputId').value; 
	  var logininputPassword = document.getElementById('logininputPassword').value; 
	    
	   if(logininputId.length >= 1) 
	   { 
	      if(logininputPassword.length >= 1) 
	      { 
	    	  $.ajax({
		  			url: 'loginAcustomer',
		  			type: 'post',
		  			data:{id: logininputId, password: logininputPassword},
		  			dataType: 'text',
		  			success: function(result){
		  				if(result == '1')
		  				{
		  					document.getElementById('AgoLogin').submit();
		  				}
		  				else{
		  					alert('아이디나 비밀번호를 확인해주세요')
		  				}
		  			}
		  		
		  			});
	      } 
	      else 
	      { 
	         alert('비밀번호를 입력하세요');          
	      } 
	   } 
	   else 
	   { 
	      alert('아이디를 입력하세요');    
	   } 

	});
	
	$('#Asignup').on('click', function(){
		//회원가입
		//location.href = "AsignupPage";
	}); 
	
});

function enterkey() {
	   if (window.event.keyCode == 13) {
		   var logininputId = document.getElementById('logininputId').value; 
			  var logininputPassword = document.getElementById('logininputPassword').value; 
			    
			   if(logininputId.length >= 1) 
			   { 
			      if(logininputPassword.length >= 1) 
			      { 
			    	  $.ajax({
			  			url: 'loginAcustomer',
			  			type: 'post',
			  			data:{id: logininputId, password: logininputPassword},
			  			dataType: 'text',
			  			success: function(result){
			  				if(result == '1')
			  				{
			  					document.getElementById('AgoLogin').submit();
			  				}
			  				else{
			  					alert('아이디나 비밀번호를 확인해주세요')
			  				}
			  			}
			  		
			  			});
			    	 
			      } 
			      else 
			      { 
			         alert('비밀번호를 입력하세요');          
			      } 
			   } 
			   else 
			   { 
			      alert('아이디를 입력하세요');    
			   } 
      }
}

function checkId(){
	var getId = $('#inputId').val();
	
	if(getId.length < 2)
		
	{
		$('#AIdCheckMsg').html('2글자 이상 입력해주세요');
	}
	else
	{
		$.ajax({
			url: 'isThereId',
			type: 'post',
			data:{id: getId},
			dataType: 'text',
			success: function(checkid){
				if(checkid != '')
				{
					$('#AIdCheckMsg').html('이미 존재하는 id입니다.');
					$('#AsignupReq').hide();
				}
				else{
					$('#AIdCheckMsg').html(getId + '는 사용가능합니다');
					$('#AsignupReq').show();
				}
			},
		
		});
	}
	
}

//회원가입양식 순차검사합니다. 차후 바뀔 수 있는 부분이라 일단 가볍게 작성.
function checkForm(){
	
	var inputId = document.getElementById('inputId').value;
	var inputPassword = document.getElementById('inputPassword').value;
	var inputPasswordConfirm = document.getElementById('inputPasswordConfirm').value;
	var emailA = document.getElementById('emailA').value;
	var emailB = document.getElementById('emailB').value;
	var name = document.getElementById('name').value;
	var phone = document.getElementById('tel').value;
	var addressA = document.getElementById('addressA').value;
	var addressB = document.getElementById('addressB').value;
	var bisNumber = document.getElementById('bisNumber').value;
	
	//아이디 체크
	if(inputId.length >= 1)
	{
		//비밀번호체크
		if(inputPassword.length >= 1)
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
						//이름체크
						if(name.length >= 1)
						{
							//주소체크
							if(addressA.length >= 1 && addressB.length >=1)
							{
								//사업자번호 체크
								if(bisNumber.length >= 1)
								{
									alert('회원가입 신청이 완료되었습니다.');
									document.getElementById('AsignupForm').submit();
								}
								else
								{
									alert('사업자 등록번호를 입력하세요');	
									return false;
								}
							}//주소체크
							else
							{
								alert('주소를 제대로 입력하세요');	
								return false;
							}
						}//이름체크
						else
						{
							alert('이름을 입력하세요');
							return false;
						}
					}
					else
					{
						alert('이메일 형식을 확인하세요');
						return false;
					}
				}//이메일체크
				else
				{
					alert('이메일 입력하세요');
					return false;
				}
			}//비밀번호확인체크
			else
			{
				alert('위와 동일한 비밀번호를 입력하세요');	
				return false;
			}
		}//비밀번호 체크
		else
		{
			alert('비밀번호 입력하세요');
			return false;
		}
	}//아이디체크
	else
	{
		alert('아이디를 입력하세요');
		return false;
	}
}

//input이벤트마다 함수가 실행되어 유효성을 검사합니다.
function checkPw(){
	
	var pw1 = $('#inputPassword').val();
	var pw2 = $('#inputPasswordConfirm').val();
	
		if(pw1 == pw2)
		{
			$('#checkpw').html('');
			$('#AsignupReq').show();
			
		}
		else
		{
			$('#checkpw').html('위와 동일해야합니다');
			$('#AsignupReq').hide();
			
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
</head>
<body>


	<header style="margin-bottom: 150px;">
		<%@ include file="../../Aheader.jsp" %>
	</header>


<br><br>

<article style="text-align: center;">

<h2 style="text-shadow: 4px 4px 4px #ccc;">로그인이 필요한 서비스입니다</h2>

<div class="main" style="text-align: center; display: inline-block;">
	
	<div style="display: inline-block;">
			<div class="switchButtons">
				<button id="signUp" onclick="switchSignUp()" >Sign Up</button>
				<button id="logIn" onclick="switchLogIn()" disabled>Log In</button>
			</div>
		
			<form id="AgoLogin" action="AgoLogin" method="post" id="AsubmitLoginForm"> 
			<div class="form" id="logInForm">
			<div class="text">어서오세요</div>
			<div class="fields">
				<input type="text" name="id" id="logininputId" placeholder="아이디를 입력하세요" class="field">
				<input type="password" name="pw" id="logininputPassword" placeholder="비밀번호를 입력하세요" class="field">
			</div>
			<button id="Alogin" onkeyup="enterkey()">Log In!</button>
			</div>
			</form>
			
			<form id="AsignupForm" action="AsignupReq" method="post">
				<div class="form" id="signUpForm">
				<div class="text">함께하세요</div>
				<div class="fields">
					<input type="text" name="id" id="inputId" placeholder="아이디를 입력하세요" required="required" autofocus="autofocus" class="field">
					<div id="AIdCheckMsg" style="color:white"></div>
					<input type="password" id="inputPassword" name="password" placeholder="비밀번호를 입력하세요" required="required" class="field"/>
					<input type="password" id="inputPasswordConfirm" placeholder="비밀번호를 다시 입력하세요" required="required" class="field"/>
					<div id="checkpw"  style="color: white;"></div>		
					<div class="name">
						<input id="emailA" name="emailA" required="required" class="field"/>
						<div class="text1">@</div>
						<input id="emailB" name="emailB" required="required" class="field"/>
						<select id="mailBox" class="field">
								  		<option selected="selected">직접입력</option>
								  		<option>naver.com</option>
								  		<option>daum.net</option>
								  		<option>gmail.com</option>
						</select>		
					</div>
					<input name="name" id="name" placeholder="이름을 입력해주세요" class="field">
					<input name="hpnumber" id="tel" type="tel" placeholder="전화번호를 입력해주세요" class="field">
					<input name="addressA" id="addressA" placeholder="주소를 입력해주세요" class="field">
					<input name="addressB" id="addressB" placeholder="상세주소를 입력해주세요" class="field">
					<input name="biznumber" placeholder="사업자 등록번호를 입력해주세요" id="bisNumber" class="field">
				</div>
				
				<div>
					<button id="AsignupReq">가입하기</button>
					<button id="goHome">취소</button>
				</div>
			
				</div>
			</form>
	</div>
</div>


</article>


<script>
function switchLogIn() {
	  document.getElementById("signUpForm").style.display = "none";
		document.getElementById("logInForm").style.display = "flex";
		document.getElementById("signUp").disabled = false;
		document.getElementById("logIn").disabled = true;
	}

	function switchSignUp() {
	  document.getElementById("signUpForm").style.display = "flex";
		document.getElementById("logInForm").style.display = "none";
		document.getElementById("signUp").disabled = true;
		document.getElementById("logIn").disabled = false;
	}
</script>
</body>
</html>