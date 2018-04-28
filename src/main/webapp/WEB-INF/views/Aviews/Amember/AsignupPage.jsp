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
var idOk = false;

$(document).ready(function(){
	//셀렉트박스에서 이메일 선택시 해당 이메일이 문자열로 input에 삽입됩니다.
	$('#mailBox').on('change', selectEmail);
	
	//비밀번호 재입력이 유효한지 체크합니다.
	$('#inputPasswordConfirm').on('input', checkPw);
	
	//홈으로 돌아갑니다.
	$('#goHome').on('click', function(){
		location.href="/bigstar/";
	});
	
	//아이디 중복체크
	$('#inputId').on('input', checkId);
	
});

function checkId(){
	var getId = $('#inputId').val();
	
	
	if(getId.length < 1)
	{
		$('#AIdCheckMsg').html('1글자 이상 입력해주세요');
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
					idOk = false;
				}
				else{
					$('#AIdCheckMsg').html(getId + '는 사용가능합니다');
					idOk = true;
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
	
	/* //아이디 체크
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
								if(bisNumber.length >= 1)
								{
									if(idOk == true){ */
									document.getElementById('AsignupForm').submit();
									/* }
								}
								else
								{
									alert('사업자 등록번호를 입력하세요');	
									return;
								}
							}//주소체크
							else
							{
								alert('주소를 입력하세요');	
								return;
							}
						}//이름체크
						else{
							alert('이름을 입력하세요');
							return;
						}
					}
					else{
						alert('이메일 형식을 확인하세요');
						return;
					}
				}//이메일체크
				else{
					alert('이메일 입력하세요');
					return;
				}
			}//비밀번호확인체크
			else{
				alert('위와 동일한 비밀번호');	
				return;
			}
		}//비밀번호 체크
		else{
			alert('비밀번호 입력하세요');
			return;
		}
	}//아이디체크
	else{
		alert('아이디 입력하세요');
		return;
	} */
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

	<header style="margin-bottom: 150px;">
		<%@ include file="../../Aheader.jsp" %>
	</header>
	
		<article class="borderI" style="margin: 8px;">
			<form id="AsignupForm" action="AsignupReq" method="post"> 
				<table border="1" style="border-collapse: collapse;">
					<tr>
					  <th>아이디</th>
					  <td><input type="text" id="inputId" name="id" placeholder="아이디를 입력하세요" required="required" autofocus="autofocus" /></td>
					  <td id="AIdCheckMsg" style="color: red;"></td>
					</tr>
					<tr>
					  <th>비밀번호</th>
					  <td><input type="password" id="inputPassword" name="password" placeholder="비밀번호를 입력하세요" required="required"/></td>    
					</tr>
					<tr>
					  <th>비밀번호 확인</th>
					  <td><input type="password" id="inputPasswordConfirm" placeholder="비밀번호를 다시 입력하세요" required="required"/></td>
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
					<tr>
						<th>이름</th>
						<td><input name="name" id="name" placeholder="이름을 입력해주세요"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input name="hpnumber" id="tel" type="tel" placeholder="전화번호를 입력해주세요"></td>
					</tr>
					<tr>
						<th rowspan="2">주소</th>
						<td><input name="addressA" id="addressA" style="width: 90%;" placeholder="주소를 입력해주세요"></td>
					</tr>
					<tr>
						<td><input name="addressB" id="addressB" style="width: 50%;" placeholder="상세주소를 입력해주세요"></td>
					</tr>
					<tr>
						<th>사업자 등록번호</th>
						<td><input name="biznumber" placeholder="사업자 등록번호를 입력해주세요" id="bisNumber" style="width: 80%;"></td>
					</tr>					
					
					
				</table>
				
				<!-- div로 버튼모양 내서 만들었습니다.  -->
				<div style="margin: 10px; margin-left: 10%; ">
					<div id="AsignupReq" onclick="javascript:checkForm()" class="borderIb button">가입하기</div>
					<div id="goHome" class="borderIb button">취소</div>
				</div>
			</form>
		</article>
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>


</body>
</html>