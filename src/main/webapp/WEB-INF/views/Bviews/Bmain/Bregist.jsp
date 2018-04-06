<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
		</script>
<script>

var counter = 0;

$(document).ready(function(){
	$('#addComponent').on('click', addRow);
	
});

function addRow(){
	$('#addRow').append('<tr class="rows" id="newrow'+ counter +'"><td width="100px;">텍스트</td><td width="200px;"><input></td><td><input id="delete'+counter+'" class="rowsButton" type="button" value="삭제"></td></tr>');
	counter = counter + 1;
	
	$('.rowsButton').on("click", function() {
		 $(this).parent().parent().remove();
	});
	
}


</script>

</head>
<body>
		<div style="display: inline-block; position: static;">
					<h1>회원가입 화면 편집</h1>
					<h4>필수 항목</h4>
					<table>
						<tr>
							<th width="100px;">아이디</th>
							<td width="200px;"><input></td>	
						</tr>
						
						<tr>
							<th width="100px;">비밀번호</th>
							<td width="200px;"><input type="password"></td>
						</tr>
						
						<tr>
							<th width="100px;">비밀번호 확인</th>
							<td width="200px;"><input type="password"></td>
						</tr>
					</table>
					
					<h4>선택항목</h4>
					<table id="addRow">
							
						
					</table>
					
						<button id="addComponent">새로운 항목을 추가 해보세요</button>
					
				</div>
</body>
</html>