<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/bigstar/resources/css/headerfooter.css?ver=5">

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

<header style="margin-bottom: 100px;">

<div class="w3-bar w3-white w3-wide w3-padding w3-card w3-top">
	<a href="/bigstar" class="w3-bar-item"><img alt="logo" src="/bigstar/resources/img/logo.jpg"></a>
		<!--추가 페이지 업로드시 바뀔 부분-->
	<div class="w3-right w3-hide-small">
		<a href="#" class="w3-bar-item w3-button">BigStar</a>
		<a href="AqnaPage" class="w3-bar-item w3-button">문의하기</a>
		<a href="AnoticeList" class="w3-bar-item w3-button">공지사항</a>
		<a href="ApurchasePage" class="w3-bar-item w3-button">상품결제</a>
		<c:if test="${Amember == null }">
			<a href="loginPage" class="w3-bar-item w3-button">로그인하기</a>
		</c:if>
		<c:if test="${Amember != null }">
			<a class="w3-bar-item w3-button" href="Amypage">마이페이지</a>
			<a class="w3-bar-item w3-button" href="Logout">로그아웃</a>
		</c:if>
	</div>




<br>
</div>

  
</header>


		

</body>
</html>