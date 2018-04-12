<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script>
		
		$(document).ready(function(){
			$('#addComponentMp').on('click', addRowMp);
			$('.rowsButton').on("click", removeRow);
		});
		
		function addRowMp(){
			$('#addrowMp').append('<ul style="list-style: none;"><li><span>텍스트</span></li><li><input> <input class="rowsButton" type="button" value="삭제"></li></ul>');
			$('.rowsButton').on("click", removeRow);
			
		}
		
		function removeRow(){
			 $(this).parent().parent().remove();
		}
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
				<h1 id="mypage_title" tabindex="0">마이페이지 화면 편집</h1>
				
				<ul style="list-style: none;">
					<li id="mypage_name" tabindex="0">이름</li>
					<li><input readonly="readonly"><input class="rowsButton forDeleteBtn" type="button" value="삭제"></li>
				</ul>
				<ul style="list-style: none;">	
					<li id="mypage_mail" tabindex="0">이메일</li>
					<li><input readonly="readonly"><input class="rowsButton forDeleteBtn" type="button" value="삭제"></li>
				</ul>
				<ul style="list-style: none;">	
					<li id="mypage_phone" tabindex="0">전화번호</li>
					<li><input readonly="readonly"><input class="rowsButton forDeleteBtn" type="button" value="삭제"></li>
				</ul>
				<ul style="list-style: none;">	
					<li id="mypage_address" tabindex="">주소</li>
					<li><input readonly="readonly"><input class="rowsButton forDeleteBtn" type="button" value="삭제"></li>
				</ul>
					
				
				<div id="addrowMp">
					
					
					
				</div>
				<button id="addComponentMp" class="forDeleteBtn">새로운 항목을 추가 해보세요</button>
		
			</div>
		</div>
	
	</body>
</html>