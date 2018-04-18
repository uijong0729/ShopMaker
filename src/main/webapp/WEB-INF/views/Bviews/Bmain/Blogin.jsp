<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
	<script>
$(document).ready(function() {
	$('.ui-dialog').remove();
	$('.reg').on('click', reg);	
	$('.goLogin').on('click', login);
});

//회원가입 이동
function reg(){
	location.href = "Bregist";
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
	

		
	
	
	</script>
	
	</head>
	<body>
	
		<div style="text-align: center;">
			<div style="display: inline-block;">
			<h2 id="login_title" tabindex="0">로그인 화면 편집</h2>
				<form id="BloginForm" action="BcustomerLogin" method="post">
						<table>
							<tr>
								<td id="login_id" tabindex="0">아이디</td>
								<td><input name="customerid"></td>
							</tr>
							<tr>
								<td id="login_pw" tabindex="0">비밀번호</td>
								<td><input name="customerpw" type="password"></td>
							</tr>
						</table>
						<br>
						
						<!-- 멤버코드 임시로 37 -->
						<input type="hidden" name="membercode" value="37">
				</form>
				<div style="display: inline-block; padding: 4px; margin: 4px; cursor: pointer;" id="text_login" class="goLogin" tabindex="0">로그인</div>
				<div style="display: inline-block; padding: 4px; margin: 4px; cursor: pointer;" id="text_register" class="reg" tabindex="0">회원가입</div>
				<div style="display: inline-block; padding: 4px; margin: 4px; cursor: pointer;" id="text_search" tabindex="0">ID/PW 찾기</div>
			</div>		
		</div>	
	
			
	</body>
</html>