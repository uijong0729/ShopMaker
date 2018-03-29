<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빅스타 QnA</title>
<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
</script>
<script>
	//스트링버퍼 설정
	var StringBuffer = function() {
	    this.buffer = new Array();
	};
	
	StringBuffer.prototype.append = function(str) {
	    this.buffer[this.buffer.length] = str;
	};
	
	StringBuffer.prototype.toString = function() {
	    return this.buffer.join("");
	};


$(document).ready(function(){
	
	loadList();
	
});

function loadList(){
	var sb = new StringBuffer();
	
	//글번호
	sb.append('<td>');
	sb.append('1');
	sb.append('</td>');
	
	//제목
	sb.append('<td class="button">');
	sb.append('55555');
	sb.append('</td>');
	
	//작성자
	sb.append('<td>');
	sb.append('3333');
	sb.append('</td>');
	
	//문의날짜
	sb.append('<td>');
	sb.append('2222');
	sb.append('</td>');
	
	$('#AQnAcontent').html(sb.toString());
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
		<%@ include file="../header.jsp" %>
	</header>

		<article>
			<table class="borderIb">
				<tr>
					<th>글 번호</th>
					<th style="width: 50%;">제목</th>
					<th>작성자</th>
					<th style="width: 30%;">문의날짜</th>
					<!-- 내용, 감추기/보이기, 답글, 답변날짜-->
				</tr>
				
				<!-- 반복출력 -->
				<tr id="AQnAcontent" style="text-align: center;">
										

				</tr>
					
			
			</table>
			
			<table class="borderIb">
				<tr>
					<th>제목</th>
					<td><input readonly="readonly"></td>
				</tr>
				<tr>
					<th>작성일자</th>
					<td><input readonly="readonly"></td>
				</tr>
			
			</table>
			
		</article>
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>


</body>

</html>