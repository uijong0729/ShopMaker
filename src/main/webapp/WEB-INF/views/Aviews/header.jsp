<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>

</script>
<style type="text/css">
.button{

cursor: pointer;
text-align: center;
margin: 3px;

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
		<div class="borderI" style="height: 8em;">
			빅스타 로고
			<br>
			<c:if test="${Amember == null }">
				<a href="loginPage">로그인페이지</a>
			</c:if>
	
			<c:if test="${Amember != null }">
				<a>${Amember.id }로그인 중</a><br>
				<a href="loginPage">다시 로그인페이지로</a>
			</c:if>
			<br>
			<a href="/bigstar/">홈으로</a>
			
		</div>
		
</body>
</html>