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
</script>

</head>
<body>

<div style="text-align: center;">
	<div style="display: inline-block;">
		<h1>마이페이지 화면 편집</h1>
		
		<ul style="list-style: none;">
			<li>이름</li>
			<li><input readonly="readonly"><input class="rowsButton" type="button" value="삭제"></li>
		</ul>
		<ul style="list-style: none;">	
			<li>이메일</li>
			<li><input readonly="readonly"><input class="rowsButton" type="button" value="삭제"></li>
		</ul>
		<ul style="list-style: none;">	
			<li>전화번호</li>
			<li><input readonly="readonly"><input class="rowsButton" type="button" value="삭제"></li>
		</ul>
		<ul style="list-style: none;">	
			<li>주소</li>
			<li><input readonly="readonly"><input class="rowsButton" type="button" value="삭제"></li>
		</ul>
			
		
		<div id="addrowMp">
			
			
			
		</div>
		<button id="addComponentMp">새로운 항목을 추가 해보세요</button>

	</div>
</div>

</body>
</html>