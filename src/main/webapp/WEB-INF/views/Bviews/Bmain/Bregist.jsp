<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
		</script>
		<script>
			var counter = 3;
			$(document).ready(function(){
				$('#addComponent').on('click', addRow);
			});
			
			function addRow(){
				$('#addRow').append('<tr class="rows" id="newrow'+ counter +'"><td width="100px;" id="regist_custom' + counter + '" tabindex="0">텍스트</td><td width="200px;"><input></td><td><input id="delete'+counter+'" class="rowsButton forDeleteBtn" type="button" value="삭제"></td></tr>');
				counter = counter + 1;
				$('.rowsButton').on("click", function() {
					 $(this).parent().parent().remove();
				});
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
			
			function delTitle() {
				$('#regist_title').remove();
				$('#deletetitle').remove();
			}
			
		</script>
	</head>
	<body>
		<div style="display: inline-block; position: static;">
			<span id="regist_title" style="font-size: 36px" tabindex="0">회원가입 화면 편집</span><button id="deletetitle" class="forDeleteBtn" onclick="javascript:delTitle()">삭제</button>
			<table id="addRow">
				<tr class="rows" id="newrow0">
					<td width="100px;" id="regist_custom0" tabindex="0">아이디</td>
					<td width="200px;"><input type="text"></td>
					<td><input id="delete0" class="rowsButton forDeleteBtn" type="button" value="삭제"></td>
				</tr>
				<tr class="rows" id="newrow1">
					<td width="100px;" id="regist_custom1" tabindex="0">비밀번호</td>
					<td width="200px;"><input type="password"></td>
					<td><input id="delete1" class="rowsButton forDeleteBtn" type="button" value="삭제"></td>
				</tr>
				<tr class="rows" id="newrow2">
					<td width="100px;" id="regist_custom2" tabindex="0">이름</td>
					<td width="200px;"><input type="text"></td>
					<td><input id="delete2" class="rowsButton forDeleteBtn" type="button" value="삭제"></td>
				</tr>
				
			</table>
			<button id="addComponent" class="forDeleteBtn">새로운 항목을 추가 해보세요</button>
		</div>
	</body>
</html>