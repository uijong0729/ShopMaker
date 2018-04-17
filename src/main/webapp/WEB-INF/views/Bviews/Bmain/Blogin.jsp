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
		});
		$(document).mousedown(function(ev) {
			if (ev.which == 3) {
				if ($(this.activeElement).attr("id").startsWith("button") || $(this.activeElement).attr("id").startsWith("text") || $(this.activeElement).attr("id").startsWith("image")) {
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
				<table>
					<tr>
						<td id="login_id" tabindex="0">아이디</td>
						<td><input></td>
					</tr>
					<tr>
						<td id="login_pw" tabindex="0">비밀번호</td>
						<td><input type="password"></td>
					</tr>
				</table>
				<br>
				<a>로그인</a> &nbsp <a>회원가입</a> &nbsp <a>ID/PW 찾기</a>
			</div>		
		</div>	
	
			
	</body>
</html>