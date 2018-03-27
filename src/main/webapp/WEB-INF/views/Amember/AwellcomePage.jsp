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

$(document).ready(function(){
	//홈 버튼
	$('#goHome').on('click', function(){
		location.href="/bigstar/";
	});

});

</script>

<!-- 작업상 편의를 위해 잠깐 넣은 CSS 삭제하셔도 OK -->
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
		<%@ include file="header.jsp" %>
	</header>
	
		<article class="borderI" style="margin: 8px;">
			
			<h1>가입환영 안내</h1>
			
			<div id="goHome" class="borderIb button"> 홈으로 </div>
			
		</article>
		
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>


</body>
</html>