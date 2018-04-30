<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인페이지</title>

<style type="text/css">
.submit
{
  box-shadow: 0px 0px 1px 1px #ccc;  
  border-radius: 3px;
  display: inline-block;
  font-size: 12px;
  line-height: 42px;
  width: 100px;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float : right;
}

.submit:hover
{
  display: inline-block;
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}

</style>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	$('.ui-dialog').remove();
	$('.reg').on('click', reg);	
	$('.goLogin').on('click', login);
	
});

//회원가입 이동
function reg(){
	location.href = "goMyShop?code=${Amember.membercode}&page=Bregist";
}

//로그인
function login(){
	document.getElementById('BloginForm').submit();
}

$(document).mousedown(function(ev) {
		if (ev.which == 3) {
			if ($(this.activeElement).attr("id").startsWith("button") || $(this.activeElement).attr("id").startsWith("text") || $(this.activeElement).attr("id").startsWith("image") || $(this.activeElement).attr("id").startsWith("select")) {
				return false;
			} else {
				var inputString = prompt('변경할 텍스트를 입력해 주세요', 'none');
				if (inputString == 'none' || inputString == '' || inputString == null) {
					return false;
				} else {
					console.log($(this.activeElement).attr("id"));
					$(this.activeElement).text(inputString);
					return false;
				}
				return false;
			}
		}
});
	
//엔터키를 누르면 로그인	
function enterkey(){
	 if (window.event.keyCode == 13)
	{
		document.getElementById('BloginForm').submit();
	}
}
		
	
	
	</script>
	
	</head>
	<body>
	
		<div style="text-align: center; margin-top: 200px; margin-bottom: 200px;">
			<div style="display: inline-block;" class="content">
			<h1 class="login_header" id="text_title" tabindex="0">로그인</h1>
			<hr>
				<form id="BloginForm" action="BcustomerLogin" method="post" class="signin-cont cont">
						<table>
							<tr>
								<!-- <td id="login_id" tabindex="0">아이디</td> -->
								<td><input onkeyup="enterkey()" style="padding: 10px; margin: 4px;" placeholder="Your ID" name="customerid"></td>
							</tr>
							<tr>
								<!-- <td id="login_pw" tabindex="0">비밀번호</td> -->
								<td><input onkeyup="enterkey()" style="padding: 10px; margin: 4px;" placeholder="Your Password" name="customerpw" type="password"></td>
							</tr>
						</table>
						<br>
						
						<!-- 멤버코드 임시로 37 -->
						<input type="hidden" name="membercode" value='${param.code}'>
				</form>
				
				<div style="text-align: center;">
				
					<div style="display: inline-block; padding: 4px; margin: 4px; cursor: pointer;" id="text_register" class="reg submit" tabindex="0">회원가입</div>
					<div style="display: inline-block; padding: 4px; margin: 4px; cursor: pointer;" id="text_login" class="goLogin submit" tabindex="0">로그인</div>
				
				</div>
			</div>		
		</div>	
	
	<div style="text-align: center; color: red;">
		<c:if test="${isThereId == 1}">
			회원 정보가 없습니다. 로그인 정보를 확인 해주세요
		</c:if>
	</div>
			
	</body>
</html>