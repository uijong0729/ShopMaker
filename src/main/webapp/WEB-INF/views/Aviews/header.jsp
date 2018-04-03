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
    <a href="/bigstar" class="w3-bar-item w3-button"><b>Shop</b> Maker</a>
    <!--추가 페이지 업로드시 바뀔 부분-->
    <div class="w3-right w3-hide-small">
      <a href="#" class="w3-bar-item w3-button">Projects</a>
      <a href="#" class="w3-bar-item w3-button">About</a>
      <a href="#" class="w3-bar-item w3-button">Contact</a>
    </div>
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
  
  
</header>


		

</body>
</html>